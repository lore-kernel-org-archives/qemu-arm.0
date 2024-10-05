Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp927693njb;
        Sat, 5 Oct 2024 03:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBdPaZkp69FWDmjQFI5m7CxSlfvL3x3f9V9Ae1snPRUCc0M0AMfHWPeya0T4OXc6r3fy+gp214NpbHbA==@linaro.org
X-Google-Smtp-Source: AGHT+IH9YqImUYowCSD5zd+zL1mxXMStVeLB7WfceSprap9WZsDiKg37SXEdzKwnyDOvg6uXgNu9
X-Received: by 2002:ac8:594d:0:b0:456:80d4:812a with SMTP id d75a77b69052e-45d8d06f932mr165210981cf.6.1728124341015;
        Sat, 05 Oct 2024 03:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728124341; cv=none;
        d=google.com; s=arc-20240605;
        b=bzNwffbilyuEqZAK/1ZbyJKX2OEzeE5vgCQlO3TDkBmxy2J5oXtbtBfkUg613w+CBg
         vCeJGWe/hdKPaPs4xm+IoTGxMYyG1Cj4v0OGeX9ofCxf79oFXJlQOlEG8p9an4XC1ujb
         Nj4DU1gAc0BPKiPU7jikwAI3W6EDz6F7ezdas7yXvEljra3uctM5taMgvSlqV39Ph5My
         YIOcvCEikF0FFSdq5deGoX8qghALa4TL1Xt/b1kMIezZah8L938BZ1u4oZYNHv5byut8
         YHt1K7tZPHADVR7Sly62DjpeNRQFSqll6qOFoEB0PhvasbyWRdZRQJC30MT460767AA+
         p3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=OwX+BQDJzAj35+Y0L6AiLAuSBl0DdlKJEJNkNkJjuSI=;
        fh=SnFmhe+5i6KgsJ5Q6TvjqQXtXYEN4xB/iCvHkChcy9c=;
        b=I9x845KrMB21XPVIjKn1KNgqwjISQGOzEoFKK6mTtGpx10uENrrGWCsoKBZChYSm3Q
         o/7NaQAU3AGIgWeltia2LWcZBaW7qEetPkvMT4nfrHHr9d2H/SYED4gZYVvnaelfI5t9
         cQMAtvItHn2Qb+KF+tIxTodoy3nMJ7++PBZQBPfCwICCp609vy4UgjWHXX9u9/KDUxQt
         O2OZfLbRPZ5b645/PYrCXlxycWDxDlhKBBYlApCjnN0eCq1WBADhnS6vDmuR3yM3kbiL
         4+IMxJ7vJEjexTRsvbNKeLmOqhfNhFl3LNHTtJIeJzcPhPhNcwfP3qeHTRhBnDgmP+e0
         5eWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="NaA1b/iz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae7562cc70si160112885a.222.2024.10.05.03.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2024 03:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="NaA1b/iz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sx255-0001Nn-WE; Sat, 05 Oct 2024 06:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1sx252-0001NU-QH
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 06:32:09 -0400
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1sx250-0003LL-4R
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 06:32:07 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AF2FCA40390;
 Sat,  5 Oct 2024 10:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FAEC4CEC2;
 Sat,  5 Oct 2024 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728124308;
 bh=dRfL9j9fox9VAJqc0lt4h4UbPL3AelM/FiWAIcNnBLk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NaA1b/izRRpGy/Uf2jvZ6tDEg8GmC5EAzwKkwpPGT531aHilzWSVikSp/xeg3vJXF
 AZ1MKt49KnY28ZaOyxgw1RGpt1RAgVn0Ee5euMoiu7BzSghRMkAT/LDmHjIq4SEfMk
 YJQEOhI/KpjzA0tziqpWGorvzg2U87cFgi9K+BEdJy8a8/Fxqn9xQOM65K+Ikl7EkU
 SarcI7gNmfRfw4gyniazOgpihH4zU1+snZ0RKQc+UXxqyaqNSwJMWePibMVGO0XgsZ
 cYyQNqt6neknw0DZRQU3N/0GuqhqLlDCLjahFfPViCE7AZUJIUjAMwZeKWtxl+tysE
 iO4u/m4eQI9kA==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1sx24g-000YxZ-Jq;
 Sat, 05 Oct 2024 11:31:46 +0100
Date: Sat, 05 Oct 2024 11:31:45 +0100
Message-ID: <864j5q7sdq.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Enrico Joerns <ejo@pengutronix.de>
Subject: Re: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO
 address
