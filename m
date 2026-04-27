Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B3EFF885E
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 12:14:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHKqj-0004bz-34; Mon, 27 Apr 2026 08:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHKqV-0004aF-SK
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 08:13:53 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHKqU-0000uW-Ci
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 08:13:51 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65006c99d38so9069121d50.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 05:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777292029; cv=none;
 d=google.com; s=arc-20240605;
 b=QS5GHykaiMCutDhIvDvjcNHHuVt738uJ2QkLUjQApFpuar7/8lI93nx+mI+x6FYw1F
 p+cMjWBc2LGrPo6wlEAxz43gyY+mjIN3L2Z4gX6pSxDv270E+EKbKsVEZgGT+0w5p22S
 iE5OTZ04Ka2OuLdD4i3n39Qov48qj8QSHFTnJf4R7f+cGd61wSIdxlpB9xd0bJqKG4wt
 QnkAeHS+LVsg+6SDM5cb8OsF/UDWBv8lBLN/RAQub8dJt27GKIgisd4D+dIgvOBLHZ/V
 h5zPL/bmI10kWqVTgFcY4jJ0dfV949JrFWR2w8L0v35bS4CjNusNvcM5d8mJIg8YLUo/
 1azA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/mpPB4Ix5xE48TU0EQCpMqXtOuf+xSKjioAXXP4tzYY=;
 fh=YY3+JtE3RXYZ5vMbsfqAYRDkUZcS1/krJBHWIwPG0NA=;
 b=d614+IM7oQI5eMFmXZyf31Ci3vdqhcagfQQrwA1HHceMNCJT5H/r5HONhZwpIIZkgN
 BlJqQKLLhGEV9weUxI28Uk7lqlhojEJFpdVmxnYX5KU2IR9teu2guv4ieJzhxIcKiHn6
 DdqJINZy9o7MvME2jIlIbcfFZSRpMXOEG8WniIUtJEAxLwKGI2NTumsxOVrmX/Xgal9/
 rEbBDIrDkweWQJ8h0EQlBlSv1fA/tupJGf65TmYLJiefIz1xgW/GkCQYjq7Y75b9WGVe
 BIWZVdsrQQrO7eFysr9tUdjRZd4DP9xK6cFRxJi/FjAwN2FybceKW3qIx2kfmBZ7wyyR
 Qy8w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777292029; x=1777896829; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mpPB4Ix5xE48TU0EQCpMqXtOuf+xSKjioAXXP4tzYY=;
 b=wzwRQxkiQIcXwUp6cE/mEysZalzWxVOzo2qTz0jyAHLdM6aI7xIJl8QGUfg64cntXQ
 LcjGk+xON/xk2jlvG+9NL65BqTtqgMppzKo0lxbNDarx5wh/R0OS1GMRVmD/i9r5Or63
 g6dWwV6cCr9Mjf9A8ZFQkWimAVfumIA65t+ofw+Ny8m4bYjmq7cF6fg5sDk7HJzHEji0
 +B6uLgl1vSzyeB9bSsJF8uuB1f63vzZjpmsMEUYgz2mCUICZYvURnX5ZsiB1U8AM+uyD
 03V7EbeKVKT222tcZ39IQY4zzVCtxVpTzrCyBxnNKbFRJsIgveORzVuELOQ1pb3RZuq1
 PeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777292029; x=1777896829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/mpPB4Ix5xE48TU0EQCpMqXtOuf+xSKjioAXXP4tzYY=;
 b=A1QONSmNx4lIDDPrifKG4b6bZ3Qpi7fRMBALWy6f31usrSrfsth3IZt2aDyjCX/y9E
 fJgJTLScUWUK+e3Clu4mvkLoX56Iy6p8g+GAMyxFJsNJue7Lid4NWqfGflgs4uduzONd
 XFiSvbwTyjp9aoa825HDFJjj61GVJzFW9MNjDkZyPjqQ97J6KmAHU4JkydcKD8YUl96V
 bCmW/IcdIiZxOrRI+y8qOfC6Bdq/etNhTic97D4aP3f4z3496I3GSZypunGrZATY3eZd
 s7goYG3uBhrHOw/MpURrOrZJmHuDZsLsL6iB5iFlVGtaDRKJjdhSwMWV9QGDZhzzZyaT
 w2Jw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ElGHPRiCoX3ucX8ozf+8qhl/LSYuxdJ/aEEkZHtlVxbx0Qpcq4t54OZzsfLAXQrX1L9WdIS0MHQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxuq8A9T3PSjynYHkQfC3RdvUAIausfTICylPGrzLcOlM29pdjF
 FOm8wAa+ok2z3n+0t8t1A3PluAAGkMCRkTdD5Yfjdej9IZY/Yr22vqveKgxcW5o4of28cOQ7D5e
 UVi2erB6i/s/RjZnbo7pKVg8lb7cp/L008PAmQ21Zbg==
