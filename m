Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1299065wrq;
        Wed, 23 Oct 2019 12:15:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzftxT5KxaVpPRMjfvUmKxAu8hD+DQy+LXpYz4TjhpirpjB0xNZQV+EAUFlfrMOccY6usH5
X-Received: by 2002:a63:1c06:: with SMTP id c6mr11969163pgc.417.1571858148932;
        Wed, 23 Oct 2019 12:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571858148; cv=none;
        d=google.com; s=arc-20160816;
        b=mdPQPbzFRQX+3szh3ojgV/PpdfbwLlKurUbmiwWlCOxfJrZenvhgKa812XsZQjp/gM
         sgFRknQRsU9nqSlzN0dNRoo/FWoIQnQV0/wQ48Q7O/0vz20ie/fF8F/xf/A8ncCc6RDV
         S0ExXAlzV7juWZZqkLOjJZBlpUs42C3IY7WKOrYZKAd166SHmK1YIGPALQncEaYQY8/S
         BYj40RG3XgBpuu9ftmjjcvH9FL7L6EdOmG7SqDueRcs7l0B+Cp6ErhR8JaaK0+sSCBWZ
         lVgBvEiNENm24m9hx5vl8rI+VbtwvM/03HpIc8EBfhd6FBJRklbA76h4kw6saAS4zE2v
         Gw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from;
        bh=T4CpNmYxnAgTcg0YZ0Rs6V051QY/bFgiYeQOXKApoOI=;
        b=WrmmhUwWtJSPzXBnpoVxOmUaBbvO9ARCjcdTdvjVpwbaKH1RlRN4BfX1f7oPBZhmc7
         +AHEhKRbFyZZHADZ9EFhwwU4+ROBxHknJICPvmMEGzJ4X79Sl/KM1Q9yvGjnLt3KA++A
         n5TrZDdDQE2yR+45KoDOPQSHrQPZL9Hp77v5vmJu/UCjt8Ygmq1Aa/9+vVlu75gMN4yK
         CjmWanld1FMs5426AkPfJopiGX7h9IhJ9Ig+vz30Wy0eIs+Or3jzTavFOxm25w7JnUN4
         9QCPV+ydt4/YMrA8VpYC+fQ+bl3oDx+1g3O/8fEff9nCmS8/XSE3aq6WBAuUAMye9Dv9
         npSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id b190si25214557pfg.227.2019.10.23.12.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 12:15:48 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id B1FE03F23ED3;
	Wed, 23 Oct 2019 12:15:47 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VKIcKvzv9SZ9; Wed, 23 Oct 2019 12:15:47 -0700 (PDT)
Received: from keithp.com (keithp-172.keithp.com [10.0.0.172])
	by elaine.keithp.com (Postfix) with ESMTPSA id 7655C3F23EB1;
	Wed, 23 Oct 2019 12:15:47 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
	id CD50E1582118; Wed, 23 Oct 2019 12:15:46 -0700 (PDT)
From: "Keith Packard" <keithp@keithp.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] Semihost SYS_READC implementation
In-Reply-To: <5e8913f8-558d-6a2e-c7d0-787ec533e4a9@redhat.com>
References: <20191022031335.9880-1-keithp@keithp.com> <d7470bfa-ba4e-3287-326f-ee63c5d76407@redhat.com> <87sgnk3b0k.fsf@keithp.com> <5e8913f8-558d-6a2e-c7d0-787ec533e4a9@redhat.com>
Date: Wed, 23 Oct 2019 12:15:46 -0700
Message-ID: <87eez31del.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: ZISRiTp5xhtM

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Paolo Bonzini <pbonzini@redhat.com> writes:

> Please take a look at include/qemu/fifo8.h instead of rolling your own
> ring buffer.  Note that it is not thread-safe so you'll have to keep
> that part.

Sorry for not looking around sooner, and thanks for the pointer.
I've also cleaned up the other issues.

> Kudos for the unlock/lock_iothread; I am not really familiar with the
> semihosting code and I would have naively assumed that it runs without
> that lock taken.

I discovered by testing that the semihosting functions were entered with
the lock taken :-)

I'll post an updated version of this patch to the list shortly. Thanks
again for your review; I really appreciate the time you've taken to look
at my patch.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl2wpuIACgkQ2yIaaQAA
ABHAOQ//V73ZQhAgWfci8AUC0QDOrOsGQ/ysuGomZ6O56MKNsYUmXrVYzD+eXxRc
Uh8bYM68rPn4JCeDwVJiBKKkGrhN138cieEb2if/cZ0hn71xZc9wiGn0bu33pU9e
d7rY3SWqBwUI3Km24o3qwNBD36mAmeiZHm1Htmv8hg8dBsH+kkBvVUGr/SkxcXhL
/yEKaqsqYIG3+sCetyXlv4iOmdxZjc0ljELhhPfrrM+7z7Czb+jK+syBj7u2SdqY
R04VyvmMjWEfm7xD5ON4A+sWT7GIXKzwSe88zJ8AO3w/0LFTR+m5ZinKeSOIgsdA
MBIKXT3sJkRy8F4kPI3kzsET6pwU5GhrUF2hMJ9Zlt6LWYl3gm77etw53Q6fZrsc
ZsLLckRHoQ7Ocot7pulXyFQMfDmY+NkolngPR7rPUkN/RsM1v0lHeAAvJBAxWR5k
lrr59wbn8dfE0/SoQHihhISu3oSTOTOHi3jP5LK3ekg83Pa/V2U20wNYW514qs2b
JcQYiW+l047MIGOO8qKRnmrApSD8xnq6ZWk6cA6rVsh3BmTjW9u5RMk4tQH9ouCc
OBUb3tVeUD2C4I4CU+a8CMSv1fIbisUg0batn3nnCpZG3jeIGX/ctIdqhnZZNd/a
ZbbiSSiWa5u6QJnUGOInZWRfPJVUcQ2Z+FyOEUWhkU8rgnYOjIw=
=Gk4J
-----END PGP SIGNATURE-----
--=-=-=--
