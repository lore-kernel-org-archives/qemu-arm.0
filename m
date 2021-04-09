Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1679973lfr;
        Fri, 9 Apr 2021 10:21:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvAuxd0fexXTofPU1zyu/8B4t+D2o0KJ9amxZ9IzvJbZJe283lK8Y0d5+RFp1s1oPML0sW
X-Received: by 2002:a05:6e02:1526:: with SMTP id i6mr8792523ilu.270.1617988897024;
        Fri, 09 Apr 2021 10:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617988897; cv=none;
        d=google.com; s=arc-20160816;
        b=fwzCt98aB42IB0HL2Bz3MbJ68fXOtpllY3RubWUmTvndGbFNGmukfeqfCyzyOAusd4
         /VkMKeWZ2g2buWuEujvpGVOzy2qhk1LLs61gKHvu99kxEAH/7iHrLI1H07TEJm6bUJq/
         AzT226BDGgjUlqPOzvu4s3KE+zmq1O+mtLeL61mN5u4d69srd23sQZuZoKjSA6ljlWlz
         ahaLsJ1f8V6a4G8ALUnWSYMFNb1Xxymi65WOQdNsyWoZlrLKtSvV7TiyOFUUWtlS+Mn9
         O2Jc+FpQHFu5F7Hr8pCJLcwX4bknWi5fXNNB48K/LZmDkYnb9y0kM64ra/vHljbA5q3I
         hXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hzmajchtVFCmXOpBshjeixJ9hUel8QSTHSuBEmd6hzs=;
        b=zJAV8tiZeWeRbkTVWbD7CFASJTAxzWrCw8WoxnTJuWqJXploGuV/L/romwUoyTzxFr
         SPRytgzY0Rr+30oJXZ0ROOlZy43LawVWHg/JPSbi4Sz//enjmPwwoiUl9olnWaK2AJuw
         USsbngZI+uXBPmkGwugQaLS0GiFJif7nTSMThsbY+fYnMV7YKYLEuH4gKkyOhwecslvq
         eo4kdvofbeuinsJVVhsThhIyi4fn93Lp++FNoyD1eAlJcvsGjZWN0GBAaFI48c/7WKR5
         OYA2geVwtvThCgQujJygq1KGLcoSG8bBiKzV4UVmIozYFRUt6GmEOSM+v9myYWKIHyWi
         by3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=pgBzsnEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si3098498ilv.154.2021.04.09.10.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 10:21:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=pgBzsnEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUup6-0000vr-B0
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 13:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUuoy-0000tY-HO
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 13:21:28 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:46006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUuov-0001sf-Ks
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 13:21:28 -0400
Received: by mail-qk1-x729.google.com with SMTP id q3so6524969qkq.12
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hzmajchtVFCmXOpBshjeixJ9hUel8QSTHSuBEmd6hzs=;
 b=pgBzsnENr97CpLiUAqLGPjUeSiXvYjpvpGbcod/jhz1hAQes9LPonXrsC84J1FfL1m
 gnPl7gffEPugFxDsFOrmKgbWwpnqd0CuGEIR3huWKY2MH01Q4FbOj14xVWvv/ahyHicl
 WqGQhL+BVRQd/dwDlW3STr0fZwOYq5GOdOmAk+GXpP4X9Q1vLV7YUwHmVn3MfE5j8y+K
 JSQv5EkzHXdvk/dP7x+D3mtUPx1c7sjBVwJSlLP46Y7AF7nKMMWTlc34mdXw1W0sANPi
 XxQ9M3hTWDx6jMmzB0FNK9XCmycr6O8VTR86no1YJgmlpi1rqU4K0hvLZsnRCiSecfsr
 mKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hzmajchtVFCmXOpBshjeixJ9hUel8QSTHSuBEmd6hzs=;
 b=A422xX7yNiWxMGrFuOmT03sJkJ4HsWSw7WD5zRONyn4aJg3d9rOwQync1lOYb232fR
 Fftfs2luWhEP/tZKYiBRQrURXqADdOZUxESs75s1D90KH3Vy8B6QFIWMUja2xsIlLW2a
 nRIGZcKEHxpvcTuCvZfXnfuCBW6WmifznPjklTGOvNhQJMFAI4VM0zLtNS+DMlIHGtMq
 dFY3FqkkvVylo0rckuN0i2dZvJKV7RFx1sBngXJyJxtYeai6Yx+7fE8cFtDUzBJLnTT4
 ZdB1ufbyXPoo7IcjD2sex+iA9ST91+cw/Q7X+fje2V82MW6FUhDm7iA/Ast/eMi4StvY
 0q/A==
X-Gm-Message-State: AOAM530/NRD4A9fJQFINkJWLNy17Ror2YOS0wP5KpL9l2GdgLuGhROnr
 MktdafuWhI5cnmUAWGnUL13VTX+RghTEfc9Pth8Ftg==
X-Received: by 2002:a37:8c1:: with SMTP id 184mr15374733qki.472.1617988883301; 
 Fri, 09 Apr 2021 10:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
 <20210409162545.3705962-5-venture@google.com>
 <01f6f4c7-9f08-45f5-3e0c-b692c77dc4a5@amsat.org>
In-Reply-To: <01f6f4c7-9f08-45f5-3e0c-b692c77dc4a5@amsat.org>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Apr 2021 10:21:12 -0700
Message-ID: <CAO=notxOYxSyVDA9J-uOBio7d0PByvGLgn40GHbU-yQRpic1Jw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/i2c: add pca954x i2c-mux switch
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>, Hao Wu <wuhaotsh@google.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=venture@google.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kX+eMvt8FDs

On Fri, Apr 9, 2021 at 9:51 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi Patrick,
>
> On 4/9/21 6:25 PM, Patrick Venture wrote:
> > The pca954x is an i2c mux, and this adds support for two variants of
> > this device: the pca9546 and pca9548.
> >
> > This device is very common on BMCs to route a different channel to each
> > PCIe i2c bus downstream from the BMC.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > ---
> >  MAINTAINERS                      |   6 +
> >  hw/i2c/Kconfig                   |   4 +
> >  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build               |   1 +
> >  hw/i2c/trace-events              |   5 +
> >  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
> >  6 files changed, 325 insertions(+)
> >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
>
> > diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> > index 09642a6dcb..8d120a25d5 100644
> > --- a/hw/i2c/Kconfig
> > +++ b/hw/i2c/Kconfig
> > @@ -28,3 +28,7 @@ config IMX_I2C
> >  config MPC_I2C
> >      bool
> >      select I2C
> > +
> > +config PCA954X
> > +    bool
> > +    select I2C
>
> Do you have a circular dependency when also using:
>
>        depends on I2C
>
> ?

I'm somewhat new to qemu -- I don't know what you mean, since I2C
doesn't depend on pca954x, I don't imagine there could be a circular
dependency.

>
> > +static void pca954x_realize(DeviceState *dev, Error **errp)
> > +{
> > +    Pca954xState *s =3D PCA954X(dev);
> > +    Pca954xClass *c =3D PCA954X_GET_CLASS(s);
> > +    int i;
> > +
> > +    /* SMBus modules. Cannot fail. */
> > +    for (i =3D 0; i < c->nchans; i++) {
> > +        Object *obj =3D OBJECT(&s->channel[i]);
> > +        sysbus_realize(SYS_BUS_DEVICE(obj), &error_abort);
>
> No need to cast to Object:
>
>            sysbus_realize(SYS_BUS_DEVICE(&s->channel[i]), &error_abort);
>

Ack, will fix in v3.

> > +    }
> > +}
