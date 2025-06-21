public class Main {

    public static double predictFutureValue(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue;
        }
        return predictFutureValue(currentValue, growthRate, years - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {
        double initialValue = 10000;
        double annualGrowthRate = 0.07;
        int years = 6;

        double futureValue = predictFutureValue(initialValue, annualGrowthRate, years);
        System.out.printf("Predicted future value after %d years: ₹%.2f", years, futureValue);
    }
}
