Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4911441wrq;
        Tue, 19 Jun 2018 02:31:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIc4Ywad+LFg9vs+mrGQ92Ll0zNl0Pdl2b5SirfWikpf5ATU/pCpbaSknBoLSJFamiLqPcG
X-Received: by 2002:a37:9bd8:: with SMTP id d207-v6mr13479624qke.254.1529400717425;
        Tue, 19 Jun 2018 02:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529400717; cv=none;
        d=google.com; s=arc-20160816;
        b=fs+/1U6ab/mdpPjW/8N3Y07261iYwwJe2VdU2n/9rPrewUmv2gV702Wk3n8STwtND8
         0O02xavWEXTduEgwCXe9+f3m7EEq0XFrqsPCEgXV087V7AFOrQ4X/kSwyiAVJJEXr8PN
         2xOSvPSOQ1IGPFIJ8kcAqTijcPojnP5qxkPNysrzNr/FFBv7wuovv7mhb7QyV8fb7LF3
         wOcx4wAQjBFFm2mSL6qY4ETxOrIky/fJAVY4c3lVblHghSlWc8OXRWtd4ZgWAuQga2ub
         8s/WqNdPax5tjMCVy+da8JLRZxXyk1fCuQndE84QSOmXPeW4vmLuOUCAo+pfvqJQhobx
         y+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=SDXZtczOyiW8nFs2pqNO8cdWpMHd2wtRaUED/g8Yj/c=;
        b=foWD+Kgfxrn9bJTbNGQOiExzwsX7tUeoBMNgyZKzGFKmqVKzgvcZRuW2fkAHIT+Zcr
         bBWbDn2oYHb6sjEgKfgfpVDoQ9A4XBYSgOPRTsLhJJJnZH8DwFHsooGPXuIKCjWJ8zOR
         8ngYB1juSyszWTvh1t2PlrlL+2ceYM7DaCvXJl0PA8SE63ckR+Y+b8nGmUMtI5CJG/2x
         hljEcm27dgjbBKXE7/DnZ0Ozrg+4/9ByZc4yxL0xHz+jj9UZb4kRMNQaoH9Na+DwBDu3
         Oxazz9S5snbthUU4GHviRGrxOsyAIBqfywSqb5jieKfKOFyPGS1jx8YDeBM/jZ2v2QNe
         /gHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1LCmejfw;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=H34ZqZjm;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=H34ZqZjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 49-v6si1483947qvw.269.2018.06.19.02.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 02:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1LCmejfw;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=H34ZqZjm;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=H34ZqZjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVCzU-0005QI-Ps
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 05:31:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzG-0005Pk-6H
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzB-0006GG-7J
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:42 -0400
Received: from greensocs.com ([193.104.36.180]:42313)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fVCzA-0006Fh-Qc; Tue, 19 Jun 2018 05:31:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id EE9ED44B87E;
	Tue, 19 Jun 2018 11:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400689;
	bh=QAiHdMUUGM+uZvt6osVtWsJ4ZkqGJwmAKC8OXgcBopk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1LCmejfwDBfo66Qc+EmB44APrOl0ap2G2vRg2ucpGAr0/Pk0z0n6vCzcdnzawny4v
	BtH7PSaRAMXW90WxA1v0ntCHmmZwmsnZaiCEbfnAC+w0o3BD3dfIHxQhKbd6ksgeaz
	gHmjk3V3MbI1JrzhwCQue/p4XRrpiGZlxfNOFWTw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=H34ZqZjm;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=H34ZqZjm
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YIoNxRn9VUJ4; Tue, 19 Jun 2018 11:31:28 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id EE0F744B864; Tue, 19 Jun 2018 11:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400687;
	bh=QAiHdMUUGM+uZvt6osVtWsJ4ZkqGJwmAKC8OXgcBopk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H34ZqZjmQ7qUK2iU6PySpU7XEtm18Ua8GZkhis2UNwX3vK4MvqSTuzEf/7Zx33C6i
	J8rQtROa/DZPvSasdAGuM20861plTKEHGevCahtpxk5IgY4Dzx5DCq2DcibLenN5Tv
	ZMuwTWNATux6yHR+GgNPVaLPijDI+oKnCsx+hUQs=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9B49D44B873;
	Tue, 19 Jun 2018 11:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400687;
	bh=QAiHdMUUGM+uZvt6osVtWsJ4ZkqGJwmAKC8OXgcBopk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H34ZqZjmQ7qUK2iU6PySpU7XEtm18Ua8GZkhis2UNwX3vK4MvqSTuzEf/7Zx33C6i
	J8rQtROa/DZPvSasdAGuM20861plTKEHGevCahtpxk5IgY4Dzx5DCq2DcibLenN5Tv
	ZMuwTWNATux6yHR+GgNPVaLPijDI+oKnCsx+hUQs=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Tue, 19 Jun 2018 11:31:19 +0200
Message-Id: <20180619093124.24011-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619093124.24011-1-luc.michel@greensocs.com>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 2/7] intc/arm_gic: Remove some dead code and
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
	Jan Kiszka <jan.kiszka@web.de>, Luc MICHEL <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9TfcEVKU5yjw

From: Luc MICHEL <luc.michel@greensocs.com>

Some functions are now only used in arm_gic.c, put them static. Some of
them where only used by the NVIC implementation and are not used
anymore, so remove them.

Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c      | 23 ++---------------------
 hw/intc/gic_internal.h |  4 ----
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 141f3e7a48..679b19fb94 100644
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
@@ -1418,12 +1405,6 @@ static const MemoryRegionOps gic_cpu_ops =3D {
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

