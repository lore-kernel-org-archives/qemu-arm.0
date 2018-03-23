Received: by 10.28.71.155 with SMTP id m27csp504638wmi;
        Fri, 23 Mar 2018 06:52:55 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt1XWK54EtR+wLHNmDnGdkjPQW4nSsiDIwi+nkJELuj1LkBAitq65Z17FkPDwyLx86gZYWO
X-Received: by 10.237.42.67 with SMTP id k3mr41393704qtf.24.1521813175087;
        Fri, 23 Mar 2018 06:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521813175; cv=none;
        d=google.com; s=arc-20160816;
        b=L2HCBNQ4llzW7hHhAp5YG1hTgIjeVX4mbO7EuoFCMkYlOzc2WMF3+zxt0EZGS/39mi
         QR8udTza+Cjv0Y9qdiZ6TiYMZkBKkSrVtyzhOule0QbVruShTnexE1Y4APEJHwnFFcLT
         TlHbSVImHqITZ04zRy+uthVwRAMY/cDi03vuP7bwkx3vdn+GPMblXoohq7//sbs9DNAq
         ihuP5C6hVShegT1M3G8IePvYwN/VHvMJDosnawbwW7YXDsM1eIFZmRxTZgPdThTqppK1
         RBmNeSkNiu4mC4ury5M8cuo/cgp4jk0vFWKtaldjl800bpYHcjHCQOM4qQiEZIv0bpbf
         nGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=Y7fIogRVqk5cgKyhozdCL8ojxDConpaKsSZeJE9qIXY=;
        b=bRbB3OodnefoLyH8Zx8UDEHAT7Xjocla7tojUt6QZyiTNfI2L4mdriRrqUPi7GNNLJ
         7rVPY0kJBkGkf3OzlmU4R0ouF8Z8qY8cKUUjk/3H4X5+s2/1BN2IJyInwoNiJy0qZmX7
         AjQHRAvwndB9iF/YcDQaKIS9wkRVDXsAwk0BxB61kRzAdMp0kXHvSvYN+PNxyF8/vnXg
         7UIeWurW25BzzZ7WJQ4qCf8z5hEZARp2z0bEW0HipHo++OHMCfHHWrgOgILPI4XHYIeg
         5cARaudqekcAckD9uja7gMtm6uOvINqF3hy6jeQuA3KAjxRM+cqf6HBGkFtKvHbGpojB
         T1vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q27si3379798qtj.148.2018.03.23.06.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 06:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezN7m-0000yz-Ko
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 09:52:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ezN7a-0000yG-5r
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 09:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ezN7X-0004QJ-2j
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 09:52:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51368 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ezN7W-0004Pv-SN; Fri, 23 Mar 2018 09:52:39 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15641401DEAB;
	Fri, 23 Mar 2018 13:52:27 +0000 (UTC)
Received: from redhat.com (ovpn-124-251.rdu2.redhat.com [10.10.124.251])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1B8A2166BAE;
	Fri, 23 Mar 2018 13:52:13 +0000 (UTC)
Date: Fri, 23 Mar 2018 16:52:13 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180323162223-mutt-send-email-mst@kernel.org>
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
	<20180323102227.GF16270@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180323102227.GF16270@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 23 Mar 2018 13:52:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 23 Mar 2018 13:52:27 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 1/2] make: move generated headers to
 qemu-build/
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
X-TUID: eKHps8GpvMBC

On Fri, Mar 23, 2018 at 10:22:27AM +0000, Daniel P. Berrang=E9 wrote:
> On Thu, Mar 22, 2018 at 09:27:55PM +0200, Michael S. Tsirkin wrote:
> > Make sure all generated files go into qemu-build subdirectory.
> > We can then include them like this:
> >  #include "qemu-build/trace.h"
> >=20
> > This serves two purposes:
> > - make it easy to detect which files are in the source
> >   directory (a bit more work for writers, easier for readers)
> > - reduce chances of conflicts with possible stale files in source
> >   directory (which could be left over from e.g. old patches, etc)
>=20
> If people care about this, then they can just be doing a build
> with  srcdir !=3D builddir config.

Helps with the second point but I do not see how this will help address
the first point.

I see include "x.h" in source, it's natural to ask where it is.

I look for it in the c file directory. Not there.

I look for it in the include, it's not there. Where then?

qemu source root on the include path. Not there.

Oh tcg directory is in the include path for some reason. Not there.

Some other tree coming from a submodule maybe?

Oh *maybe* it will be generated by some script, I need to run
build to find out.

For the record, more remains to be done.
Here's a list from and oot build of virtio, with some comments:

cc -iquote /home/mst/qemu-oot/hw/virtio


 -iquote hw/virtio=20

<- same directory repeated twice.

<- also this is here just for trace.h . Better to just change code to poi=
nt at the right trace header -
   will look into it.

-iquote /home/mst/qemu/tcg

<- why does everyone want tcg? better to just include with tcg/

 -iquote /home/mst/qemu/tcg/i386

<- and i386 specifically?

 -I/home/mst/qemu/linux-headers

<- ok this is so we can override with our own version of headers

 -I/home/mst/qemu-oot/linux-headers

<- why do we have these at all?
   oh it's because we have asm-<arch> tricks like linux used to use years=
 ago,
   then we copy the correct asm headers:
     ls linux-headers/asm/
     bitsperlong.h  hyperv.h  kvm.h  kvm_para.h  unistd_32.h  unistd_64.h=
  unistd.h  unistd_x32.h

   a better strategy would be to have headers in arch/<arch>/asm like Lin=
ux does now,
   no code generation tricks.

 -iquote .

<- build directory. No headers there at all.

 -iquote /home/mst/qemu=20

<- turns out we still have headers in source root. Why not move them to i=
nclude/ ?

-iquote /home/mst/qemu/accel/tcg=20

<- more tcg goodness for everyone?

-iquote /home/mst/qemu/include=20

<- ok that's expected. Why isn't this first on the list though?

-I/usr/include/pixman-1

<- should be limited to ui files I guess?

  -I/usr/include/glib-2.0=20

<- ok we need that

-I/usr/lib64/glib-2.0/include=20

<- but that one does not exist

  -I/usr/include/p11-kit-1     -I/usr/include/libpng16  -I/usr/include/li=
bdrm

<- more GUI things?

  -I/home/mst/qemu/capstone/include

<- ok a bunch of disasm things.
	ls capstone/include/
	arm64.h  arm.h  capstone.h  mips.h  platform.h  ppc.h  sparc.h  systemz.=
h  x86.h  xcore.h
   can we add this just to disas.c?

  -I../linux-headers

<- all together now: same as qemu-oot but with a relative path now.

 -iquote ..

<- build directory - no headers there

 -iquote /home/mst/qemu/target/arm

<- this is a good idea why?

 -iquote /home/mst/qemu/include

<- deja vu

Wow that was fun.

>  If people are using srcdir =3D=3D builddir
> then they likely *want* all the generated files in their srcdir.
>=20
> IMHO it would be valid for us to consider if we could just mandate
> srcdir !=3D builddir, but if people object to such a proposal, then I
> don't think we should arbitrarily move all generated source files
> in this way, as that's effectively the same thing forced onto devs.
>=20
> Regards,
> Daniel

People don't really care.





> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
