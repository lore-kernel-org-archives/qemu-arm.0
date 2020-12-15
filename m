Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3571376lfq;
        Tue, 15 Dec 2020 06:55:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwzIDWseqbtgjyY714ErreKk7+k4IJcYM4mPt1UoZ2k9b2uJXCJ10gGha0eS3iaGdmY2DG
X-Received: by 2002:a5b:101:: with SMTP id 1mr18801115ybx.507.1608044146727;
        Tue, 15 Dec 2020 06:55:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608044146; cv=none;
        d=google.com; s=arc-20160816;
        b=cT1RmaO88fOf9bEzefpdEVtjT/t8EGlTg8TM9c19m00CEa3h3zZ2IsxLM5m3Lybkp3
         zweRbGbnsgYTkbvbjJKoPs9ByMLktDm8eTpZiVVeqInORG3OTkpsFlQ1ze+EFu1MxoV8
         IoeqykNF9wH4gNx4osjo2B+06HIzaWET657LNL2nz+ex6eM7cNpDeLcicP5LRAn45Msr
         is2CIh51pyQv2Sjt+CgN7BiaXfUk69nI8mQC8HJhpmTApfmUF9GMfEqTX6FgU2YcqyPL
         AR+pvoaT/+rAxS7+lMuC6ABRVWIF5RpfBcjPP4NUq6jhDbgGfTM9/5czSW2mfN6gxbJm
         ofVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TzmWxc55AliOfScOu1h3U2D27x+VqwgJnj20sgJkp/w=;
        b=fwR8QEvsZVNHZWahcXYlHOfcx4mWCLOUlv8gnnH96EJg9p0ak5YR42mjW7rg8TITGt
         QA/+Znd4kJ9isJGKRQtZ9/i6ZYSGej3h70+r31xcRXE/VDmt6cHb55XUFp8f5A9h07AS
         WQy1lZ9buT603XCd438v3scNziDqF5IguZ/BlHZNxetwLqe/CSyZtO15Q0b0w++4uD8a
         gTGiCWy0HlhXA3mO5lCIDXnWf0gXPb/n/Ye2BJDfsMo8KKA6SnsFEjAgyStKTclEKnCc
         p1di6XZejQ3cLgWqi3CvTgkwVynlTHfa+jgz6+v+SrQNS8UZb+w7DvYZx8+DHtGlKBoR
         zLZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rKW1OfMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u129si19576421ybb.111.2020.12.15.06.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 06:55:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rKW1OfMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpBjt-0008QT-3p
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 09:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpBjV-0008P5-VP
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 09:55:21 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpBjT-0004qr-45
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 09:55:21 -0500
Received: by mail-ot1-x341.google.com with SMTP id w3so19564646otp.13
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TzmWxc55AliOfScOu1h3U2D27x+VqwgJnj20sgJkp/w=;
 b=rKW1OfMKWKa6t8jCIFo3iEXdfcGVlCmrx1s+SV/dqb4vSVdAT6Zs2WParZ8cYcsaqJ
 04VM0KOKzl9At4E/c+DybXrUtd4jkKCsqj9k615pfElSVFYZfKrCDlxehjdDTVXSw+3W
 qwny70H6vzdiH6r1tIeLYcqpWo0T+ZhzYJsTC/qRoV77HpqwIYvGTWCFgTJPLGtxvUtu
 f124D7q10Sc9fqU9qTNfdCd7GnBRwyN4rHkxnxeOtMRrc2Dma5+KXw8KVzdgG52TWfhv
 4lODi7bXzNG1angbOVW1p7xOa6Ph4Lmpz9hYiVxUdeDrc/dcmVD0VHq5gJ9syYTp/I+u
 5oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TzmWxc55AliOfScOu1h3U2D27x+VqwgJnj20sgJkp/w=;
 b=V8d4K0dkqKHPhVfiaeWc09YRLvo+1rJkkJweaW9pb1tKNvBQDM5JAx+9FyHW6VnfJa
 F9hoV3h+Bggy/2GFYcVBuFUnQHa98T8Z9QKjCSe2FgMFEyh1IGznDy4NmtdCPVVSNWxb
 ofKQZeL523vkifuwZ49wZBGziWLVeipfFjBQeI5VdHpvI9Q9ixrNOk3BPbC0xFXQG5FU
 FV00TW/kqosc9oWrc/zSM2+CcC6Qk50OOJ8sr3JQ73kRpSRvUud6/dE3DqNuJqOfp6gz
 OJoqgqHT7ClWnXtPH4uLlp5CmU1LIznDraSPg5DB7uxEChzYG0p2YmSlt0LK1LiTEMNc
 aGnQ==
X-Gm-Message-State: AOAM530hpYpvf45PM7CeWUENLT5fWq3aoaPHEnDXuDj3aB8a3hQvR2Fp
 B3ITeM/Jh3R1KY0xMdm/aiozGpkmonVlSnlf
X-Received: by 2002:a9d:5e97:: with SMTP id f23mr22938331otl.204.1608044117568; 
 Tue, 15 Dec 2020 06:55:17 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q127sm5265783oia.18.2020.12.15.06.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:55:16 -0800 (PST)
Subject: Re: [PATCH 2/3] target/arm: add FEAT_TLBIRANGE support
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20201214202329.26765-1-rebecca@nuviainc.com>
 <20201214202329.26765-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <159e860a-206e-483c-4c31-40d8ada6f05e@linaro.org>
Date: Tue, 15 Dec 2020 08:55:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214202329.26765-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n1p35385M84l

On 12/14/20 2:23 PM, Rebecca Cran wrote:
> ARMv8.4 adds the mandatory FEAT_TLBIRANGE, which provides instructions
> for invalidating ranges of entries.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  accel/tcg/cputlb.c      |  24 ++
>  include/exec/exec-all.h |  39 +++
>  target/arm/helper.c     | 273 ++++++++++++++++++++
>  3 files changed, 336 insertions(+)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 42ab79c1a582..103f363b42f3 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -603,6 +603,30 @@ void tlb_flush_page(CPUState *cpu, target_ulong addr)
>      tlb_flush_page_by_mmuidx(cpu, addr, ALL_MMUIDX_BITS);
>  }
>  
> +void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
> +                                    int num_pages, uint16_t idxmap)
> +{
> +    int i;
> +
> +    for (i = 0; i < num_pages; i++) {
> +        tlb_flush_page_by_mmuidx(cpu, addr + (i * TARGET_PAGE_SIZE), idxmap);
> +    }
> +}
> +
> +void tlb_flush_page_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
> +                                                    target_ulong addr,
> +                                                    int num_pages,
> +                                                    uint16_t idxmap)
> +{
> +    int i;
> +
> +    for (i = 0; i < num_pages; i++) {
> +        tlb_flush_page_by_mmuidx_all_cpus_synced(src_cpu,
> +                                                 addr + (i * TARGET_PAGE_SIZE),
> +                                                 idxmap);
> +    }
> +}

This is a poor way to structure these functions, because each of these calls is
synchronized.  You want to do the cross-cpu call once for the entire set of
pages, synchronizing once at the end.

In addition, tlb_flush_page is insufficient for aarch64, because of TBI.  We
need a version of tlb_flush_page_bits that takes the length of the flush.

This *could* be implemented as a full flush, in the short term.

You could round the length outward to a mask, then merge the low-bit mask of
the length with the high-bit mask of TBI.  That will catch a few more pages
than architecturally required, but less than a full flush.

Certainly I don't think you ever want to perform this loop 32 (max num) * 16
(max scale) * 64 (max page size) = 32768 times.


r~
