Received: by 10.25.27.66 with SMTP id b63csp59367lfb;
        Fri, 27 May 2016 02:40:41 -0700 (PDT)
X-Received: by 10.55.168.86 with SMTP id r83mr116157qke.24.1464342041021;
        Fri, 27 May 2016 02:40:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y88si3421713qtd.89.2016.05.27.02.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 02:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6EG0-0006bU-Gh
	for alex.bennee@linaro.org; Fri, 27 May 2016 05:40:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b6EFw-0006bA-MU
	for qemu-arm@nongnu.org; Fri, 27 May 2016 05:40:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b6EFq-0000R0-Ni
	for qemu-arm@nongnu.org; Fri, 27 May 2016 05:40:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b6EFq-0000Qn-HT; Fri, 27 May 2016 05:40:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24796D4E55;
	Fri, 27 May 2016 09:40:28 +0000 (UTC)
Received: from [10.36.112.66] (ovpn-112-66.ams2.redhat.com [10.36.112.66])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4R9eMma012677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2016 05:40:24 -0400
To: xiaoqiang zhao <zxq_yx_007@163.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
	<963b4bae-1f00-7406-6de7-f0bd3be8d2bb@redhat.com>
	<5747AD41.9050007@163.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3565905e-3796-e459-f69b-d3daac2728dd@redhat.com>
Date: Fri, 27 May 2016 11:40:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <5747AD41.9050007@163.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 27 May 2016 09:40:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
X-TUID: 6KOfecRkaiMS



On 27/05/2016 04:13, xiaoqiang zhao wrote:
>=20
>=20
> =E5=9C=A8 2016=E5=B9=B405=E6=9C=8825=E6=97=A5 21:15, Paolo Bonzini =E5=86=
=99=E9=81=93:
>>>>> @@ -310,8 +312,7 @@ static void pl011_class_init(ObjectClass *oc,
>>>>> void *data)
>>>>> >> >
>>>>> >> >      dc->realize =3D pl011_realize;
>>>>> >> >      dc->vmsd =3D &vmstate_pl011;
>>>>> >> >-    /* Reason: realize() method uses
>>>>> qemu_char_get_next_serial() */
>>>>> >> >-    dc->cannot_instantiate_with_device_add_yet =3D true;
>>> >Why does instantiating with device_add work now? There's
>>> >still no way to wire up interrupt lines or map mmio regions.
>>> >(This has never made much sense to me -- Markus?)
>> You can create it with -device if your board provides a platform bus a=
nd
>> there's an FDT creator function.  If you don't, you get an error.
>>
>> Regarding device_add, it's disabled anyway because sysbus is not
>> hotpluggable.
>>
>> Eiter way it's safe to remove this line, which is for outliers that
>> otherwise would not give any error message.
> Paolo: Do I need to send a new version to keep the
>=20
> "dc->cannot_instantiate_with_device_add_yet =3D true"
> untouched ?

No, you should remove it.  cannot_instantiate_with_device_add_yet is set
if you cannot_instantiate_with_device_add_yet *and* there is no code
elsewhere to detect that.

Thanks,

Paolo
