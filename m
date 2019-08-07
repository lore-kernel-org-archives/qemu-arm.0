Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6796197wrv;
        Wed, 7 Aug 2019 10:05:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqRZ+2fYPwhth+bpOPxWmYGXSBHGKrgER3YshrhD3sUdk8xcD+rtkTD65YYxxYvO6ZK+45
X-Received: by 2002:a50:9107:: with SMTP id e7mr11112225eda.280.1565197551754;
        Wed, 07 Aug 2019 10:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565197551; cv=none;
        d=google.com; s=arc-20160816;
        b=kJvSiH/T8LKV7AUUhxZMXBEwyF4hahOAlFI0PxijN1sq2XcreRcaPp+3PmEFlytDFk
         dK+YS+afkrmdTyvraDjDYvkMcvN9SLZZcJ/hdctkVClWpIf6SR0dV2KrcINT+LsoMPKu
         bnsaR2rwT+pvEPd2yamolATUmqj3oJFrT0QIzadVQulNQT4JMfyqDufjw7cVyXS2rFFd
         h3jyd78lVQRmAB6Iwt1IfywwfEdM8rKukmIfcbFx0vvH9QUM6MHfDwKIXh7UwrGNSy9z
         5RaSR0tGffRmPNo5mD8e5L3L1Z5qq6q7BJPb8THQLSnpXaratgvOSXuxcxQFebl4fVzQ
         LRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=fdYLrUT287k+tJgWqDNZMrBa/YcSpTzUb+gyNVLX6M8=;
        b=GMt0ri4LYdkD71gpOzGY4XLErYR4fx2ScrprYwGRESllEfIJfj6U527JBoy8QqKi1n
         X9HmRx07cabJvWwiC018K6n16c5mvLu+EIviEcRa7OoDLvgm53OtIC+gjGbZHX+qasRw
         BRWILLgQMybEGnPCvULQk1CG7TcgMhNdlvUo/QIl9+LfeddP+rgiGIEFLFCdTNI/ismX
         uiyPnVEDS2zl17JsyA1+Rx0x7QCDBfCQE4Wlm0DrxAnMYz/0+odAtUzLDNdWCcm7ybyz
         pmwAHfqM/96vw1Bwcst1uZf5hG/GZSIC+K0E6aU3MAPD2Ou9jlMGCopvb98oVz47HtpC
         5jiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xeAf38Qc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si33677614ede.451.2019.08.07.10.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 10:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xeAf38Qc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvPNm-0005dU-RU
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 13:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvPNg-0005cQ-Mh
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:05:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvPNf-0000Xu-Jo
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:05:44 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45362)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvPNf-0000WM-7v
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:05:43 -0400
Received: by mail-ot1-x344.google.com with SMTP id x21so13859369otq.12
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fdYLrUT287k+tJgWqDNZMrBa/YcSpTzUb+gyNVLX6M8=;
 b=xeAf38QcOgtgzKyz8qXEjeJ9Y/ta+tk1/JuzozUXR7zhpHAanM6e+3/xQXSbfe1fJw
 j+QeRAO5HFoEUvCNXIN6NUsAZjIQn8U9kelA56vyI8vygb/3qPYYguF0DR9Ih2orJgeL
 RLtewXo2fxPoJ8w7v4mx6ctErP+mt1a+6HD1kqbExI5u2vnFV80WqpI3G/pNSKwFVWIv
 a01iW5Qsc/MD/v+y8Ie0bAkFcUqghXwvVWPpLgIsoiFlVwfFv+iY4BuauQsTzCJNwnUE
 zjd2YZyM8zTPlDzZelbT8zhGvAOuQOrMkJ7/G0Dsl7H+iH+++1OpiM0HLFouuFb01dwc
 BqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fdYLrUT287k+tJgWqDNZMrBa/YcSpTzUb+gyNVLX6M8=;
 b=BDT0H8ei9VguqO8j9UPEKU0/jvwL6xQrfDIruPCSoV8JIa4SRhIEsrDl/wvObmer5I
 45K/VxhWJCVL+Um4L8I+++N/1URr06kSAthc6Rz83OJ7dO4Lp1shZuWRsQawtg3iDlA+
 ABNoh/3HNw55FPMejlvtJh1HVOvirIa+QSFm0GgfYZTvKmIYUneHnKkUGcSVKdPduBUi
 8sLBTEKx8j2KajCtNvz6kyVy2EQnMLZ3NydZrNKepbfiOc/xdrTPLaj29doNRZBdZH0j
 LDtpFM7mw7Z8ZEfH5ENv1PmaAQX1UCBalPXX7TBJOIIik4xFqSfzhbpSvUGbv6PUKChl
 /+Bg==
