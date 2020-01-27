Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3925176lfp;
        Mon, 27 Jan 2020 08:09:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzP3HQfh1fP9IsWT0arle4C8+wasa9oDK7dzqcz0MdrO17zPXPb207qjmym9VmqsdBSTe2/
X-Received: by 2002:a0c:8204:: with SMTP id h4mr17256593qva.137.1580141362349;
        Mon, 27 Jan 2020 08:09:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580141362; cv=none;
        d=google.com; s=arc-20160816;
        b=QBY9e/EP9yEv+4azUuZpFSZW31YXSnbdjx+hkr7sUd2RqXdvT5v32i7pIskEC7pfWP
         x6D0PePtCgJzVJn5IAnN/k3F2Dhpcn+UjGMDf9nI0UbOHLRRnqGaL0DNnAFtVozr1kUO
         Xtn4w6KC6ZTF9KitYotwhWW7c+54wLi9x6wjvIn/RDQi/uWeK+MXQPVhT+kA3uPJEkIk
         MiRL9VmcHWatFCK5pJ1vHcxRg8dEmLIfPniZl9grJGaUHlGqdGO1zW+KNsWjguLketh0
         ghhHa5JlM6Hz7onvwUp6tTZsL5Hc7CGHwq6xVECkx/BEMeRDOagKePMB+d5jCXBdYBH/
         2ocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nVmB7YcFiUwYBFjLmovIRl9f7swqE+gVuOWaQiP6Fuc=;
        b=SVLyseax+/z+rPGH0YCQ1QrcjMhGZMjAW9JAMUaSEtEs7S6STk5G4dwD3Emr374N5g
         IurzNeNHcQQAVjXbvouhZsarlD3uR0T2VnZawGNzvGjQ/uYxHAxlixTOnOIJJGB6CoVO
         IbjgB9UfVBQO9xC+IJly+a5UAMQdXylTBkeFEXtZHhyfAxTvr1raBQxp8sHUgEpIzOZr
         t4JqhJ4c4fCgCHbO1uiw/FTPxIGfDrZvwlL8v6fs0Ghw2zmI6kpqKNGuVctGvI9IJOTR
         momChCxkGYthNGILWJ/ZXnbqyX8v7Gt87a5nfrPgdDVdxM9CH6YIlaubYaXQdzRz+nwZ
         40vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WksGP+HG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si7209134qtb.351.2020.01.27.08.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 08:09:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WksGP+HG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iw6wz-00055Z-Pi
	for alex.bennee@linaro.org; Mon, 27 Jan 2020 11:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iw6wq-00055O-PD
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:09:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iw6wp-0004tX-I0
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:09:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40320
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iw6wp-0004t9-F7
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580141351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nVmB7YcFiUwYBFjLmovIRl9f7swqE+gVuOWaQiP6Fuc=;
 b=WksGP+HGV+gQVuwOfOXjf6tLnCCYoONNdYqlrWvwBSIIGFMpT/KGPIBhGCPLEppHZQrtA9
 sGsBMIGtf2tELfJ4pa3B9WAUbgOOX0ZZ+foo2azOSzp+LT2AEcQHM5BFMyc1J3q3mLhnNr
 zK9V6kh1G/Q+X1cdslG6KQF+Db+tNu4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-QhQzumcYPreJO2SF9E6-dQ-1; Mon, 27 Jan 2020 11:09:06 -0500
Received: by mail-wr1-f71.google.com with SMTP id z14so6344391wrs.4
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2020 08:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D+Yt3nJ7VwPy/OdeOqWBLKPQIy+lce60X+aaHgjgj0g=;
 b=h9fypCdPN/Y1EQwdn3dUvfylRpk7Yc8IH2IVLl9TlkeZXjGJ2+NTtTJYk9B1jjLNfc
 IqkGy1KXSvLOZWsDGcplHdm4r/s5OWhEpXKSN8O6if7IoWnK+7Wjb7OgEWCwJfFr4f6T
 j2rg0VZbQDKWKPGTKUabu6XpQGLRHpFuCEORsJ9S8g0NkGgn3wUkNaeXrLvVskID+uaB
 0J3mmlcLkrBEWSJt2flrLKHWWWlv3nMuVkzX9keMnkO/BZ90+SUBC2nXcAdQutaM2n9R
 NVRCLdbXcx/FqPArC6ssf0a0VXFPdJPorZ4cbz+rkVpRyAiPU+bSVyr6FQ7HTMKY4WPk
 F7jw==
