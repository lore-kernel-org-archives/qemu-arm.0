Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp787644lfg;
        Fri, 5 Mar 2021 15:54:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7+psVVy78Wjd/8GdFvPoXv+4mQb9gJvQqzVZ5COTYtKSJ2paT7Jiwo01hNFGNtfifKxLa
X-Received: by 2002:a17:90b:1c0e:: with SMTP id oc14mr12630044pjb.188.1614988471006;
        Fri, 05 Mar 2021 15:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614988471; cv=none;
        d=google.com; s=arc-20160816;
        b=fcpQVWGF4kfNdoluVuD7KBp6T7PlSqMAJyeoxaPZ2antAymv0hDjL7MxHiypWk2wm6
         s5DbKWDUMQbb8lelepgjf4DaAfr1OyJmVidle1kl8L6M9iSS52il8UYpICK+EBmenEYF
         z5CkfSOokhDD2Dg9fqLcTAQa/2EDuM0SkoaVgj+RGTMHpY4NZt/txbLM1JZ1Uf4ZD/Yw
         CXawpJZ2rvzF28cE1LlyIOgdGQHaMzX2Ug16DPCxCTLtL+PVyPqWX1dZdo+i0t5J1w4P
         BHTO5ZzGl0Du9JCF7dMrJrXlBczLXwbJiv5DowH4GtV7YjQahLsEANbtDx8xIe3uaYAD
         lNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=kQYl8htm6EDnpEk43q6P1gZCrhFnVFNXjZmsmKnliDI=;
        b=a052llxhHSsy3bby1PNdNmjfjTuePRLhNpd+YEjTCfvEtqsLLIQmOkUjI8qe2IH4z7
         bMs+JR9F34nUPZvBuS8FHzvC1JiN6jVbL6yJ0ajVVuithwUAuZfJMtwqUBGbxJsvSZ83
         zHKjmsUZx1wS22aS4pg5q5th2Cmap6Pg3NajDsncOJecIUaoEy0fEM01UXOblvwsBQg8
         HUGxRtfp27ylZG0gg5jlXPP3glzQtgxG6xNhxSRwZha9uw8xkteDw+HIREJAhlHQEV7E
         1E7uvB4gk5ymlOZYhp66YD4uhwJJy3Kv8nSY0lgUb/Xv377VBiyp/vrP0jJGxaEurDE1
         BX/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=I5TQWJeR;
       dkim=pass header.i=@keithp.com header.s=mail header.b=I5TQWJeR;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id u14si4185280pjx.156.2021.03.05.15.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 15:54:30 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=I5TQWJeR;
       dkim=pass header.i=@keithp.com header.s=mail header.b=I5TQWJeR;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id C33843F2EE40;
	Fri,  5 Mar 2021 15:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1614988469; bh=kQYl8htm6EDnpEk43q6P1gZCrhFnVFNXjZmsmKnliDI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I5TQWJeR+YjGYdBD3tfqIaHyfGvkhyrCLXLfvrCmsZWSeV90cI3Z1GyNOa6pDvVoh
	 o48mVgYTOqLzMB3QwyOqR4TgHB/AdkmczvC7iteI7WilGvOVdFSM4Lhj1vt041bXLS
	 76Ir7O62nIT6hZRkwARHTGjgh1kulrW8JF4IQV4N65LwsBSxCh3WAR1B9iImoek6Iy
	 LwOxJRq61tVaUJV2+/xPoi0H1bibH6SWXhR1kuL/1N/GIZD8odPADFI8FXT8RLCF86
	 RSIobeiNr/kMlpd7dt1f1wN5ZI0HPba8IqVKdhSiiEWSJvVff3YtNTE7rGI9KVvfqO
	 8plFVl4asxcpA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vAsnTAh4Cqzo; Fri,  5 Mar 2021 15:54:29 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 7451E3F2EE3F;
	Fri,  5 Mar 2021 15:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1614988469; bh=kQYl8htm6EDnpEk43q6P1gZCrhFnVFNXjZmsmKnliDI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I5TQWJeR+YjGYdBD3tfqIaHyfGvkhyrCLXLfvrCmsZWSeV90cI3Z1GyNOa6pDvVoh
	 o48mVgYTOqLzMB3QwyOqR4TgHB/AdkmczvC7iteI7WilGvOVdFSM4Lhj1vt041bXLS
	 76Ir7O62nIT6hZRkwARHTGjgh1kulrW8JF4IQV4N65LwsBSxCh3WAR1B9iImoek6Iy
	 LwOxJRq61tVaUJV2+/xPoi0H1bibH6SWXhR1kuL/1N/GIZD8odPADFI8FXT8RLCF86
	 RSIobeiNr/kMlpd7dt1f1wN5ZI0HPba8IqVKdhSiiEWSJvVff3YtNTE7rGI9KVvfqO
	 8plFVl4asxcpA==
