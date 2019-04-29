Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3769010wrh;
        Mon, 29 Apr 2019 10:38:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwL0BNlI/eUQ5UCY1lqrn9beVB3huCUM5owjyFj5LOVk0bWiSJnuTticFbuo+D11Q5rx1Rl
X-Received: by 2002:adf:de0c:: with SMTP id b12mr18912169wrm.297.1556559513262;
        Mon, 29 Apr 2019 10:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556559513; cv=none;
        d=google.com; s=arc-20160816;
        b=0lW3bVzbbAiOkKfo62JQfyRjvbO1CeUICTtyQkkkvKLrE1YsmW7Nvnth5owBy2ib8Z
         UPaz0lRJMrArSvvp2qAifkh+y2R4sopljaHqQ4/CbTvcfVcdMVoMtoNxxdftfEcnsIDX
         bpC/vsgkvFrDxfHvh0PdZ788Iz4DET2LYO6lqLeb0lG0FKO6eHleUht5zsRGBjab5PHl
         EsDsCZp8Liu5OWb05Mo9ApR4Z888pZa6Fnhz6LH8w6BIWrtX62JsCHk6OsvuGaLbpDXR
         OyBdpZndmVoJBITrXr2On2Vfbc1ipn9WqHqWTAjXNJja9EXrmN0cZlPR90ItE7hxAMGB
         +JkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=D0CsyVuEeijjtNrn3BRdbHVTNz74u9iotAEhTxxMyXM=;
        b=fZQ1qmRNHlPw3qxDUIHXDK9QRgYRnBS2zeeQzp9mV4L+gfWTHZJvTU0oWlHKfkEVnE
         4DUxWpi83QbAyZUROhnrpVTTV4aiircN/ZP77T3zHutWC3Aa6Y2kCwMf0PHcfENTeQzv
         kLmNOghihX4qb2bM13Cdcza/IJFqiQj7eyR3JzRQb4RhN4NYnBtFGCE91rfLfPb+YHqm
         KgGjDwIjbTWvghcOnrc0wBPudjeFVjF7xhsLhfNzajAqPhnOTbGCx0jTeDYoQj1Rmyra
         Y9G4Zryk+4s87UtaZP53K0kddfrphae+zbhKD5P7iwMvwT2ndOAd+XjrVa+OwnN7czYA
         BXWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="uYus/O/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si6209223wrs.340.2019.04.29.10.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 10:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="uYus/O/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:32917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLAEa-0003rn-8F
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 13:38:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hLA72-0005hK-OM
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 13:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hLA71-0006ki-SZ
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 13:30:44 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:40418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hLA71-0006k7-LP; Mon, 29 Apr 2019 13:30:43 -0400
Received: by mail-lj1-x244.google.com with SMTP id t10so9102007ljg.7;
	Mon, 29 Apr 2019 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=D0CsyVuEeijjtNrn3BRdbHVTNz74u9iotAEhTxxMyXM=;
	b=uYus/O/JfNBTN/acpE1d/z1mxuuuypqXzI7iegKxHMRGiUhFfMJ+iQehbIK2KRO5qk
	NJe8Lvr+0bj98gF4ww0qMwRG7FIJnw3pULMkPVFZypDLBPATY2HTiT2y9LzYwuvicn83
	CVPDHiv2E+Awgn5Qkii/kC3cgZxR+SU1xSs+60FRpiz8LgW3VjcSBv0zaW4Qj3Kx3uHe
	S0OSRcusH1imkaoCgFLOVFXd6OnJ4cuz05szWixL0uRzyEA+Q13dntbz/9QxXsk6vBjK
	6tRLKGaZcfjap6MnOWhrJwLSiogND1A9gp4zHXKMupIQyhj1moDhEnppbpVfEpXlsxOO
	SW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=D0CsyVuEeijjtNrn3BRdbHVTNz74u9iotAEhTxxMyXM=;
	b=mRvZ0GDoIKnsWNlNgE06zY4IwjGE4YOG0wSV3H4L38+Yx/ut2blsMTxMX1HfntzTr0
	OSJhwIkm05AlH8RTcAidLC4tqf1/Z6JNlV+PuWBFHfgOBJ0TpA5GrFBchG4mdA37DkAe
	La+UW0YI3A2lHSA0XXQanXfrUUreZuewpYFBkgldOhluxwcHpm2zShpL9LHKV9yyCp5y
	g2oBtmLm9SOG4yEohM3WXD1aB46nypM4ILtsz6RrVRLsoj/rUH+o3F7NKsC+iF07Lpc9
	skdOKmNJjsnIOlwp44xYDGgIFYdcpE+fswZ9t9ScZRKI/cugQqHDT7+yNHgylQ++cV9w
	hLIg==
X-Gm-Message-State: APjAAAWSftElRvP0smBOWuwf4s6eAMkpY8eMoWviEDZjBKThBuU2BVEe
	O81as/BGTLikMAc2fXXKcWX/+z2NJSBDejNK5g5WIX91
X-Received: by 2002:a2e:824b:: with SMTP id j11mr6798990ljh.197.1556559042610; 
	Mon, 29 Apr 2019 10:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190427141459.19728-1-philmd@redhat.com>
	<20190427141459.19728-4-philmd@redhat.com>
In-Reply-To: <20190427141459.19728-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Apr 2019 10:30:12 -0700
Message-ID: <CAKmqyKN=WFU3fGDM_t1tnwH6E7dPSpHBUBoWSzZiLe7tf7p8FA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/dma: Do not build the
 xlnx_dpdma device for the MicroBlaze machines
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PaZk2CMPAp1C

On Sat, Apr 27, 2019 at 7:15 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The xlnx_dpdma device is only used by the ZynqMP AArch64 machine
> (not the MicroBlaze PMU). Remove it from the ZynqMP generic objects.
> (Note, this entry was duplicated for the AArch64).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/Makefile.objs | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
> index 79affecc390..a5b1276f52a 100644
> --- a/hw/dma/Makefile.objs
> +++ b/hw/dma/Makefile.objs
> @@ -8,7 +8,6 @@ common-obj-$(CONFIG_XILINX_AXI) +=3D xilinx_axidma.o
>  common-obj-$(CONFIG_ZYNQ_DEVCFG) +=3D xlnx-zynq-devcfg.o
>  common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_dma.o
>  common-obj-$(CONFIG_STP2000) +=3D sparc32_dma.o
> -obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx_dpdma.o
>  obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dpdma.o
>  common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zdma.o
>
> --
> 2.20.1
>
>