X-Gm-Message-State: APjAAAV8fedmHWiWDtAXLjaK24JZhyZFE1dhVyeEhIrgQSejyYSURRFK
 dtQUWaLzw216I/cNKv4TmNOwnWuiTJu+K5svLlr5HgsMDQ3BmpEVFH7XyCx58OF1S3GLhT+gy9A
 JLswaWPajNRct
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr14683982wml.138.1580141345268; 
 Mon, 27 Jan 2020 08:09:05 -0800 (PST)
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr14683950wml.138.1580141344869; 
 Mon, 27 Jan 2020 08:09:04 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id z3sm21180411wrs.94.2020.01.27.08.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 08:09:04 -0800 (PST)
Subject: Re: [PATCH v4 5/7] tests/boot_linux_console: Test booting U-Boot on
 the Raspberry Pi 2
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-6-f4bug@amsat.org>
 <d432f2d7-f238-0503-a242-373be81b7622@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5e986679-7aff-a33c-eefb-d878b72089ad@redhat.com>
Date: Mon, 27 Jan 2020 17:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d432f2d7-f238-0503-a242-373be81b7622@redhat.com>
Content-Language: en-US
X-MC-Unique: QhQzumcYPreJO2SF9E6-dQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
X-TUID: UwN0vM9vUoqc

On 1/27/20 5:02 PM, Thomas Huth wrote:
> On 21/01/2020 00.51, Philippe Mathieu-Daud=C3=A9 wrote:
>> This test runs U-Boot on the Raspberry Pi 2.
>> It is very simple and fast:
>>
>>    $ avocado --show=3Dapp,console run -t raspi2 -t u-boot tests/acceptan=
ce/
>>    JOB LOG    : avocado/job-results/job-2020-01-20T23.40-2424777/job.log
>>     (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_a=
rm_raspi2_uboot:
>>    console: MMC:   sdhci@7e300000: 0
>>    console: Loading Environment from FAT... Card did not respond to volt=
age select!
>>    console: In:    serial
>>    console: Out:   vidconsole
>>    console: Err:   vidconsole
>>    console: Net:   No ethernet found.
>>    console: starting USB...
>>    console: USB0:   Port not available.
>>    console: Hit any key to stop autoboot:  0
>>    console: U-Boot>
>>    console: U-Boot> bdinfo
>>    console: arch_number =3D 0x00000000
>>    console: boot_params =3D 0x00000100
>>    console: DRAM bank   =3D 0x00000000
>>    console: -> start    =3D 0x00000000
>>    console: -> size     =3D 0x3c000000
>>    console: baudrate    =3D 115200 bps
>>    console: TLB addr    =3D 0x3bff0000
>>    console: relocaddr   =3D 0x3bf64000
>>    console: reloc off   =3D 0x3bf5c000
>>    console: irq_sp      =3D 0x3bb5fec0
>>    console: sp start    =3D 0x3bb5feb0
>>    console: Early malloc usage: 2a4 / 400
>>    console: fdt_blob    =3D 0x3bfbdfb0
>>    console: U-Boot> version
>>    console: U-Boot 2019.01+dfsg-7 (May 14 2019 - 02:07:44 +0000)
>>    console: gcc (Debian 8.3.0-7) 8.3.0
>>    console: GNU ld (GNU Binutils for Debian) 2.31.1
>>    console: U-Boot> reset
>>    console: resetting ...
>>    PASS (0.46 s)
>>
>> U-Boot is built by the Debian project, see:
>> https://wiki.debian.org/InstallingDebianOn/Allwinner#Creating_a_bootable=
_SD_Card_with_u-boot
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   tests/acceptance/boot_linux_console.py | 28 ++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/b=
oot_linux_console.py
>> index e40b84651b..682b801b4f 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>=20
> The file is called boot_*linux*_console.py ... so shouldn't tests that
> don't use Linux rather go into another file instead?
> Either machine_arm_raspi.py or maybe a boot_firmware_console.py file?

Yes I have a series ready splitting boot_linux_console.py per machines=20
(as suggested machine_arm_raspi.py) not for consistency with fw/linux=20
but because I'm tired of fixing conflicts while rebasing since months.

