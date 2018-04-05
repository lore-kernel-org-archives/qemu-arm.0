Received: by 10.28.71.155 with SMTP id m27csp5659686wmi;
        Wed, 4 Apr 2018 22:34:57 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48PgUtf2tlCbmaMlJBFQmQeKbtmZ7zCTHWgGilMresSl3b3AXD1y7IW6nTuLW3Ldx0T40F/
X-Received: by 10.55.75.205 with SMTP id y196mr28906744qka.44.1522906497213;
        Wed, 04 Apr 2018 22:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522906497; cv=none;
        d=google.com; s=arc-20160816;
        b=C93smAPPIKf9yOExYoZX7DXP7plLMBtHa5/kGoYRdkzH71ucO3AN7l/ZYpqLhoc7Pm
         7V1zZ0o2vI0yLYWNvv8ANpTaOt2iNKluuY0rcLriLlpr+k7JygOl8JqFFyDFqsefd7ps
         ut63iM1fTvhQXSxZwe/R1yEEJuFnsrgFFB2jJCV4Z2HaSAw3JB5OPQ12KYuPhfDIHiSS
         Qatfncwa1KM9A6AT3ThDF716wYJCc5i71GgMrUcii5u8gqMmDo9c5nb0w2b2IEJ7SOQx
         smyl54Jkn6Z6YxZ2irS/tkKBMviiYUup3y9h0LhGff5X8KpJNkn7qK2YmyBW8L2Rhhgt
         Prtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=kj/aW95hCAFb/x9nq0Omti7yBd47ZBnhfOth640oDBE=;
        b=mrWgkkw8rXkQwf9idnLUphUo7YL1sEfH7enA/ScCWrK8a3pAsxBsffhYy4MfUrwV42
         uCWG4GL3CC+HfzYTqveSP5YqRmUh5IxOvnsRre4RZaM70EzVRViDI05AMQPOzyF0nUil
         DhazuYDNXF2Bqp1QXNJjyW8FnwzRq72gXSzhole0OmXM6khPcYMQhpSNYOT0af3wTDT/
         NRB3aGKgD6lMUwCFfAG1hFtrCEjB7RtoJF+z4iyxVtACpTQsDFr0L+np7mTpnJj5DDUv
         dhSmfOG03d2lU+61SFnglMskwp/lzjt7UOG/xjFUmvq9tNvcIFgMi2GMwjKesTQvsU7g
         J8zw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 139si7740788qkl.61.2018.04.04.22.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 22:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3xY0-0002je-Pf
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 01:34:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f3xXr-0002iB-Ff
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 01:34:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f3xXo-0005l1-Ak
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 01:34:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44482 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1f3xXo-0005kn-56; Thu, 05 Apr 2018 01:34:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB082401518B;
	Thu,  5 Apr 2018 05:34:39 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-84.ams2.redhat.com [10.36.116.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA1CA50332;
	Thu,  5 Apr 2018 05:34:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu,  5 Apr 2018 07:34:33 +0200
Message-Id: <1522906473-11252-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 05 Apr 2018 05:34:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 05 Apr 2018 05:34:39 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2] hw/arm/integratorcp: Don't do things that
 could be fatal in the instance_init
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
X-TUID: 0cWNogFxFWg0

An instance_init function must not fail - and might be called multiple ti=
mes,
e.g. during device introspection with the 'device-list-properties' QMP
command. Since the integratorcm device ignores this rule, QEMU currently
aborts in this case (though it really should not):

echo "{'execute':'qmp_capabilities'}"\
     "{'execute':'device-list-properties',"\
     "'arguments':{'typename':'integrator_core'}}" \
     | arm-softmmu/qemu-system-arm -M integratorcp,accel=3Dqtest -qmp std=
io
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
RAMBlock "integrator.flash" already registered, abort!
Aborted (core dumped)

Move the problematic code to the realize() function instead to fix this
problem.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use "OBJECT(d)" instead of "(Object *)d"

 hw/arm/integratorcp.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index e8303b8..58b40ef 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -266,7 +266,6 @@ static const MemoryRegionOps integratorcm_ops =3D {
 static void integratorcm_init(Object *obj)
 {
     IntegratorCMState *s =3D INTEGRATOR_CM(obj);
-    SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
=20
     s->cm_osc =3D 0x01000048;
     /* ??? What should the high bits of this value be?  */
@@ -276,20 +275,28 @@ static void integratorcm_init(Object *obj)
     s->cm_init =3D 0x00000112;
     s->cm_refcnt_offset =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUA=
L), 24,
                                    1000);
-    memory_region_init_ram(&s->flash, obj, "integrator.flash", 0x100000,
-                           &error_fatal);
=20
-    memory_region_init_io(&s->iomem, obj, &integratorcm_ops, s,
-                          "integratorcm", 0x00800000);
-    sysbus_init_mmio(dev, &s->iomem);
-
-    integratorcm_do_remap(s);
     /* ??? Save/restore.  */
 }
=20
 static void integratorcm_realize(DeviceState *d, Error **errp)
 {
     IntegratorCMState *s =3D INTEGRATOR_CM(d);
+    SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
+    Error *local_err =3D NULL;
+
+    memory_region_init_ram(&s->flash, OBJECT(d), "integrator.flash", 0x1=
00000,
+                           &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    memory_region_init_io(&s->iomem, OBJECT(d), &integratorcm_ops, s,
+                          "integratorcm", 0x00800000);
+    sysbus_init_mmio(dev, &s->iomem);
+
+    integratorcm_do_remap(s);
=20
     if (s->memsz >=3D 256) {
         integrator_spd[31] =3D 64;
--=20
1.8.3.1