X-Gm-Message-State: APjAAAXtfmEkVrIh8ciXkZMz0H+eg/1Z4w6cjcSRGEYvxTPBqX8aspIm
 /bPoxGOJuA0sBjhW5ohjJMBXzXdKdd3HCHsC43DseQ==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr9172136oti.91.1565197542250; 
 Wed, 07 Aug 2019 10:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190805142417.10433-1-aaron.hill@alertinnovation.com>
In-Reply-To: <20190805142417.10433-1-aaron.hill@alertinnovation.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 18:05:31 +0100
Message-ID: <CAFEAcA-WN_wPiG=mCSTR4N2C10TuW3cuyhN-K0xmA4AxwX3N3g@mail.gmail.com>
To: Aaron Hill <aa1ronham@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH] Set ENET_BD_BDU in I.MX FEC controller
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1w8JQ1QeMVda

On Mon, 5 Aug 2019 at 15:24, Aaron Hill <aa1ronham@gmail.com> wrote:
>
> From: Aaron Hill <aa1ronham@gmail.com>
>
> This commit properly sets the ENET_BD_BDU flag once the emulated FEC cont=
roller
> has finished processing the last descriptor. This is done for both transm=
it
> and receive descriptors.
>
> This allows the QNX 7.0.0 BSP for the Sabrelite board (which can be
> found at http://blackberry.qnx.com/en/developers/bsp) to properly
> control the FEC. Without this patch, the BSP ethernet driver will never
> re-use FEC descriptors, as the unset ENET_BD_BDU flag will cause
> it to believe that the descriptors are still in use by the NIC.
>
> Note that Linux does not appear to use this field at all, and is
> unaffected by this patch.
>
> Without this patch, QNX will think that the NIC is still processing its
> transaction descriptors, and won't send any more data over the network.
>
> For reference:
>
> On page 1192 of the I.MX 6DQ reference manual revision (Rev. 5, 06/2018),
> which can be found at https://www.nxp.com/products/processors-and-microco=
ntrollers/arm-based-processors-and-mcus/i.mx-applications-processors/i.mx-6=
-processors/i.mx-6quad-processors-high-performance-3d-graphics-hd-video-arm=
-cortex-a9-core:i.MX6Q?&tab=3DDocumentation_Tab&linkline=3DApplication-Note
>
> the 'BDU' field is described as follows for the 'Enhanced transmit
> buffer descriptor':
>
> 'Last buffer descriptor update done. Indicates that the last BD data has =
been updated by
> uDMA. This field is written by the user (=3D0) and uDMA (=3D1).'
>
> The same description is used for the receive buffer descriptor.
>
> Signed-off-by: Aaron Hill <aa1ronham@gmail.com>
> ---



Hi; thanks for this patch. The data sheet's description of the
buffer descriptors was a bit confusing to me (since it describes
what we have as a "uint32_t last_buffer" as two separate 16 bit
fields) but I think this is correct given how we define ENET_BD_BDU.

I've applied it to target-arm.next ready to go in once the
4.1 release ships and we reopen trunk for new development.

thanks
-- PMM
