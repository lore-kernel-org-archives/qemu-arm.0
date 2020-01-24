Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp913847lfp;
        Fri, 24 Jan 2020 10:45:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMBZtCcmwu8NnonToRR5eBKMQvuIZhPFiOuEjk1F7AD2JVe1+tRSoBB/zI7fQwy5q9gYv3
X-Received: by 2002:a62:5547:: with SMTP id j68mr4672924pfb.6.1579891534756;
        Fri, 24 Jan 2020 10:45:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579891534; cv=none;
        d=google.com; s=arc-20160816;
        b=e4mzimw1D4Amx7H4PznlYgkUs7zv4+tCP8yw4wo/w+BFxTHBPlTMxmcT0CiXsVFaSD
         1syBCihs4iISQt10g+7xwCoOjPdLRzltlZURmmitP4C5Erj/ib4nEiwVPjG+T0fkkzZZ
         7txsEBMIFllsZGVc7yWLLErEtD+4yGc6Gg7VsNpTHLsehY2UUQND5uPW4t3NdeqhOWHJ
         FdO4igySCgceVID9omofdFpPd/xVFa7VbQkdcMLsybye8HjmQgzmUqsqFCFL6Phprenk
         prMODm2fvbcMEaFRbnLQMHieFromzb5zkNQW8dixcWbTPHjGRv1fQ7f5p/wBowrEmohZ
         EPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=12F2/VJhlgfWEy5HAAtmpr+ah+2AtwrOddo6r2dwOtU=;
        b=Gr6dVRJbmBbYWREpq9ODXXrU0lOCTOL7YvYaS3lKVXr7Cc3uRmsd1EKHWgadfx/bE7
         vt6Sly9wgojxxFf9xPecGnt9qeUHDeuuOko8abho46gZ85hHUle+JnZ/iKRmQtwOMZVJ
         WsOZfH2/Vp12C58JoT+JXH+I8RHAnrOoFoxEXXzO2xap0CrjcZO+p5Ot55NB9/UprFtn
         27LNfQvY+NhjE6C80oKvO45OgP+L/WahI0nt6onF3gL4R5/WLEeAPP/Q3YkUcdOHZkUk
         4zZumYhCr2ZxqT51C0vPkknTC7RHzOnN1sZEsQ729+d9tq38pY2Sz1CKu3cwXV7L8O6Y
         ZQtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=ClxRbHxF;
       dkim=pass header.i=@keithp.com header.s=mail header.b=ClxRbHxF;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id m18si270633pjn.39.2020.01.24.10.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:45:34 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=ClxRbHxF;
       dkim=pass header.i=@keithp.com header.s=mail header.b=ClxRbHxF;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 7D0F33F2A7A5;
	Fri, 24 Jan 2020 10:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1579891533; bh=RshqEZGatXEqsXZKYTF1ApW75pjoemfPpkTV4FQT3yQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ClxRbHxFgxIAQEg+hZLw/L7fGTCRME5qNQLi6ulM1QGdWJMl31SSlZlPyNv41wLYC
	 rmAGHoJJTYADxGoXO1yAwBYqR9hBwBe7VV/WwQGrClf+ZjXOZCbhuLrTCRL2ahcw+k
	 VR4I3KbHK5f3l4lNv6C4W0e557/QrqhyV2MxM1rJ3ghrSodXhEjQ72+/pgHK8cJ010
	 Y9wSo0HczEINJybEKQmuHhGpn8KWunNpSLOw0kpEcIk2jfL4sGPM1r1AJPe8SFAbVJ
	 OLPymYgK5Zjiswzyf/O09RCepM+np/a/Zk7kUAfI1AZLh+tEOpdidxgX/WHlZRn5tw
	 XQsc7l11HzDVQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L2qj3kusRI9n; Fri, 24 Jan 2020 10:45:33 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 153B63F2A683;
	Fri, 24 Jan 2020 10:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1579891533; bh=RshqEZGatXEqsXZKYTF1ApW75pjoemfPpkTV4FQT3yQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ClxRbHxFgxIAQEg+hZLw/L7fGTCRME5qNQLi6ulM1QGdWJMl31SSlZlPyNv41wLYC
	 rmAGHoJJTYADxGoXO1yAwBYqR9hBwBe7VV/WwQGrClf+ZjXOZCbhuLrTCRL2ahcw+k
	 VR4I3KbHK5f3l4lNv6C4W0e557/QrqhyV2MxM1rJ3ghrSodXhEjQ72+/pgHK8cJ010
	 Y9wSo0HczEINJybEKQmuHhGpn8KWunNpSLOw0kpEcIk2jfL4sGPM1r1AJPe8SFAbVJ
	 OLPymYgK5Zjiswzyf/O09RCepM+np/a/Zk7kUAfI1AZLh+tEOpdidxgX/WHlZRn5tw
	 XQsc7l11HzDVQ==
