Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp154448lfc;
        Wed, 26 Aug 2020 18:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzno5OZholYtSQsIzNeidVag3q2dnYKja3qeKpIOZejk+OmYKkG7vUC/Mg/WEjFDbl1Kbwz
X-Received: by 2002:a25:4608:: with SMTP id t8mr26664095yba.164.1598492037841;
        Wed, 26 Aug 2020 18:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598492037; cv=none;
        d=google.com; s=arc-20160816;
        b=BNTlckRnO1Puwrsmp/H33N/u8u30nNKcBaPHrAOk5u01yU+ACzY3CH5Av2tdo/vLKk
         8mpju/prpG5v8xbFhsfmzeI/tiE8GnL+3zdjerPxcWxffAGucSbJCxlYi5cwX1iyAXHk
         +vyE2odBQQj6yn2oTNRGLYw3ZVpEBTYzCNWilyk5px4P0eF1SvveijoSY4D0zXqb3C76
         1BBk3KcmbfH01ATUarNtHMYIXcG2t3WtXB6nqubuDoTixBZfvClUwtQl9+5mfgIr59xh
         c+GSOoQoVqZ10iZdqJTG0Vz7fr2bvUSfko8z7j4IuEpVTxsbXbshRS1fPGNMJnVyBwW2
         2WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=m+U2MTwdMoG9PqKsjSFaUQ6xkrv2vLd0zliD/g3ABBU=;
        b=W8g3xoy6bA85WPBDcNTQXhvTwPzYrQq/ZavbdhJBEh3PLucrRr35Rt4XdR4bumaS4a
         +PgAilGS4o7CbZXEaSRwMBMpcpJUfJI3NrrROjPDxWAoBACs1q/cUB3OoqK4OlQSW9qK
         F1k37t++R6KAsMRZoZEY5+cZG/YqX0XljyWHncP//ZLC9Kx3OZQMKeQyVN1xlO31QFSK
         +YPZrdadVDMgW5Dlgfabz6KMG0kOXf4whM3hR8dkHy5If6eM+HDkj6rl9RVT7OVuiawj
         1LsYYZeP9qaSUvPhG2LTlPlcxmxKtD7ivmjwzm5v/+TZMv9j6CRl/FU/JS9h983Upjgq
         QJpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iquvxkF6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n187si827098ybc.376.2020.08.26.18.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 18:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iquvxkF6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kB6nd-0001wP-7h
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 21:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kB6mT-0000GS-NW; Wed, 26 Aug 2020 21:32:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kB6mR-0006o2-W0; Wed, 26 Aug 2020 21:32:45 -0400
Received: by mail-ot1-x344.google.com with SMTP id t7so3164596otp.0;
 Wed, 26 Aug 2020 18:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m+U2MTwdMoG9PqKsjSFaUQ6xkrv2vLd0zliD/g3ABBU=;
 b=iquvxkF6uad3UVn56aWg+9oY1aZWOe/Qa60naVHz/iw/P2c5XZNrGQ0UGlBtJGhTxo
 KP/NZO2kBSNK0qH93dA5ScdbFfTW1oGSPKPfIQSbfwaAtaWuGIpmI3BhnVjuuiCvQoBC
 /SnA36AY9QAtwfpwuB1F1O2Q+qd+hXBWnid0dQvYE1nE8B5N3Uk2oATKvDXyJjYgcLIB
 WD0IR4hJqzMfpcinWx/bEaHh1PGt9iSvqYnR5u/v0/ZYDlzgD317V/uTFE5IEvMsyB3g
 9nGTtkzelv9ahGVN88zGytNiIjxTG1Q+JcVZjorT1xSiRYNQ2HVQTy8auI3bD/S6i6tz
 CVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m+U2MTwdMoG9PqKsjSFaUQ6xkrv2vLd0zliD/g3ABBU=;
 b=IIGOmukwNdZuypGxWYo/MvN4qlNFuXANrtpDPQU4d53AErvCkwfosJGpXAtwWnEHnq
 olNjVRjHr/P47uOvwjtc5ULwIALt1/aZyaO7j0Jy8lGOLOKFDA+/5MH6IAlv1LYIelYh
 5aJtGCzn3pZudHTYTAAcDkfWWKBB/+8X++9ExQJmG5P5DSDjTKltK1jrTJKGM0065k99
 lY0SMNxYBJRtn8aw4pCy7dF0EUaS179ipUDvNpUS3IXrBRPiDtMzTuT/9PsCahGKGTaq
 6W3SuzHILpNLcXOQAEZMjQNU00PiRihMyvWKAGDnrIjXwATfijM/kUv92VldONNfz9Iy
 pxRQ==
X-Gm-Message-State: AOAM5322iklmxFiUe1YqUn000ORd1e+5K6FqA8qVv7YpbnEa8GT/+EJH
 hh+GS42hKVS2yMXXr4a8xscYRlKT0KbRw7yDIFY=
X-Received: by 2002:a9d:4699:: with SMTP id z25mr8315286ote.353.1598491962341; 
 Wed, 26 Aug 2020 18:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200826184334.4120620-1-ehabkost@redhat.com>
 <20200826184334.4120620-7-ehabkost@redhat.com>
In-Reply-To: <20200826184334.4120620-7-ehabkost@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 27 Aug 2020 09:32:06 +0800
Message-ID: <CAKXe6S+nFmcCz+iyOuHJm+0=_CjXcDOrJhb0v8B97Ufa03jucw@mail.gmail.com>
Subject: Re: [PATCH 6/8] tosa: Use TYPE_TOSA_MISC_GPIO constant
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bT3JKCLrXmPH

Eduardo Habkost <ehabkost@redhat.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8827=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:50=E5=86=99=E9=81=93=EF=BC=9A
>
> This will make future conversion to use OBJECT_DECLARE* easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/tosa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index e29566f7b3..90eef1f14d 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -316,7 +316,7 @@ static const TypeInfo tosa_ssp_info =3D {
>  };
>
>  static const TypeInfo tosa_misc_gpio_info =3D {
> -    .name          =3D "tosa-misc-gpio",
> +    .name          =3D TYPE_TOSA_MISC_GPIO,
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(TosaMiscGPIOState),
>      .instance_init =3D tosa_misc_gpio_init,
> --
> 2.26.2
>
>
