Received: by 10.28.91.67 with SMTP id p64csp4018613wmb;
        Tue, 20 Mar 2018 09:12:51 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtvdjLt7n2998cKG4WuM1WUs7vSR5So0QknK3PEttdyIjNKLtjj/s/PUc6ZTeHNHKosXlfw
X-Received: by 10.233.237.70 with SMTP id c67mr25388121qkg.56.1521562371065;
        Tue, 20 Mar 2018 09:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521562371; cv=none;
        d=google.com; s=arc-20160816;
        b=RoS6yzSYGuuZSSy5bTsuj/h/QEsIL6A6KWz9dqnJ4ueR4TZ8uyq6c7dtVcYcNSV+XV
         mSk+lg/aarOhEdyQ2E0frsQBEF4NMBJyt6WwUczeNB+8yTaHo13WtpHGTZfWLHoGvP4U
         zTUpinTHv2Y/6R9eyy7pnEtgF5MxfD0yNz5A90190C+Z5SoT2fMohEW4fXObwSD/dNaf
         TJKL2SoDcZV/Gpx8xCapQMjjAyoH3X5v6LTaqNAbvAsWrW2yKACj4dP2d+V4S7sW8yNH
         GHoUKAMHjSXcAgRheGEHxsAqWBedFJUEXZ4OSYZa8dO8EkXkH9mWn6kpn3ySMGK/Z/TG
         2bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=m1kIZ0ENbmdL2kPLbFewLYGGXJ0eHVccb3dgzrhejF4=;
        b=jX7SKbA0IZrWviwkPKb1nJN9S1yY1DOixsZnnO72OQI19HGiFBocvX7TU/Ns6z2xLE
         1Md9DpZ1X2wyyRZbT75Rh9gJCGfKm3lDj+OTF7w3BLVPIJFn1Nx5xPhqbseF0CZ84GKw
         9ROKG3JtmxV7nI+ixoz5kotZyLmTEY8jgmaSdGpweCZ1B79500RP/ur6btws3Qp1++gL
         98Jij5zUo9GD4D/BhUtQ20xHqffJjXs3KJU/d+kaED5A0/bAR7bksWJ3L6ryEV+JBRDj
         dG/FnRIbbHkdYONJQgRfd9V3GB2EC+/IDhmF4KswGC6wUZYsSmBpvgjMdKEKa0RkZ/Nj
         dY6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17si2339449qth.191.2018.03.20.09.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 09:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyJsY-0007XU-Ig
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 12:12:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eyJsR-0007XF-Jc
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 12:12:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eyJsO-0003Vh-4F
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 12:12:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36790 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eyJsN-0003Uo-VB; Tue, 20 Mar 2018 12:12:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB01F40704A2;
	Tue, 20 Mar 2018 16:12:38 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41EE811701C7;
	Tue, 20 Mar 2018 16:12:01 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <da3457a0-7f24-4759-7d98-9b2fdc87e87c@redhat.com>
Date: Tue, 20 Mar 2018 11:12:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521510562-529051-1-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 20 Mar 2018 16:12:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 20 Mar 2018 16:12:39 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	sheepdog@lists.wpkg.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLLZZJ6edx2l

On 03/19/2018 08:54 PM, Michael S. Tsirkin wrote:
> QEMU coding style at the moment asks for all non-system
> include files to be used with #include "foo.h".

[I'm replying without having read the rest of the thread, so bear with 
me if I repeat some of the other comments that have already been made]

And Markus even just did a cleanup along those lines.

> However this rule actually does not make sense and
> creates issues for when the included file is generated.
> 
> In C, include "file" means look in current directory,
> then on include search path. Current directory here
> means the source file directory.
> By comparison include <file> means look on include search path.

It's also nice when "file" means file belonging to our project, and 
<file> means 3rd-party file.  So we have to choose which semantics are 
easier; perhaps better Makefile rules that prevent us from seeing stale 
files is a better solution than figuring out which files are generated.

> 
> As generated files are not in the search directory (unless the build
> directory happens to match the source directory),

Why can't we fix Makefile to include BOTH the build and the source 
directories (to pick up generated files first, and then 
version-controlled files), and possibly include logic to simplify to a 
single -I instead of two when doing in-tree builds?

> it does not make sense
> to include them with "" - doing so is merely more work for preprocessor
> and a source or errors if a stale file happens to exist in the source
> directory.
> 
> This changes include directives for all generated files, across the
> tree. The idea is to avoid sending a huge amount of email.  But when
> merging, the changes will be split with one commit per file, e.g. for
> ease of bisect in case of build failures, and to ease merging.
> 
> Note that should some generated files be missed by this tree-wide
> refactoring, it isn't a big deal - this merely maintains the status quo,
> and this can be addressed by a separate patch on top.

I'm not sure I'm a fan of this patch yet, if there may be other 
alternatives that solve the real issue of stale generated files breaking 
incremental builds.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
