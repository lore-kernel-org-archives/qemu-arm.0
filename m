Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE25606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vQ0iXrNi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMR79-0004Z4-Oa; Thu, 29 Oct 2026 10:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMR6s-0004Xq-7j
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:28:06 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMR6p-0006aH-4v
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:28:05 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8b0ca1ebc8bso18928657b3.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 07:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284082; cv=none;
 d=google.com; s=arc-20260327;
 b=QlV0stsalnDVPvwj9ijFnJciLTetPGAaRp1pTbZ764nWgStqY4q4eABn5CHDzSVYme
 9etxSCncwTY6W8GQh/+bFj2edPyuuDDOlddtYW13l3UP8Ki0ERg51o6N/mkWLXpwDvd8
 A1/KMPPnX30Di9vfWNH/1jpLNcLlSxFqbM6RFxhzEWkoDi1+ZNM87ZRtceo/WA2GiPdG
 lC2W426KUvQAC5fJpzrwOpPxrZ8v7OPLx7BVmRzH5r+DwsEAh2qjzbfeYjYttzkoWBmV
 i0q2yyABetAfHLvPrWqIEciosvVuFO7GygbJzbgXN/Ka2bQi7fCWPxxp1spRrD7Z9CLo
 xXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HD1coENdng4AAsY4IxTWez3IUQcp/V32YZu+Hlw2Sjg=;
 fh=On5YwyTQPl5wJcE7+/594Euwsv4aOxVGK/NDY/9Cb4s=;
 b=Q5AIWrhxcpmut+CGKEwc7ahKSWJkYcjmRoz1XVwywhlDkzGE2ojpusZs1s7hwZSyqF
 s1LPnU7lz/+dxTDMJ6C8oyqsek6rLyMdfXyZvDwkixEEDPfUn0M5meBukD3Vz9ixVBer
 LSA/L3lLSIIYZAg8YIzhOYQh7HJeZrGlppOhU5ab8SkmqlqhP2f02EctzWs6T2QxNaef
 PrC55ka/Yy87PoTsRsnmGbDlRy6qVDM5vt6H9MjbWKU5DuyTEcQucWIJtS+XwuBlXHED
 w+xnAeNs/Yldd4meNOUjAzmWseSCA+GC27sivw8vhcck+i6Xd22Yr6wdcO3vAhyrp4W0
 JA6A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793284082; x=1793888882; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HD1coENdng4AAsY4IxTWez3IUQcp/V32YZu+Hlw2Sjg=;
 b=vQ0iXrNiy3WjFscADRZb9oSqQRw0+g5mKQyurbi0JtR0B49NLUw2imwOOaXQWgaQer
 mJRB48yRcIfY+A5366ZAI09tIdBFaMoz6yu442uQ8fFbYbtCsDY4TK9Y5ybprjC5+5/I
 SK/0+/FcTA4qmtPiVS1vu3DVBudY26pujhAd/phjSbLc+Nz8AEJxGFUweBHmtWFoyVK+
 3cyy15JvpT8zS5nw+dG5BBfgZGdhehzXQ6FGgcqOv26FdCLuPoBzmE76pFAG5DqO3DZP
 QU5gxBy5lR5NWScqUOAWN3ID2hARkKr3nJe/GpTFwhzafXfihOMik28ZDS/XfVH1x7hU
 yDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793284082; x=1793888882;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HD1coENdng4AAsY4IxTWez3IUQcp/V32YZu+Hlw2Sjg=;
 b=kMEU3XFFa5HjlQOPzGh0pT8eyw/rwl7ewJR9cxIri8G6P1tg4rVpTQWTYsUjyGhzI/
 9dVwSqQ2cdDNqx0Qw6nNc3KOhT+fyNC67pnaHaDy4k024z8/73hy4pGWs5bqhBqQ4tYW
 smutEv6x24o9VsOZTY+AurCH+70/vHJkDkhZD2cHXj+UApkWgIaMmS+4tb13MTOOX+sK
 t51t+bysVo4wnSL4Y/o9+odxZGHKrSOd9W8C7l9PisW7cIVDvA3uvxQPvPsj7FhpS0ky
 fwyQc9lrR8qA2Y23U6O5rmbDb0WonCwGNFkvB+ZG+46kIZbsqBH61ewovU29xYYYorRn
 K3kQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9tcP1iuhT/snmQxVU1nKxt9bC9dZZk8z24xbcz8rdqNbNlYU/SjfjucevOrAufTyJj885xtaEOg==@nongnu.org
X-Gm-Message-State: AFq9FYJQbG23cM2nLRfXAWyh92HiUYbeL06OBsDi0wiYsmxytVqTqeO7
 HHPXTzrs7WZeSsiCi1z7/NaKG4Td4iDULKLjz9RRJ+4ljQyqL0qUsp0bRc2S/L/sdzWwMuSfWMH
 KjMejOtYo2nhtkAN38NOyKXypX/IR768WmmYysMZLGA==
X-Gm-Gg: AYBFou0gykx3kA1QFsGOggYo897Th+7Xo33FiSyMDCyvW6+iVEDvILa4BNalCVuemaB
 PXuPGvdqHQoAomPwt7hEfFJfumYF2plZ4X/QkoteCvYfpygDpRUDxAUZi0Jy4VTNNhAQ4NKJjGU
 KzmCVYVMNvSAX5RhPr0yizR9O4ScgrpVd23BiGF62JebewHtuLKr7eTEfXiSn18V6pRY01IB3fP
 t9IFbYXpUSV8kwiblYjFIuGYTNw8ozIviiysFwVneHOTgOGEmCtaKncTMgv54vaoh7luMD7j+wy
 QGnSnZvdcS3n4/n42JBlrZ4aG/phU1WBp2FhxsoPwEboGPLxT2NNh+ihDY7mdpLw1Klbp769swe
 jSZcxrrTjXhXt46vj4kfvHItyCs9VVIPDHmpMNzy1Hlp8fIZvoK7BgUDgMitLNmtbxjBZCcIC2Z
 Lawob5SfJP3WQ1pp0oa/8c
X-Received: by 2002:a05:690c:e3ea:b0:8ae:b617:7138 with SMTP id
 00721157ae682-8b1b5d023fcmr40702377b3.49.1793284081414; Thu, 29 Oct 2026
 07:28:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027120135.53048-1-mohamed@unpredictable.fr>
In-Reply-To: <20261027120135.53048-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 14:27:49 +0000
X-Gm-Features: AclHuK9tCGDod4pQB435_uszNhfj3bFbQMeqe8xtHC9kP_n7bodYKh4MTcZTI8Q
Message-ID: <CAFEAcA-=bOxmonNOYC2_1MHDrdof6eciYrehJRDfWx_7kYsJmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hvf: arm: fixes for QEMU 11.2
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 12:03, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> v2:
> - remove GIC_ISPENDR workaround: currently under further investigation
> - simplify SME save/restore patch
> - rework the CPU reset strategy, with also taking care of the GIC CPU interface registers.
>
> v1:
>
> - workaround for presumed Hypervisor.framework issue
> - save/restore SME state only when SME is on for the CPU
> - add ID_AA64PFR0_EL1.GIC sync to advertise the system register interface

I've applied patches 1-4 to target-arm.next; 5 and 6 I left comments on.

What's the status with the apple-gfx compile failures on macos 27?
(issue #4486)

thanks
-- PMM

