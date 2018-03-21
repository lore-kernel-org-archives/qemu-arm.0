Received: by 10.28.91.67 with SMTP id p64csp5215692wmb;
        Wed, 21 Mar 2018 08:43:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuw3vhQ9nUOJKUem+wXyg2SesTqiiZpUn21oUE1oMBIFJ/Aegj7QMxxIV9aUIAaQC+My1ry
X-Received: by 10.200.22.50 with SMTP id p47mr29995014qtj.135.1521647039664;
        Wed, 21 Mar 2018 08:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521647039; cv=none;
        d=google.com; s=arc-20160816;
        b=GIG+DfBTkjCn5DaR6P81tpHQfgidRsLZWMa5X2Vnl50EkRD00DEp0Ouyz71ay/qmkZ
         Wo0WuKpBm3Ob9WqL7LtTQqXXnhNAn7D9b55sZFlSilNFdzABjnjGsOrR6IkUcAaHxqVk
         oRph47tTg2QXuAwsQJGn+bkDJqdU9CeLXkVcOigH69D5bSh7aG7N11yvh4icY8baTpXy
         Tmv1x3ryVgduZTaLFV7+t8Xk7tfrqLDEhoO1QNLYZKempzKsea1iNiPzCBfbYX5HYvoA
         JDI+ilRCEaccNHMTxeaVksQYUNoI2p0aLerl/yU1WkQSqv3bZXac2frsK+obN9LndjB4
         /DTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=WtfkeFxkOMnJVTYkN+FgRmV9F2ABPNsLusvfHiMszfY=;
        b=GP/QYoF+mgZJvNHSjiRzR3cOcbJBlAcBNUfBw6QOu/QJm8ArEdwmlnBfd5geKXruJo
         dmkXo2udPDstZz3yzIf0zp8hf/fN16lUj+NR+MonPrc0kS4oeKAHWG/8ipQ8nfzh+DMc
         NJRwFIf4bnpLYV6+K1m3c7tl2swukdP/bx4NUbNE5GA44WtYHMOovNeEg2lSHTUb91uU
         eapf9YMmZhLxFmHY6BhV/4+sU787j+QcQRu4bz1v/NNwpUj7yxD8imXoKU6uv3RANAiE
         +V04w4xbjr/0c4J3sQvtuEuZM6TTmJPpnNHoM4oU/pe/ZKUKLyRc3x83T+2vIzeKTm/v
         aZAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d28si586632qkh.274.2018.03.21.08.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyfuB-0002rC-6a
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:43:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyfqe-0007WB-01
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:40:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyfqc-00049e-Ew
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:40:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54174 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyfqc-00049B-5P; Wed, 21 Mar 2018 11:40:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACE0EA27ED;
	Wed, 21 Mar 2018 15:40:16 +0000 (UTC)
Received: from redhat.com (ovpn-124-179.rdu2.redhat.com [10.10.124.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1325394562;
	Wed, 21 Mar 2018 15:39:49 +0000 (UTC)
Date: Wed, 21 Mar 2018 17:39:48 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180321173309-mutt-send-email-mst@kernel.org>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
	<20180321151922.GR8551@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180321151922.GR8551@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 15:40:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 15:40:17 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2] qemu: replace "" with <> in headers
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
	Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SIEPPCiPPeoj

On Wed, Mar 21, 2018 at 03:19:22PM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Mar 21, 2018 at 04:46:32PM +0200, Michael S. Tsirkin wrote:
> > Our current scheme is to use
> >  #include ""
> > for internal headers, and
> >  #include <>
> > for external ones.
> >=20
> > Unfortunately this is not based on compiler support: from C point of
> > view, the "" form merely looks up headers in the current directory
> > and then falls back on <> directories.
> >=20
> > Thus, for example, a system header trace.h - should it be present - w=
ill
> > conflict with our local trace.h
>=20
> If our local "trace.h" is in the current directory, then using ""
> is right and you can still use <trace.h> to get the system version.
>=20
> If our local trace.h is in include/ top level, then it is going to
> block use of the system trace.h regardless of whether we use <> or ""
>=20
> Fortunately our include/ tree uses sub-dirs, so we would typically
> use  #include "$subdir/trace.h" and  #include <trace.h> would still
> find the system header.
> We just have to be careful we don't add stuff at the top level of
> our include/ dir with names that are liable to clash. This might
> suggest renaming  include/elf.h to include/qemu/elf.h, or just
> moving elf.h to the qemu/ subdirectory. Likewise include/glib-compat.h
> might be better moved to qemu/ subdirectory.
>=20

This is exactly what this patch proposes, with a uniform scheme:
start everything with qemu/.

>=20
> > As another example of problems, a header by the same name in the sour=
ce
> > directory will always be picked up first - before any headers in
> > the include directory.
>=20
> There's only a couple of headers in the top level of our include/
> directory - everything else is pulled in with a named path
> eg #include "block/block_int.h", so that would not conflict with
> reference to a bare #include "block_int.h" from the current directory.

We can not know that there are no system headers that start with block/ o=
n
any current or future systems.

> > Let's change the scheme: make sure all headers that are not
> > in the source directory are included through a path
> > starting with qemu/ , thus:
> >=20
> >  #include <>
> >=20
> > headers in the same directory as source are included with
> >=20
> >  #include ""
> >=20
> > as per standard.
>=20
> As stated before, I consider this a step backwards - it is a
> good clear standard to use "" for project local includes and
> <> for 3rd party / system includes IMHO. The change doesn't
> do anything beneficial for the two scenarios described above
> AFAICT.

I think you are mistaken on the last point:
1. Everything will be under qemu/ so we never clash with a system file
2. A local stale file anywhere in source directory is completely ignored
   since source is not on -I path.

I hope this clarifies things.

>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
