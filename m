Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1391597eji;
        Tue, 2 Jan 2024 07:34:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFydf/n5AidTtjQnTFeOGZg3uUnXE9us40Vynzt6JCwAQAskmTZ7Mg/7kxSONpSu6vLvo+e
X-Received: by 2002:a05:622a:491:b0:425:4042:f45b with SMTP id p17-20020a05622a049100b004254042f45bmr25164591qtx.63.1704209640973;
        Tue, 02 Jan 2024 07:34:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704209640; cv=none;
        d=google.com; s=arc-20160816;
        b=yw3MVgE0tBsR3mQ4ww+uIsMUTn+VMETTWMZlXoyTp4zFQaqu2SnQdUuWgOmQhihid6
         c6pK/5XqyHIIwvJ+//3QukSHERFB0F3RARjBOpf7VLdagSlkd/eWeSYZP+1g2OlZiK3Q
         51wRjMgIoAaQAH39XX5/gVhXE/Qa0dUhsEJ2ahODu3czByp8YFF+PdI9mbxbt07DU5fG
         jVVvn7yX2LM6Co4unJVaYmFmVLo6TDLI28aFo/HY4NdZChWE6EH0ou+B7je23XpcS2SS
         f6swsYNLc+f4XB1t9M/bnQAnb7enWWmdPWJN76gwMNkoCarEGHnjklHTrn1s/HBef+Jr
         KHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=qivEXDFa8JGXsGjfK5660gJbyc7eHqwbc8ku83Ng7G0=;
        fh=ROKlq92lUA0z7Tu/VxmdfDJtBvQmYlByC1OV/cDb5Ak=;
        b=OAopwZZ1k/jlyVRYmmpq6yn2aK98cSgn/2K3cmz9hxzIIJDMtKBNBuwKlHHvqsM33p
         88oop3g2yPCTr2X+Cn9JVYxqMAXyoB2YO/CPPzqKjb6+0lWbOyDZEvWNgCeq7qhL0i8X
         ee3I4z1FqxmiacuV0neszzKi6AXpcSbu0bDHUqIerOxiRuYYFch4AGJabCxgLd1oynSa
         BzgEdGG+Fdmv01+MTFLX2JY4oIdW1iU8SLRnoRZC2byfTa7+ovtxlx+4zTIshok5fFpN
         82JUAn7RjE7DbQD60Wof2MCO4zmoh9zGMqMhS07Y8qhwDOKTTm19YHO1YRcUP6fxWDFU
         OHDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GzP4bKX6;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id z8-20020a05622a060800b0042785ccbaafsi26534556qta.300.2024.01.02.07.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:34:00 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GzP4bKX6;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704209640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qivEXDFa8JGXsGjfK5660gJbyc7eHqwbc8ku83Ng7G0=;
	b=GzP4bKX6xjcLcCNMbbADfOrFiiG7jbF2KGKEjT3mweY2P5eA28DEnkeQmq1tcLO3X/zI9Z
	NdpQDFx7vRvBJ0dxYvcn0hs64T5qppYUtzqRQn/QmZYVYmHca6rFM+Kk07V6evwhjN8ylV
	LP4bd865PLkmZXSCo9r3kurW6hi5/js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-pzkIouvUPDeibrT9BgRP0w-1; Tue, 02 Jan 2024 10:33:56 -0500
X-MC-Unique: pzkIouvUPDeibrT9BgRP0w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0700881F02;
	Tue,  2 Jan 2024 15:33:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79635492BFA;
	Tue,  2 Jan 2024 15:33:46 +0000 (UTC)
Date: Tue, 2 Jan 2024 10:33:45 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Paul Durrant <paul@xen.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Alexander Graf <agraf@csgraf.de>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>, Fam Zheng <fam@euphon.net>,
	Song Gao <gaosong@loongson.cn>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leonardo Bras <leobras@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Weiwei Li <liwei1518@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org, qemu-block@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Stafford Horne <shorne@gmail.com>, Fabiano Rosas <farosas@suse.de>,
	Juan Quintela <quintela@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Blake <eblake@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Halil Pasic <pasic@linux.ibm.com>, xen-devel@lists.xenproject.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v2 1/5] system/cpus: rename qemu_mutex_lock_iothread() to
 bql_lock()
Message-ID: <20240102153345.GA485043@fedora>
References: <20231212153905.631119-1-stefanha@redhat.com>
 <20231212153905.631119-2-stefanha@redhat.com>
 <389fff8c-9f5d-4b6b-acd2-bc3e2110a9b3@daynix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DI3ersSYWO3ysvwX"
Content-Disposition: inline
In-Reply-To: <389fff8c-9f5d-4b6b-acd2-bc3e2110a9b3@daynix.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-TUID: OG2S/XLTSep7


--DI3ersSYWO3ysvwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:37:00PM +0900, Akihiko Odaki wrote:
> On 2023/12/13 0:39, Stefan Hajnoczi wrote:
> > @@ -312,58 +312,58 @@ bool qemu_in_main_thread(void);
> >       } while (0)
> >   /**
> > - * qemu_mutex_lock_iothread: Lock the main loop mutex.
> > + * bql_lock: Lock the Big QEMU Lock (BQL).
> >    *
> > - * This function locks the main loop mutex.  The mutex is taken by
> > + * This function locks the Big QEMU Lock (BQL).  The lock is taken by
> >    * main() in vl.c and always taken except while waiting on
> > - * external events (such as with select).  The mutex should be taken
> > + * external events (such as with select).  The lock should be taken
> >    * by threads other than the main loop thread when calling
> >    * qemu_bh_new(), qemu_set_fd_handler() and basically all other
> >    * functions documented in this file.
> >    *
> > - * NOTE: tools currently are single-threaded and qemu_mutex_lock_iothr=
ead
> > + * NOTE: tools currently are single-threaded and bql_lock
> >    * is a no-op there.
> >    */
> > -#define qemu_mutex_lock_iothread()                      \
> > -    qemu_mutex_lock_iothread_impl(__FILE__, __LINE__)
> > -void qemu_mutex_lock_iothread_impl(const char *file, int line);
> > +#define bql_lock()                      \
> > +    bql_lock_impl(__FILE__, __LINE__)
>=20
> This line break is no longer necessary.

Will fix in v3.

Stefan

--DI3ersSYWO3ysvwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmWULNkACgkQnKSrs4Gr
c8gQ1wf/SKDGDIkJDmyj8M85Uyj3OSfk6tILO0qMqPCHK2Xyw3+EA0ugnFsOQ0eT
UcvEcmAyA0hewn7VKrk4Ge1wuPQ6Qm9DgLNb6oojftMAxktuhOAwC8VRaYiUFIF/
JP46P0qatEeghim4KwM4VV8EGGClPZU0vVsAQ/6rAxs2ZWbgBMPFfg9TSspauGWY
4tObr3E/T3RO4aajdJMcobO9ocG3TTdJAGwcOY6nGHnfS+DE/+a2yr4NwmQrxgqS
jcmYNPM+uSCzilu3csBqEtYtklAsVkArXGkf0pcSb73VmfgeBdHlIRupD0aCq3SE
4rE39ETbAHOxe0+sS7oasRYcUNKBxA==
=P1kw
-----END PGP SIGNATURE-----

--DI3ersSYWO3ysvwX--
