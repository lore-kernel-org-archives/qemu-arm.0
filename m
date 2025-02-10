Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1990217njb;
        Mon, 10 Feb 2025 06:53:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvCA5XswPmTl0JKgy6sCjT6u14Ho49AlWx+ZYhH0s4QV4+CKTaAqcojeuJ0xbt3UfglUpcGkb+Ec6rTg==@linaro.org
X-Google-Smtp-Source: AGHT+IEXyy6pwk1ickn1lDD8LVszreaPHPXQ9/YTRv6/5pndX0FMZ01A81ks5EUrJfhZcVJGF4CT
X-Received: by 2002:a05:622a:6686:b0:471:826e:3efd with SMTP id d75a77b69052e-471826e6aa8mr88641811cf.44.1739199211224;
        Mon, 10 Feb 2025 06:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739199211; cv=none;
        d=google.com; s=arc-20240605;
        b=OVK3LED6mPEObOxY3jLqsKKSmJX9AvyMYtvw68V3+dqXqCeWO6NslXOJn+b503B4/w
         RR/NDMAGhOg4zZIy6UBGO9JfxlbA6RHi9DoMGYdhC5J1g1hqjbDIdPwROayRBI/aoUtK
         TytEa9SRPcwYTKOhcwEqDyuz/ugwz83mSiWpOHsrale4eHOG4KLe3rML9zkwzFVS1nLN
         5ERyhye9xoEQkFw3Y7lrIvZlrqwqT1++iTFrH67uK0SiW+uAQPcD36dCJhpawf9j8IlZ
         fCnmZM/hVEvM/yAiq17dukzLawSJZIxTnfOQi3QdN5BztTVVg0Y0WtedyWJ0Ko2fgRS2
         Ld0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dXZenGARfw3IOupKccrnIOuz9KweyoTKXdi5aucIOHo=;
        fh=pWNRCrO7QgUhVJ01Lpet3L5YxckoNzFcVfU87ZsjmfY=;
        b=aqUOyfYWsHdedsfHRBywyW6lLQrtY3GFCJyjZQ6h+V6bHr/PzqW5kgY58fFuct+pmw
         qRT4mUrc2oUKnmWAVLdbwOLinS6fRzK8D7rFhcEipqP+vvfCfsRsbUGdNpVa01LOERYK
         cBX0byuccWzXUJ+pNx1t2M8P+o0WKwVyTgPRmTSHHusv8/42a6uvb8E40Z6Dx9EQzqL0
         vJwKZmD1WRzFEiHrJXYuZRR4DIv2KX3rs4YVMLQcrfwKjuQVTC793KY5CmBg6Us2doZs
         8RQPHgXk6Ltg96s5L1kKZJaJUc+RqT0HwS/VUsntZJQshW42yWkZdfQg7SXMBaG8m4xC
         7JEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K4j+98/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bbb4e9si90489091cf.505.2025.02.10.06.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 06:53:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K4j+98/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thV9d-000053-IV; Mon, 10 Feb 2025 09:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thV9Y-0008V5-Rk
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:52:53 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thV9W-0003IY-5N
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:52:52 -0500
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e5b3dbd6732so3417629276.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 06:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739199168; x=1739803968; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dXZenGARfw3IOupKccrnIOuz9KweyoTKXdi5aucIOHo=;
 b=K4j+98/edOKEuXFW7eiL4vO9e+nNF67f7PD7sOIkwJmjfduv6l0ecR9Lt8saJ3OEaD
 Zzt5Bd0kRXgIpNdR4WZVweecRzzY8/ZLCL2xdi2PsXTMV2e53q3WaLDd3QCh/dP4HUBG
 sAfxSDHQhZe5q1ri4oFGSxyviY/NKG4/d9YuNdR97Fwmy1JxseZyDeTw85LxWh4i4yzI
 09udEDwTi3tzmgf0R9pNOAWqHOO7uqbR6FpnijP6wwlFcpKF8QruOrVX6rKB0S6+mngf
 nFcZSlg4/t00+lzvuMROrBDOU1cQvGInSaqth+mhhbkNUQehQ7Ov9tJBXBBIHkLhprkq
 KxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739199168; x=1739803968;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXZenGARfw3IOupKccrnIOuz9KweyoTKXdi5aucIOHo=;
 b=qME6xxnAPzLwdfWFmiVWvucBi5XndiQMYflNP4HH7sn3Pzkq5NE4XpraKjJ8vh93D4
 Uk22I/Tr81yKZL43qHKDqzrqSLRLEvxcgmD0/jwqxvrmcTVXVbHsVtjVtwmUVUp4LrIV
 3WfFfoQzsvZe0C1ZbsjeYBj2fzIh5W26b2/q2VCGVNEhB4M+9nXKlJb1GqS8PlboLBK2
 Kz6CauEDqC0ZpD/0eJTuL80wEg6Gc09mS1JLQDK1j3CD6yeQ+HgWMh1CeezWNfJ3pFaD
 RoRukwl37ot2yZAuPVEdCdU32MrCPxSnJ+MFDmQCoL8Ts2coMgAPr4XeGlyaWkMQRTKB
 6S0A==
