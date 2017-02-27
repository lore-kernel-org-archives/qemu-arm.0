Received: by 10.25.0.147 with SMTP id 141csp1039272lfa;
        Mon, 27 Feb 2017 09:37:21 -0800 (PST)
X-Received: by 10.55.144.4 with SMTP id s4mr16068981qkd.101.1488217041536;
        Mon, 27 Feb 2017 09:37:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v34si12325921qtv.218.2017.02.27.09.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Feb 2017 09:37:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ciPEc-0001Ry-N7
	for alex.bennee@linaro.org; Mon, 27 Feb 2017 12:37:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ciPEW-0001Ph-82
	for qemu-arm@nongnu.org; Mon, 27 Feb 2017 12:37:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ciPEV-0000bg-Fo
	for qemu-arm@nongnu.org; Mon, 27 Feb 2017 12:37:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ciPEV-0000ay-AA; Mon, 27 Feb 2017 12:37:11 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3A6B7FB66;
	Mon, 27 Feb 2017 17:37:10 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1RHb8oh000943; Mon, 27 Feb 2017 12:37:09 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon, 27 Feb 2017 18:37:04 +0100
Message-Id: <20170227173706.15210-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 27 Feb 2017 17:37:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/2] Enable QEMU to control MPIDR values
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
Cc: marc.zyngier@arm.com, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FhWrG/pAQufg

Igor needs to know/select vcpu MPIDR values early in order to map vcpus
to vnodes. Waiting until after vcpu init, when KVM sets them, is too
late. With this patch, and its KVM counterpart, QEMU can control the
values, allowing it to know/select them whenever it likes.

Andrew Jones (2):
  HACK: update linux/kvm header
  arm: kvm: set MPIDR when we can

 linux-headers/linux/kvm.h |  1 +
 target/arm/cpu.c          |  3 +--
 target/arm/kvm32.c        | 22 ++++++++++++++--------
 target/arm/kvm64.c        | 22 ++++++++++++++--------
 4 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.9.3

