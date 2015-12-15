Received: by 10.182.158.201 with SMTP id ww9csp2759663obb;
        Tue, 15 Dec 2015 14:55:00 -0800 (PST)
X-Received: by 10.55.77.17 with SMTP id a17mr54192177qkb.40.1450220100720;
        Tue, 15 Dec 2015 14:55:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si3338680qgf.101.2015.12.15.14.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 14:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8yUm-0001qQ-ED
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 17:55:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yS8-0005SU-8v
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:52:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yS7-0001iE-Ef
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:52:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44054)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a8yS7-0001i9-95; Tue, 15 Dec 2015 17:52:15 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id C245496FF;
	Tue, 15 Dec 2015 22:52:14 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBFMpNh9024186; Tue, 15 Dec 2015 17:52:09 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Dec 2015 16:51:17 -0600
Message-Id: <1450219878-5293-9-git-send-email-drjones@redhat.com>
In-Reply-To: <1450219878-5293-1-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v3 8/9] elf: add arm note types
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
X-TUID: BGwxDK72OEO2

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 include/elf.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 66add810df144..1098d217ec7ff 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1471,6 +1471,11 @@ typedef struct elf64_shdr {
 #define NT_PPC_VMX       0x100          /* PowerPC Altivec/VMX registers */
 #define NT_PPC_SPE       0x101          /* PowerPC SPE/EVR registers */
 #define NT_PPC_VSX       0x102          /* PowerPC VSX registers */
+#define NT_ARM_VFP      0x400           /* ARM VFP/NEON registers */
+#define NT_ARM_TLS      0x401           /* ARM TLS register */
+#define NT_ARM_HW_BREAK 0x402           /* ARM hardware breakpoint registers */
+#define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint registers */
+#define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
 
 
 /* Note header in a PT_NOTE section */
-- 
2.4.3

