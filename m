Received: by 10.28.91.67 with SMTP id p64csp5230723wmb;
        Wed, 21 Mar 2018 08:59:09 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtIpdU6WsqbwmR03flDJurC8p9UjEIQLgWi8USOWNsudC0hH8iB9QtrJ98c5uF6eTgUqLiV
X-Received: by 10.129.117.195 with SMTP id q186mr6921022ywc.226.1521647949249;
        Wed, 21 Mar 2018 08:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521647949; cv=none;
        d=google.com; s=arc-20160816;
        b=hCsQMc0ZnVDA8aB5l6K0BNVIgKI5GpOHxhmAA0ecYO7RBkBlAylgulnPIRArH1EfsY
         EGtgPq6lMHR+6nVZYZXxMc5DR6LMaZ+GWK2/SN/BPL9r2fcIA2KPApFPmYFA0OJvrrTt
         DQ4iicL6lLryCopE3Q4RkL96WR7Kc9/S4m+n/tjthWtZJyXaNhh8mVSAqKyfg6srenGo
         pMAMKajYzoPHp4I8OE51LLo+3UD44TWpdGCfQs0yK1vKFVtUZDI+WbHXa3dBR+bYjJNJ
         a7vKSoiJMiBD83vPVU5CyK3VlaY0qZfWneI90w0kJSZ9CtIGSyFlc1nNKKLo5Bqily8w
         LChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=9FUT6m5ekKeM06Q+2VNsbr5pUx1n2jTtc640ctf+m+0=;
        b=YqxfndanxEiGsyEv69UkChziR4ty1ugS+xk+pImTWx6STIW8ioLf3K/EERGS5jBrJP
         fFzkzmRyrlyv+4iF76Ykx1Av4oP1fSIJAWT/nNwFGc5DNMTI+M8Tes5Cwz7qGjIAHVb2
         2wKOM3Qr2dFB73WZYCZohGjEhDgjGiXDAU50SAcp2hkpsXjYXPDjwzA4EHLEYfMI9/jM
         X3+8PZs5WlwnBEihk04JWLUzd+6dGxhmMpFOG7p9TuHnx7JNrPN/n+sa2lgcd+SKjyVZ
         3CvZraNmtcj7OYMcwOgkQmqe6OAOhb4bcKyBXhVT0r5IAdnMS+QZCezlhw6SU8IFBItG
         8nOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o29si793118qtl.366.2018.03.21.08.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyg8q-0002ZF-P6
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:59:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyg8g-0002X1-Fo
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:58:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyg8c-00040A-Hf
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:58:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59206 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyg8c-0003zu-Aj; Wed, 21 Mar 2018 11:58:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 340E7412A029;
	Wed, 21 Mar 2018 15:58:53 +0000 (UTC)
Received: from redhat.com (ovpn-124-179.rdu2.redhat.com [10.10.124.179])
	by smtp.corp.redhat.com (Postfix) with SMTP id 989B8215CDA7;
	Wed, 21 Mar 2018 15:58:49 +0000 (UTC)
Date: Wed, 21 Mar 2018 17:58:49 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20180321175452-mutt-send-email-mst@kernel.org>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
	<20180321153439.GC3898@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321153439.GC3898@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 21 Mar 2018 15:58:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 21 Mar 2018 15:58:53 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
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
X-TUID: fdwedlXm66X/

On Wed, Mar 21, 2018 at 04:34:39PM +0100, Kevin Wolf wrote:
> Am 21.03.2018 um 15:46 hat Michael S. Tsirkin geschrieben:
> > Our current scheme is to use
> >  #include ""
> > for internal headers, and
> >  #include <>
> > for external ones.
> > 
> > Unfortunately this is not based on compiler support: from C point of
> > view, the "" form merely looks up headers in the current directory
> > and then falls back on <> directories.
> > 
> > Thus, for example, a system header trace.h - should it be present - will
> > conflict with our local trace.h
> 
> You're right that there is a conflict, even though only in one
> direction: "trace.h" is unambiguously the local trace.h in our source
> tree, but <trace.h> refers to the same local header rather than the
> system header as you would expect.
> 
> An easy way to resolve this conflict would be using -iquote rather than
> -I for directories in the source tree, so that <trace.h> unambiguously
> refers to the system header and "trace.h" unambiguously refers to the
> QEMU header.

I posted patches to that effect for 2.12. It's all still very much
a non-standard convention and so less robust than
prefixing file name with a project-specifix prefix.

> > As another example of problems, a header by the same name in the source
> > directory will always be picked up first - before any headers in
> > the include directory.
> > 
> > Let's change the scheme: make sure all headers that are not
> > in the source directory are included through a path
> > starting with qemu/ , thus:
> > 
> >  #include <>
> > 
> > headers in the same directory as source are included with
> > 
> >  #include ""
> > 
> > as per standard.
> > 
> > This (untested) patch is just to start the discussion and does not
> > change all of the codebase. If there's agreement, this will be
> > run on all code to converting code to this scheme.
> 
> Renaming files is always painful. If that's the fix, the cure might be
> worse than the disease. As far as I know, the conflict is only
> theoretical, so in that case I'd say: If it ain't broke, don't fix it.
> 
> Kevin

It's broke I think, it's very hard for new people to contribute to QEMU.
Look e.g. at rdma which all has messed up includes - and that's from an
experienced conributor who just isn't an experienced maintainer.

Amount of time spent on teaching new people trivia about our
conventions just isn't funny. They should be self-documenting
and violations should cause the build to fail.

-- 
MST
