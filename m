Received: by 10.25.30.65 with SMTP id e62csp1315728lfe;
        Wed, 25 May 2016 06:33:01 -0700 (PDT)
X-Received: by 10.140.19.5 with SMTP id 5mr3368476qgg.98.1464183181855;
        Wed, 25 May 2016 06:33:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c70si7984571qka.36.2016.05.25.06.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 06:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Yvl-000464-5l
	for alex.bennee@linaro.org; Wed, 25 May 2016 09:33:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b5Yer-0006O8-8J
	for qemu-arm@nongnu.org; Wed, 25 May 2016 09:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b5Yeg-0004nM-Bm
	for qemu-arm@nongnu.org; Wed, 25 May 2016 09:15:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b5Yeg-0004nD-6D; Wed, 25 May 2016 09:15:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8466D80B56;
	Wed, 25 May 2016 13:15:21 +0000 (UTC)
Received: from [10.36.112.49] (ovpn-112-49.ams2.redhat.com [10.36.112.49])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4PDFGaW021745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 May 2016 09:15:18 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
	xiaoqiang zhao <zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <963b4bae-1f00-7406-6de7-f0bd3be8d2bb@redhat.com>
Date: Wed, 25 May 2016 15:15:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 25 May 2016 13:15:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
Cc: Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+0LI=?= <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2kUSpaOIkWo8



On 25/05/2016 15:08, Peter Maydell wrote:
>> >      /* AUX / UART1 */
>> > -    /* TODO: don't call qemu_char_get_next_serial() here, instead s=
et
>> > -     * chardev properties for each uart at the board level, once pl=
011
>> > -     * (uart0) has been updated to avoid qemu_char_get_next_serial(=
)
>> > -     */
> This comment says this should be fixed by having board-level
> properties; you've removed it but this patch isn't adding
> the properties to this (SoC-level) device. I think the board
> level should be looking at serial_hds[], not this code.
>=20
>> > @@ -310,8 +312,7 @@ static void pl011_class_init(ObjectClass *oc, vo=
id *data)
>> >
>> >      dc->realize =3D pl011_realize;
>> >      dc->vmsd =3D &vmstate_pl011;
>> > -    /* Reason: realize() method uses qemu_char_get_next_serial() */
>> > -    dc->cannot_instantiate_with_device_add_yet =3D true;
> Why does instantiating with device_add work now? There's
> still no way to wire up interrupt lines or map mmio regions.
> (This has never made much sense to me -- Markus?)

You can create it with -device if your board provides a platform bus and
there's an FDT creator function.  If you don't, you get an error.

Regarding device_add, it's disabled anyway because sysbus is not
hotpluggable.

Eiter way it's safe to remove this line, which is for outliers that
otherwise would not give any error message.

Thanks,

Paolo
