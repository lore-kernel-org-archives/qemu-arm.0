Received: by 10.80.163.71 with SMTP id 65csp3347540edn;
        Thu, 6 Oct 2016 10:43:58 -0700 (PDT)
X-Received: by 10.55.26.87 with SMTP id a84mr14732302qka.187.1475775838377;
        Thu, 06 Oct 2016 10:43:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h142si8285092qke.319.2016.10.06.10.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 10:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsCi4-0003Qt-UZ
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 13:43:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bsChx-0003Oa-RK
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bsCht-0003E7-Oq
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:43:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bsCht-0003DO-I3; Thu, 06 Oct 2016 13:43:45 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE43DA0CB8;
	Thu,  6 Oct 2016 17:43:43 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u96Hhf4s023403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 6 Oct 2016 13:43:42 -0400
Message-ID: <1475775820.3533.75.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
Date: Thu, 06 Oct 2016 19:43:40 +0200
In-Reply-To: <1475617134-28180-2-git-send-email-wei@redhat.com>
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
	<1475617134-28180-2-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 06 Oct 2016 17:43:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V6 1/2] arm64: Add an option to turn on/off
 vPMU support
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pqxx1aMLWT+n

On Tue, 2016-10-04 at 17:38 -0400, Wei Huang wrote:
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

On both Moonshot and ThunderX,

Tested-by: Andrea Bolognani <abologna@redhat.com>

-- 
Andrea Bolognani / Red Hat / Virtualization
