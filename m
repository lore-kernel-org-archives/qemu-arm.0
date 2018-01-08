Received: by 10.28.173.206 with SMTP id w197csp2504019wme;
        Mon, 8 Jan 2018 06:02:16 -0800 (PST)
X-Google-Smtp-Source: ACJfBouuR3eFTFHINR3wZcbZuVZ3NxzY7iY3/qY7BuFzKoHmFn0xmiDx/CUtqFZxbVGngqZnV0E7
X-Received: by 10.37.85.133 with SMTP id j127mr10712251ybb.373.1515420136279;
        Mon, 08 Jan 2018 06:02:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515420136; cv=none;
        d=google.com; s=arc-20160816;
        b=NAUbbMCbqGUJjyi5Q3/7f9+DeIeY/W8bdixnyeYituPTKVW7vM+QIi9cf1RR6HrFnn
         SlP+jikbFEz1u+Pry8CIUyosXM2RPOkuzSNef0G+Sfjf+cXIN6VUwHKEKaXTQOTMvpq1
         D+Y6QJYtss4PkZjfbK5CApnzDvi1KgxmPifJ1q8sza2EQDmTs/R3AxyYRYpSgPUVw1d6
         JKw8KQ/GjWZRMdXHA/xKNkIPardBUIMX7ZCzhILl3IgQvLveKT/cbMXuwM+e15RnsvB+
         tZDVqP3I4YyqLHqdNK1vUa1obrmvtMq7cw89GoQFMr9cGGQrMcCLnl/+NY4jy7STRzji
         fjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=BC1lXR9My0kEeMf1Pli8nDN5rs3QFTrtRYa4RSg1+nI=;
        b=EJ8F1FH7TZj4qCWoaIiN8+++j6u0EiJn+BC4QWA5bZJbaSn3QdqlO5qzJKNBiH8vmS
         ZFzdMZ6u6BQRCnQVTfsL+lrpvDDMO5kE2M1uhbMXp3bH5gYzC8IDnJA+HLNR/B/ArNIo
         2Xiz9NsVu+HDOW3tZo8p0Gl4y2rCfsBt2OJZlaIMZbXkwKI86rwqLANdMnYsrj5BLxsc
         fvzKcKfngwICwfmUyEBeoAFlkeWRC40NjLF2JuIT2+gQxLMtCnZp6yTdhfGUfzHcZDcw
         r1MPriwWEQ3RLpcLxGza9rg4J1hB7R767rjzFcf7/yxDrnQ5aE35BcDWWkFAp3nQW5LS
         LdOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u39si2465672ybd.449.2018.01.08.06.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 06:02:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYY0F-00079Z-Mu
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 09:02:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eYY02-00076N-04
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eYXzw-0005PR-1n
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:02:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:25070)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eYXzv-0005OW-Pj; Mon, 08 Jan 2018 09:01:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B72CEC0587D2;
	Mon,  8 Jan 2018 14:01:54 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D4086090A;
	Mon,  8 Jan 2018 14:01:44 +0000 (UTC)
Date: Mon, 8 Jan 2018 15:01:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20180108150143.30b5e38b@redhat.com>
In-Reply-To: <aaab7bfd-d3ed-aa50-f09e-89d6ccf556ff@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-5-f4bug@amsat.org>
	<20180108135437.4ab656fb@redhat.com>
	<cf14bfc3-3256-575a-fb4b-69f63d5bdb3b@redhat.com>
	<aaab7bfd-d3ed-aa50-f09e-89d6ccf556ff@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 08 Jan 2018 14:01:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 4/6] arm/xlnx-zynq: use FDT
 names for the Cadence UART
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
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u5bL9dwtsqjK

On Mon, 8 Jan 2018 10:51:38 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> On 01/08/2018 10:17 AM, Thomas Huth wrote:
> > On 08.01.2018 13:54, Igor Mammedov wrote: =20
> >> On Thu,  4 Jan 2018 11:40:44 -0300
> >> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >> =20
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> ---
> >>>  hw/arm/xilinx_zynq.c | 1 +
> >>>  hw/arm/xlnx-zynqmp.c | 2 +-
> >>>  2 files changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> >>> index 1836a4ed45..c45c364583 100644
> >>> --- a/hw/arm/xilinx_zynq.c
> >>> +++ b/hw/arm/xilinx_zynq.c
> >>> @@ -236,6 +236,7 @@ static void zynq_init(MachineState *machine)
> >>>      sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFS=
ET]);
> >>>      sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFS=
ET]);
> >>> =20
> >>> +    /* "xlnx,xuartps" */
> >>>      cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hds=
[0]);
> >>>      cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hds=
[1]);
> >>> =20
> >>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> >>> index 325642058b..38f038786c 100644
> >>> --- a/hw/arm/xlnx-zynqmp.c
> >>> +++ b/hw/arm/xlnx-zynqmp.c
> >>> @@ -155,7 +155,7 @@ static void xlnx_zynqmp_init(Object *obj)
> >>>      }
> >>> =20
> >>>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
> >>> -        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADE=
NCE_UART);
> >>> +        object_initialize(&s->uart[i], sizeof(s->uart[i]), "xlnx,zyn=
qmp-uart"); =20
> >>
> >> I don't think that commas are valid symbol in type names
> >> (if I recall correctly it should be letters, numbers and '-') =20
> >=20
> > At least commas are a real PITA when you try to use such devices with
> > the "-device" CLI parameter. We should try to avoid this if possible, I
> > think. =20
>=20
> Ok, good to know.
>=20
> I was following Linux Device Tree names [1] to avoid handling some
> fdt_qemu_to_linux[] & fdt_linux_to_qemu conversion arrays.
>=20
> What about keeping using the QEMU default name for -device CLI param and
> allow aliases for FDT parsing?
> With this series the cadence_uart_info is now:
>=20
> static const TypeInfo cadence_uart_info =3D {
>     .name          =3D TYPE_CADENCE_UART,
>     .aliases       =3D (const char * []) {
>                         "cdns,uart-r1p8",
>                         "xlnx,xuartps",
>                         "cdns,uart-r1p12",
>                         "xlnx,zynqmp-uart",
>                         NULL
>                      },
No need to pollute Object for this,
It might be better if you make it interface and type will implement it.
But honestly putting desired name in place at the place FDT binding is crea=
ted
is much simpler and one can adapt it to a specific board as needed.


>=20
> [1]:
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/serial/cdns,uart.txt
>=20

