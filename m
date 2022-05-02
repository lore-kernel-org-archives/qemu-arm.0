Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp788728lfj;
        Mon, 2 May 2022 08:10:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf+a+frg56wc+kKDjifOIocqqAz2MFFMUNXrFiQriIv9Q4w/i79oaidgnmkPkgcsoxtMYR
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id 6-20020a810106000000b002d0e6828a7amr11717000ywb.257.1651504223037;
        Mon, 02 May 2022 08:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651504223; cv=none;
        d=google.com; s=arc-20160816;
        b=o79X8KJne5Ykn2vbuRcp1/IxnuoTzQnhpjVhNKTLIFtVwmc1oYcddibg+p489xLKa2
         u2+4ypiQUWCDWrtmhoKHgKI3cC3KAyDYi73+YmbwcgBz8DsaNut+OR2sJpMxlB7Oy+bR
         VxfTMZsbJ76HFN1WVssTEPYnJX4OEfc8FvYnUp+M5S8k/9H7fDO/AlyHOxfioG3bw9Me
         C0oa7IQEqf58y12MmTvAXU0xTfAVIXSgTcN6CHedGmAB6HUAMdHSvZRSX1JvaYo9Yaq2
         p7RMhtloNJ/cv/+afmO6yAdPyto0YAlNIpWqnC3bLQCDRmkZAIAxb+QXXHp/NdZE6n2v
         tPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=LYeycsIjaDisf43sYkqcNCNwY9j72Q87VbjdBxzhAGE=;
        b=u6uZhg30l2IaCemOpJzIqQHZK92THMTCNyMBZByudJkw3IeBkh6GuKjTvzbCg1Zxrb
         Ee5GQp1vhBbKcdLVtdmQh8TJEvPM00vG6B9ED46kGB4s12uJJ7ccC3OVAtpv/MhtM40U
         0QethzSzV/fzYN8t5HLNz7U++SEssgDyVrrWHlTmldVBzOu1/hnqpRvmjIc/k/PpTvT7
         W5TbAxV1r0oIbetX+2eSKoX9vIihDTajWqeSB2xNToPSkHX2JRyv3PCBj8nLYAyrjqOS
         pD432hpazOBU0+3Pbb63qM/XAm7He5ys2KKeQ+PRtOfq8NVuEKXJ+xq6Q7rvnWsIc088
         o43g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4-20020a25ba04000000b0064990467789si1575165ybg.124.2022.05.02.08.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 May 2022 08:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlXgs-0007bs-Da
	for alex.bennee@linaro.org; Mon, 02 May 2022 11:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlXgB-0007ax-Bc
 for qemu-arm@nongnu.org; Mon, 02 May 2022 11:09:39 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:51963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlXg9-0006wn-2y
 for qemu-arm@nongnu.org; Mon, 02 May 2022 11:09:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D088E21075;
 Mon,  2 May 2022 15:09:33 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 17:09:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00312b3fa39-96a4-4f2a-b6f1-83c8d0b9cbc1,
 1C738C3314058F8CE8CF02D37F1FC3678EA14F63) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <80ac0726-f2a0-527c-2125-97d1869fb147@kaod.org>
Date: Mon, 2 May 2022 17:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20220502080827.244815-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220502080827.244815-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 31a2010a-290f-4d0c-beda-6419dd4ef1d3
X-Ovh-Tracer-Id: 17594719321682184998
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeekfeejvedthfevueetteduleejfeejtdeugfevjedtuedttdefieeuueduudetnecuffhomhgrihhnpehmvghtrgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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
Cc: andrew@aj.id.au, rashmica.g@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BlW9Udyd5jaG

On 5/2/22 10:08, Peter Delevoryas wrote:
> I was setting gpioV4-7 to "1110" using the QOM pin property handler and
> noticed that lowering gpioV7 was inadvertently lowering gpioV4-6 too.
> 
>      (qemu) qom-set /machine/soc/gpio gpioV4 true
>      (qemu) qom-set /machine/soc/gpio gpioV5 true
>      (qemu) qom-set /machine/soc/gpio gpioV6 true
>      (qemu) qom-get /machine/soc/gpio gpioV4
>      true
>      (qemu) qom-set /machine/soc/gpio gpioV7 false
>      (qemu) qom-get /machine/soc/gpio gpioV4
>      false
> 
> An expression in aspeed_gpio_set_pin_level was using a logical NOT
> operator instead of a bitwise NOT operator:
> 
>      value &= !pin_mask;
> 
> The original author probably intended to make a bitwise NOT expression
> "~", but mistakenly used a logical NOT operator "!" instead. Some
> programming languages like Rust use "!" for both purposes.
> 
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and
> AST2500")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Nice catch !

Reviewed-by: Cédric Le Goater <clg@kaod.org>

I was going to send a PR but I will wait a bit to include this fix.

Thanks,

C.


> ---
>   hw/gpio/aspeed_gpio.c          |  2 +-
>   tests/qtest/aspeed_gpio-test.c | 87 ++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build        |  3 +-
>   3 files changed, 90 insertions(+), 2 deletions(-)
>   create mode 100644 tests/qtest/aspeed_gpio-test.c
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index c63634d3d3..9b736e7a9f 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -312,7 +312,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>       if (level) {
>           value |= pin_mask;
>       } else {
> -        value &= !pin_mask;
> +        value &= ~pin_mask;
>       }
>   
>       aspeed_gpio_update(s, &s->sets[set_idx], value);
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> new file mode 100644
> index 0000000000..c1003f2d1b
> --- /dev/null
> +++ b/tests/qtest/aspeed_gpio-test.c
> @@ -0,0 +1,87 @@
> +/*
> + * QTest testcase for the Aspeed GPIO Controller.
> + *
> + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "qemu/timer.h"
> +#include "qapi/qmp/qdict.h"
> +#include "libqtest-single.h"
> +
> +static bool qom_get_bool(QTestState *s, const char *path, const char *property)
> +{
> +    QDict *r;
> +    bool b;
> +
> +    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
> +                     "{ 'path': %s, 'property': %s } }", path, property);
> +    b = qdict_get_bool(r, "return");
> +    qobject_unref(r);
> +
> +    return b;
> +}
> +
> +static void qom_set_bool(QTestState *s, const char *path, const char *property,
> +                         bool value)
> +{
> +    QDict *r;
> +
> +    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
> +                     "{ 'path': %s, 'property': %s, 'value': %i } }",
> +                     path, property, value);
> +    qobject_unref(r);
> +}
> +
> +static void test_set_colocated_pins(const void *data)
> +{
> +    QTestState *s = (QTestState *)data;
> +
> +    /*
> +     * gpioV4-7 occupy bits within a single 32-bit value, so we want to make
> +     * sure that modifying one doesn't affect the other.
> +     */
> +    qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
> +    qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
> +    qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
> +    qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
> +    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
> +    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
> +    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
> +    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    QTestState *s;
> +    int r;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    s = qtest_init("-machine ast2600-evb");
> +    qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
> +                        test_set_colocated_pins);
> +    r = g_test_run();
> +    qtest_quit(s);
> +
> +    return r;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 6b9807c183..32fb8cf755 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -189,7 +189,8 @@ qtests_npcm7xx = \
>      (slirp.found() ? ['npcm7xx_emc-test'] : [])
>   qtests_aspeed = \
>     ['aspeed_hace-test',
> -   'aspeed_smc-test']
> +   'aspeed_smc-test',
> +   'aspeed_gpio-test']
>   qtests_arm = \
>     (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \

