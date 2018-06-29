Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730455wrq;
        Fri, 29 Jun 2018 06:31:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfAItAH4JDau9jhE/Fx743HuXEGEL6VN9Af34HaAkLTZYU4Ms2+022HGaUabti6M+4ndNyj
X-Received: by 2002:ac8:3908:: with SMTP id s8-v6mr13666356qtb.47.1530279099253;
        Fri, 29 Jun 2018 06:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279099; cv=none;
        d=google.com; s=arc-20160816;
        b=Nmj5HCVISvvgmdMlm2omxyN9qP7zE2o6cgBLg3FgEl34u8e0LMVSvkq0uiLkPL9jiR
         1m/44w79YWnkp6oNjvqTFy1vTLiIVUYyf8zVYC+BUCBH2QSvDKtEefO1gpI5DyNqYCsN
         dtigTAd7mrSgXQKZQeTfZtsVJVP182s0t/oBBogpUt0EptDrRK0WwFOqDs6FAY67+/3A
         CWS70TK+oDd22hrhFDxATmYCv4ZxLHf1BZr3We2YOU+Z6RtZGOsPeBZ4dbJp3QxsgGIx
         Mz0eRt4R8JaBYtdpyko9m0S8L3LEiPSWzlJFabFxQClrFri0L6/472Esy0rcQNiusZnQ
         1b9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=HfYD0tQwyub4vwiMOKoRBYhIu4UlxmlTpiCakDOD0AI=;
        b=FHgRcXpNtQpaYWTVaPsWoN+SH5SFU8GtCbuKD5mb+Ncp879ovLw7jixc+haryRv5W6
         j9SL5lxnE+vBPRCCjQCILPPeN5G7EwRT2urYai4Q2DIN+L9SpoJgXQTGhfsKuhSL7oxm
         hXKZKWec0KVSiiCRVhv6teXkDIdrn3Ekf6FWQzFZpEHNpH0jJb4B5zqBlsszEImSGdrt
         4iKVeC1DWCFDwFVtEKpt2JpZFYr99pa7QRzmbGVAglHASXQKQ7GkhvZj3gyBAqePytHQ
         L9Y0ydCkAJ0NNPoVwMh5JuUhgvtHeIqMVK7UKMzRx1QseEuW0yQ+Lnbn7SnvIdMlGpfW
         OcAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3ZVRxGjH;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=NIDCPo9b;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=NIDCPo9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4-v6si915734qtc.217.2018.06.29.06.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3ZVRxGjH;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=NIDCPo9b;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=NIDCPo9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUw-00088Y-Oa
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU6-0007Zx-V3
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU1-0006lP-Ut
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:46 -0400
Received: from greensocs.com ([193.104.36.180]:58556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU1-0006ZW-Hr; Fri, 29 Jun 2018 09:30:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5C0244434A8;
	Fri, 29 Jun 2018 15:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279033;
	bh=TdGBrby7ZaADHouw741lqsKN651TGqhh73IC/wV93IQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=3ZVRxGjHCw68Ao3L73+mmGE/w1TIx92kBREqQCoE5rGF1Dd4UUKCDe8aCgrMbdMVr
	jSyLTVqfEscgfdPd+KsvjkqgARJYmi6ZDmyuADzlMp0hjBJ48/qHwfMe7KKIuoScOL
	kcdj4rug0nMRMUb6CqgTPn1ckJB+o1tq51zCZrMw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=NIDCPo9b;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=NIDCPo9b
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFqtDAI3VovY; Fri, 29 Jun 2018 15:30:32 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id CD7D04434AC; Fri, 29 Jun 2018 15:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279031;
	bh=TdGBrby7ZaADHouw741lqsKN651TGqhh73IC/wV93IQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NIDCPo9bHh3mwDjjOMvPb8ycMCOynRdutHljj6YTkFj6JdhuGzCrJnb1Pya+GcKjZ
	+aWj2NQ+8JSFgsh4QsOQ996A79m4Pb1wic3fPTDe0nAmEjuEgU/Ap7e8bihlu+mkMN
	yAVuzMDwZ8xugPjsSi/H7p9dRBYBNCw5fcS55d6Y=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 64893443496;
	Fri, 29 Jun 2018 15:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279031;
	bh=TdGBrby7ZaADHouw741lqsKN651TGqhh73IC/wV93IQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NIDCPo9bHh3mwDjjOMvPb8ycMCOynRdutHljj6YTkFj6JdhuGzCrJnb1Pya+GcKjZ
	+aWj2NQ+8JSFgsh4QsOQ996A79m4Pb1wic3fPTDe0nAmEjuEgU/Ap7e8bihlu+mkMN
	yAVuzMDwZ8xugPjsSi/H7p9dRBYBNCw5fcS55d6Y=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:37 +0200
Message-Id: <20180629132954.24269-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 03/20] intc/arm_gic: Remove some dead code and
 put some functions static
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
X-TUID: ys694K8wCQEg

Some functions are now only used in arm_gic.c, put them static. Some of
them where only used by the NVIC implementation and are not used
anymore, so remove them.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c      | 23 ++---------------------
 hw/intc/gic_internal.h |  4 ----
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 3b299e37cc..6bed3d3e0b 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -71,7 +71,7 @@ static inline bool gic_has_groups(GICState *s)
=20
 /* TODO: Many places that call this routine could be optimized.  */
 /* Update interrupt status after enabled or pending bits have been chang=
ed.  */
-void gic_update(GICState *s)
+static void gic_update(GICState *s)
 {
     int best_irq;
     int best_prio;
@@ -137,19 +137,6 @@ void gic_update(GICState *s)
     }
 }
=20
-void gic_set_pending_private(GICState *s, int cpu, int irq)
-{
-    int cm =3D 1 << cpu;
-
-    if (gic_test_pending(s, irq, cm)) {
-        return;
-    }
-
-    DPRINTF("Set %d pending cpu %d\n", irq, cpu);
-    GIC_DIST_SET_PENDING(irq, cm);
-    gic_update(s);
-}
-
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
                                  int cm, int target)
 {
@@ -565,7 +552,7 @@ static void gic_deactivate_irq(GICState *s, int cpu, =
int irq, MemTxAttrs attrs)
     GIC_DIST_CLEAR_ACTIVE(irq, cm);
 }
=20
-void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
+static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs a=
ttrs)
 {
     int cm =3D 1 << cpu;
     int group;
@@ -1456,12 +1443,6 @@ static const MemoryRegionOps gic_cpu_ops =3D {
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
-/* This function is used by nvic model */
-void gic_init_irqs_and_distributor(GICState *s)
-{
-    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
-}
-
 static void arm_gic_realize(DeviceState *dev, Error **errp)
 {
     /* Device instance realize function for the GIC sysbus device */
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 6f8d242904..a2075a94db 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -75,11 +75,7 @@
 /* The special cases for the revision property: */
 #define REV_11MPCORE 0
=20
-void gic_set_pending_private(GICState *s, int cpu, int irq);
 uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
-void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs);
-void gic_update(GICState *s);
-void gic_init_irqs_and_distributor(GICState *s);
 void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
                            MemTxAttrs attrs);
=20
--=20
2.17.1

