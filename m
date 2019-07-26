Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11965835wrv;
        Fri, 26 Jul 2019 07:14:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRmXegsT2S3iCcSagXMMymmeGHDbdSk1jje3LI/nDNSKXlLIXb6ZQEiLRVwPFGWdG9mafq
X-Received: by 2002:a37:4e4b:: with SMTP id c72mr61721730qkb.91.1564150481353;
        Fri, 26 Jul 2019 07:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564150481; cv=none;
        d=google.com; s=arc-20160816;
        b=NHQoKjkWwc+aDPuKRfmrmCV7UAV/iM2yG7g+6468QFCGyr4JNNowgTLk3XHM/w58BG
         mmGx1O/KgXjAgjAvWPxEQVrXME67jA6HNdQYM3eV6IAHDAWuuZY5eTjaK3+QkKqjhezn
         Yk3Adlxz4nzU8mk0b3Ccj6nib/CgBOnOapHd1IeCXElNVlzzlWaBpMD9PA+g88peDHup
         yCcNI8jm0VIOZ6JodnyEJQhAHAfVYbT9fcNstXmGE+e+NL9nzsjAKw9Dn/MxVeOMqjf1
         y30qLoFqVE4yujLgLJkvoDsppYU/BWrSxut2Pkdwqj/kJLnTxFLQcyj/tLLt1tRAHX9w
         uIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=i/DvQrYQ97Yl8oYvdth1hdR4PNbJOpdRc88CoWxTHyU=;
        b=z2lwpvGxzS/+BkvLzmPqCodSHLTqoUzkYt13i0sAasdXw4xeexsOaHFf0li53cF0cr
         xIaxX0R/U5z9rK3V17IUVU9b0FF0JuAA0wCFLjAN3vNMcz59BnH4JrwsltM3Wnfp8R05
         i/+PgsxMeQ9ePsz3HCqZmkMXXi566oXAEw4yfaygV/lC4Ez7MwHIiPTYkF0VCUR1A1gb
         GH8sfGwrZNcTID0tMMertegUhqPPHD7KzIYLMY8OxsraI/3Rflv/rhTfTYwJmnvt/CVH
         fScne1tj8sd0ZTf9dL1fYxZmJjNDLX3wdXl4Ocx07DEiVMXU/zw+iDX4M3ZMWugOFC2J
         ElbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wq22dtUw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27si35107155qvw.46.2019.07.26.07.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:14:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wq22dtUw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0zY-0000gu-QN
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46195)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0zT-0000ep-VL
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:14:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0zS-0003vD-Q6
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:14:35 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35814)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0zS-0003tu-HC
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:14:34 -0400
Received: by mail-pg1-x543.google.com with SMTP id s1so18553294pgr.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i/DvQrYQ97Yl8oYvdth1hdR4PNbJOpdRc88CoWxTHyU=;
 b=Wq22dtUwz1A7TMF5HCdO/SyYzbc29Tl0JYbsG/psMJbG9xEKYBFeLPKMIV6q86OU5t
 tnnkgjrqp6V5WXxcDNm8hlWK79RJI8H362lbhAxUcf2e9cVioZlWmTXNCSkuqF3Eqlof
 7rml1TW1VevDsAG7SAhxu6bUmTXy17ytYaZbn8EAvg0+RGAjvY6qSrzraIhoOxpk6ZJw
 5BTMQnN1NrqYKsjx1bl2CNOaoQUXVHc/9mZJ3wzWl3nRy6qFIkXwB+J3f1MohgJTRt9x
 i9abbHwK4PAfvzcXmuWi/JhDV+T3MmebY5cjX10tLUk5y7WhO7+fQn07xtvBKnnyEBIB
 X45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i/DvQrYQ97Yl8oYvdth1hdR4PNbJOpdRc88CoWxTHyU=;
 b=DosVnK6DN4GiWZfLWzl/eof/Urtjjc7T/8gJK/RA8jDNM/39Hh3mrbYfKSdibyiq5v
 cvI1xJt2jZ0YbPq+lM7HvDSiXrXIXk1cVDP7brl+g9zytllxyF2eEvP9dFm4hvr3cNeV
 3MhlJ/Lenii+YMFSw13wez3ZuZjsBzf/JKYLt9kxmXzJQ52SO1EsXpQ6ttxo7vZ2hxbE
 DCxNwf8D2/1uYZF0yIlbmy35SEXMl+p4sfcQUuQIn8enf8snydnI+ZcHydu9nqSj2zWw
 BjEsr7mlVnJHi2SWytSAV3S1aJJTiXIFuit1gEqwStSx9XDQACrngZkjDfgwuKNzBvUT
 sVyw==
X-Gm-Message-State: APjAAAW8395jJ2TQGImg1skM56D8h4k2OnSpG7pD49uhxCizhcjJnX0f
 LCIEU2fcPbs4dX2iU7WICylMXQ==
X-Received: by 2002:a62:1597:: with SMTP id 145mr21675793pfv.180.1564150473241; 
 Fri, 26 Jul 2019 07:14:33 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id x13sm56422483pfn.6.2019.07.26.07.14.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:14:32 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123618147.19868@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b5309b86-edbb-2b23-78e4-7657f6b05da5@linaro.org>
Date: Fri, 26 Jul 2019 07:14:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123618147.19868@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 09/15] cputlb: Access
 MemoryRegion with MemOp
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mb5dYCwXCZ0d

On 7/25/19 11:46 PM, tony.nguyen@bt.com wrote:
> No-op MEMOP_SIZE and SIZE_MEMOP macros allows us to later easily
> convert memory_region_dispatch_{read|write} paramter "unsigned size"
> into a size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 523be4c..5d88cec 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -881,7 +881,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
> 
>  static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                           int mmu_idx, target_ulong addr, uintptr_t retaddr,
> -                         MMUAccessType access_type, int size)
> +                         MMUAccessType access_type, MemOp op)

As I mentioned for patch 2, don't change this now, wait until after patch 10.

> -    r = memory_region_dispatch_read(mr, mr_offset,
> -                                    &val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry->attrs);

So size_memop here,

> -        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
> +        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op), access_type,
>                                 mmu_idx, iotlbentry->attrs, r, retaddr);

but no memop_size here.

>  static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                        int mmu_idx, uint64_t val, target_ulong addr,
> -                      uintptr_t retaddr, int size)
> +                      uintptr_t retaddr, MemOp op)

Likewise.

>          res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> -                       mmu_idx, addr, retaddr, access_type, size);
> +                       mmu_idx, addr, retaddr, access_type, SIZE_MEMOP(size));

And when you do come back to change the types after patch 10, at the top of the
function:

-    unsigned a_bits = get_alignment_bits(get_memop(oi));
+    MemOp op = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(op);

and then pass along op directly.  Which will fix some of the weirdness in patch 11.


r~
