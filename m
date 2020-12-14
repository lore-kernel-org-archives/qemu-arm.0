Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2877113lfq;
        Mon, 14 Dec 2020 12:06:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynCnz4V/LfTEOF3bq19AlbJAdjWdg93zegb/5xWW/mGKrX1MBrTRiIOl6NaVIiSHIcl/BG
X-Received: by 2002:a17:902:5581:b029:da:a817:1753 with SMTP id g1-20020a1709025581b02900daa8171753mr24004751pli.76.1607976413216;
        Mon, 14 Dec 2020 12:06:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607976413; cv=none;
        d=google.com; s=arc-20160816;
        b=zoYpZRCcUBImeehi1JfULiJvw6jBRpcFr72lsZ0JzC5FqGzX9G8fciH0xQ7UaEL+cz
         Pqo2gl/H7MJpBynx+MSaMohlyRCVmrqytuvOwmcmtHbp6W7pZynbGRhsZg+pG88pN8FS
         c5xaL6YWRgZoPueaa8p79zwlCJOtVewiuOZRxjkpOWhwvQhilfrU8OC7Reyk1DwmTX06
         8DmWYjLUIYhCoHKP7d0akX1ZcBywtlwJzvN9SjVXY6axsa2hlp5n6LI4X9ixuohSYnOx
         edcOVXLxac78NF83rnRm7ouh9Sfqx8FAlkcy7Ezz6NBJEL+s0R/2xO6ku6OKCetLtRg1
         qJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=HUfUSvybAaBPUkP3qeBA60G3EShSzxiLvf/oRoT3+lU=;
        b=dmqVQWWudfMSFNXoBBBcv8TIjpIT6XBYarkd7vzYhOKmgte0WyrA9EbMSgesHUJx9N
         WrobHZl7wB00SgfAxlVNajZlgBFUL5AgzWhz1ZwXUbZmPj47lqd+vT4t99AV+7xacl0E
         ah/jWH2WXxlVSujpQgn+s7iXO+mVZAKtKAIdDfXTfkQuQMdOFJkHTyP9HkiCA6O6Dl/B
         84Qn366TRWIpWMszgY9mw76EWNNQQtCxGOteM4Fr+oDHIF6mFuChtvGXTo1hUYlP67Pp
         rdDd4BIa/iwRzsuH/pzyY3qc1lnEd9NdI0ebGSMkyWHYRRN4vZJAaMoFoLPjeU1pi2VJ
         zGCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=jk4jsl8V;
       dkim=pass header.i=@keithp.com header.s=mail header.b=jk4jsl8V;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id s24si6625264plp.63.2020.12.14.12.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:06:53 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=jk4jsl8V;
       dkim=pass header.i=@keithp.com header.s=mail header.b=jk4jsl8V;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id E8C733F2D6F1;
	Mon, 14 Dec 2020 12:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976411; bh=5V1bigVxEuJjLuQkNQxMsgsuiXxEmEsEJ6n2ArsDgqY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jk4jsl8V3FqSP0VOUIKVDyaVRQOGUI0OYEbX40mZvsrTl5vmcIpJiYjypfNp2hyFC
	 jvioZ/GVrrUY2CwT5QmhBeMKnYqC2b05o08WchRqPn83FOngcedSQoB7Md/dHkKAnY
	 iVHWxghoaF+MPRp7y8lTeX8zkA9buHinf+hLciBeVzYJoP4vspRRcfWDe4N+vVbhnE
	 xmStgMpIGIa5kBIe6bD1xqTncTRhEeorLI9FzO8jQh6hmYTQG/pBg8ZH+a1WcaYMqE
	 aFsVTY4W0cT/Sw0w84N+vxYhcm3fZmIGlw2N/jKmSiGBLRoY/NI+fRjHecGP0IBZmx
	 CGM40OtehjQxg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z0Yuyjx_olgg; Mon, 14 Dec 2020 12:06:51 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 874F53F2D6D3;
	Mon, 14 Dec 2020 12:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976411; bh=5V1bigVxEuJjLuQkNQxMsgsuiXxEmEsEJ6n2ArsDgqY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jk4jsl8V3FqSP0VOUIKVDyaVRQOGUI0OYEbX40mZvsrTl5vmcIpJiYjypfNp2hyFC
	 jvioZ/GVrrUY2CwT5QmhBeMKnYqC2b05o08WchRqPn83FOngcedSQoB7Md/dHkKAnY
	 iVHWxghoaF+MPRp7y8lTeX8zkA9buHinf+hLciBeVzYJoP4vspRRcfWDe4N+vVbhnE
	 xmStgMpIGIa5kBIe6bD1xqTncTRhEeorLI9FzO8jQh6hmYTQG/pBg8ZH+a1WcaYMqE
	 aFsVTY4W0cT/Sw0w84N+vxYhcm3fZmIGlw2N/jKmSiGBLRoY/NI+fRjHecGP0IBZmx
	 CGM40OtehjQxg==
