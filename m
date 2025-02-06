Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1692896njb;
        Thu, 6 Feb 2025 09:27:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqivkgzaRNNtW+CX8kfXYWsTeJyvCre/sx1IVzxDMsmfxjfYBbHW1ySnQevfO+xZT2cHrmYLEaafDKqA==@linaro.org
X-Google-Smtp-Source: AGHT+IFDhuswF2yXUK0WHeul7CxN3qelWw2AwXrv7rJth9bM5Z2eX8BFAOnlhcyQ8c040NWms1S9
X-Received: by 2002:ac8:7f50:0:b0:46f:cc36:d528 with SMTP id d75a77b69052e-47167acb4b6mr807011cf.37.1738862845329;
        Thu, 06 Feb 2025 09:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738862845; cv=none;
        d=google.com; s=arc-20240605;
        b=SkZCnRGSFGKO/qWypvLJ5owfsBwGWSuaI0Lp6sl0UL0e/ySly9HlYdIqZWFZ52G2g/
         1DxbviHM4hjWt724bSUoD5qY1BoFHPW76+Snd5ZlR5nqz8tiopovIbPFP+QxQbAy61v3
         d//EI2ePEme7/6AzfHM9e3WBOuyyGt9/6EakoOj+OgGaJjmYElkoLfc9xre5WO9oUYsA
         T5PME/nkrq/xpJw8gsJlbNVjKNeEz2XVm2vNKuzcnUdyYyEW/B5IHsmOW9DHY/L2910y
         MagbQZ5mexQZ6mijVWomJA5iFmoaqjKvLsnRXF4hCex7yI1e7oqkxFBkPLUVpqauf3Ll
         BZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nN3uKjuk7wRCSeRPs0qfUzFgMBCSrlGatMDIvQVB0ZY=;
        fh=L82DQW0GgtcQCMQ8uwCmD7NcSvMW/z52n7oYCyuqSPs=;
        b=FximoZ1w+VOFLlJhdYCV1wl8T6PdcGt9fYDNRHlaL4ksA5IKgE/3MN6xQh2ZdVcfPL
         /QCDTx/ipwdvX8Njq/2c+8CWcKuoThruRq6keL1bIeAQ8WHdNP2KYoqGH3pVzFK/gLmP
         tKtv37xyUYlT9mnMYb+QkDEqk1dXU6UNw3L8ZtbYEqJZB32tuMMOBUVr9UWPDE5su7EQ
         +MJ+/iihaADhw+UARncZPaB4V1QFTLK393ESnW7tXykVWMDIiX8I8lPtZfEG5Esk9mVa
         gtiA+VXbyI1qukCfQ1a7yguYlhj5vKg3gbRJvHcqgVbn1uT6FbYPTUcQM/L5lu7K8NII
         AjaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mj3a1+O1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b74bf2si14184611cf.324.2025.02.06.09.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mj3a1+O1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg5et-0005h0-1r; Thu, 06 Feb 2025 12:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5eh-0005VH-Na
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:27:13 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5ef-0000VS-S5
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:27:11 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so1122542276.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 09:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738862829; x=1739467629; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nN3uKjuk7wRCSeRPs0qfUzFgMBCSrlGatMDIvQVB0ZY=;
 b=mj3a1+O1EHr6cbfY/FnsjhcJYfNHW0NuHcVJcJtjZww7kknKnaX4xRvGztP+k6IoRm
 7oh5juXlmwv8UgGluJgc82rx9EGruVXCdZWgVW4rURGLyiYxylznZyO8URQN2hGIEk0o
 clSRC29rRJyaesTVO0XhbhmWhuqTBZXZ2jJHwcT+b7dLJcmjC+K4wGRPXFDHRpqf6Y5L
 +FFUttGtESO1ctO1Eprl5z/0vptnwN3xtDA6D3OHz2Qvh0uYaGqlqn3gbx/EYL8dUolA
 gyV0F8pBpDzQNZvMO6WyBZVQUg4hS/1iuvMLm2esw6q4oL5f/9ZsWrxCZ+BeeMpFj9V3
 ULtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862829; x=1739467629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nN3uKjuk7wRCSeRPs0qfUzFgMBCSrlGatMDIvQVB0ZY=;
 b=twMshihMphKCm1ZcLuwdQDb21c/WYAoWtyoAxUdMadF79w1Ti44OYAKLIZEoqZn9NT
 lwfnvmYo/APBjPMV+bSxkVuXEAmrqAOXuXnj88TPUd5lB5OwcqmPk2q46rVzPZGs4UBR
 cYRfNnbmZtJjCX/P2mcDa9NinpQIQ3FT+Y3VbQ3Ki1zLbMWyVVl3ICiA5OHVbnDu24Bm
 4+rOQXddnUlmzlkZ2DMy5QtgBFgfJS16bqPZuHsyWBqSntlbypOrKLlLAgwUPufg+RNc
 6Le71HmcjcIi6zdKjjR8/aYSJ/juEuxrlQW18A/PIuDpLguZfX8s5hfqPWd47keKt/NA
 QPrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIvNOHVxuheviu3v74tMfFIwe8aaMv3sx0OxJXcWAzGV58vpstDLXwN0eG2o6OWpIHtQLV8sNhCA==@nongnu.org
X-Gm-Message-State: AOJu0YzbQJNdumgyDO6jhBXHBMAmgfMKFLHm5SiGegKIVJ87SVZIyTsl
 4h6yGphy4pDQzIbJzukVPNWcz+pedIlPainUdRANttZXeFmF16MMOoShevJGTrhjkD+9dlvD09h
 2mZarWicKbSNvIiJ/SJ2wIUcTXkri9u0sgpGaDkMhJMjrjJyo
X-Gm-Gg: ASbGncutbtaH2JCqLukOrmN3nwv7WpVMbfasV5iDQfaiKeFl4bivLHt0PdLI5s69prx
 ord+ijOQaUV5uaKLMWJ+qICkcz2OGDJcb/rzgZTJuVDFj7D/lkF+NH5xwDxY8KuGCM/hIJy0Agw
 ==
X-Received: by 2002:a05:6902:200f:b0:e58:cbe:75a1 with SMTP id
 3f1490d57ef6-e5b259cd10fmr5826990276.4.1738862828957; Thu, 06 Feb 2025
 09:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-12-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-12-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 17:26:57 +0000
X-Gm-Features: AWEUYZlxa3bGt4PBflBb8F-HJgPJyDP_JBdmLnoKNsAr4i6ml65r4opWsCIEa70
Message-ID: <CAFEAcA8+VpG0vmqiVsbeGN1h_12wXW5eOSx2B0i-BbkPtaYcmw@mail.gmail.com>
Subject: Re: [PATCH v2 11/18] hw/arm/fsl-imx8mp: Add SPI controllers
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: OvVc86p/ey9S

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/arm/imx8mp-evk.rst |  1 +
>  include/hw/arm/fsl-imx8mp.h    |  8 ++++++++
>  hw/arm/fsl-imx8mp.c            | 26 ++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
