Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B841ACC6B3A
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:56:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHJ85-0002Mj-Qy; Thu, 15 Oct 2026 06:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHJ81-0001y1-M4
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:56:07 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHJ7z-0008KD-MP
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:56:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c20ce3c118aso815893866b.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061762; cv=none;
 d=google.com; s=arc-20260327;
 b=OWnRo9U1re9D8NMN6ekjn+Kf87nWqtQrYIP8zko/Frtcxl9524z4BkhmTu3AOfmyLY
 BO3yk3otRCPK/4tH2Xr0yrvWUpa7N8HSUekk802T4dFZ9l/lZoKwm0zRu130PoaGcXr9
 tAc0FIZb58ap0Np6u8XcwfPebQ76d/FdaT+s5E7YCZgBHx86F4iVW2TUGYrlPjSAoxPA
 tqW7Xzj4Qc62Rq9HIduwpTtgVkNQYUiqa0G0cz60dVAHAdp8c5Urdn8uURPdmPJYIi+U
 R/j6M0fC6R9yI+UJNkaFGWDgJxi+RA1F4s1/WjJ3e556RwGYs58XUU4sMuizk9532GsY
 HIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=oScWekFJ96snPBtgZ523TK9+Pu6LVvXGNcKMBHQ6H/Y=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=O+3dx4r84mkv65VUK2TK2HiAQ3Ok1gXGEBWWWIFEt0MtdxxbrJqhEn9DYSZwJ4nbNZ
 tVSxC2/wu7UUEUX07NbZpkR8izQS75MbFaC53RY9cnwQ799tKSJ+gow4TAyjch5RuWBo
 PeH469gv3DuImXkqodxjoWyaReLD0d431+mJZSVQ7hso/oDdjcFIeLKsJsEYViQDxhgj
 MvI//4ZHNhaLIFauchaJnfnKcYnSBG//Lp2hc5tFwxJdCMjSPY+7/YMVFNnaFDPhvb3S
 zOiLxnlQjva1GZ/h0fIdmU41dZYagl6JYZb3URHBZg6qCT64CIEeSzk7aF75k4HsZZ+r
 cJUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792061762; x=1792666562; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oScWekFJ96snPBtgZ523TK9+Pu6LVvXGNcKMBHQ6H/Y=;
 b=cUKCNj9muaxXPIm9347f3RRPCQMjEzgETQagMriVjk1JawIkO3E4hnn4bY0eqy1MyL
 ZLJY/kLnUReNxn/aqnKmGUJCbbfGWw50brjYjLdAXNQyGqFkdaE4fsXaC7YtmxDRkk+k
 +hgiQLW3mgPjKWYWtmX9Z58qxGOpVZNYoHrbDG+oI+y0FKjalYC79OvMxXO2faIACiSf
 7AjHLqWE6ezIghm4r6wEh2gBcZVP0yeqkju3N9aZcHbSxPJ+Zuhciu1FCQosTRp6CpJJ
 pk9UlGNjZM5UcSaHqjrs/MhCn1HZ+W0glaBZEy9mSk3ycYHFtVnSYRi0Ip2//MZCSkZw
 Z+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792061762; x=1792666562;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oScWekFJ96snPBtgZ523TK9+Pu6LVvXGNcKMBHQ6H/Y=;
 b=Bf3G/NcZghOH87BY3veZHJobnLCDFE8H08t8giEAwtCnSQnNRJ+yVIWwYSwRpRf6XK
 trpHsec8vXfEW+AbQMemxLk62sLK62mIwBfpi4/netsdkAd/1QCAZdtSEBgljeKJ1Zxv
 +ztz4HpUzzz4u5n1creFkhtkqcmbNJhfhLrXN/HUgmCyS0Z3fjEmGDWArjbrAQ6FWRxp
 fM0DIuhmMRtk+FaxM3EF2zWEWYOPj40v0mTmDR6mtPSm4BZQlzkQI9GRl84NBoEUqWlT
 0VzzKLfQ/2PET9mUK/1nwg9E4QRu/vQQkfMV8kPGrqlED4bZcmIBpyIgHDMeFFe+jm6f
 JPDQ==
