Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3932716wrs;
        Tue, 20 Aug 2019 05:58:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8FYLqlEdfP8pzAPJEWw3vFUu2D7DppmTEGqS8UBgOHQWHoL5NrFdcRSqX6s3xEX8A7P6+
X-Received: by 2002:a37:6290:: with SMTP id w138mr24539173qkb.139.1566305897904;
        Tue, 20 Aug 2019 05:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566305897; cv=none;
        d=google.com; s=arc-20160816;
        b=t6ebP4EnKiNDMXiwzixPW6JicoINgW2u8ydgNsfDLZ7xfZ3X46sSLLnZNAQ6vTzn/j
         bLOPcKTZyh8fKi1lUEqso56TL0yxBNOEsC2l32d4rzdvb6z1fDENMEVGcniQ/nXS4mx7
         2KgZmeXXwnUvsDuCZKNyXQIT0sL42F0siRRXl5lITan3Be860nNjLCJkZK17eINXLz4A
         J1u+pnWJcIp+zIPL9MdtxOV849SJs0d+zxBcgw+m+3D0R2RLBdR5tM8y2OZ2aQFdXA20
         s+cQScnxCfNw9DJYYuq055jxrYgP7Z/hk+j+lx9AdZLwzHisFOwu+wTv9QvGknEkpSP/
         ukFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=32eeP+vlf9tKuUIivpKK3nYB/sMpqmsh0N4Yso8NDic=;
        b=kRa/f4tlqeOqOt/Qq8w2Sm+CnrfsXdn/Fs4ST2b7yweHs4JBWAb8trhDgMQFdDbOvg
         WZVNA/B/rQ9+3J5rGJOd0lUl1QHfOgyU3idzsxi4Hsl0mUPfn4oP4LMztYhNhYn158jG
         xr7ShDieH8oMHQksiWTqALKfGTQ9Fb3GkBJP3v7BtoLXsAlfbESkOfXZs8Osm13oN1ic
         q1kl5HaHLyWGDHeNRohHH058PRyeIQrMDFrkDZlk7SCHpHCRKCivb1zlrKUdLmwdxmE6
         VIEXIwQFodXPGGqqE686in22DMGTe/modCtsaV4MwmAHyRYTXScGsEyYLkwA2dh2aQTn
         3WSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si11703082qve.84.2019.08.20.05.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 05:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i03iL-0006v6-E3
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 08:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i03iC-0006ur-Gi
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 08:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i03iA-0005pk-Nr
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 08:58:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48156)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i03iA-0005pI-GQ
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 08:58:06 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 78B1C4FCD9
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 12:58:05 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id o13so6966112wrx.20
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 05:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=junqMnv+TBPNcwd9ITHrG+MeQHSSJ01OtzI2XYOIfMA=;
 b=k5BjoO25mPhQQ36laeGx3Cq+wwYQ+ZmCH7t4161B9vxGVk/93xFz3+dzStg2ugSiSS
 FaZMsswp8tJCWDhaRQSjUHjMJXLiyvUnMCZtX43ct8XctfWDDTeh39z14E2Z07K5eaiy
 LOiucHvardBpOIBQhw12LjA7MWRkEWnsLmKPYWh2wlcdhVgMC2sYNVTOEsFhj/VqobEN
 LgfxJDqdGy7NeCdjw13nzOd4gA8rD3z0PleI4B5jVku+C6cULVoBKfOE+g77bGQM82Sb
 vXf8ZgNF2aS6rILHEM4quSwGaaqxtU0IWl99p7+L7Fg+JCmcA3+jfHli98yNOteoPfct
 ZH2g==
X-Gm-Message-State: APjAAAUthj+EtVJWw26xPkLeyhzsWmPigXPNPY5ePKLh3liBPkE7khyK
 GBSTgONFqNFRDDJ22tjG83qz+/FBZlbQmV3595pbhmkpmASzXRi3gDZVW976oKp8Qb1+dF52M8T
 52CheR3m8q0MZ
X-Received: by 2002:a5d:424d:: with SMTP id s13mr35233773wrr.178.1566305884153; 
 Tue, 20 Aug 2019 05:58:04 -0700 (PDT)
X-Received: by 2002:a5d:424d:: with SMTP id s13mr35233739wrr.178.1566305883870; 
 Tue, 20 Aug 2019 05:58:03 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id c9sm5927595wrv.40.2019.08.20.05.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2019 05:58:03 -0700 (PDT)
To: qemu-devel@nongnu.org
References: <20190820123417.27930-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <472cf783-18c7-8de8-68a7-667947cc1109@redhat.com>
Date: Tue, 20 Aug 2019 14:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190820123417.27930-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 0/2] hw/char/bcm2835_aux: Provide full
 16550 UART support
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kwH8mkTsEXDM

On 8/20/19 2:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> Since there has been some activity on the list asking about
> Rasberry PI USB support, I had a look a some previous unfinished
> work and rebased it to share, in case it helps hobbyist interested
> in improving these machines.
>=20
> This series is some proof-of-concept on improving the AUX UART
> support. See the commit description for various TODO/questions.
>=20
> This can be tested using files documented by Peter Maydell in
> his blog post:
> https://translatedcode.wordpress.com/2018/04/25/debian-on-qemus-raspber=
ry-pi-3-model/
>=20
> And using the kernel command line arguments suggested by Guenter Roeck:
>=20
> qemu-system-aarch64 -M raspi3 -m 1024 \
>   -kernel raspi3/bootpart/vmlinuz-4.14.0-3-arm64 \
>   -initrd raspi3/bootpart/initrd.img-4.14.0-3-arm64 \
>   -dtb raspi3/bootpart/bcm2837-rpi-3-b.dtb \
>   -append 'earlycon=3Duart8250,mmio32,0x3f215040 rdinit=3D/sbin/init pa=
nic=3D-1 console=3DttyS1,115200' \
>   -drive file=3Draspi3/2018-01-08-raspberry-pi-3-buster-PREVIEW.img,for=
mat=3Draw,if=3Dsd \
>   -serial null -serial stdio \
>   -d unimp,guest_errors -trace bcm283\*
[...]
I forgot to add: the difference with what we have now, is all these
registers get now properly implemented:

bcm2836_control_write: Bad offset 0
bcm2836_control_write: Bad offset 8
bcm2835_aux_write: AUX_MU_MCR_REG unsupported
bcm2835_aux_write: AUX_MU_LCR_REG unsupported
bcm2835_aux_write: AUX_MU_LCR_REG unsupported
bcm2835_aux_write: AUX_MU_MCR_REG unsupported
bcm2835_property: unhandled tag 00030030
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_LCR_REG unsupported
bcm2835_aux_read: AUX_MU_LCR_REG unsupported
bcm2835_aux_write: AUX_MU_LCR_REG unsupported
bcm2835_aux_write: AUX_MU_MCR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_write: AUX_MU_LCR_REG unsupported
bcm2835_aux_write: AUX_MU_LCR_REG unsupported
bcm2835_aux_write: AUX_MU_MCR_REG unsupported
bcm2835_aux_write: AUX_MU_MCR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported
bcm2835_aux_read: AUX_MU_MSR_REG unsupported

(log booting the same image without this series).
