Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp510403ejb;
        Thu, 30 Nov 2023 12:29:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG+5ILkkJktnF0XL51jnfW501i2cgMM6ICF7/XJ8FrkOc26cTNtly8yg8GYeLkJ73g6rwx
X-Received: by 2002:a05:622a:cc:b0:423:765f:486e with SMTP id p12-20020a05622a00cc00b00423765f486emr38597485qtw.17.1701376164175;
        Thu, 30 Nov 2023 12:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701376164; cv=none;
        d=google.com; s=arc-20160816;
        b=Ls4Rn+0tmUSjvlfBcDwB08vIjLLlVAWkf3B8hhAKFAb7ZjV35HbyHSvQUmcKGOspQR
         cOdzQblMVJIjsBNyQRLavZIMwnmu84MqiLtZid3kRA8xNZydAfn8pttwq0hPDGDwoJQX
         lmc0jUWxe4zajN5alaNmc+dVQh69ZS80gTDIOm91E5pL36IRFVzFTzrYSZP2I9CyUGWv
         2XDSVDlfbkCLkfiinJS73NrvLcV0xvWETqFPez6X1skVvEi6SgMqhQ7EuBkdTXlnteSe
         f32xqHnUk3yLBVUHZ7P87jj7ypDOWYOpu2nW/5JLAu5MLbAFcnnPhsRyX9FFMzy/aaaK
         Drmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=pspgY/UtbTR6ASTEqbHV7C5jZMpcDbn0C1ttaW0vK+0=;
        fh=9CJ7yOhhKzR0jcIz9wi4B2UZBFKQ+eC/aSrbeUuViNw=;
        b=kRl1dF8d8+Sg8hwmO1G2x68OszYmsRW5w11c9zLamADWbO5dQrT9sCL8Lh9UfeP3Hz
         2EaggEy87CbZZS7SS9LDidRvoi7tWPb8IMpRe7i6vW1Dc7TN7bKt/kWHaRc0/T2dpFh9
         mG8QWXIbffQhWYomVNqXhW/ePDaKs+/P6S8+3DCODwAsYbfCYySXJUmL19aEXecfH4ra
         YuqIGXq0Ckqis5Ek+BWYq7EXmP8cvOxWpCNxoA9w3WdTM4eZrvb1ZNXZK/enRzBDYxse
         KcM1CTRh6ViERkutcroMAzK2iaqrJ4DgD8oGjZnHM2Ux0Qldax9/fW6ZzndjjkxOl/lI
         ks2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YjbdL7et;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ck6-20020a05622a230600b00423b1181008si1930374qtb.610.2023.11.30.12.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:29:24 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YjbdL7et;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701376163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pspgY/UtbTR6ASTEqbHV7C5jZMpcDbn0C1ttaW0vK+0=;
	b=YjbdL7etOexrGHsUDJh3rKnn68u0mJQ7U0ZonK0otYftFEkt5fLZskuIhiqaSFgyUwHTBv
	kJfY2nCZl1TUJ9bvJ8OEhVA86mHIbPqxauZcS0lquZiVFmO4Tdq7cALdXnhdNzrjLU4HZ4
	CVe0XwU++PPXQKgKTCgQTtaaq5P2bBg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-DFipSJ9NNb6fbEEPaw_Vzw-1; Thu,
 30 Nov 2023 15:29:21 -0500
X-MC-Unique: DFipSJ9NNb6fbEEPaw_Vzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B2941C06EC1;
	Thu, 30 Nov 2023 20:29:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1713E36E2;
	Thu, 30 Nov 2023 20:27:34 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:27:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
	Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
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
	Peter Xu <peterx@redhat.com>,
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
Subject: Re: [PATCH 2/6] qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to
 QEMU_BQL_LOCK_GUARD
Message-ID: <20231130202732.GA1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-3-stefanha@redhat.com>
 <c3ac8d9c2b9d611e84672436ce1a96aedcaacf5e.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IGy9nSmIZnwUahKG"
Content-Disposition: inline
In-Reply-To: <c3ac8d9c2b9d611e84672436ce1a96aedcaacf5e.camel@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-TUID: hAFil6Q8/9Pa


--IGy9nSmIZnwUahKG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 10:14:47AM +0100, Ilya Leoshkevich wrote:
> On Wed, 2023-11-29 at 16:26 -0500, Stefan Hajnoczi wrote:
> > The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> > instead, it is already widely used and unambiguous.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > =A0include/qemu/main-loop.h=A0 | 20 ++++++++++----------
> > =A0hw/i386/kvm/xen_evtchn.c=A0 | 14 +++++++-------
> > =A0hw/i386/kvm/xen_gnttab.c=A0 |=A0 2 +-
> > =A0hw/mips/mips_int.c=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +-
> > =A0hw/ppc/ppc.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +-
> > =A0target/i386/kvm/xen-emu.c |=A0 2 +-
> > =A0target/ppc/excp_helper.c=A0 |=A0 2 +-
> > =A0target/ppc/helper_regs.c=A0 |=A0 2 +-
> > =A0target/riscv/cpu_helper.c |=A0 4 ++--
> > =A09 files changed, 25 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> > index d6f75e57bd..0b6a3e4824 100644
> > --- a/include/qemu/main-loop.h
> > +++ b/include/qemu/main-loop.h
> > @@ -344,13 +344,13 @@ void qemu_bql_lock_impl(const char *file, int
> > line);
> > =A0void qemu_bql_unlock(void);
> > =A0
> > =A0/**
> > - * QEMU_IOTHREAD_LOCK_GUARD
> > + * QEMU_BQL_LOCK_GUARD
> > =A0 *
> > - * Wrap a block of code in a conditional
> > qemu_mutex_{lock,unlock}_iothread.
> > + * Wrap a block of code in a conditional qemu_bql_{lock,unlock}.
> > =A0 */
> > -typedef struct IOThreadLockAuto IOThreadLockAuto;
> > +typedef struct BQLLockAuto BQLLockAuto;
> > =A0
> > -static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char
> > *file,
> > +static inline BQLLockAuto *qemu_bql_auto_lock(const char *file,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 int line)
>=20
> The padding is not correct anymore.

Good point, I didn't check the formatting after search-and-replace. I
will fix this across the patch series in v2.

Stefan

--IGy9nSmIZnwUahKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8DQACgkQnKSrs4Gr
c8ge1wf+IIHG7oAMqIyOTOA/oFS2QG8uPyiFJQq8Zhme5LBuPIvsf8300Z76gAFP
LqKNIp9tEHi376ORvR9zKqXs6EyrAjdTT9jBThkjo9Dsw8WtdpMy1OP3sRZ6RZ5Z
BKv5+J0R2bvw5JBpc/wk7Fnypv5lgxFtWE/MiKDSG6jfjr6+6VDuHt3/CiBBs0cU
XCtQeZrqhRpjJVA0k05LM+8lVbx8H27bqQxQ9kLFFGpiDm0mMNtiQ+VyXLsxprcW
0OZ+iv46HtHiJtiBYEMxGxI7q3OJjnvS7fKklk3dLJAJxGHVUEedtOg9gzcMCec1
64wQWmIUbq61hdMdbFULncGwAIGa0w==
=I8on
-----END PGP SIGNATURE-----

--IGy9nSmIZnwUahKG--
