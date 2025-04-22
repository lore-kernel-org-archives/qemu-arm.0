Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2373629njd;
        Tue, 22 Apr 2025 07:02:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpwht/Jkednyv1/IKybHRMmegzlAYl79zbrpt8S0HOqlMJL0/NA0jqgZUTZKFRbX22tZp6IC7wPE8zfw==@linaro.org
X-Google-Smtp-Source: AGHT+IEIF944fuswdABUcq+YTXAE1+vXG7GPbTnV2RHjtGYYVkpXT6T1Qb7rSnE6z3Ik/VvWUnW4
X-Received: by 2002:a2e:be24:0:b0:30b:efa3:b105 with SMTP id 38308e7fff4ca-310905011f1mr49811041fa.19.1745330528324;
        Tue, 22 Apr 2025 07:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745330528; cv=none;
        d=google.com; s=arc-20240605;
        b=QjlEGRHCNZJJ10HnvXqtt3PqCDfrd3XKJdZ9OVW03kffyU0ZQEHwwQ5dymNj9wLwop
         /qQD44mPzWjc034MBEUrYmCM4/olmBGuAPSg+3MwqWvoIFSb4IhWSxFuVmqnip6lMAhl
         JDT05/ICfPRqhnWM5O6Vsi7vlnK89HA8jc8KgNtFmk2H0wL0GLLQ27GeSdD+UuSBXCc0
         loAgwwg1x2Y3oY7zYvN4Ubt3O+KGeIc46g4/U7NzYxkW3N2y37zDBsl0PqjGxyAkB7MV
         nE/NSJStXhi4q1Q/dvmPZGYXkxCRnGmeVn4GqCtj5TK3fUFrb03wiwCfomeDaLMj1Tb3
         VpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7oUOK46QlawTR7PzRa1h2tAuDsOpWCOm7vEMBMH4LoM=;
        fh=32aYhd7NfHuqwTHZhAKO0J9L4kOohn4q+7j19V5UlyM=;
        b=Jb47d9+tb9xqB1HqmdAiJ3iQo1NiQ2KbS4OBRNgrBOzAnmbQCjPEZ++akxAS/t5xQR
         lU/OJENlyuy814eJ1hQw+WLiFfZ94upA3rEOoEZs78YfWG7NqcY3QKsmrwGZg0MBocxY
         f8Y8nWaer5DbdZgRZxeiJGG2vYDQLkDs/QtkQxpdftL06K/s2EqQNVywDvMnc473fEsq
         7z3gQ9YgwZ0UKqw7VUBveHDTYoMxjY7aHaQLIWT6l5Bs3SbYr4i/aGY7YK/3zHxlniJK
         uHSvl0vJnPL+1byGaK4FJ7ZE63RGzAeBjEeqsIiu9of102G+6HsHq9WtRZ6153K5mH5Z
         tzrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ClZ2E7W3;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-31090804009si37735971fa.239.2025.04.22.07.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:02:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ClZ2E7W3;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745330525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7oUOK46QlawTR7PzRa1h2tAuDsOpWCOm7vEMBMH4LoM=;
	b=ClZ2E7W34Ft4Ry6bycfxH7nPNbsmuDk3fnzH5P0Y53tHfjbLxvJuli9zFoMK20cbkCv506
	6FQhksZsA0TLYLYjGwDznYP3e1+cok23X0ogZMwGsgRDarz6rRe0iw7Z3xqCkCLlkOddFh
	ZGmGA3nYx5jLYMhb/GmirCnK+AEzYd8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-lKdadMvSOC--cVrGngmKBQ-1; Tue,
 22 Apr 2025 10:02:02 -0400
X-MC-Unique: lKdadMvSOC--cVrGngmKBQ-1
X-Mimecast-MFC-AGG-ID: lKdadMvSOC--cVrGngmKBQ_1745330519
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F189519560BC;
	Tue, 22 Apr 2025 14:01:58 +0000 (UTC)
Received: from localhost (unknown [10.2.16.110])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1C639195608D;
	Tue, 22 Apr 2025 14:01:56 +0000 (UTC)
Date: Tue, 22 Apr 2025 10:01:55 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Cc: qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 13/20] block: Fix type confict of the copy_file_range
 stub
Message-ID: <20250422140155.GC301197@fedora>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <ce34a721a5283fce854f417baf7b1c8f5c48c028.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BVTxInpCVWgS3hFa"
Content-Disposition: inline
In-Reply-To: <ce34a721a5283fce854f417baf7b1c8f5c48c028.1745295397.git.ktokunaga.mail@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: tjSy/+UgerIy


--BVTxInpCVWgS3hFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 02:27:17PM +0900, Kohei Tokunaga wrote:
> Emscripten doesn't provide copy_file_range implementation but it declares
> this function in its headers. Meson correctly detects the missing
> implementation and unsets HAVE_COPY_FILE_RANGE. However, the stub defined=
 in
> file-posix.c causes a type conflict with the declaration from Emscripten
> during compilation.
>=20
> To fix this error, this commit updates the stub implementation in
> file-posix.c to exactly match the declaration in Emscripten's headers. The
> manpage also aligns with this signature.
>=20
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>  block/file-posix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> V2:
> - Removed the Emscripten-specific stub of copy_file_range in
>   stubs/emscripten.c. Instead, updated the type of the existing
>   copy_file_range stub in block/file-posix.c to match the declaration in =
the
>   Emscripten headers and avoid a compilation error.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--BVTxInpCVWgS3hFa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmgHoVMACgkQnKSrs4Gr
c8jZQQf+OZEX0gEXf1Wt2j51SCBn+i89pfpm/Mg+bo3EwrgfC7ebEI9B2KihRbE2
0UgrgQoe5WLwKiDt4aR0wuMlmTrng+8t5AT9QCOSAxclJ83z8WLVcMl/g/48IPWI
hEnsoDS9EgpPCjoIb+lmFnj6zyfUpLYS3arQwj7sjhAbrrGNwILwtrIe8bqqqhZR
8w1UGF8qR+NV2U57qxexRH0Mvpxp7QhBBCZ1Z7BpCuVUjKb/4xGSqAFktNHY0EHY
CbnbRrFQ4RrUjj9hiZQpbNkkeraBrAbYdZpPk/hp354VXj3s3DamrmqDSNI0f66y
lvyTOwAISkjbSu19Len0U+JNeqlZYQ==
=3eI6
-----END PGP SIGNATURE-----

--BVTxInpCVWgS3hFa--
