Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2374270njd;
        Tue, 22 Apr 2025 07:02:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSJiy2236sruc4CsgjZL7LEZWxtffEHYu/G0aQ3T2K/oEnbipUpg9K9M0V4hF185ohxu1LKFtZx7tWfg==@linaro.org
X-Google-Smtp-Source: AGHT+IHkjgNB9lI8uxmcQ5rVI8O1Saf8HzCNzB6OH5oP6AlONhdO2Iu4ASlFSoVio7fuRlRUlUt0
X-Received: by 2002:a5d:64e4:0:b0:38f:37f3:5ca9 with SMTP id ffacd0b85a97d-39efbaf1126mr12140746f8f.50.1745330563824;
        Tue, 22 Apr 2025 07:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745330563; cv=none;
        d=google.com; s=arc-20240605;
        b=l2LZdCZo5Xc4YDWcdjgd9TAZvdMkEqlz2DYLgEUCkWWip877+qrdwjoMHwJVM83cv1
         ROM7F6mpT71+iJtxPfSgYMonlTGXkAhb7TyupibaPe3xYgwDi2l8XHCeHyIssg7DKiSQ
         F67er4orXzO2yiIG//QMXU42mmo0bj+15XfiiO2W7xT6rltTaEnvEtxlVzbF55Uqpsu4
         rF7jOmiQNCO9SVqmd6T670LsPPqA7wFwh9/Gcb8FRBIyrHWbIRJf+cmx2UEvN3tJi+7r
         sSJnzgAV5VNv9vKt30DDJSGXNCzSTxZOJFRqLw+GLcQ/BB1usiWNCNoH0w6BFgBlSGsd
         WZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=gPFJrHA5M71c3UwbrJYytVj0SGR0ASd/LIoDZp8msTA=;
        fh=32aYhd7NfHuqwTHZhAKO0J9L4kOohn4q+7j19V5UlyM=;
        b=SaOLjiF3nbxv7KhLccbkMhUYR8NOcAwjkm27pJHs7Eu07vnIHw4CEMSSBd1MoxxxDy
         yVuhFBOBSlM0HFubWA1PHfPJdv6/HX4QiE2XXqV2oJBvH8kjkzr9dW7lPau46iFXsiN5
         omPMplXmYYwEf9ip2YqDr9IbLk3PV4mnWmFmPOrqwwHYTo3YiK4pYu1kv2q7IBaYfFQv
         BdBKq/haQ03ji2YnoC5mY/Yz8drPGEpIKYDY1D4JNT4YS6nA8+6hYAQ6icXT3HhE964x
         dN5FzBskAbT81RccCuz+yhi6IGqzWR+IferxZv31A4vwmmfIftobGiyADRRjzTtH4RTg
         rNDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ND2B2hqn;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-39efa48a7e1si6651857f8f.359.2025.04.22.07.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ND2B2hqn;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745330562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gPFJrHA5M71c3UwbrJYytVj0SGR0ASd/LIoDZp8msTA=;
	b=ND2B2hqnYzW6dXBBCdjXBjjCTG8lqXxqS3ByjQquz0swjE+YnqMREUeSWc+BjuXLV+nif9
	ufHo6k3rMmmoaJquYHmFHezthQA2nMywwoE8Q7MgOvfNBxJl7C823BrM8CzGLgX4PU+ah3
	z0jou0+yoZwAn68/bYZw+lyfyivFnVs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-PnD7k094PV-TO6F3HJ0EnQ-1; Tue,
 22 Apr 2025 10:02:36 -0400
X-MC-Unique: PnD7k094PV-TO6F3HJ0EnQ-1
X-Mimecast-MFC-AGG-ID: PnD7k094PV-TO6F3HJ0EnQ_1745330553
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D93D1800374;
	Tue, 22 Apr 2025 14:02:33 +0000 (UTC)
Received: from localhost (unknown [10.2.16.110])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7D55719560A3;
	Tue, 22 Apr 2025 14:02:31 +0000 (UTC)
Date: Tue, 22 Apr 2025 10:02:30 -0400
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
Subject: Re: [PATCH v2 12/20] block: Add including of ioctl header for
 Emscripten build
Message-ID: <20250422140230.GD301197@fedora>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <1821e79d3977c3645aa79128b823748aa9a63800.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SuP7/mi/IM/vqmX4"
Content-Disposition: inline
In-Reply-To: <1821e79d3977c3645aa79128b823748aa9a63800.1745295397.git.ktokunaga.mail@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: u11LfHFnA488


--SuP7/mi/IM/vqmX4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 02:27:16PM +0900, Kohei Tokunaga wrote:
> Including <sys/ioctl.h> is still required on Emscripten, just like on oth=
er
> platforms, to make the ioctl function available.
>=20
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>  block/file-posix.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> V2:
> - Split this from the previous 12th patch into a separate commit and revi=
sed
>   the commit message to clarify the purpose of the patch.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--SuP7/mi/IM/vqmX4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmgHoXYACgkQnKSrs4Gr
c8jEwwf/QxCf3lBV75G1Urd1WZ73yQqS/fQw1TJRMOhrHiUelhmP7ssm8qVM+zja
ZOBVP2gGae3Ae0WZ0Hn/PFxSJ8xmI8A5Vfq40NiMrFQbD/NHdVOMl/INK91MtTeV
Y4sE/HXDjv9q70Uynr5bbRWbW+nTP+lvBJauwsk2hhzTrsvPijxAZ8JHXum2C+yG
R6W5ca1qn89W8e/jY7FJFsLCe664vctz5TsC7IiUvvts/hLWwaX8hSaTb074rtx5
PrxEdW8QfNjFRR9UIKIiEg1bk7Er30T/XRLhBfBYAhinMmWGuGr0uEwCOhWiox4N
+Gl4btWj8imzhMbbwyJaawXlMdgGrg==
=CklY
-----END PGP SIGNATURE-----

--SuP7/mi/IM/vqmX4--
