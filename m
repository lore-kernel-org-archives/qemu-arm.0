Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1882148lfj;
        Mon, 17 Jan 2022 00:11:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ/LpJqFwVQcjMWT90reve9tnd3JkjPTqqb+gKxeWDewKCGRVlI9UdQEzPRkyytKMNt/ZR
X-Received: by 2002:a5b:f8a:: with SMTP id q10mr28749937ybh.392.1642407114599;
        Mon, 17 Jan 2022 00:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642407114; cv=none;
        d=google.com; s=arc-20160816;
        b=AgYnzT2p2lTdEaG0MHUpHQDZMHkZYfkNvvvdYFJZV974R+UgPxg8LpW6zCPyM4vc5H
         /6Z6QDr3iK1z/fbmlir2oB+qB9Kt71pc2BejxzF8EXJbyBbeciCrqJKusvWbB5rPDilk
         N3Wb1dEizzYwHbi4aXpjnQ5u3WUCchxFbVK7oXPPTJ5Foohv6/i9gSm+Z/hgQvJEpCQC
         yEHspcEfCG5yx3oimVPb9Ehdooy/cFKZ1/uyAv8eOEH+C91wF2/ogzF5kmvNQUzY4LGW
         e17CRMq7Tah+z04z2m04M2Cq7KhwSJOktieVZPZ8BM9xhzfkgNSIlcuR4Z53uZMBPlih
         K/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=Phz1BaF7sfqKEBxnNBnwLTJwv1BJLyk5J12OL949gUo=;
        b=xp+AP8DYFn/Lj3JYn2Umc26Lt/jf0WDzroohZ5HfWj1HI+QRHW/oySa3VQkW4XJMDb
         TSIXXfSgZj8BXsf5kmnGvtZADh9WrfxAZhYys6tCXp6PmD6qDXpGdqL3SXamQyEmqoct
         IUDggsldWPUAwVNHba3gFRNW2456HmVh9DqHIA/uT34+aZ0V82f+CDefnQ1tPtgJ6aEc
         F+IAuP6usVR95Hn6kmVCKUfkX0g08mqZuDOZ7EHm3BKiEbQQVl92DKP6XBonhcUj3ERA
         J7CIxyBwXyzj1WH/bX2W/Zb1jYwRUbU62NR/1ivpFVDs7FM23fi3Q2NhsCQK1RiMejo3
         6gLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c125si3897873yba.27.2022.01.17.00.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jan 2022 00:11:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n9N7J-0003EC-Vd
	for alex.bennee@linaro.org; Mon, 17 Jan 2022 03:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9N6m-0003DL-7B
 for qemu-arm@nongnu.org; Mon, 17 Jan 2022 03:11:21 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9N6j-0000hJ-BX
 for qemu-arm@nongnu.org; Mon, 17 Jan 2022 03:11:19 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BA99920C89;
 Mon, 17 Jan 2022 08:11:06 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 09:11:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006631c5535-e53f-487c-ae6e-98e29f37900d,
 9556A11AC16C5E8FE4FF301E40865CB3D13C347E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9be84f9d-dbfe-d5dc-c570-3df263eb852a@kaod.org>
Date: Mon, 17 Jan 2022 09:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] hw/misc: Supporting AST2600 HACE accumulative mode
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <qemu-devel@nongnu.org>
References: <20220112080937.366835-1-troy_lee@aspeedtech.com>
 <20220112080937.366835-2-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220112080937.366835-2-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 01b34094-0728-4238-bd02-66443d70272e
X-Ovh-Tracer-Id: 2637420535458532204
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a907bVrp7A+r

Hello Troy,

