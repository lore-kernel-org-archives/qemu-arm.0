Received: by 10.80.163.71 with SMTP id 65csp383761edn;
        Fri, 23 Sep 2016 05:24:14 -0700 (PDT)
X-Received: by 10.200.41.243 with SMTP id 48mr7196097qtt.20.1474633454220;
        Fri, 23 Sep 2016 05:24:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h20si4958577qkh.230.2016.09.23.05.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 05:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnPWX-0007Ns-OC
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 08:24:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bnPUG-00056G-KF
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 08:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bnPUC-0003YU-JQ
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 08:21:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bnPUC-0003Y1-DU; Fri, 23 Sep 2016 08:21:48 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE3717EAB9;
	Fri, 23 Sep 2016 12:21:47 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8NCLjCa018272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 23 Sep 2016 08:21:46 -0400
Message-ID: <1474633305.3487.9.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
Date: Fri, 23 Sep 2016 14:21:45 +0200
In-Reply-To: <1474557203-4977-2-git-send-email-wei@redhat.com>
References: <1474557203-4977-1-git-send-email-wei@redhat.com>
	<1474557203-4977-2-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 23 Sep 2016 12:21:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V5 1/2] arm64: Add an option to turn on/off
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
X-TUID: MdHUlrh1FpFh

On Thu, 2016-09-22 at 11:13 -0400, Wei Huang wrote:
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

Tested-by: Andrea Bolognani <abologna@redhat.com>

-- 
Andrea Bolognani / Red Hat / Virtualization
