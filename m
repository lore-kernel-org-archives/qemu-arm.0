Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2818136lfi;
        Tue, 24 Mar 2020 07:09:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtQI/j+tn0pDkPlcobqZJartyNbCwqKU0IUsPLDXocMbWct0RrgJn8wp4VlOPvEVTUW6PGz
X-Received: by 2002:aed:2535:: with SMTP id v50mr26927575qtc.354.1585058979842;
        Tue, 24 Mar 2020 07:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585058979; cv=none;
        d=google.com; s=arc-20160816;
        b=j3zNlcM2frjYTHhzmFRvsiPqKSsZaX/Q80idsTVR+FU5JIT7Tqvuizx8OnjSNNcMBE
         nxLlv7rWD4JHdJtsvxbzE1n8n1DLfc5ejGNfBFg3D22B8x0I1vN4ZF5hU7DOCMPQl6M2
         Lv5vj3Fkc3GK8Si+nT5bvEZO4qaCReR+8Pj5oT2XVnmwLUgyh+rzpWGo2Tl411LZf0BH
         O3ctnUkl4cAPxPpFT2Vrie4zhlUWGdKwtdUqSeDNiDnr0cxlavEuM7jBj6oEGxdLBGcV
         K4DKjE0B4qoQK7DT7vMUHsIxrqDyFwS3us2eVb/IoNj5hzGvKOAEK6+/kmhXs0rMmo5E
         jlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DHFErVccaVagAISXs0hS/UGpos4OgSey3xf3EzZnx1k=;
        b=qNgoxY7/++wXhAS81C7A3EeTEW4QOqMh/IdVd+xci5k6gOuXSlcUt6hDYnjsuc1qr/
         M5+cxeo8jD7gwqGbrzv6PADCIEXSsiBul1YA5eM/6aqb5QVPMI0dtVX+1WBHakJI0T6o
         +gXWPR1zuUfmCzCqrQE1+no1NBEhGGe8RqmoJuBHa/92RRt3JjdYf3Psd2oQA3AImtSz
         /4zzQF187pxpy2I60QTjzdKnYEfAC634v+Dzj28mFxG6dsk//+6nU8WP6olk6LoNOIqy
         BH/3/t7UNDZav7VyMB/vPhoqEQTjLW2Gb3d+uoZBFLsQOIlHfyFeUBfFW1zT9ddJbMnW
         E6qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NMAhxGsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si8852159qtq.373.2020.03.24.07.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 07:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NMAhxGsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGkFP-00025Y-7E
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 10:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jGkFH-000250-6P
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 10:09:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jGkFG-0007tP-4y
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 10:09:31 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:33501)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jGkFF-0007oy-Sz; Tue, 24 Mar 2020 10:09:30 -0400
Received: by mail-lf1-x142.google.com with SMTP id c20so13356651lfb.0;
 Tue, 24 Mar 2020 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DHFErVccaVagAISXs0hS/UGpos4OgSey3xf3EzZnx1k=;
 b=NMAhxGsGVn5FC1Vrj2u5ltFb4dmdfxj/5Xb5pm2Wnc6KwRqemLRSIhObutcchgNKup
 F3ZE9LpBiP9b2iDRi6/Sktl5pqmzSDu5a9aKmffFTg5DixrOLJ2+MSRgDCtnCk8aQQxC
 rRNLJGtmxeLLwZQ+Qg4vNxAEpVdN4rJOtm2XrecX6+MT/w05xJ+QZ2aJnRzsqpIinAgc
 o/jceiQshCXQkaHC+fDYCjWbvU7usPRft4J5QE3fi4Kym2eo7ZnZyT6rYtGZnbHsEmjS
 Uz18eunPWox7Aljjh2NQl9XjLraiheiQ/1kHAsARSrD8ms2zHVOl+gnm1oJs6Bvs+RQ0
 p1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DHFErVccaVagAISXs0hS/UGpos4OgSey3xf3EzZnx1k=;
 b=KIW2Mf/2OP3fVlqBc76tZcnStLHgfeu0dXK0gy75lPoyTAtJb2jTNw8Al/zLgNXNKZ
 TOlw2u5DKz8annQs1k/zVMeqkH/aYwMoYABytdAUXd86fVm9U702cJws8F9/wMc/E3Fu
 tyHr5Ps8ejkvNyGOvQU1cX9jGl9VWgLKp76GAQ7KiFyf9VJaSEqXFUxN2z2D/JkOv1yB
 frCGYrd6T6FLH8dJBoweQ9mdP773hWd/SEf8D4fOOQfkJU942qInJ7K53ipQuW2eZOCX
 cjqfElhBvutFBVO4EIBDzpK3bSgU2GLR5Mow3X+BlJz5bLq1xoUcXuPJkEElY/zY1Aph
 lRNg==
X-Gm-Message-State: ANhLgQ30U38uxU1FPWX2Dv24LnBSPhfmG9d87MMsqyVDAFPVrwktqOWf
 Z+cCRVUgSZ7nv687yWkG9MBUAcmuHSrjgjyOUBY=
X-Received: by 2002:ac2:42c5:: with SMTP id n5mr5739242lfl.20.1585058966934;
 Tue, 24 Mar 2020 07:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200324134947.15384-1-peter.maydell@linaro.org>
In-Reply-To: <20200324134947.15384-1-peter.maydell@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 24 Mar 2020 15:10:24 +0100
Message-ID: <CAJy5ezqmUqProhrbqD1gmJ61jMU740CwjPiAyOLjDjSk75iDgA@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/xlnx-zynqmp.c: fix some error-handling code
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ac201705a19a4cf1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S9DftoScPPLw

--000000000000ac201705a19a4cf1
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 24, 2020 at 2:49 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> This series fixes some minor bugs in error-handling paths
> in the xlnx-zynqmp device. The first is a memory leak spotted
> by Coverity; the second is some missing error-propagation code
> that I noticed while writing the first patch.
>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   hw/arm/xlnx-zynqmp.c: Avoid memory leak in error-return path
>   hw/arm/xlnx-zynqmp.c: Add missing error-propagation code
>
>  hw/arm/xlnx-zynqmp.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> --
> 2.20.1
>
>

--000000000000ac201705a19a4cf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 24, 2020 at 2:49 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This series fixes some minor bugs in error-handling paths<br>
in the xlnx-zynqmp device. The first is a memory leak spotted<br>
by Coverity; the second is some missing error-propagation code<br>
that I noticed while writing the first patch.<br></blockquote><div><br></di=
v><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@=
xilinx.com">edgar.iglesias@xilinx.com</a>&gt;<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
Peter Maydell (2):<br>
=C2=A0 hw/arm/xlnx-zynqmp.c: Avoid memory leak in error-return path<br>
=C2=A0 hw/arm/xlnx-zynqmp.c: Add missing error-propagation code<br>
<br>
=C2=A0hw/arm/xlnx-zynqmp.c | 27 ++++++++++++++++++++++++++-<br>
=C2=A01 file changed, 26 insertions(+), 1 deletion(-)<br>
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div>

--000000000000ac201705a19a4cf1--
