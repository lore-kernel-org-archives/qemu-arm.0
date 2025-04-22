Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2371537njd;
        Tue, 22 Apr 2025 06:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6BLtrqQazsZPyHg9KeJvQRtY3Wk8cTKE72VzdeUnZvwRq3Z0FC2mvfsnfg6QDI0sr1lPA1dBB7Lpnmw==@linaro.org
X-Google-Smtp-Source: AGHT+IFbP/jtVv+Gm5QzZIUktZbd5sNWSDlfA1vnNPkHF156F9Npgkl9qsC8ubNydY2eHb4ROxuM
X-Received: by 2002:a05:6102:30b0:b0:4c4:e3c7:cc8e with SMTP id ada2fe7eead31-4cb8021206fmr9676157137.24.1745330394826;
        Tue, 22 Apr 2025 06:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745330394; cv=none;
        d=google.com; s=arc-20240605;
        b=LOVtj69PCmCFUTthZkUe9FAyOlooemBkOZVkKUqjl2ErhJ+14oPcmQXb35TpRTNloi
         jumAQu4ezFZp3WCDJOXhpKQRgj7GKPl3qWlqQ3+VMiBEBl/j+jlYcEiPX28163orQPgL
         cCUE3zeADeRKN4t5PEIEpMIASoPCbB8BYFv4EmAXbfJNgZZ+kuwT8o4NHuhBmyR/AmTn
         /KcnNFXMjXzS9F1qjX24/3FvxarD/a6xNy3lxXM0KWOnLLIWLpK81r74sVJp7E9Y00q8
         cq14xqo1TZwBRe7DyNV54Cf7CtgJ4ZUCLBXMMIGAdqGzhj8p/q00slZmVhiV0kNbACbc
         IYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=OMtwXvaheTlkiqC0k82+nnlb5B0oIlbejhg9K2ePGgM=;
        fh=32aYhd7NfHuqwTHZhAKO0J9L4kOohn4q+7j19V5UlyM=;
        b=Lb5nmp86y7qpRlf31W79BV9ETblamFT8lYmq7IqsCMwOq7euQ1pLfsCmdQtTh+2Ibh
         yftobKW6ryw7ZQS3CHogCzHif5HJJutHdvNhMBruAWn+/vNCKrwP69hy7eTjsCr3XZuz
         pvJhxIhwU3RR2HpsvhgRj4GQK4QittvZFrVOBGP+23YGLbdD+1UGa8uQL8I4hvniVsu6
         jpsVICMpOfirYAd+EsO1fVpxkMXLp8UdWivSTsYH4VqsA4a0znXWrjKhHUKZL6CQIm6j
         sOjXh4cIakayr85AfhT5OuWhwBTfPIMSsODHga1FV2e1BU0LQj5OVjnQWUWZNoH7tXCU
         uG7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3mhR8UC;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4cb7e04f61asi2309513137.670.2025.04.22.06.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3mhR8UC;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745330394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OMtwXvaheTlkiqC0k82+nnlb5B0oIlbejhg9K2ePGgM=;
	b=X3mhR8UC8Bw9VMxS6CbVJu/TJllOYa8ubaVaNFj0hduDOtDInyz837cUP/63oEy1kcF32b
	Zdcs07KPL7ZwUP7wXiOlEnXsYiRt1TO2zAKswQo3YOQWyzBhtPUcoDFJfg7r95DTm5c1I8
	GPNjbh0rL2q7SY2F6vVBJe00+QYdYlc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-X05eMDwIPniIGH4XwKwm2g-1; Tue,
 22 Apr 2025 09:59:49 -0400
X-MC-Unique: X05eMDwIPniIGH4XwKwm2g-1
X-Mimecast-MFC-AGG-ID: X05eMDwIPniIGH4XwKwm2g_1745330386
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C709E19560A5;
	Tue, 22 Apr 2025 13:59:43 +0000 (UTC)
Received: from localhost (unknown [10.2.16.110])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 39459180010A;
	Tue, 22 Apr 2025 13:59:39 +0000 (UTC)
Date: Tue, 22 Apr 2025 09:59:38 -0400
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
Subject: Re: [PATCH v2 17/20] util: Add coroutine backend for emscripten
Message-ID: <20250422135938.GB301197@fedora>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <82afa4d287a16f89fa59f08cba14fb06e017ea83.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DltiIdaNA3nWqmR9"
Content-Disposition: inline
In-Reply-To: <82afa4d287a16f89fa59f08cba14fb06e017ea83.1745295397.git.ktokunaga.mail@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: BnxRzHNxXSp9


--DltiIdaNA3nWqmR9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 02:27:21PM +0900, Kohei Tokunaga wrote:
> Emscripten does not support couroutine methods currently used by QEMU but
> provides a coroutine implementation called "fiber". This commit introduce=
s a
> coroutine backend using fiber. Note that fiber does not support submitting
> coroutines to other threads.
>=20
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>  MAINTAINERS           |   1 +
>  util/coroutine-wasm.c | 127 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 util/coroutine-wasm.c
>=20
> V2:
> - Split the MAINTAINERS file change that adds coroutine-wasm.c from the
>   previous 19th patch into this commit.

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--DltiIdaNA3nWqmR9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmgHoMoACgkQnKSrs4Gr
c8gBeQgAkKJs5uspGEuKmK1DsHRilGp+8iPwo09eOxS9265IAygkr6XEk0f6JQbQ
ATJgJFl7qVMhPDalRx+jsRrIbfrvQ/RzTbqszy1pCLXuBOLkWYEgXXClGHtBTZtn
dAKpesc0EaoV/3r70TgNHVDsRGZeeALaJ8oksWtC3dj3lX2CRJUdf6wDFxL8R39x
+at+I4lXSmXKVS5lSDYl0D/+RjWncJzwv9X8WK1gCXGWzSdjm6ZvC3d5rqWV2jfL
m0PMcwq99AX3ohiE1f6F8Cxn3roPqeM5vmvF7586JAe7/X4U0dvtS0B6hhyfWB8C
SGDpKDSpoos4LUj2MQ0otrEBfH+EgA==
=1x7V
-----END PGP SIGNATURE-----

--DltiIdaNA3nWqmR9--
