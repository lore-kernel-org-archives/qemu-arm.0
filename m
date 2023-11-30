Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp517662ejb;
        Thu, 30 Nov 2023 12:43:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzYEQGXmRmQ33pKcYjKnb4n/iN06JECzOLnBXX6SmPd9P/bVOjjCn1qlHUrXX74kykF4Oq
X-Received: by 2002:a05:620a:3b13:b0:77d:a29b:3356 with SMTP id tl19-20020a05620a3b1300b0077da29b3356mr13841931qkn.58.1701377016885;
        Thu, 30 Nov 2023 12:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701377016; cv=none;
        d=google.com; s=arc-20160816;
        b=sNHoL10H+h+atq80VZU+SbL6Sofc5gV6hEE7zQr9WU6r8Be9/Ypkx/tDCIZE47Bqx7
         x4H87aj7bWOKzwj8stfhkXfmENMrqp2pWJ9CH7Ptj7qMGLZv7S/+c21o1dpeu2HQOgrA
         59d2koJDiA78IVlsDU+r6Wd4zdne1Q8PM2EhwH9zqjKsajBhDI0b7kWPxYOr7QPtkZmc
         Dok21duh+eF2Nx1F0psDBBIjPKciR+id8WikDTJnAeF+3ijnF1aWAbL2NyC4FrlIOSE0
         0lfGk9XyQtnp2OydhXlD6gkTADh8btt+KaJ62AC1bPcS92IlH8/PDFdTFbIGEtfLK71z
         cioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cNAnS8dhB7e4TvDt7MCxzeAFcs3pq2oyNt9JbDuu0+0=;
        fh=5nnF77SriLT+7XGTGQMHcR7ENS+4vdPexhd90QR8rDQ=;
        b=itdOXxC8vVGjfwjj9ge9EXIr7gidW0NlMRjR/J1qZX3e+WZRc/tZgWyJ+xMoPI3U0d
         F9bn/kdShp7gXaWrR9OI8zXiSVF5ugAH1GmibKA46wzK7wlfPSD3cZ1s+BCrjBcsc+Gt
         7X9H5sTdSQO74+PIJ1RQIPOLuyWR8oP6SSHShnFZzGUU3iKOO/qsMM7EjD1yTR30EnUJ
         U3b3YizQ3jDz1UexK4fHT9vTUp6D9/1Hyj4VS5RU87pngQQdBaFao5oJOzm3gk5Z8g9P
         wQ+baQDdoHl9Xlnfoj+vQJQmTY65mblWlikm9X1+gEYjgDclkBgBG162rJ2dfgDCC2B/
         TYUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BIusi2M2;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y16-20020a05620a44d000b0077dabd477f6si1762330qkp.761.2023.11.30.12.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BIusi2M2;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701377016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNAnS8dhB7e4TvDt7MCxzeAFcs3pq2oyNt9JbDuu0+0=;
	b=BIusi2M2FOH4ULlzggB4rqMYbw9kZkZOqsk/3Ow0pglXQr5yrX02O5OhTHOKibfG+7vIjm
	LEdhiI8Ak7SYEZhGpKyLQ6cpxRNvrq6LrTH0+YpB0Y/Pgv1nf+6YD3OW4TPAHivQtzskJ4
	88MloSgcG94QNyQsdrDajnzuwxHLRk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-YVQAL4REMrW4yB-eXJoi0A-1; Thu, 30 Nov 2023 15:43:32 -0500
X-MC-Unique: YVQAL4REMrW4yB-eXJoi0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13067828AC0;
	Thu, 30 Nov 2023 20:43:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5D84C0BDC0;
	Thu, 30 Nov 2023 20:43:26 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:43:25 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
	Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Juan Quintela <quintela@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Huacai Chen <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Alexander Graf <agraf@csgraf.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>, Eric Farman <farman@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	John Snow <jsnow@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Michael Roth <michael.roth@amd.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
	qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	qemu-ppc@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
Message-ID: <20231130204325.GE1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
 <ZWjr0TKxihlpd1jm@x1n>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SBmcOIqLLg4zQdMA"
Content-Disposition: inline
In-Reply-To: <ZWjr0TKxihlpd1jm@x1n>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: bKXFwYL+4Dib


--SBmcOIqLLg4zQdMA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 03:08:49PM -0500, Peter Xu wrote:
> On Wed, Nov 29, 2023 at 04:26:20PM -0500, Stefan Hajnoczi wrote:
> > The Big QEMU Lock (BQL) has many names and they are confusing. The
> > actual QemuMutex variable is called qemu_global_mutex but it's commonly
> > referred to as the BQL in discussions and some code comments. The
> > locking APIs, however, are called qemu_mutex_lock_iothread() and
> > qemu_mutex_unlock_iothread().
> >=20
> > The "iothread" name is historic and comes from when the main thread was
> > split into into KVM vcpu threads and the "iothread" (now called the main
> > loop thread). I have contributed to the confusion myself by introducing
> > a separate --object iothread, a separate concept unrelated to the BQL.
> >=20
> > The "iothread" name is no longer appropriate for the BQL. Rename the
> > locking APIs to:
> > - void qemu_bql_lock(void)
> > - void qemu_bql_unlock(void)
> > - bool qemu_bql_locked(void)
> >=20
> > There are more APIs with "iothread" in their names. Subsequent patches
> > will rename them. There are also comments and documentation that will be
> > updated in later patches.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Acked-by: Peter Xu <peterx@redhat.com>
>=20
> Two nickpicks:
>=20
>   - BQL contains "QEMU" as the 2nd character, so maybe easier to further
>     rename qemu_bql into bql_?

Philippe wondered whether the variable name should end with _mutex (or
_lock is common too), so an alternative might be big_qemu_lock. That's
imperfect because it doesn't start with the usual qemu_ prefix.
qemu_big_lock is better in that regard but inconsistent with our BQL
abbreviation.

I don't like putting an underscore at the end. It's unusual and would
make me wonder what that means.

Naming is hard, but please discuss and I'm open to change to BQL
variable's name to whatever we all agree on.

>=20
>   - Could we keep the full spell of BQL at some places, so people can sti=
ll
>     reference it if not familiar?  IIUC most of the BQL helpers will root
>     back to the major three functions (_lock, _unlock, _locked), perhaps
>     add a comment of "BQL stands for..." over these three functions as
>     comment?

Yes, I'll update the doc comments to say "Big QEMU Lock (BQL)" for each
of these functions.

Stefan

--SBmcOIqLLg4zQdMA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8+0ACgkQnKSrs4Gr
c8jJmAf9E8P/Xu7G6FqCGvOsGt/mlsqbLE31vNsiYxVDEuJJ4a39lBYM8XOY3zUI
Gg064yxhG8tJGG9m/NXlySw6Sspev3/nD4NPnrVvUGbS7OGjFL9L4oeHzgeK/ude
U2mtVSBxhVHvx08ya0nKtF3i0ghiSWa+/X83V03smz5ZuMNU1ZXTAzSCp54dwQCH
nO4Q4Y7nQxE57jSy8rB5HTwxFpmfjfXlzYpF+3rYGj+pjy7vOEuD8jdGBZ3+ts9x
Cca0JUsQNEHbcUesyE4ToH5KQHOFUQKalbc+knFcT8JuoGXX3MwuS4mp22wi7Gv6
LDSh2bymbDqhY4xQU5BomaihozS0ww==
=QeIi
-----END PGP SIGNATURE-----

--SBmcOIqLLg4zQdMA--
