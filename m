Received: by 10.25.44.15 with SMTP id s15csp4318542lfs;
        Mon, 24 Jul 2017 14:12:07 -0700 (PDT)
X-Received: by 10.237.57.199 with SMTP id m65mr21487702qte.243.1500930727873;
        Mon, 24 Jul 2017 14:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500930727; cv=none;
        d=google.com; s=arc-20160816;
        b=B5tAtiSUyRIJf7vU7kUSWgH5AnXxHKOvGOvwnhhQiba+1UFOuu2F4XqrsLrEizLoiu
         7gaGe4PVj62vJbL4y2ONnQfkH1NDHr6mcvEYaQBU5Lawpi3DJ2/A0yW0anFl5VzWhOFr
         X1UctfsVdr+Z2HBePrrRPBUdNDguKEUjcOyGNULUGGGjLVBMljRmhRlg+14b0emCsNdy
         t1PpeR7zHBp6harqJqSUTZzD2ACvHTh7YEF9o8dN5SSGYhjbDnSl+p/SKNCV735gA4k+
         UYZVKE4OwLbUOYB6R5Oi4cF7mK0DFHKHImzAtgheh9xckQ0Nq5EIhkytEX7mzBHgGZCN
         tBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=JCohSCmXKYULBl9OpY4OBL/64maAxrvSX/PK2okSG8o=;
        b=loZJlwtgRCaoQBolrZU9TmPIoviLa6Fz+hvNNdvW2Q7YA5XR3OHXBEjSwi47kXbjOD
         rTWxjl1l/O11K+el+BPFtZYaR33e2df30mgod8f8NKNm1FRu6YEWHvHFbTr+u6yDK4+N
         yaoYGjEK8TnXJatY3pAK3HiSFdSAaq8VPr4hOKLpFokelgV/Kfx9Ft218p1LMYus7t6/
         sh5GjtF2LB3UwE0yGwvY2/Zyfu1v2e1d6EEgeObLF79tABsUiahMSQSUd85Go5/BvTIS
         YlTEOXWZoEUA/ZeUvfkL5rrdDuUbW1Fgh1R7KUCJaOyGruUf8ADGUH/XvSXKJ9b3/fd/
         lWxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=SWXiGgwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s24si9454303qks.555.2017.07.24.14.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:12:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=SWXiGgwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZke5-00010H-4r
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:12:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkdn-0000qD-SH
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:11:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkdm-0007Zo-Ss
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:11:47 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkdm-0007Z1-My
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:11:46 -0400
Received: by mail-wm0-x22d.google.com with SMTP id m85so27360734wma.1
	for <qemu-arm@nongnu.org>; Mon, 24 Jul 2017 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JCohSCmXKYULBl9OpY4OBL/64maAxrvSX/PK2okSG8o=;
	b=SWXiGgwNjnr057ga1Y54vdtWP8Ud5vzRmReC/ad4MXVafbTmSzgjJE7RXhJgUtXkj6
	mwF6C8e/59mpeHX1zlRmQkcfF0eUqThnU5hE/VocE6jdsdqJxoXoGMMLf/UnaJfrU9LY
	nI3HscjJq/QyZ2j1N6cyS7iE7WeGuu+o+/qqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JCohSCmXKYULBl9OpY4OBL/64maAxrvSX/PK2okSG8o=;
	b=pQQ516TPxU7EFBR17Ikby2OiHpp0tZOjVwCZ2v99LRICbW5D9iOpeDGdLgLf/BaILX
	RDrvcuuwdZEKc+zKSLtzSTI7ZyrHoW0E33SfMIk3RiYPWGgDcqbY8rTs1vHogZDw7gsH
	8IJdirXYZXYczL2O05WAeg0yLFw8TBDujLXUeqhsBvAEvkvl7oCTXzXnZhy7j/dWF2Yd
	E6IVh2ZD+rfvix1S6QkXW4bGUI34Oev6jDWkHTgYn9HO9RmZ2yfj9MDsvnwrnINH5+q+
	Oi6TPRK9Uh+C5nzJz+qylmZouYP8HbXXFaqilZ+aTxkh656bERzUwPWOZpYGDXwE7Exa
	DNKw==
X-Gm-Message-State: AIVw112lIOuCr/7KskvdHzR2/LuxiUnhjSbNrND1jwWJpEYCEYe+rX/u
	4uxQWzrzpUeBKeI/z0GrUvj+Pu7hREI8
X-Received: by 10.28.198.206 with SMTP id w197mr6051361wmf.86.1500930705646;
	Mon, 24 Jul 2017 14:11:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:11:25 -0700 (PDT)
In-Reply-To: <20170724182751.18261-23-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-23-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:11:25 +0100
Message-ID: <CAFEAcA9dciLWNYce7+4HjW1Cu4pEJ1V9gHQ2pokBECCj0mp1QA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [PATCH for 2.10 22/35] arm/vexpress: fix potential
 memory leak
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9k1DqNh2CmEK

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Reorder to only allocate if required.
>
> hw/arm/vexpress.c:667:13: warning: Potential leak of memory pointed to by=
 'flashalias'
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/vexpress.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 528c65ddb6..76c4d84482 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -553,8 +553,6 @@ static void vexpress_common_init(MachineState *machin=
e)
>      MemoryRegion *sysmem =3D get_system_memory();
>      MemoryRegion *vram =3D g_new(MemoryRegion, 1);
>      MemoryRegion *sram =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flashalias =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flash0mem;
>      const hwaddr *map =3D daughterboard->motherboard_map;
>      int i;
>
> @@ -657,6 +655,9 @@ static void vexpress_common_init(MachineState *machin=
e)
>      }
>
>      if (map[VE_NORFLASHALIAS] !=3D -1) {
> +        MemoryRegion *flashalias =3D g_new(MemoryRegion, 1);
> +        MemoryRegion *flash0mem;
> +
>          /* Map flash 0 as an alias into low memory */
>          flash0mem =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0)=
;
>          memory_region_init_alias(flashalias, NULL, "vexpress.flashalias"=
,
> --
> 2.13.3

flashalias is no different from any of the other MemoryRegion*
variables we allocate here with g_new() -- they all
leak, and it doesn't matter because the function
runs once and we want the MemoryRegions to survive
until the end of the simulation.

These days we could in theory clean this up by
switching from doing g_new() to having a set of
MemoryRegion fields in the VexpressMachineState
struct (compare hw/arm/mps2.c).

thanks
-- PMM
