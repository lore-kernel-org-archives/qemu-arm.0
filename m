Received: by 10.80.163.71 with SMTP id 65csp2673861edn;
        Wed, 5 Oct 2016 06:38:32 -0700 (PDT)
X-Received: by 10.37.16.214 with SMTP id 205mr7059609ybq.41.1475674712113;
        Wed, 05 Oct 2016 06:38:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c184si12906658ywe.157.2016.10.05.06.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 06:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brmP1-0006il-7i
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 09:38:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1brmN0-0005Rm-Go
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 09:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1brmMv-0005v5-Er
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 09:36:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>)
	id 1brmMl-0005tb-Fk; Wed, 05 Oct 2016 09:36:11 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C341C05A281;
	Wed,  5 Oct 2016 13:36:09 +0000 (UTC)
Received: from potion (dhcp-1-247.brq.redhat.com [10.34.1.247])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u95Da58n009019; Wed, 5 Oct 2016 09:36:06 -0400
Received: by potion (sSMTP sendmail emulation); Wed, 05 Oct 2016 15:36:05 +0200
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Oct 2016 15:35:28 +0200
Message-Id: <20161005133530.5702-1-rkrcmar@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 05 Oct 2016 13:36:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] qom+coccinelle: add and use
 object_new_with_class()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Rob Herring <robh@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Alexander Graf <agraf@suse.de>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VsWq31haGgFV

This series performs a simple replacement of
object_new(object_class_get_name(class)) by object_new_with_class(class)
in the spirit of existing object_new_with_type().


Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: "Andreas F=C3=A4rber" <afaerber@suse.de>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-arm@nongnu.org

Radim Kr=C4=8Dm=C3=A1=C5=99 (2):
  qom: add object_new_with_class()
  coccinelle: use object_new_with_class() in obvious cases

 hw/arm/exynos4210.c                            |  2 +-
 hw/arm/highbank.c                              |  2 +-
 hw/arm/integratorcp.c                          |  2 +-
 hw/arm/realview.c                              |  2 +-
 hw/arm/versatilepb.c                           |  2 +-
 hw/arm/vexpress.c                              |  2 +-
 hw/arm/xilinx_zynq.c                           |  2 +-
 include/qom/object.h                           | 12 ++++++++++++
 qom/cpu.c                                      |  2 +-
 qom/object.c                                   |  5 +++++
 scripts/coccinelle/object_new_with_class.cocci |  5 +++++
 target-alpha/cpu.c                             |  2 +-
 target-i386/cpu.c                              |  2 +-
 target-m68k/helper.c                           |  2 +-
 target-s390x/cpu_models.c                      |  2 +-
 target-xtensa/helper.c                         |  2 +-
 vl.c                                           |  4 ++--
 17 files changed, 37 insertions(+), 15 deletions(-)
 create mode 100644 scripts/coccinelle/object_new_with_class.cocci

--=20
2.10.0

