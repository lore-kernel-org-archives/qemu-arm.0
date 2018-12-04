Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8314977wrt;
        Tue, 4 Dec 2018 09:10:24 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VFccgHxjDKMUPmW2iQm3VN6e6g+npVcBC+8HZSKDjSQaKcS3ywEiExP3HwlJilT6mdK1gc
X-Received: by 2002:a0c:81c4:: with SMTP id 4mr21301482qve.156.1543943423940;
        Tue, 04 Dec 2018 09:10:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543943423; cv=none;
        d=google.com; s=arc-20160816;
        b=b6ZzrtMWQsSpVECF4w7K9LROtRN3TGhIr014JnvgyeJpTK+vnNjmuOpJ536YryRSn4
         W26ZJH9MJNgZcAlQEVA4TWuKlPeXWUOwF/Dq2CST1Nhzytj/N+IczklhFJAwf9jhB+yC
         gI/Y84Jxe24OD6BEQUXDVIxzNlTOnrdfVKqobCNKCHyQfbTs+8GkcDGTHxac4q4O8dX6
         34eH+4c5ou8KDsv2UKILArCp9t4uZ/n26eIpLEFUO8X8rRioO5cNCxmQkj4WYTmyR9Wp
         RftldOyRiXdZikcFqriWZrglRjLWNG56N6bSvvT9m2IM2V7M/SxS4H35K8MADmZ/4Rvl
         35ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=ccskID5NuxpBownrUoKA/D7blj9ctqvYjcr/yYQSr5o=;
        b=MlW/r7bEK7VX0sb5IednxUx3dpHSsIRhXDaCQPSQNez5wGJByS/8aJJC5I2X1TvLML
         +9bAUat9Mh8ZE5HaKELn2/dhJJsKlJ6Cg2/SChmBR/ec7mKjaPfDPA5O8SakJ5S0uKEE
         m+5B+kagrTeRpEQxs0EdyLM+bFy5FG31m9DF1MVD7r8Dy0pXXk0/MQd50Q1F4W2HcHm2
         /5XHDA4MmdCxNml+ERNWkthPrngTm4al66kQqf0c1ci1UtjISS85E2vUB12SbmNdjoQI
         c3lfQA/Eo2MN9f/lzJUd4v3AF4vdfPqNCjvTxUJsq5NPtIfYntRbzCEtNQmgPZ/L3vFw
         OHEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20si5965230qvc.134.2018.12.04.09.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 09:10:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUEDH-0002Ez-FX
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 12:10:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gUED4-00026K-I7
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 12:10:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gUEBf-0003L0-TE
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 12:08:48 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35909)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gUEBf-0003I5-HL
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 12:08:43 -0500
Received: by mail-wr1-f65.google.com with SMTP id u3so16758627wrs.3
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 09:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ccskID5NuxpBownrUoKA/D7blj9ctqvYjcr/yYQSr5o=;
	b=NIxp3B+e1KeW7lSnS4whvI8qRQ/n4gudP5U0HKRv4w4JMCg4C+duHOBHozsXuY61Bl
	U6BRor5P7dDi3A5Iia9tHKwABFSimIU6wU6EHXPBXRjeb99IQeQ/T8d+inYSp6n0dO6p
	Rb5BH150WDAvoJTYnCZUJO+3viq04t3qEJJ8BTIMqAnMkn+Y1NeOfZgzNESE1bR3HzGa
	9A8j3tRt5BSBrXTwdXwSxGsFGyfVCuM4SrEqqoe/cXYxQpiNKA/zYV1iCaNBvoRLGskl
	GZKvI/k8sTh4WSfwPVpAu4beZioFBN1rPWt8NBeeIPxv1A19PTaq2/zQemBXIcQb4PQB
	7m5A==
X-Gm-Message-State: AA+aEWZHKctHWN7g/TpRnrV1g7+KMt7rGGrywb8JKLBwlhpn+5UC+aJQ
	QMyczP5KJVnXV6s1YkTjLvDnvA==
X-Received: by 2002:adf:92a4:: with SMTP id 33mr2514989wrn.11.1543943317897;
	Tue, 04 Dec 2018 09:08:37 -0800 (PST)
Received: from [10.0.0.124] ([185.102.219.36])
	by smtp.gmail.com with ESMTPSA id
	q12sm15965784wrx.31.2018.12.04.09.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 09:08:36 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4485390f-5c05-d9f8-b43b-c8811519e638@redhat.com>
Date: Tue, 4 Dec 2018 18:08:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/5] tests/test-arm-mptimer:
 Don't leak string memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uXov2zJBh+7c

