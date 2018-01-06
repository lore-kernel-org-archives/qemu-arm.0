Received: by 10.28.173.206 with SMTP id w197csp3071wme;
        Fri, 5 Jan 2018 18:23:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBosqe/1SBMTzmhBXglMlNVxfB8kGuYlCxCU96jwkpm/Rkwavncp0Kvte8xBhEjHo44+mvPUD
X-Received: by 10.37.211.8 with SMTP id e8mr4711867ybf.23.1515205437712;
        Fri, 05 Jan 2018 18:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515205437; cv=none;
        d=google.com; s=arc-20160816;
        b=mg8kpUl5v89y2IGuowxws0Ah4qe/652zbZAInXDmWSGznoyf9Q66MtjfPAh3E27Ps8
         cbcB+H5ecfoqmXQKxAugpFThBcK01TqUxLb3biRU3RyB66KJcyn6QOdLh0esT95uH/yo
         OgMuDWASo7xist5suXnyg87KILX3zhaNuvAnEv+OPpoV8Yw5gspxExsyn4/qPDHB4rpq
         lfNF4lqV8rlRLqCJOF7vx0mIZy2G1fcFLqwuMarBnn9aPjx4JlJe+eP9k3bqvfjzNEx/
         /MxF9a2gztmtDJOB6vLDZShZd6bAjHWNSuQYG1p5Q+kwEhxTag5GgrwcfqY9YkcKZ8DA
         23tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=wVe1mrd/bbkF3W5CS6702FD4S4gzGgGd9V6efiGo25g=;
        b=WEvU2AGc/r/IhOyrUJ+zokPGpMXHN8NATMpIw4MSepjhHrRQlqseUwu5FPwaNeyzwr
         AyMad79SG3wqvyQV6HNbnKxZ1yioaf+dufR2mOGh3Ao0fjKnxekAfC50idDa/SyYTneR
         URlCpXrUcUYqnKa+BBCxATotAVu9WgNFy36SfRpg7ojLnJyMHggq5nPgtok3UwFtZIPL
         w2UED7WbgYAzFvakXDVGyXR7NiueA3mGkdBHz9IWwsJNFPscZ2eTRjbtGBeKejOrW09u
         bATVROazgkjxuQlpoUeIsKkemkIxOVhwLKU8S7502mQJwLvoudEDC1BKuw+8+OmpdXlh
         dk3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ie8oiZ2+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f129si1463570ybf.176.2018.01.05.18.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jan 2018 18:23:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ie8oiZ2+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eXe9N-0000ei-74
	for alex.bennee@linaro.org; Fri, 05 Jan 2018 21:23:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXe68-0006rQ-VJ
	for qemu-devel@nongnu.org; Fri, 05 Jan 2018 21:20:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXe68-0005Dw-7J
	for qemu-devel@nongnu.org; Fri, 05 Jan 2018 21:20:36 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eXe68-0005DV-0O; Fri, 05 Jan 2018 21:20:36 -0500
Received: by mail-wm0-x242.google.com with SMTP id g130so8554907wme.0;
	Fri, 05 Jan 2018 18:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=wVe1mrd/bbkF3W5CS6702FD4S4gzGgGd9V6efiGo25g=;
	b=Ie8oiZ2+XhQ7k8mhMAUpEmaF5L1rdaz83qQdHtHjCr3dhrxRPyuyY1R4xoHLv59fF/
	KoHHZPvwUxfYddGgm1AS7oHwzRx2mR5f9aiVIlhVhXj7H/ZuIWO11E+ZRSFNbxHlSyKn
	UeFWF3uHkgmfRI0ODIC0Fdv6WzCi8JSQhDr9W4LRCtC23naBXQg4jk4ozm1fSH16rQCm
	amuONhCW4sMoeFndHua6FxKGOqSg7XjVUQPE3DJsmno4hGnmiDWZ8aOrRuj4kAr+j+eI
	BD1vSrDzkrxEG9jrYnNLd6Mjg4frwxWE2SPmerAKQIBrno8KJb2a/uRVvIxLi1x71QYo
	eBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=wVe1mrd/bbkF3W5CS6702FD4S4gzGgGd9V6efiGo25g=;
	b=sNRpNFhPWsm+GR4AvZveceCi9l75khgS8V2Z6iG/hbOXgpbwtu4Naw61gab5rrdTyc
	3Tq5XjXLmP8L0o/go+LTlaI6XPF4s3nnHWa4J9+JkavPE81QUXvyEKfxfPFhvwg6UTve
	Kych55Hm/ZmlXXA0YlhI2TXHxgzf03CpeEuS5T16xSX+OtV3IVw8SwwOTVVMvSI14Yg3
	YW/0MIUjWrx93c+oCCS5zJRM2oSafL17bFWWTYaVGwug2RFdDN0M19uU5IvYCsWcH6ph
	kTmjiOFPcJUMMIfaU9Bxk0bOoxOfiZLEs4W1nq9fdkWGGqf8yyoR+6D29RdRprov0eoo
	i2dw==
X-Gm-Message-State: AKGB3mJPQUEwAo/xpV+Fxzv9iCsJYbuAwlj4xvolNH58qdJVdvwrIB+u
	LzeCYd4cGd036uz2H1Zrk5fCXOnxUZ6h56tS7T0=
X-Received: by 10.28.69.8 with SMTP id s8mr3250681wma.25.1515205235047; Fri,
	05 Jan 2018 18:20:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 5 Jan 2018 18:20:04 -0800 (PST)
In-Reply-To: <20180104144046.30793-5-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-5-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 5 Jan 2018 18:20:04 -0800
X-Google-Sender-Auth: mwmIeJPOD57QcTYKZ3F8JpUoweA
Message-ID: <CAKmqyKN2R1m7QQXW_JxOjmdy6xx8SLVs7gQBYViN942rcZuxUQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [RFC PATCH 4/6] arm/xlnx-zynq: use FDT names for
 the Cadence UART
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9+tQ/3ve8W5v

On Thu, Jan 4, 2018 at 6:40 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 1 +
>  hw/arm/xlnx-zynqmp.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 1836a4ed45..c45c364583 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -236,6 +236,7 @@ static void zynq_init(MachineState *machine)
>      sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET])=
;
>      sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET])=
;
>
> +    /* "xlnx,xuartps" */
>      cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hds[0])=
;
>      cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hds[1])=
;
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 325642058b..38f038786c 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -155,7 +155,7 @@ static void xlnx_zynqmp_init(Object *obj)
>      }
>
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
> -        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADENCE_=
UART);
> +        object_initialize(&s->uart[i], sizeof(s->uart[i]), "xlnx,zynqmp-=
uart");
>          qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
>      }
>
> --
> 2.15.1
>
>
