Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp83786ejo;
        Thu, 4 Jan 2024 05:33:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPwphOKu6lrSIw7gORBoTDdHoSHL4AwRoKEXtJzd65iaeuYOBDnWgcmxWP4IE1dHjoetWa
X-Received: by 2002:a05:6214:1cc2:b0:67f:adaf:4353 with SMTP id g2-20020a0562141cc200b0067fadaf4353mr557534qvd.92.1704375235625;
        Thu, 04 Jan 2024 05:33:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704375235; cv=none;
        d=google.com; s=arc-20160816;
        b=cKGTDqN8MFJdqophzL8SBdlWYJwIOMXTd45pu6VZIQJbgNkbfKuWlUSh9WOzvxlRQt
         Lk4wLkNpd2Gw4PzgSBzPM4Io7cAWGY7jv+HX9UfWlndMDGqeV3wwYFWmT4FbV94s551A
         uj/YhgXzzJN+vatQU3LTlQO895N+fvPFpIhvWiET3Z/iLsevEYQO3TfY7dKwx4R1+hjX
         y64XU2VmPcrxNjrU4G4+UdXtA8AnO4JdWPnBey8/Wi3w/iTEaToF5PbiiImHgBB7OZke
         PRrQeOG+6VgCiBl+fCrR+La9jwyvcBzpfSdxlh2xn/FuELjwdll36o9GR/Y3a+p8Dpl+
         /WVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QJS5zZy6zgomOyOtVRuyX1xTeTZW0jiOaotRDl0Z0zM=;
        fh=QOGl9Zs+nNvNanknLTIuYJHxyygDHEWPeAwoechlFJk=;
        b=pRvoHsjhOl3lg+lVSRYruJb2ZO3dY4MorZGitDfZ7+faGgzWCpgTowKacZnBzjQZF3
         FWogbD3TT75OSUK3AiElA3p0JhCZvZV2isXsCiN47elcRvupL2j3VrpEfDYn8Uy7SC6I
         iIRl/t0dKYVLJQwhSPKsWydXjBAgbZLVszzZcxocVLUpMC4Z9CkHxmt0I4JNbn0RRKjR
         5PDM8h6EndmLyML6jtnHVuQZsDZ3xi8RHrGuOl9qAWOUVRRuP4AmshiJH3CFvhpCpgZS
         6PMA59gzE5SMKefVjP5Y2WGj/UtH/1n8Wy/bw1f6aFhwBsEyHjWxDk3O5i8Hw09/mtxc
         trYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cf0J7aSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a0ca982000000b0067f2b2b2468si18102756qvb.116.2024.01.04.05.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:33:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cf0J7aSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLNqZ-0003aK-3N; Thu, 04 Jan 2024 08:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNqX-0003a3-2l
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:33:17 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNqV-0007xC-6r
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:33:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso381509f8f.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704375193; x=1704979993; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QJS5zZy6zgomOyOtVRuyX1xTeTZW0jiOaotRDl0Z0zM=;
 b=Cf0J7aSEbFNH5RwhvVi1diVauptto6GfZrAA4vfRQqF8pxtqj6HUaSAIqHXltAw43+
 dsg3w846yNuRiJdoftzzLAUeqstcNFmz/PWFrUeD08A2YnkDy+8HDCGoJXA8fEy6O0S6
 RE+o7ggdMriqaOcGOv873kqdVWOpB5nUI6Mt16ACymXj0iuNVsLRHeqDNIanuMuIYs7W
 Xb4boV4pOIb4AV9NQn8Q1c59VR/f4rH58ni4nNEkVM5rTHEaKsWcq9OManhOuVb0ESJz
 OUGsUk6wVwhZIKLf7M4Ax72Ko+zZ01fTIxsIfY/UecO4xSlVT0elzGo223L5MZGUR7qt
 7MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704375193; x=1704979993;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QJS5zZy6zgomOyOtVRuyX1xTeTZW0jiOaotRDl0Z0zM=;
 b=iUJC++6GWwqRJOIx+fLy0Zl5C42ihJtW48KAY9O047YWR2MF8DJhhfCH7nf89kvU8q
 u27TMdr27LMlAIsPimBMqviOlUs3zh2YfPr9CybrrSvPQ2SKg3HFRvA/XuITlhzHbJ+x
 J9Pc/wdfDLBYadX9Qpy44zSFexVx0+7jbpPYnNdXkBmY+soXhi7WYMF4eSD6IMT6lNQz
 uMU1ivtzMUcgAvUBA7rUM6XWGGtAGgUOWlvMKMhowz/4oyBE2USWhlYKcxWCmahuGluE
 dylrqu0r+1d3Fp6PpFqGrW+B+1FgcVrio9baSDYrO2O7WV5CmRmiHoJuB+1Lb6NfFs7w
 jGaw==
