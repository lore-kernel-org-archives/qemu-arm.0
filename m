Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp458356lfg;
        Sat, 6 Mar 2021 08:54:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUmqnLnpR7hjcD4gpn5ryAb9gA49XtQV+QSZ25Pq7KxcXfSBkWafhmzulbildAcORV5/PI
X-Received: by 2002:a17:90a:4882:: with SMTP id b2mr16768504pjh.69.1615049673618;
        Sat, 06 Mar 2021 08:54:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615049673; cv=none;
        d=google.com; s=arc-20160816;
        b=qbU4+YW+982HgBkQv89ZCvaDoeyHDjL3rkY4h7KVpKMW4gBROobYRJidys7usy1QSX
         E0D5Bi9oNwwha7jUxvd+ERIbMUg5vaJdnjAfhahoAptMgeHY0mAMrefKJF+C9naaKHFp
         hQBI912YMBiHvlaaEpY0HYhoFQsc+Z9iLqd56zMVFfGQmWmYOD3XE2O8CU4fyQjWCK34
         2d86t1/TRetxQgyT2WCo2HL41/VkB8V0gtL3Grg4HisexbNKlpLYTWONsh0ZnrgO5M7E
         ZBE0ZtBC+dwF5zdeOr042ehjQRBDu1iunL5Xyv3ZQdNhJcqTdWKkbh5OvO9vVRKLKjFA
         sgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=Mm/Zm/Of79URIggL86e03zn4Cb9bsGo314bUvQ+pN5c=;
        b=C5YUSyaecshZYA0hAVrWv6ZSbensE4dQ+8ajM+pTF0IJGrtLizFmQvroyJ6y5RPOE5
         C67WKZ92+JhQfQE/IjGvAoVa62nhVuRlcHFdAWN7m/Bei4IQr6o8BFwFktiit/YFmP9H
         GknzSmNSVCtM5OjQKk6jm+kTUWmquoBhTG7+hkuWLXJTymTmZllXK5a4utR75zpaH0iO
         yQdUzNQPnOJ7mgRI2z22/sv9ZTneb+SeGvZUK/KhPi8C9F1EOd2dET6VaSwVy3DffyHB
         FoM6MoOE6UKwWONcp4RIpnIf/Riypdi8K9l8YaOS1fFLEo+RWt725Ng6B22SO1wZycn7
         Dkfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=YnIMn3F8;
       dkim=pass header.i=@keithp.com header.s=mail header.b=t7kHqHdm;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id w20si6339372pll.44.2021.03.06.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 08:54:33 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=YnIMn3F8;
       dkim=pass header.i=@keithp.com header.s=mail header.b=t7kHqHdm;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 0923D3F2EE49;
	Sat,  6 Mar 2021 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1615049672; bh=Mm/Zm/Of79URIggL86e03zn4Cb9bsGo314bUvQ+pN5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YnIMn3F8N4yC1Gebq4Cji/FMdWDe9UzeJaG/9gfxos+T2Ia++OzouaxZ2mc3tr5Ci
	 9fPPmjSJuM36OuPvStAw77tsD1yDcKt3Udm/l1phvOnNF6krIqqOmri6+Bre0qJvxq
	 6k39zoyyhhCfCPEmXI/GNj4Z6FrIKK9St8eF2Olx9toq33PSbtHW5vKhkgKgvsm3XI
	 gybVBPI8GzglTVq6XTI+WaHgJj2rAtv0L8L44ZYLjVEMergsaY29WTWNequRPBBIP9
	 A9G/3mCnx3ntQYBR9NZV2jIqhmFgC5gcJ4Hieoig072ixCcWLrpFyQhTji6oNjw22F
	 uy7ew2BgFbENw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WSwlZ_KIp9eF; Sat,  6 Mar 2021 08:54:31 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 68BC53F2EE43;
	Sat,  6 Mar 2021 08:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1615049671; bh=Mm/Zm/Of79URIggL86e03zn4Cb9bsGo314bUvQ+pN5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=t7kHqHdmf7SaUhysnJrWiB7eHEbHcZVg1vZe2ATTF+QInqj16ShFVj7Higc/oXt+T
	 ZSlw9W5n5aeN3IyDhNKFOg+bYAocSvQEEWH+cQPvrchP5h3Euv/xyisYg1N7fWzFsW
	 n669hjQ4p3iN+yZI7SvWV8etlSntDsmrQ8juNeAgqWGHMqIPNSlvV5YYvzr5KeW0cH
	 qkdUjSPpm3qXrVHCQ5m8TbL+GJfM4VuJm7Iz5Dmq5u9Vc9wgzpHSXMKm9HOBHrAFCX
	 +2aUuDNQ33oNPns8SfBiAvF8cjawaY/pmjNMkIDVBWtzJfknAommAGT+qNUviPPMW4
	 eJ7aWpr64FzOQ==
