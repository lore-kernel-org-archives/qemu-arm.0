Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3932935lfp;
        Mon, 27 Jan 2020 08:15:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxjiWboJWBZRJSN3sMOZaVWWDCnu8sdddjHABMYdnfB3iqWHwQxdU9lNXLu/Id3vqFbNMN
X-Received: by 2002:a05:620a:1509:: with SMTP id i9mr16154433qkk.447.1580141745411;
        Mon, 27 Jan 2020 08:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580141745; cv=none;
        d=google.com; s=arc-20160816;
        b=kSXMqRqqFxlHexEEouYubvfHMfplTCAV1zJXNteuySP0vWFSX1cSyKTTioLUGxDayE
         Ybcg0aiBpigf7auBSAwdBOBU1FZkYwfog4TJCkrdtmi3SKXvEwNvU1ohLnD5M7a74N9B
         yRJi15Zf1MZyLwTxiNXmMTXXyOW9kc47P0vuZRGC8xY5qozRDsPEJrVK6SGWqimofG2u
         4ZSkFWALPSFZ5Ixsh1DDUTZYuV5D3SupEA2eZo6TTFhESCePLExxpwQqn5gTCWl9oog2
         brk7ylc3F9zV2vI5kdoP+1s6EW3WIPaCR057DUmsrub4JPeE1gnnnSV320mw5VLn0U5R
         Q/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=Dj7QIN1+MoxU3tR+bRA4GkKXxZ3NCp2a4N/Dz5RnPJ8=;
        b=DLktuCLJZdtJCAUT9KBfgIWTRsZ+tyz1z2EkkLlz3dJkd4THWuREAhQ4fpuMiP/iMi
         eqsPTj/YyYgh9tWj6rs3lrrDTubOsPtOqjttMTCSf2mxesE2LQXbS6EV83UNQdhGUIZy
         x6grV4ROSUzwznnkuzTGyuoLcbObjwbt1tUVKSjqjd1w/cnqLc4TK3QfnELOm130fxv6
         WKraCAzF4u/KJLjFZgtgdq04Sz2fYCMQt9aQXuYvmLmI5Vg8Xlu97lE0pcWtKydK+2bn
         QIfVUIazk7Ugh/CMRhK2xpuG8krrOOzq+D6UMn3OhcFNAwOdN12MV+ln3BvfEq4YeBVd
         yDdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JDeSv56H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si9665699qtu.162.2020.01.27.08.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 08:15:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JDeSv56H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iw73A-0000lY-RU
	for alex.bennee@linaro.org; Mon, 27 Jan 2020 11:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57781)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iw730-0000iz-8W
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iw72x-0002Ty-Qt
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:15:33 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21041
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iw72x-0002Qx-0w
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580141729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Dj7QIN1+MoxU3tR+bRA4GkKXxZ3NCp2a4N/Dz5RnPJ8=;
 b=JDeSv56HZe/rtHF3ly7hZEEK53VQnhDKeglQ/wAOr3+w3tcNxULSdyUPQC9kgYeFVplUam
 287cg5/an4cP0pL1fOhUNDMl3SqK2XwNd8xPOmu5CjtkwAGbCVlVw9DPM//vvDo7bKzfj5
 4TDPjU7Eo7D2w0cSqLzNc9FBbMCfYmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-ibpgfjG8MMuKbj1E3AvAMQ-1; Mon, 27 Jan 2020 11:15:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A317685EE71;
 Mon, 27 Jan 2020 16:15:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-94.ams2.redhat.com [10.36.117.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3292B88836;
 Mon, 27 Jan 2020 16:15:12 +0000 (UTC)
Subject: Re: [PATCH v4 5/7] tests/boot_linux_console: Test booting U-Boot on
 the Raspberry Pi 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-6-f4bug@amsat.org>
 <d432f2d7-f238-0503-a242-373be81b7622@redhat.com>
 <5e986679-7aff-a33c-eefb-d878b72089ad@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <940afac4-2b25-0de9-9fd2-a9903d9fcd04@redhat.com>
Date: Mon, 27 Jan 2020 17:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5e986679-7aff-a33c-eefb-d878b72089ad@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ibpgfjG8MMuKbj1E3AvAMQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZofbVJzKUpYN

On 27/01/2020 17.09, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/27/20 5:02 PM, Thomas Huth wrote:
>> On 21/01/2020 00.51, Philippe Mathieu-Daud=C3=A9 wrote:
>>> This test runs U-Boot on the Raspberry Pi 2.
>>> It is very simple and fast:
>>>
>>> =C2=A0=C2=A0 $ avocado --show=3Dapp,console run -t raspi2 -t u-boot
>>> tests/acceptance/
>>> =C2=A0=C2=A0 JOB LOG=C2=A0=C2=A0=C2=A0 : avocado/job-results/job-2020-0=
1-20T23.40-2424777/job.log
>>> =C2=A0=C2=A0=C2=A0 (1/1)
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2=
_uboot:
>>>
>>> =C2=A0=C2=A0 console: MMC:=C2=A0=C2=A0 sdhci@7e300000: 0
>>> =C2=A0=C2=A0 console: Loading Environment from FAT... Card did not resp=
ond to
>>> voltage select!
>>> =C2=A0=C2=A0 console: In:=C2=A0=C2=A0=C2=A0 serial
>>> =C2=A0=C2=A0 console: Out:=C2=A0=C2=A0 vidconsole
>>> =C2=A0=C2=A0 console: Err:=C2=A0=C2=A0 vidconsole
>>> =C2=A0=C2=A0 console: Net:=C2=A0=C2=A0 No ethernet found.
>>> =C2=A0=C2=A0 console: starting USB...
>>> =C2=A0=C2=A0 console: USB0:=C2=A0=C2=A0 Port not available.
>>> =C2=A0=C2=A0 console: Hit any key to stop autoboot:=C2=A0 0
>>> =C2=A0=C2=A0 console: U-Boot>
>>> =C2=A0=C2=A0 console: U-Boot> bdinfo
>>> =C2=A0=C2=A0 console: arch_number =3D 0x00000000
>>> =C2=A0=C2=A0 console: boot_params =3D 0x00000100
>>> =C2=A0=C2=A0 console: DRAM bank=C2=A0=C2=A0 =3D 0x00000000
>>> =C2=A0=C2=A0 console: -> start=C2=A0=C2=A0=C2=A0 =3D 0x00000000
>>> =C2=A0=C2=A0 console: -> size=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x3c000000
>>> =C2=A0=C2=A0 console: baudrate=C2=A0=C2=A0=C2=A0 =3D 115200 bps
>>> =C2=A0=C2=A0 console: TLB addr=C2=A0=C2=A0=C2=A0 =3D 0x3bff0000
>>> =C2=A0=C2=A0 console: relocaddr=C2=A0=C2=A0 =3D 0x3bf64000
>>> =C2=A0=C2=A0 console: reloc off=C2=A0=C2=A0 =3D 0x3bf5c000
>>> =C2=A0=C2=A0 console: irq_sp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x3bb5fe=
c0
>>> =C2=A0=C2=A0 console: sp start=C2=A0=C2=A0=C2=A0 =3D 0x3bb5feb0
>>> =C2=A0=C2=A0 console: Early malloc usage: 2a4 / 400
>>> =C2=A0=C2=A0 console: fdt_blob=C2=A0=C2=A0=C2=A0 =3D 0x3bfbdfb0
>>> =C2=A0=C2=A0 console: U-Boot> version
>>> =C2=A0=C2=A0 console: U-Boot 2019.01+dfsg-7 (May 14 2019 - 02:07:44 +00=
00)
>>> =C2=A0=C2=A0 console: gcc (Debian 8.3.0-7) 8.3.0
>>> =C2=A0=C2=A0 console: GNU ld (GNU Binutils for Debian) 2.31.1
>>> =C2=A0=C2=A0 console: U-Boot> reset
>>> =C2=A0=C2=A0 console: resetting ...
>>> =C2=A0=C2=A0 PASS (0.46 s)
>>>
>>> U-Boot is built by the Debian project, see:
>>> https://wiki.debian.org/InstallingDebianOn/Allwinner#Creating_a_bootabl=
e_SD_Card_with_u-boot
>>>
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>> =C2=A0 tests/acceptance/boot_linux_console.py | 28 ++++++++++++++++++++=
++++++
>>> =C2=A0 1 file changed, 28 insertions(+)
>>>
>>> diff --git a/tests/acceptance/boot_linux_console.py
>>> b/tests/acceptance/boot_linux_console.py
>>> index e40b84651b..682b801b4f 100644
>>> --- a/tests/acceptance/boot_linux_console.py
>>> +++ b/tests/acceptance/boot_linux_console.py
>>
>> The file is called boot_*linux*_console.py ... so shouldn't tests that
>> don't use Linux rather go into another file instead?
>> Either machine_arm_raspi.py or maybe a boot_firmware_console.py file?
>=20
> Yes I have a series ready splitting boot_linux_console.py per machines
> (as suggested machine_arm_raspi.py) not for consistency with fw/linux
> but because I'm tired of fixing conflicts while rebasing since months.

Ah, great, good idea. That will also make it easier to assign the files
to entries in MAINTAINERS, I guess.

 Thanks,
  Thomas

