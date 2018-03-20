Received: by 10.28.91.67 with SMTP id p64csp3842738wmb;
        Tue, 20 Mar 2018 06:35:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtn1Zy9lpxHss9WRgSKVp7vxHmpkOR4/ou4fqsguKaLStE1vAvyFbGt031QcDl1YXg+0qbx
X-Received: by 10.13.231.68 with SMTP id q65mr9528736ywe.514.1521552959724;
        Tue, 20 Mar 2018 06:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552959; cv=none;
        d=google.com; s=arc-20160816;
        b=Sd8sfN1W1l7QloyX6v0rVU/8DUgSUDqoXuQAKGYO5mjq/4fqRbu5CGLNMfirePxfhm
         RfMsrvmxUHFkqQONIZRh95qWoysvfbjeLHWCowI1Wk5BF88NN1eGZvcyOwdGNRg7lPGV
         8B/4PiNvpTvuizD2EZmdtAMF99BShmRiEGmJarX/iCk3Bq6/LikUXQaldcBP8BERWWfk
         8Z61l57D5xnDqgprB9JMHFptWiQcmcUostcAzHmRwxan87Knk7twK5qqXkLWX3PqMTgI
         brfk2rUGarIDCaWUd87CW19/5tBSBeEA93PHqrnoYQYyJdwpTKKP285oHJ+O0CKh5w2O
         MxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=vyovXP06rWINaTxVTQekMgEhlDqrHJL6vuSXMllbPMg=;
        b=bRosLEYM16dLgdL6MpYEMts1SyRdt32mpmdlQ6ZGOzyzFVrXBNOYM1yu1m3y8wxfkf
         WlGM4ql8wMrxuSm+u3+WxhMy35MaFK7L9QevsAfOW071K1TIri9GKgEC04DAp/nx27ug
         Rkt0pz1Ih5eZTUEiYMPTsGb7ITZ74xK2JRZJYdf+kwGm+k/WTlXW9BpTPX5Iiox0pYsD
         o8EZBPV4h4duU3nhK+uOCPWyKjmqnyAGnRjRopW0eNWtKOjQwYx0n0xl5ys7VGLIILXj
         WHIIpPutIzr9L29A50ah+tZGzsa3CB3GgSQ0g1sDqDhdvFF1XcUaXFGrB/Te7VikUSeN
         5ruA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si2791692qkb.418.2018.03.20.06.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHQl-00074N-5l
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:35:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyG8B-0008W2-Mw
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyG86-0008Nx-BR
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:12:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51922 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyG86-0008Nr-5P; Tue, 20 Mar 2018 08:12:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78553A27ED;
	Tue, 20 Mar 2018 12:12:32 +0000 (UTC)
Received: from redhat.com (ovpn-121-0.rdu2.redhat.com [10.10.121.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F368B202322F;
	Tue, 20 Mar 2018 12:12:24 +0000 (UTC)
Date: Tue, 20 Mar 2018 14:12:24 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180320141107-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180320094406.GD4530@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 20 Mar 2018 12:12:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 20 Mar 2018 12:12:32 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
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
	qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
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
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
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
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, BALATON Zoltan <balaton@eik.bme.hu>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ntp9Hzl3+3r8

On Tue, Mar 20, 2018 at 09:44:06AM +0000, Daniel P. Berrang=E9 wrote:
> On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
> > Le 20/03/2018 =E0 02:54, Michael S. Tsirkin a =E9crit=A0:
> > > QEMU coding style at the moment asks for all non-system
> > > include files to be used with #include "foo.h".
> > > However this rule actually does not make sense and
> > > creates issues for when the included file is generated.
> >=20
> > If you change that, we can have issue when a system include has the s=
ame
> > name as our local include. With "<FILE>", system header are taken fir=
st.
>=20
> > > In C, include "file" means look in current directory,
> > > then on include search path. Current directory here
> > > means the source file directory.
> > > By comparison include <file> means look on include search path.
> >=20
> > Not exactly, there is the notion of "system header" too.
> >=20
> > https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html
> >=20
> > #include <file>
> > This variant is used for system header files. It searches for a file
> > named file in a standard list of system directories. You can prepend
> > directories to this list with the -I option (see Invocation).
> >=20
> > #include "file"
> > This variant is used for header files of your own program. It searche=
s
> > for a file named file first in the directory containing the current
> > file, then in the quote directories and then the same directories use=
d
> > for <file>. You can prepend directories to the list of quote director=
ies
> > with the -iquote option.
> >=20
> > > As generated files are not in the search directory (unless the buil=
d
> > > directory happens to match the source directory), it does not make =
sense
> > > to include them with "" - doing so is merely more work for preproce=
ssor
> > > and a source or errors if a stale file happens to exist in the sour=
ce
> > > directory.
> >=20
> > I agree there is a problem with stale files. But linux, for instance,
> > asks for a "make mrproper" to avoid this.
>=20
> We can follow what autoconf does, and add a check to configure to see i=
f
> there are generated files left in the source dir, when configuring with
> builddir !=3D srcdir, and exit with error, telling user to clean their
> src dir first.
>=20
> > > This changes include directives for all generated files, across the
> > > tree. The idea is to avoid sending a huge amount of email.  But whe=
n
> > > merging, the changes will be split with one commit per file, e.g. f=
or
> > > ease of bisect in case of build failures, and to ease merging.
> > >=20
> > > Note that should some generated files be missed by this tree-wide
> > > refactoring, it isn't a big deal - this merely maintains the status=
 quo,
> > > and this can be addressed by a separate patch on top.
> > >=20
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >=20
> > I think your idea conflicts with what Markus has started to do:
>=20
> Yes, I don't think we should revert what Markus started.   Both ways of
> referencing QEMU headers have downsides, but I think "..." has fewer
> downsides that "<....">.

Could you please explain what the advantage of "" is?
It seems to be gone since we moved headers away from
source.

> The problem Michael is tackling should be pretty rare, because moist
> developers aren't frequently switching between srcdir=3D=3Dbuilddir and
> srcdir!=3Dbiulddir setups - they have their preference for which to use
> and stick with it. As long as we get ./configure to warn about the
> dirty srcdir it should be good enough
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
