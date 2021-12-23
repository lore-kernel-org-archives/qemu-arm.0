Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3346641lfb;
        Thu, 23 Dec 2021 05:02:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGYySrHpZWr2DU8jZNLZ9TK84UhZRQwULcsLiG8FiUnyVyXvy6dHElEWHS2ave37urxEIS
X-Received: by 2002:a05:620a:414c:: with SMTP id k12mr1162645qko.591.1640264565482;
        Thu, 23 Dec 2021 05:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640264565; cv=none;
        d=google.com; s=arc-20160816;
        b=V5CDhtWpsmL9FortUXcTUwoJ1QabA1Bc7pL9FZiuMKoFb0bgbXd/VXyM5ZH6KU4um8
         hf5mtoIxCwV346Ff4lfchlj0LslauCmkjkM/AnmXlh0Iv3y7L5CkNY8LcytDBOwCIOIl
         Q1KnR8XpZhfZSBbY1uvLEOSAHXwUXIxWsioTzVp0OTJIUdagGSmsgawmQLwtGgYyiub4
         +1A7OdydVbJ6Tealq/EcREVev8GObHB48R9dpohA4NDnz4PK9BKUoeuHB3I+qontUO+0
         EoEqEqhXxMpd2bQu2HR7tRruetsgWj8EzDp1N95mr8AffpoXOMwL881AfmhvtpGg0tUL
         1/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=AKUlN3q8otRLNSSDUhNOgmqG0F3TsmBK8SJvz3yyzWA=;
        b=lK1rW7gK5hkLbjkWRQ6oixFbgCYybXzK1O3fxAya2eXYIdlyD/sRTkwxNBWiC4OkXh
         UgDOtnt3qH6BLVn8xsrLR791lTmomyxsS4LOnZ8fLW1he9q+9eSkpLFS46LHov8NBq1E
         yISLbdy+49yZSQyYvZuhvSbF7v5DtPSHflDsgofYP4NEo8SYMWjHXVEXROElWyXxbX8O
         060tBqypbBSlThUyer+ZSPDiViK8esrZ4EOkTuma1yRThzrRqgISuZw9HD+9kEfWGEEu
         9j5n3Mg+CuIxHQP+A4xenZZnkYa9DsaUYIxJBf6cbq+WOrQS3FdKoOrE1iWEJ7xB5WGD
         /Y3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az34si1456469qkb.125.2021.12.23.05.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 05:02:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0Nk4-0000iY-O2
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 08:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n0Nca-0004Fq-Ef
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:55:00 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:58839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n0NcY-0000Vq-59
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:55:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C049C21F07;
 Thu, 23 Dec 2021 12:54:54 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 23 Dec
 2021 13:54:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006d1cdff10-8dbf-40ca-bfec-f5be4f535fb7,
 8CA006CF2B51D87471028670A5C113E20BDD9F51) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <8df385c9-b25c-80bb-fb27-88f774eb44c6@kaod.org>
Date: Thu, 23 Dec 2021 13:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Supporting AST2600 HACE engine accumulative mode
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <qemu-devel@nongnu.org>
References: <20211222022231.231575-1-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211222022231.231575-1-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7b00df1d-4c0d-4f41-b8ff-78b2ff9794cf
X-Ovh-Tracer-Id: 8186981174223866732
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepkhhlrghusheskhhlrghushhkihifihdrtghomh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 leetroy@gmail.com, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 klaus Heinrich Kiwi <klaus@klauskiwi.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fpNyk6x1A/Lk

[ Adding Klaus ]

On 12/22/21 03:22, Troy Lee wrote:
> Accumulative mode will supply a initial state and append padding bit at
> the end of hash stream.  However, the crypto library will padding those
> bit automatically, so ripped it off from iov array.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>   hw/misc/aspeed_hace.c         | 30 ++++++++++++++++++++++++++++--
>   include/hw/misc/aspeed_hace.h |  1 +
>   2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 10f00e65f4..7c1794d6d0 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -27,6 +27,7 @@
>   
>   #define R_HASH_SRC      (0x20 / 4)
>   #define R_HASH_DEST     (0x24 / 4)
> +#define R_HASH_KEY_BUFF (0x28 / 4)
>   #define R_HASH_SRC_LEN  (0x2c / 4)
>   
>   #define R_HASH_CMD      (0x30 / 4)
> @@ -94,7 +95,10 @@ static int hash_algo_lookup(uint32_t reg)
>       return -1;
>   }
>   
> -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> +static void do_hash_operation(AspeedHACEState *s,
> +                              int algo,
> +                              bool sg_mode,
> +                              bool acc_mode)
>   {
>       struct iovec iov[ASPEED_HACE_MAX_SG];
>       g_autofree uint8_t *digest_buf;
> @@ -103,6 +107,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>   
>       if (sg_mode) {
>           uint32_t len = 0;
> +        uint32_t total_len = 0;
>   
>           for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
>               uint32_t addr, src;
> @@ -127,6 +132,21 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>               plen = iov[i].iov_len;
>               iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
>                                                   MEMTXATTRS_UNSPECIFIED);
> +
> +            total_len += plen;
> +            if (acc_mode && len & SG_LIST_LEN_LAST) {
> +                /*
> +                 * Read the message length in bit from last 64/128 bits
> +                 * and tear the padding bits from iov
> +                 */
> +                uint64_t stream_len;
> +
> +                memcpy(&stream_len, iov[i].iov_base + iov[i].iov_len - 8, 8);
> +                stream_len = __bswap_64(stream_len) / 8;
> +
> +                if (total_len > stream_len)
> +                    iov[i].iov_len -= total_len - stream_len;
> +            }
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
> @@ -234,7 +257,7 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                           __func__, data & ahc->hash_mask);
>                   break;
>           }
> -        do_hash_operation(s, algo, data & HASH_SG_EN);
> +        do_hash_operation(s, algo, data & HASH_SG_EN, data & HASH_DIGEST_ACCUM);
>   
>           if (data & HASH_IRQ_EN) {
>               qemu_irq_raise(s->irq);
> @@ -333,6 +356,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
>   
>       ahc->src_mask = 0x0FFFFFFF;
>       ahc->dest_mask = 0x0FFFFFF8;
> +    ahc->key_mask = 0x0FFFFFC0;
>       ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>   }
>   
> @@ -351,6 +375,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
>   
>       ahc->src_mask = 0x3fffffff;
>       ahc->dest_mask = 0x3ffffff8;
> +    ahc->key_mask = 0x3FFFFFC0;
>       ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>   }
>   
> @@ -369,6 +394,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
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