In-Reply-To: <4d559b9e-c208-46f3-851a-68086dc8a50f@pengutronix.de>
References: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
 <CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com>
 <a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
 <CAFEAcA9F3AR-0OCKDy__eVBJRMi80G7bWNfANGZRR2W8iMhfJA@mail.gmail.com>
 <4d559b9e-c208-46f3-851a-68086dc8a50f@pengutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: a.fatoum@pengutronix.de, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 ejo@pengutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=147.75.193.91; envelope-from=maz@kernel.org;
 helo=nyc.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.146,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZiTSxp/mpBb4

On Fri, 04 Oct 2024 20:50:18 +0100,
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
> Hi,
> 
> On 04.10.24 14:10, Peter Maydell wrote:
> > On Fri, 4 Oct 2024 at 12:51, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >> On 04.10.24 12:40, Peter Maydell wrote:
> >>> Don't do this -- KVM doesn't support it. For access to MMIO,
> >>> stick to instructions which will set the ISV bit in ESR_EL1.
> >>>
> >>> That is:
> >>>
> >>>  * AArch64 loads and stores of a single general-purpose register
> >>>    (including the register specified with 0b11111, including those
> >>>    with Acquire/Release semantics, but excluding Load Exclusive
> >>>    or Store Exclusive and excluding those with writeback).
> >>>  * AArch32 instructions where the instruction:
> >>>     - Is an LDR, LDA, LDRT, LDRSH, LDRSHT, LDRH, LDAH, LDRHT,
> >>>       LDRSB, LDRSBT, LDRB, LDAB, LDRBT, STR, STL, STRT, STRH,
> >>>       STLH, STRHT, STRB, STLB, or STRBT instruction.
> >>>     - Is not performing register writeback.
> >>>     - Is not using R15 as a source or destination register.
> >>>
> >>> Your instruction is doing writeback. Do the address update
> >>> as a separate instruction.
> 
> With readl/writel implemented in assembly, I get beyond that point, but
> now I get a data abort running an DC IVAC instruction on address 0x1000,
> where the cfi-flash is located. This instruction is part of a routine
> to remap the cfi-flash to start a page later, so the zero page can be
> mapped faulting.
> 
> Simple reproducer:
> 
> start:
>         ldr     x0, =0x1000
>         ldr     x1, =0x1040
>         bl      v8_inv_dcache_range
> 
>         mov     w10, '!'
>         bl      putch
> 
>         ret
> 
> v8_inv_dcache_range:
>         mrs     x3, ctr_el0
>         lsr     x3, x3, #16
>         and     x3, x3, #0xf
>         mov     x2, #0x4
>         lsl     x2, x2, x3
>         sub     x3, x2, #0x1
>         bic     x0, x0, x3
> 1:
>         dc      ivac, x0
>         add     x0, x0, x2
>         cmp     x0, x1
>         b.cc    1b
>         dsb     sy
>         ret
> 
> This prints ! without KVM, but triggers a data abort before that with -enable-kvm:
> 
>   DABT (current EL) exception (ESR 0x96000010) at 0x0000000000001000
>   elr: 000000007fbe0550 lr : 000000007fbe01ac
>   [snip]
> 
>   Call trace:
>   [<7fbe0550>] (v8_inv_dcache_range+0x1c/0x34) from [<7fbe0218>] (arch_remap_range+0x64/0x70)
>   [<7fbe0218>] (arch_remap_range+0x64/0x70) from [<7fb8795c>] (of_platform_device_create+0x1e8/0x22c)
>   [<7fb8795c>] (of_platform_device_create+0x1e8/0x22c) from [<7fb87a04>] (of_platform_bus_create+0x64/0xbc)
>   [snip]
> 
> Any idea what this is about?

IIRC, the QEMU flash is implemented as a read-only memslot. A data
cache invalidation is a *write*, as it can be (and is) upgraded to a
clean+invalidate by the HW.

KVM cannot satisfy the write, for obvious reasons, and tells the guest
to bugger off (__gfn_to_pfn_memslot() returns KVM_PFN_ERR_RO_FAULT,
which satisfies is_error_noslot_pfn() -- a slight oddity, but hey, why
not).

In the end, you get an exception. We could relax this by
special-casing CMOs to RO memslots, but this doesn't look great.

The real question is: what are you trying to achieve with this?

	M.

-- 
Without deviation from the norm, progress is not possible.