Received: by keithp.com (Postfix, from userid 1000)
	id 39A0115821A3; Fri,  5 Mar 2021 15:54:29 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
In-Reply-To: <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
Date: Fri, 05 Mar 2021 15:54:28 -0800
Message-ID: <877dmlgnrf.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: 8Ssz+7keLYVo

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

> For semihosting for Arm what matters is "what state is the core
> in at the point where it makes the semihosting SVC/HLT/etc insn?".

Ok, that means we *aren't* talking about -mabi=3Dilp32, which is good --
in my current picolibc implementation, the semihosting code uses a pure
64-bit interface for aarch64 targets, even when using ilp32 ABI.

> How does RISCV specify it?

Because the ISA is identical between 64- and 32- bit (and 128-bit)
execution modes, the only difference between the two is the Machine XLEN
value which encodes the native base integer ISA width. You switch modes
by modifying this value.

I don't know of any implementation in hardware or software that supports
modifying this value. I'm not sure we need to support this in the
semihosting code for qemu as I'm pretty sure getting qemu to support
dynamic XLEN values would be a large project (a project which I don't
personally feel would offer much value).

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBCxLQACgkQ2yIaaQAA
ABFHExAAnbnZUxZUu0+MzkWHrqiM5ddgv6bMmaklL47A1Jd/z2s/NOFqbqbMtfPY
lQeT9FZE5d23vOEGAY3/5LrK59vN1LXsr1/8IRkGd1/607rs3qEGICeFaqSxbZ8d
ixcE3ip7fVI6E2km7zVY6NWBHt8ungsv6ASMGjPGM8ekJMwSG3DvD61tW1bLhfPR
BzdOURsksPix9z7Gr8WnU/JqBsAohhAZ/h8/lc4UFF2qwvCpaiabrm1ww9cvcnxY
v2JRNv0NxIHtvTywz/UVXD9qpq/av2L/GRsym6exl/zph8svdS4R5UeIAYnsLxPz
f1spoWwb1sltd9CP++RFpXr0JsKc6X7Zgx/WZmvyA2iVYYncSVZkzhjlS74hfZ2Z
iCvQ716Z2Vq6Vn8/yNhwWEd1y/Qi+CxHHLYGuPvWCGbM4dXiUlMmSb0GeIEJP5EX
4rlz5jkaYzjHIGZW3rdIABIWVWiE1LO9sFhcC24y68gNEUt7tRRaUeGtXKDdiP11
bVosRxdZ5BD2Ra6g8A7D4WrdcwrmxbokGuxlEZpabj5ovstb9MwmQ0M/IgD0cO4e
ZXVE2ai0yq8hscCm+QeKX9ptTFfxHw849dvcjuPxnGSMozYuE3P1OEn/iCRb7gCb
vsx23/Wf34VDv+oNvbuwnCLfqNS7LumCr3PGypZiZuSyWkJwxoU=
=Ck89
-----END PGP SIGNATURE-----
--=-=-=--
