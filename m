Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730373wrq;
        Fri, 29 Jun 2018 06:31:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdowWm8TkRSodEWuBkGHHQFd4NTE4NI0SQZmF5aLBHzJW2peuzWk7pyq5GyergwVUxHOZ9x
X-Received: by 2002:a37:2b28:: with SMTP id r40-v6mr13111017qkh.286.1530279094222;
        Fri, 29 Jun 2018 06:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279094; cv=none;
        d=google.com; s=arc-20160816;
        b=dDxfwGCIvaNCOLbKDX1f2bdemLibD3uWyCnnrvfofXuzNZPss596ARtUOWyaLPyD6L
         6SLtD/xw3Yuie2kXSRsYVGcTSf5JraSgDWvlzIReR8rO5G8BGGMWHDN65MODHIiaeeCn
         y5c3CeoigGqt+YH+8JNoEaE9C3y3TpbuNvlRnS0WgxBdphxa1sA7f4xSAoPQdY01BDz2
         dlYZdG9gP0PD9uyOLIuFrts59T4FtTYl7dgIWN9m0Y52RLeaiYHVNVTC+rn9DMNGEC3X
         93PBeIughGvyT7eYaAaKZuJcDV5/fJk2dvmIYY3MRQceRkDZ9nDk566Rz6/JOtwY98by
         yEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=HPTd9q7KXluzpqihBcfwsLJQdxxsJikT2TavtBFAqXI=;
        b=sBClTZKO8uUGJCE0RCa+4dsLFR3ahFX5nJsr6NSUPFa0qdy7nBJNUdCs5t/9ZMLESP
         jP+dRalN2ORRJVm6hU6JCdXsMEPuJxW7y4CkQ3No3jjf7Gvpqj2Ufm1d5SO6DsLn/yQr
         KiXEFR5OGaqoFu16IeyRLLpZcxD4TODaO2qKErDhjzHAk3k5yFTGBAzCQ4P8nzxcsIHI
         sMFVO1P7pqhENVNUogJcsobsqBvxGujRvKzEJ8JlifkHVFz3hKw0/Vi/ABUs2gaMkkbx
         pYk+h2y8M0YEqH1hXicJw7Y3E5NBypUKG8P6QPk/uK7aklIutUCAi/gN7p1yKIaN0MNM
         eb3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4xl5Y+se;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YERw6Skh;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YERw6Skh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2-v6si8257780qvn.258.2018.06.29.06.31.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4xl5Y+se;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YERw6Skh;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YERw6Skh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUr-00081Q-Km
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU9-0007aB-7A
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006rF-7S
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:49 -0400
Received: from greensocs.com ([193.104.36.180]:58623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006nX-Hs; Fri, 29 Jun 2018 09:30:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BA7344434B7;
	Fri, 29 Jun 2018 15:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279039;
	bh=RnCM0QeyK4Th8xyUB80B9wnawptYOn6aaOfHMd/1gNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4xl5Y+se5/78pu6uPvJDDGp76O718pu5ZiOntE/a58zBI6zrZOfY2ehUFqzFqGEp4
	NMmpKMfCqOzd0buNfrEreBhQuIG19zeNgx8erEAJ7UlV38BB3+aM+/KhxSQ2/CXyN9
	zeDpKXybO8dv2W3eIo9ntp00dqLy9dmVTUNFiUBE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=YERw6Skh;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=YERw6Skh
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcMrYS5yfi6j; Fri, 29 Jun 2018 15:30:38 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id CF6BF4434B9; Fri, 29 Jun 2018 15:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279038;
	bh=RnCM0QeyK4Th8xyUB80B9wnawptYOn6aaOfHMd/1gNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YERw6SkhewKOg/dS//cpnes60/pJiZ6xK0MZdu31BRQNCA/Fsn4QPZxdHpnfwCp83
	/mCICKOZqJckWQY7NzKw/4fy+GRnVo1tOCEg0PMSf3CfymXsj4WHmh96/mhAoMIIz9
	kLXSimQ1vdlssSVdRiq7FQLgOsYTYoJqzMlpbm18=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 517294434B5;
	Fri, 29 Jun 2018 15:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279038;
	bh=RnCM0QeyK4Th8xyUB80B9wnawptYOn6aaOfHMd/1gNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YERw6SkhewKOg/dS//cpnes60/pJiZ6xK0MZdu31BRQNCA/Fsn4QPZxdHpnfwCp83
	/mCICKOZqJckWQY7NzKw/4fy+GRnVo1tOCEg0PMSf3CfymXsj4WHmh96/mhAoMIIz9
	kLXSimQ1vdlssSVdRiq7FQLgOsYTYoJqzMlpbm18=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:47 +0200
Message-Id: <20180629132954.24269-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 13/20] intc/arm_gic: Implement virtualization
 extensions in gic_cpu_(read|write)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijmVcAPW/Zdy

Implement virtualization extensions in the gic_cpu_read() and
gic_cpu_write() functions. Those are the last bits missing to fully
support virtualization extensions in the CPU interface path.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 434dc9c7b2..2b1fa280eb 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1336,9 +1336,12 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
     case 0xd0: case 0xd4: case 0xd8: case 0xdc:
     {
         int regno = (offset - 0xd0) / 4;
+        int nr_aprs = gic_is_vcpu(cpu) ? GIC_VIRT_NR_APRS : GIC_NR_APRS;
 
-        if (regno >= GIC_NR_APRS || s->revision != 2) {
+        if (regno >= nr_aprs || s->revision != 2) {
             *data = 0;
+        } else if (gic_is_vcpu(cpu)) {
+            *data = s->h_apr[gic_get_vcpu_real_id(cpu)];
         } else if (gic_cpu_ns_access(s, cpu, attrs)) {
             /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
             *data = gic_apr_ns_view(s, regno, cpu);
@@ -1352,7 +1355,7 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         int regno = (offset - 0xe0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2 || !gic_has_groups(s) ||
-            gic_cpu_ns_access(s, cpu, attrs)) {
+            gic_cpu_ns_access(s, cpu, attrs) || gic_is_vcpu(cpu)) {
             *data = 0;
         } else {
             *data = s->nsapr[regno][cpu];
@@ -1387,7 +1390,8 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
                 s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
             }
         } else {
-            s->bpr[cpu] = MAX(value & 0x7, GIC_MIN_BPR);
+            int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+            s->bpr[cpu] = MAX(value & 0x7, min_bpr);
         }
         break;
     case 0x10: /* End Of Interrupt */
@@ -1404,11 +1408,14 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
     case 0xd0: case 0xd4: case 0xd8: case 0xdc:
     {
         int regno = (offset - 0xd0) / 4;
+        int nr_aprs = gic_is_vcpu(cpu) ? GIC_VIRT_NR_APRS : GIC_NR_APRS;
 
-        if (regno >= GIC_NR_APRS || s->revision != 2) {
+        if (regno >= nr_aprs || s->revision != 2) {
             return MEMTX_OK;
         }
-        if (gic_cpu_ns_access(s, cpu, attrs)) {
+        if (gic_is_vcpu(cpu)) {
+            s->h_apr[gic_get_vcpu_real_id(cpu)] = value;
+        } else if (gic_cpu_ns_access(s, cpu, attrs)) {
             /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
             gic_apr_write_ns_view(s, regno, cpu, value);
         } else {
@@ -1423,6 +1430,9 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         if (regno >= GIC_NR_APRS || s->revision != 2) {
             return MEMTX_OK;
         }
+        if (gic_is_vcpu(cpu)) {
+            return MEMTX_OK;
+        }
         if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
             return MEMTX_OK;
         }
-- 
2.17.1

