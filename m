Received: by 10.80.166.35 with SMTP id d32csp621096edc;
        Mon, 17 Oct 2016 12:05:21 -0700 (PDT)
X-Received: by 10.55.64.21 with SMTP id n21mr22721762qka.137.1476731121207;
        Mon, 17 Oct 2016 12:05:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e67si18706147qtb.13.2016.10.17.12.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 12:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwDDs-0005UZ-Ht
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 15:05:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwCwn-0007DR-JB
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 14:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwCwk-0003sk-Bz
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 14:47:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bwCwk-0003sI-6B; Mon, 17 Oct 2016 14:47:38 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0315180B22;
	Mon, 17 Oct 2016 18:47:37 +0000 (UTC)
Received: from localhost (ovpn-116-159.phx2.redhat.com [10.3.116.159])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9HIlZOt016632; Mon, 17 Oct 2016 14:47:35 -0400
Date: Mon, 17 Oct 2016 16:47:34 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20161017184734.GZ3275@thinpad.lan.raisama.net>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<20161017034404.GT25390@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161017034404.GT25390@umbus.fritz.box>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 17 Oct 2016 18:47:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 0/3] Split cpu_exec_init() into an init
 and a realize part
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
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: noAsJ8Q5sHbe

On Mon, Oct 17, 2016 at 02:44:04PM +1100, David Gibson wrote:
> On Sat, Oct 15, 2016 at 12:52:46AM +0200, Laurent Vivier wrote:
> > Since commit 42ecaba ("target-i386: Call cpu_exec_init() on realize"),
> > , commit 6dd0f83 ("target-ppc: Move cpu_exec_init() call to realize function"),
> > and commit c6644fc ("s390x/cpu: Get rid of side effects when creating a vcpu"),
> > cpu_exec_init() has been moved to realize function for some architectures
> > to implement CPU htoplug. This allows any failures from cpu_exec_init() to be
> > handled appropriately.
> > 
> > This series tries to do the same work for all the other CPUs.
> > 
> > But as the ARM Virtual Machine ("virt") needs the "memory" property of the CPU
> > in the machine init function (the "memory" property is created in
> > cpu_exec_init() we want to move to the realize part), split cpu_exec_init() in
> > two parts: a realize part (cpu_exec_realizefn(), adding the CPU in the
> > environment) and an init part (cpu_exec_initfn(), initializing the CPU, like
> > adding the "memory" property). To mirror the realize part, add an unrealize
> > part, and remove the cpu_exec_exit() call from the finalize part.
> > 
> > This also allows to remove all the "cannot_destroy_with_object_finalize_yet"
> > properties from the CPU device class.
> 
> This is looking good to me - the v3 re-org has made it quite a bit
> easier to follow.
> 
> Whose tree should this go via?

I can merge it through the machine tree, if others agree.

-- 
Eduardo
