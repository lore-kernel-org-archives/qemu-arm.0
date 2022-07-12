Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1370995lfp;
        Tue, 12 Jul 2022 03:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1iz9OZq2GZF+vFKNhVTIJf0R53uAsV3Z+f3/Ji+h5zUj99eXR531GaHHkiL2iZpr0Xwad
X-Received: by 2002:a05:620a:190c:b0:6b5:9f6b:77d9 with SMTP id bj12-20020a05620a190c00b006b59f6b77d9mr2057134qkb.142.1657621387519;
        Tue, 12 Jul 2022 03:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657621387; cv=none;
        d=google.com; s=arc-20160816;
        b=OUxenkoCDPFVUwtKVYjizehfViOPBTitt4otybc9bsZiGSy0EOFaeNwT62Fp36XDVA
         fqn4Jq+6f7Xf4hZZrRuFA+2PN7Ns2rK44N5bxkD9Th9U6K4Fhj8342RFLyR3SWt2r3SO
         lFnXnDeZmfSchGLNV0MKp5Ym+3ZasyLYBYpsIwkTbCQzasj1BD5QL/DdFv20FIToMZtC
         w0ZWsEP+UInLF+z+h8RG+bR8zC2aP3He9jvPKt/UZP+25ceZEUSwdMTI6dGvDqN9/OFD
         Yw81Utv+6GR+aaNz+sVus1js6eRcyyFqm/IUjRFeCXzP9pzOkj2irtOLtKPN/JBmqOkI
         z5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=r4dGaxXR2IeuWI7PBnywulm/k7iHRyzShbdujsDwS80=;
        b=S5QN/ot8Po2qPxlU6Wxo5R7J11p5vLmKq54Mkpk3z11nSVPoT4B9aTZYhKvIGBHAn7
         6vMRLZdpZvIwnTSrNvcrYs7aEOHpaegLKvDmpKFcDPCcMSrTXfE3YiRNq/EpB4IfGOoQ
         Hkdou/fXw0rghsJpzZnCuSobOeE2ZFhlMkLn3atS0Ewlngfoom45lArBGNC15MYkd4yJ
         rr6wA3x4hf9Xee93eVfr0D7G/gBkNfZrkWCeI8hIStyNcqIMwzGsyMMgHzdFIf4pSGdR
         Rw4RZQ8Nfmd4mg9N0Pd2L+gVTf0PeRQ2RehxbKxe7mwbC5g+XAp6zOXzLewliQ6gtNS7
         v/VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020a05620a411300b006a6e38e7574si6402277qko.500.2022.07.12.03.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 03:23:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBD2p-0006Tk-0T
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 06:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBCvF-0007KE-KB
 for qemu-arm@nongnu.org; Tue, 12 Jul 2022 06:15:22 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:45241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBCv9-0000X3-5j
 for qemu-arm@nongnu.org; Tue, 12 Jul 2022 06:15:13 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 01F1A2762B;
 Tue, 12 Jul 2022 10:15:06 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 12 Jul
 2022 12:15:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001824944f1-91f4-4f8c-8387-effa3d0919a5,
 309EE2169E248EACDB990A87B215E6D8094BB52C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <d9bbc4d0-b70a-92c6-3966-ba0dcaa87ea1@kaod.org>
Date: Tue, 12 Jul 2022 12:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] qtest/aspeed_gpio: Add input pin modification test
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220712023219.41065-1-peter@pjd.dev>
 <20220712023219.41065-2-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220712023219.41065-2-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c9994d80-514e-4c11-bef6-6f30c47a2dcc
X-Ovh-Tracer-Id: 5308055111312968495
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FTE8jiwOLri6

On 7/12/22 04:32, Peter Delevoryas wrote:
> Verify the current behavior, which is that input pins can be modified by
> guest OS register writes.
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   tests/qtest/aspeed_gpio-test.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> index bac63e8742..8f52454099 100644
> --- a/tests/qtest/aspeed_gpio-test.c
> +++ b/tests/qtest/aspeed_gpio-test.c
> @@ -28,6 +28,11 @@
>   #include "qapi/qmp/qdict.h"
>   #include "libqtest-single.h"
>   
> +#define AST2600_GPIO_BASE 0x1E780000
> +
> +#define GPIO_ABCD_DATA_VALUE 0x000
> +#define GPIO_ABCD_DIRECTION  0x004
> +
>   static void test_set_colocated_pins(const void *data)
>   {
>       QTestState *s = (QTestState *)data;
> @@ -46,6 +51,27 @@ static void test_set_colocated_pins(const void *data)
>       g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
>   }
>   
> +static void test_set_input_pins(const void *data)
> +{
> +    QTestState *s = (QTestState *)data;
> +    char name[16];
> +    uint32_t value;
> +
> +    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DIRECTION, 0x00000000);
> +    for (char c = 'A'; c <= 'D'; c++) {
> +        for (int i = 0; i < 8; i++) {
> +            sprintf(name, "gpio%c%d", c, i);
> +            qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
> +        }
> +    }
> +    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
> +    g_assert_cmphex(value, ==, 0xffffffff);
> +
> +    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
> +    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
> +    g_assert_cmphex(value, ==, 0x00000000);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       QTestState *s;
> @@ -56,6 +82,7 @@ int main(int argc, char **argv)
>       s = qtest_init("-machine ast2600-evb");
>       qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
>                           test_set_colocated_pins);
> +    qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
>       r = g_test_run();
>       qtest_quit(s);
>   

