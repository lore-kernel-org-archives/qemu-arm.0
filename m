Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp20394njb;
        Thu, 13 Mar 2025 09:20:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfg5kFiAZ4M39YhtCzgaZnENJ+u/9hjjrdeEcrbgpucPOkuNxD5TIi6ZA6oqBrz2zkxEJuJ0NpgiR6Hg==@linaro.org
X-Google-Smtp-Source: AGHT+IGePlfGBN4xMK8HYBYI9eIePoSKwU4bsp9M6aV7KVxCxJnh9evXKI7U2weu7/ZRVyiNUKAF
X-Received: by 2002:a05:622a:1981:b0:476:7e6b:d291 with SMTP id d75a77b69052e-4767e6bd968mr260850561cf.37.1741882824867;
        Thu, 13 Mar 2025 09:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741882824; cv=none;
        d=google.com; s=arc-20240605;
        b=RKp4yCd5dZ4AzNhwDuiqH1lmF1lO99wJilDrREZRlVLrIlFtHunO2wZeD/vVd4G9yQ
         c1VNw11fHuHgIjYsGFu3dfvbbfmc3Hcs1LKTDf2oUgXScd4SPBIniazWXWsy5vEj0ZBH
         dHvePSgTelWIbCulGh5H6MF3o4Guabkm/7qS4F8WTD7J0AHoNGPWhU5hg3f3Bx8EVimf
         /NRhxuOUkA8erF3Rsg9sdD+p6WW9REmVSUKzLWH2O5ES1ESD4gm8d5RaAKxKp41ga2P6
         F5SMOy91xQzaPKMZxMZUF+bdo2ZYLIVrWqsZ1U6GYCoEnwc86bUNihfPt6Amvn/q2C9G
         GXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fniIDk5AwucmYSwZ8t05YroxXwdwrFZK5pOSjV98Isc=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=I720N/Oyw7Cpi9oHy5Yh4seQdtNpLaeuhDAzn66lWBbR2p8OL+udExYnvFap4iYMuS
         5MYJGJPb+KR/vvHcQfAnOClH2bjyTLYvjAkOierciqVvB2IsjaezkSIJ0UIEZ2FGHR+p
         ynBXhFMDg+zD0oq7Rh1hoIAFHv76nqY3nktDeNVMvh9hHl4EuSXgfg0pMhmewD6/jh75
         Cboww50ksmBLIzph7P4nxqFXxdsqtCNVrDszzSKxzrGOYrT/OStM7Ymcmk8abU2HJSBM
         6TloBfAAazkkkYKh13DfVa2dXrncKdGAY2IeGC+GvMD6gPYh3SzaxbmDolQIWdimffYo
         Wgvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSBtRpSU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb888984si19135561cf.630.2025.03.13.09.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 09:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSBtRpSU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tslHn-0004H3-BT; Thu, 13 Mar 2025 12:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tslHl-0004Gm-S8
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 12:19:53 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tslHk-0002L8-CM
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 12:19:53 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e573136107bso1143913276.3
 for <qemu-arm@nongnu.org>; Thu, 13 Mar 2025 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741882791; x=1742487591; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fniIDk5AwucmYSwZ8t05YroxXwdwrFZK5pOSjV98Isc=;
 b=rSBtRpSUG2aB0ai4pEg4Sf0GU8cVVVQxqzwl/C9DuCLMJKJ3vBLYO/SqMlDsqKQ/Ay
 Kga1SAripQJLBJ76PeM382NDF5rETZ00PTSsVBFvIqwpfMR8xnEVvyggR5JB9XnkZxO2
 QZ9N8RxdwDPo3YGoWY1sX4lD4f9+UQZqLCRwbHXmWQ8M35Vm3TJZ9lHC/dNWAFZbKGED
 AOFa5gQNax9/byOu/iS3iH/QeCnFwZT0L/povnAZK+3wzgvk1ACLIZlCq83X6HM37pJv
 nQPBgunXoX8DmiTldshREU+xh/ezpPWMUibVbjenKp4iW2Ap2dxEM6qoUC1SwzhJ+lCQ
 VOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741882791; x=1742487591;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fniIDk5AwucmYSwZ8t05YroxXwdwrFZK5pOSjV98Isc=;
 b=BtQw54Qk0j4IEb/CzA8Koq+VdSKq2wfPY/IOKQBYY/lpcvJytu8GblrcU3RpS1paPH
 Rd0R1Valg5r6aHFe1xf9tr8vLjE4/ft/iYRmsSfYfxhQBQRusVqHlB2fHK4wH+r+oGmQ
 DiE3HQHaN6yVPKrZyLQ6k+u/J0kY9rQ/rnVsEx54+k+1o7H421fpEps47BJ/JrxviDBF
 v47UgsLQeowbgmCWlXxYWVXDnJ9jtLcDXTuvsgaoFwPuuqiXbHfB6zY6Z5hu2r57XGPK
 inrBZ4Kk4nB2xAMra2E/fAaCVRGsXhRxmXLUWLvHfRWPRIsueOXIvDuSgnyiMeON606g
 lSjw==
