Received: by 10.25.85.209 with SMTP id j200csp790536lfb;
        Sun, 12 Jun 2016 07:03:30 -0700 (PDT)
X-Received: by 10.55.204.157 with SMTP id n29mr10203013qkl.202.1465740210069;
        Sun, 12 Jun 2016 07:03:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si9936987qkd.160.2016.06.12.07.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Jun 2016 07:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bC5z7-00014h-JP
	for alex.bennee@linaro.org; Sun, 12 Jun 2016 10:03:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bC5z5-000109-73
	for qemu-arm@nongnu.org; Sun, 12 Jun 2016 10:03:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bC5z1-0003lN-0y
	for qemu-arm@nongnu.org; Sun, 12 Jun 2016 10:03:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bC5z0-0003lI-RS; Sun, 12 Jun 2016 10:03:22 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01B979B0F6;
	Sun, 12 Jun 2016 14:03:22 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5CE3HxW020065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 12 Jun 2016 10:03:19 -0400
Date: Sun, 12 Jun 2016 16:03:16 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Message-ID: <20160612140316.rdpdfr6xgw7tvvoq@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sun, 12 Jun 2016 14:03:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 00/16] Rework SMP parameters
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, imammedo@redhat.com, dgibson@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fa0NlXpgOx+B

On Fri, Jun 10, 2016 at 07:40:11PM +0200, Andrew Jones wrote:
> This series is a first step in eliminating smp_* global
> variables (the last patch gets rid of two of them!) And, it's
> a first step in deprecating '-smp' in favor of using machine
> properties, e.g.
>  qemu -machine pc,sockets=2,cores=2,threads=2,maxcpus=8,cpus=8 ...
> 
> It's also a first step in allowing machine types to override
> the default parameter parsing, which makes assumptions that
> not all machine types may agree with. (mach-virt is coming...)
> 
> So, three first steps, I guess that's 3 steps. And a forth
> thing it does is some fixes for the smp parsing and also for
> SMBIOS use of cpu topology.
> 
> Tested with kvm-unit-tests on all five arches supported
> there, x86_64 both with KVM and TCG, and booting an x86_64
> guest (KVM) to check SMBIOS before and after in order to make
> sure it was the same. Also compile tested all targets.

I forgot to run 'make check'. Just did now. All but one test
passed. Nope, it wasn't pc-cpu-test (the only cpu topology
using test) that failed. That one did output two new warnings,
so I should fix and/or deprecate it. The one that did fail was
vhost-user-test. I confirmed that it does not fail without this
series. I'll look into it soon, maybe tomorrow.

drew
