Received: by 10.28.173.206 with SMTP id w197csp2436808wme;
        Mon, 8 Jan 2018 04:55:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBouNXdxReDP8MhEGNRnhRBtJe6HtlTxRrZx34ZOF7JFR2zUlhFtPPzs3m0BtSRuqkymx8kCs
X-Received: by 10.129.79.9 with SMTP id d9mr10792376ywb.445.1515416102913;
        Mon, 08 Jan 2018 04:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515416102; cv=none;
        d=google.com; s=arc-20160816;
        b=Yx3i3ml5cdX6LtjYjhTET6o3ifG694vBHwBR/Cot9+eH0obfwdS1h+TiCVCDhtUlkR
         WVct3F6lJtvf/lA1QF2YcS3qH9zjSIQZRuGgxBJdOtoGJkJU/MZP9XkDd4pTkb95cz38
         buN8MY1RofbDmhUPDYiHR2sxiV2a9NM0Adqn+92GsahBODi0lHAJ5rcexgFMA3UQdj8k
         yb9Sog3YrDko8Q0AmclOOxRuspFlQMxgSvK0dNYQQw5Uu1DKrtmsK4TZ1zx3IRWYFqSh
         JXZMIT3nqz/PnAWpkbgrm8A54ilDiIpEL/sEpnclP9RroqfYtAV7i+KLG3wwuVSfqHYZ
         7nkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=xKY6dyT48dv0WCuwGUGyOCZY+S+jwn7k3fFy2X/jVP8=;
        b=yO3mGlB87XEThWD50pRCgJST2EDXioxcSNYGdCk4e8u1L//aohC9GucN/NWCEcVjC5
         i50DrQynC57kOVZP9uqLxY5s+4I4gey63OAbeSm9Eu8weaoXuaUvyuslOdOgapTxST9n
         667Bsbff+SJnkXyx7wyjxPbt8gD8Qa0RWb+gjCLCdA7x1OGRoU+aX5oE3BKmi9VV/aFZ
         DryYui/gh5gGEXr6r1+RKxA5lKOjP3oBXQURQLByn++YfLSgmnV2lccCpFqkeQrylqKZ
         yygq3biyKDXAKNPHS23Ib6tSdbNsYhdwqSa/0XIUGcCCSYqFuLFL7IohI3pNdMdaqYZx
         VfNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u67si2534563ybg.567.2018.01.08.04.55.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 04:55:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYWxC-00079b-Cn
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 07:55:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eYWx4-00079T-BE
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:54:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eYWx1-00025o-5v
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:54:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eYWx0-00025K-Vi; Mon, 08 Jan 2018 07:54:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA0387EA9E;
	Mon,  8 Jan 2018 12:54:49 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECF5E6A02E;
	Mon,  8 Jan 2018 12:54:38 +0000 (UTC)
Date: Mon, 8 Jan 2018 13:54:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20180108135437.4ab656fb@redhat.com>
In-Reply-To: <20180104144046.30793-5-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 08 Jan 2018 12:54:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 4/6] arm/xlnx-zynq: use FDT names for the
 Cadence UART
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hLWKliA9wH/Z

On Thu,  4 Jan 2018 11:40:44 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/xilinx_zynq.c | 1 +
>  hw/arm/xlnx-zynqmp.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 1836a4ed45..c45c364583 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -236,6 +236,7 @@ static void zynq_init(MachineState *machine)
>      sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET]);
>      sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET]);
> =20
> +    /* "xlnx,xuartps" */
>      cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hds[0]);
>      cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hds[1]);
> =20
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 325642058b..38f038786c 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -155,7 +155,7 @@ static void xlnx_zynqmp_init(Object *obj)
>      }
> =20
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
> -        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADENCE_=
UART);
> +        object_initialize(&s->uart[i], sizeof(s->uart[i]), "xlnx,zynqmp-=
uart");
I don't think that commas are valid symbol in type names
(if I recall correctly it should be letters, numbers and '-')

>          qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
>      }
> =20

