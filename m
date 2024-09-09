Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp953416njb;
        Mon, 9 Sep 2024 08:02:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHNwrmrFQzihzu8Qkb+bCACnTuAyyfueB4vW1QaVR/RtiH0jEwxiHEwTdGXhhWc8NcqtBnx3+mZMlKtA==@linaro.org
X-Google-Smtp-Source: AGHT+IHU869OWQcym5iJXCoWEqKxRPCi3/aYw690M+XXbFXTdNLR5j28M1WG6SeITHg253J+ZSIS
X-Received: by 2002:a05:600c:5cc:b0:42c:a89e:b0e6 with SMTP id 5b1f17b1804b1-42ca89eb69cmr66121365e9.11.1725894158757;
        Mon, 09 Sep 2024 08:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725894158; cv=none;
        d=google.com; s=arc-20240605;
        b=VQqp7U4WHAFha5uFf5HzuFJQpKaQYdi1XikGAnYli6G+Q0b6Q6QftzMuDLR46xrNDp
         LZBOrWuu+vKkhwTHWmpgT6X+PPbpSVFIIoAyuhleiamK8qt43MP4OrOjTjDcBaL/Yw76
         yoEruWcFx94FECEr3fneST23xLUAU0z8yEKXtnhlyeS3n1hh63KQ4HgXMsdkBiph/u8Z
         oObEih5KK9UDLqwHcqM76TMeNDuvP181FtH4Xb2WaK6zHIZ8B7k3SaB0Gs35dV4hGY0u
         69tBA56sc/YVRhh7P620IL24wx1Kcl9Es4OItek5IF8owRc/qKALkhwk3ihIXEgtmkIr
         wXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZRxlPrd/Ybys2LWD3ZftF27GtODdIWt5LgtCjZSmnPs=;
        fh=fTtM42DDzqdFNdSoBMI3ocf7JOvY7aUYM5tR+3qJReA=;
        b=DWnsMGk6HO7pjo69bjL9w3Ugk6FrUEB8DT/tuhZ8M1SMCAY6n6vFGaDb2Taeweww2m
         8/Dk9ZlvrEnwYp89mfz5HBKQRs3Ldvtfb9LOVGdu1MLTG+lEfdXbgk2l08GRl4TqOA+U
         6lbPHVCEgDU46UzQTimBBW6qV/lkH8rSmAKbkLZAAURokTNMIVF5B5jU6da2Yro80aQJ
         GGLjLxt93OPXhbNpgiXPCQEugveS19EFokIMQkR54kd7KtmcsjYuCCIdpxLSSvZ2qcCr
         KV/J2ADEgq+dZPaL4pcfDVKxI63eRZA75QaIxOgLTN/AJBZTd3J6v7piOBiC3hCuo2d8
         S5zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WWmi9SsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42caeb45ca7si26628155e9.25.2024.09.09.08.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 08:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WWmi9SsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snfuV-0008Bf-Ir; Mon, 09 Sep 2024 11:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1snfuT-000839-Fh
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 11:02:33 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1snfuR-00085P-Q8
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 11:02:33 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so5325873a12.3
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725894150; x=1726498950; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRxlPrd/Ybys2LWD3ZftF27GtODdIWt5LgtCjZSmnPs=;
 b=WWmi9SsKovpn0JcietSM3wAY2ekhDfEScG4Tssc46EMU8sxTdBJSM0D1NocY+/qpzP
 znCWT0bbWcjzE8j8/hfUAkqiw7IyGQCZ85NBvcVcKqlUmubk3BWeZH2c7vN3NNi3nlfL
 tlFDvCzjfE2Gna54fgJwHSoF3U3y/QN1dTFnHfepegP9VdCKkesS2DmlUiF3myBtinyl
 BTP+QIdCO6d8B+s+G+zD+a7nU4+NoibHJrfBs0vDdkm8k55S3DkkM1OlKyiQb7Jsom0W
 CENnDckGZnmUqZAoLRFPpmSaEf6Nlh2kjhwpzmTkmqmZf1ilSmH+TKm33T7dA3fBpdKg
 GwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725894150; x=1726498950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZRxlPrd/Ybys2LWD3ZftF27GtODdIWt5LgtCjZSmnPs=;
 b=wrnH6SHyjYwmUAf4RT73BW5EkI40lXlz0jeJYGaDmB38DnB0s3npCE4x1N9j8xZSCZ
 Sfy/l6xnRkouWUvyr4cio6+d9hh2sAXv/MApTrApdA/icsGkK9Ha0Ai0NqnSc4bK8Duu
 CJoemOKKeR0hgqWOiXS8CvWhT92x6PBzYvyTUmckOnpubrg5zD3Ya0lzdmXhDi40KDYZ
 Y30olVDLOnuEkS0B0FdK7WNF/D/O5IYQlfFdpz5shpiWVOjkpA9RzEncxpcQ/c55+1ZF
 bs8Ruk3WMQyqni2OHg7vYpyWp0WAPdHtUnckwS2bbcppDkUybd6Jl6z4yHSQUXO/971O
 2Esw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsvj0B4gUqAABBndatHWCYWTWILGhda9x5HhKutJ6Mhfk/UjA+S3RRf22kTPs56gI7f2a4Jxct/A==@nongnu.org
