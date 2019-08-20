Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4093033wrs;
        Tue, 20 Aug 2019 08:09:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwXEsLr7Ze5pvHLJVmYE3Sbyd5adhFOmaH5b66ny0zC5e8gr8T1yyW52LSftA7LC/QziLe
X-Received: by 2002:a37:9e81:: with SMTP id h123mr26104937qke.347.1566313747637;
        Tue, 20 Aug 2019 08:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566313747; cv=none;
        d=google.com; s=arc-20160816;
        b=YCuzBN4Xcvupw+sXFX4iyDla4/bSAYsYp0guKnxBZU58imN6dqlIQDUtFCE8CJTIyL
         i+LyOl9l9Eyq2EMrnNKMlJmxo9jVJT9CTSbTGeskkjRB8zmQWjoLPyUskbxtS90x5gOx
         8zI0c4SnTg5UqS/ZIWk4TvN5/3ko4GEv/sL6ZUoqMvDl/czrocaH87DDaKtyAbzeLY1R
         gwpDktyddDFdl+TNTpuqVQCp/zSC5ujjHj3TjZYE3JRtIgu50QUCo+d+wyR+7Q5q9zvQ
         hAnwx3wS7jGLoUvD0Vm5Y/O+DPPraL6FTpdY9QPJE29ASk+k/QIk6IrG7GKR8C+Go/7o
         cj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=MwdJdqlu68ADDK1sbziq/UOa6mUeDoweKi+hml3UDKE=;
        b=0Chm8MN9gAmpCymOtXEH2QNcygyqKyBaX/ulN/kgZzkXUxq+I+psyVvavcI5Jzr7Yd
         byEarie/SW4jCj6lDVkUvI0vb9MAXKhZ/vazYXy7ZzD/KAyBh+H5jfUrVM/OMB2Jmxqb
         eTsSzcH2uOo7Tjs+/Dk5fymgY8jlEa1n7VPDhiBrDDE+yJmoqJmZcS3HLeuJxmQ+Qh4+
         g+nw29aOAwiF+1EuzGbZVX6/FovgjpectmLtdbgXAVSqHuaq9/7qus+Cr9WutVlXBWL9
         +MAeaPbuO6T3SpHKJ/6Mp9dajnYuWB6TRM2ytPlkkMkAeDx25RP7f+2tpZnu9DY9QwOk
         uOVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x55si10753218qtk.67.2019.08.20.08.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 08:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i05kx-0007PN-1S
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 11:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i05kB-0006U2-RA
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:08:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i05kA-0002gQ-5N
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:08:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i05k9-0002fy-TP
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:08:18 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF8855AFE9
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 15:08:16 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id a17so7225544wrw.3
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 08:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H6lEqg+qbEwqiv/+HCf8Mi53roJeWwDp1Nga5QWpIMk=;
 b=bH3OVw7MW5ARFkGbFG9tQEUC1Om7lQ2JPGY6kPp7HjytzDB2EBJ6or2QC1iR6HlRIk
 TqESzqdPmhkEjo9toe2075piWaeh8JdJJZOZqy6d3djKU34xKI8hLAWKLjNsYOq5aBN8
 RYyBqI5WFLpQlJxwlMPQuM1hCtUwkMrn4DG4pVFYzgQID6k7NLKod1UB3qG3AlVybz2R
 r0Mc2+lV5dMr5m1nxllVRIF3jMFoBVMaoEefI3HIX/KFQNOaoONQZInqHdVb45yHSIxj
 BUvn6W6dj4mmQ6Ya9zmCU7p7oZx8tbO/Ax6TiD/XcsdmpdhPyuB7+sRtaDDsvsiga8hU
 H/iQ==
X-Gm-Message-State: APjAAAWlDAjzN5AxC48VO48RzLo9FHXTcV8Pn96YWQPbxgoKj5vXwyA0
 3fgCk4ZXcGe+RASX/3WiPuzE2BuY5UrHOeNG1ck/hAnPPznx/+MNMPxlJxtLhZdeTqepsyxF1io
 YTEavwpfI714/OGQ=
X-Received: by 2002:adf:dbcd:: with SMTP id e13mr33529417wrj.314.1566313695316; 
 Tue, 20 Aug 2019 08:08:15 -0700 (PDT)
X-Received: by 2002:adf:dbcd:: with SMTP id e13mr33529382wrj.314.1566313695076; 
 Tue, 20 Aug 2019 08:08:15 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id i5sm19929710wrn.48.2019.08.20.08.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2019 08:08:14 -0700 (PDT)
To: Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
References: <20190820123417.27930-1-philmd@redhat.com>
 <3e3fcb30-1e12-eaf4-07a2-47d09aea2511@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <509576fb-6fc1-7812-f73f-bda210c5ce99@redhat.com>
