Received: by 10.25.77.4 with SMTP id a4csp399153lfb;
        Wed, 15 Mar 2017 09:47:28 -0700 (PDT)
X-Received: by 10.28.24.5 with SMTP id 5mr5142708wmy.1.1489596448061;
        Wed, 15 Mar 2017 09:47:28 -0700 (PDT)
Return-Path: <k.kozlowski.k@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com. [74.125.82.67])
        by mx.google.com with ESMTPS id 67si3219848wrc.318.2017.03.15.09.47.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Mar 2017 09:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of k.kozlowski.k@gmail.com designates 74.125.82.67 as permitted sender) client-ip=74.125.82.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of k.kozlowski.k@gmail.com designates 74.125.82.67 as permitted sender) smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wm0-f67.google.com with SMTP id u132so5609398wmg.1;
        Wed, 15 Mar 2017 09:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SBL5+bn3/A3hzQfglI2gRET78d5bPjyA57kfThAbagA=;
        b=fVD88DQsZa5EYUZLxGBD24nBoEduODY4uZAoKxoOgRDUHNwduv6IKwFkrzrT3yRE9R
         lhjqkvqvuhudyuU52aGXctJbR68SWCEnvttLGCozCrcVLhXlPEyfzyT2LctE8HwP9gAj
         +sQt7mhhNyWwJnBj+zr8sVgZNPl9VdiY3EGnPr6VfpYJa0UshhtGhZR1527ZgJT4mpsE
         rSNhf84HN6u4TDsNuTVYxPHvPoXJoD5EtF308XkFvWC559aNuCunKyuARzcss2Aw6UzT
         iiy3r3V+e6g69RXia/ZcMcunhmjr+9BGiyxVIZjC4Cgzzd7Zd2U7vu5LWIpnLXKdM6vZ
         dgSg==
X-Gm-Message-State: AFeK/H3qEEWNA7h9ezyWVfTykfPqO3BaJ0xadenCHkrdsgKoNs/c5tcD3cFSpXLIfRgzYw==
X-Received: by 10.28.196.68 with SMTP id u65mr5573544wmf.8.1489596447526;
        Wed, 15 Mar 2017 09:47:27 -0700 (PDT)
Return-Path: <k.kozlowski.k@gmail.com>
Received: from kozik-lap (bzq-79-180-56-222.red.bezeqint.net. [79.180.56.222])
        by smtp.googlemail.com with ESMTPSA id o2sm1102431wmb.28.2017.03.15.09.47.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Mar 2017 09:47:27 -0700 (PDT)
Date: Wed, 15 Mar 2017 18:47:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 0/5] hw: arm: exynos: Bring up secondary
 CPU + CPUIDLE issue
Message-ID: <20170315164724.37z6yeapl3wujgh4@kozik-lap>
References: <20170313180432.7067-1-krzk@kernel.org>
 <87mvcnpzll.fsf@linaro.org>
 <20170314173513.wruppu4js7ikaxu2@kozik-lap>
 <CAHDbmO1apk81csbC7BJK2JFK23fvVBLb-wA5z7_y29T=ueFPyg@mail.gmail.com>
 <20170314185632.kzbccv2y7ah3nhqd@kozik-lap>
 <87k27rotgb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87k27rotgb.fsf@linaro.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-TUID: bYjGS5L1d+Ym

On Wed, Mar 15, 2017 at 08:05:56AM +0000, Alex Benn=C3=A9e wrote:
>=20
> Krzysztof Kozlowski <krzk@kernel.org> writes:
>=20
> > On Tue, Mar 14, 2017 at 06:24:33PM +0000, Alex Benn=C3=A9e wrote:
> >> That means you're on a pre-mttcg tree so that's not the reason.
> >
> > I managed to build it on current master (v2.8.0-2182-g5e2fb7c598c6). It
> > behaves the same (with "-accel tcg,thread=3Dsingle": cannot reach
> > switching to init).
>=20
> Interesting. Can you post your exact qemu command line and I'll have a
> go at reproducing.

I build usually with:
=2E./qemu/configure --cc=3D"ccache cc" --cxx=3D"ccache c++" --enable-debug =
--enable-fdt \
	--enable-kvm --enable-libusb --enable-libssh2 --enable-lzo \
	--enable-bzip2 --enable-curses --enable-gtk  --enable-cap-ng

Running with command:
arm-softmmu/qemu-system-arm -m 1024 -M smdkc210 -smp 2 -append \
	'console=3DttySAC0,115200n8 console=3DttyS0 earlyprintk' -d guest_errors \
	-serial stdio -D ..//log-smdkc210.log -kernel ../cur-linux/zImage
	-dtb ../cur-linux/dts/exynos4210-smdkv310.dtb
	-initrd ../armv7-odroidu3-exynos-v4.10-initramfs.cpio.gz

Plus the -accel line, depending on the needs.

The initramfs is a simple one from Arch Arm.

>=20
> In the meantime you can always --enable-debug-tcg your build and see if
> any of the asserts fire.

enable-debug-tcg did not change much - no asserts. The last dmesg is:
[   72.616013] Registering SWP/SWPB emulation handler
[   74.484873] s3c64xx-spi 13940000.spi: spi bus clock parent not specified=
, using clock at index 0 as parent
[   74.485994] s3c64xx-spi 13940000.spi: number of chip select lines not sp=
ecified, assuming 1 chip select line
[   74.493249] s3c64xx-spi 13940000.spi: Failed to get RX DMA channel
[   74.503885] hctosys: unable to open rtc device (rtc0)
[   74.523004] ALSA device list:
[   74.523711]   No soundcards found.
[   74.542278] samsung-uart 13800000.serial: DMA request failed, DMA will n=
ot be used


Best regards,
Krzysztof
