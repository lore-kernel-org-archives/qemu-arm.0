Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2028441njc;
        Mon, 22 Jul 2024 09:49:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX11xKoSIHO2qxC51o8Q+puvcbrEIFiABnM4+7DgVAuYeobTohCtYtJ/3WJkAADsRVPpyajiYpQsz/yguxl7U5fN9gRGcdO
X-Google-Smtp-Source: AGHT+IGiS8/Gu4y0cbB0yc4r5XCEwlZvcmLAVQINUOvjtHITPVzn68gV4ZhwhedD9qFNfZKwR+wp
X-Received: by 2002:ad4:574b:0:b0:6b5:e886:d8a9 with SMTP id 6a1803df08f44-6b9610a1bcamr118661126d6.29.1721666987672;
        Mon, 22 Jul 2024 09:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721666987; cv=none;
        d=google.com; s=arc-20160816;
        b=PcCPcJH/2x6dtqIrpV4o9ynhm24UxcdggY7d2JjaKRczEmWE+hl262CY0/6QFaMq0t
         Jnct4gDhTt7bkm51sWYqQH5axej9koopoeyw/PPlNx8KqVuJO8LPi1aUjE+xmiTi7Yvl
         d3kb64J93joxkGiTxvh7PI3UCNvJR34yhQDOTWlENKPX6levbY7VKL8+V0IsiOmcXasW
         yWMl1nwk/gFZerZfkA6e+pKylEwB96jFD3ezNCmUHlvLcM3R3nuyAEUFmqQ+Q9Pks8DJ
         AhtndMjGoT+BOQwQwv2LcS+lUnZB2+VNu4mttMTCiOhF2tq7mUN11NQRUcSriVgzgLuO
         wnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ojd67kYJwQNwCJ7C4DJs/GgdGhSFvQnplRWu/lP131A=;
        fh=abZcUwVgzePw57mMwypls+4XqKGQ8/AhtAYEbpPtMrE=;
        b=hk3+ZPbNjOjR+u7MSNJsgMo+UVKVoRohdbDwLhP01/js0vZtHW601M2xm0aFbeUup/
         N4dXuVQPnsIdJwafmUF6arWG6UeP9yPmk6WCa2l8Cq6zkUFoMhIh9KGyDJ48EvKYpC28
         MErY9LbKaWhgEMQ1f0/0LzStYeFvAwiEbwtauTJhffxzPwbqW8jyHF4LNs7u9HqGf6HZ
         9YRsOcchIqTlKbC1cIEflTACu3CKls/sHEmVAWDNnkcsT9tVxdl/Xp6S+7VsnxrfAfOS
         S3SQUOBysVGxSZikyLSoOBRITHD2T5Jv47d7EjBmlIceBZyXyegukVXP90zLVc9TZAXF
         3aHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=MB1YZUnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cd267c1si81344421cf.179.2024.07.22.09.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 09:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=MB1YZUnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVwE2-0005CX-0x; Mon, 22 Jul 2024 12:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sVwE0-000566-Mn
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 12:49:24 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sVwDx-0007LB-Jk
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 12:49:24 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-70d1fb6c108so854795b3a.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 09:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721666958; x=1722271758; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ojd67kYJwQNwCJ7C4DJs/GgdGhSFvQnplRWu/lP131A=;
 b=MB1YZUnEBw/nasA+5UHIddjm3KtLCyswmXdLOPmEi5LuZsqvYhLjeJgyHC2bisfRxT
 n1PqaoFNXlpfXkRE/keVcJDs2tCOm75aMl6y3RfbitO9NxzIUI7zPVFBfG8mMoZFmmy3
 7IN/xBxRSvEjRbaBnRfUbKst3+fqB+Qj8hEMGdBTScmp23I2en8VdQrgORRx4TadS+I1
 4n+9sTqCsYU0wujm4y4bbZjXLwwB+apveEHEMMsfgTsM73rUP94/o2H/TumT+0eFaTti
 udFDg0X1io2vmGcDG4KDEEzK2Rwno5HzBawS/ycqJp/omKhsr+NXbMMj94IfKN8eHsf/
 ElnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721666958; x=1722271758;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojd67kYJwQNwCJ7C4DJs/GgdGhSFvQnplRWu/lP131A=;
 b=TtfqSyQXVQyDJVh44gNN+qRZJGqU7Athu1PDmTGrPRcEGZMjsp34wADWOxwcB13HKS
 g2zH4jX/dI8qSHqtispV3PjGop3yEc66uGhxT0TDGSg58cCdpppMtbwoqj2BDvbqnsPN
 O2nVw3N8oe7VvfsLmRuLJA0M4FEyzrpAlzTwuBtR/TqBIjP8jr+fCZbIvO8VGKVCtLj7
 gWIqq4rdYQBC9XD7WMiUpRJWB3JhgReNODU9RLDl2qDURpCk9LaMw2R0hkIZpaDVcOjk
 ZrkzTcOS8UMry3QVIFpe7iFTk1LSSFiwZFUghPH5/k7NBjYl11lHa75AVKfva6MH1PSc
 A4sw==
