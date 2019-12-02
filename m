Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12281143lfc;
        Sun, 1 Dec 2019 22:08:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1MQfaFVy2U2WlU9LOyAC5d1JUR/h3doiGT1+kN6sI8zTiwbeoIoqyqslOnLXbrpR2zyoA
X-Received: by 2002:ad4:5525:: with SMTP id ba5mr30266467qvb.117.1575266920787;
        Sun, 01 Dec 2019 22:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575266920; cv=none;
        d=google.com; s=arc-20160816;
        b=up1f6LCLT8pRMHL8wxcgqiH6U25XEwsg0fyd8dTeDmj2kxfQ7x4WN7c6JfxhayF2v1
         ItHdmKksPN+z233i8fgdk0RRTDPc+Vscm/iKZHnKzcu6htncBtCaQi5Fl+YfqBVjeSOz
         HdQ4WfR2mF90fhTWCz8cgcywBk7wiPeKqXGJ7BaihwwMaqsZXNIStiDsYIVH+z8dMCMd
         Jejxe2i9iu+qtv16lomTuKlgb/bpbLaKS83M9lkvqV+eP0xIOaH39Uu7XYiT/CduDJH3
         bD6TykH+poltAU6i8xABL17ZW4+axrj0h3RaVumuJnkzPolgDx6fwPkmBtxxvbnsFgsY
         zaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LVd/i8HW09e/vdFnL8QhLU0pyTvDK6DiGpY/Dul0znU=;
        b=zf9LVumNFXrvqMifyS1+7M76jhxGfe4956lgUJbe2JMKUgOb1PiBs4KzlP3wZsucsG
         tkZUsTBjejPDu9wvh7vdUbm5BGp/i9ACwkKbbeszfhAG3lE7PytVRpFsBB+rod68tmvS
         QEISJw0bq85FUufHKPDQnsaxQa1YN7URjNZL0QKMhpGx3Jn2fwUg2ooZc383fciV3mWp
         EuAz+uAuTvX3TfGxI7CPExqw5XPoaX5xabi984+9NA0QJFT42+dLyfZQbfKBx7OXLKzV
         QqnujsK6dlm+9cV4/0ZKUVCLV1k16wY+a47ku78JAm23h9ROm8uXn/trHccjhRxyW473
         xwTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au header.s=201602 header.b=bi3XDkPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si11821761qkm.275.2019.12.01.22.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2019 22:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au header.s=201602 header.b=bi3XDkPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibesy-0004W8-6h
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 01:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ibesb-0004Vo-RQ
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 01:08:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ibesa-00016R-9l
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 01:08:17 -0500
Received: from ozlabs.org ([203.11.71.1]:53979)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ibesZ-00016B-8u; Mon, 02 Dec 2019 01:08:16 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47RF621gLzz9sPL; Mon,  2 Dec 2019 17:08:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575266890;
 bh=USu8JlsY/OzHA2YhXxTPxDDMZBunzRsn+270mXy38Zo=;
 h=From:To:Cc:Subject:Date:From;
 b=bi3XDkPwIZaOws/HGq/oT54ob58swfTjE0sP4YauSYuvixDLssPVIE1tKsGEYBcMJ
 TcWo7VfXn6a1tbmIzSpeW44GVJQYIZBwLMVJhCGTzM4LoTpcrnMQExbq2XR7JCzJCt
 mcZ+GuU/2FAVchKJPlHlrdjXqvsBtUQzN/lAns/Q=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PATCHv3] exynos4210_gic: Suppress gcc9 format-truncation warnings
Date: Mon,  2 Dec 2019 17:08:06 +1100
Message-Id: <20191202060806.77968-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: i.mitsyanko@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 46UAegXzj5q7

exynos4210_gic_realize() prints the number of cpus into some temporary
buffers, but it only allows 3 bytes space for it.  That's plenty:
existing machines will only ever set this value to EXYNOS4210_NCPUS
(2).  But the compiler can't always figure that out, so some[*] gcc9
versions emit -Wformat-truncation warnings.

We can fix that by hinting the constraint to the compiler with a
suitably placed assert().

[*] The bizarre thing here, is that I've long gotten these warnings
    compiling in a 32-bit x86 container as host - Fedora 30 with
    gcc-9.2.1-1.fc30.i686 - but it compiles just fine on my normal
    x86_64 host - Fedora 30 with and gcc-9.2.1-1.fc30.x86_64.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Peter, up to you if you squeeze this in for qemu-4.2 or leave it until 5.=
0

Changes since v2:
 * Moved the assert outside the for loop using a trick suggested by
   Richard Henderson
Changes since v1:
 * Used an assert to hint the compiler, instead of increasing the
   buffer size.

---
 hw/intc/exynos4210_gic.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index a1b699b6ba..ddd006aca6 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -293,6 +293,7 @@ static void exynos4210_gic_realize(DeviceState *dev, =
Error **errp)
     char cpu_alias_name[sizeof(cpu_prefix) + 3];
     char dist_alias_name[sizeof(cpu_prefix) + 3];
     SysBusDevice *gicbusdev;
+    uint32_t n =3D s->num_cpu;
     uint32_t i;
=20
     s->gic =3D qdev_create(NULL, "arm_gic");
@@ -313,7 +314,14 @@ static void exynos4210_gic_realize(DeviceState *dev,=
 Error **errp)
     memory_region_init(&s->dist_container, obj, "exynos4210-dist-contain=
er",
             EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
=20
-    for (i =3D 0; i < s->num_cpu; i++) {
+    /*
+     * This clues in gcc that our on-stack buffers do, in fact have
+     * enough room for the cpu numbers.  gcc 9.2.1 on 32-bit x86
+     * doesn't figure this out, otherwise and gives spurious warnings.
+     */
+    assert(n <=3D EXYNOS4210_NCPUS);
+    for (i =3D 0; i < n; i++) {
+
         /* Map CPU interface per SMP Core */
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
         memory_region_init_alias(&s->cpu_alias[i], obj,
--=20
2.23.0

