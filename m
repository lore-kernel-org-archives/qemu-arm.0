Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp191592njg;
        Tue, 25 Feb 2025 04:58:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsZjf84UF+xX1dgw/C6mqDClPzvvl+1k+7lFSdmXKzKHDptCeMlqpwfpY0EnarIpxWjlT20SI7CUCsoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFKzehhVJIJkqyZ0Eo8eDVCT+E+qar3GLmNXq6AVhh5DcGfkKkqmQVjTHrxpwBfOeVqDvyY
X-Received: by 2002:a05:620a:450c:b0:7c0:c282:702a with SMTP id af79cd13be357-7c0cef484a4mr2271462085a.39.1740488337144;
        Tue, 25 Feb 2025 04:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740488337; cv=none;
        d=google.com; s=arc-20240605;
        b=kudwrsnw2ZhGxw+DK28AkZoEgUzPE/g1gxQp2rrpjmc//I2O7uReXD99sp13DlbmMT
         nYHfLy2CpES2hpTy5oj6wWMqR40/IDjAxFRa1hPdXIbUvIYPpnqlGJb6GHH0xwdwRA8y
         1NmyHzvTCl/7FFU7oFPX1/BG4SX8Hk9cKvKXsA89lPZxZ0hicPBkndLM8DO0ziuXZQH1
         +Tj+9dWD5wRedkapa5cg1wm0cH69+FJ4Dff37u2jiMiipSMSX+sofMjMoxOqdBk4ij38
         VhyDmO2EU9IUkDhjt6nRmtt8SFqFVfVAMdWiZbNzXsvJMTMZ6GiUvgX/m0z0NTB92Ptr
         ctnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HcD3XyFdA7mIEZd2U7bF/99wQU+mKGDluKiAz/FnbU8=;
        fh=bqoLRYle6Bfz7B9pli+pe4AaOG6Tzyy+askm49QD/rQ=;
        b=WCYOM3XgFjRupd+8BetMFsbsmkchNDSNqZ1u7D+L7RV1lT7dKx2Qt9f7L5KloDLom6
         zf+dBK4RZHrvNGSp10mUct7/+Rqe3xuIkUfg3pMmSwO/cPP+l/Ct2YE1w+o7irzXzDXy
         YFuLfep0HR7YczGwrIVNb8j+m6rKg25kS+p95L8C0tF2587hREVZ/VaynFWlJ1Os51gC
         mP/f6sV79haoyJrU1VCe90pRHxwurw3ZHo4lVIUlgZepz5mKcjLhxQk+IZzSBMbXwZ5e
         3O/pPMW9z+wEBlnt8yWyFqNGaFb5HQybp+w0FyQWbLhqyHLRuuqVVzO0xocRiBUQHQIe
         XKKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXFEjORd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2d8198si164414285a.386.2025.02.25.04.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 04:58:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXFEjORd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmuW5-0007b6-Js; Tue, 25 Feb 2025 07:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmuW3-0007ah-QR
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 07:58:27 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmuVy-0004tN-Ew
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 07:58:27 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6fcdf0980a6so26695277b3.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 04:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740488300; x=1741093100; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HcD3XyFdA7mIEZd2U7bF/99wQU+mKGDluKiAz/FnbU8=;
 b=SXFEjORdw97b1/6IzUo4BY/wFO1h2o3pgw6TwW/Ajbv9YxHQTIQ02FYmD3idrkPYYQ
 DRRFDZze4aH4ZbgiN4HHDK45/pN1Z9bKFs9KLqZ5d6n1l9JwITMXAiJzlJKIa0ya+zH0
 yKpC62rdvpnoU6JRSDfVafvgCzig3NuIgdNag0BPfmdDE44L8+WIyfSsVsIOBFIUI6/p
 rIfAIKa3cKw7QEtsOnNNDQvog67BMdIr01nRBfNBjNsNNN9CT1UKpG8gpQscyMuip1QB
 oR/QiFSSzxAnTBnOLVnRSsTpKJLCAD4I/qkqGTGQ2i1lo1Wb1MxutB6q5lVydxL4uReD
 KkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740488300; x=1741093100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HcD3XyFdA7mIEZd2U7bF/99wQU+mKGDluKiAz/FnbU8=;
 b=lS8JOl6xnNtcD/nIKfCu8cEK9p426RrFv8gNCXD2W7EkYwGHAjPfS61yuG6Xo4zfJS
 QtIlssNyJG9h6OWKGK0XUPA67TGu+YRg3/zC2S1N0FxVBCbflOxluF1QAKGs120NaVDq
 /f54dXFeLYxLOUY3wmUA0YjyG5eRWKFtlbMnqafKcpKwMWJPrNsTpM59kAUmDgPX1FTb
 5pXG5Q4taM7KL9MPZiik+uJfFjT+BhjO+Z+o3IllTgpPFvUYer4aEhzrFQkURum0eq/A
 QYcil9ivsCwuUKBkrMCH1LN+Dk1y7hQrigQvP3cCnNymmB9vejwJv1Oane6Cqh6T7ghM
 BQcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6o1tE2TpRCErYbPC64Xqs2Ft30NZx2W08sii2/bceCd0dOmMQ1kciQ0P20TWeIncQ9C+2b764Ew==@nongnu.org
