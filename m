Received: by 10.28.71.155 with SMTP id m27csp5216333wmi;
        Wed, 4 Apr 2018 12:15:31 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48bWmtVOpCJWvMywUl8iRksqi7TSOmfNqjDonLjYfhdH5XT8L6Wj1Esign5PcOyT4u+x9c0
X-Received: by 10.200.81.152 with SMTP id c24mr1568554qtn.316.1522869331145;
        Wed, 04 Apr 2018 12:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522869331; cv=none;
        d=google.com; s=arc-20160816;
        b=Veu8hEyRWvJDQfiO5hOsY/8MiWKkLhE4HrSEFELcVV+J9vTKFFQf5QL9cq6n6H4cQX
         pX2k+zvMGagkN2Z0rpkLPm6uDZHiLealElNgShUNQ3aV0w8v4TtLwv9nzM5kHIY5hRi4
         2yf+/3C0MqzzSPB8X/Nltfs6ReKFvCHc0DCLoz0dO3h7enPlMwTWJD3kL+J3Ftaw9sPb
         O0omZdXA/IigXL8og7CJHoTRybhInW6HanfvU5eXg5z8aSqU/bVrsYtGg8zeSEWLrjRI
         PLp6ea43z4tmUzSc057IC5pyQG4WVL+1M48UhEeHAx4yIr6PWpDncurcP5l0fBE6TVTY
         Hl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Wjj+rIJg8seXZOBg/4IaRwlFxF+bYS3wzjpFMQsMtiI=;
        b=tl9QZF933PY1SYHMQEWAiEYO5y3do1vL+DjDdJaXCyCxNT2jk4IVCjDFn4GOTNZNni
         H320qzzOfGr+pg7RgCRrm3KGNyM1dy3rzypQ6kco9WWfo69u9TPTkJZ8oItxt3Jks+zB
         Ak7+tagnS2R5ymwSGAe1QhbwSxb9FZFb94xDpKeoDFWy5kSrKBvyXUZRtjOGEWKo2+Nu
         BYfABaghmz9hQUEgANdUbBpqcqKvAZVoMgpPza8Okxa9hZTISF6wKFBejgHuOwj+SVxY
         OefINiKUwYzO+uPhf31tEzlGSZw5xcwundAbzvEyAUTTSS70umEk2noNGooZEr939Hex
         8MMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6si2788831qke.190.2018.04.04.12.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 12:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3nsY-0003eF-Ke
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 15:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f3nsQ-0003d8-GF
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 15:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f3nsL-00016q-Af
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 15:15:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49154 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1f3nsL-00015R-7A; Wed, 04 Apr 2018 15:15:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81D5D406E8BD;
	Wed,  4 Apr 2018 19:15:12 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5ED8A2166BAE;
	Wed,  4 Apr 2018 19:15:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Wed,  4 Apr 2018 21:15:06 +0200
Message-Id: <1522869306-17292-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 04 Apr 2018 19:15:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 04 Apr 2018 19:15:12 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.12] hw/arm/integratorcp: Don't do things
 that could be fatal in the instance_init
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9OCz8kloCPZ

An instance_init function must not fail - and might be called multiple times,
e.g. during device introspection with the 'device-list-properties' QMP
command. Since the integratorcm device ignores this rule, QEMU currently
aborts in this case (though it really should not):

echo "{'execute':'qmp_capabilities'}"\
     "{'execute':'device-list-properties',"\
     "'arguments':{'typename':'integrator_core'}}" \
     | arm-softmmu/qemu-system-arm -M integratorcp,accel=qtest -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
RAMBlock "integrator.flash" already registered, abort!
Aborted (core dumped)

Move the problematic code to the realize() function instead to fix this
problem.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/integratorcp.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index e8303b8..9e2df34 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -266,7 +266,6 @@ static const MemoryRegionOps integratorcm_ops = {
 static void integratorcm_init(Object *obj)
 {
     IntegratorCMState *s = INTEGRATOR_CM(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     s->cm_osc = 0x01000048;
     /* ??? What should the high bits of this value be?  */
@@ -276,20 +275,28 @@ static void integratorcm_init(Object *obj)
     s->cm_init = 0x00000112;
     s->cm_refcnt_offset = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 24,
                                    1000);
-    memory_region_init_ram(&s->flash, obj, "integrator.flash", 0x100000,
-                           &error_fatal);
 
-    memory_region_init_io(&s->iomem, obj, &integratorcm_ops, s,
-                          "integratorcm", 0x00800000);
-    sysbus_init_mmio(dev, &s->iomem);
-
-    integratorcm_do_remap(s);
     /* ??? Save/restore.  */
 }
 
 static void integratorcm_realize(DeviceState *d, Error **errp)
 {
     IntegratorCMState *s = INTEGRATOR_CM(d);
+    SysBusDevice *dev = SYS_BUS_DEVICE(d);
+    Error *local_err = NULL;
+
+    memory_region_init_ram(&s->flash, (Object *)d, "integrator.flash", 0x100000,
+                           &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    memory_region_init_io(&s->iomem, (Object *)d, &integratorcm_ops, s,
+                          "integratorcm", 0x00800000);
+    sysbus_init_mmio(dev, &s->iomem);
+
+    integratorcm_do_remap(s);
 
     if (s->memsz >= 256) {
         integrator_spd[31] = 64;
-- 
1.8.3.1