Received: by keithp.com (Postfix, from userid 1000)
	id 67DC315820DB; Mon, 14 Dec 2020 12:06:51 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Laurent Vivier
 <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH 0/8] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
In-Reply-To: <87wnxktost.fsf@linaro.org>
References: <20201125213617.2496935-1-keithp@keithp.com>
 <873608vde9.fsf@linaro.org> <87wnxktost.fsf@linaro.org>
Date: Mon, 14 Dec 2020 12:06:50 -0800
Message-ID: <87sg88kv8l.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: iOf9+Tqa3rXg

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hmm scratch that... it fails in a number of linux-user only builds with:
>
>   /usr/bin/ld: libqemu-aarch64_be-linux-user.fa.p/linux-user_aarch64_cpu_=
loop.c.o: in function `cpu_loop':
>   /builds/stsquad/qemu/build/../linux-user/aarch64/cpu_loop.c:133: undefi=
ned reference to `do_common_semihosting'
>   collect2: error: ld returned 1 exit status
>   [651/2871] Compiling C object libqemu-alpha-linux-user.fa.p/target_alph=
a_translate.c.o
>   ninja: build stopped: subcommand failed.

I missed changing default-configs/targets/aarch64_be-linux-user.mak.

>   https://gitlab.com/stsquad/qemu/-/pipelines/229443833/failures

Some of these were caused by a missing explicit cast to Int128, which is
needed on hosts without compiler support for 128-bit ints. The rest
app to have been the same problem with aarch64_be-linux-user.

> On the next re-spin could you include Kito Cheng's patch for linux-user
> support and also drop the version numbering from the commit titles so I
> don't have to file them off again.

Yup, all done. Thanks much for the review and for getting these tests
run. I've rebased on current master and fixed the problems identified
above.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl/XxdsACgkQ2yIaaQAA
ABGi0xAAoCmjzGuCvpEWqx3i6M0Nsozlz/xkU1y3XzHlRyXa/xwTXGD+yHofWIlb
wRwkhTTJXymAKhUJJe9NR3uQvdqNMnyIGD7+5+RRA6KyCr3wqRh5opU6IYCSPNa6
Ndfp16Z0EJLf5DBT+yHywR9HAeTNrwWi0pWx/9obSrbTT4KjDx0B2x2mO7mAGTZ9
cm8s1Un4X+KsiI2AHRA/AF9irp4oOxGg+QRY7uBeZtY/fZUp4PayN1xzWoh6aNl/
mDtARbwxiDiRDrUyKg5c4rAfzMrPmN85Ixp5JIsrYuI6c/HyLW6F7U3GrBQrKIXu
9cX+eVPQ/PtCd9RZszSCUmcz+F7Rf0HyOCTPXlpzIvBctOGoVAOne27/NgmFrIYM
prbuJVRI97UdAaoZReSRyORaiKQMrm/lLp5qwiwz2y9nVMwSMECH8yvJO+ZncjrU
4taIhXUsvwEjaY/zlFAKol9q+yeHfRIC3BFUB23+7jpwDvuYmRyIdCXEWSObklDa
FD8mIe2dg9qlRYh2oY5wbsE+MJmW+UuojUqDcVfAhb3SXUbJUdrXIzRwCHIrLo+B
HRT/9bhN3JmOEmVq7U07Ib0vgc7Ka9h6r3b9hasrM6iLdp05Mhe532VVSHp7r5Le
becy3SLndwQ8V+ojUzS8nOzmnbOuh076n3X1ZO8KPf8SOlyJhHQ=
=9MMN
-----END PGP SIGNATURE-----
--=-=-=--
