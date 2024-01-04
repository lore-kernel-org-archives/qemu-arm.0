Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp92085ejo;
        Thu, 4 Jan 2024 05:46:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6MfLv2iY4xZZHi2WJ2Qi48AJo1w2Xs3RVzLE7fg7hz35u36qQAGYp0dz9QsKJYtUvaC+z
X-Received: by 2002:ac8:7fd5:0:b0:427:fd4d:e383 with SMTP id b21-20020ac87fd5000000b00427fd4de383mr752123qtk.52.1704376002796;
        Thu, 04 Jan 2024 05:46:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704376002; cv=none;
        d=google.com; s=arc-20160816;
        b=SQAM0f3kNqVwUi4JgjohOUx4X/qEtg7dI7njbp1AXuOW9IvQNPIxMLcV4oXQ+8+2+5
         nIDZxc8qb0oVsnuPs+B7bFfHzQomAR357r7SN4UHOsNO1dQfdh7sL2cYGOfU/DrwsQym
         r0O31ifxxdMkR7cYMXn0xB9nsBmXjA7V2jJuqDGtqI3FWTjHgxRmQbirrEtl6lr+fj5B
         wVowGkHaj8b20Ohw/R8D+BuI+MIDFZhh/Ql4jPNVqm5ta77s5wT2N21sjoTa1fYu+D2s
         odgpMDxoZmWPYUoMEJ0lyvGeVzvzo3R0X34tP/kbHTeUAXEb7BrRIudJErm5KA6k1DR0
         SaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:date:dkim-signature;
        bh=t0Yxl9VW5WvFjF/FalnTSQcUgwlftiRhZvicw8QVMmY=;
        fh=+gjMF8BfOa8pM9LjJ/LEVpulnhpPRiKq5R0ON7+JShQ=;
        b=SrR50/MfAcLj4uo+DDo6pUr0LD8KqW5tIymaGVFm64af7YUHYB9YjXbMvA4vZprSKt
         /d5bRodSlpIYULEGErKOl3wZH1+Q3uOJBoKAWALvNpdHdn3+ITDobOuiTmDJ420LZif7
         ivbBVVPs4VLTonBSHM7lvqvbvP+NvO0RJe6LXKR5KL/SCdblxGyvo1kdr8Mg+jKajfz+
         xEbM955KRwjOZVEWR9pC0mX6DrjF9HAEpMbPMjAckyMgH7sQBBKC344E5wg3tMw8XiYz
         dwz7eojNlobMAM9J+HNHaEPTHYPqExB0PgiwCUHyMLm/CNc7IjqA1/DyqcCTfAYX7GNG
         ua+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@proton.me header.s=protonmail header.b=Xmsbs0p8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=proton.me
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22-20020ac87c56000000b00428227121fasi8240019qtv.233.2024.01.04.05.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:46:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@proton.me header.s=protonmail header.b=Xmsbs0p8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=proton.me
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLO3D-0001rD-Ml; Thu, 04 Jan 2024 08:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <inesvarhol@proton.me>)
 id 1rLO2e-0001W1-KZ
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:45:48 -0500
Received: from mail-4324.protonmail.ch ([185.70.43.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <inesvarhol@proton.me>)
 id 1rLO2b-00022R-Gr
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1704375942; x=1704635142;
 bh=t0Yxl9VW5WvFjF/FalnTSQcUgwlftiRhZvicw8QVMmY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Xmsbs0p8SYvx52M5ajHJQRSQOKWOEqPHe5W8QOa6z5NbDtDqUW4o+OcOwnsd5hc7M
 cldVNyCaqmmDShfuhrXbpefEHWfVHQd/RPmnrpwQBQ70BC+gdeKt8i6Sit1mrB9Jmo
 UcdtdpDjp8P0e1vFvOz1wWRXNqFhqqYhSl4QhcBFTACnoBBN0LZkwreYaL8ylvCK65
 zu7p+c2hpVHN3ImPf0aLkNDio/LuQGHPge18jX8gAX1luxWvZM3DSCwO5K4A1tGJOX
 sWHbXXQr+SU5U/ZRebDVYiGUU2dKQCF4GGTOI0rm0AkPHCWQossqW3pMrlhkqocwEY
 o3G9Zw2TSf2dw==
Date: Thu, 04 Jan 2024 13:45:21 +0000
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
From: inesvarhol <inesvarhol@proton.me>
Cc: =?utf-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 2/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
Message-ID: <vueSA6LNk2OEd9t7plxmNvtm9LVj_TIG9PEY1n8Gz9MMPMHL8jXTaStS6_-AddPqbYwLbbm-ZZgAbg0ezFyTS0_VQ5gq1-FvMG5m5tomJe8=@proton.me>
In-Reply-To: <cd41459a-b96d-4b51-bc2a-37724ccc4db1@linaro.org>
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
 <cd41459a-b96d-4b51-bc2a-37724ccc4db1@linaro.org>
Feedback-ID: 78004345:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.24; envelope-from=inesvarhol@proton.me;
 helo=mail-4324.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Jan 2024 08:46:23 -0500
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
X-TUID: MvQtvGE2X4Rh

Le jeudi 4 janvier 2024 =C3=A0 14:33, Philippe Mathieu-Daud=C3=A9 <philmd@l=
inaro.org> a =C3=A9crit :


> On 28/12/23 17:19, In=C3=A8s Varhol wrote:
>
> > Signed-off-by: Arnaud Minier arnaud.minier@telecom-paris.fr
> > Signed-off-by: In=C3=A8s Varhol ines.varhol@telecom-paris.fr
> > ---
> > tests/qtest/meson.build | 5 +
> > tests/qtest/stm32l4x5_exti-test.c | 596 ++++++++++++++++++++++++++++++
> > 2 files changed, 601 insertions(+)
> > create mode 100644 tests/qtest/stm32l4x5_exti-test.c
>
>
> Once the SoC parentship fixed in based series, this patch
> requires:
>
> -- >8 --
>
> diff --git a/tests/qtest/stm32l4x5_exti-test.c
> b/tests/qtest/stm32l4x5_exti-test.c
> index 60c8297246..543199cd4d 100644
> --- a/tests/qtest/stm32l4x5_exti-test.c
> +++ b/tests/qtest/stm32l4x5_exti-test.c
> @@ -287,4 +287,3 @@ static void test_edge_selector(void)
> /* Configure EXTI line 0 irq on rising edge /
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 1);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);
> exti_writel(EXTI_IMR1, 0x00000001);
> @@ -294,4 +293,3 @@ static void test_edge_selector(void)
> / Test that an irq is raised on rising edge only /
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 0);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);
>
> @@ -301,4 +299,3 @@ static void test_edge_selector(void)
>
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 1);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);
>
> @@ -316,4 +313,3 @@ static void test_edge_selector(void)
> / Configure EXTI line 0 irq on falling edge /
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 0);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);
> exti_writel(EXTI_IMR1, 0x00000001);
> @@ -323,4 +319,3 @@ static void test_edge_selector(void)
> / Test that an irq is raised on falling edge only /
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 1);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);
>
> @@ -330,4 +325,3 @@ static void test_edge_selector(void)
>
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 0);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);
>
> @@ -350,4 +344,3 @@ static void test_edge_selector(void)
> / Test that an irq is raised on rising and falling edge /
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 1);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);
>
> @@ -357,4 +350,3 @@ static void test_edge_selector(void)
>
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 0);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);
>
> @@ -377,4 +369,3 @@ static void test_edge_selector(void)
> / Test that no irq is raised /
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 1);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 1);
>
> @@ -384,4 +375,3 @@ static void test_edge_selector(void)
>
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 0, 0);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 0, 0);
>
> @@ -500,4 +490,3 @@ static void test_masked_interrupt(void)
> / Simulate rising edge from GPIO line 1 /
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 1, 1);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 1, 1);
>
> @@ -550,4 +539,3 @@ static void test_interrupt(void)
> / Simulate rising edge from GPIO line 1 */
> - qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> - NULL, 1, 1);
> + qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, 1, 1);
> ---
>
> Note you could use a helper to ease readability:
>
> static void exti_set_irq(int num, int lvl)
> {
> qtest_set_irq_in(global_qtest, "/machine/soc/exti", NULL, num, lvl);
> }
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 philmd@linaro.org

Ok thank you a lot !
And yes, we'll swap the 2nd and 3rd commit as you said.
