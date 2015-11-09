Received: by 10.182.105.169 with SMTP id gn9csp902198obb;
        Sun, 8 Nov 2015 17:19:08 -0800 (PST)
X-Received: by 10.140.43.139 with SMTP id e11mr26262354qga.6.1447031948768;
        Sun, 08 Nov 2015 17:19:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b78si4972645qhb.132.2015.11.08.17.19.08
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb6y-0003KX-G6
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:19:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1Y-0001cW-AG
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1T-00082g-IK
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:32 -0500
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:33226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1T-00082J-DF; Sun, 08 Nov 2015 20:13:27 -0500
Received: by qkas77 with SMTP id s77so61963387qka.0;
	Sun, 08 Nov 2015 17:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jjzlVKtjk39KPzObpeLoq28jluRGIpB5bFR5anFSsMQ=;
	b=t3VYbsbyq8OdiGMK06443sdWbXS26KRCSlZLqEjmGwXTJig5cjULZpbwzwLY1luvPL
	rwvUiVjRYXykDz771PdKrqVwiolmQT6u/ckClbvcXpMV/EHLvQCwwUj7DQT46o6VSr7S
	WiZDWzrbRnaRqHuMSlZxoO1kwvBCojB+fTbfuqUX6sTCntm4RtVrAgc+ZAzgWAHerP4i
	f7wAbTnczxVjIFvvVxRQCY+oF3q35mcvXtlTV7FO07bgVSBY0LJMm+fGU96BYDvKHVW7
	nvRwYTvoFEgLMXLtzxQwAfYVF8zo0PF96Jx1ea3LYL65eN2fAoFCfPbhIm1EzKBG2H2M
	GOlQ==
X-Received: by 10.55.76.20 with SMTP id z20mr26518314qka.89.1447031606995;
	Sun, 08 Nov 2015 17:13:26 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:26 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:45 -0500
Message-Id: <1447031505-12477-19-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::235
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 18/18] armv7m: prevent unprivileged write to
	STIR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h4eG2euh4QDp

Prevent unprivileged from writing to the
Software Triggered Interrupt register

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index ca8c93c..b744cd5 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -654,7 +654,9 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
                       "NVIC: fault status registers unimplemented\n");
         break;
     case 0xf00: /* Software Triggered Interrupt Register */
-        if ((value & 0x1ff) < NVIC_MAX_IRQ) {
+        /* STIR write allowed if privlaged or USERSETMPEND set */
+        if ((arm_current_el(&cpu->env) || (cpu->env.v7m.ccr&2))
+            && ((value & 0x1ff) < NVIC_MAX_IRQ)) {
             armv7m_nvic_set_pending(s, (value&0x1ff)+16);
         }
         break;
-- 
2.1.4

