Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1215908njb;
        Tue, 10 Sep 2024 03:17:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULcVd9409t3fvHS8iyhqXsCh7lvfzfvl/zcZ9SX2R/IcmnQBPiGn9qnn7/4iSA9nYPgGZekMNTQz9XnA==@linaro.org
X-Google-Smtp-Source: AGHT+IE9fckABV2zxetKsmG7nc6p8h3Vx2+j4y3uzZ3UfgpbATiLyQCVKeZacV5P+lzlRBKyK4HX
X-Received: by 2002:ac8:5a43:0:b0:458:3850:c7aa with SMTP id d75a77b69052e-4583850ca21mr75582211cf.15.1725963464882;
        Tue, 10 Sep 2024 03:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725963464; cv=none;
        d=google.com; s=arc-20240605;
        b=d9YSfubMcO700wP7RxXaRAHeT7maoHS1K53NnrktJYLBW6gjKG6xO8lYvXZkoMCahg
         dz5UmNiMYB2CL26ntrocI9Bge3BZsFDY/PTGRgovKGNcmMwlPtTKJDC6sIXs64rbyXtW
         8gixtRCs6WryC1Pynu9IMJR71+4pTzN6e+++vurljc0+dv94usxVr/4E3ohwGnDRyDDE
         zlWjIsTD/sCsSjATvd5q+kCa6Ob0QdFllIQLgBkm8a9ahFDvl7iGlA6fjB6OQ4aHBkom
         89TffcYdD+tIpFETY14L1oUYCwR1rWJ4xNmL90Sdqaz5hcTWtZRkLv3T9AfnqnH7XgRc
         77Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=adMeFvNai4sKgpq/l2xsJ3FjCurUnP6RSssiorm3uis=;
        fh=Wfq/7lIriO9ufKDSwV29gABL/TXNcY3Eo92iTQ+vizE=;
        b=UkSLRke5xIyHxz4+NZcEQIb4KYDz5I+og3np81QIDaQAzWwywSKetidGIDJ67E1uiR
         F3+BKsJS+URpMyCT9bAl2n7NnmkGrBAkY0IqVTadqYkphcvT8VHa09QnhlnafPDkthAx
         bX/WAFDC33zmMGY+li6R7yqfFFdAYT1TQnJ+RP2WdQfqGx0T6qNKX+pEBbOgA5GIWrTk
         Oq1SGY3jse3kOt/uY5RoUDrld6HlmPSzoPc3vi3pY8kbaAQxd/U6PIthZU1QXBVS1Ezm
         j3eQYTRnCwR6GB9cmHynKDDSFbZ49RLed2SHzYD+zH7faHuU0lxbHZb2Lg/EezEL2i8c
         Fc3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JaE+v8sP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e7ee32si74195061cf.197.2024.09.10.03.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 03:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JaE+v8sP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snxvz-0008Hh-Nv; Tue, 10 Sep 2024 06:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1snxvy-0008H8-Ko
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 06:17:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1snxvw-00039q-Vs
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 06:17:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so5115218a12.1
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2024 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725963435; x=1726568235; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adMeFvNai4sKgpq/l2xsJ3FjCurUnP6RSssiorm3uis=;
 b=JaE+v8sPsD1qauisOz2HK2DX4iaiPhxLL1CiSJspcLdQXgX1i9egvs0FxUcVuG67OU
 K//I6ROjz1Ppz5eH6wtdzXRkIjTCK9TJ1J9zYLyEgz+KXYL9d7nh5HnPv8ge6tfN+MRZ
 PhR+Vv9vPIY90WW4gqoCBZfioxTUbIm1Gt/vUakOILpH5KIu0obouhOYAHiA3tF7Vtkv
 pwg7uH2VCI/ntW84ub5sBD4MnATpnxg/mZpog66rZnlduAGtorHhoS0Oj2HEJJgAZMpS
 QqqHRKT7oMBq7CKcpPyqgadKWdh1nkKT4QfNS5n5p8X1KRjkxlswTVxkty/u76yd/syo
 7Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725963435; x=1726568235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=adMeFvNai4sKgpq/l2xsJ3FjCurUnP6RSssiorm3uis=;
 b=fAR27LQjgi7ILh2Cs+1Oh3TfJfi7k8W53/ymyp5DB+Xn1fe+nT5Sfh1SRSkmapmdbm
 xM0nXqAKUSgF7s/nevee1mRzzXoYhOdqH/8t0c3bfkRETWz7ZpIC0dt6cT8SA63hqQH3
 kCDrMHKFTwhD9IMiST4g8AudaNocxUOVT4S+SJrPCF6gjr7AJZrEO7UfjQ5tBA6AwrFE
 O7LT9B1+2yrVQEp6uffqGo6YsK98Jt66/1kP6grBCwXB6wx/RwFlo0KLr6KiQCYlKKsi
 lNsfi+9mLtROdehGz8g1uq9Za6NbJggKlmLDUMM/vvZ9FSaZcJJxhfWwv5GJB5rLnRhC
 lLag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8AFtHFnoprBzmTiWXDJc6D3uo7ctTgSdsn8onBVL8WE8h95T5m2rkItsacr9Zj+YNtHlXvqlcpw==@nongnu.org
