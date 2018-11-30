Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3539539wrt;
        Fri, 30 Nov 2018 04:54:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UcuMxzOqmYLvqwNi8w/KcCnHJRY4JABBbzXiUKmGli2oKflNkqiDk7/Uc0yr2t4Yy8nRmv
X-Received: by 2002:a81:2548:: with SMTP id l69mr5381843ywl.397.1543582447307;
        Fri, 30 Nov 2018 04:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543582447; cv=none;
        d=google.com; s=arc-20160816;
        b=xxZ9wRtzlmriOq6/TpXJXExdUIq7i5rfDJNGWxt/5D9UfUtjSxF6lL4YkZ8T4rvMJf
         jjGgKQhAu33fYJHHFWYqE3jsq6/fSQqKUIT0mrH5pUo2PeSuWsgi9rRo7hPOzNp4pg8k
         O4DL4gvpOL57xUV0VZcAEVIRtAXQhnQ8S5ouq5/wRZcTRXKJs9mlBO+tNwSr5vmVE+23
         EDoq+5LutzBOnJWkwMTaIaXrhUnSx22VgUrk8b0+MdarYf+ganbs+00KJ9Fc+7pfxLWZ
         NWXor6oLt0TP3Sfxdzl+i2FCBULGfOozE7kxoHzmj0/JVsHsrz5XOYIXiW4+eUgWn9x9
         OqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date;
        bh=v6ovxxqe5a885GyDorOfdFYpCmKMKge3JhslzULPwaQ=;
        b=SR27Fj1MLKpBWbPtbM6UIs0e8F+7tEIacamMpFhtJ/ZDeJWIYn9zAfmzZoMUiFAbvf
         Naxgp8LTCeEfwd8x6UTIHsV4XSvsSkIc5JBy6VOcP5IxpbsXNS+5ZiVuBTJsKz11tTSJ
         JwKp6I9dDDdB+gOxJGagIi+maMo6S1rTjmlf+/kShklIJy0FISStWXiTxE4G5xLfvFeY
         NdZNfYu0B9gLmJ8VqDrueh8F9MkB9BFhUTiVl3Xi0EgqQQw1x/2Njs8D8fO//sWkgDGw
         JVRQ8GD3m9jVceBJpDsc+Z4Hwlt6b6wxaFkeubSsoxQ0+EoG8cFcPfOkaoTAe5EmEIwB
         hQFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y18si3124974ywg.82.2018.11.30.04.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 04:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiJ4-0005Jm-Ng
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 07:54:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1gSiFj-0008I7-Lb
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 07:50:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1gSi2I-0003H5-OF
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 07:36:53 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:39919)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1gSi2I-0003Gq-DK; Fri, 30 Nov 2018 07:36:46 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 44C18745703;
	Fri, 30 Nov 2018 13:36:45 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 1B83E7456E5; Fri, 30 Nov 2018 13:36:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 1A9D37456E4;
	Fri, 30 Nov 2018 13:36:45 +0100 (CET)
Date: Fri, 30 Nov 2018 13:36:45 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <a1b3027f-702a-5abb-ad93-8499f1e5e890@roeck-us.net>
Message-ID: <alpine.BSF.2.21.9999.1811301330340.67368@zero.eik.bme.hu>
References: <alpine.BSF.2.21.9999.1811292101280.5887@zero.eik.bme.hu>
	<a05ba14f-b261-bb8c-12a1-4c91d005961f@redhat.com>
	<71296170-f917-2b24-e1e6-1c525265c2a6@roeck-us.net>
	<alpine.BSF.2.21.9999.1811300305450.787@zero.eik.bme.hu>
	<a1b3027f-702a-5abb-ad93-8499f1e5e890@roeck-us.net>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="3866299591-990447038-1543581405=:67368"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
X-TUID: qR5bq2v0D3ak

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-990447038-1543581405=:67368
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Nov 2018, Guenter Roeck wrote:
> On 11/29/18 6:42 PM, BALATON Zoltan wrote:
>> On Thu, 29 Nov 2018, Guenter Roeck wrote:
>>> On 11/29/18 4:43 PM, Philippe Mathieu-Daud=E9 wrote:
>>>> Hi Zoltan,
>>>>=20
>>>> On 29/11/18 21:29, BALATON Zoltan wrote:
>>>>> Hello,
>>>>>=20
>>>>> I could not boot Raspbian on QEMU's raspi emulation and I'm not sur=
e why
>>>>> it fails. So question is if this is supposed to work or am I doing
>>>>> something wrong or any clues what may be missing? I'm trying with t=
his
>>>>> command line with v3.1.0-rc3:
>>>>>=20
>>>>> qemu-system-arm -M raspi2 -serial stdio \
>>>>> -kernel rpi-kernel7.img -dtb bcm2709-rpi-2-b.dtb \
>>>>> -append "rw earlyprintk loglevel=3D8 console=3DttyAMA0,115200
>>>>> dwc_otg.lpm_enable=3D0 root=3D/dev/mmcblk0p2" \
>>>>> -drive file=3D2018-10-09-raspbian-stretch-lite.img,format=3Draw,if=3D=
sd
>>>>>=20
>>>>> Kernel starts to boot, I see raspberries on the guest screen and lo=
g
>>>>> output to serial:
>>>>>=20
>>>>> Booting Linux on physical CPU 0xf00
>>>>> Linux version 4.14.71-v7+ (dc4@dc4-XPS13-9333) (gcc version 4.9.3
>>>>> (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1145 SMP Fri Sep 2=
1
>>>>> 15:38:35 BST 2018
>>>>> CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D10c5387d
>>>>> [...]
>>>>>=20
>>>>=20
>>>=20
>>> My version (https://github.com/groeck/qemu) seems to work, using
>>=20
>> Tried with your v3.1.0-local branch but got same results (does not fin=
d=20
>> mmcblk0 on raspi2, nothing on raspi3) so probably it's not one of the=20
>> patches in your tree that's missing.
>>=20
>>> multi_v7_defconfig.
>>=20
>> Then maybe it's your kernel config that's different? Do you have compi=
led=20
>> kernels available that I could try?
>>=20
>
> Shouldn't be, but I attached my configuration. This time with v4.14.84 =
and
> "make ARCH-arm savedefconfig" after building the image. The output is=20
> identical
> to "make ARCH=3Darm multi_v7_defconfig; make ARCH=3Darm savedefconfig".
>
> Oh, and here is my qemu configuration.
>
> --disable-user --disable-gnutls --disable-docs \
>        --disable-nettle --disable-gcrypt --disable-vnc-png \
>        --disable-xen --disable-xen-pci-passthrough \
>        --enable-debug --disable-strip
>
> That should not make a difference either, but who knows.
> Just to be sure, I copied a kernel and a root file system
> to http://server.roeck-us.net/qemu/arm-raspi2/

It boots with your kernel (also the raspbian-lite image) so it's likely=20
that the config of the Raspbian kernel is different and that causes the=20
problem. Unfortunately I don't know what config their kernels use. If I'm=
=20
not mistaken this is the raspbian kernel repo:

https://github.com/raspberrypi/linux/

My guesses would be bcm2835_defconfig or some other bcm*config? Or=20
something completely different?

Regards,
BALATON Zoltan
--3866299591-990447038-1543581405=:67368--