X-Gm-Message-State: AOJu0YzOw4dtlVtZ50dGK38QcTfhVTHxmShr7yiodyPxPKR4fGmXmTEV
 wPa0nfYLeKVNerCH7P1O1dCgApf4hvBy8GN0VIPbdmFUrDizaTz1WxLT34bwMc0jPyQKK3hpDf8
 Kvit//Bj/dNLZB47tS7ixCXCi2C/Cmszjl5xdPw==
X-Gm-Gg: ASbGncsXKhbYdSE2lfRD13uJQSh+STRdxL2wp0yMUr7cTKnbGAgO+6TeAAduV6+VFpN
 5uWYvHeUH0CyRmdz76piXxexD192TJeJzrLUD1fJBUi+aMs/9wOAA7+7qxDZiIpJzGRDZqacTug
 ==
X-Received: by 2002:a05:6902:18cb:b0:e58:dbf:ed09 with SMTP id
 3f1490d57ef6-e5b4617025bmr12243101276.3.1739199168696; Mon, 10 Feb 2025
 06:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20250206221203.4187217-1-wuhaotsh@google.com>
 <20250206221203.4187217-16-wuhaotsh@google.com>
In-Reply-To: <20250206221203.4187217-16-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2025 14:52:37 +0000
X-Gm-Features: AWEUYZlK86CxAfUXcKSQzwXTRt_0Le6ac4RFQ6NFPmX2kDqd92WmKwPTHXEXOvU
Message-ID: <CAFEAcA8wgvb7k56me7muy2PsLNL0GAa0ewySpQpPQocHQ2djYw@mail.gmail.com>
Subject: Re: [PATCH v4 15/17] hw/arm: Add NPCM8XX SoC
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com, chli30@nuvoton.corp-partner.google.com, 
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: +3qk1drTcxIq

On Thu, 6 Feb 2025 at 22:12, Hao Wu <wuhaotsh@google.com> wrote:
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  configs/devices/aarch64-softmmu/default.mak |   1 +
>  hw/arm/Kconfig                              |  13 +
>  hw/arm/meson.build                          |   1 +
>  hw/arm/npcm8xx.c                            | 804 ++++++++++++++++++++
>  include/hw/arm/npcm8xx.h                    | 107 +++
>  5 files changed, 926 insertions(+)
>  create mode 100644 hw/arm/npcm8xx.c
>  create mode 100644 include/hw/arm/npcm8xx.h


> +static void npcm8xx_init_fuses(NPCM8xxState *s)
> +{
> +    NPCM8xxClass *nc = NPCM8XX_GET_CLASS(s);
> +    uint32_t value;
> +
> +    /*
> +     * The initial mask of disabled modules indicates the chip derivative (e.g.
> +     * NPCM750 or NPCM730).
> +     */
> +    value = tswap32(nc->disabled_modules);
> +    npcm7xx_otp_array_write(&s->fuse_array, &value, NPCM7XX_FUSE_DERIVATIVE,
> +                            sizeof(value));
> +}

We're trying to get rid of tswap32() uses. Compare
npcm7xx_init_fuses(), which does
    value = cpu_to_le32(nc->disabled_modules);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
