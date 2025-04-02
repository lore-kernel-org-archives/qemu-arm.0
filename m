Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3283206njd;
        Wed, 2 Apr 2025 00:42:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWStClx7ycv6WTmdPtJevo9Oz0i7VM4/WTar/8MfkJQmThIbDPeHqHblhN/PkqRsGo5QGAIu6LYqRmYXA==@linaro.org
X-Google-Smtp-Source: AGHT+IGfWx8Hch7u9JZB+QyMC03X6A/mnry4DqusqnpjwiGj3BeOQ1njZo6TSux8PrQ1DPNCFhzq
X-Received: by 2002:a05:6214:1d2b:b0:6e8:c713:31fa with SMTP id 6a1803df08f44-6eef5d67f1amr84818236d6.9.1743579745395;
        Wed, 02 Apr 2025 00:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743579745; cv=none;
        d=google.com; s=arc-20240605;
        b=bsZtUnt1oYTwLug8/RpAI7Dr593Kt3c1l/NmInJmsw1ZEquQGHJRgvp6q5awJJIINv
         USZjDMI9KoCe9cYLWoRmxxMTycGROe1pTwfJIbd4F326dY538HTXi71GF91bJ2zgfKwE
         n1lF4mMk4ZUfOj2gPhImbC6HywKScuFM90Gq/pr1NUs53IQYGiVo0qpbuDGUMBxj45m6
         7gvSCF/9CeV/yBBrI/GONS4F8SX3HTMzWTNQjfZr1uGk7vOIl4NN7TjE4eX3IxRs0dlm
         2N3+/mTASJNBUoXY4LmD+MaUgKIu1pkpcVJz5yDVieHQE1PLDT1MaBWissUifeswZUFz
         M1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=fsflF2mEUUQkjKlFfy9S42pWWpPvqAFRZeHh3r7iZhM=;
        fh=KIQWrerkHcHGY8pI9tE4eJlk73GRvR/oZFuXy8RkeGg=;
        b=Ex+j7mzH2RfsfYBdD5QpxzE2gWYXteMEaaGEoT65/y6fbaxUd1wMEULqsjCMwBIoB1
         bjccogb69p7iQ2KqAU6JGUGqF4JH22JjrmmTUrxRnZMYO/rDMx9PmqnkMayxlja5DdlQ
         qfGsNAJoJbQ5YTmxPBY9BkykI9NNgoLFhjO9yfNZC7xteYW2SIZjZczqM/nj/ym4UzlL
         5RIErxUa9F6c/69tXhSp+Jpb/nSfZdmO2AArxP6yIZmPxtt5se5PKOo4uPY+dvLzYHf1
         XaFSQN67WevFJf5xDbwHg6fG0GmXmbDycFe9nIIQb6CsklhYhysLlMFXRDZR+Iys1QRl
         aWvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec965a158si102147406d6.146.2025.04.02.00.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 00:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzsjf-0003Ho-JD; Wed, 02 Apr 2025 03:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzsjc-0003HR-4N; Wed, 02 Apr 2025 03:42:04 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzsjW-0005S4-Mg; Wed, 02 Apr 2025 03:42:01 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZSGyz3l8hz4x1w;
 Wed,  2 Apr 2025 18:41:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSGyt3PCrz4x1t;
 Wed,  2 Apr 2025 18:41:41 +1100 (AEDT)
Message-ID: <ff5e84c5-4714-4897-90b6-40df76746443@kaod.org>
Date: Wed, 2 Apr 2025 09:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/22] hw/misc/aspeed_hace: Support DMA 64 bits dram
 address.
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
 <20250321092623.2097234-9-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250321092623.2097234-9-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uXYpUk3Av70m

On 3/21/25 10:26, Jamin Lin wrote:
> According to the AST2700 design, the data source address is 64-bit, with
> R_HASH_SRC_HI storing bits [63:32] and R_HASH_SRC storing bits [31:0].
> 
> Similarly, the digest address is 64-bit, with R_HASH_DEST_HI storing bits
> [63:32] and R_HASH_DEST storing bits [31:0].
> 
> Ideally, sg_addr should be 64-bit for the AST2700, using the following program
> to obtain the 64-bit sg_addr and convert it to a DRAM offset:
> 
> ```
> sg_addr = deposit64(sg_addr, 32, 32,
>                      address_space_ldl_le(&s->dram_as, src + SG_LIST_ADDR_SIZE,
>                                           MEMTXATTRS_UNSPECIFIED, NULL);
> sg_addr -= 0x400000000;
> ```

I don't think the code extract above is useful.