X-Gm-Message-State: AOJu0YyZOkd0DdQYDrucxa1BxdOADGHY1j/cZJUUULGEZTaP1XJxl+7p
 FOFXSXteb0TUTMr0fxtWKnFVJKIWu7GhcpPGibnlu7bUSGjZ2oS11cGYcnlvjkDsSGlRB5yGhjl
 ++xnLlnOf4BWSDg55W18p5ZAuP/9B03/ukn+HwZYOIBzZ7ikZ
X-Gm-Gg: ASbGncu0PzXiEz/Tz9krkEZIcmNW60wG2Uq1iNPvjuq8IBBlsIfUzhGkbDhbMxiwQkE
 W5V9stHSdceHhLlunl67noP8G2/c5/rXf20Xyks8XrZyZNvveYW6I1PtbhCpLetzWxPfLO13U3z
 zh4Z1uUakb+yar5pSgd68F1YvrH3Y=
X-Received: by 2002:a05:6902:2842:b0:e58:8e82:5345 with SMTP id
 3f1490d57ef6-e63f3a180aamr71319276.4.1741882790629; Thu, 13 Mar 2025 09:19:50
 -0700 (PDT)
MIME-Version: 1.0
References: <20250306163925.2940297-1-peter.maydell@linaro.org>
 <20250306163925.2940297-11-peter.maydell@linaro.org>
In-Reply-To: <20250306163925.2940297-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Mar 2025 16:19:39 +0000
X-Gm-Features: AQ5f1JrpsG8YGw6A5coVaLGbTXvjqAf_G3KtIOSSkn8M7Ja4KELjrgelACIxahU
Message-ID: <CAFEAcA-h4faw-g8Q2cWrPCH75fDeFBZ_J2s1FdVpjkUuJ8yH2Q@mail.gmail.com>
Subject: Re: [PATCH 10/10] target/arm: Forbid return to AArch32 when CPU is
 AArch64-only
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
X-TUID: ja0h5igguczz

On Thu, 6 Mar 2025 at 16:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the Arm ARM, rule R_TYTWB states that returning to AArch32
> is an illegal exception return if:
>  * AArch32 is not supported at any exception level
>  * the target EL is configured for AArch64 via SCR_EL3.RW
>    or HCR_EL2.RW or via CPU state at reset
>
> We check the second of these, but not the first (which can only be
> relevant for the case of a return to EL0, because if AArch32 is not
> supported at one of the higher ELs then the RW bits will have an
> effective value of 1 and the the "configured for AArch64" condition
> will hold also).
>
> Add the missing condition. This isn't currently a bug because
> all our CPUs support AArch32 at EL0, but future CPUs we add
> might be 64-bit only.

I noticed today that actually we do already have a pure AArch64
CPU: a64fx. What saves us is that guests aren't silly enough
to deliberately try to return to nonexistent execution states.
I'll tweak the commit message to suit.

-- PMM