X-Gm-Gg: AeBDieskcdqZpQbIZAIsmuBMjdktgc/g7DeAyT94B3xxdFMHt2lTJBTwRDpmtGiQjU9
 QMtMwgDWTlUmac3mJ6HDO4mJUH1py8l+tvGWPraUBi3zXO9ERmP+mxiOz3+3gzVfBwS5SBtfqq9
 QPqlNtbi7dvpxqoPryijsxI//wJunOKGT8CYBIkpq/BrOdIXtAFAEly6r2f9gEsT2n17RatEoY7
 /WILHj/LjOhCv69LaWdfXNbow0PVaqqeucZEkIZyIXuzkJhIzrxrLR38AVy1xRN5Ya34j8JcMhi
 KiHnEYMdYQ1F1qRuvdcVsiwDlucUebtaWiQ73nSlo0JG0GvF+zuglqjPeK7LfB1ZS7BX9sAS0vI
 j2A==
X-Received: by 2002:a05:690e:400d:b0:651:cc5e:b8d7 with SMTP id
 956f58d0204a3-65310859d9emr40894427d50.22.1777292028942; Mon, 27 Apr 2026
 05:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-3-shentey@gmail.com>
 <CAFEAcA9cfiDB3+=K+MsHptujVhcPexwaf+1y8kHaV692ORAdgQ@mail.gmail.com>
 <A91F1062-BD9E-45B4-B0C2-12354C356A71@gmail.com>
In-Reply-To: <A91F1062-BD9E-45B4-B0C2-12354C356A71@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 13:13:37 +0100
X-Gm-Features: AVHnY4JyPLZckVqrXZRMRBkmijYqNWu2Tkm9CD8bMajRKFQ_NWWMKACul_02ipQ
Message-ID: <CAFEAcA92UbkBiMZTYaDUnOc__w+LEhfDw3=rWCxHRkECpLYi6g@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/arm/fsl-imx8mp: Fix parent of ocram memory region
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Mon, 27 Apr 2026 at 13:09, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 10. M=C3=A4rz 2026 10:00:31 UTC schrieb Peter Maydell <peter.maydell@l=
inaro.org>:
> >On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >> Rather than having a NULL parent, let the containing SoC object be the
> >> parent. This cleans up the QOM composition tree a bit.
> >>
> >> Fixes:  ("hw/arm/fsl-imx8mp: Add on-chip RAM")
> >> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>  hw/arm/fsl-imx8mp.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
> >> index 0119a18416..839c925e4a 100644
> >> --- a/hw/arm/fsl-imx8mp.c
> >> +++ b/hw/arm/fsl-imx8mp.c
> >> @@ -671,7 +671,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, E=
rror **errp)
> >>                      fsl_imx8mp_memmap[FSL_IMX8MP_PCIE_PHY1].addr);
> >>
> >>      /* On-Chip RAM */
> >> -    if (!memory_region_init_ram(&s->ocram, NULL, "imx8mp.ocram",
> >> +    if (!memory_region_init_ram(&s->ocram, OBJECT(dev), "imx8mp.ocram=
",
> >>                                  fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM].s=
ize,
> >>                                  errp)) {
> >>          return;
> >
> >
> >This is a migration break, because qemu_ram_set_idstr()
> >includes the qdev path of the owning device when it
> >creates the name of the ramblock for migrating it.
> >But since we haven't released anything with this change in
> >it and this board isn't versioned either, that's not a problem.
>
> Do we still need to catch that? If so, how?

The code change is fine; we just need to mention in the commit message
that it's a migration compat break but that it's OK to do that for this
board because it isn't versioned.

-- PMM

