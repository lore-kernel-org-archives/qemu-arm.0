Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649707wrq;
        Sat, 14 Jul 2018 10:17:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdap+qT3DEusd4TAMIVzhyRGTuW39nteMjxIOogNdFW3wUDnq6ibpmCwYU0iaActVacsNBn
X-Received: by 2002:a0c:a281:: with SMTP id g1-v6mr11864039qva.60.1531588632483;
        Sat, 14 Jul 2018 10:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588632; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9meaenO/SX4I5WrmIv2A5RWwWulWKCkZOYr4oghWwIeITiQw3ffUHeYmzqLQvgYG7
         zUgefYYRGaZq6VoInMDPhWqKeg8UxR/Zz+E6SUEpxBbThRY7DZHKTZ6qpNKoUGaN/udk
         sv8CSqbxKQNbnTu+sZBMMgslXHrCHlM8EQz5QpEPCO2atWINvQUTbUsN3Y9LQFJKzYkB
         Xt2VnWTIzIn5hOJOoz8fAJryQTkJJbFI+Y8untimyveIRo753q9CKGBM8Cevey/CD7cy
         AXVAxHQg3KACAYwLsVFq7pm6uC8EFpVKHct5gemPyz/tW2egJ+PnNiaRaPKUj3MIx4Md
         ouuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=r/ZNjY1RX0cCC7KlefrKh/nos3ZnSSp+FtoHHvI9QIk=;
        b=sxzdNeBbHZX3NtRUWG8JG9bPtt6T337rW/Xz514rPOdvC6Jka3Rc+JFZN3jEA+GK7q
         0o+RGoPzwnLofIBoRmSfjknpDRaHydX+AjuJOjbNZiQY7ff2XWqz2dMCtxlkXrg67YWM
         3HDXDgvZpQvei8/RZiW2zRzYqA4I6CbSu6vM07viC/Qc958soXxvsvzyz3Xuzay+gbC4
         M7YbN8TrqU5fB/Yu2rMJGXPPUn89EAUoRTb3rhU2UysKq29Rr6/AIvZ7EZ8+TLa/wMoV
         zGDjkD+5o7IyxbokQWMOVTkZ5JwdHwZUvDpneKzP04DYXUrd+k72aMFXlqflWlW2uhoh
         2k1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wt4RSS8l;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=5d+5xGjZ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=5d+5xGjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9-v6si65419qtk.14.2018.07.14.10.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wt4RSS8l;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=5d+5xGjZ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=5d+5xGjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAR-00066k-Vo
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0005k5-8h
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004Py-30
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:30 -0400
Received: from greensocs.com ([193.104.36.180]:57253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9i-0004MP-OK; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9BCD5C7FA2;
	Sat, 14 Jul 2018 19:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588578;
	bh=m9WDuVhJ8xqlUr5PbtNbOeZfVH9fE/HRNe6eO4F6f3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wt4RSS8lT65ZpoUKFBkpvCnbBNOEzJn7CHz7zkfC2GykoQqucFefIZNfYBiHy3sM/
	65Ry5TDxCAHdy2hgcHLgVOqzlM8rPAv6ZSvn2NdWpx0UYcNExYC0hhGHnbjRqETuZq
	3hoWaQ/2UgSaGWxy7WlIzmcdYEb6pjb3gZk9r/Z0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=5d+5xGjZ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=5d+5xGjZ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id if4eSR_Bzi6J; Sat, 14 Jul 2018 19:16:17 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 8D73DC7AE3; Sat, 14 Jul 2018 19:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588577;
	bh=m9WDuVhJ8xqlUr5PbtNbOeZfVH9fE/HRNe6eO4F6f3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5d+5xGjZdsTlOMqUiP3BH5ar3nJ0WbcBY3fprTvrciwTtf6asLAyd9mLIBOwjGQQU
	ieGqvcaxsUbPHVLnkGFusFP0xd0RcYEkmGjbTD3NNxDBXWijI8/rl8XY3OEtOokoms
	MJL7aJI1pzi74LvKI/4CBkVwCE7zlMeIIlVvQfYo=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D8D84C7ADD;
	Sat, 14 Jul 2018 19:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588577;
	bh=m9WDuVhJ8xqlUr5PbtNbOeZfVH9fE/HRNe6eO4F6f3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5d+5xGjZdsTlOMqUiP3BH5ar3nJ0WbcBY3fprTvrciwTtf6asLAyd9mLIBOwjGQQU
	ieGqvcaxsUbPHVLnkGFusFP0xd0RcYEkmGjbTD3NNxDBXWijI8/rl8XY3OEtOokoms
	MJL7aJI1pzi74LvKI/4CBkVwCE7zlMeIIlVvQfYo=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:44 +0200
Message-Id: <20180714171601.5734-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 03/20] intc/arm_gic: Remove some dead code and
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
X-TUID: +ui6TtojYDTV

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
index accc03523b..9fe70e5519 100644
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
@@ -1472,12 +1459,6 @@ static const MemoryRegionOps gic_cpu_ops =3D {
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
2.18.0

