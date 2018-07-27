Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507408wru;
        Fri, 27 Jul 2018 02:55:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcqNCYu1cYZ2zp49RyuvYhYtis67jmXKzyTCiOZNWcNIf1+HmAwKLEcbXhPuuOlHG73KWjC
X-Received: by 2002:ac8:2541:: with SMTP id 1-v6mr5294820qtn.248.1532685349760;
        Fri, 27 Jul 2018 02:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685349; cv=none;
        d=google.com; s=arc-20160816;
        b=O5/RVBhwYlCpzgNFagcuikZpJeQgqFAvmEiXE3oYU7hR51UPi0YY3yn+zLKtWdAI33
         +ez/cWp/zJ4AHBW++mBN87+zJuhrSREt/RsZBF0Ngw+IL2pIiLss8foB6F9LgebX4Qlo
         V5xfvh/mH+5yQc7mSBOSyEyrvC62i1zR0BNZQn5oaaG9UohyOYJXZo4FoBVfNm9ibhr+
         F0VyzAnAoHxbYUwbaMamGkmU1glD+HSIi/S2C1QluiyEgTyr2Jfps7AK3w9kzxXbf73m
         Mnx1gOpMWPaloZcKbwKoYHVYCBV+/f0qMXlDdflM1p6eTiXkvnU7P4j31N6cKswjUtgN
         cyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=XSwfAX12pvhFNePXZ7rtFYZ1OhT7Wk78oZjNAPHovWc=;
        b=zGLwhS1RS4UhMYU1dWWpUAjsxxCOL/eIXkc5yn8CYHdHWQevHYdqgoaJbyY7ecTvUZ
         KuOXRu2kyrwshEWvEwaoxAIOlUat++g+262ffvv50Qzi2BbLI3E2VmswAuI6LJW0VeeB
         6vMOWav/8RxnZptjBrs4p/Mm8w4x09AkIGMs60DT1OuPmKqZ8iXUoTLgA6fZ4Q/NfMYr
         1MZvU6FHWGQ0z6x06x9FMaLcd5VBMv9cckqTa1cV97jxsHXOMxVO7ZoqSpjxvhK/09vp
         oQJUeE0EVwR9you2DJZoHA9EAs3iujD9xXaT6Q+lYUOUKhUNlnNd5+eJwvj3r57QnoNV
         UoHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="NgmYLZF/";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VvK65OGe;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qvTzLGAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42-v6si3420715qvf.139.2018.07.27.02.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="NgmYLZF/";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VvK65OGe;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qvTzLGAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTP-0004cj-Il
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSe-0003ZR-6V
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006BE-F3
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:00 -0400
Received: from greensocs.com ([193.104.36.180]:47525)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSZ-00069K-1M; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 8D91844A0FE;
	Fri, 27 Jul 2018 11:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685290;
	bh=WZVYUk5e9FgMbKjFEeWXbGta6Qxx+9ye+Ey0gO/42s4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NgmYLZF/43UUIa4qV/Oik5R8go6XvUnCceEXjjmIVF3e3vjpVX7y36aBEWGfr+nLR
	QI+nPrzmWXKvMb+tb9gZ9QSYWJ120vNa0qx8sItBHT+zkRya3FZmcRgO2hrhENIbeL
	axk1s+Nqe6MUIMBVteD+mFMOAc9PjlZijaz+YoeM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VvK65OGe;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=qvTzLGAj
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOmBRSCSPms6; Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 22F7E44355C; Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685288;
	bh=WZVYUk5e9FgMbKjFEeWXbGta6Qxx+9ye+Ey0gO/42s4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VvK65OGezA1+n0/k0PfI48+tdonz1dHQBcYbxfQh9KvSnJct4lDmYzFiDl2cLZPjE
	sB+SAJL0GbeCNKzhGHK1Hbq8YRdnGvPvgjn0eJxhpRghvkmRdDzEo4IVSQakXoHoJu
	KojWoPUpJxyiAIpeN1bu6Y86SW8stwfZlIPx6MEE=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B2D024434A7;
	Fri, 27 Jul 2018 11:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685287;
	bh=WZVYUk5e9FgMbKjFEeWXbGta6Qxx+9ye+Ey0gO/42s4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qvTzLGAjgVtY3Yq0x/fvwy8VJqrVXjKPmfBgGwoMQ88j5puE1Xn984j71+mZvU/zq
	28vtLas1xgi8La8l5gquPLF5EPo4KJ80IH1Rl+tnMk0lauaRkiBLxaBiXqR5yF5zSV
	XuGUr27mnD72zpAlt67/5U8q9sds8KEIA+WR7U+k=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:14 +0200
Message-Id: <20180727095421.386-14-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 13/20] intc/arm_gic: Implement virtualization
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
X-TUID: r8eL7sPBDJ9+

Implement virtualization extensions in the gic_cpu_read() and
gic_cpu_write() functions. Those are the last bits missing to fully
support virtualization extensions in the CPU interface path.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 3cddf65826..0e1b23047e 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1399,13 +1399,16 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         }
         break;
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
         } else {
             *data = s->apr[regno][cpu];
@@ -1415,11 +1418,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
     case 0xe0: case 0xe4: case 0xe8: case 0xec:
     {
         int regno = (offset - 0xe0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2 || !gic_has_groups(s) ||
-            gic_cpu_ns_access(s, cpu, attrs)) {
+            gic_cpu_ns_access(s, cpu, attrs) || gic_is_vcpu(cpu)) {
             *data = 0;
         } else {
             *data = s->nsapr[regno][cpu];
         }
         break;
@@ -1450,11 +1453,12 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
                 return MEMTX_OK;
             } else {
                 s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
             }
         } else {
-            s->bpr[cpu] = MAX(value & 0x7, GIC_MIN_BPR);
+            int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+            s->bpr[cpu] = MAX(value & 0x7, min_bpr);
         }
         break;
     case 0x10: /* End Of Interrupt */
         gic_complete_irq(s, cpu, value & 0x3ff, attrs);
         return MEMTX_OK;
@@ -1467,15 +1471,18 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         }
         break;
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
             s->apr[regno][cpu] = value;
         }
@@ -1486,10 +1493,13 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         int regno = (offset - 0xe0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2) {
             return MEMTX_OK;
         }
+        if (gic_is_vcpu(cpu)) {
+            return MEMTX_OK;
+        }
         if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
             return MEMTX_OK;
         }
         s->nsapr[regno][cpu] = value;
         break;
-- 
2.18.0

