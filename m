Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2077280ejm;
        Tue, 2 May 2023 03:26:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bUdaIQVpqDRb8TndeZYRjKobX1sBj+hx5ilOdJQhmwrHVkKsvPUcaAzWhStu3hcBfJa7/
X-Received: by 2002:ac8:5acc:0:b0:3ef:64e1:ceb8 with SMTP id d12-20020ac85acc000000b003ef64e1ceb8mr21706364qtd.49.1683023171324;
        Tue, 02 May 2023 03:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683023171; cv=none;
        d=google.com; s=arc-20160816;
        b=ta+MrNSDWotLwha8FbNv93fCg4MTGRk3uuQ4IHSrkLzpqj7UVUMzejn9FUqgahjQrN
         v4bPtuzMYEWIe5Bd9Ihf7opqnQ8o6hMOKrw9Z1+RSiZV+zsny8IZPFQFPGSXMZbIxX2t
         /DbmbIlgM4PFic1xWTyPJZLOmGHp3Rzl64sZr3ZrBaF5X919MWLnRaMaGl7mBx0M9I5l
         NUGCFLzVRHNltt3JizyM1HvgoPyy7tF7W3GWttlN04qRzaTw00MH1NX2+2oBRhxCcCJp
         GIe8wrqBSNUmC8mgUV6CEX8i+TljHedj/Mu3KvaMiQu4ipNrrMqlUFi5L2UPGBQByLoa
         wKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/klol4QyrvvNYDBJIEPwaAk4DlWI6hoWLAWM4Qd4maU=;
        b=dABuTLLILR99khuJQSwLmqA81z6hgly189NQ+l+ZsCEvP6U2Opl8k/+jVDPejiVgW8
         CvA5ZMKMH2u1wP4ltnIwQCN9MJH1OmIWL9WBA+vyr7PS60K0JVNJ0NmLmGV3ExL8QhvJ
         vX58GYul9i6OYRdfFh3F+kLXnkXghpu5bo2VyKXdoDdibl2MSajuktjX1XilaSKD4/5u
         4yIRWoRLsboaTy/JHZTDtmFLDNOx73rqsYD40+1zQoodIOoHGdE8SnhRvJeSQ14RFcW5
         iGkK5D5lbXZZNA+ccDlvL8GgJLVVWWFBzXdsiFL9nF/Ab6oU7Aeusr3NcxoI2Uc1zeLA
         fjKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfCJIJFv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020ac859d5000000b003e63af1de6csi17550228qtf.574.2023.05.02.03.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 03:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfCJIJFv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptnCu-0001gr-6Y; Tue, 02 May 2023 06:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnCm-0001b5-QJ
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:25:58 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnCg-0004ov-2N
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:25:55 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc22805d3so4081860a12.1
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023144; x=1685615144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/klol4QyrvvNYDBJIEPwaAk4DlWI6hoWLAWM4Qd4maU=;
 b=MfCJIJFvGBiX9Iid2k6i8PM5gGYZklApd6LzfVNdNdZByZ3Gyf/ZpHt28+IZ/Df8Vr
 ydSgwspik7lM9EtZ1le2pFK63vFLnbZouCjF9XBQ/Wu64yOiD78+F0itgH7N24AwfwEX
 lMc2ueV4kKm2RvC+aYCCQ9H+orzpL/O3zVxHL4HkDVNfg/PYo672o34OugjtQQEPp/Q0
 aIgdwlyi4yBF7IQ8ealDTrtyWdpyZ0Db7PniMdqkUM9W2X13UHVdcwOIA3/hiLunncdo
 MjH0GcPyiZhCrfwx5i3bFBJc2Xq02oyw7gI9KPSiDz19QPDgwWENJfz8XwhnEWzrEdMd
 CdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023144; x=1685615144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/klol4QyrvvNYDBJIEPwaAk4DlWI6hoWLAWM4Qd4maU=;
 b=XKH67ViEqc3n90Mn5G9QEeXstvXdyW7k14Uxq3eu5FAFuFyEYwqykcX/eNztJwB/Bo
 1tlLGs+k+rGd15PTmIo++aer1Y35+nAH/pp0Q5CpRBSGX3RnRiWXt/HTEQdmZy/K3m6m
 zlYBh97y0Bs4F+dFI9OYOjV9Yxjw2fDkOqADo94UfwbZCEKwrheN+J8i8zDwV3+9WUi/
 GDpByOREpzME8H0qrHhIcH6iqjJFgcfqClcOzL/0HnvIQK9UVrQYi2inmvaLgOY3AbQY
 TBRUjRTM6x/pSGAwRsWzMTR3fv/VIZuP4xg8u8AvUaUmppn9xxqXRxi6/Ypp/HBEMce1
 nIcw==
X-Gm-Message-State: AC+VfDxqpBiup9Cbikzh6rfEKY6NyQEC96lb6P9ORZDXfnuJKnFHkpp1
 jOrir5d/p1gLAFdo21ApRXfhetaLjE8vFm4uMwI9HA==
X-Received: by 2002:aa7:cc88:0:b0:508:3f08:ea0f with SMTP id
 p8-20020aa7cc88000000b005083f08ea0fmr8768210edt.28.1683023144444; Tue, 02 May
 2023 03:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230424151919.1333299-1-peter.maydell@linaro.org>
 <a38b1bbd-1c46-3ea6-d7c1-f77e414bb6bf@redhat.com>
In-Reply-To: <a38b1bbd-1c46-3ea6-d7c1-f77e414bb6bf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:25:33 +0100
Message-ID: <CAFEAcA_Py1CA0Fijs5BEc5pbYGbm98ijonDYO8015zRyFYk0pA@mail.gmail.com>
Subject: Re: [PATCH] hw/net/msf2-emac: Don't modify descriptor in-place in
 emac_store_desc()
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HbzFMtDPiym6

On Mon, 24 Apr 2023 at 17:27, Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/04/2023 17.19, Peter Maydell wrote:
> > The msf2-emac ethernet controller has functions emac_load_desc() and
> > emac_store_desc() which read and write the in-memory descriptor
> > blocks and handle conversion between guest and host endianness.
> >
> > As currently written, emac_store_desc() does the endianness
> > conversion in-place; this means that it effectively consumes the
> > input EmacDesc struct, because on a big-endian host the fields will
> > be overwritten with the little-endian versions of their values.
> > Unfortunately, in all the callsites the code continues to access
> > fields in the EmacDesc struct after it has called emac_store_desc()
> > -- specifically, it looks at the d.next field.
> >
> > The effect of this is that on a big-endian host networking doesn't
> > work because the address of the next descriptor is corrupted.
> >
> > We could fix this by making the callsite avoid using the struct; but
> > it's more robust to have emac_store_desc() leave its input alone.
> >
> > (emac_load_desc() also does an in-place conversion, but here this is
> > fine, because the function is supposed to be initializing the
> > struct.)
> >
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > This is one of a number of issues that prevent 'make check-avocado'
> > working for arm targets on a big-endian host...
> >
> >   hw/net/msf2-emac.c | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
> > index 7ccd3e51427..34c1f768db0 100644
> > --- a/hw/net/msf2-emac.c
> > +++ b/hw/net/msf2-emac.c
> > @@ -120,12 +120,16 @@ static void emac_load_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
> >
> >   static void emac_store_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
>
> You could likely also add a "const" to "EmacDesc *d" now.

Yep; applied to target-arm.next with that change added.

-- PMM
