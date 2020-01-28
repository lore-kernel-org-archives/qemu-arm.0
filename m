Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp865525lfp;
        Tue, 28 Jan 2020 11:30:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHNYnklGfWaQYipzw4AWrtytry6awY1nhbJFQM0fNv21iYTlE6n5DQm36nDfmmCrHJKVjB
X-Received: by 2002:ae9:e50b:: with SMTP id w11mr17002830qkf.110.1580239826337;
        Tue, 28 Jan 2020 11:30:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580239826; cv=none;
        d=google.com; s=arc-20160816;
        b=z00HvC1QrTl+pmDMGzwaNGq0HSvGO3i11HcpLL3wDiX9kWoN3Vu5uSY2DWYgotIMO7
         joW3/XeREHi3iLphss6S2U5KaJUI+L2A+WHvhVoChbGfIMgkk+qqZGI6P8pyVTEETPtf
         8DRstA0trVz0X5HEx242JDIliDRRXVqgvEnr4z+tb7zjrAVtFlHCA+/DXRfbhZ21jrxe
         WihdmRQTfBb12IfxHzTTXsETVroWXvvDA0iRhLvvo8WN5NAf61Wb6fsQgpXpx1g2DONO
         Cf00+O5gzhj65JrygNGAKfJxITd69CxA4Td7nsyznl6ocfBXW4UCapOjdjzSKQrrRgHL
         LHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sGYyL3AJozgaZqRan8b5wu293Ab4Fu7mDTkq0udVR3M=;
        b=PvgZjEFSJ5yzb8rzzDc1GoaUNcjorhss/3L3Xt78K0l/oo2j30kHs+xC7LRlOTgpWe
         SPxbtwlv+MHScXFLP5IsCJ8Y3ikVk4GwjLQ64966z6p8wmq92ZKMF4Hunqw/l+9XmJZg
         mvKEITF4/LqDGzry6LW3IRkMkarjfSeF51epMTHoX95SRIgTBhDQoAPASz2MHRzUAQfi
         F2GSpurGsHLlLusZiNKJUxOoc/yOeyZZJkJ5FJcNdRmDHOrVXhMtDb0pCkodkLvabIz0
         N48bDqmQ5wdDujvxEeaojr8Nl9bkSn2/bVMHVGeTx1LeDD7R+pzTEhm6DXN5LDZd3iml
         Ag0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LonT7R+c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a24si13644164qkl.182.2020.01.28.11.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 11:30:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LonT7R+c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwWZ7-0000O1-Mu
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 14:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iwWIT-00012W-Ia
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 14:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iwWIP-0004OI-UM
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 14:13:12 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26909
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iwWIL-0004Gr-KR
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 14:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580238784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGYyL3AJozgaZqRan8b5wu293Ab4Fu7mDTkq0udVR3M=;
 b=LonT7R+cBRvvRIS9AZE/5FCVP7AxiQUOzQ/vrjJUspn9xfPpwBnsAUctYs/YyGdIANjNsa
 TEzjpQp57+87YrAL2AwTsiNLTJq9TdnFReianNOMgF1//S4a1bqXLggvgD1gPX+PKRx9LY
 WqOUA/297iurwv1c8wL3ajwYMlIFe+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-7B8BuBy-MPG6RrlOMOkZxA-1; Tue, 28 Jan 2020 14:13:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E6E8800D41;
 Tue, 28 Jan 2020 19:13:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-65.gru2.redhat.com
 [10.97.116.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1E335C1D8;
 Tue, 28 Jan 2020 19:12:54 +0000 (UTC)
Subject: Re: [PATCH v4 4/7] python/qemu/machine: Allow to use other serial
 consoles than default
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-5-f4bug@amsat.org>
 <6542670c-341f-b259-5705-a5374c5b722d@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <3eda43e0-32cc-712f-7d9c-357aeb194e05@redhat.com>
Date: Tue, 28 Jan 2020 17:12:52 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <6542670c-341f-b259-5705-a5374c5b722d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 7B8BuBy-MPG6RrlOMOkZxA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R+o1JZWXE40A


On 1/21/20 6:20 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/21/20 12:51 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Currently the QEMU Python module limits the QEMUMachine class to
>> use the first serial console.
>>
>> Some machines/guest might use another console than the first one as
>> the 'boot console'. For example the Raspberry Pi uses the second
>> (AUX) console.
>>
>> To be able to use the Nth console as default, we simply need to
>> connect all the N - 1 consoles to the null chardev.
>>
>> Add an index argument, so we can use a specific serial console as
>> default.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> v2:
>> - renamed 'console_index', added docstring (Cleber)
>> - reworded description (pm215)
>> ---
>> =C2=A0 python/qemu/machine.py | 9 ++++++++-
>> =C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index 734efd8536..ef9f5b213f 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -241,6 +241,8 @@ class QEMUMachine(object):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 'chardev=3Dmon,mode=3Dcontrol'])
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self._machine =
is not None:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 args.extend(['-machine', self._machine])
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in range(self._console=
_index):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args=
.extend(['-serial', 'null'])
>
> This patch is not sufficient, we have to initialize _console_index in=20
> __init__():
>
> -- >8 --
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index ef9f5b213f..183d8f3d38 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -112,6 +112,7 @@ class QEMUMachine(object):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._sock_dir =3D sock_=
dir
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._launched =3D False
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._machine =3D None
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._console_index =3D 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._console_set =3D Fa=
lse
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._console_device_typ=
e =3D None
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._console_address =
=3D None
> ---
>

OK, with that fix:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


> Else for tests not calling self.set_console() we get:
>
> =C2=A0'QEMUMachine' object has no attribute '_console_index'
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self._console_=
set:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 self._console_address =3D os.path.join(self._sock_dir,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self._name +=20
>> "-console.sock")
>> @@ -527,7 +529,7 @@ class QEMUMachine(object):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._machine =3D=
 machine_type
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 def set_console(self, device_type=3DNone):
>> +=C2=A0=C2=A0=C2=A0 def set_console(self, device_type=3DNone, console_in=
dex=3D0):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sets the device t=
ype for a console device
>> =C2=A0 @@ -548,9 +550,14 @@ class QEMUMachine(object):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 chardev:console" command line argument=20
>> will
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 be used instead, resorting to the=20
>> machine's
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 default device type.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @param console_index: the in=
dex of the console device to use.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If not zero, the command line will create
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'index - 1' consoles and connect them to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the 'null' backing character device.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._console_set=
 =3D True
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._console_dev=
ice_type =3D device_type
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._console_index =3D cons=
ole_index
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @property
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def console_socket(self):
>>
>
>

