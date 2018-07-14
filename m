Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649891wrq;
        Sat, 14 Jul 2018 10:17:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdMkVelarPq0HEdoq2SCdDJpL4psY9imfxuJQ9sEFCqLaHwF25A2ydI/tzvLS9sB4XPW+mo
X-Received: by 2002:a0c:95ad:: with SMTP id s42-v6mr11903615qvs.18.1531588648935;
        Sat, 14 Jul 2018 10:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588648; cv=none;
        d=google.com; s=arc-20160816;
        b=EEPm21dK7/JFvxFxLlQC0POSmBaTFhpChVtxnw/cWjhytqWzzebkh7KSisNS+Q9s9i
         +KRV6/JMvNiQmRu8yoemQxUlqZrRT+TGOi9WQ1MTe0SYQYsgOqtjQsx3/GJudXAAW518
         d0mySRwnzLdmuAE45J8/aLxF9MPKvkk4yTdAjawtjmGiNobOO2u8NmOe/qxMqZPnvJfD
         /QqTg7m8cQ7z6g3y7eL3IT7E6HKiGGvJw148aXVRvH6rPE3EdqdCuZGuApA47i8WE/Xr
         hlZy93W2s/1QkoEdlWosCtFI2kk20HNphYH0SBnxg99qXDJ4Ds6vFOT/mD2oBvma9dus
         rXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=VW4gWCLtGpP46aojDKndo3u3g0qKx5U7IF3LuWvOeaQ=;
        b=06TCLYiFOs/IMbh0/v1z2EaLhhDmWyPLqFrAStjpWvJtUgTJC1+i17zZ8iAI35bxS2
         OX0ai2kBrnJw2yYFpxMl+tuu9u3bN93kqL6m1UiGY76f5iIS+VPaIXjuw+hCP+MWxnaf
         KEVZvpMAOAy+7Eee2za0fq2dpEA/A7Dm2EeOtzMoYuNhXIBOY2tRMpL9OAIVWFKQVun0
         VwsmfQzh7yp5RcbN9yMQfOMML/oWeIK0WWLRBJzwkr2ZUB+6Y/J/OAfmTdzBalxYmCS/
         ukXOlPjsBCPMSQLtdj4OeJcfnpwTByjbHJDkgn/gG78gk0+NEiubaeJN2rJU6mRdHs4j
         za9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2qlVVwAh;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KOuNkQ6x;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KOuNkQ6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u14-v6si3308036qvb.118.2018.07.14.10.17.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2qlVVwAh;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KOuNkQ6x;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KOuNkQ6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAi-0006LV-AU
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9o-0005kT-Hs
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9k-0004Td-Ts
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:32 -0400
Received: from greensocs.com ([193.104.36.180]:57331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9k-0004Sm-HL; Sat, 14 Jul 2018 13:16:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 0721FC7AF9;
	Sat, 14 Jul 2018 19:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588588;
	bh=Bt7CiwOXI1Ge9roLoaK10EKjQ2cv9jRbjFAHV2MrjRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2qlVVwAhxec1YMoZ8AY8BiSVyyBhMFbIGph1dYKDX88JgvhLzXvHCZMctKZPXwF/q
	Njnnqzulr0Nc94n6guEhk2rSRWwCCAQxawANcrjgUYHDqYClWLYtf6HKwFLZJ4Ou6j
	mAayRiJ446zNvmEC8LEnQZ0TQBxNMNcSHYs5u3Es=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KOuNkQ6x;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KOuNkQ6x
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSDtLllt23UU; Sat, 14 Jul 2018 19:16:27 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 2E387C7AFC; Sat, 14 Jul 2018 19:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588587;
	bh=Bt7CiwOXI1Ge9roLoaK10EKjQ2cv9jRbjFAHV2MrjRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KOuNkQ6xpwoImryLzbrhWjFIB3Q5Ushb1y6T4B1S0hX8Vbtb+k3wr8+NFdNVzbcPv
	75uxJ8/4t3VS0buHEScWBSMY41X6e8f4zQL95fLdK0cXNQBqIbPsJ86GiWD9RvIb7M
	xdcwQUZtbaI/ce435HX/KwGU2LY/EbP9p1smVzHY=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 792D742898C;
	Sat, 14 Jul 2018 19:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588587;
	bh=Bt7CiwOXI1Ge9roLoaK10EKjQ2cv9jRbjFAHV2MrjRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KOuNkQ6xpwoImryLzbrhWjFIB3Q5Ushb1y6T4B1S0hX8Vbtb+k3wr8+NFdNVzbcPv
	75uxJ8/4t3VS0buHEScWBSMY41X6e8f4zQL95fLdK0cXNQBqIbPsJ86GiWD9RvIb7M
	xdcwQUZtbaI/ce435HX/KwGU2LY/EbP9p1smVzHY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:54 +0200
Message-Id: <20180714171601.5734-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 13/20] intc/arm_gic: Implement virtualization
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
X-TUID: fWOL9cSzP4Qw

Implement virtualization extensions in the gic_cpu_read() and
gic_cpu_write() functions. Those are the last bits missing to fully
support virtualization extensions in the CPU interface path.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 50cbbfbe24..28ecf0c1fc 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1360,9 +1360,12 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
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
@@ -1376,7 +1379,7 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         int regno = (offset - 0xe0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2 || !gic_has_groups(s) ||
-            gic_cpu_ns_access(s, cpu, attrs)) {
+            gic_cpu_ns_access(s, cpu, attrs) || gic_is_vcpu(cpu)) {
             *data = 0;
         } else {
             *data = s->nsapr[regno][cpu];
@@ -1411,7 +1414,8 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
                 s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
             }
         } else {
-            s->bpr[cpu] = MAX(value & 0x7, GIC_MIN_BPR);
+            int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+            s->bpr[cpu] = MAX(value & 0x7, min_bpr);
         }
         break;
     case 0x10: /* End Of Interrupt */
@@ -1428,11 +1432,14 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
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
@@ -1447,6 +1454,9 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
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
2.18.0

