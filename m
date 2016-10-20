Received: by 10.80.166.35 with SMTP id d32csp955238edc;
        Thu, 20 Oct 2016 10:39:44 -0700 (PDT)
X-Received: by 10.31.48.69 with SMTP id w66mr2532921vkw.176.1476985184553;
        Thu, 20 Oct 2016 10:39:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x124si22930952vka.51.2016.10.20.10.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Oct 2016 10:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxHJg-0006QU-1g
	for alex.bennee@linaro.org; Thu, 20 Oct 2016 13:39:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bxHJb-0006QO-2R
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 13:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bxHJW-0000ee-3I
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 13:39:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bxHJV-0000e7-Tg; Thu, 20 Oct 2016 13:39:34 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33FA2C056792;
	Thu, 20 Oct 2016 17:39:31 +0000 (UTC)
Received: from localhost (ovpn-116-221.phx2.redhat.com [10.3.116.221])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9KHdRAB012303; Thu, 20 Oct 2016 13:39:27 -0400
Date: Thu, 20 Oct 2016 15:39:26 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161020173926.GG5057@thinpad.lan.raisama.net>
References: <1476962764-12166-1-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476962764-12166-1-git-send-email-lvivier@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 20 Oct 2016 17:39:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 0/3] Split cpu_exec_init() into an init
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
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HTZP4AFcCpZ

On Thu, Oct 20, 2016 at 01:26:01PM +0200, Laurent Vivier wrote:
> Since commit 42ecaba ("target-i386: Call cpu_exec_init() on realize"),
> , commit 6dd0f83 ("target-ppc: Move cpu_exec_init() call to realize function"),
> and commit c6644fc ("s390x/cpu: Get rid of side effects when creating a vcpu"),
> cpu_exec_init() has been moved to realize function for some architectures
> to implement CPU htoplug. This allows any failures from cpu_exec_init() to be
> handled appropriately.
> 
> This series tries to do the same work for all the other CPUs.
> 
> But as the ARM Virtual Machine ("virt") needs the "memory" property of the CPU
> in the machine init function (the "memory" property is created in
> cpu_exec_init() we want to move to the realize part), split cpu_exec_init() in
> two parts: a realize part (cpu_exec_realizefn(), adding the CPU in the
> environment) and an init part (cpu_exec_initfn(), initializing the CPU, like
> adding the "memory" property). To mirror the realize part, add an unrealize
> part, and remove the cpu_exec_exit() call from the finalize part.
> 
> This also allows to remove all the "cannot_destroy_with_object_finalize_yet"
> properties from the CPU device class.
> 
> v5:
> - rebase master
> - arm: define ARM_DEFAULT_CPUS_PER_CLUSTER, ARM64_AFFINITY_INVALID,
>         and move variable declaration into the "if" block.
[...]

Applied to machine-next. Thanks!

-- 
Eduardo
