Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3083084wrt;
        Thu, 29 Nov 2018 18:43:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UXYzM/AmDpAi8pAxuFZLXEMTY11pNy53VYfPNNtYzlNYCqNzFxYdAfrBeUXLgsNMl/ZE2a
X-Received: by 2002:a25:bdd3:: with SMTP id g19-v6mr3885279ybk.29.1543545780838;
        Thu, 29 Nov 2018 18:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543545780; cv=none;
        d=google.com; s=arc-20160816;
        b=ncDfvNPcvH0JF4Zgt5Nq8m0HxHXEA2J2s/9tKg+457vY6sqtZqRApbYu2Noibck6jI
         Eu4wCcMMcEJ4tvZZK/IL9lgVrABbI2zS2kWwOsPI6uY2l7aJrTxciM3VSyPyfUVkj0lV
         u7AqLoPDH7POFOzWOXySGrP4oHJVgxsj3YM2CGjYMFYVecc3HpAzlNBlrZXVX4roYdV4
         7yH/9BhxPK1e71/O3D6H8Cqloywhg/5e42jGcUYPFjrZPUCppNDdn84njV0T+P6lqx3a
         eqgaH38d+u9WsbbWOP0og5dcXM/SkJLMruPX3i4aEh0ueJGI8I2yeLM+fdt16eEN8pBa
         u/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date;
        bh=qne1wrU+snZktrRJJVghd3FlU9fTJkHdWohHq7OcbpY=;
        b=eT8cVwjQEa1wA2TMvrHeAD54/96kyoluEdYRBYcoIVn6ji3RTyj3AZQPEtMTexUW7P
         R7rFJcmkHQui8uGdfaUP2ZtjYqNVXoni3QFgD3whiqGbxPlac2qM0e21Mb81KeQWyXuH
         6OOnz59J2vd6rHQzyc82xDJs0bK4zxLBR6jssfRSa8xjdPV7AjPRuq3dRPwkERGYjgru
         GQPouzi2EY25oBvE1bzj3tHOUqcpOTqB+KbeaMcSrj6HmkzMYU836W2i8eBHdf86OqXS
         CCoMrbhMpROZeZvMGljufi8FOGSsALvvAI8SMK2n3xF/fUGklq2woocFLzr0Lkea5Vr4
         wRjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o186si2477726ywb.31.2018.11.29.18.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 18:43:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSYlg-0005LB-85
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 21:43:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1gSYlP-0005Hm-CF
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 21:42:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1gSYlM-0003Ll-3c
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 21:42:43 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1gSYlL-0003K0-Nn; Thu, 29 Nov 2018 21:42:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 7C7967456D1;
	Fri, 30 Nov 2018 03:42:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id E5B9174569F; Fri, 30 Nov 2018 03:42:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id AFEAA74569D;
	Fri, 30 Nov 2018 03:42:36 +0100 (CET)
Date: Fri, 30 Nov 2018 03:42:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <71296170-f917-2b24-e1e6-1c525265c2a6@roeck-us.net>
Message-ID: <alpine.BSF.2.21.9999.1811300305450.787@zero.eik.bme.hu>
References: <alpine.BSF.2.21.9999.1811292101280.5887@zero.eik.bme.hu>
	<a05ba14f-b261-bb8c-12a1-4c91d005961f@redhat.com>
	<71296170-f917-2b24-e1e6-1c525265c2a6@roeck-us.net>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1584510056-1543545756=:787"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-arm] Booting Raspbian on RPi emulation
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: othmIad4sd/U

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1584510056-1543545756=:787
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Nov 2018, Guenter Roeck wrote:
> On 11/29/18 4:43 PM, Philippe Mathieu-Daud=E9 wrote:
>> Hi Zoltan,
>>=20
>> On 29/11/18 21:29, BALATON Zoltan wrote:
>>> Hello,
>>>=20
>>> I could not boot Raspbian on QEMU's raspi emulation and I'm not sure =
why
>>> it fails. So question is if this is supposed to work or am I doing
>>> something wrong or any clues what may be missing? I'm trying with thi=
s
>>> command line with v3.1.0-rc3:
>>>=20
>>> qemu-system-arm -M raspi2 -serial stdio \
>>> -kernel rpi-kernel7.img -dtb bcm2709-rpi-2-b.dtb \
>>> -append "rw earlyprintk loglevel=3D8 console=3DttyAMA0,115200
>>> dwc_otg.lpm_enable=3D0 root=3D/dev/mmcblk0p2" \
>>> -drive file=3D2018-10-09-raspbian-stretch-lite.img,format=3Draw,if=3D=
sd
>>>=20
>>> Kernel starts to boot, I see raspberries on the guest screen and log
>>> output to serial:
>>>=20
>>> Booting Linux on physical CPU 0xf00
>>> Linux version 4.14.71-v7+ (dc4@dc4-XPS13-9333) (gcc version 4.9.3
>>> (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1145 SMP Fri Sep 21
>>> 15:38:35 BST 2018
>>> CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D10c5387d
>>> [...]
>>>=20
>>=20
>
> My version (https://github.com/groeck/qemu) seems to work, using

Tried with your v3.1.0-local branch but got same results (does not find=20
mmcblk0 on raspi2, nothing on raspi3) so probably it's not one of the=20
patches in your tree that's missing.

> multi_v7_defconfig.

Then maybe it's your kernel config that's different? Do you have compiled=
=20
kernels available that I could try?

Thank you,
BALATON Zoltan

> Logs from boots with qemu 3.0 and 3.1 attached.
>
> Command line:
>
> /opt/buildbot/qemu-install/v3.0/bin/qemu-system-arm \
> 	-M raspi2 -kernel arch/arm/boot/zImage -no-reboot \
> 	-snapshot -drive=20
> file=3Dcore-image-minimal-qemuarm.ext3,format=3Draw,if=3Dsd \
> 	--append 'earlycon=3Dpl011,0x3f201000 root=3D/dev/mmcblk0 rootwait rw=20
> console=3DttyAMA0 noreboot' \
> 	-dtb arch/arm/boot/dts/bcm2836-rpi-2-b.dtb \
> 	-nographic -monitor null -serial stdio
>
> Guenter
>
--3866299591-1584510056-1543545756=:787--