X-Gm-Message-State: AOJu0Yz0B5aTsNnlJZepAeI3/aqcCiWv10dHRLzMyAgvSs/2dvQ5HB37
 u27UaX5M1aWlnaJlR+eDC/c/lD878liu9c2bV1otMN8FvxdCwFxLkXCP7znk+muA0qSE7H9GNXv
 PYCg=
X-Received: by 2002:a05:6a20:430e:b0:1c2:8bcc:bb09 with SMTP id
 adf61e73a8af0-1c42857336cmr6308503637.8.1721666957556; 
 Mon, 22 Jul 2024 09:49:17 -0700 (PDT)
Received: from [100.64.0.1] (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f28e87esm56848115ad.66.2024.07.22.09.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 09:49:17 -0700 (PDT)
Message-ID: <c96ad0e8-bb2b-4af3-b706-57cd93653f9d@sifive.com>
Date: Tue, 23 Jul 2024 00:49:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] target/riscv: Simplify probing in vext_ldff
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-13-richard.henderson@linaro.org>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20240719010707.1319675-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: ARDF7ts4JRWj

Reviewed-by: Max Chou <max.chou@sifive.com>

On 2024/7/19 9:07 AM, Richard Henderson wrote:
> The current pairing of tlb_vaddr_to_host with extra is either
> inefficient (user-only, with page_check_range) or incorrect
> (system, with probe_pages).
>
> For proper non-fault behaviour, use probe_access_flags with
> its nonfault parameter set to true.
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/vector_helper.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 1b4d5a8e37..10a52ceb5b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -474,7 +474,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>             vext_ldst_elem_fn *ldst_elem,
>             uint32_t log2_esz, uintptr_t ra)
>   {
> -    void *host;
>       uint32_t i, k, vl = 0;
>       uint32_t nf = vext_nf(desc);
>       uint32_t vm = vext_vm(desc);
> @@ -493,27 +492,31 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>           }
>           addr = adjust_addr(env, base + i * (nf << log2_esz));
>           if (i == 0) {
> +            /* Allow fault on first element. */
>               probe_pages(env, addr, nf << log2_esz, ra, MMU_DATA_LOAD);
>           } else {
> -            /* if it triggers an exception, no need to check watchpoint */
>               remain = nf << log2_esz;
>               while (remain > 0) {
> +                void *host;
> +                int flags;
> +
>                   offset = -(addr | TARGET_PAGE_MASK);
> -                host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD, mmu_index);
> -                if (host) {
> -#ifdef CONFIG_USER_ONLY
> -                    if (!page_check_range(addr, offset, PAGE_READ)) {
> -                        vl = i;
> -                        goto ProbeSuccess;
> -                    }
> -#else
> -                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD);
> -#endif
> -                } else {
> +
> +                /* Probe nonfault on subsequent elements. */
> +                flags = probe_access_flags(env, addr, offset, MMU_DATA_LOAD,
> +                                           mmu_index, true, &host, 0);
> +
> +                /*
> +                 * Stop if invalid (unmapped) or mmio (transaction may fail).
> +                 * Do not stop if watchpoint, as the spec says that
> +                 * first-fault should continue to access the same
> +                 * elements regardless of any watchpoint.
> +                 */
> +                if (flags & ~TLB_WATCHPOINT) {
>                       vl = i;
>                       goto ProbeSuccess;
>                   }
> -                if (remain <=  offset) {
> +                if (remain <= offset) {
>                       break;
>                   }
>                   remain -= offset;

