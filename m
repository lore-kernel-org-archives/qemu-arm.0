Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4670869ejq;
        Fri, 12 May 2023 02:57:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lvlk6Tov5DsrQcrAJVWrWDFPthmB6m/lGfgAG7kfsMBffPuqrpFNSvyY4dl4KKsNHRdMr
X-Received: by 2002:a05:6214:d68:b0:61f:1a72:6c89 with SMTP id 8-20020a0562140d6800b0061f1a726c89mr41319953qvs.34.1683885458065;
        Fri, 12 May 2023 02:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683885458; cv=none;
        d=google.com; s=arc-20160816;
        b=1AJCA9i/ZB9Q5qw+4tGu6Showmx05YUEbADndnWUrCsTn4nhT1oi3CW5edpTb19Q2M
         K7mxelE3E1jOSlvg/eMNzxcHiwZUuW19JP9O6+VH7ze4etq/oQZaIV3InhfgWUln0wYT
         OC0TpqoCTcSBdiKgVNUmxj4NhDSgOGqaySJ1M14Wm/Sd5/z2GqCW+UScebcIe+iL3ebX
         LA/pV7Zqut4AOOhp9CMWwCoYvjsHRkHy0FV92SveGu7fy7o2zM/h8lGquhi3X/cGta4f
         8JyGlvxy2DgDi1QuweIyzT3uPurkbeaOSgC8CfIxad1Nl6WqjK7sDAyyswiXYQy4C8wS
         eMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mu7Xo/eAcVMcPJuHfe0lFbUfnm16yTO+nOIiWTpNgFI=;
        b=DHkBGDP0cDw3qC3sonOLTOsEim2JVGFSTRWtVIs7PKDV12kTVRkQFk4tBwEwZruk91
         HruAsb7VJuezQB8TWbngd5iOB9x80UUAnfoeZxaSrlAB57yr1pVTkUfRqsItCada8Y0W
         DdS6SvmHyJhfhCNDecxbJBI9TchAPaYmP8o0PeCNQtsxoFNaiDoPLiSwSJyQ7c8VNSvx
         jOOJUepzhbPfGqDEElYz8/qrw/5m9Qm1aip93syhVGIRzIycVEEpcD5ehUiWP4T6mu5d
         QmL8bivQCDV0Rq5biW9bSwt6dGaQZG5L2K06u8VDVtF2m/KVh/ITBpso/b3+ihHB6D0H
         7zTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DoR/2A/1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25-20020a05620a13d900b0074aca785f6csi1630843qkl.320.2023.05.12.02.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 02:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DoR/2A/1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxPWK-0004iL-6l; Fri, 12 May 2023 05:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxPWI-0004hX-IP
 for qemu-arm@nongnu.org; Fri, 12 May 2023 05:57:02 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxPWG-0005el-VC
 for qemu-arm@nongnu.org; Fri, 12 May 2023 05:57:02 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso17158799a12.2
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 02:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683885419; x=1686477419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mu7Xo/eAcVMcPJuHfe0lFbUfnm16yTO+nOIiWTpNgFI=;
 b=DoR/2A/18AHUhjCc7CIPjBWUBZzbblVWlSidsi1TPf5rjWDoMxn680UPHfSWgcG9Ng
 qsJCtkL2gFaEPxzcxzKz82QcfHoz+UgP19xFerWD9SqeHuzSMocS1l46XVY6WkZz32+o
 invgIi0Lsa6Kw5hVSoJRf7rrKR5O2Vg3HJUM00vDkKljrTgks1x3TrFf40qcrlkCmSZT
 2QTVXmWeiCqlcFofW5wtSd83MlRMzrgKkyRrj1YesCUzu23ziIuA/kG2o8wqi4YPev1/
 Mul+qqvhi6JOd0ebXuYgyXKI24g8UIlDMiAkt+xOSmMLZOjvwj9Zyi+B/Vf/VfFLdEQ2
 Pvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683885419; x=1686477419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mu7Xo/eAcVMcPJuHfe0lFbUfnm16yTO+nOIiWTpNgFI=;
 b=i13HcOapd+tXREet58Umy1/txXldTUvA3QssLsbbitLOyv7qCijVk8vkNTT3c8We4N
 3IPYIBunHCscOgDCmAI5EZQ9racUhlLqfYkKSCHj1FJ/cRxQoQTW1bjqgcwaKmw/b7zx
 f74NNeiLcMCHnsWtuRDQdvVkImqnUiQCwFghO0KZQoRX3ipuOzhLXvfmq6OT90cja9O9
 ql3MeDMP39Ph3ZYS5tJfwjrHoQDs50hFTSQ4sM9v8qBxNv+daPbn4YA6DAjoXk4/PJI7
 xNzbqMaYTGqIBOwRWADXMeSgS9ISY7hK0WvTjZx/vpnCGPwQKsJ0Xpze9tOFXHoQ8wwh
 hxUA==
X-Gm-Message-State: AC+VfDwM/i8AQ4m4x0LzIg6FaONQCzfBxn4ykTFDiN5GRkgLm3X+dZuq
 hMQJWboMu6owsqdBmUx1XwEws4fUzCSYNMQX+bJm6w==
X-Received: by 2002:a05:6402:605:b0:50d:91c8:9e10 with SMTP id
 n5-20020a056402060500b0050d91c89e10mr17376387edv.10.1683885418874; Fri, 12
 May 2023 02:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230512090803.1170154-1-zenghao@kylinos.cn>
 <20230512101122.00006c73@Huawei.com>
In-Reply-To: <20230512101122.00006c73@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 10:56:48 +0100
Message-ID: <CAFEAcA8tWWWvOAS=GCTnGD=Sv6h5pUWf3Cy4ux-FeF8s_BjzVw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: enable qxl for aarch64
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ocM18qmB6Dxv

On Fri, 12 May 2023 at 10:11, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 12 May 2023 17:08:03 +0800
> Hao Zeng <zenghao@kylinos.cn> wrote:
>
> > Qemu does not support qxl graphics cards in arm, it is recommended to enable
> >
> > Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
>
> Drive by comment.
>
> > ---
> >  hw/arm/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 0f42c556d7..0305a4f4f3 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -32,7 +32,7 @@ config ARM_VIRT
> >      select VIRTIO_MEM_SUPPORTED
> >      select ACPI_CXL
> >      select ACPI_HMAT
> > -
> > +    select QXL
> Keep the blank line here.

I don't understand why QXL is special here -- isn't it
just another PCI card? We already "imply PCI_DEVICES"
so I would have expected that to work.

I notice that the x86 "config PC" has an "imply QXL",
though, so presumably it doesn't. Paolo, should this
be fixed by making PCI_DEVICES pull in QXL, or by
adding an "imply QXL" to the virt board ?

As a third option, the mips "config LOONGSON3V"
has "imply QXL if SPICE".

I don't know what the right answer is here, but I
suspect it should be the same thing in all three
cases, not three different things :-)

thanks
-- PMM
