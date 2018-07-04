Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp502212wrq;
        Wed, 4 Jul 2018 05:49:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd9CkUwb3L771EQh8dq6kw1twU0jARKjCg2AgbFIKgd7qL9+lMV40ZSnw89KMhmW53CbYcG
X-Received: by 2002:a37:2454:: with SMTP id w81-v6mr1461988qkg.218.1530708597042;
        Wed, 04 Jul 2018 05:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530708597; cv=none;
        d=google.com; s=arc-20160816;
        b=i5g00PReWpWkmwHmhBxlD+U0+Dt0kFW2kSc2y97YR9dRHAwG1pq+axooEBXjqtfAlv
         wmIv5F2pUujANcj4PggcLCq+7ZiOsFt7A6RYexapsCAyFEc7+aGfdE8qbPDj0CBDkvMt
         OQRBxNd3wCTRd8BjjM4jCdE8ppHLvH6kGxBue9j7WGBHwwazXfgYO0ss4z2ufrOB0cqb
         2ZenVMJy9O7SL9/oJy6/urd9b9DkdN+Ow338H3Ufmvur9faT/NROut522x41immzKR/Y
         mNiMuLxHlBM5re1rOx/CjkUlFLnzwnEjSJg6n94belSKUUn64iJEqFTktmLEhaekmAeq
         x2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=xIhGQGu0+KCbKtQ6BadWs3PYQCadTJWi3QKcVE9wg0Q=;
        b=Yj3HRtym63soRFrZ8ygQav0d/vm7wPp3tXUT+5FSgIkmu749WOYmDXkkRvHlvImHee
         L0u/+UjwogrpDH8S1Cwah4Su9YjEKeq4Q+dl4IGp0fx2IJi1krdok9eOqpTHRbZb6mYl
         doJ1us207OEurIxGiaENweiYvCdEN5kyeJ7CIoIxRzKNpnx5ZYWd343gaiuvlurRsjcH
         eFBx0YQJwNcWUivX/KIV+w3Yh8/nnu1FlV5qYXMPzVCcixtnWkyjAZMRwAv5dd+Qkgp2
         KqPnZcH+cYVM/HTdNZH4mxUBQ78QuDIaxtr3b7OBUAbWWbSh7uGF4EPcpKAgnxuOb8/v
         F3vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q50-v6si3129280qtj.253.2018.07.04.05.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 05:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fahEK-0007aK-Fb
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 08:49:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDu-0007R2-HU
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDr-0000Ro-GI
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:30 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40768 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fahDr-0000RW-BR; Wed, 04 Jul 2018 08:49:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0013A402242D;
	Wed,  4 Jul 2018 12:49:25 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7EC02156889;
	Wed,  4 Jul 2018 12:49:24 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  4 Jul 2018 14:49:17 +0200
Message-Id: <20180704124923.32483-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 04 Jul 2018 12:49:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 04 Jul 2018 12:49:26 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu topology
 support
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ByZBb+tsg20F

This series provides support for booting mach-virt machines with
non-flat cpu topology, i.e. enabling the extended options of the
'-smp' command line parameter (sockets,cores,threads). Both DT and
ACPI description generators are added. We only apply the new feature
to 3.1 and later machine types, as the change is guest visible, even
when no command line change is made. This is because the basic
'-smp <N>' parameter makes the assumption that <N> refers to the
number of sockets, but when no topology description is provided,
Linux will use the MPIDR to guess. Neither the MPIDR exposed to
the guest when running with KVM nor TCG currently provides socket
information, leaving Linux to assume all processing elements are
cores in the same socket. For example, before this series '-smp 4'
would show up in the guest as

 CPU(s):                4
 On-line CPU(s) list:   0-3
 Thread(s) per core:    1
 Core(s) per socket:    4
 Socket(s):             1

and after it shows up as

 CPU(s):                4
 On-line CPU(s) list:   0-3
 Thread(s) per core:    1
 Core(s) per socket:    1
 Socket(s):             4

It's not expected that this should be a problem, but it's worth
considering. The only way to avoid the silent change is for QEMU to
provide boards a way to override the default '-smp' parsing function.
Otherwise, if a user wants to avoid a guest visible change, but still
use a 3.1 or later mach-virt machine type, then they must ensure the
command line specifies a single socket, e.g. '-smp sockets=1,cores=4'

Thanks,
drew


Andrew Jones (6):
  hw/arm/virt: Add virt-3.1 machine type
  device_tree: add qemu_fdt_add_path
  hw/arm/virt: DT: add cpu-map
  hw/arm/virt-acpi-build: distinguish possible and present cpus
  virt-acpi-build: add PPTT table
  hw/arm/virt: cpu topology: don't allow threads

 device_tree.c                | 24 +++++++++++++
 hw/acpi/aml-build.c          | 50 ++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c     | 25 ++++++++++---
 hw/arm/virt.c                | 69 +++++++++++++++++++++++++++++++++---
 include/hw/acpi/aml-build.h  |  2 ++
 include/hw/arm/virt.h        |  1 +
 include/sysemu/device_tree.h |  1 +
 7 files changed, 162 insertions(+), 10 deletions(-)

-- 
2.17.1

