Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1544942ejb;
        Thu, 7 Dec 2023 03:44:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVx8JieV2M8h0R7S+iT0bc8qszLNREnOep/ZqB8EPQptBqQ2mr0r7LNyH65j9Qj5afciBS
X-Received: by 2002:a05:620a:309:b0:77f:429:eeb7 with SMTP id s9-20020a05620a030900b0077f0429eeb7mr898623qkm.133.1701949484035;
        Thu, 07 Dec 2023 03:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701949484; cv=none;
        d=google.com; s=arc-20160816;
        b=A2ks0/JWgc8RYLXFE4PcbnAcvscIn10UGhHpHjAxo1vFW9kofTHEATmjdO+sGXwrR5
         0iD4jX2KM+2TsPcRJvmtBY2Hyr4ugsSBpyxkHnGHMcX924uEZqHUrD0MKpeKnsiI0ZjO
         HDkx1HdAPsnMtbHTD+ciQ9J8VE7WEoilwAJrlB9KMf4XjHpxpG1czJ+zuO0nqMe+L9nl
         jM8z+3MGQkx5Vp6MVkUiEp0iVtXXnJ3ly6/vRYBTg/Dqu8+gzNbhn5HLv++rdqHeAkwW
         yFee8xS60m8QI7ZBkHqRHdUFHfjZ8OIYLS0tN+Dr8eRh2N3G5jEBmBSE2DX+DSYhRQ90
         KhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=CsscwaTR3+4z+GEJpfoX3rBQXEHIy7L+AXtx2hqmFDs=;
        fh=tdVaRuVsNYuY9lh0JgyXNT+kLgs1MmCLua9ZyG7B/f4=;
        b=WEBrr1+cLZ29LjJn70tqAyZEkMHUj6TdixzxHT7NYCxzFBGfIvjKtOJpHQ4QhWm2ND
         Anv/OLz4xJ8QqYuNa7UvHuh6TeBChEDIyvbZH2H6yM2X8Qa3oHcwrrjbL585/UJvNmaQ
         LzH1tLe9hjR1ZFRcJOIO00DKH4S67lDQIUEADj7hMEsyn3PBS26e71wDgJ66r064Y4cN
         x5HGGEr3ugix8xGPCOBWGISOEOKjQaWoAZy7CQyTLx7MmMBn0/EpM2LmaWwDbPP2Lu1n
         mRWaqPXQpDphGvFodZ9/JrAnVEO+M4FsXnWq9YvpSBf7pDjOd+N692r2uEdcAZCIIjt0
         aLIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VBES+OG8;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l12-20020a05620a28cc00b007772e76ffb3si1138049qkp.549.2023.12.07.03.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 03:44:44 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VBES+OG8;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701949483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsscwaTR3+4z+GEJpfoX3rBQXEHIy7L+AXtx2hqmFDs=;
	b=VBES+OG8KCLmSRNXGg0W5D8Ytm00rnccoYVLXVlvWAQWoCrAwCgN99HClgHbI6htLDRrMC
	UjpHojAktGq+I4oAWIuTRNqw7IQZQBXHJ20gxJ/RDUlvbdabkpvDHoEvNPPe1eGrl0LLYK
	FJnsFs8DvzdCReupLBXc0iIs7VMx3l4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-214-S1U663asNt-wRPjGPfGkaQ-1; Thu,
 07 Dec 2023 06:44:40 -0500
X-MC-Unique: S1U663asNt-wRPjGPfGkaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71EC9380628D;
	Thu,  7 Dec 2023 11:44:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46EA7492BC6;
	Thu,  7 Dec 2023 11:44:34 +0000 (UTC)
Date: Thu, 7 Dec 2023 06:44:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>
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
	Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
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
Message-ID: <20231207114432.GA2137208@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
 <8f89fbbf-454b-c5e5-5e8f-46ea42ec20ed@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0duhWLao8zUYzEym"
Content-Disposition: inline
In-Reply-To: <8f89fbbf-454b-c5e5-5e8f-46ea42ec20ed@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-TUID: UbwxJKg1u3ej


--0duhWLao8zUYzEym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 10:42:43AM +0530, Harsh Prateek Bora wrote:
> On 11/30/23 02:56, Stefan Hajnoczi wrote:
> > diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> > index 9bd98e8219..ffb2c25145 100644
> > --- a/hw/remote/mpqemu-link.c
> > +++ b/hw/remote/mpqemu-link.c
> > @@ -33,7 +33,7 @@
> >    */
> >   bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
> >   {
> > -    bool iolock =3D qemu_mutex_iothread_locked();
> > +    bool iolock =3D qemu_bql_locked();
>=20
> Should var name (one more below) be updated to reflect this update ?

Yes. I'll grep for that tree-wide because there might be other
instances.

Stefan

--0duhWLao8zUYzEym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVxsCAACgkQnKSrs4Gr
c8i1rQgAnF5hLI7FnDMNxncR8cyzsclzHlBL3lW0nptTddMxVMVSgpepQqo6yITp
7C02PzbGoKbRWSa8b95tpYbHeVbakCnrKjMsojhx5N50uYa7odEtNpXrPedhUh4l
ZcOC1N5E1uU55koqEGYWFSDoEC3BApk9qN0RFngsKFtoTears5RgyhSpuYYrdpyL
LN15OOQjSBJYsGNtYggDfIyN5hT4H55c8hsQF0b+kw/UwWoNRdjsdyMNelsHheII
+KODOArdtF9lNCVXL4kbZmuQbwmmHbAdfytMIurhnKWa+ENSZZ42DY9Z+XBIReto
Fj4JhmDsI3ewnZLjTxZ/jQHHNcV8Ew==
=KX5N
-----END PGP SIGNATURE-----

--0duhWLao8zUYzEym--
