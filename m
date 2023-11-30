Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp511764ejb;
        Thu, 30 Nov 2023 12:31:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMv+nS5CllrH9ZEYb7IghIHCpT7LpVSeWA3nsX1/aY79LDM8N0IP03OjAW0ACvm5HDtskM
X-Received: by 2002:a05:622a:1b09:b0:423:98ce:48e with SMTP id bb9-20020a05622a1b0900b0042398ce048emr23831191qtb.22.1701376302125;
        Thu, 30 Nov 2023 12:31:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701376302; cv=none;
        d=google.com; s=arc-20160816;
        b=U5wuH6Qc+16MeOlvK5O527+aTfquP0TXO6Klgsq6nTM9CD9ENb1vOJyBST6HrbYRsD
         ZeeEyhscTz1jhnkHL6h9XUhYOajwYRmbKpCOD2I22/GXC29cOUGQhcuMlvMXcvQQy8u3
         gsrip6XDaFbHpMNd/R3tzJW6XeHvgX/5mwAunOnsypBvocAIvyzPlxdAE7MNwZmaXWo0
         GR66q4jSDkkiUIuept8nMV5JMUCTClmpu0d/EOBTuFyeXpOmIpzHZT+d4rt827Wq4Ug4
         aAyJA7x/tV+jXfKk1enmGx8hQuU5XINFuw4mj7wsVqfJ00R5DIOY2im45ApzXGUUTCAM
         p8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=8KFoHugi6jgybVjDl52fW0YxT+ePBaAxcnqZf4SllrU=;
        fh=8lxqBE7p9mgiLJKD4NyLDJPEyrE1pJEhfPLw80kY4h4=;
        b=fzpPevEG4Y362nGZOa4XbLXwjCeJFpoyvZRYEDhK6fumeBuoEot4uzY0HZW6gCAB3A
         TI6aaICYf6D8/wsH1rpj/BBbvwjJQ4lipzqfBIOm7A6Ywxi00htNDqONgXYMn9P13zLf
         Ay9NfLqlTqE6nqgy2FpsJhJDkUZmOQACmqEN1hvgZJvJfHu9CLwjcn1nfMTBdaIfOrG/
         wnL5jRUfZzS/5mhmniWsaM/HkBQOleHesKiwBFJy3luQDaC5WTK0HyyJNuTdTGwU2Sqj
         G0ZYnGRbrKOSfubOr3snda3X7CAAf+yMdaMmyRxI3cjYEnEVsXoF6UoCDM5EDsu46DMP
         FGDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fhdvEOJx;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id fi4-20020a05622a58c400b00423e7b995b5si1804855qtb.585.2023.11.30.12.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:31:42 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fhdvEOJx;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701376301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KFoHugi6jgybVjDl52fW0YxT+ePBaAxcnqZf4SllrU=;
	b=fhdvEOJx3Puzl4tYDkHZC6B+2XgHZP4o1jVjkc47bJKWi37ginuMZ6uk7PxwuWvT/sD+w7
	R//V4jVx/hGbet1jOwN5g+EBMJ2K482iWwA/5X1s1/OFmbEYKjhnVFmkJ9m+2+60Y2eVsD
	jCU+MQtvnoHK0gbMThsLzBTHEyTyTAU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-88dqJ2RNNwmoiXaZzWJvUg-1; Thu, 30 Nov 2023 15:31:37 -0500
X-MC-Unique: 88dqJ2RNNwmoiXaZzWJvUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F70582BA82;
	Thu, 30 Nov 2023 20:31:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 768DF492BE0;
	Thu, 30 Nov 2023 20:31:33 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:31:32 -0500
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
Subject: Re: [PATCH 4/6] system/cpus: rename qemu_global_mutex to qemu_bql
Message-ID: <20231130203132.GB1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-5-stefanha@redhat.com>
 <01ebd72d-affc-4b03-b491-f40964520f1c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sn71hyyf1gpGKJP8"
Content-Disposition: inline
In-Reply-To: <01ebd72d-affc-4b03-b491-f40964520f1c@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-TUID: lAurJEV/oCzk


--sn71hyyf1gpGKJP8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 02:44:07PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 29/11/23 22:26, Stefan Hajnoczi wrote:
> > The APIs using qemu_global_mutex now follow the Big QEMU Lock (BQL)
> > nomenclature. It's a little strange that the actual QemuMutex variable
> > that embodies the BQL is called qemu_global_mutex instead of qemu_bql.
> > Rename it for consistency.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   system/cpus.c | 20 ++++++++++----------
> >   1 file changed, 10 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/system/cpus.c b/system/cpus.c
> > index eb24a4db8e..138720a540 100644
> > --- a/system/cpus.c
> > +++ b/system/cpus.c
> > @@ -65,7 +65,7 @@
> >   #endif /* CONFIG_LINUX */
> > -static QemuMutex qemu_global_mutex;
> > +static QemuMutex qemu_bql;
>=20
> I thought we were using _cond/_sem/_mutex suffixes, but
> this is not enforced:

I'm open to alternative names. Here are some I can think of:
- big_qemu_lock (although grepping for "bql" won't find it)
- qemu_bql_mutex

If there is no strong feeling about this then let's leave it at
qemu_bql. Otherwise, please discuss.

Thanks,
Stefan

--sn71hyyf1gpGKJP8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8SQACgkQnKSrs4Gr
c8j+pAf/bHckak+kCTFY6THF9fWYuY9tKxDh1TAsmCqS02YPBAPs1z0YH+99X3km
es2S24gx5+JuX1lEM4Cq3AGZibmA2Vrs+TcKe6DyN6hT5mtNrfeoTcFLiUGNHFVx
s+czVZPIfsxatmrt9FobrI2Ih51wyLzqPPI9ibJTSbz849aMGdjCfB+///3zKHW5
JsvpwUhaL7gomsRHXZZSyQq9f/yJrxcl7BP/tM4eJhLul0Q/3xsdQsme8PS4ImLz
srpkocFet7WKPXnBwXpDaZ21znv5VvTybFpRqCXpFJlQoWwZR5m+bF/Jo1vdCKBU
R3KRE4Yg7YPFP70oH/H5T7bSCUiOKg==
=zmh7
-----END PGP SIGNATURE-----

--sn71hyyf1gpGKJP8--
