Received: by 10.28.91.67 with SMTP id p64csp3842448wmb;
        Tue, 20 Mar 2018 06:35:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv/Jp34URtdjDVu4l6zuWwJYTgBTI/3EpWpBu+eV+/UCHoh5ACO5bj4T6TKlgKvxOaglAJC
X-Received: by 10.55.75.87 with SMTP id y84mr2428853qka.34.1521552944629;
        Tue, 20 Mar 2018 06:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552944; cv=none;
        d=google.com; s=arc-20160816;
        b=zCeVZ46QiDl1qynbQczTGg9+poIArfW7lIkC3s3JQAYKC8kcXl6NSW3SuVPX8EL8/k
         q2NF0f1cU0rT3DaZzcMpEtsZvOJFtmGMrDt9f4GgjE0CjATeQE1hbkVAaAguaQJb0V60
         P8hUEUkz61/0gB+wKpvcwwqXewRI3n8aXXLOgSgvBTE/K8NuEDANjXDxcLtiqFW3cmA4
         rV5OSxZO3r2JhZ6sE9l7IzA6WK5lHo7zXfgCZXpW0X0Sl2zEbz21vZxbFQvrc0giN/Ho
         9wLTnfImfFV1hkSgfyc+D+BdaZBPsty9hwzsBYWtOYjJt05/fU2Z4dO+b0nZxmFNri69
         4g+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ce5CLTCTccxRtc+LYPWa4O1/A2gqSyk9qHZob2eK+gI=;
        b=Yn6xSYzuwM/NbzZw5vdqF0CO1hIbmhcThihNO+xZwCMUizTzKetscFiRTneWSLn4g/
         UmERCh+DS1Ap+a6NVljgTMasYi/ClrHdUopMzkoGk4KXNR98gOVkNnC4hkgOabrxfaVX
         VervunCDb9yGSAM5xQBS771TR7nfHrqepjnK6/nA4Hzv2TO9cykuElaHYTKwm4pDlFkj
         DZGtklDnQSODoEhBLtjukJv2Lwzim0Cu0lE2WrqhYcWkrlcaT9xx8IhP7PXYAOqPH99y
         CdORldy9cWakhaS97j91ggE7gunjJop15op5h5485DLu+thmSXFh5Lm720f7YDSTyQtd
         XbVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19si333141qtn.455.2018.03.20.06.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHQW-0006r8-3t
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:35:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyFpM-00029A-Vq
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:53:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyFpJ-0002ew-U3
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 07:53:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41610 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyFpJ-0002eI-O8; Tue, 20 Mar 2018 07:53:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4A8EEBFEF;
	Tue, 20 Mar 2018 11:53:07 +0000 (UTC)
Received: from redhat.com (ovpn-121-0.rdu2.redhat.com [10.10.121.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 650E0215CDB7;
	Tue, 20 Mar 2018 11:52:47 +0000 (UTC)
Date: Tue, 20 Mar 2018 13:52:47 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180320135057-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<CAFEAcA-eoyPokMLqUBcHvEgp=GQnODv3r3A_9LRkc=8do6ea1A@mail.gmail.com>
	<20180320102719.GF4530@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180320102719.GF4530@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 11:53:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 11:53:08 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:28:26 -0400
Subject: Re: [Qemu-arm] [PATCH] qemu: include generated files with <> and
 not ""
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	kvm-devel <kvm@vger.kernel.org>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Qemu-block <qemu-block@nongnu.org>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y31aC9w5A9tA

On Tue, Mar 20, 2018 at 10:27:19AM +0000, Daniel P. Berrang=E9 wrote:
> On Tue, Mar 20, 2018 at 10:01:24AM +0000, Peter Maydell wrote:
> > On 20 March 2018 at 09:44, Daniel P. Berrang=E9 <berrange@redhat.com>=
 wrote:
> > > We can follow what autoconf does, and add a check to configure to s=
ee if
> > > there are generated files left in the source dir, when configuring =
with
> > > builddir !=3D srcdir, and exit with error, telling user to clean th=
eir
> > > src dir first.
> >=20
> > We already do this in our makefile...it just doesn't check every
> > single generated file.
>=20
> Ah yes, indeed:
>=20
> $ make
> Makefile:59: *** This is an out of tree build but your source tree
> (/home/berrange/src/virt/qemu) seems to have been used for an in-tree
> build. You can fix this by running "make distclean && rm -rf *-linux-us=
er
>  *-softmmu" in your source tree.  Stop.
>=20
>=20
> It is checking for existance of config-host.mak.
>=20
> We have a convenient list of generated files in $(GENERATED_FILES), so
> I wonder if there's a practical way to check all of those too.
>=20
> Regards,
> Daniel

With my patch presence of these files mostly stops being an issue.

> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
