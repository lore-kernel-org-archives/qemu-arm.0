Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1593794lfa;
        Fri, 30 Oct 2020 07:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNnwOHtsOGeqEPdW4Qs+BTaX3YKOl9nlcwumiTfXoZIiRRqxILUoKWD5msiJSL3yFdtZNM
X-Received: by 2002:a67:e954:: with SMTP id p20mr7466211vso.20.1604068569263;
        Fri, 30 Oct 2020 07:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604068569; cv=none;
        d=google.com; s=arc-20160816;
        b=LU92bKV7nl7IvrMCBV8xIsEsSjFwqeP6ykFC5jEl0diaKDXm3SIrC/a4wQdFV7EZ58
         T68GHJFZmBaWbNEPw2hupdOxYr7kZY7sPAr3RfIZ+gduOEcDHD8s16JwfA2n2BS7biOJ
         Iw7FpqwX/HU5/x1VfIqJqqRvKZpeVrDFohVDF8MFPvHSlSbag1kgeeidjKjJGBwlL75a
         RnFvh8gYh002uTxPYWUj4tFxWd7Ralsgus+T+1A4r/NyezCbdwS/SHTxhM4cCE6eBU7S
         SyX25eMW5hgdSCmtKRCdOjlfLHw46xf4TK0C116aqunhiikVslyD/UpHKXojZDyL/klm
         L+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lA++Hl5Ff23cexy9HPHp57mTBkMdUE4lxCl2ZEu5RIM=;
        b=VrYX+b5+mgQ/rbgYGVFC6Vs8zQRcf8IPb9+v2IxQdQSOjk8YDRf+93+EzbuPhB5nfO
         Mhatd59pU5q0NrSqgoCRA1pCP7If4W/dzsZ4gK3whSviN3cyYo7gJxg2Ec9/KCKMUDiV
         K7C4rE69Tm0Mp9Rf7Ppq0L8GhqeoZQ2hy7HnPT4FEIufFsKBjh8O4uQMZSfU/VRmSIT8
         K4ynTCAOeu1xmI93XCRq/j4xf9iO3M1S7X9+8o8Jo4xcLLldflJHbx/bWXtMoYXLDDna
         8ve1+QmRUHtMbwnLPhJb68JIr2fqZX1AmcFNjTkZwVuODY/x055+Dr/nXACrlS/Gps16
         670w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FYQYJtbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si1143074ual.36.2020.10.30.07.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FYQYJtbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYVVg-0004qm-LL
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 10:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVVR-0004nM-Mz
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:35:55 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVVP-00020I-8K
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:35:53 -0400
Received: by mail-ej1-x642.google.com with SMTP id o21so1889794ejb.3
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 07:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lA++Hl5Ff23cexy9HPHp57mTBkMdUE4lxCl2ZEu5RIM=;
 b=FYQYJtbqal6X0CHAm7FeiWXGeqGqRbSLTOTh1aDXPr/tlVrKLucN+qHwwX53e6ItMp
 uvnyA/0L++AZYAXpSmmbcxfLM7m/D4cwKXMMVejo6OxPpLHqDojWmDwA5xgR9F+RC9TE
 1fHoAi4hOo1etOJaE6eE/G/Y6tSI4lkOv0huUguz/uHBuqSLcwxxi7ppm5v7fr5r4a5T
 VXEqa4j7B5OZLs6y2Gtj5VoMXVJj6iVvC1Po3dQ3OoAc3CCZNYvShUgXZtzYxCGaVN0s
 +7C8N0H80vNc4v489ZrzalwxIdSIuaObjM/2NtGvrbAVj/v+0J1uvs6BCVs6EkZK4MJd
 pxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lA++Hl5Ff23cexy9HPHp57mTBkMdUE4lxCl2ZEu5RIM=;
 b=AaiMBiqwb9B/0EdSekNn5x4zrq66imJLbi5Zx1YZkm1CXqCidv9pwG3h8zaYd/i97N
 6kCbtAvLZ09bmxm7aphcXZdDeifv1TA6D5F0hnc5YDPQFPBgTHk/pEz04xWuodAj+IBZ
 MWL+/ObEuVMB9pG4xZYAyTLyb/iJEDjIeEqzpO5DvOsUvsed+e8ZZaSXW/ivLnITCwdT
 YeAuTWC3vH1I0AYDM8NUQDUpM1Ro0bbgZJKcC8s3d0rlTrZa4issPCpe7YfuWn4daiiW
 hNzN7XYd/IuMZRRDWOT7B+C3yKJsWokO+XufOc0HBDUlLZiZMICjtgyrexMXZHWyQ1Ww
 JF5A==
X-Gm-Message-State: AOAM532XJFsWW7f9PykUTd4IesYva7Whh8ZwGCa+OH4AcJKeGTKcZ4wQ
 o0kAyH6Nw/QjIjCurMGjubXm+fzVeOPW6INhsuarRQ==
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr2669056ejb.85.1604068548940; 
 Fri, 30 Oct 2020 07:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <5F9BE993.4050406@huawei.com>
 <CAFEAcA8hpb2UVd3PSY4XuEpKYeu1Am1+41DQ=gN48xbAv281TQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8hpb2UVd3PSY4XuEpKYeu1Am1+41DQ=gN48xbAv281TQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:35:37 +0000
Message-ID: <CAFEAcA-WTw-0EvT1REbTrtgLB9sBbnJBuNW9LMh7eOtsXtrDTw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KQAA/npJZLAp

On Fri, 30 Oct 2020 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
> >
> > In omap_lcd_interrupts(), the pointer omap_lcd is dereferenced before
> > being check if it is valid, which may lead to NULL pointer dereference.
> > So move the assignment to surface after checking that the omap_lcd is v=
alid.
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Alex Chen <alex.chen@huawei.com>
> > ---
> >  hw/display/omap_lcdc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)

> Applied to target-arm.next, thanks.

Whoops, spoke too soon. This doesn't compile:

../../hw/display/omap_lcdc.c: In function =E2=80=98omap_update_display=E2=
=80=99:
../../hw/display/omap_lcdc.c:88:10: error: =E2=80=98surface=E2=80=99 may be=
 used
uninitialized in this function [-Werror=3Dmaybe-uninitialized]
         !surface_bits_per_pixel(surface)) {
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


because the early exit check
    if (!omap_lcd || omap_lcd->plm =3D=3D 1 || !omap_lcd->enable ||
        !surface_bits_per_pixel(surface)) {
        return;
    }

uses 'surface' and this patch moves the initialization of that
variable down below its first use.

thanks
-- PMM