Received: by keithp.com (Postfix, from userid 1000)
	id EC5181582165; Fri, 24 Jan 2020 10:45:32 -0800 (PST)
From: "Keith Packard" <keithp@keithp.com>
To: Peter Maydell <peter.maydell@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, "open list\:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PULL v2 11/14] semihosting: add qemu_semihosting_console_inc for SYS_READC
In-Reply-To: <CAFEAcA-os-6iWZ-ucM-VUECyf8sn-xoANHCqJqtSyuttgZY23A@mail.gmail.com>
References: <20200109141858.14376-1-alex.bennee@linaro.org> <20200109141858.14376-12-alex.bennee@linaro.org> <CAFEAcA-os-6iWZ-ucM-VUECyf8sn-xoANHCqJqtSyuttgZY23A@mail.gmail.com>
Date: Fri, 24 Jan 2020 10:45:32 -0800
Message-ID: <87wo9gy9pv.fsf@keithp.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: izqYP7su1GV8

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

> I'm not sure what we should do with EOF, but presumably
> we should handle it in some way.

There's no correct answer here, which is why the current implementation
just ignores it. Here are a couple of options:

 1. Just return whatever getchar() provides; if it returns EOF, we'll
    pass that on to the application. Semihost-aware applications may
    learn about this 'special' value.

 2. Return some ASCII control code (0x04?) in an attempt to tell the
    application what has happened.

 3. Block forever. This would at least keep the application from
    spinning.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl4rO0wACgkQ2yIaaQAA
ABEocRAAl5ata2RuyXtE96rNi+RSDz3OVEoWNGGDvOscNx+F+pAmVBaoYueQtCt5
rcwaccib5RPFPhktjQVxVRUtFj1jcQ/M7EEF0U7Rtho9RcV2O203aYBq3aQ8qPer
tU7DvfSDZ6OiGAwTXk0QhClPOEZYlcLYWzrGyyjqbI2yvuI3Fcsy+7ZrDHpY7lvQ
sonX66rYqdg6xVZ1LjgMDZzqv32Q95B+3BWMrkhMF2Yp3ksTTrb8L/21Oq+hwr1N
Zw7vso6anQ3JtxKbHaezuwNLpa+jdWQ2eiX+rC3vDbCi/3ehRY1w5BDrsYXv/EGc
AtFT9QydrnoXsjDxrVORO1pWZVFCGwOKR5dFk++59bzP/T2VxKW1wokb881QCJf2
k0Q+SbtA+w5jfrDWZKH4TP5lGpQgk4VtGH98tRaOrEYmy5tjTP7xE3GEu5ILxo7U
UTjzpFmSLRDnDegCXaLsuJ5/jdBZNo7sXwIn0uwgN+655VclHZLAtuEnAc6ZkNd6
SyB+D+MV7IxuXD6AwRk20HVgBPxzguMOfnt0xvCUOT57IgBD4P7sUUBBYTZ7XAwt
R6oTnjpi3vOIfas/CBcAXHkySTJtQSZO1G9gdPqAgtrmpEycvMDtLKxldTnPk565
w+SY4tdaEDGWVZHK6nN6LvFsKs2U8UkjRMZ6ox8uoxJkPUV4RTo=
=N2Tb
-----END PGP SIGNATURE-----
--=-=-=--
