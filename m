Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3289286njd;
        Wed, 2 Apr 2025 01:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVlP+Uqu38fH/bS4lYT0xCvLrbbC//XRYrJV8Sc2N7eNN6WKmbmxBGOzdu0DOlQxup0JKyOtYXixQsMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGV7biY+oDXqcJQPS0eIivWXT/jWtgVZgtrr6UmmFZcexeNacRovXIN30PyZNs1kjhmPlg/
X-Received: by 2002:a05:620a:430f:b0:7c5:5d13:f188 with SMTP id af79cd13be357-7c766456f19mr212171185a.26.1743580825955;
        Wed, 02 Apr 2025 01:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743580825; cv=none;
        d=google.com; s=arc-20240605;
        b=f1+DOuyEEZw57XFKFm84iW3V3YWUZFYSiDlveGML16gjZtPkcQN++aCXNf84nyLQ06
         w/WgSlTMr7hqaK+f7wy8dxiNzWAB0GSl86tXyhw/7MWG9xH62Hu2aq9WOvDniLZ9hwWT
         QellCeXoCvVm4kls2wzcqZOU7GvIdiphc4e8XdDH10NlpCEtVBIaRlj/bP62rAKjdqCk
         xbvuXExvodU9hQxF90+bAdxvxFvozCOg/VIBVMnnbdcNCOr4OiXdyK1AH6ElhCcGwljw
         Sn/Bg/XR+6vWiHQ0HIi16UbxeNl3sL94Yi6sS0tq0Rf5dKlADTJCR31Xnhd8l4U96L6C
         cHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=RHzen905VTtu8FAju8W+JO2HaQLInU6Rh3BBRNHLptY=;
        fh=KIQWrerkHcHGY8pI9tE4eJlk73GRvR/oZFuXy8RkeGg=;
        b=eAXnfOZ+2wl/cXQD+h+3nOZazKG/mlyFKbmb1MKjmXez/r0q25kt3Wo9/yiYNYCq7Q
         xwJNaLEgLlZNxUe4AlPN1ir5AHeG2PL4y+S7OI9CXunoNqxK5xCyGlZu1C1+M9MroRbZ
         Hpa1rVp+1EEE3e7+GjweOSf90nDm5mmvQMVg5nb5b7cRg6cBLGCJsbobVNsGrntgWZvr
         lvvRyNGVuGU/0cLtJgZQoI9IOlqoe2jbtmjdanorgeVyYeRARd+oW/Conq4Sgpt5nE+y
         2u77EkXvb/RRZF1sWV0K6PbkixfxWiY5460Qc1S8aIj5Mq8U5ptbKTc8g1acgVXvTqL0
         5+fA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec964a906si106397086d6.113.2025.04.02.01.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 01:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tzt19-0008Ox-Ux; Wed, 02 Apr 2025 04:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzt17-0008Ny-SO; Wed, 02 Apr 2025 04:00:09 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzt15-0007tX-Au; Wed, 02 Apr 2025 04:00:09 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZSHN01cW7z4x8h;
 Wed,  2 Apr 2025 19:00:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSHMw1fMSz4x21;
 Wed,  2 Apr 2025 18:59:55 +1100 (AEDT)
Message-ID: <fb147a8a-c072-4404-8adf-a0c1d5e39305@kaod.org>
Date: Wed, 2 Apr 2025 09:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/22] hw/misc/aspeed_hace: Add trace-events for better
 debugging
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
 <20250321092623.2097234-12-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250321092623.2097234-12-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qqfJEmPhaMjZ

On 3/21/25 10:26, Jamin Lin wrote:
> Introduced "trace_aspeed_hace_addr", "trace_aspeed_hace_sg",
> "trace_aspeed_hace_read", and "trace_aspeed_hace_write" trace events.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/misc/aspeed_hace.c | 8 ++++++++
>   hw/misc/trace-events  | 6 ++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 53b3b390e3..b8e473ee3f 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -18,6 +18,7 @@
>   #include "crypto/hash.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/irq.h"
> +#include "trace.h"
>   
>   #define R_CRYPT_CMD     (0x10 / 4)
>   
> @@ -186,6 +187,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>               if (ahc->has_dma64) {
>                   src = deposit64(src, 32, 32, s->regs[R_HASH_SRC_HI]);
>               }
> +            trace_aspeed_hace_addr("src", src);
>               src += i * SG_LIST_ENTRY_SIZE;
>   
>               len = address_space_ldl_le(&s->dram_as, src,
> @@ -194,6 +196,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>               sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
>                                              MEMTXATTRS_UNSPECIFIED, NULL);
>               sg_addr &= SG_LIST_ADDR_MASK;
> +            trace_aspeed_hace_sg(i, sg_addr, len);
>               /*
>                * Ideally, sg_addr should be 64-bit for the AST2700, using the
>                * following program to obtain the 64-bit sg_addr and convert it
> @@ -237,6 +240,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>       } else {
>           plen = s->regs[R_HASH_SRC_LEN];
>           src = deposit64(src, 0, 32, s->regs[R_HASH_SRC]);
> +        trace_aspeed_hace_addr("src", src);
>           if (ahc->has_dma64) {
>               src = deposit64(src, 32, 32, s->regs[R_HASH_SRC_HI]);
>           }
> @@ -299,6 +303,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>       if (ahc->has_dma64) {
>           digest_addr = deposit64(digest_addr, 32, 32, s->regs[R_HASH_DEST_HI]);
>       }
> +    trace_aspeed_hace_addr("digest", digest_addr);
>       if (address_space_write(&s->dram_as, digest_addr,
>                               MEMTXATTRS_UNSPECIFIED,
>                               digest_buf, digest_len)) {

I would use the prefix 'trace_aspeed_hace_hash_addr' since the trace
events are called from do_hash_operation()


Thanks,

C.



> @@ -326,6 +331,7 @@ static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
>           return 0;
>       }
>   
> +    trace_aspeed_hace_read(addr << 2, s->regs[addr]);
>       return s->regs[addr];
>   }
>   
> @@ -344,6 +350,8 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>           return;
>       }
>   
> +    trace_aspeed_hace_write(addr << 2, data);
> +
>       switch (addr) {
>       case R_STATUS:
>           if (data & HASH_IRQ) {
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 4383808d7a..cf96e68cfa 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -302,6 +302,12 @@ aspeed_peci_read(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%"
>   aspeed_peci_write(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%" PRIx64
>   aspeed_peci_raise_interrupt(uint32_t ctrl, uint32_t status) "ctrl 0x%" PRIx32 " status 0x%" PRIx32
>   
> +# aspeed_hace.c
> +aspeed_hace_read(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%" PRIx64
> +aspeed_hace_write(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%" PRIx64
> +aspeed_hace_sg(int index, uint64_t addr, uint32_t len) "%d: addr 0x%" PRIx64 " len 0x%" PRIx32
> +aspeed_hace_addr(const char *s, uint64_t addr) "%s: 0x%" PRIx64
> +
>   # bcm2835_property.c
>   bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen) "mbox property tag:0x%08x in_sz:%u out_sz:%zu"
>   

