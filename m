Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E59C44533
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 08:28:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmSJV-0006A1-PH; Wed, 22 Jul 2026 04:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wmSJU-00065J-LV
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 04:28:24 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wmSJT-0006Ci-6k
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 04:28:24 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-81eff3ddba4so48771117b3.3
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 01:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784708902; cv=none;
 d=google.com; s=arc-20260327;
 b=dTHRJlpzBWWXwCwBnBhtfxq8plGlDKB+Pe0dqqgIOIvIsq52F3rXcj1uepyXpEC52F
 8smJvIlZQ/jyoBBmZpFDX5awJR59qg/zu3u2yjmEpDOL1KxQSfBpU7U5ErnC4SBLWORD
 VXw2KOmPE8Arr1QySfcAJ5L7M6bVBsg9Wv2gXeVAgS9zRWDFXnrm9WKwNil/Ts3fOgDP
 p2QT8WkLjJI9iMUyBLs7LZWtuVjwuxHUbLjodLSdyEi4GJpOZej3gVFhv+b8Vad90L/l
 8uSaHvrLd4QIIrj+hczKnTnu/M+2XA/Bx/gkyggvNmlk+lnwEbKFCC2KCOV/62i2MlH8
 Niig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IX4/AlWewffAWGWySoMQmvTyHnottXjg/RjxkYgUjK0=;
 fh=/NPQ4xS2Byy/FbyLCIcpM2jEqJs2YXIyydGpSeL6ouI=;
 b=o0xwLztSBQvfVeogItaMYRzo1mubXM7dgULuGgA71cJt9nCAgeAkVdNqeyNv9Khu20
 k8WE9aK8Q7+hg8vpGFXSRVtslJ1MPKdBBo1O33uAgx/G83L4DzTY/1H4lJIcGXytWGPK
 qXETV3eg2Z732aLQ8kwzHruDcfjNNB6B3VHqxJ581XGY+u0DOBvaWWwz/BqCmzLnvnEZ
 /sy3WSG6h4+WyPvC3BMmieU+O7Ho5K+vyy47gu9Vq4pcu1mH14EPWkYtJxldRya7K1hL
 0Yj3DJt1ut1ZPHcMh7OuK8EckwqGispNtnAaBMirczR6hZKtd6uODR51GOgTA6MjaRDQ
 oz6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784708902; x=1785313702; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IX4/AlWewffAWGWySoMQmvTyHnottXjg/RjxkYgUjK0=;
 b=BRUeQaAk25nXgirzDOq7pDbbMcUZe9fNGsby8TbHeaeOnioNeKf2cxBXQtGZR/wXlY
 H1mfre4rFeqvGVA6Vk1KCOoW7yhaaz0MtJ+Ng4ckNaLH36tHkqRG89UvoC3U+Llh85Lw
 IXCE2D1N10bsMoTlIXbj1Sni2Nyp+IvKbvDM4L0jPVDsAZN1cSC3ZbMasg2Cjk6HJChH
 /Lpgc4PfwONg2rcP15QHh5jJEJFvkmxoXufACYcwAP2preDh9lDhsoEfthLBfFTdtcMK
 oVgabmLCyuzRiB7iOMCsRcO/stNxqRmubnvPC4Q+St8Xp4HB57YatyPluHAYmX4xpYnC
 7r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784708902; x=1785313702;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IX4/AlWewffAWGWySoMQmvTyHnottXjg/RjxkYgUjK0=;
 b=PMwMmchRcRXEoksAKK3/UBhFRZdnbwT5n7p3cAoyoCWi8aAQEaf8AwfZCGCPmQZ2c0
 yQ1SNjIhUMSZZ3lMvAPrkmFHtvpVe/s8TyxZwDtjz6MIoXXsMxbJnhHlDRKOfTs+ii2u
 55cV2rlPGIuN78UzhPcxfURLtoUZ5ijaDNWjyCtJPYtrJqW0Hvsy/8dQJbI5GOCKMmPs
 XQD4CBrn+ls/oJVuIeSK8/QQ5L+NOpIRDsdQuxuvnXJ0qSFvOMvgaDrWJznILcv/mxBo
 cL2hPugBxvZUS76R9DoK/mapBFsoLwVNsvhnpZzWQlG7meehNmMNdAHMWMaYnF0RjJTm
 hzpw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqCJTQCOxkabIFHkKBgYtyoLe5mqvuVRfdpXt6lRDtdXXOKWrNMTLz6aJuW/odmQEp/efTcb2myAQ==@nongnu.org
