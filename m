Received: by 10.28.91.67 with SMTP id p64csp4083003wmb;
        Tue, 20 Mar 2018 10:12:04 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuDO3kU50xd0/ROvddbJIT6aIGE/3J7tj9fuHBfU4EPeM5MIWMnOuKvJdyKLHjI6OKysdEu
X-Received: by 10.55.8.147 with SMTP id 141mr24717655qki.228.1521565924816;
        Tue, 20 Mar 2018 10:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521565924; cv=none;
        d=google.com; s=arc-20160816;
        b=T+ltHpKRdvNARH3iMW0fyhFJ2qyhn41ndL/92ETvyqxxo3Peugb51t+x7BupgOgdxD
         Mmm6pk/u9xK9k1j32r01P1MhuvO6OAjd4TLI4J9oG7REZA5oZ/rFmoWmn0+eQHXdAe/t
         TZ3Ai1zG9+Dq6aO5+l4XOP/htIRa2ZrCYX3t9z+bsRUdOZ6Drf34GFMw7NM2b+kQxIg1
         Tx/uuaSkFc26qdAAD8YsGsp9xUU0P0Qh3+v9dcE42ImzH44bPRPCRQzurPk/9UV3udlV
         kbDzZwxpXGXtnGEDKCaW/vCRCXK1+GF+mOYyk1JZ314N1ksm+HHyd4EpdTfY+UAqR/4i
         rtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=AnPWwj8BdVjJ4rKL2Cp94thmM3iP366cdo89M74GYRw=;
        b=GGMg+5HttzhBP1GTx7f4ewBD3CQz+cXoNVuwojWFNpqvb4n6dDBVE+N2D9GuyxrHNI
         gbaVu0b9aWf6pI5K1NKf4m4gxlT0NKYQxjBHB0+R7Uypc33Up4MroBzIsoqPxxywOr7u
         8zC6PjFGSXmQki+nDbENWFGjkwKZKQe9VBKC0Thtrqpl1Ha6O7VMIXaNJ4/LPumnB9+A
         r/rVVUGll/QKBrBJcmKAwa2k3OsB3um5G50cNAYT6dUyIwgCjnG5sZgeCReFQMG+KCMJ
         0WpzyQaTkKKMwEBThNi1WPIqpovgnKkqQkCEkaVxC0XcftvKFDXfSejJedt4neY2S6ww
         Af+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g88si2933852qkh.342.2018.03.20.10.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 10:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyKns-0006gg-6E
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 13:12:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyKnF-0006D4-5w
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 13:11:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyKnC-0006Tk-0t
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 13:11:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48814 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyKnB-0006TU-RM; Tue, 20 Mar 2018 13:11:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 789204040073;
	Tue, 20 Mar 2018 17:11:10 +0000 (UTC)
Received: from redhat.com (ovpn-125-54.rdu2.redhat.com [10.10.125.54])
	by smtp.corp.redhat.com (Postfix) with SMTP id 27AD711701C8;
	Tue, 20 Mar 2018 17:10:43 +0000 (UTC)
Date: Tue, 20 Mar 2018 19:10:42 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20180320185130-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 17:11:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 17:11:10 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qemu: include generated files
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
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Markus Armbruster <armbru@redhat.com>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
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
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	John Snow <jsnow@redhat.com>, Fam Zheng <famz@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W2N4CauR157v

On Tue, Mar 20, 2018 at 05:33:42PM +0100, Stefan Weil wrote:
> Using <> for system include files and "" for local include files is a
> convention, and as far as I know most projects adhere to that
> convention. So does QEMU currently. Such conventions are not only
> important for humans, but also for tools. There are more tools than the
> C preprocessor which handle <> and "" differently. For example the GNU
> compiler uses -MD or -MMD to automatically generate dependency rules for
> make. While -MD generates dependencies to all include files, -MMD does
> so only for user include files, but not for system include files. "user"
> and "system" means the different forms how include statements are
> written. QEMU still seems to use -MMD:
> 
> rules.mak:QEMU_DGFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d

To my knowledge, and according to my limited testing,
system headers in this context means
the default ones not supplied with -I.

If I had to guess, that is the definition most other tools
are likely to use.


>
> Other tools like static code analysers could restrict their warning and
> error messages to user include files and ignore problems in system
> include files.

Could you give some exacmples of tools like that?

IMHO they would not work correctly if they did not treat
include directives the way compiler does.

C standard is pretty explicit that the only difference
is extra directories searched:

A preprocessing directive of the form
# include "q-char-sequence" new-line
causes the replacement of that directive by the entire contents of the source file identified
by the specified sequence between the " delimiters. The named source file is searched
for in an implementation-defined manner. If this search is not supported, or if the search
fails, the directive is reprocessed as if it read
# include <h-char-sequence> new-line
with the identical contained sequence (including > characters, if any) from the original
directive.



> Very large projects often split in sub projects, maybe one of them
> describing the API. Then that API headers are similar to system headers
> and can be included using <>, although they still belong to the same
> larger project. Do we have a stable QEMU API described in a (small)
> number of include files which typically do not change? If yes, then
> those include files could be included using <> because we don't need
> them in dependency lists or in static code analysis reports.
> 
> For all other QEMU include files, I'd stick to using "".
> 
> Regards
> Stefan

Most people know that system headers are the ones in /usr/include
The distinction that they are pulled in with include ""
is a QEMU construct.

If we want to be able to distinguish between internal and
external headers, the standard way to do it
in C is by prefixing the names with qemu/ qemu- or qemu_.

In fact we kind of already do this - if you see a name with
a slash in there you can be pretty sure it's internal
to qemu.

Exceptions are elf.h glib-compat.h and the generated trace.h.

Let's
	mv include/* include/qemu/ ?

-- 
MST
