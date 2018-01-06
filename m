Received: by 10.28.173.206 with SMTP id w197csp917wme;
        Fri, 5 Jan 2018 18:20:22 -0800 (PST)
X-Google-Smtp-Source: ACJfBosFlSZj/uam0fxxNwaLX+BwSRqXkLpZ5mrBUSpRCrWsdHEUk4sVsMCFTQ0X6wcTQHB875Oy
X-Received: by 10.37.104.138 with SMTP id d132mr4639037ybc.380.1515205222621;
        Fri, 05 Jan 2018 18:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515205222; cv=none;
        d=google.com; s=arc-20160816;
        b=mu5knrf8Ddefu7f/2FTSA60Gjyf9yJOCv9lLst3cdLwiFiD3mdY0mv8sbPPekCH8mK
         xgL/WUdOJkuDsY328L4NDLgEsTUMHR7giPPwRSg2uEwdcWrE0JsD03F9fPgyFN/neywE
         cLfNRF29+wC1x8gAg5R9CYNJMO9qbxnX4x+XkppTinhZWJagGLza7gdJg+rH14w7BT+9
         9hIPyVRiXfL+NIIEb6gUXK8igClC6fm2fjE2eY5CJr7qPYyeIiF9YSiMjyk3rZxXHw8n
         5zoY2obkY2fBLne8dQ2q7O1nwA7Odnan4sSB6JkWg2r5zHuT04LWMP1r6SoaAsqVafzv
         AFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=UbIP9ZjWoFQzPxmJ1+T9AYZmjXirqxCXi5HmO7HByn8=;
        b=Md0idUsfU/wyDLqxka6UZiusQChMIn9fapWETzKPdVSG2GZYF1tW1cdUPQjrRzNkAN
         1pPsn7PjGbY1H4JkVqU2xQd7ilAK6hUsoPpaZJNQ/ocWhd150av+434bmiRuloXuGvv7
         5GP0BqJm0Nj3Nc1e1M+IwSbeY1T6aOh17UhSQLecMB2I+WHYwnCjShqhCsWP6yJD3dSR
         909JOJHaZc4qctG6Q3q/5j12vTpe4ID8O//aZ4a3faduSeSXE1ePoAmQoCdRM9QypEOP
         F4pJrexKUBa3Wo3JY1Io9MrSJL7Cgsv71J2jXfBjBQp5rXvNNy1oe+4H4qVIOlRDjGwh
         ZxZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EpCQ3E90;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c12si1470154ybl.204.2018.01.05.18.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jan 2018 18:20:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EpCQ3E90;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eXe5t-0006aM-QH
	for alex.bennee@linaro.org; Fri, 05 Jan 2018 21:20:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXe5i-0006Wa-SL
	for qemu-arm@nongnu.org; Fri, 05 Jan 2018 21:20:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXe5h-0004oz-Uq
	for qemu-arm@nongnu.org; Fri, 05 Jan 2018 21:20:10 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:39589)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eXe5f-0004mt-Q0; Fri, 05 Jan 2018 21:20:07 -0500
Received: by mail-wr0-x242.google.com with SMTP id z48so46940wrz.6;
	Fri, 05 Jan 2018 18:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=UbIP9ZjWoFQzPxmJ1+T9AYZmjXirqxCXi5HmO7HByn8=;
	b=EpCQ3E90M/zdE7oCMBR9ZONgZPqWv6hKWleaovmiM4q2Y8G0lG4VHVvcLqQRlGHp5S
	OozDEif/beJ4RNaiYMT6OMkXIr+oaLl7J7tuziu0SuhlScRsBLrJ0S6Oj0TDlJOEglAD
	ei2N1Z5ZcxKyCYlvWnlqdNpTvOU9tKn5+D+UJhWmq2j27YKnhMHubBkp3veknNcsrWqV
	zM4ovx4INrw0ft7z+om6DpQgvBpjZrBVSPbBoHuY8B2o8ufYGsKbV9U9DBa0WYR21VlR
	zj790rA+3Ic0chfpum13mOuB6KrXoM3MYwnz5fFz2/lZ/nab+CFG3gNzGzHPc7RlLFuE
	E8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=UbIP9ZjWoFQzPxmJ1+T9AYZmjXirqxCXi5HmO7HByn8=;
	b=PV2TOoUTzTg8PRzj/2HXfcYrZkwyKQ12Bz2vS6Q/P65PWRzKq3F7wLVtIwli6e0JT1
	C27HDaaxbDLOjMkHgMOsTDyomT8o/tYiYTmFCEx0zWFzvBTXGp1o1pspO8hdzwne1MCP
	cRXdluIC3KWXoCWL5JEpRv5jH3F6WKoEQDYlYTcxNVvoUBX/nNc4p+0eUPPcKgFBLggc
	mwQSL3PwlD4m5fekaeoiuIyZiJQzmT3kjjVzdBxV9zujy6YvFM72S1jAjPsEGHbEldZp
	3/7zpUWQDL55DDT9Mb+Lx4hSJpH0hpdGzMD7gQ4g5E31zAbcqOOTuvGKCd41kQ8WfvuU
	3FkQ==
X-Gm-Message-State: AKGB3mLC7Ph8dJ6zFd3LjSpTZCHQvO1r6R36Q6vgTf8LCPh6RXpcJ9r7
	I6gqDxgcPZX4nN6fo+WCgQlCRIqhXUoU6jXhtxk=
X-Received: by 10.223.158.144 with SMTP id a16mr4644227wrf.83.1515205206424;
	Fri, 05 Jan 2018 18:20:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 5 Jan 2018 18:19:35 -0800 (PST)
In-Reply-To: <20180104144046.30793-4-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-4-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 5 Jan 2018 18:19:35 -0800
X-Google-Sender-Auth: d3g72i3al8jdIWkAf45psLJ_GGs
Message-ID: <CAKmqyKOfGcNAGVvdmEohB79_w8a=Hr2xsuXT=56Q_d+EeijRAg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/6] hw/char/cadence_uart:
 add FDT aliases
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
	Alexander Graf <agraf@suse.de>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IMHTzRFO7Qg5

On Thu, Jan 4, 2018 at 6:40 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/char/cadence_uart.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 6143494060..6880827947 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -552,6 +552,13 @@ static void cadence_uart_class_init(ObjectClass *kla=
ss, void *data)
>
>  static const TypeInfo cadence_uart_info =3D {
>      .name          =3D TYPE_CADENCE_UART,
> +    .aliases       =3D (const char * []) {
> +                        "cdns,uart-r1p8",
> +                        "xlnx,xuartps",     /* Zynq-7xxx SoC */
> +                        "cdns,uart-r1p12",
> +                        "xlnx,zynqmp-uart", /* Zynq Ultrascale+ MPSoC */
> +                        NULL
> +                     },
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(CadenceUARTState),
>      .instance_init =3D cadence_uart_init,
> --
> 2.15.1
>
>
