Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp514439ejb;
        Thu, 30 Nov 2023 12:36:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn1aN97gLiKQwp4BRG+VGH82WjU9d9UUOaKznw9MKWxdxNRgopoSaTHo9JNiX3Qm6caWR+
X-Received: by 2002:a0c:ea22:0:b0:67a:8e21:aa63 with SMTP id t2-20020a0cea22000000b0067a8e21aa63mr2172211qvp.18.1701376601407;
        Thu, 30 Nov 2023 12:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701376601; cv=none;
        d=google.com; s=arc-20160816;
        b=k2XTmKEKy9YOfohUCldNhPPmc19RRedT0xaXKiadaq+HMksCI2aDmeDc91J6OU5saI
         A+XXDIWXBmNfJ0voMlMATRfdfb+S3FsQ4pbjG/zP3bVBDp2r7eavMEuDoeDIqPlZxPtJ
         JBRxrsWCg8fumTusrvBVBiDwI95XLHIdBkirJT4vdPBcIsKPq317N2D+xYRtPOnHRVSB
         tpI5wMWKFZcwMYGrLDlHE3ttpyX12kPv5fq7VJesFVYo6utpYISOAUTkTTfvFAxAfet+
         Acebki2+/Df9X47CnelwOzh5JbptG2gFG9liq0UXNQ/5hx0o3NHwM5029ApeKTuXT7sk
         BqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=eYEi0Y5+QQuaOwHuJk++/9L4d3OIIjWT68mwc8kKwmY=;
        fh=8lxqBE7p9mgiLJKD4NyLDJPEyrE1pJEhfPLw80kY4h4=;
        b=rKyH/6Arg8G9OzLF+KzF7qjZcZfO3GcCI1RiStc0RK9HcgVN2cBSsfRA2U8EwHfM4U
         cxz2lAjK4m+sd/g4ysFhnbhL3kawJK+ZM/rdsjzo84BfjMbqvKP0OBO/uRyWPiW/N7iu
         UU5Ob6Cl5vUcp0wn8hFTBUUn+/xv7uHsq3bnMbsz2hdkpICBhuRbaLBLoiEjpzB9qa75
         iofaJc/I6ZMjMvKOFzTahbURylgqY4RMi7b4OFpTjv0vL8+UffLANfFlWgDIpdbDhYig
         vA0rikEbn5axRqOWv1bvCqB7fNX9FUiMDWzS+QuvrYGtjNIQ28KSoQrxa1kVTsgUYXhg
         xGWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cAQnwILG;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h24-20020ae9ec18000000b00773fe581c18si1629228qkg.463.2023.11.30.12.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cAQnwILG;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701376600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYEi0Y5+QQuaOwHuJk++/9L4d3OIIjWT68mwc8kKwmY=;
	b=cAQnwILGmfgO65glKMuQvUYQ8FCcmiK+wEVsxi9EqtVyZE/ChYDI7jh5IVgj7mukEN50NU
	pOBWKE7g1LoOMNY5scQUl5+5T5pFKn5R6vqJPRs3Fa5EZv7eEz+UXCq8t0gU4fiukInHiK
	XbOruYVVANcxEqhq0oIIketIgdbzG4k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-SIexcsI8MJKCO3SfmX55Dg-1; Thu,
 30 Nov 2023 15:36:38 -0500
X-MC-Unique: SIexcsI8MJKCO3SfmX55Dg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3AB4280666F;
	Thu, 30 Nov 2023 20:36:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B9DD2166B26;
	Thu, 30 Nov 2023 20:36:34 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:36:33 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
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
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	qemu-ppc@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 5/6] Replace "iothread lock" with "BQL" in comments
Message-ID: <20231130203633.GC1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-6-stefanha@redhat.com>
 <9c305a84-fd86-42fe-98ae-9297d480acd6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ADMBXqBOX1KM7dkn"
Content-Disposition: inline
In-Reply-To: <9c305a84-fd86-42fe-98ae-9297d480acd6@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-TUID: aCQOkeeHdQLW


--ADMBXqBOX1KM7dkn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 02:47:49PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 29/11/23 22:26, Stefan Hajnoczi wrote:
> > The term "iothread lock" is obsolete. The APIs use Big QEMU Lock (BQL)
> > in their names. Update the code comments to use "BQL" instead of
> > "iothread lock".
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   docs/devel/reset.rst             |  2 +-
> >   hw/display/qxl.h                 |  2 +-
> >   include/exec/cpu-common.h        |  2 +-
> >   include/exec/memory.h            |  4 ++--
> >   include/exec/ramblock.h          |  2 +-
> >   include/migration/register.h     |  8 ++++----
> >   target/arm/internals.h           |  4 ++--
> >   accel/tcg/cputlb.c               |  4 ++--
> >   accel/tcg/tcg-accel-ops-icount.c |  2 +-
> >   hw/remote/mpqemu-link.c          |  2 +-
> >   migration/block-dirty-bitmap.c   | 10 +++++-----
> >   migration/block.c                | 24 ++++++++++++------------
> >   migration/colo.c                 |  2 +-
> >   migration/migration.c            |  2 +-
> >   migration/ram.c                  |  4 ++--
> >   system/physmem.c                 |  6 +++---
> >   target/arm/helper.c              |  2 +-
> >   target/arm/tcg/m_helper.c        |  2 +-
> >   ui/spice-core.c                  |  2 +-
> >   util/rcu.c                       |  2 +-
> >   audio/coreaudio.m                |  4 ++--
> >   ui/cocoa.m                       |  6 +++---
> >   22 files changed, 49 insertions(+), 49 deletions(-)
>=20
>=20
> > diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
> > index 69c6a53902..a2bc0a345d 100644
> > --- a/include/exec/ramblock.h
> > +++ b/include/exec/ramblock.h
> > @@ -34,7 +34,7 @@ struct RAMBlock {
> >       ram_addr_t max_length;
> >       void (*resized)(const char*, uint64_t length, void *host);
> >       uint32_t flags;
> > -    /* Protected by iothread lock.  */
> > +    /* Protected by BQL.  */
>=20
> There is only one single BQL, so preferably:
>=20
> "by the BQL"
>=20
> >       char idstr[256];
> >       /* RCU-enabled, writes protected by the ramlist lock */
> >       QLIST_ENTRY(RAMBlock) next;
>=20
>=20
>=20
>=20
> > -/* Called with iothread lock taken.  */
> > +/* Called with BQL taken.  */
>=20
> "with the BQL" (other uses)

I will try to change these for v2. It's a pre-existing issue though
because there was only ever one "iothread lock" too.

Stefan

--ADMBXqBOX1KM7dkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8lEACgkQnKSrs4Gr
c8inmQf8CHG08Gjf/Xbq1d507Sf6BOzXT42zcBsMdkGeul6WorzG8oHfr1SMVJgi
Fkex2GIeIAH3TjLTtiXePxp/7MXVrArmRxUltKaaZZAcD48aA8VXeOylS3pnZnU+
2cqukgamf6tOSIc43sr1ZX06y154qL7xAMQ8Xl0sUu3ERaJob0bzyfPKf2xgjnas
wVfsXUS7nEcRMJVi94oT9ST1WpJPbA9yDVyVX3LwtX0KECWoYIiN9or7jTlP2TnA
9/GXVa9I8R/eA0P2xLU2RpfNNNY9A9+MZvgHSU75u9C9jN4/CR59W8EjyBTl+/fA
KHaDBsL7B4GbwgONA8VDLiAbIN/g3Q==
=Ause
-----END PGP SIGNATURE-----

--ADMBXqBOX1KM7dkn--