X-Gm-Message-State: AOJu0YwVal1LMf72rWy1RaHTLxYWC4+wGr5Ftibysx26UKZL8sh/VYVN
 yjbY6lIebdfmZ4XObG33lTgkvm6ZGltJYin12pqhX3D756j/5JmdwkzRo6z3XYeG0vn4KKqXMJo
 O7FAJV+WsgSSEN98AR4s3T3cb+U3uCAv1TwicnQ==
X-Gm-Gg: ASbGncuOzyi+JCCbwaVOHiO07dOgH4H32GMNZ40iNlAjbQXuh8ckYSWQ8LId3n3GkiS
 xp22MwUNiAurUJU/YJARdJMkUHVF4niSb+8PMvJSHiAljeJzR8aT41SRjQjnSg4yFS1DPq5z70i
 oNMyOb42/u
X-Received: by 2002:a05:690c:680a:b0:6f0:23da:49a3 with SMTP id
 00721157ae682-6fbcc1f4e1cmr135351037b3.8.1740488300504; Tue, 25 Feb 2025
 04:58:20 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250225124423eucas1p150140ffe95a53e4d802b3594a89707b8@eucas1p1.samsung.com>
 <20250225124418.3530474-1-m.szyprowski@samsung.com>
In-Reply-To: <20250225124418.3530474-1-m.szyprowski@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 12:58:09 +0000
X-Gm-Features: AWEUYZlMIyIRLm1wtCUTLekpu1_Y4EzA4klC8cgAPng6t618gIvSnQSfEUnkfWE
Message-ID: <CAFEAcA_MJ5YwLi04Be+n1TCKuQmU+3fgAznvzpPonJw0FHqH3w@mail.gmail.com>
Subject: Re: [PATCH] linux-user: add support for the AARCH64 ILP32 ABI
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
X-TUID: LY99X2PWK3OD

On Tue, 25 Feb 2025 at 12:44, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> This patch adds support for the AARCH64 ILP32 ABI [1] to the QEMU
> linux-user AARCH64 port.
>
> The ILP32 ABI was initially developed quite some time ago [2] to
> facilitate porting legacy code to the new AARCH64 architecture. However,
> it appears that most legacy code is still used as ARMv7 (ARM 32-bit)
> binaries, running on ARM 64-bit CPUs through the 32-bit EL0 compatibility
> feature of those CPUs. As a result, the ILP32 ABI has not been widely
> adopted.

Firm "no" on adding this to the QEMU linux-user mode emulation
until/unless the ILP32 ABI is supported in mainline Linux
kernels, I'm afraid (which I do not expect it ever will be).

thanks
-- PMM