X-Gm-Message-State: AOJu0YxGzlFgaR3WglN5yJ0K41bYc2MNS/9vTl7jeZ+WAGsb6Pa+e2c0
 gQjoV+WFEu88+pxRWh16GoHz2XlKc/9zbQ==
X-Received: by 2002:adf:ce04:0:b0:333:4bd9:8e with SMTP id
 p4-20020adfce04000000b003334bd9008emr391520wrn.25.1704375193417; 
 Thu, 04 Jan 2024 05:33:13 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a5d4612000000b003367bb8898dsm33094022wrq.66.2024.01.04.05.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:33:13 -0800 (PST)
Message-ID: <cd41459a-b96d-4b51-bc2a-37724ccc4db1@linaro.org>
Date: Thu, 4 Jan 2024 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5sdCeVs32umZ

On 28/12/23 17:19, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/meson.build           |   5 +
>   tests/qtest/stm32l4x5_exti-test.c | 596 ++++++++++++++++++++++++++++++
>   2 files changed, 601 insertions(+)
>   create mode 100644 tests/qtest/stm32l4x5_exti-test.c

Once the SoC parentship fixed in based series, this patch
requires:

-- >8 --
diff --git a/tests/qtest/stm32l4x5_exti-test.c 
b/tests/qtest/stm32l4x5_exti-test.c
index 60c8297246..543199cd4d 100644
--- a/tests/qtest/stm32l4x5_exti-test.c
+++ b/tests/qtest/stm32l4x5_exti-test.c
@@ -287,4 +287,3 @@ static void test_edge_selector(void)
      /* Configure EXTI line 0 irq on rising edge */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);
      exti_writel(EXTI_IMR1, 0x00000001);
@@ -294,4 +293,3 @@ static void test_edge_selector(void)
      /* Test that an irq is raised on rising edge only */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);

@@ -301,4 +299,3 @@ static void test_edge_selector(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);

@@ -316,4 +313,3 @@ static void test_edge_selector(void)
      /* Configure EXTI line 0 irq on falling edge */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);
      exti_writel(EXTI_IMR1, 0x00000001);
@@ -323,4 +319,3 @@ static void test_edge_selector(void)
      /* Test that an irq is raised on falling edge only */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);

@@ -330,4 +325,3 @@ static void test_edge_selector(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);

@@ -350,4 +344,3 @@ static void test_edge_selector(void)
      /* Test that an irq is raised on rising and falling edge */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);

@@ -357,4 +350,3 @@ static void test_edge_selector(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);

@@ -377,4 +369,3 @@ static void test_edge_selector(void)
      /* Test that no irq is raised */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);

@@ -384,4 +375,3 @@ static void test_edge_selector(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);

@@ -500,4 +490,3 @@ static void test_masked_interrupt(void)
      /* Simulate rising edge from GPIO line 1 */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 1, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 1, 1);

@@ -550,4 +539,3 @@ static void test_interrupt(void)
      /* Simulate rising edge from GPIO line 1 */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
-                     NULL, 1, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 1, 1);
---

Note you could use a helper to ease readability:

static void exti_set_irq(int num, int lvl)
{
    qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, num, lvl);
}

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