X-Gm-Message-State: AFq9FYKxyO9QOTJT7M3Ebb8dSgTNlgpFZSQjz4rlwyantFogV0EnRdVk
 73ndHqmKqKmagHtXqPciQBY6huFKSXJaCkcJUg4OQ2fXP31BUGaEEGPPrhy+7R8KdIlKB3loegh
 dj/tFp2wDKQ6obweqQv/ReW5RkwBM5lBJRfxxnvpJPkT/3O90rufGZU4=
X-Gm-Gg: AYBFou0NehqvG4XhAOfTWgiWerW6SWOh0lHJ8iuzMPEwZEQQ1XLSlTM/kGczqU464JA
 kGN5wVaq3S/Xy7MetwfpDZhNgBirZmJ+MuLgKp7Jv5fCxrZzj+QYkDYKbedJkjawpFBD41/U30A
 G3PxriTngMHZ0NDCNeeBLeCbkTLon0iar065y/8tGV5e+mL1XFSfWoK2kb+EYWMyq+1wH5f8230
 s/hSOeHnOIZwvoa/i/1r/f6gkW0/Vyiwu9o95NSe1Ftxh0X/cSCooUe5LdYC1soVeGUv5uSTTKa
 n+gRkT860aylBIOwMsVZnRQr7GbyQrYvmmHwjDmc9rGhrslmPRl8C2qOg2SPtIvMrUqBKzDF23I
 nDFfGQsMhME1U5nmN2UhYMhlNYO7F0OBlSQ3a3So=
X-Received: by 2002:a17:907:1c86:b0:c2d:b9b4:f4de with SMTP id
 a640c23a62f3a-c31a7065cc3mr1937537566b.18.1792061761789; Thu, 15 Oct 2026
 03:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-63-peter.maydell@linaro.org>
 <047c7b05-ca11-4194-a6db-c0dd2f4f2b2c@oss.qualcomm.com>
In-Reply-To: <047c7b05-ca11-4194-a6db-c0dd2f4f2b2c@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 11:55:46 +0100
X-Gm-Features: AclHuK_OztquhqhUEscw50NZkYUdNCx9w0OkfwCiIfaCDB2YhVWrFmBXXQ75xWY
Message-ID: <CAFEAcA-Kjrp43ZROn9a2HJtW-FckAgOO5yNgODvck5CWZnAxTA@mail.gmail.com>
Subject: Re: [PATCH 62/86] hw/intc/arm_gicv5: Implement IRS_VMAP_L2_VISTR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Oct 2026 at 11:25, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 13/10/26 10:39, Peter Maydell wrote:
> > The IRS_VMAP_L2_VISTR allows the guest to make an L2 entry in the
> > VM's VLPI or VSPI IST valid; it is the equivalent of what
> > IRS_MAP_L2_ISTR does for the physical LPI IST.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/intc/arm_gicv5.c                | 76 +++++++++++++++++++++++++++++=
+
> >   hw/intc/arm_gicv5_common.c         |  1 +
> >   include/hw/intc/arm_gicv5_common.h |  1 +
> >   3 files changed, 78 insertions(+)
>
>
> > @@ -2128,6 +2184,15 @@ static bool config_writel(GICv5 *s, GICv5Domain =
domain, hwaddr offset,
> >                                deposit64(cs->irs_vmap_vistr[domain],
> >                                          32, 32, data));
> >           return true;
> > +    case A_IRS_VMAP_L2_VISTR:
> > +        irs_vmap_l2_vistr_write(s, domain,
> > +                                deposit64(cs->irs_vmap_vistr[domain], =
0, 32, data));
>
> irs_vmap_l2_vistr[] typo?
>
> > +        return true;
> > +    case A_IRS_VMAP_L2_VISTR + 4:
> > +        irs_vmap_l2_vistr_write(s, domain,
> > +                                deposit64(cs->irs_vmap_vistr[domain],
> > +                                          32, 32, data));
>
> (ditto?)
>

Yep, more cut-n-paste mistakes; thanks for spotting them.

-- PMM

