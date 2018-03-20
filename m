Received: by 10.28.91.67 with SMTP id p64csp3841300wmb;
        Tue, 20 Mar 2018 06:34:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvEoaqQxQPSbWWaeIWHFdlY2Eb+rAcTA4KjKXJSP6+P+WyKRSTTDTRhkaZNgD37VYY4N5i0
X-Received: by 10.55.149.135 with SMTP id x129mr24216151qkd.279.1521552884074;
        Tue, 20 Mar 2018 06:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552884; cv=none;
        d=google.com; s=arc-20160816;
        b=zA0q34D6iju9Bb6dmlLfcbCT+kQeejKWJiYPuFlJ/Zd6u4yx1WyXV2+AJK/c7xhIAw
         w2ogLKE4yXIPBO333G6wQMFWFcO93uAAOGfmDy2JRpdZss8Kf/ZWHM3KqdrGpk7GrXTw
         dF5BzGov9FUzceHcilGfY89tBzFBqSnU8mIfCjDJ0ZPgmBZdMcDJrHEISUCHan/QyCHL
         yXmIJ8UQPJz1YZGPwl3W/Tlw5G5mzlyN8kxE+P8bhotMx9AFho25hkJT4fi4HkedLuhV
         MS1w37Hsd+WsqOI5LEX/JWBR9ZTucFU3m7x4HZAe0jsafvROm94ouLvK64nPC+iJvlrO
         wRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=JgRQKn/EwS2+i9jP/nWLHzUWNiE8sg/I+OLyUI5LEf4=;
        b=cJTttSrycqBrChgtaPnHR13+Vic7Q7VTrEQML0f87VOTo7i08p+9kiU2ld4z543nV0
         etPWs9ApXzEEjU5d2JPTdHVH1kdxRwxS6l51rNlEZdLY5dwyc0T10ExrL31KQAIN8HQZ
         ZWLwM1Auupxnp8NWz9V555XL2178Cqwk/aIDzlSLWQAWYnoW0HrXpjZXdm8IurMkOhDY
         RPzTh3O/OiNXZD3oYx6MW5SgBlOEC6Xx5NRXHU25Ka+wWAUROestLe/9jfudLIlKOe0F
         ovnraFB8B0CXoN/eDSbMlGELnaPyhou+QAmHb+FwWbBmLiHRxTHzENSclCmzuV3aLrEr
         b/Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v188si2776713qkc.226.2018.03.20.06.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHPX-0005YO-Hj
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:34:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyEUg-0004uH-UY
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 06:27:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyEUf-0005ty-Of
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 06:27:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34642 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyEUX-0005jO-Kn; Tue, 20 Mar 2018 06:27:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A34CF40267D5;
	Tue, 20 Mar 2018 10:27:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 579772026609;
	Tue, 20 Mar 2018 10:27:21 +0000 (UTC)
Date: Tue, 20 Mar 2018 10:27:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180320102719.GF4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<CAFEAcA-eoyPokMLqUBcHvEgp=GQnODv3r3A_9LRkc=8do6ea1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-eoyPokMLqUBcHvEgp=GQnODv3r3A_9LRkc=8do6ea1A@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 10:27:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 10:27:37 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:27:42 -0400
Subject: Re: [Qemu-devel] [PATCH] qemu: include generated files with <> and
 not ""
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	kvm-devel <kvm@vger.kernel.org>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Qemu-block <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XKOausZvQcTs

On Tue, Mar 20, 2018 at 10:01:24AM +0000, Peter Maydell wrote:
> On 20 March 2018 at 09:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> > We can follow what autoconf does, and add a check to configure to see=
 if
> > there are generated files left in the source dir, when configuring wi=
th
> > builddir !=3D srcdir, and exit with error, telling user to clean thei=
r
> > src dir first.
>=20
> We already do this in our makefile...it just doesn't check every
> single generated file.

Ah yes, indeed:

$ make
Makefile:59: *** This is an out of tree build but your source tree
(/home/berrange/src/virt/qemu) seems to have been used for an in-tree
build. You can fix this by running "make distclean && rm -rf *-linux-user
 *-softmmu" in your source tree.  Stop.


It is checking for existance of config-host.mak.

We have a convenient list of generated files in $(GENERATED_FILES), so
I wonder if there's a practical way to check all of those too.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
