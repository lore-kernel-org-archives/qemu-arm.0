Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3918504lfp;
        Mon, 27 Jan 2020 08:04:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqykEN0iU7kKpEl6VD6mqXIgq+byucZc67OVh+1rzYpYM0+V04GXSb2jvlv2S/SjZI356r84
X-Received: by 2002:ae9:e007:: with SMTP id m7mr11007887qkk.215.1580141044169;
        Mon, 27 Jan 2020 08:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580141044; cv=none;
        d=google.com; s=arc-20160816;
        b=sNMRlditq1NBdTgbfLU6oT3l46w9A0nfhv5r1dhdDRj97c2/ctyhJYGSjUZQJyRh4H
         PexvekuehhQJjoPjI/K6jvmAZidaphSG99XfGyuJnbSiXHAt5fM8YogVPPOTR16U0M6F
         YPK2yA5uO76vCeWwLJMfiE3sPe4Hbg0aEF5Hu5JhMieDvxT1gP02IJ9DqD6/3ObSlgDU
         i0EMSHSGQf9QwpzCExb8AJzKYjvT6dVwTGmDtgHcYqTFclEQEPwZDZCfdk/CpKAnx6+X
         EK+6ga9OjaPJi8ZY0aiKIcL8n75srohdmQ9gY8Vryhm6VvqZSgzJI9jGApWVyWQYt3fn
         8bBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=loIpsZIkwosFCXAjDjlBPhzh2PKJrGEFPIMU+fqO9jc=;
        b=LZd09n+LXh1FhSt0IyFLTsCHtsw2eod8//DtVO1dNBUYeSjQDIU+Cld0ev7aACHSIq
         j6DE5qYCTqZfY6JUXL0O69ZiEPGAnR51V+ctNuHGoWjN5h4fP8gevjeNc/+5AeKvko56
         jLhOmDsFpw5GgFllW9bRFtBcJt5B5AwmHgZrXNPbPKzj53a95KXCx0JZ4HHTXcCFNKOa
         4n4UUy53dMC76rFl4EKISWQbhRXO/BC31EGDd4C2W+VR+JKhaxtYB4mslsw75NsPvG34
         u003cQKroCJhou7tqHO/lIFHMproKRf73Lskoy4Gmt6Sl+CYgwuKjYJ5fmkbs0VZTK+9
         SsDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NXlAiIsv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si9254650qvo.104.2020.01.27.08.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 08:04:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NXlAiIsv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iw6rr-0000gV-Kv
	for alex.bennee@linaro.org; Mon, 27 Jan 2020 11:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iw6r5-00009w-3W
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:03:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iw6r2-0008R1-Sx
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:03:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28881
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iw6r2-0008QN-Ju
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580140991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=loIpsZIkwosFCXAjDjlBPhzh2PKJrGEFPIMU+fqO9jc=;
 b=NXlAiIsvEzIVMF/nH2AKEHnkN6BYI3Q6FiLuewWPfcFmBYFmlhmKgW9RoGkiFfdzLs8khg
 +saYblWPBMKyPQwY82Jd2n7hjY8PdE7X8J/9Ai2aaJmotxGqJZjzJXxS/ZLgXDdLFCbfKS
 URmUeGsArD17eExYtZNVz4uzQIuo/wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-EZ0tzpAFNAWQ0Rv-WKNBPA-1; Mon, 27 Jan 2020 11:03:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E10D81083E98;
 Mon, 27 Jan 2020 16:03:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-94.ams2.redhat.com [10.36.117.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E5C19C58;
 Mon, 27 Jan 2020 16:03:01 +0000 (UTC)
Subject: Re: [PATCH v4 5/7] tests/boot_linux_console: Test booting U-Boot on
 the Raspberry Pi 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-6-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d432f2d7-f238-0503-a242-373be81b7622@redhat.com>
Date: Mon, 27 Jan 2020 17:02:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-6-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: EZ0tzpAFNAWQ0Rv-WKNBPA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ukEMT452/pLQ

On 21/01/2020 00.51, Philippe Mathieu-Daud=C3=A9 wrote:
> This test runs U-Boot on the Raspberry Pi 2.
> It is very simple and fast:
>=20
>   $ avocado --show=3Dapp,console run -t raspi2 -t u-boot tests/acceptance=
/
>   JOB LOG    : avocado/job-results/job-2020-01-20T23.40-2424777/job.log
>    (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_raspi2_uboot:
>   console: MMC:   sdhci@7e300000: 0
>   console: Loading Environment from FAT... Card did not respond to voltag=
e select!
>   console: In:    serial
>   console: Out:   vidconsole
>   console: Err:   vidconsole
>   console: Net:   No ethernet found.
>   console: starting USB...
>   console: USB0:   Port not available.
>   console: Hit any key to stop autoboot:  0
>   console: U-Boot>
>   console: U-Boot> bdinfo
>   console: arch_number =3D 0x00000000
>   console: boot_params =3D 0x00000100
>   console: DRAM bank   =3D 0x00000000
>   console: -> start    =3D 0x00000000
>   console: -> size     =3D 0x3c000000
>   console: baudrate    =3D 115200 bps
>   console: TLB addr    =3D 0x3bff0000
>   console: relocaddr   =3D 0x3bf64000
>   console: reloc off   =3D 0x3bf5c000
>   console: irq_sp      =3D 0x3bb5fec0
>   console: sp start    =3D 0x3bb5feb0
>   console: Early malloc usage: 2a4 / 400
>   console: fdt_blob    =3D 0x3bfbdfb0
>   console: U-Boot> version
>   console: U-Boot 2019.01+dfsg-7 (May 14 2019 - 02:07:44 +0000)
>   console: gcc (Debian 8.3.0-7) 8.3.0
>   console: GNU ld (GNU Binutils for Debian) 2.31.1
>   console: U-Boot> reset
>   console: resetting ...
>   PASS (0.46 s)
>=20
> U-Boot is built by the Debian project, see:
> https://wiki.debian.org/InstallingDebianOn/Allwinner#Creating_a_bootable_=
SD_Card_with_u-boot
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index e40b84651b..682b801b4f 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py

The file is called boot_*linux*_console.py ... so shouldn't tests that
don't use Linux rather go into another file instead?
Either machine_arm_raspi.py or maybe a boot_firmware_console.py file?

 Thomas

