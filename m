Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6897497lfp;
        Wed, 12 Feb 2020 14:12:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqx40KzVHY/iOeC0cigkEYD8jX7CuodKJu4Z/3ROFMdzQVL+81bVnZKSP7jBsXGYQ2X5ocwR
X-Received: by 2002:a17:906:4055:: with SMTP id y21mr13320200ejj.78.1581545533946;
        Wed, 12 Feb 2020 14:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581545533; cv=none;
        d=google.com; s=arc-20160816;
        b=MEDvdE9KuEjcnZ3RIbES8T3xDnnF5SMyH9J87JwOO0KtFSsxMAxNT4R1Fg+M0G9gKb
         vKlUXLTeONilp18PCUz3iVul4hSGy8Bvny+l+rNWtQip/q3waJ36MnGhGw1gs5SfHgmi
         vwWrjct26w0e+dQXX1OdH/LANM772jkngAl9cWEZOZvQ6khEdn3aBwUrR6CiIhQM53+d
         h5kKcit9/WPBfwAnW6JqABcCEu7n2HlyvmPuSSKTccdl/Uk8whARKanzqy/VlrqL0xvx
         sYpvD6RhpmsCP7JwbOY9ctsPXm0BuKKRiVCTHM/U86WUhFo7YdpVUFai4CR66JJCaBE6
         qqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=OQX3+OQlNGyIK2uBxScP/fIdyTEIe4OqFvcwVb2qhYQ=;
        b=t+gYIYru5RbIU1nyXDipUTRxVQaSpjZv289yRsH3N1m0ofhkaMkcZNRMJuoIVwnlu7
         3lZ1HKWw6s66XF5TjGPAui7jrzy9ZkvhYJIhXL5el9d4bJyiG2t04javtgTxG86MzASa
         ugLP1V5wrgxrMPTmOsZc8AHTUlKeFf4SdbLdubPeprC8L7DPDUdRIV3h4ru5OpU9JepA
         1WMfymmxVlWDbCrwwFlQtN8dZSoQdFz3bh8luGNk1TlhUoOJ8pVbgmHH1L5MQSlsepKJ
         cNhHR8+6OY/v72/X3l3/6PepcAdZjp4WR1bkdXjQfnxjYBr5zg3Unqfy8op18Ivwl00q
         g3qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V6VFpWNW;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id x21si35748eju.309.2020.02.12.14.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2020 14:12:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V6VFpWNW;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581545532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQX3+OQlNGyIK2uBxScP/fIdyTEIe4OqFvcwVb2qhYQ=;
	b=V6VFpWNWIdSsr8Mf55x/DNhLwb7Rt/MYGRYrCrhxLtruQbmec7EyRPsvQrBra90r0WM5dC
	IloXLIxG/+qgNF1mNVNBiGc+21jleK/CVqHrXwTxC/KKwFK563xvcuWmNxE51loOiaAuWG
	JJU8BI8ioA+yXagI29Ot4wm8ZRqLL6A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-UgLsC7U2M3GoN7KOJ95KdA-1; Wed, 12 Feb 2020 17:12:10 -0500
Received: by mail-wm1-f70.google.com with SMTP id n17so1312884wmk.1
        for <alex.bennee@linaro.org>; Wed, 12 Feb 2020 14:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KbOIkA8SQFrtdw8hwMIaAD/l02PZxmKHkrzKvQ4tpqw=;
        b=P8RbcDvftL8+DeYUiIPnQVjssojR1vcfy2pUmy6E5bWudgcous2jsYL3Wnfdm/3Kso
         21LytQfQolqS6OxIWHJjhAr2zvyD2c+u3zbNCUiqVU8UqJ6nHOAbantWVU4C7uYhPS9H
         ez47jSTzeW2dbhglMxVV8VECu+TplEWvDhDn/gFsed6pnDOH4veDs9OwPb89hWKlssVJ
         x2soBwt2vw/Eb5RAJZ4uG5MVigFUHJkCMgWJix2mbAejznLzZdJazbNTAKeIVQDU6eFa
         +fAitl287gMAHdZEL4ovkIJZTBvmAe0XFpp7yL5jsOjTZZvoUx0XHp9ThXwjKwg0ULOA
         dQFA==
X-Gm-Message-State: APjAAAWOIcag4AoeBs9j5z2IKlPGWk6PXNpPewYaLX3oApuOPyyn6KUF
	Zkt/TJ+NWjiTkb4wTsmKNiCNLAof2pdAdBx+lY+rbmeVCIw+izP/kO0PtDGrevL+k4AxmYuhI7Y
	vMRSPRkfV9ACaiQhh
X-Received: by 2002:a5d:6708:: with SMTP id o8mr18147895wru.296.1581545529888;
        Wed, 12 Feb 2020 14:12:09 -0800 (PST)
X-Received: by 2002:a5d:6708:: with SMTP id o8mr18147889wru.296.1581545529664;
        Wed, 12 Feb 2020 14:12:09 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id y7sm11135958wmd.1.2020.02.12.14.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 14:12:09 -0800 (PST)
Subject: Re: [PATCH v4 00/20] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, jasowang@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <CAPan3WpV2m9HXLXZDopKUb2EfX2KE9y530m2pJG4-D96==ggCg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ee95179f-c15f-9615-e241-80199e6948b7@redhat.com>
Date: Wed, 12 Feb 2020 23:12:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPan3WpV2m9HXLXZDopKUb2EfX2KE9y530m2pJG4-D96==ggCg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: UgLsC7U2M3GoN7KOJ95KdA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: EoDSUyHa3ZPi

On 2/12/20 10:47 PM, Niek Linnenbank wrote:
> Hi all,
>=20
> Short status update regarding this series.
>=20
> Currently I am debugging booting NetBSD 9.0-RC2, which is recently=20
> released [1]
> The problem is that, apparently, RC2 can't mount the rootfs properly:
>=20
> [ =C2=A0 3.1871510] vfs_mountroot: can't open root device
> [ =C2=A0 3.2141370] cannot mount root, error =3D 6
>=20
> This only happens using the RC2 filesystem image. However, the RC2=20
> kernel can
> properly load & boot the RC1 filesystem image, and the RC1 kernel gives=
=20
> the same error
> on the RC2 filesystem.=C2=A0 But I dont think its a NetBSD-RC2 issue, bec=
ause=20
> on a real
> Orange Pi PC hardware board, this problem does not show.

Linux shows:
   console: mmc0: Problem switching card into high-speed mode!

QEMU MMC support is not in good shape, and high-speed SD card support is=20
limited. I keep procrastinating at reviewing your SDHCI patch hmmmmm.

So you added:

  * DMA transfers
  * Direct FIFO I/O
  * Short/Long format command responses

I'd start diffing the trace output of the following events:

allwinner_sdhost*
sdcard*

with both kernels.

>=20
> I'm comparing traces and adding more low-level debug output to NetBSD=20
> and QEMU to find the issue.
>=20
> Also I processed the review remarks which were send so far.
>=20
> Kind regards,
> Niek
>=20
> [1] https://www.netbsd.org/releases/formal-9/NetBSD-9.0.html