X-Gm-Message-State: AOJu0YxE7cVU4PwIwZ2E1rS+Q2Dl3iHofDgDCJJnqX4eUx7ozZ59kBkN
 oLTA+KJXWkyZ1csAnTvnK3fkLNUprQw/5EPCoOfILo65OBOCx39uk8iPNJgNnQOyESjigtZKoGY
 /jgGdfvw6HBDxkFb25xbtePtxoP4l3jRn/jI/Iw==
X-Received: by 2002:a05:6402:234e:b0:5af:30d9:e2b6 with SMTP id
 4fb4d7f45d1cf-5c3dc7bb1acmr7542748a12.23.1725894149848; Mon, 09 Sep 2024
 08:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <fabedae0-d748-4a9d-b802-14d15f3cd44a@linaro.org>
 <3f4ce380-0c0b-48ad-9752-c72f5aeac754@roeck-us.net>
In-Reply-To: <3f4ce380-0c0b-48ad-9752-c72f5aeac754@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Sep 2024 16:02:18 +0100
Message-ID: <CAFEAcA_ETkWY=AaPWti8KwO0awdxWqkO4CLAwxaGVr+i4yFz-Q@mail.gmail.com>
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: Bq1SAW1bQLuv

On Mon, 9 Sept 2024 at 15:55, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/9/24 06:40, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi,
> >
> > On 3/9/24 18:06, Peter Maydell wrote:
> >> This patchset removes the various Arm machines which we deprecated
> >> for the 9.0 release and are therefore allowed to remove for the 9.2
> >> release:
> >>   akita, borzoi, cheetah, connex, mainstone, n800, n810,
> >>   spitz, terrier, tosa, verdex, z2
> >
> >> The series includes removal of some code which while not strictly
> >> specific to these machines was in practice used only by them:
> >>   * the OneNAND flash memory device
> >>   * the PCMCIA subsystem
> >>   * the MUSB USB2.0 OTG USB controller chip (hcd-musb)
> >
> >> thanks
> >> -- PMM
> >>
> >> Peter Maydell (53):
> >>    hw/input: Drop ADS7846 device
> >>    hw/adc: Remove MAX111X device
> >>    hw/gpio: Remove MAX7310 device
>
> max7310 is a gpio controller which is at least somewhat compatible
> to pca953x. It is used on imx6qdl-sabreauto, and also instantiated
> by Linux with the INT3491 ACPI ID.
>
> Is there real pressure to remove support for such devices ?

"git grep" says the only place we use our max7310 device is
on the "spitz" board. The point of removing all those
elderly Arm boards is that all this code is ancient and
unmaintained. If we were using this device on the imx6
boards I would have kept it, but we aren't. I don't want
to keep old, unmaintained, untested, dead code in the tree.
If anybody does want to use it on some board in future
they can always pull it out of the git history (and
check whether it needs work to bring it up to modern
standards, and write some tests for it...)

thanks
-- PMM
