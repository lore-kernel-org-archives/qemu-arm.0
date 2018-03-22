Received: by 10.28.71.155 with SMTP id m27csp742308wmi;
        Thu, 22 Mar 2018 12:29:38 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuzmAWcBpBBt/M9j2dvepqvzRYSTO1ByNITsXyyPTGqWANRxZTasppr8WEn6+aM2opKlQBT
X-Received: by 2002:a25:8045:: with SMTP id a5-v6mr9260106ybn.496.1521746978110;
        Thu, 22 Mar 2018 12:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521746978; cv=none;
        d=google.com; s=arc-20160816;
        b=iNxa3SvwOTGZVOcEqfaSVUUfJgW4KPonRjXOArYw/VVfOhQOCZhdSlbHwHQPwpObQZ
         RHb5seNZVjefUpLGCNJv6SCu29Hk1uXLTDetX0maKnc4/f9dUtm7mPGHS8Kk06X0Aw9i
         pN+fkVb1a+zjBr5G3HOE2o2lDJM2TabLJsRyY42CzVEYKa0/ZzQowVb60QpWpSX8byqj
         +OQQeKaV1WQuXw5SRLrwfNBMsuOL1HbcVMMVTGv6QDXQAJftyBfuVCt7jrLlhgYumJ1I
         ORZxtl5pgI53N6bpewgzD7JleyyzZm60WqEejg6FE9g8RuEkD2LRLaQX031zN43oEG81
         iDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=FR5CT42/Jq4drksKdeAKhbvho4zJnY2wS6KgxNKYfXw=;
        b=SJGU3qQmh3fJ+JFaU+2cl6UG0CWDzn0MWa+AlNWbK/2IFYi7hJqrgbs6C4RZ29vi91
         vtTeY6bgGPn43l25iYqeePgl00L6VBuWvWPapRUwuBjzDo7m96kfX0EGb4DeOaxkDfWz
         FdII/1IP8IMo+mE9KxHEpS8bqvIoNMSTjOFOeXtpaGECh8MWnYHbgaASJ26zV5srwrk6
         K3ufZSfNci6yT3oRck+/GzeB1UxcQg1JuxWjE19g6WuoV1SFxoWd9HtD+NxHuFLjehXQ
         h8BgFTC0WAolqn16mIJeAF88/af0J0Zz1Ku/VTLrOCApz/uhZq2R1O8kzqgpse4odemX
         1xHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 28si4462528qkp.324.2018.03.22.12.29.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 12:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez5u5-0000qe-Ki
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 15:29:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ez5tc-0000eu-Fr
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ez5tY-0007HU-Jr
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:29:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43406 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ez5tY-0007HB-Dh; Thu, 22 Mar 2018 15:29:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DC49BD87;
	Thu, 22 Mar 2018 19:29:03 +0000 (UTC)
Received: from redhat.com (ovpn-121-132.rdu2.redhat.com [10.10.121.132])
	by smtp.corp.redhat.com (Postfix) with SMTP id F3FE02023230;
	Thu, 22 Mar 2018 19:29:00 +0000 (UTC)
Date: Thu, 22 Mar 2018 21:29:00 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20180322211902-mutt-send-email-mst@kernel.org>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
	<20180321153439.GC3898@localhost.localdomain>
	<20180321175452-mutt-send-email-mst@kernel.org>
	<20180321162203.GE3898@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321162203.GE3898@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 22 Mar 2018 19:29:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 22 Mar 2018 19:29:04 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
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
	John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
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
X-TUID: Z2MYi7ExDGS4

On Wed, Mar 21, 2018 at 05:22:03PM +0100, Kevin Wolf wrote:
> > It's all still very much a non-standard convention and so less robust
> > than prefixing file name with a project-specifix prefix.
> 
> I've always had the impression that it's by far the most common
> convention, to the point that I'd blindly assume it when joining a new
> project.

Any examples?

> > > > As another example of problems, a header by the same name in the source
> > > > directory will always be picked up first - before any headers in
> > > > the include directory.
> > > > 
> > > > Let's change the scheme: make sure all headers that are not
> > > > in the source directory are included through a path
> > > > starting with qemu/ , thus:
> > > > 
> > > >  #include <>
> > > > 
> > > > headers in the same directory as source are included with
> > > > 
> > > >  #include ""
> > > > 
> > > > as per standard.
> > > > 
> > > > This (untested) patch is just to start the discussion and does not
> > > > change all of the codebase. If there's agreement, this will be
> > > > run on all code to converting code to this scheme.
> > > 
> > > Renaming files is always painful. If that's the fix, the cure might be
> > > worse than the disease. As far as I know, the conflict is only
> > > theoretical, so in that case I'd say: If it ain't broke, don't fix it.
> > > 
> > > Kevin
> > 
> > It's broke I think, it's very hard for new people to contribute to QEMU.
> > Look e.g. at rdma which all has messed up includes - and that's from an
> > experienced conributor who just isn't an experienced maintainer.
> 
> I don't think the problem is that the convention is hard to apply (it's
> definitely not). It's knowing about the convention. This problem isn't
> going away by switching to a different, less common convention. We're
> only going to see more offenders then.

Not if we have some automatic tools to catch violators.

> > Amount of time spent on teaching new people trivia about our
> > conventions just isn't funny. They should be self-documenting
> > and violations should cause the build to fail.
> 
> Yes, but your proposal doesn't achieve this. You can still use
> "qemu/foo.h" instead of <qemu/foo.h> and it will build successfully.
> That's something we can't change, as far as I know, because the include
> path for "foo.h" is always a superset of <foo.h>.

If the rule is that "" is only for files in the current directory
then we can easily code up a checkpatch script to catch violators.

> If anything, this means that we should prefer "foo.h" for local headers
> (i.e. the way it currently is) because we can let the compiler enforce
> it: <foo.h> for "foo.h" can become a build error, and does so with your
> -iquote patch, but the other way round doesn't work.
> 
> Then it's only system headers that you can possibly get wrong, but for
> those everyone should be used to using <foo.h> anyway.
> 
> Kevin

If my proposal to prefix all include directories with qemu/
is accepted, then we can solve the stale file problem
by prohibiting a directory named qemu everywhere in source.


-- 
MST