On 4/12/18 14:29, Peter Maydell wrote:
> The test-arm-mptimer setup creates a lot of test names using
> g_strdup_printf() and never frees them. This is entirely
> harmless since it's one-shot test code, but it clutters
> up the output from clang's LeakSanitizer. Refactor to
> use a helper function so we can free the memory.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  tests/test-arm-mptimer.c | 153 ++++++++++++++++++---------------------
>  1 file changed, 69 insertions(+), 84 deletions(-)
> 
> diff --git a/tests/test-arm-mptimer.c b/tests/test-arm-mptimer.c
> index cb8f2df9141..156a39f50dd 100644
> --- a/tests/test-arm-mptimer.c
> +++ b/tests/test-arm-mptimer.c
> @@ -991,10 +991,25 @@ static void test_timer_zero_load_nonscaled_periodic_to_prescaled_oneshot(void)
>      g_assert_cmpuint(timer_get_and_clr_int_sts(), ==, 0);
>  }
>  
> +/*
> + * Add a qtest test that comes in two versions: one with
> + * a timer scaler setting, and one with the timer nonscaled.
> + */
> +static void add_scaler_test(const char *str, bool scale,
> +                            void (*fn)(const void *))
> +{
> +    char *name;
> +    int *scaler = scale ? &scaled : &nonscaled;
> +
> +    name = g_strdup_printf("%s=%d", str, *scaler);
> +    qtest_add_data_func(name, scaler, fn);
> +    g_free(name);
> +}
> +
>  int main(int argc, char **argv)
>  {
> -    int *scaler = &nonscaled;
>      int ret;
> +    int scale;
>  
>      g_test_init(&argc, &argv, NULL);
>  
> @@ -1012,89 +1027,59 @@ int main(int argc, char **argv)
>      qtest_add_func("mptimer/prescaler", test_timer_prescaler);
>      qtest_add_func("mptimer/prescaler_on_the_fly", test_timer_prescaler_on_the_fly);
>  
> -tests_with_prescaler_arg:
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/oneshot scaler=%d", *scaler),
> -                        scaler, test_timer_oneshot);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/pause scaler=%d", *scaler),
> -                        scaler, test_timer_pause);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/reload scaler=%d", *scaler),
> -                        scaler, test_timer_reload);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/periodic scaler=%d", *scaler),
> -                        scaler, test_timer_periodic);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/oneshot_to_periodic scaler=%d", *scaler),
> -                        scaler, test_timer_oneshot_to_periodic);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/periodic_to_oneshot scaler=%d", *scaler),
> -                        scaler, test_timer_periodic_to_oneshot);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/set_oneshot_counter_to_0 scaler=%d", *scaler),
> -                        scaler, test_timer_set_oneshot_counter_to_0);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/set_periodic_counter_to_0 scaler=%d", *scaler),
> -                        scaler, test_timer_set_periodic_counter_to_0);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/noload_oneshot scaler=%d", *scaler),
> -                        scaler, test_timer_noload_oneshot);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/noload_periodic scaler=%d", *scaler),
> -                        scaler, test_timer_noload_periodic);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/zero_load_oneshot scaler=%d", *scaler),
> -                        scaler, test_timer_zero_load_oneshot);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/zero_load_periodic scaler=%d", *scaler),
> -                        scaler, test_timer_zero_load_periodic);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/zero_load_oneshot_to_nonzero scaler=%d", *scaler),
> -                        scaler, test_timer_zero_load_oneshot_to_nonzero);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/zero_load_periodic_to_nonzero scaler=%d", *scaler),
> -                        scaler, test_timer_zero_load_periodic_to_nonzero);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/nonzero_load_oneshot_to_zero scaler=%d", *scaler),
> -                        scaler, test_timer_nonzero_load_oneshot_to_zero);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/nonzero_load_periodic_to_zero scaler=%d", *scaler),
> -                        scaler, test_timer_nonzero_load_periodic_to_zero);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/set_periodic_counter_on_the_fly scaler=%d", *scaler),
> -                        scaler, test_timer_set_periodic_counter_on_the_fly);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/enable_and_set_counter scaler=%d", *scaler),
> -                        scaler, test_timer_enable_and_set_counter);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/set_counter_and_enable scaler=%d", *scaler),
> -                        scaler, test_timer_set_counter_and_enable);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/oneshot_with_counter_0_on_start scaler=%d", *scaler),
> -                        scaler, test_timer_oneshot_with_counter_0_on_start);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/periodic_with_counter_0_on_start scaler=%d", *scaler),
> -                        scaler, test_timer_periodic_with_counter_0_on_start);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/periodic_counter scaler=%d", *scaler),
> -                        scaler, test_periodic_counter);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/set_counter_periodic_with_zero_load scaler=%d", *scaler),
> -                        scaler, test_timer_set_counter_periodic_with_zero_load);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/set_oneshot_load_to_0 scaler=%d", *scaler),
> -                        scaler, test_timer_set_oneshot_load_to_0);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/set_periodic_load_to_0 scaler=%d", *scaler),
> -                        scaler, test_timer_set_periodic_load_to_0);
> -    qtest_add_data_func(
> -        g_strdup_printf("mptimer/zero_load_mode_switch scaler=%d", *scaler),
> -                        scaler, test_timer_zero_load_mode_switch);
> -
> -    if (scaler == &nonscaled) {
> -        scaler = &scaled;
> -        goto tests_with_prescaler_arg;
> +    for (scale = 0; scale < 2; scale++) {
> +        add_scaler_test("mptimer/oneshot scaler",
> +                        scale, test_timer_oneshot);
> +        add_scaler_test("mptimer/pause scaler",
> +                        scale, test_timer_pause);
> +        add_scaler_test("mptimer/reload scaler",
> +                        scale, test_timer_reload);
> +        add_scaler_test("mptimer/periodic scaler",
> +                        scale, test_timer_periodic);
> +        add_scaler_test("mptimer/oneshot_to_periodic scaler",
> +                        scale, test_timer_oneshot_to_periodic);
> +        add_scaler_test("mptimer/periodic_to_oneshot scaler",
> +                        scale, test_timer_periodic_to_oneshot);
> +        add_scaler_test("mptimer/set_oneshot_counter_to_0 scaler",
> +                        scale, test_timer_set_oneshot_counter_to_0);
> +        add_scaler_test("mptimer/set_periodic_counter_to_0 scaler",
> +                        scale, test_timer_set_periodic_counter_to_0);
> +        add_scaler_test("mptimer/noload_oneshot scaler",
> +                        scale, test_timer_noload_oneshot);
> +        add_scaler_test("mptimer/noload_periodic scaler",
> +                        scale, test_timer_noload_periodic);
> +        add_scaler_test("mptimer/zero_load_oneshot scaler",
> +                        scale, test_timer_zero_load_oneshot);
> +        add_scaler_test("mptimer/zero_load_periodic scaler",
> +                        scale, test_timer_zero_load_periodic);
> +        add_scaler_test("mptimer/zero_load_oneshot_to_nonzero scaler",
> +                        scale, test_timer_zero_load_oneshot_to_nonzero);
> +        add_scaler_test("mptimer/zero_load_periodic_to_nonzero scaler",
> +                        scale, test_timer_zero_load_periodic_to_nonzero);
> +        add_scaler_test("mptimer/nonzero_load_oneshot_to_zero scaler",
> +                        scale, test_timer_nonzero_load_oneshot_to_zero);
> +        add_scaler_test("mptimer/nonzero_load_periodic_to_zero scaler",
> +                        scale, test_timer_nonzero_load_periodic_to_zero);
> +        add_scaler_test("mptimer/set_periodic_counter_on_the_fly scaler",
> +                        scale, test_timer_set_periodic_counter_on_the_fly);
> +        add_scaler_test("mptimer/enable_and_set_counter scaler",
> +                        scale, test_timer_enable_and_set_counter);
> +        add_scaler_test("mptimer/set_counter_and_enable scaler",
> +                        scale, test_timer_set_counter_and_enable);
> +        add_scaler_test("mptimer/oneshot_with_counter_0_on_start scaler",
> +                        scale, test_timer_oneshot_with_counter_0_on_start);
> +        add_scaler_test("mptimer/periodic_with_counter_0_on_start scaler",
> +                        scale, test_timer_periodic_with_counter_0_on_start);
> +        add_scaler_test("mptimer/periodic_counter scaler",
> +                        scale, test_periodic_counter);
> +        add_scaler_test("mptimer/set_counter_periodic_with_zero_load scaler",
> +                        scale, test_timer_set_counter_periodic_with_zero_load);
> +        add_scaler_test("mptimer/set_oneshot_load_to_0 scaler",
> +                        scale, test_timer_set_oneshot_load_to_0);
> +        add_scaler_test("mptimer/set_periodic_load_to_0 scaler",
> +                        scale, test_timer_set_periodic_load_to_0);
> +        add_scaler_test("mptimer/zero_load_mode_switch scaler",
> +                        scale, test_timer_zero_load_mode_switch);
>      }
>  
>      qtest_start("-machine vexpress-a9");
> 
