Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1234665wrw;
        Tue, 6 Nov 2018 10:43:00 -0800 (PST)
X-Google-Smtp-Source: AJdET5foBNOTbICIr87c4EAWD0SXeOyHjbsA5PYyVCjrVYc49olktxACv8Z8qveJ1YsXUOPaGerx
X-Received: by 2002:aed:26a3:: with SMTP id q32mr14850738qtd.106.1541529780477;
        Tue, 06 Nov 2018 10:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541529780; cv=none;
        d=google.com; s=arc-20160816;
        b=lMg4Hi7qPWCSIi3XBEoCM2PaHKgp2eFJcfsperQ6lBS87kcezNZpZL92Ewnx72gxoT
         aMxBRe292ebadIHLrdu1nN6RBdTB8nK3IHnrXbf9DrqZ7Apyt5sE/uBX6CV06M/z93kr
         P1VED0EJT7KdhKddQDNg4o9ZSB3ycoweX0dhX69F5s0UAutvQWTs+HgzKgejQGrqXcoS
         fxZj5k/76S1tOHWvZwMxd8og3Y44rIzBrTjnleEnCpubkt/haxIiuR6V6rS0K5jgNynj
         rAXXkJTMuSZjw0V/Z3eyrFNKe02feMk6h1hkqh3kS0y8xbdAYmmzTk9Tu+1VWgp9ks69
         p3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=UtefBG0c07EGfU7bjUqyQEuoVWsyYYJaigJJWKGfvL0=;
        b=d7gmt9bmheT4sStI3q7/qoKwPq9wf8SOQrs5z6KlMqYhAcfHENQYYJ1J0VHz+t8C/a
         HI3zP2FpztuEcL8ZSLwaP6KC1fl+LcRmJi6SATytOjEfuvoIu3tmHtJ24C+xGvW+ZlK7
         H0yqJ4zWxdZ5zPKT/2yFKrWzjatsggloQubpah4APNvX0Uihmujrvko3kLXntOgP53ag
         92WDUz899frbIGHl9IYJQkOsd5AdRGJ+02zfRhJKbEpZ9vHr63nFVhUI7NJMFTfQ04YK
         Oddw6QloRfk1Fj9OyeCPdaze6DN6ajxE7VS1TBhpzsD9YDS/b+HNTAINGbsmJ1OK0Uhd
         VWSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d200si3405740qka.107.2018.11.06.10.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 10:43:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gK6JY-000830-0V
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 13:43:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gK6JP-000819-R0
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 13:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gK6JM-0003ac-Do
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 13:42:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47612)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gK6JJ-000308-3r; Tue, 06 Nov 2018 13:42:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C8113082E55;
	Tue,  6 Nov 2018 18:42:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED2D95C21B;
	Tue,  6 Nov 2018 18:42:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, geert+renesas@glider.be,
	alex.williamson@redhat.com, thuth@redhat.com, kraxel@redhat.com
Date: Tue,  6 Nov 2018 19:42:12 +0100
Message-Id: <20181106184212.29377-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 06 Nov 2018 18:42:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 for-3.1] hw/arm/sysbus-fdt: Only call match_fn
 callback if the type matches
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XiKab639RsPy

Commit af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with DT
compatible value) introduced a match_fn callback which gets called
for each registered combo to check whether a sysbus device can be
dynamically instantiated. However the callback gets called even if
the device type does not match the binding combo typename field.
This causes an assert when passing "-device ramfb" to the qemu
command line as vfio_platform_match() gets called on a non
vfio-platform device.

To fix this regression, let's change the add_fdt_node() logic so
that we first check the type and if the match_fn callback is defined,
then we also call it.

Binding combos only requesting a type check do not define the
match_fn callback.

Fixes: af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with
DT compatible value)

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Thomas Huth <thuth@redhat.com>

---

v1 -> v2:
- use "if (!iter->match_fn || iter->match_fn(sbdev, iter)) {"
  as suggested by Peter to avoid code duplication
- mention the ramfb regression fixed by this patch in the
  commit message.
---
 hw/arm/sysbus-fdt.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 0e24c803a1..ad698d4832 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -449,7 +449,7 @@ static bool type_match(SysBusDevice *sbdev, const BindingEntry *entry)
     return !strcmp(object_get_typename(OBJECT(sbdev)), entry->typename);
 }
 
-#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), type_match}
+#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), NULL}
 
 /* list of supported dynamic sysbus bindings */
 static const BindingEntry bindings[] = {
@@ -481,10 +481,12 @@ static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
     for (i = 0; i < ARRAY_SIZE(bindings); i++) {
         const BindingEntry *iter = &bindings[i];
 
-        if (iter->match_fn(sbdev, iter)) {
-            ret = iter->add_fn(sbdev, opaque);
-            assert(!ret);
-            return;
+        if (type_match(sbdev, iter)) {
+            if (!iter->match_fn || iter->match_fn(sbdev, iter)) {
+                ret = iter->add_fn(sbdev, opaque);
+                assert(!ret);
+                return;
+            }
         }
     }
     error_report("Device %s can not be dynamically instantiated",
-- 
2.17.2

