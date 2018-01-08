Received: by 10.28.173.206 with SMTP id w197csp2462085wme;
        Mon, 8 Jan 2018 05:18:42 -0800 (PST)
X-Google-Smtp-Source: ACJfBotGkR84q9Z0H4fKsB9o1+yDAVvpJJ5RI8pdcJoHur3P5Amdit2OwjMHTlQAC4us+Ud2BN7u
X-Received: by 10.37.101.137 with SMTP id z131mr9194088ybb.270.1515417522030;
        Mon, 08 Jan 2018 05:18:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515417522; cv=none;
        d=google.com; s=arc-20160816;
        b=Yv1V9grTb3Vf+HpHvt3U0QXmml7wCZlsjxROeJRZ9ZDzOJuDFPeLtaMaBISrpSPvba
         Cl19/QIcjplvUUtV1c5RIw0qho1U2UWDHgWw39yF3TQ17IlrBKNLlrotjLcJzhoPdYn0
         YgzX1qmvL1PE9yNiIQRCdmk1rFeuWjdrqkMtsvaXknfB/OEqlCDM+6kQ+Y/9Wys7EJS3
         RccnOlQSRfw03ajRHzjoMHnfnJ8CRWOxI2+um91qznfVz5aYwB2+z+BDESJLubXNUxWS
         iMM1vfRxclsOMEUF1IEvp01px1Icr3il9HWP606kiCoUkAOS0bvFfxlnkcJxlAcM7uKf
         SJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=k/aJATU0P1IzCuGM4NmMiXU9gQNI7kjMvaEr9/ZMpHg=;
        b=p+0Dk843ZE4m3B70FroNXMO2tKS4nqjwlnW0ZygBad0Wd70AW7Wh1jQBkTYu0QmHDz
         pgCyf0Tl+A3RJVAgsPavUOvaOaif3IuWmThvIiscmda2tXhke9YRtfl/19mxLrzUroAy
         QhQNDxyAsMHSOr7WCpdIY+kNwazoX4xDWWQbif6hlPvzBK9c0C63IC+SPsljYDjAsIiY
         L1WzajiwZNPJDFRI6d82j23Qm2959Npbk//QpU3kJ0HWRE+hKaoPh1TMggU4o56egaV6
         K++s2bDP9FGZ0l+4vnaK66q6+ZLf5JLidFr9q7j7puuKUbn47fVxYWdHFza9QhJI/HD2
         aiFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u91si167695ybi.471.2018.01.08.05.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 05:18:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYXK5-0007hU-FY
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 08:18:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eYXJb-0007Qj-5D
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 08:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eYXJW-0000Gp-Vj
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 08:18:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eYXJW-0000FH-PP; Mon, 08 Jan 2018 08:18:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0437152;
	Mon,  8 Jan 2018 13:18:05 +0000 (UTC)
Received: from [10.36.116.61] (ovpn-116-61.ams2.redhat.com [10.36.116.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D27AB60467;
	Mon,  8 Jan 2018 13:17:48 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-5-f4bug@amsat.org>
	<20180108135437.4ab656fb@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cf14bfc3-3256-575a-fb4b-69f63d5bdb3b@redhat.com>
Date: Mon, 8 Jan 2018 14:17:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180108135437.4ab656fb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 08 Jan 2018 13:18:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mibzYwwA5ufu

On 08.01.2018 13:54, Igor Mammedov wrote:
> On Thu,  4 Jan 2018 11:40:44 -0300
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  hw/arm/xilinx_zynq.c | 1 +
>>  hw/arm/xlnx-zynqmp.c | 2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index 1836a4ed45..c45c364583 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -236,6 +236,7 @@ static void zynq_init(MachineState *machine)
>>      sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSE=
T]);
>>      sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSE=
T]);
>> =20
>> +    /* "xlnx,xuartps" */
>>      cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hds[=
0]);
>>      cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hds[=
1]);
>> =20
>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>> index 325642058b..38f038786c 100644
>> --- a/hw/arm/xlnx-zynqmp.c
>> +++ b/hw/arm/xlnx-zynqmp.c
>> @@ -155,7 +155,7 @@ static void xlnx_zynqmp_init(Object *obj)
>>      }
>> =20
>>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
>> -        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADEN=
CE_UART);
>> +        object_initialize(&s->uart[i], sizeof(s->uart[i]), "xlnx,zynq=
mp-uart");
>
> I don't think that commas are valid symbol in type names
> (if I recall correctly it should be letters, numbers and '-')

At least commas are a real PITA when you try to use such devices with
the "-device" CLI parameter. We should try to avoid this if possible, I
think.

 Thomas