X-Gm-Message-State: AOJu0YzrtZmom21ggmpxesUYW7f1vqGjOhsgBOwAmvAcvGpTzbZbvyhd
 +yXI5jSbnckhs0vAdxTXvY1Fm04TIF5hm/8KAmJ0CLrNd12sv9HNMR6dLzJL9JNCfDsDMVUJg+R
 sB/1tw+y5126P1GiWjSEpJ72WIHs1J3PFBBQlq2g2Rw==
X-Gm-Gg: AR+sD11cj7aAdK11ZZJ0qVMFYnKFoka+bW0gDglRFVJaXdZEpaL/T/WeTQMRXbr9fYt
 aItBzKv2wo/NUSMEsZwvR0XOMQWKXmzXqW3yjzd3amRkPeYo1Sf+9+n3GXQzDDZCS80cMhnwlHC
 qvYtuefBeELhwtSL1Ab4ymfS5CaVzIMf0bMNqWa+8FbIHG1eT/eJTwUItc8zEJCAxogwYsvXG30
 mDuKeJ3bYyKrH5GkTIhJzS6yn6viYU5qf5p+Jettx/2NAcpnzZ1ncVP554auFk1qgcIUr2Y4nde
 V618KDn5F8MTQLdRELNNeOxxlSzGDpnGXMQkuTYDeS0KRw==
X-Received: by 2002:a05:690c:e19c:20b0:81e:fb1a:f222 with SMTP id
 00721157ae682-81efb1af3b8mr37828467b3.23.1784708901775; Wed, 22 Jul 2026
 01:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260713064617.85374-1-jay.chang@sifive.com>
 <47fb7730-adba-419b-9c85-298ff245cce9@tls.msk.ru>
In-Reply-To: <47fb7730-adba-419b-9c85-298ff245cce9@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jul 2026 09:28:10 +0100
X-Gm-Features: AUfX_mxX0T5xPhbUX8OXwfAH3EgEtU7IQmnX98kAPMyM6sNvU75SeoXodvukYtU
Message-ID: <CAFEAcA985uQEASh4=YSvjYw_EBte+TxUfziFe4hsRvaREB70cw@mail.gmail.com>
Subject: Re: [PATCH] hw/net/xilinx_axienet: Fix PHY register 17 link status
 reporting
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Jay Chang <jay.chang@sifive.com>, qemu-devel@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Jason Wang <jasowangio@gmail.com>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>, QEMU Stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Tue, 21 Jul 2026 at 20:03, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 7/13/26 09:46, Jay Chang wrote:
> > The Marvell 88E1111 PHY register 17 (PHY Specific Status Register)
> > bit 10 reports real-time link status. Previously, this register
> > returned a fixed value of 0x8800 with bit 10 always cleared,
> > causing U-Boot to always detect "No link" even when the link
> > was up.
> >
> > Signed-off-by: Jay Chang <jay.chang@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
>
> I'm picking this up for qemu-stable.
> Please let me know if I should not.
>
> > ---
> >   hw/net/xilinx_axienet.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> > index 970732b162..9f5f65ecfa 100644
> > --- a/hw/net/xilinx_axienet.c
> > +++ b/hw/net/xilinx_axienet.c
> > @@ -103,6 +103,9 @@ static unsigned int tdk_read(struct PHY *phy, unsigned int req)
> >           case 17:
> >               /* Marvell PHY on many xilinx boards.  */
> >               r = 0x8000; /* 1000Mb  */
> > +            if (phy->link) {
> > +                r |= 0x0400; /* Link is up */
> > +            }
>
> Shouldn't we clear this bit somewhere?

You mean phy->link ? Probably that should be controlled by the
network backend. But that's a pre-existing thing (we already
report phy->link in a different PHY register).

-- PMM

