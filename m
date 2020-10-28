Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp45267lfa;
        Tue, 27 Oct 2020 18:33:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4lVymjroYJsaM0tz+bi3KsHdSsuevsVqPaOThAH6DSarHhekG6RTWjEh6jOqrkOI9d+8+
X-Received: by 2002:a17:902:ee52:b029:d5:b156:3ff8 with SMTP id 18-20020a170902ee52b02900d5b1563ff8mr4939362plo.85.1603848821097;
        Tue, 27 Oct 2020 18:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603848821; cv=none;
        d=google.com; s=arc-20160816;
        b=l7iKXfDeW8u+yeDJzFT+YWWSNIkOHl/s9Er5N78Hk7N2+c3ciCxs3wb6R48s+tyjrS
         nRmdHlnNq/Ta56WOsJCVStcRYc/pEjIqr5LWpBauqR48mc/j52UKmq9JAGH/nIvH2Ycy
         iGfhJ5qI6AXSs4uSV0UjjddahhGLDNb+975wRPwx8pz2N64zuWfE+4jkbo3w7idgNW2F
         fUTXtN4hq9YeX8OXymR9f6FpWocM7dBrGP4/Tv1DEUC+Gk4eCtHnxq0W2B1UeCgBhixK
         bl/drGnpZ6rryFo/OoNdvFvyd3H9kp0jG+JcfA7ubUYtqMCDIqDfLi1YYugp0Fh0QQkK
         T8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=/1zOEXuun9VrEbMcTRh640BRcPrUzTUD6nxu+2HKDEU=;
        b=x8eb8duazmYS4ki35ZGPKmztKsb29AoecXmNPHuz0X2yE3RmI4WbTwKg2cOZ66TZFr
         ePF1UiyQTQfrcGinTksvf/Fr+EFHBwI3HJPHZkoZgO9u9IkauG/byvVuPILH8CjsM5Dy
         Z7irKV/ka21HClQ+0GFap0WYV7bHPz2YmKLPt0yCta+s8x4VMb1dHbt1A7hPP/ilcDCR
         Jo/xOs2xlztS3MYbiiVTUWj0/Cl3qfobii/jmEAHav9I8ppduh9JDVFCKe2kboBpSa71
         2c63kJ0AlJmMsVZqifnMl91he/i+z+JHBxBvGe2WsL6eBX6QWo24D2YxMkwITQZHzTUC
         dMdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=qOAs9+X5;
       dkim=pass header.i=@keithp.com header.s=mail header.b=qOAs9+X5;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id f4si3360202plo.241.2020.10.27.18.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 18:33:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=qOAs9+X5;
       dkim=pass header.i=@keithp.com header.s=mail header.b=qOAs9+X5;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id C4DA53F2DD87;
	Tue, 27 Oct 2020 18:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603848818; bh=DlddCx9B00ZgsLS0DimPBQMwugUwvBncKW7lGIGUX/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qOAs9+X5HFMhscSvDGKoTy7h/uQAmsLYPTcevfO+2bWEIUbRtESfKNVZPQzJLoCC3
	 BGZF+XieeTc5dp5blocazje74is56zvhfmit6L4gX8UcqAWa+CTesUUqDnRj8Qbga5
	 X2m63RDnuncbUE5iHX3PObuUnfBKfAtHseepTKmTQbYhTBYMIdwzUVM4R89oib1oR/
	 wXBp8pQP7EXCEHLwadZ6O+U29FfvINJ9/B8Nj5ECNmGbwa5byxrU7mgP6ZR9I3xYnd
	 NGT/lOOuFDn4R9UcIutaICLSEsSu1AXgBH6gpDS0F0Er0eflmJAiwPTCLd1bYX+IB1
	 aaZ9u+nNbeRgQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nrbUSEkdNccG; Tue, 27 Oct 2020 18:33:38 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 367BD3F2D926;
	Tue, 27 Oct 2020 18:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603848818; bh=DlddCx9B00ZgsLS0DimPBQMwugUwvBncKW7lGIGUX/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qOAs9+X5HFMhscSvDGKoTy7h/uQAmsLYPTcevfO+2bWEIUbRtESfKNVZPQzJLoCC3
	 BGZF+XieeTc5dp5blocazje74is56zvhfmit6L4gX8UcqAWa+CTesUUqDnRj8Qbga5
	 X2m63RDnuncbUE5iHX3PObuUnfBKfAtHseepTKmTQbYhTBYMIdwzUVM4R89oib1oR/
	 wXBp8pQP7EXCEHLwadZ6O+U29FfvINJ9/B8Nj5ECNmGbwa5byxrU7mgP6ZR9I3xYnd
	 NGT/lOOuFDn4R9UcIutaICLSEsSu1AXgBH6gpDS0F0Er0eflmJAiwPTCLd1bYX+IB1
	 aaZ9u+nNbeRgQ==