Received: by keithp.com (Postfix, from userid 1000)
	id 4F45C15821A3; Sat,  6 Mar 2021 08:54:31 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
 <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
Date: Sat, 06 Mar 2021 08:54:30 -0800
Message-ID: <87o8fwfcjd.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: oZhtZyFIpbgI

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

> ILP32 for AArch64 is a zombie target -- it is kinda-sorta
> supported in some toolchains but has no support in eg
> the Linux syscall ABI. The semihosting ABI does not implement
> any kind of ILP32 variant -- you can have A32/T32 (AArch32)
> semihosting, where register and field sizes are 32 bit, or
> you can have A64 (AArch64) semihosting, where register and
> field sizes are 64 bit.

Yeah, I did ILP32 support for Picolibc; all of the aarch64 asm support
needed fixing as ilp32 doesn't specify that register arguments clear the
top 32 bits. Seems pretty obvious that it's little used.

For semihosting, as the ABI isn't visible to the hardware/emulator, the
only reasonable answer that I could come up with was to treat ILP32 the
same as the LP64 and pass 64 bit parameters.

As picolibc is designed for bare-metal environments, it's pretty easy to
support ilp32 otherwise.

> I meant, how does the RISCV semihosting ABI specify what
> the field size is? To answer my own question, I just looked at
> the spec doc and it says "depends on whether the caller is
> 32-bit or 64-bit", which implies that we need to look at the
> current state of the CPU in some way.

Yes. As qemu currently fixes that value based on compilation parameters,
we can use the relevant native types directly and ignore the CPU
state. Adding dynamic XLEN support to qemu would involve a bunch of work
as the same code can be run in both 64- and 32- bit modes, so you'd have
to translate it twice and select which to execute based on the CPU
state.

> Part of why I asked is that the current RISCV implementation
> is just looking at sizeof(target_ulong); but the qemu-system-riscv64
> executable AIUI now supports emulating both "this is a 64 bit
> guest CPU" and "this is a 32 bit host CPU", and so looking at
> a QEMU-compile-time value like "sizeof(target_ulong)" will
> produce the wrong answer for 32-bit CPUs emulated in
> the qemu-system-riscv64 binary. My guess is maybe
> it should be looking at the result of riscv_cpu_is_32bit() instead.

Wow. I read through the code and couldn't find anything that looked like
it supported that, sounds like I must have missed something?

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBDs8cACgkQ2yIaaQAA
ABF9/w//ZBiHazDxjpbAYZwlwGA8IJ36hfYYS8C8aNcc2Qtx7kdTLyF/qMcyIhe2
RSDH4Stogf7XeDn1eM9QWRa9M8455SPx1NJtKa0WOvge1k9anAYs/ObXta5nmclO
LdvhiEWsVgP9QxrNl08oBAiEvcij+0mg2vPagneSXowPPb7AhUlZ/coIpsHjk+J2
/IKtjww6HMduE0Nmjv9N/JySdbO0qR7KIKixd8+kIAYbLsaj/dRshy8QrlfDKJUG
3R+wL7Ry38GH169mNeFNyz9ufALjCXc/SAzgvsxoF4mjEqvkf9aOoAUx81rfZfLE
JmYOcQueilGJmjxFi7AAkAjUU9ogh/ApVIo2mBhp6rb/rPhFQ9q0N+ZCq9pL2u3V
UQ7WUVfznyfNOOdzml57Q80Fa92jhtkACqxXiD542n0fJbLIh+w0twYR1ysvT567
kW3bVg/dmNmcWgT4I+PGdVr6KqzZIQtUIdWOpyTjcqTLbiQafulzFe5fe8W4ldFJ
gqfOmS3slW1GiyrcMCidKg2q+5Dy3pgUQfVeOqbSi+L6wFc9TmmmnLlenrLWYKP4
UN1BXM0Y8KyXMraE5Otr2XidJwsH/zns+3McKiOK3DCYvlXT/vRnkXlAG3Cvfpr9
keoJDVhDGoz9awnI2tJ8NNooqHL7HFFQopPsoG57XaWiYSBPqh0=
=kKWW
-----END PGP SIGNATURE-----
--=-=-=--
