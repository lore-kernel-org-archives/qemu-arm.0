Received: by 10.28.91.67 with SMTP id p64csp3843587wmb;
        Tue, 20 Mar 2018 06:36:42 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvyMrzGKfq8AArww2jQtqGwbziUlo2JvIjPIO/7oRQJsPa2pwm3CdY8QRhXm2Zbap2BP+5I
X-Received: by 10.55.101.131 with SMTP id z125mr20242852qkb.178.1521553002414;
        Tue, 20 Mar 2018 06:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521553002; cv=none;
        d=google.com; s=arc-20160816;
        b=hBeu/nIa5si46FOwEGhYvYzKUFbCkqsH0H4Gy9tlm6llEhsYw2SUzgjUjoG+QbESTJ
         xgbT1ftqOF48yVlBZ93gE7zkpSBNglcNRtT6TYitCQGKFsJm488u3qhkgApQBbC+AScW
         J6AvhmsXmwyafl0TMBVv5+Iem/vcFvDF1hCx63guEuP7ctUpH2IK1RgYL2lg7ujFoCb9
         r8GWcrE/pIk3JMcDCMqKg0mPUe82uGRgQt4BrQi+tRR2ag0N5I8p9ZDURsBU+EBbZKdt
         IMzEFd9Ybqo1sGy0MfpfpZk3VeuzLzABjs2kdIE37vV2s6VRCfFQtrimnieKphEsxufO
         IraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=SvplqvzFq5eKRYKerecFhqbUYv2VWrBg+oGfKYZ4DGM=;
        b=xfHicDkFDIgfxGGYwfOuHOg0Jg1wnQsDKM0zGCDBfwg0dr7b1eyzJJEu0rUfLoNhT/
         Jfdg0GKdrCL7gOR+ZbOVj2ENIhgIaO3/R6DP415UoNgZZdqDVYfwt4iDfc99UCEXsMNO
         2jCZIB9YtMDAx2EOJ44vTWeexGj+gjgQtxGkwBUveLLw6sqhEY/6RXD1Vdjitoo/VX3x
         GEsF7j7vR2tAyWDYzo7pR0nhApu6cr/+vJh+2PuitHAYiJDwtl2IeHcAnDB+RpE6MSMB
         Vc4qCAz9GctGsW4Sn6O/othAqA6cswk7Y4E2wIIWMz0w+9Xdf4g0o3ukplB37evDcZOo
         biIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Yi2YbxV9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 46si1934106qtx.59.2018.03.20.06.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:36:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Yi2YbxV9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHRR-0007eC-Pc
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:36:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1eyH2W-00013k-Py
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1eyH2Q-0005mc-Ov
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:10:56 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:38442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1eyH2L-0005jh-TZ; Tue, 20 Mar 2018 09:10:46 -0400
Received: by mail-wm0-x243.google.com with SMTP id l16so3399237wmh.3;
	Tue, 20 Mar 2018 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SvplqvzFq5eKRYKerecFhqbUYv2VWrBg+oGfKYZ4DGM=;
	b=Yi2YbxV90poBLFx61uHd2rE3YPX0DAj52zPQ8WcaaGXpx/n4ynraOF3d9CDJ+u1sdQ
	FXQbls6u1kqnK0+ldpZ8VpbA1p5dIE/l9tpbuFWnLfmO6T672NtMD1PJb6JaohQLgqXJ
	qg2H/M/i4bwlaB53y+rWyG66l87wduwPmU7dlm7KFEvmM9oL9lU3iQ5an4K5w0hMl6Mb
	c4dBEuQk/H2+0HnnPdAsSuMTSRSb3npgLjDnxL4McxaveL9kRIXjFWfBuoyjbCNGDX1P
	O0Q0IwWFcuJTArSCSmvTznUlFLu21cA7vQPR7/v/35wYZ6qwdJBz4jixtq51qToJ//+U
	rbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SvplqvzFq5eKRYKerecFhqbUYv2VWrBg+oGfKYZ4DGM=;
	b=Q7BVLCwfkNBENM26nr+nWe2yA9KlavuaD48FtSjntQxWu189rZ3HxmtA1qDyFejtGt
	R3+X8Pnl6zIRaoWOBwagsJKBsgxlixgEjg2EfjvaZ3qy3HiX3phXtrzhcO1xTHTvDcvQ
	1veo0BbXG3q+GYEGUZDdeBOi2SgfbGu0yAi4iMHlJHOptIlG4yn6WntSoRUc8FRNtJzt
	GtI3vzRk41eps6HU5IbRZKFk0/0MfClxPAVHfmj6ixcRHq8a7WSFa4PtbvYqYQEdoCXt
	zXf+ap0tM02QlGyP90xFrFfwNGlAWKCfGZDnnCslQKNuodGR7FYlF1BMGMR57OnqMg7V
	KgvQ==