> To maintain compatibility with older SoCs such as the AST2600, the AST2700 HW
> HACE controllers automatically set bit 34 of the 64-bit sg_addr. 

I suppose that's what bits [30:28] of the first word of the scatter-gather entry
are for ?

> As a result,
> the firmware only needs to provide a 32-bit sg_addr containing bits [31:0].
> This is sufficient for the AST2700, as it uses a DRAM offset rather than a DRAM
> address.

yes the HACE model can use a relative address because the DRAM memory
region is directly available. There is no need to construct a physical
address.

> Introduce a has_dma64 class attribute and set it to true for the AST2700.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/misc/aspeed_hace.h |  1 +
>   hw/misc/aspeed_hace.c         | 27 ++++++++++++++++++++++++++-
>   2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index a4479bd383..58fb66009a 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -52,6 +52,7 @@ struct AspeedHACEClass {
>       uint32_t src_hi_mask;
>       uint32_t dest_hi_mask;
>       uint32_t key_hi_mask;
> +    bool has_dma64;
>   };
>   
>   #endif /* ASPEED_HACE_H */
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 51c6523fab..8f333fc97e 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -148,6 +148,7 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
>   static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>                                 bool acc_mode)
>   {
> +    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
>       bool sg_acc_mode_final_request = false;
>       g_autofree uint8_t *digest_buf = NULL;
>       struct iovec iov[ASPEED_HACE_MAX_SG];
> @@ -182,6 +183,9 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>               }
>   
>               src = deposit64(src, 0, 32, s->regs[R_HASH_SRC]);
> +            if (ahc->has_dma64) {
> +                src = deposit64(src, 32, 32, s->regs[R_HASH_SRC_HI]);
> +            }

That's where a little helper would be nice to have.

>               src += i * SG_LIST_ENTRY_SIZE;
>   
>               len = address_space_ldl_le(&s->dram_as, src,
> @@ -190,6 +194,21 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>               sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
>                                              MEMTXATTRS_UNSPECIFIED, NULL);
>               sg_addr &= SG_LIST_ADDR_MASK;
> +            /*
> +             * Ideally, sg_addr should be 64-bit for the AST2700, using the
> +             * following program to obtain the 64-bit sg_addr and convert it
> +             * to a DRAM offset:
> +             * sg_addr = deposit64(sg_addr, 32, 32,
> +             *      address_space_ldl_le(&s->dram_as, src + SG_ADDR_LEN_SIZE,
> +             *                           MEMTXATTRS_UNSPECIFIED, NULL);
> +             * sg_addr -= 0x400000000;
> +             *

I don't think the above comment is useful. Please keep the one below.

> +             * To maintain compatibility with older SoCs such as the AST2600,
> +             * the AST2700 HW automatically set bit 34 of the 64-bit sg_addr.
> +             * As a result, the firmware only needs to provide a 32-bit sg_addr
> +             * containing bits [31:0]. This is sufficient for the AST2700, as
> +             * it uses a DRAM offset rather than a DRAM address.
> +             */

The SG_LIST_ADDR_MASK needs an update though. AFAICT, it's bigger on AST2700.


Thanks,

C.



>               plen = len & SG_LIST_LEN_MASK;
>               haddr = address_space_map(&s->dram_as, sg_addr, &plen, false,
> @@ -218,7 +237,9 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>       } else {
>           plen = s->regs[R_HASH_SRC_LEN];
>           src = deposit64(src, 0, 32, s->regs[R_HASH_SRC]);
> -
> +        if (ahc->has_dma64) {
> +            src = deposit64(src, 32, 32, s->regs[R_HASH_SRC_HI]);
> +        }
>           haddr = address_space_map(&s->dram_as, src,
>                                     &plen, false, MEMTXATTRS_UNSPECIFIED);
>           if (haddr == NULL) {
> @@ -275,6 +296,9 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>       }
>   
>       digest_addr = deposit64(digest_addr, 0, 32, s->regs[R_HASH_DEST]);
> +    if (ahc->has_dma64) {
> +        digest_addr = deposit64(digest_addr, 32, 32, s->regs[R_HASH_DEST_HI]);
> +    }
>       if (address_space_write(&s->dram_as, digest_addr,
>                               MEMTXATTRS_UNSPECIFIED,
>                               digest_buf, digest_len)) {
> @@ -601,6 +625,7 @@ static void aspeed_ast2700_hace_class_init(ObjectClass *klass, void *data)
>        * has completed. It is a temporary workaround.
>        */
>       ahc->raise_crypt_interrupt_workaround = true;
> +    ahc->has_dma64 = true;
>   }
>   
>   static const TypeInfo aspeed_ast2700_hace_info = {

