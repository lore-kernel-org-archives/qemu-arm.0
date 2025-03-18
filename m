Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3069710njb;
        Tue, 18 Mar 2025 09:57:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCfoMsEIBQcbbEU5n3qGJpUGYZZiK+DN1i6oNgcgscFSSROFmFhpacDhWwplpmeS/7NP93kipvcIevWA==@linaro.org
X-Google-Smtp-Source: AGHT+IF+21roVsEdE8jKUb6uZz25c7BrKQVBHssx4RiVjKL7TfobNEAHoTtFTY0oa/gnrm9kRiN6
X-Received: by 2002:ac8:5992:0:b0:476:afd2:5b46 with SMTP id d75a77b69052e-476c815653emr228409211cf.25.1742317038595;
        Tue, 18 Mar 2025 09:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742317038; cv=none;
        d=google.com; s=arc-20240605;
        b=GVVquA3SfPYWiw8wvE38s2hwDdsA2L0V7bU8r8roeE53LRJKhkYW+d5/9f4lrYro1n
         p9VUHPkyP+nnsf9PZU+cSH8TPDsYK08DW/GIBzFEMTNV1s+G7CnShfuV6krqZXh2FJYz
         tXRfOmJuNziz3cKoHg2VtbHi79yKCaOe+MrR/8M+DPJjDx9sLFbCB/KwSi//7OAnQI2E
         xE2g/RQ3TIVcA1g2gkMM32vuR6BBiHYxZcskLJEg+3qu9dLvj2Z0T4PenJRjs3gWx+ui
         xfHFAlZqPb1+xtEh+lUr6AaURIw2b0T1e6JAMjekCelT8o3oxdSBnVgTL7ApByrg7IOq
         O7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WGqkqVo0mVjp3+qrB6oL0JhqJb9fnlJ86z6khneLleI=;
        fh=t9Yaptg5c5/eGXVth2ojR/7LKglbR31iP6ccS4pIEWA=;
        b=TMXuV5m9KEcNj5mdNgIr7hrkqkfdUkNwS6Lgecqu+REdxugUEzP0Bg25NIN8KlSd4p
         NhKt+bRFoQADBLpxJL2RhiIKuQK9Ol9GyHCHQZ0DoBQTR4SizkhCBdhkDWoatCohQlGp
         uncl9aXXQHh5EktCfzXusWSDPR+019VLjkMrkCglNzlACvwcemR2TUVJpx9W1Il2dwRG
         AzRA9pCRnGqXD8HpjHxx5w0h/6zqoOhinwQT/X33qzPxDh+zao1E5Pnfu/frIQl+DhFZ
         llu8oaU1DwHHHM9D2EPpDDyaPMU+0bjwPYHzNxBxh9OHR/i0PRvNsZ5iixSVUO13w8UV
         PDtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPZcptiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476ec127174si51482521cf.452.2025.03.18.09.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 09:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPZcptiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuaFU-0006Pt-Dj; Tue, 18 Mar 2025 12:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuaF9-0006ON-Sv
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 12:56:44 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuaF3-0002WL-HV
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 12:56:43 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e643f234e08so1321533276.0
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742316996; x=1742921796; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WGqkqVo0mVjp3+qrB6oL0JhqJb9fnlJ86z6khneLleI=;
 b=mPZcptiYkpjyU0gP5sea54b38QmksMoJcnJXgevgGTgoa59AppDk/nLPMRzut+OxqU
 1KHSVX2FRsb3j/40tpDtV8rBKrxGNvfJL3bbtye5FDJsxakpmkD/gvJsOP+6uxoHHV+x
 GAJA5htGk5kiO3cCHJ4VUoO6I0gkNaSNPnp/C/NcRWKFPpAtDtyofOEogfpmmx2gMDrM
 BQ7CudZtyI3J6ZsLh/aNLqLRXtYdYqy9ju5bQDmiqgyoA0s3N+lZro11kVnRJSJZm7Fx
 YaWH7qWGtUAyIu5CD6k88qs4LiRmEdLw71dLvG7Eui858e/uqLuUnYpDQw49HA0nVCM5
 mYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742316996; x=1742921796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGqkqVo0mVjp3+qrB6oL0JhqJb9fnlJ86z6khneLleI=;
 b=KgKuwPcoqrU6JUJsSG8j/4Bw1ZTIQSilwEE/VD4d+UbF+3l8b6xYnLYL/nLBw39egr
 N87m5pi71b1duCqrf+29T6qbV091t9GUY3AXXELl+tQv8cZEIHk8uaSOoHQS8UvdaXR9
 ehrpDBSYHhwe08GE/38r1FD17EZA754TLUuDIgkjvdQUCtIchMpSAmd3Gb4080mF89yH
 PJ83ImsF0WvUkT42s3g5kxqtEPJjMQydhovwPCIBnjSgbuj9DyraUEqj5VsUAyRrS527
 MXwcBQbCijQUNEw7BCiaPvAoLVyGEui+75QZezzz+LGH2hUmn5UfNRBJhtGwtmBCgzPr
 QlsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOKfg8CVkd8Hj0iYSk2EkSarhP3SqvHKqC90EHQ8jnPuiKsfIXp7U/vvn0BRuMNHbZU11KnIjJGA==@nongnu.org