X-Gm-Message-State: AOJu0Yxo0K83qsKEggwuU74iy9hnGn4qjf+quAK1jiVBRpmk+c5Fty29
 1W+I/2OggrdHpGAS6BvlFwVQqnOSCz52RIzJs5xgRi8M+AiCieHQD8i258LR5BFpevR40QvAXB0
 /jtg7BI2wNHeZj51aSjZMW/tVLECp24eoRo9E5g==
X-Received: by 2002:a05:6402:530b:b0:5c0:b33d:5fcc with SMTP id
 4fb4d7f45d1cf-5c3eac09850mr6486603a12.20.1725963434666; Tue, 10 Sep 2024
 03:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <fabedae0-d748-4a9d-b802-14d15f3cd44a@linaro.org>
 <3f4ce380-0c0b-48ad-9752-c72f5aeac754@roeck-us.net>
 <CAFEAcA_ETkWY=AaPWti8KwO0awdxWqkO4CLAwxaGVr+i4yFz-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_ETkWY=AaPWti8KwO0awdxWqkO4CLAwxaGVr+i4yFz-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2024 11:17:03 +0100
Message-ID: <CAFEAcA9==ZeDbhod1zs6JNftvT3owjQe17VQ3Y_5iPN01Oh3-w@mail.gmail.com>
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: SaNGd4V6kkAs

On Mon, 9 Sept 2024 at 16:02, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Mon, 9 Sept 2024 at 15:55, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 9/9/24 06:40, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Hi,
> > >
> > > On 3/9/24 18:06, Peter Maydell wrote:
> > >> This patchset removes the various Arm machines which we deprecated
> > >> for the 9.0 release and are therefore allowed to remove for the 9.2
> > >> release:
> > >>   akita, borzoi, cheetah, connex, mainstone, n800, n810,
> > >>   spitz, terrier, tosa, verdex, z2
> > >
> > >> The series includes removal of some code which while not strictly
> > >> specific to these machines was in practice used only by them:
> > >>   * the OneNAND flash memory device
> > >>   * the PCMCIA subsystem
> > >>   * the MUSB USB2.0 OTG USB controller chip (hcd-musb)
> > >
> > >> thanks
> > >> -- PMM
> > >>
> > >> Peter Maydell (53):
> > >>    hw/input: Drop ADS7846 device
> > >>    hw/adc: Remove MAX111X device
> > >>    hw/gpio: Remove MAX7310 device
> >
> > max7310 is a gpio controller which is at least somewhat compatible
> > to pca953x. It is used on imx6qdl-sabreauto, and also instantiated
> > by Linux with the INT3491 ACPI ID.
> >
> > Is there real pressure to remove support for such devices ?
>
> "git grep" says the only place we use our max7310 device is
> on the "spitz" board. The point of removing all those
> elderly Arm boards is that all this code is ancient and
> unmaintained. If we were using this device on the imx6
> boards I would have kept it, but we aren't. I don't want
> to keep old, unmaintained, untested, dead code in the tree.

I should clarify here that if anybody is actually using
these devices with some other board model today, then
that would be a good reason to keep them. The situations
that I don't think justify retaining them are "in theory
somebody could create this device on the command line
with some other board" and "some future machine or SoC
model that we don't yet have might want this device".

thanks
-- PMM
