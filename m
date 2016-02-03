Received: by 10.25.159.19 with SMTP id i19csp1265041lfe;
        Wed, 3 Feb 2016 06:50:36 -0800 (PST)
X-Received: by 10.55.80.9 with SMTP id e9mr1994321qkb.94.1454511036132;
        Wed, 03 Feb 2016 06:50:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188si5784867qhj.38.2016.02.03.06.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 06:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQylP-00033B-H2
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 09:50:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aQylM-00032k-C5
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 09:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aQylI-0003se-4v
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 09:50:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aQylH-0003ru-WF; Wed, 03 Feb 2016 09:50:28 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 05F2F7AEB9;
	Wed,  3 Feb 2016 14:50:26 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u13EoJrr015605
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 3 Feb 2016 09:50:22 -0500
Date: Wed, 3 Feb 2016 15:50:19 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <20160203145019.GE4273@hawk.localdomain>
References: <1454077485-242598-1-git-send-email-imammedo@redhat.com>
	<56AB7E54.4000608@linaro.org>
	<20160129152603.GG4340@hawk.localdomain>
	<56AB88D8.1020907@linaro.org>
	<20160129160731.GH4340@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160129160731.GH4340@hawk.localdomain>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: virt-acpi: each MADT.GICC
 entry as enabled unconditionally
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0Su2qSIh1JXQ

On Fri, Jan 29, 2016 at 05:07:31PM +0100, Andrew Jones wrote:
> On Fri, Jan 29, 2016 at 11:44:24PM +0800, Shannon Zhao wrote:
> > >>>And below check in virt.c is not right while it should compare the global
> > >>>max_cpus with the max_cpus GIC supports.
> > >>>
> > >>>     if (smp_cpus > max_cpus) {
> > >>>         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
> > >>>                      "supported by machine 'mach-virt' (%d)",
> > >>>                      smp_cpus, max_cpus);
> > >>>         exit(1);
> > >>>     }
> > >max_cpus is getting set to the number the gic supports just above this
> > >check. So max_cpus == gic_supported_cpus already, and this check is just
> > >confirming the number of cpus the user has selected is OK.
> > No, the global max_cpus (which is defined in vl.c and exported in
> > sysemu/sysemu.h) is not the local variable max_cpus.
> 
> I now see what you mean though. If we don't want something like
> -smp 1,maxcpus=9 to erroneously succeed on a gicv2 machine, then we
> should be checking the global max_cpus here. I agree it should be
> fixed, because, even though it changes nothing atm, we don't want to
> allow invalid command lines.
> 
> Will you send the patch?

I'll send one in a second.

drew