Received: by keithp.com (Postfix, from userid 1000)
	id A16831582210; Tue, 27 Oct 2020 18:33:37 -0700 (PDT)
From: "Keith Packard" <keithp@keithp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>, qemu-arm
 <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
In-Reply-To: <CAFEAcA8Sha5QYbO25dtzBZHoXUeiGVv8aojPFTMrst8nbVDAdg@mail.gmail.com>
References: <20201026212853.92880-1-keithp@keithp.com>
 <20201026212853.92880-2-keithp@keithp.com>
 <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
 <87pn53e3ke.fsf@keithp.com>
 <CAFEAcA8Sha5QYbO25dtzBZHoXUeiGVv8aojPFTMrst8nbVDAdg@mail.gmail.com>
Date: Tue, 27 Oct 2020 18:33:37 -0700
Message-ID: <87k0vbdthq.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: pm1OOY+55FGe

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

>>         arm_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
>>         riscv_ss.add(files('common-semi.c'))
>>
>> This appears to work in my testing (building arm, risc-v and x86_64
>> configs).
>
> I'm not a kconfig expert but it might be preferable to have
> a new CONFIG_ for arm-semihosting-ABI which the relevant
> targets enable. Somebody else may be able to advise.

The change above makes this do exactly what the old code did -- add this
file to the arm_ss sourceset whenever CONFIG_TCG is true. arm_ss is
only used to build ARM targets, so this file gets added only for those
targets. Here's what the patch to target/arm/meson.build and
hw/semihosting/meson.build looks like now.

diff --git a/target/arm/meson.build b/target/arm/meson.build
index f5de2a77b8..15b936c101 100644
=2D-- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -32,8 +32,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
=20
=2Darm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
=2D
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_fals=
e: files('kvm-stub.c'))
=20
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(

diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
index f40ac574c4..26538e81e7 100644
=2D-- a/hw/semihosting/meson.build
+++ b/hw/semihosting/meson.build
@@ -2,3 +2,5 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'config.c',
   'console.c',
 ))
+
+arm_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+YynEACgkQ2yIaaQAA
ABHpGQ//aNlybBfsN7SE8dZjtOa8qjztPHMCozcjrBgGlqK2LLa6sesSXbcFgtIn
ulbK63AZV14rtJvZi0puhWvGatchidYh/32amSLk8isZ1pHTOkvlv+ua5XXhYebS
EuXwg+6mqEBXI4ZXLfP8+iVP1l05qCXbW/hc7K3mZNRXKpguyh9p7jtEI16WwEcb
NKUX+ubJPiEXjWRILWuNQx/4lO67I1tER4KrGm8Bmr/6i/Wp1MzHla7+ODBIz+hm
jVpR1PpChnGsDIiACq6XiWs7OfYk7XbpR/pHf1d8rGRRmLBMaYMvQbDm+IdqfCli
OASvL8+UPvdoDdanNMd6/OjTaUiR0v094c9Gp4mHQm6X8i7ffIfT3PB9lCXsqs8i
RQpML1OFLWhqEUiPuQe2uaSWl4Bl71C5dDjtOHuSnYc0kYjkXThEdi80VkPZdRR6
FbDxhx122oXe21xBz5SzMqhrhkOHxVFVQGGYinmoyTlQYQEzc3GBHcl5UjIjRfS+
C6re9XQ4H+D271KPpQN5bIUN04XPmf8VvwuJgtY2tDoFlhEUQMiq/3QjOQULcNdT
NUAwQA36B7KQeC0gRMi3TvF0xlcPVXuCvJz3JhvdpPtb4xWKFVo8xZ7llFwSAUIm
HHrhbzE/DKi6cDGoRC2Xnr1e4dvst7GaR2rRml8O2xfJ1u03vg4=
=Zp/R
-----END PGP SIGNATURE-----
--=-=-=--