On 1/12/22 09:09, Troy Lee wrote:
> Accumulative mode will supply a initial state and append padding bit at
> the end of hash stream.  However, the crypto library will padding those
> bit automatically, so ripped it off from iov array.
> 
> The aspeed ast2600 acculumative mode is described in datasheet
> ast2600v10.pdf section 25.6.4:
>   1. Allocationg and initiating accumulative hash digest write buffer
>      with initial state.
>      * Since QEMU crypto/hash api doesn't provide the API to set initial
>        state of hash library, and the initial state is already setted by
>        crypto library (gcrypt/glib/...), so skip this step.
>   2. Calculating accumulative hash digest.
>      (a) When receiving the last accumulative data, software need to add
>          padding message at the end of the accumulative data. Padding
>          message described in specific of MD5, SHA-1, SHA224, SHA256,
>          SHA512, SHA512/224, SHA512/256.
>          * Since the crypto library (gcrypt/glib) already pad the
>            padding message internally.
>          * This patch is to remove the padding message which fed byguest
>            machine driver.
> 
> Changes in v2:
> - Coding style
> - Add accumulative mode description in comment
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>   hw/misc/aspeed_hace.c         | 43 ++++++++++++++++++++++++++++-------
>   include/hw/misc/aspeed_hace.h |  1 +
>   2 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 10f00e65f4..0710f44621 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -11,6 +11,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
>   #include "qemu/error-report.h"
> +#include "qemu/bswap.h"
>   #include "hw/misc/aspeed_hace.h"
>   #include "qapi/error.h"
>   #include "migration/vmstate.h"
> @@ -27,6 +28,7 @@
>   
>   #define R_HASH_SRC      (0x20 / 4)
>   #define R_HASH_DEST     (0x24 / 4)
> +#define R_HASH_KEY_BUFF (0x28 / 4)
>   #define R_HASH_SRC_LEN  (0x2c / 4)
>   
>   #define R_HASH_CMD      (0x30 / 4)
> @@ -94,7 +96,8 @@ static int hash_algo_lookup(uint32_t reg)
>       return -1;
>   }
>   
> -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> +static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
> +                              bool acc_mode)
>   {
>       struct iovec iov[ASPEED_HACE_MAX_SG];
>       g_autofree uint8_t *digest_buf;
> @@ -103,6 +106,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>   
>       if (sg_mode) {
>           uint32_t len = 0;
> +        uint32_t total_len = 0;
>   
>           for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
>               uint32_t addr, src;
> @@ -123,10 +127,26 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>                                           MEMTXATTRS_UNSPECIFIED, NULL);
>               addr &= SG_LIST_ADDR_MASK;
>   
> -            iov[i].iov_len = len & SG_LIST_LEN_MASK;
> -            plen = iov[i].iov_len;
> +            plen = len & SG_LIST_LEN_MASK;
>               iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
>                                                   MEMTXATTRS_UNSPECIFIED);
> +
> +            if (acc_mode) {
> +                total_len += plen;
> +
> +                if (len & SG_LIST_LEN_LAST) {
> +                    /*
> +                     * In the padding message, the last 64/128 bit represents
> +                     * the total length of bitstream in big endian.
> +                     * SHA-224, SHA-256 are 64 bit
> +                     * SHA-384, SHA-512, SHA-512/224, SHA-512/256 are 128 bit
> +                     * However, we would not process such a huge bit stream.

If we do not support accumulative mode with SHA-384, SHA-512, SHA-512/224,
SHA-512/256 algos, we should make sure that do_hash_operation() is not
called and emit a warning.

Thanks,

C.

> +                     */
> +                    plen -= total_len - (ldq_be_p(iov[i].iov_base + plen - 8) / 8);
> +                }
> +            }
> +
> +            iov[i].iov_len = plen;
>           }
>       } else {
>           hwaddr len = s->regs[R_HASH_SRC_LEN];
> @@ -210,6 +230,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>       case R_HASH_DEST:
>           data &= ahc->dest_mask;
>           break;
> +    case R_HASH_KEY_BUFF:
> +        data &= ahc->key_mask;
> +        break;
>       case R_HASH_SRC_LEN:
>           data &= 0x0FFFFFFF;
>           break;
> @@ -229,12 +252,13 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>           }
>           algo = hash_algo_lookup(data);
>           if (algo < 0) {
> -                qemu_log_mask(LOG_GUEST_ERROR,
> -                        "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> -                        __func__, data & ahc->hash_mask);
> -                break;
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                    "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> +                    __func__, data & ahc->hash_mask);
> +            break;
>           }
> -        do_hash_operation(s, algo, data & HASH_SG_EN);
> +        do_hash_operation(s, algo, data & HASH_SG_EN,
> +                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
>   
>           if (data & HASH_IRQ_EN) {
>               qemu_irq_raise(s->irq);
> @@ -333,6 +357,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
>   
>       ahc->src_mask = 0x0FFFFFFF;
>       ahc->dest_mask = 0x0FFFFFF8;
> +    ahc->key_mask = 0x0FFFFFC0;
>       ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>   }
>   
> @@ -351,6 +376,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
>   
>       ahc->src_mask = 0x3fffffff;
>       ahc->dest_mask = 0x3ffffff8;
> +    ahc->key_mask = 0x3FFFFFC0;
>       ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>   }
>   
> @@ -369,6 +395,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
>   
>       ahc->src_mask = 0x7FFFFFFF;
>       ahc->dest_mask = 0x7FFFFFF8;
> +    ahc->key_mask = 0x7FFFFFF8;
>       ahc->hash_mask = 0x00147FFF;
>   }
>   
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 94d5ada95f..2242945eb4 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -37,6 +37,7 @@ struct AspeedHACEClass {
>   
>       uint32_t src_mask;
>       uint32_t dest_mask;
> +    uint32_t key_mask;
>       uint32_t hash_mask;
>   };
>   
> 