Date: Tue, 20 Aug 2019 17:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3e3fcb30-1e12-eaf4-07a2-47d09aea2511@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 0/2] hw/char/bcm2835_aux: Provide full
 16550 UART support
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4jUTDRJge0T

On 8/20/19 4:31 PM, Guenter Roeck wrote:
> On 8/20/19 5:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi,
>>
>> Since there has been some activity on the list asking about
>> Rasberry PI USB support, I had a look a some previous unfinished
>> work and rebased it to share, in case it helps hobbyist interested
>> in improving these machines.
>>
>> This series is some proof-of-concept on improving the AUX UART
>> support. See the commit description for various TODO/questions.
>>
>> This can be tested using files documented by Peter Maydell in
>> his blog post:
>> https://translatedcode.wordpress.com/2018/04/25/debian-on-qemus-raspbe=
rry-pi-3-model/
>>
>>
>> And using the kernel command line arguments suggested by Guenter Roeck=
:
>>
>> qemu-system-aarch64 -M raspi3 -m 1024 \
>> =C2=A0=C2=A0 -kernel raspi3/bootpart/vmlinuz-4.14.0-3-arm64 \
>> =C2=A0=C2=A0 -initrd raspi3/bootpart/initrd.img-4.14.0-3-arm64 \
>> =C2=A0=C2=A0 -dtb raspi3/bootpart/bcm2837-rpi-3-b.dtb \
>> =C2=A0=C2=A0 -append 'earlycon=3Duart8250,mmio32,0x3f215040 rdinit=3D/=
sbin/init
>> panic=3D-1 console=3DttyS1,115200' \
>> =C2=A0=C2=A0 -drive
>> file=3Draspi3/2018-01-08-raspberry-pi-3-buster-PREVIEW.img,format=3Dra=
w,if=3Dsd
>> \
>> =C2=A0=C2=A0 -serial null -serial stdio \
>> =C2=A0=C2=A0 -d unimp,guest_errors -trace bcm283\*
>=20
> [ ... ]
>=20
>> [=C2=A0=C2=A0=C2=A0 3.123313] Unpacking initramfs...
>>
>> Here it hangs, even with CPRMAN patch from Guenter:
>> https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg03153.html
>>
>=20
> This command line works for me:
>=20
> qemu-system-aarch64 -M raspi3 -kernel arch/arm64/boot/Image -no-reboot =
\
> =C2=A0=C2=A0=C2=A0=C2=A0-nographic -snapshot -smp 4 -m 1G \
> =C2=A0=C2=A0=C2=A0=C2=A0-drive file=3Drootfs.ext2,format=3Draw,if=3Dsd =
\
> =C2=A0=C2=A0=C2=A0=C2=A0-serial null -serial stdio -monitor none -no-re=
boot \
> =C2=A0=C2=A0=C2=A0=C2=A0--append 'panic=3D-1 slub_debug=3DFZPUA root=3D=
/dev/mmcblk0 rootwait
> earlycon=3Duart8250,mmio32,0x3f215040 console=3DttyS1,115200' \
> =C2=A0=C2=A0=C2=A0=C2=A0-dtb arch/arm64/boot/dts/broadcom/bcm2837-rpi-3=
-b.dtb
>=20
> or, with initrd:
>=20
> qemu-system-aarch64 -M raspi3 -kernel arch/arm64/boot/Image -no-reboot =
\
> =C2=A0=C2=A0=C2=A0=C2=A0-nographic \
> =C2=A0=C2=A0=C2=A0=C2=A0-initrd rootfs.cpio \
> =C2=A0=C2=A0=C2=A0=C2=A0-m 1G -serial null -serial stdio -monitor none =
-no-reboot \
> =C2=A0=C2=A0=C2=A0=C2=A0--append 'panic=3D-1 slub_debug=3DFZPUA rdinit=3D=
/sbin/init
> earlycon=3Duart8250,mmio32,0x3f215040 console=3DttyS1,115200' \
> =C2=A0=C2=A0=C2=A0=C2=A0-dtb arch/arm64/boot/dts/broadcom/bcm2837-rpi-3=
-b.dtb
>=20
> This is with the mainline kernel.
>=20
> I don't see a significant difference to your patch series.

Thank you for taking the time to test!

The biggest difference is the diffstat:

 hw/char/bcm2835_aux.c         | 211 +++-------------------------------

The model is now cleaner and easier to maintain.

The logical differences are noted in 2nd patch, basically:
1- not same FIFO length (easily fixable)
2- now the model implements more feature than supposed to
3- migration

I'll wait for the different ARM/Migration subsystem review.

[...]
> One possibility might be that your initrd has a problem. Can you boot
> without your patch
> series, or is it always stuck ?

I remember it used to work for me back when I wrote it, so it is
probably an initrd problem. I'll test later and keep you updated.

Thanks!

Phil.
