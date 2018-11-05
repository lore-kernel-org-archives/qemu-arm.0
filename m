Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2698140wro;
        Mon, 5 Nov 2018 07:13:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5cvpovknDJPTwUy/JHeNHWTP/RRFqgLrw44C4srXDm3rHnrz3minlbh41B+XlP2+1N3er1O
X-Received: by 2002:ac8:478f:: with SMTP id k15mr8078853qtq.281.1541430838740;
        Mon, 05 Nov 2018 07:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541430838; cv=none;
        d=google.com; s=arc-20160816;
        b=oQ1Esji3OPXQh4LpGRFz8i7kN6srXOzlSXWOo1Cx/8WprjtS86UmlBBKMz6uYEaEy7
         9W8OL32tW8olyHo7NfNHGQ2qczEVF89PFoV4p1Jdcg4fQ2fVqYobQ7SsHIknNND5U+zW
         /5PUECbiJ61PwWmihe0p8LiWfkF/noORf8nOlL5hLDdRu13c+cl+7MRdp/A3YiumhlP0
         vIEWhii1O12kI+hSIS+ZXGSmXRM5qg6F4ywcJtvNrM5f9+jENfL+RRXqP3OO2fTeNnT/
         0gemngdUnWClD6SiTkfvNXbi0iBiGG1gh/RbGGJEVoyGbgQZuoyKk8TqFP4cGTaUcCP8
         +LtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=KOH+SCAfduq0uFXDMHk05ZCfASxwmfBMLvhPu+KASTU=;
        b=xbwDnv473QKNmcPP5pGehRwWdcDpdi4l2z4088N8s8vlhDHAS9GkQoWx6OuvVNLdCN
         wGEReeQOLKHPTfbL4WNGOM/ZPzB6D+GnwXnWEAcylenT6XnzGZ6MkMw66QRTU/Ws+xAr
         9wOciUelObAMvlWPnKNKL2JmaDwiZ+T5P2rkCluKF8H+1OQcbAOzdrbFaY9n0GilU6wo
         G20LC9dhIJl6P9lspSt3NzKK22bnD1Sg1pC+nkN7kaLS/GYIVl7fnuZJrH00KfZvvS9e
         nGMGpARx/qjq57ULJVJqG/FvPg/UL2SyM2cdmT1FH2WsNhCXk6eIcq/7BKwLWSgtQTWs
         4MvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5-v6si17078960qtv.322.2018.11.05.07.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJgZh-0002bk-Kx
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:13:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gJgXV-0007qW-Ro
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:11:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gJgXT-0006Il-G5
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:11:41 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gJgXT-0005uO-5c; Mon, 05 Nov 2018 10:11:39 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gJgXP-0006MU-35; Mon, 05 Nov 2018 15:11:35 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 15:11:32 +0000
Message-Id: <20181105151132.13884-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.1] hw/arm/exynos4210: Zero memory allocated
 for Exynos4210State
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WRnggg2AAGXB

In exynos4210_init() we allocate memory for an Exynos4210State
struct. Generally devices can assume that the memory allocated
for their state struct is zero-initialized; we broke that
assumption here by using g_new(). Use g_new0() instead.
(In particular, some code assumes that the various irq arrays
in the Exynos4210Irq sub-struct are zero-initialized.)

In the longer term, this code should be QOMified, and then
the struct memory will be allocated elsewhere and by functions
which always zero-initalize it; but for 3.1 this is a
simple fix.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I suggested this fix the other day:
https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg00135.html
so here it is as an actual patch.

Probably we should go through other uses of g_new() in
board/device code at some point.

 hw/arm/exynos4210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 827318a0036..af82e955421 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -162,7 +162,7 @@ static uint64_t exynos4210_calc_affinity(int cpu)
 
 Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
 {
-    Exynos4210State *s = g_new(Exynos4210State, 1);
+    Exynos4210State *s = g_new0(Exynos4210State, 1);
     qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
     SysBusDevice *busdev;
     DeviceState *dev;
-- 
2.19.1

