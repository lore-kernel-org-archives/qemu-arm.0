Received: by 10.25.30.65 with SMTP id e62csp522540lfe;
        Thu, 26 May 2016 07:33:41 -0700 (PDT)
X-Received: by 10.55.31.140 with SMTP id n12mr2998982qkh.4.1464273221682;
        Thu, 26 May 2016 07:33:41 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f127si8269001qhc.54.2016.05.26.07.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:33:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5wM1-0005Jr-4u
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:33:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1b5wKh-0004bl-6T
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:32:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1b5wKf-00086I-3O
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:32:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1b5wKX-00082t-T5; Thu, 26 May 2016 10:32:09 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C40A86317C;
	Thu, 26 May 2016 14:32:08 +0000 (UTC)
Received: from colepc.redhat.com (ovpn-116-13.phx2.redhat.com [10.3.116.13])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4QEW7Yb003640; Thu, 26 May 2016 10:32:08 -0400
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 26 May 2016 10:31:25 -0400
Message-Id: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 26 May 2016 14:32:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/arm/virt: Reject gic-version=host for
 non-KVM
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uxtyu92EB5xW

If you try to gic-version=host with TCG on a KVM aarch64 host,
qemu segfaults, since host requires KVM APIs.

Explicitly reject gic-version=host if KVM is not enabled

https://bugzilla.redhat.com/show_bug.cgi?id=1339977
Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 hw/arm/virt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e77ed88..1e82597 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1122,10 +1122,14 @@ static void machvirt_init(MachineState *machine)
      * KVM is not available yet
      */
     if (!gic_version) {
+        if (!kvm_enabled()) {
+            error_report("gic-version=host requires KVM");
+            exit(1);
+        }
+
         gic_version = kvm_arm_vgic_probe();
         if (!gic_version) {
             error_report("Unable to determine GIC version supported by host");
-            error_printf("KVM acceleration is probably not supported\n");
             exit(1);
         }
     }
-- 
2.7.4

