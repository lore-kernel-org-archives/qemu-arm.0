Received: by 10.25.159.19 with SMTP id i19csp102960lfe;
        Mon, 11 Jan 2016 11:58:36 -0800 (PST)
X-Received: by 10.55.71.82 with SMTP id u79mr167762909qka.55.1452542316117;
        Mon, 11 Jan 2016 11:58:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e67si15631357qkb.67.2016.01.11.11.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 11:58:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIibr-0006xa-Md
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 14:58:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiaC-0003SL-MF
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 14:56:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiaB-0002wJ-Vs
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 14:56:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aIiaB-0002w8-MM; Mon, 11 Jan 2016 14:56:51 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 3BB938F4E5;
	Mon, 11 Jan 2016 19:56:51 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u0BJuU1o012743; Mon, 11 Jan 2016 14:56:48 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 20:56:24 +0100
Message-Id: <1452542185-10914-8-git-send-email-drjones@redhat.com>
In-Reply-To: <1452542185-10914-1-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v4 7/8] elf: add arm note types
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
X-TUID: V9jO8p8I91bx

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

