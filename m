Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp375843lfg;
        Thu, 19 Aug 2021 07:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz33qzcOF5xR2tu01moocjYWVs1+hWGWhYp2MBnYMYx2XD9uDj/+TLSjUShjsQDVwluS99H
X-Received: by 2002:ab0:3b59:: with SMTP id o25mr11090505uaw.80.1629383034402;
        Thu, 19 Aug 2021 07:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383034; cv=none;
        d=google.com; s=arc-20160816;
        b=hPJ3rAlCCqpMZAK6zdlgq6Nc/ZumPQ+mfJ+bDVzXDi5a7R1RFNTbbih8sbZA8gKG4M
         Q29JBs4gth2/YWza7O6PbInLyQ/pT+YO7MqMmVUpFRugEPbmdmnsTPzOkh7hKyFpq5Fc
         J4MB59yVtCPAuNpWwIAw6y0syHgrBdxrN+G1lGYgislpm/X8j3g0fLOy6XEB7BiEcSmt
         BWGujKTU/qxeWDD3/q0TI8skZkwYQwbMNYVO1o/oouPWlgfw1jViv36bpkc87O6kxylU
         MLGa2qwWdtFPnd7s4VEjVVy/FregFrHSKByUzhZ/9XOMqXib+azAbatWiJuuzXRY9q7p
         +FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bP4aV60OU/XNa7SPq6EjX9GCwPeYZ03RIxd9UgMiS3M=;
        b=eSSj6ub1EJu/3VDIFzsmRc/ihSin1PdBZnjZbOHwReuBNkmZMTa/YBJs+PhQkGFY07
         ucf2whChakXA4HdPNCq3cDiFrEbjn52ImOhUH9oHnC4UZxdKv00uGbzaWKNdo3GPzE1j
         0U4gEYSgy9I6/nfVaZm8wLBi09Z8ZwDHcOsRNMMIG2ru+mniNf+shuOt6aztQss+yN5Q
         bPO92QIlgIYjVTONNus/MVxyUDdrHDm4Mg3EDL7BtlaV07eWW2GT8Pa4gYp9ier5cwNF
         tMTA7CpZ8lhrHQ/FJ4yo2ST3mtd3X6pwR0wEewMJuoMFo+q5OoS31NqaTMiGY2Yc4y8W
         nDhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nWXoXd3B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si1855082vsi.149.2021.08.19.07.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:23:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nWXoXd3B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGixV-0000wp-LU
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGivm-0004n4-8y
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:22:06 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGivk-0007R7-GI
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:22:05 -0400
Received: by mail-ej1-x636.google.com with SMTP id d11so13265537eja.8
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bP4aV60OU/XNa7SPq6EjX9GCwPeYZ03RIxd9UgMiS3M=;
 b=nWXoXd3BXHy8v0vgVmQVCJCnZp+yWtyhoGqb4bKYpJiCkxZ2YtMZbAqVTBaTaEF35Q
 BBzVV3/GjBEOP7pxoDWfLmk57axMY0DWfON+b7WwFjnsBt0dUfcMOtB0c0wh5nn9EBsu
 uzRz4U6P8FtkNlCyhHvKN0LLC+l8RadsLHyJZ8SOE5tHnQu+8MzwIJlIQDrWHDDxU1Xv
 bYKNUPTPu80mR1Tg21hElXnMEpySgx2shruDiw2E5+fAafLRxF7hTi4cgowqEhDCHnn7
 Y4JAEXhVXzg/NrKnFRRsLJQf0aTe+GFoTeE3IvkrShSxpDEbyOqjXAMzqm1ujWptcWT8
 a/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bP4aV60OU/XNa7SPq6EjX9GCwPeYZ03RIxd9UgMiS3M=;
 b=IiIFP89COAbfu4uNMU+qgi6Kk1cLuV0iu6FFl9oB3LXuk4PIW5ZgIufW7feffpCj2S
 C2d86VaRswQ90e9nnQ5ANXqs9gVFeb4sGe40Ja0bcyTX6NaZCmped1858SXjk0egLO05
 kqICZ8vABje83E37Xc3OWVidjcl4UmQIE4QRsb/2EUhHD501LbSSCD/A7dvUwKX66wBY
 Q5bsuzV9ysk/TUhUVo/85IAMl4vNyr+URbJ/IGfGmiVfOn7oAyXQ+P/E++uiWidg09j1
 PySEVENiPH3EL+pDUyW2dpCNHmeOEaHttOmxQKbdukMFVa+mQgjrYE7poyY8D5c0flQc
 5FRA==
X-Gm-Message-State: AOAM533TX64e/GHggpso+iuAfzE9AZDNB4xiBsq6c4ccg5nkJox8l7e/
 vhinUkO4NIxuwYOVBfRJKpyk3KF8Twf1Ac/sXENHWA==
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr15940539ejf.482.1629382922668; 
 Thu, 19 Aug 2021 07:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210819141527.2821842-1-philmd@redhat.com>
In-Reply-To: <20210819141527.2821842-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:21:16 +0100
Message-ID: <CAFEAcA-1aDG_DZDbWGy=uXDjPGdkcMaN8SRF9_i7KnbQes-_NQ@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Fix ptimer resource leak
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kw3/JOEC19ct

On Thu, 19 Aug 2021 at 15:15, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Fixes: 35593573b25 ("hw/dma: Implement a Xilinx CSU DMA model")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/dma/xlnx_csu_dma.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 797b4fed8f5..0c1c19cab5a 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -660,6 +660,13 @@ static void xlnx_csu_dma_realize(DeviceState *dev, E=
rror **errp)
>      s->r_size_last_word =3D 0;
>  }

This is a sysbus device -- when can it ever get unrealized ?

-- PMM
