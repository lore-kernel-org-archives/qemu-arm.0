Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3107385wru;
        Mon, 1 Jul 2019 15:08:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbfo0zVXodeM+u2zu7dOSLd8xAaS5zzwV4/MBEC6E05A6k0Qi5sgekmyHroP+pwEEE9AjH
X-Received: by 2002:a17:906:9149:: with SMTP id y9mr24466449ejw.98.1562018930704;
        Mon, 01 Jul 2019 15:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562018930; cv=none;
        d=google.com; s=arc-20160816;
        b=ncuh/iD2fdAWKXTh1qF4mQvh8Z61Rg4O+/rFGdpAR6wnhnmcGMc0y2Xokk8Y4QOlQv
         DtfaRVg0+CH6fRdaSwLALdvmj2SCEhRE1jBtZj3gfwCPFbtpQMji1AEv1VtpnN0dvocy
         hQcyTIqKrHrq7FRjXB74yRIv7m+sGCdoN25/39HOMalDpHAxpjs1iHzf5UnqGNyFg+9j
         RyANpt/hqmhNkbwmWXQixU3bZgIkRX2S7el1UgsZ9qhND/4ivptB4Sz1spv1CHpOYLgG
         NK1g76QjyDS31f3BLGEhbyLQPnmPJYYlxc78tRH/sqOMnPlhLribA5GpivCuyndV8QDM
         MV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=mmzWI4rGYOcDZlfgefVMzjDWKHTWhgNNJ7GoLkF291Q=;
        b=w3VglrJyp3RtGPZwxYmjsFK4e4yeWxb/4BHi2tGPFsFVmwbLZ/a6Ofj3BguTNhdSct
         0yXQX/jxJ+HmLXMG40cGyovo5Svl65es2DkfmHAD5xJds8sVBrV+4kFfkdW5A4XOqErO
         3z8ps/noN8c/AsJuZPD/HbxRufE7cwu3jf2znjpZ5QPKzeXccFSSbK6FxwYicqF7uXaT
         jD3vVJdcyBywCtrCRnNH53kZTH9aaD3G4OIL60gmZsflxUVqvqTaboEB9C0NiaDURslq
         ZWNl2ApSyDm12NkmLhrhqq92kr3ed7bfH0BRnyX5BY5pPFP/470lVFzcb7L/1Le+zK6E
         nvcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kb0zULR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m27si1473531ejb.275.2019.07.01.15.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 15:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kb0zULR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hi4Th-0001e2-LP
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 18:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47053)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3PS-0001Z6-Q3
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 17:00:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3PM-0000Hp-Ci
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 17:00:18 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38983)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi3PL-0000CV-3l
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 17:00:15 -0400
Received: by mail-ot1-f66.google.com with SMTP id r21so14265531otq.6
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 14:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mmzWI4rGYOcDZlfgefVMzjDWKHTWhgNNJ7GoLkF291Q=;
 b=Kb0zULR8tFo2+DAIaZJjGSVjHJDkX6PUOo495cutDvrP6JTvsNukusVz/kYzCnCFu1
 Ny+yeg/wAIi/4cxwSKRyQ7h222tnD+NlUI1c5wTxLTrwI69kYM8Vk4XxESnlxXPAxggK
 Ju38U8bl74c6Oz/z9Ul41maYXWRVJvDRcX0RTdtqvlx5w9FZTkK2zNiqlAIZXUFTnza1
 Ts0QURsAQgDk4+Ptp4bEfwq44skybOkO9IwfFJsLPwOLyQpgobcAaQxpjtaUTDw4iF3g
 wgTK0W6/5zTP7OieKEfyK91XolCRUNuU2xY8Lm931janEq3HC1GEziNsHKAZEO3yrdEA
 KiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mmzWI4rGYOcDZlfgefVMzjDWKHTWhgNNJ7GoLkF291Q=;
 b=i9zW11QDUcJVcaBK+urkLyZZvLvA+BH9dno1bPm3scuwosJHHTsvW4UP9s2SSwjL2C
 yikLAFa9w0nWDPZ0MDTz4JHaSl930mtB7oR/nLKjGuG5cIKZPKh7x+p13DrsuHPqMW2I
 POqYbp5Cnab+64Oa+9wwUgoyIg0MXJQQac6oFALiWd/2mTOnFaWBRfS8hH/VV7Wu9V5o
 nunUmH5zwtaggzoTPxreLk/1lcT8EaEP4yykilKjRcSUVHjs59gYR8NLO1iB5Kh+YxWi
 VuJ2frmz4PbEWD9xavAdobycoLcTzPkN4Kj1JfCbOxMMv/V4iiLJ+spl4EIcGg8wvRgk
 DgkA==
X-Gm-Message-State: APjAAAWQ8RuC7duHrNkfROKu2Jn7gXFFTGWeTP8B0iVHcyU2sh8aIP7y
 F0Vf3O4bMleqYYTHVf5R5lzpimPwcXD7PLfiQCGch6cP5G8=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr19574517otj.97.1562004994964; 
 Mon, 01 Jul 2019 11:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <156200378933.9862.9905804796969886990@c4a48874b076>
 <81770e41-70a3-4e57-d7d7-501321843dd4@redhat.com>
In-Reply-To: <81770e41-70a3-4e57-d7d7-501321843dd4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 19:16:24 +0100
Message-ID: <CAFEAcA-co+55t2XmSrDkRiV1R+Tp-QQvFybUxW5a0nhW9PaCNQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/6] hw/arm: Use
 ARM_CPU_TYPE_NAME() and object_initialize_child()
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vp5SlrUvNvBy

On Mon, 1 Jul 2019 at 19:13, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 7/1/19 7:56 PM, no-reply@patchew.org wrote:
> > Patchew URL: https://patchew.org/QEMU/20190701123108.12493-1-philmd@red=
hat.com/
> >
> > Hi,
> >
> > This series failed build test on s390x host. Please find the details be=
low.
> >
> >   CC      hw/dma/i8257.o
> >   CC      hw/dma/xilinx_axidma.o
> > /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c: In fun=
ction =E2=80=98xilinx_axidma_init=E2=80=99:
> > /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:568:29:=
 error: =E2=80=98TYPE_XILINX_AXI_ENET_DATA_STREAM=E2=80=99 undeclared (firs=
t use in this function); did you mean =E2=80=98TYPE_XILINX_AXI_DMA_DATA_STR=
EAM=E2=80=99?
> >   568 |                             TYPE_XILINX_AXI_ENET_DATA_STREAM, &=
error_abort,
> >       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |                             TYPE_XILINX_AXI_DMA_DATA_STREAM
> > /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:568:29:=
 note: each undeclared identifier is reported only once for each function i=
t appears in
> > /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:572:29:=
 error: =E2=80=98TYPE_XILINX_AXI_ENET_CONTROL_STREAM=E2=80=99 undeclared (f=
irst use in this function); did you mean =E2=80=98TYPE_XILINX_AXI_DMA_CONTR=
OL_STREAM=E2=80=99?
> >   572 |                             TYPE_XILINX_AXI_ENET_CONTROL_STREAM=
, &error_abort,
> >       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |                             TYPE_XILINX_AXI_DMA_CONTROL_STREAM
>
> It would be nice if GCC directly fix the patch instead of embarrassing
> the author for obvious copy/paste mistakes...

Sufficiently new gcc supports -fdiagnostics-generate-patch, and you could
probably script up a wrapper to automatically apply the patches ;-)

thanks
-- PMM
