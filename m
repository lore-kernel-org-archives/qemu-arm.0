Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp177261lfj;
        Wed, 11 May 2022 22:26:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoN91dJubcnEx2dGNZ0sQ31o65zXphpbyXiCItQ3XNj82spiQ37VOpYrw9xem2t3Z3nA/D
X-Received: by 2002:a37:9cd8:0:b0:69f:b618:c7ab with SMTP id f207-20020a379cd8000000b0069fb618c7abmr22384277qke.722.1652333187960;
        Wed, 11 May 2022 22:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652333187; cv=none;
        d=google.com; s=arc-20160816;
        b=M2ImeLYfGX10YCpCq7Q5RHoNG0EwnbgJ9xD4LjK/XtArlG2NiSZixf22+h21N/pL+V
         rDZURE8hU8LesM0aBPPabBozZVmUGlOEpESU4qDeL75OG/ZnBxGZaScmTQ8rafhnaTra
         4khzVYjzxMLBLFI1BPoirXCddsnV1QSVGpBm/U5+DjQTuWfKwqXOtpvR8exlemXLN4tx
         Q0ZnBp0gIg9AzRAAa8uQOuoBuUO/ltMA0jMPnmt7S3f1B0NAPjG/tjLa+2j6n4jso0DX
         JfHLnIQIO2FBpx6rMF5Crdf5naMNPjICmA0SHWfb1Rd4QbNTzYdQOp4qi+4Xr39g0jal
         lRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=wfznVWfTIe+Abqghf4I9nYY2e/L68pXtTPi52VSP9A4=;
        b=v8SRXmeQlUuJB6BCYvOnKshfctdl+SwXF4vhtltm+iuEpL6qXUfjJF1tRZxLJCXKmY
         tPf7JfC8kY+9YGAZnHoSKbn7DzssuYRj82paik0HbXjMIHgsa0dNxXIkQ0sGSFAupI8O
         B0kHcB2AZOedn0elNbqlB+AZ6fQgrThjgjMf5LSL0WuE1fc9P+IN8I4mMgN7p5NOVbmP
         rRPwYY5subC9wIcYksfVPRh91cfQMP4iMXy1v3VH8evMy+hQVoq7/JoWT0w/zi6QCwlz
         Zxwg4yF4YT0xPRcUHhy1yB9NPehwYafhyOrzAs2LVIYEEcHSzXWMpI9FeziJjdlDSXrt
         M+eA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020ac8588a000000b002f39f1e7a0asi2582568qta.177.2022.05.11.22.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 May 2022 22:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1np1LH-0002F7-DG
	for alex.bennee@linaro.org; Thu, 12 May 2022 01:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1np1Kf-00023y-9w
 for qemu-arm@nongnu.org; Thu, 12 May 2022 01:25:49 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:60299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1np1Kc-0004Af-Ma
 for qemu-arm@nongnu.org; Thu, 12 May 2022 01:25:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2772221E91;
 Thu, 12 May 2022 05:25:43 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 12 May
 2022 07:25:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0039a6c3a51-50a7-426c-ac68-3e266af0879e,
 72056902518AC1F5BD4797AAAB6E76FEAFBFF81B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ffbba219-a46e-430b-15b6-5e6a13240cbb@kaod.org>
Date: Thu, 12 May 2022 07:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] hw: m25p80: allow write_enable latch get/set
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>
References: <irischenlj@fb.com> <20220512005411.2503971-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220512005411.2503971-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dccaa793-538a-4960-ab74-6a5fb0342795
X-Ovh-Tracer-Id: 11121357806910475137
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeeigdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YA2YAJp0FE1j

Hello Iris,

[ Fixing Thomas email ]

On 5/12/22 02:54, Iris Chen via wrote:
> The write_enable latch property is not currently exposed.
> This commit makes it a modifiable property using get/set methods.
> 
> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
> Ran ./scripts/checkpatch.pl on the patch and added a description. 
> Fixed comments regarding DEFINE_PROP_BOOL.

You should run 'make check' also.

With the removal of "qapi/visitor.h" and the property name change
in the test,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

One comment below,

> 
>   hw/block/m25p80.c             |  2 ++
>   tests/qtest/aspeed_smc-test.c | 23 +++++++++++++++++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 430d1298a8..019beb5b78 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -35,6 +35,7 @@
>   #include "qapi/error.h"
>   #include "trace.h"
>   #include "qom/object.h"
> +#include "qapi/visitor.h"
>   
>   /* Fields for FlashPartInfo->flags */
>   
> @@ -1558,6 +1559,7 @@ static int m25p80_pre_save(void *opaque)
>   
>   static Property m25p80_properties[] = {
>       /* This is default value for Micron flash */
> +    DEFINE_PROP_BOOL("write-enable", Flash, write_enable, false),
>       DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8FFF),
>       DEFINE_PROP_UINT8("spansion-cr1nv", Flash, spansion_cr1nv, 0x0),
>       DEFINE_PROP_UINT8("spansion-cr2nv", Flash, spansion_cr2nv, 0x8),
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 87b40a0ef1..fcc156bc00 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -26,6 +26,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/bswap.h"
>   #include "libqtest-single.h"
> +#include "qemu/bitops.h"
>   
>   /*
>    * ASPEED SPI Controller registers
> @@ -40,6 +41,7 @@
>   #define   CTRL_FREADMODE       0x1
>   #define   CTRL_WRITEMODE       0x2
>   #define   CTRL_USERMODE        0x3
> +#define SR_WEL BIT(1)
>   
>   #define ASPEED_FMC_BASE    0x1E620000
>   #define ASPEED_FLASH_BASE  0x20000000
> @@ -49,6 +51,7 @@
>    */
>   enum {
>       JEDEC_READ = 0x9f,
> +    RDSR = 0x5,
>       BULK_ERASE = 0xc7,
>       READ = 0x03,
>       PP = 0x02,
> @@ -348,6 +351,25 @@ static void test_write_page_mem(void)
>       flash_reset();
>   }
>   
> +static void test_read_status_reg(void)
> +{
> +    uint8_t r;
> +
> +    qmp("{ 'execute': 'qom-set', 'arguments': "
> +       "{'path': '/machine/soc/fmc/ssi.0/child[0]', 'property': 'WEL', 'value': true}}");

Peter added qom_get_bool() and qom_set_bool() helpers in
aspeed_gpio-test.c, it might be interesting to reuse.

There are similar ones in the npcm7xx tests, btw.

Thanks,

C.



> +
> +    spi_conf(CONF_ENABLE_W0);
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +
> +    g_assert_cmphex(r & SR_WEL, ==, SR_WEL);
> +
> +    flash_reset();
> +}
> +
>   static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
>   
>   int main(int argc, char **argv)
> @@ -373,6 +395,7 @@ int main(int argc, char **argv)
>       qtest_add_func("/ast2400/smc/write_page", test_write_page);
>       qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
>       qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
> +    qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
>   
>       ret = g_test_run();
>   