X-Gm-Message-State: AOJu0Yy+pB1024XH4y/fz+ZTLkTPEerJyyvaMqGryg1u8SZRWYlmyYGs
 f2EhYdtwiWwqTZXqDbr47xwj1f2ncMj8bzRRPic2SGssvan9FUtzqM9aRzES03RYZF50X4McVcl
 vqG4LmLPdt0tEDk8l1XJE5lR/Y/iP+dP4IZ9dJw==
X-Gm-Gg: ASbGncv6Uany9Mpca5QYhgarmUHJo9WOafBKLf5DT3WQ4ImHwTa5JpOCE/OB9IPnEor
 KRvN59clgnn94mrBQzEOlIwt+JFCpR0ZTFKHIY/xNUw8yfJV5Wf3dPZt71W0mAvjzpi+8mfzxbO
 YXANW2kyilHYimQPxbhj2ohVqhBoY=
X-Received: by 2002:a05:6902:1791:b0:e5e:1034:db93 with SMTP id
 3f1490d57ef6-e66793820b2mr16795276.34.1742316995641; Tue, 18 Mar 2025
 09:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250315132030.95209-1-zenghui.yu@linux.dev>
In-Reply-To: <20250315132030.95209-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 16:56:24 +0000
X-Gm-Features: AQ5f1JoXO7yYZB4iU_D_j1pag8a2rtan5Md7OkaC-e-6uH3nta9x3Df79mofxYI
Message-ID: <CAFEAcA9YUmXA=bA4FERwqSEP86RFUhUKUcLvVVSV64p_QJKnbA@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Emulate ICC_RPR_EL1 accesses properly
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UHh08oYdfnMi

On Sat, 15 Mar 2025 at 13:21, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> Commit a2260983c655 ("hvf: arm: Add support for GICv3") added GICv3 support
> by implementing emulation for a few system registers. ICC_RPR_EL1 was
> defined but not plugged in the sysreg handlers (for no good reason).
>
> Fix it.
>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  target/arm/hvf/hvf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 87e35c1b71..650b7f4256 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1359,6 +1359,7 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
>      case SYSREG_ICC_IGRPEN0_EL1:
>      case SYSREG_ICC_IGRPEN1_EL1:
>      case SYSREG_ICC_PMR_EL1:
> +    case SYSREG_ICC_RPR_EL1:
>      case SYSREG_ICC_SGI0R_EL1:
>      case SYSREG_ICC_SGI1R_EL1:
>      case SYSREG_ICC_SRE_EL1:
> @@ -1673,6 +1674,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>      case SYSREG_ICC_IGRPEN0_EL1:
>      case SYSREG_ICC_IGRPEN1_EL1:
>      case SYSREG_ICC_PMR_EL1:
> +    case SYSREG_ICC_RPR_EL1:
>      case SYSREG_ICC_SGI0R_EL1:
>      case SYSREG_ICC_SGI1R_EL1:
>      case SYSREG_ICC_SRE_EL1:

ICC_RPR_EL1 is a read-only register. But hvf_sysreg_read_cp()
and hvf_sysreg_write_cp() do not check the .access field of the
ARMCPRegInfo to ensure that they forbid writes to registers that
are marked with a .access field that says they're read-only
(and ditto reads to write-only registers). So either we should
not list ICC_RPR_EL1 in this list in hvf_sysreg_write(), or
else we should add the .access checks to hvf_sysreg_read_cp()
and hvf_sysreg_write_cp().

I would favour the second of those two options, because it's
more robust and means we only need to care about the access
permissions of a register in one place. Plus we already get
this wrong for some registers: for instance ICC_SGI1R_EL1
is write-only but we will permit the guest to read it.

So I suggest a 2-patch series:
 * patch 1: add the checks on .access to hvf_sysreg_read_cp()
   and hvf_sysreg_write_cp(): they need to call
   cp_access_ok() to check this
 * patch 2: can then be this patch without modification

thanks
-- PMM
