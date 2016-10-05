Received: by 10.80.163.71 with SMTP id 65csp2515567edn;
        Wed, 5 Oct 2016 00:10:26 -0700 (PDT)
X-Received: by 10.55.113.197 with SMTP id m188mr7330258qkc.55.1475651426527;
        Wed, 05 Oct 2016 00:10:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9si4885667qka.246.2016.10.05.00.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 00:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brgLR-0005dk-C2
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 03:10:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1brgLN-0005dd-9n
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 03:10:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1brgLH-0002dV-O0
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 03:10:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1brgLH-0002dI-Hm; Wed, 05 Oct 2016 03:10:15 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5E7FB813C;
	Wed,  5 Oct 2016 07:10:14 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-44.brq.redhat.com [10.40.204.44])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u957AAZN020964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 5 Oct 2016 03:10:12 -0400
Date: Wed, 5 Oct 2016 09:10:10 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20161005071010.gesdbmv4l34edbkm@hawk.localdomain>
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
	<1475617134-28180-2-git-send-email-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475617134-28180-2-git-send-email-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 05 Oct 2016 07:10:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V6 1/2] arm64: Add an option to
 turn on/off vPMU support
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
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DLC6XB7MlENf

On Tue, Oct 04, 2016 at 05:38:53PM -0400, Wei Huang wrote:
> This patch adds a pmu=[on/off] option to enable/disable vPMU support
> in guest vCPU. This option is only available for cortex-a57/cortex-53/
> host under both TCG and KVM modes, but unavailable on ARMv7 and other
> processors. It allows virt tools, such as libvirt, to determine the
> exsitence of vPMU and configure it. Note that, if nothing specified,
> the pmu option is set to AUTO as default, allowing machine-level PMU
> property to override it. Also when pmu is turned on under non-KVM mode,
> a warning message will be printed.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c |  2 +-
>  hw/arm/virt.c            |  2 +-
>  target-arm/cpu.c         | 23 +++++++++++++++++++++++
>  target-arm/cpu.h         |  3 ++-
>  target-arm/cpu64.c       |  2 ++
>  target-arm/kvm64.c       | 17 ++++++++++++++---
>  6 files changed, 43 insertions(+), 6 deletions(-)
>

Please leave r-b's on patches that don't change. afaict this one
didn't change, so [again]

Reviewed-by: Andrew Jones <drjones@redhat.com> 