X-Gm-Message-State: AElRT7EV8gP+E/ix2S5r4XsYgmmjJyzuUClnNwCbrL7iUR2X17V1N6i3
	E5MdntnqS93WKgQw3Jvz2gQ=
X-Received: by 10.28.12.14 with SMTP id 14mr2100777wmm.107.1521551444648;
	Tue, 20 Mar 2018 06:10:44 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id h1sm1203142wre.16.2018.03.20.06.10.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Mar 2018 06:10:43 -0700 (PDT)
Date: Tue, 20 Mar 2018 13:10:41 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180320131041.GB24329@stefanha-x1.localdomain>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <1521510562-529051-1-git-send-email-mst@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:28:26 -0400
Subject: Re: [Qemu-arm] [Qemu-block] [PATCH] qemu: include generated files
 with <> and not ""
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
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	Fam Zheng <famz@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KJh/s5WnPCNm


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 03:54:36AM +0200, Michael S. Tsirkin wrote:
> QEMU coding style at the moment asks for all non-system
> include files to be used with #include "foo.h".
> However this rule actually does not make sense and
> creates issues for when the included file is generated.
>=20
> In C, include "file" means look in current directory,
> then on include search path. Current directory here
> means the source file directory.
> By comparison include <file> means look on include search path.
>=20
> As generated files are not in the search directory (unless the build
> directory happens to match the source directory), it does not make sense
> to include them with "" - doing so is merely more work for preprocessor
> and a source or errors if a stale file happens to exist in the source
> directory.
>=20
> This changes include directives for all generated files, across the
> tree. The idea is to avoid sending a huge amount of email.  But when
> merging, the changes will be split with one commit per file, e.g. for
> ease of bisect in case of build failures, and to ease merging.
>=20
> Note that should some generated files be missed by this tree-wide
> refactoring, it isn't a big deal - this merely maintains the status quo,
> and this can be addressed by a separate patch on top.

Stale header files are a pain.  I often do make distclean before
checking out a radically different QEMU version to avoid the problem.

This patch trades off the stale header file issue for a new approach to
using <> vs "", which will be hard to use consistently in the future
since it is unconventional.

Is the build time improvement worth it (please post numbers)?

Stefan

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJasQhRAAoJEJykq7OBq3PIhegIAIuKiJzv3MhB1QK0Lnz/P592
Sj2qAfnfuQx/KTgnY8u9eookcjP0oLcPzlDMOMnuBcDmy676pEBiyfnUIdcQ0LZM
2i2bROjPgfwqqfLWFI4zYc7w76i43e3rU4bzIBh7f767IxlRTlb3auxTknxEL1IO
pi1ZYsNHvOHaXvfNTbTVfetHTOuP/KgwN2VFnHgzhqmPxNlesJOArsG341SG95X6
4wkmXPEe1z47dpCWHF3HMvX8Lkn/Sb4C0LVK6cgBHHtRVS/5hhk150tQAiUTaRKM
JgoD11JKE3C3+BK5n1z15dsx5UR2lKyEIEKKtgNp476Vw6UQprcvAITTJgD2CFw=
=8mFJ
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
