Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63F8CCF2C1
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:42:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3jq-0008FH-Ji; Sat, 17 Oct 2026 08:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3ja-00083B-8p
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:42:01 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3jY-0004AA-QI
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:41:58 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-679aeeddc6bso783897d50.2
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792240914; cv=none;
 d=google.com; s=arc-20260327;
 b=K8sN4Zb3rWZDSL8zEma83P8y3QOFoWOKmVGDQlmJwl20NTPxFFFcp2CagaJvAS02/c
 GmGLzrImz2bAW6ci2VLyQgQLUw7x3pr2DXbcMZuEyKFH5/TutHewWSAvyGCmGtCFzMiy
 k+tC40J99p3PTjO9LDOy3p50G56OZaTSlEGMytxFunBr1ntX+jiXyipsl1F2NHqeBeun
 /KeKpbsByJBgA7l1Y1EaOaxJBXY97ZwPYf4D5qsnJ7NeswMyrEm9a/pqH0uCmxPPytcw
 +vB7+08MMt/s4OraKy/OkSxn9n+BOV+gmn1s7vVE5sBuS0852lrE9senAzoRlBzwwc1E
 u4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Rk6Op3t4nh2EfatWEvRXCZRkE4RXXW5hM3EwnFMG1ko=;
 fh=u43GeGbA+ADcHyR+48NFqjKxl8GFH8BhEbweh4QRmg0=;
 b=bcKrXVoGFeMwuSmbaSwnAIp5lPK7snOCUKnNsKEWndfWaH0eAhvikYMiHZUJmz/SdU
 Q83CPxbKGGQmNcL53YIiU0lXOH+VSGF+4JdAYbHnlgCHgiOWLulxJ7vRVI+J736O58/3
 kPU0kJrYNgDLb2sf5cKQn3U7Vo7rk9i3WF+BFF+oHlMqenLHRRUPlmfKgRlUz1XFNfx0
 mmA0Vm0+0oyC1EhaFYKIrkrIF/1z5vDwpiBzBbpPukbNHrlK/ZVlYVtCzniJrlNNoT7X
 miosomHet77Bu62aGWTz7ZQHL1c6ZgokMVzE6r7wcGuLxNWiIpfMk68YTvlHDqMtbHUO
 wDYw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792240914; x=1792845714; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Rk6Op3t4nh2EfatWEvRXCZRkE4RXXW5hM3EwnFMG1ko=;
 b=BSOPVoEynAU4fMEybQ7uVdlPI5XZmycUcryAteRLDcnmQJq8F+F/R3l7wGQ/wRsu7g
 9wqRmCqaKqZMRGnSLazcAGPHHYpddke41+kvhVd0cYjEQk/8itxswMNbS2OVU1diIl+L
 NEitBQ892uPtDgKjJJzbVlbNibIe4xFr4Oh/3A0Wxy1vH8eVXGAYBOlk4AtS6acVK+l3
 0pa0NhBqbnVCL0r6oh3qREYuedx5HZNqWp49VGHXj/KWQmJHiBXCEZD9FyRw0LD+nT9X
 yxqm6r4Ixv0JbpF0snPpZ6NZJkHmGlo0dLdXlPoIsqnPe8wvUDiciLzJyJz0TLhc7eWi
 4VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792240914; x=1792845714;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Rk6Op3t4nh2EfatWEvRXCZRkE4RXXW5hM3EwnFMG1ko=;
 b=CRWi4UnwDEiAP+JHniRddKCnVNi2pfO3Uc0uJw0dV2tyFuZgoEVLHPuNGn0PtJWFOo
 J7o/E7FFtzCdR3emmhApCjFiB9tdgYqHTQZS2rbYqYuBAeYtipRV8KLgmtoYiRWGLF8b
 eUwx6/8Lq0PeRIkgoNEAvR33pcHJzgEExhdp55bUqlNHOv3qeGN5TjxoBB9Q9UzI90vz
 ylxIO2ZSVCyokaIolZujvsEGuTDXbKyZpEo3yO7ft9imUoxANFS6HymP/1ZyixxwMF6P
 dALGkmqE0SXGLYR2nP2pnqgh9DvWNX5LVx/g8iGgu+/QWQgur42uOCNQgCna2ONTTcOQ
 FzpQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBztT1kn0e58V2KhPiLuqNBd/4uP4fVeBOOWJeM3Sn/hM9yl/7wH4zm9bHxT7HiHVeT83EnULPSVEw==@nongnu.org
X-Gm-Message-State: AFq9FYK0qu/rhXFsczHuUZvX1+0WnM+I7vSwY1/T79De2ZHTSP175zQ+
 itJNDcUIQU3dWBzB9bLWv3/r2eY9xnuBqyzR997WedCKC3G2geBEs9Tat8n0xWWfKa3NV+MEboN
 zbeu3SKsjg9RjYSSxHnQKv7ayK1x2Dp1LybN/qoNFOg==
X-Gm-Gg: AYBFou0t14HD5xOg02dkuc1YjkzajIEHAkQ8lmx0CIDOJPzhoDCRQc8rabi+KK3E34R
 NmIRzwhrmIbuWzJEcjsgg50bQXd7g8KLIDFCqwGG64Gg2QK4P4nhQiPZ8s44pLSUYWDfBiqpICt
 4P/EGQyv/Hir/dG5ntkrqIKOVjslFmZ06wttuVj3bBv08KAnpvoO+9w25bjjG/Mi838kIx0nws/
 MednfZqSO8/eaG2kj88dgEr0MbuQN8sSMXXlBPR2FRQzYBdlU8sMxwWi7zAZJJ9oWPj/WMs9P8N
 vAdnDCot5KeboSQyKBxVQNTRBR3IkQ4UquEWia6ghyfqqPIwPkVPZ+VVf//gOzmUU+RFvqVH7A5
 makEWdW8TyTRSQhofMzmFcngjc9tGuRZUrIDDQ5c=
X-Received: by 2002:a05:690c:dd5:b0:8b0:f0f6:1476 with SMTP id
 00721157ae682-8b0f2072830mr9728477b3.15.1792240913503; Sat, 17 Oct 2026
 05:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-9-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-9-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:41:40 +0100
X-Gm-Features: AclHuK_AYqEiAssa2K-pWXq0FkMn01tjdPBVJj_SG34TGP3Ue9h2bEIf7lSpfcw
Message-ID: <CAFEAcA8pBUTVxb-CEAxmAUHBG9e4kEEwkBdJ_0Hg+ViFY27nWg@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] hw/net/bcm2838_genet: add GENET register
 structs, part 4/4
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Add the PHY "shadow" register structs (BCM54213PE PHY-specific
> clock control, RGMII mode, LED, and expansion-block registers
> accessed via the AUX_CTL/EXP_SHD indirection scheme) used by the
> MDIO emulation added in a later patch.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

