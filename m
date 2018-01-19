Received: by 10.28.71.27 with SMTP id u27csp867767wma;
        Fri, 19 Jan 2018 07:24:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBosCDU+L2kXQAqQBbG1gGYgRFbYALADhGnREVjqIkv02B1H6X65x8fFyadOHwVatpscrbjxN
X-Received: by 10.129.78.87 with SMTP id c84mr9721229ywb.420.1516375491579;
        Fri, 19 Jan 2018 07:24:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516375491; cv=none;
        d=google.com; s=arc-20160816;
        b=JETJkvuKTJMCJ8UVpp3bzYbRFuQBBicfvWTlo0hJ/E5Fk9TlnUHeFVB+zKI+8X/Da8
         un9F8sfxCm12wF5vUdz0Vbzxp4A29t7gUE+VGyV8evcFX5aksq8nhrmXby8f/gZDYiNP
         iizq9+IokxQoX5cGuXR2nRfsCdlxtO0uC+yR7ncuus975ZC2V+sUmDuPuUIFLYl1t3/K
         FJ3Ysevjq8lcLk7s5seh6TNMvcSjkakeb/X6HQUyMadDvjyiKMICNJHCWz9g8sX+4Hc4
         W+HOIkgP+ZNgkeAMJ7FGaC+a6qBzoRg6OJnXGf5SGqN9bJc6E2kA4bnIe5YdB5OpfxuX
         rfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=iu8NFpi1m3D9ooajOiWXa/9pFLHyOz9ZR1l7LZcY4SA=;
        b=cjb/ninqar2un7vcSM7QEked34I+ymks6DqWNGKxKjoU3ETivZlbkAnq23JS+vzUxz
         3t9AZCwnCIYogaNdOMaYH3kSgRnC+mji9h+8o/dZTB6jP5FWQktNl0C917ICusaS5xK0
         4b6siK3UOvb/FpliKyIjhybmQK69hMs9o2vdnQPgbHvaVelBC8VhG6vsc4hAzlK26skU
         YbTIwHoXZ9F/8C8YZbUOjE7eXcLVYXECCaZCsZJuxvfdYoffgotmIoB4o+04JhmIpB7w
         WcXPG7YfR59aHzAbB6rvUr6J2lvExMRgNu/4Dw/M2jIsYuEA7uWasHfkA962PkuZRhsv
         NU7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uAeCMlxc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qsxARHN1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qsxARHN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c11si2376878ywl.287.2018.01.19.07.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:24:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uAeCMlxc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qsxARHN1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qsxARHN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Received: from localhost ([::1]:55332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYXD-0000Is-3K
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:24:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7U-0002n3-7e
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7Q-0003jn-Ap
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:16 -0500
Received: from greensocs.com ([193.104.36.180]:39273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ecY7P-0003iL-WD; Fri, 19 Jan 2018 09:58:12 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CA09B65A14;
	Fri, 19 Jan 2018 15:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373883;
	bh=g6nlRw/e1ZG7zJp5fvespuMpsjuDbplCDnFGXjGLpqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uAeCMlxctAH1yPiklSRoKiYLxqxwQnxPLh5nbq5MgwC7V3glk2SaYa70IYwPeOYxp
	NPoBefgSkJGTF6UnwGcN8b2I513UwRxE1ZiP3qTqUcPhc3bzsxhk96rVX2c1PSGIV2
	SRXwSaMXftd+rDUNzFnDYkAg5u4YB6phiabHpmKA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=qsxARHN1;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=qsxARHN1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0UB70wXBmRD; Fri, 19 Jan 2018 15:58:03 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id F30F0319FD0; Fri, 19 Jan 2018 15:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373880;
	bh=g6nlRw/e1ZG7zJp5fvespuMpsjuDbplCDnFGXjGLpqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qsxARHN1C+Ui/0ZHHZWqmqm/aLbYZkTYWWflUKvQFGIMefKzHm1+/JIaaB4pqSpCJ
	36ezMNc3ELXX1/dxFaMY4z2p4gCDzWym1amhDmAC4aldB5rum2F+R9AQx8k7H0tI75
	LwhOrjJlBmTDgq/V13yfy3jQNqkZMov4IgAKR6oI=
Received: from michell-laptop.hive.antfield.fr (tima-dhcp-h14.imag.fr
	[147.171.132.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id A6F28319FD1;
	Fri, 19 Jan 2018 15:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373880;
	bh=g6nlRw/e1ZG7zJp5fvespuMpsjuDbplCDnFGXjGLpqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qsxARHN1C+Ui/0ZHHZWqmqm/aLbYZkTYWWflUKvQFGIMefKzHm1+/JIaaB4pqSpCJ
	36ezMNc3ELXX1/dxFaMY4z2p4gCDzWym1amhDmAC4aldB5rum2F+R9AQx8k7H0tI75
	LwhOrjJlBmTDgq/V13yfy3jQNqkZMov4IgAKR6oI=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Fri, 19 Jan 2018 15:57:56 +0100
Message-Id: <20180119145756.7629-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20180119145756.7629-1-luc.michel@greensocs.com>
References: <20180119145756.7629-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Mailman-Approved-At: Fri, 19 Jan 2018 10:23:16 -0500
Subject: [Qemu-arm] [PATCH 4/4] hw/intc/arm_gic: Fix the NS view of C_BPR
 when C_CTRL.CBPR is 1
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p5/bsHUa9YCE

From: Luc MICHEL <luc.michel@git.antfield.fr>

When C_CTRL.CBPR is 1, the Non-Secure view of C_BPR is altered:
  - A Non-Secure read of C_BPR should return the BPR value plus 1,
  saturated to 7,
  - A Non-Secure write should be ignored.

Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
---
 hw/intc/arm_gic.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d0a41a89ae..7418b7a082 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1211,8 +1211,13 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         break;
     case 0x08: /* Binary Point */
         if (s->security_extn && !attrs.secure) {
-            /* BPR is banked. Non-secure copy stored in ABPR. */
-            *data = s->abpr[cpu];
+            if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
+                /* NS view of BPR when CBPR is 1 */
+                *data = MIN(s->bpr[cpu] + 1, 7);
+            } else {
+                /* BPR is banked. Non-secure copy stored in ABPR. */
+                *data = s->abpr[cpu];
+            }
         } else {
             *data = s->bpr[cpu];
         }
@@ -1285,7 +1290,12 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         break;
     case 0x08: /* Binary Point */
         if (s->security_extn && !attrs.secure) {
-            s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
+            if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
+                /* WI when CTLR is 1 */
+                return MEMTX_OK;
+            } else {
+                s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
+            }
         } else {
             s->bpr[cpu] = MAX(value & 0x7, GIC_MIN_BPR);
         }
-- 
2.16.0

