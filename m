Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4345337wrp;
        Tue, 24 Sep 2019 13:18:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxY16AHRpHngMFVQ5ZjfWoBIhDYNpQJyoSYpI7zMdl2aQrqt99YQGoVrRt+Ys/gpkj8UE1W
X-Received: by 2002:ae9:e30a:: with SMTP id v10mr4580657qkf.369.1569356324154;
        Tue, 24 Sep 2019 13:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569356324; cv=none;
        d=google.com; s=arc-20160816;
        b=tPIAcazwgAdx+pRI7FgyPN24dMJ7VS8Qy7bnG2a3MYIhTgz2hVSJf/4i86i0bHBgan
         e/2z6/oeD6SdCDXbWk7uG6rEhpSdezrqpLdwNfIGAt1/Jsyg97mHnWvCjP/30m/2zmVn
         LD+AQNaBC0qt7WUgOo6im4m2yTQOAcZSTVMmI0a2/qRkDJO7HNK5DSjfSRI+s1WHzUWG
         kThHGuGxSfPkH1wmVhe+TZQGNgLlwqkOoWhkpE940I2RLtLr7rrrUIGiGnxSMYwGPS/d
         UkBgtELhDhTUDfZy+x3D+gPHZXqPQy2aXvnjjC/U5wxFXe51b1IB6zL3ahc7cYipKRFJ
         KF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=GesJ1A3laJLB/rELlHIFbZOxojXT+rkL2jCmzpqEKxs=;
        b=nRsTv0NK4F+NlC0BkONHQFK1hm2IIoEpR9gTPYydM0SnTJN9aRMsYCtNj06Fy/PFL4
         ChKvo21S9RtfE5G2ipBODz8ANwmxv46B/P/nMA6hJqE8wKURa6C19Fab+88h2yQajQ1V
         sBWHQLuUA+DCpBcIXGwTKLndZoAqqtOcQEMBzKfxXwN2LrTWQN2G4hW/NMJq5BSCiGV0
         rFssrlI6ZrxJWGwha7/9DP0Hjsmle17bHPlh2QMAjyvsviNRaovLuUAU/g5YdNPP35w1
         9uVhjbheqWP5eCrr3sOb4Itj2CC/2I1CoWOKczU+QucIJRB7QuCI1cBOBjeb7nAqknLv
         rG4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s34si2102732qtk.59.2019.09.24.13.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 13:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCrGk-00016r-Cc
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 16:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr8B-0000XH-0R
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr89-0002sT-Eq
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:38058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr89-0002rN-3b; Tue, 24 Sep 2019 16:09:49 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr87-0001Mk-TL; Tue, 24 Sep 2019 23:09:47 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/25] ARM TCG CPUs: Fix error_append_hint usage
Date: Tue, 24 Sep 2019 23:08:45 +0300
Message-Id: <20190924200902.4703-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924200902.4703-1-vsementsov@virtuozzo.com>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, vsementsov@virtuozzo.com,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RoR7CZ0MvE4o

If we want append hint to errp, we must use ERRP_FUNCTION_BEGIN macro.
Otherwise hint will not be appended in case of errp == &fatal_err
(program will exit before error_append_hint() call). Fix such cases.

This commit (together with its neighbors) was generated by

git grep -l 'error_append_hint(errp' | while read f; do \
spatch --sp-file scripts/coccinelle/fix-error_append_hint-usage.cocci \
--in-place $f; done

and then

./python/commit-per-subsystem.py MAINTAINERS "$(< auto-msg)"

(auto-msg was a file with this commit message)

Still, for backporting it may be more comfortable to use only the first
command and then do one huge commit.

Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/arm/msf2-soc.c | 1 +
 hw/arm/virt.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 008fd9327a..21e4bdfb72 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -85,6 +85,7 @@ static void m2sxxx_soc_initfn(Object *obj)
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
 {
+    ERRP_FUNCTION_BEGIN();
     MSF2State *s = MSF2_SOC(dev_soc);
     DeviceState *dev, *armv7m;
     SysBusDevice *busdev;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d74538b021..e79a46b0b3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1793,6 +1793,7 @@ static char *virt_get_gic_version(Object *obj, Error **errp)
 
 static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
 {
+    ERRP_FUNCTION_BEGIN();
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
     if (!strcmp(value, "3")) {
@@ -1825,6 +1826,7 @@ static char *virt_get_iommu(Object *obj, Error **errp)
 
 static void virt_set_iommu(Object *obj, const char *value, Error **errp)
 {
+    ERRP_FUNCTION_BEGIN();
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
     if (!strcmp(value, "smmuv3")) {
-- 
2.21.0

