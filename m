Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2746656wro;
        Mon, 5 Nov 2018 07:57:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5fUmomNyE+Quc6U0Qaz6tyM0uAK/1SZ0UY41QoaLvqOUztLMBP+7cUhUvHzeh3AJ0FytthT
X-Received: by 2002:ac8:26b9:: with SMTP id 54mr8406873qto.301.1541433442525;
        Mon, 05 Nov 2018 07:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541433442; cv=none;
        d=google.com; s=arc-20160816;
        b=BgyzmWyaU+IA3eUWqlkp9p4jFPf8F0NykHmb6WJIvhw3sa2SiUl5I615EidP7YPDq6
         NDBhDNg7RMFjXuL6e4hNKczYV8UEwH1RY97kl8Y41TtcvHd4b5ra1W+u/vd7xGOiWaXc
         zePEEchP7KE3EYq6FpZ1lKOaLYd/76VBflCOTyNELGHtPgGhLPmdq4kQuF8d4CZfhJZj
         caxEocRSd97MzPWJzuCWFJvXaHLkm22+snGARHu85Y6ePbv7Dbey4q6uBCNyAU8AXEsn
         spDVMGHexrxyD4zgcsXJ+tHWDDkb3shI7pdk/Eq/X7YtPHH7J+vEqPB52NRSjPwkR9LX
         qKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=XKaleO/IqTZkdXkJgEd30jVXoKNDd7LX/E4H1cCeg34=;
        b=DLn0+5Xqh8ru8QskCAai78/30bmHV6/dhC1RQVtbjTqRJy3NVzJZLqfTCOY1c+Vp5A
         QI9NIGDAfMFXm2AjZsI8pp2PZ6GPhlmwbLA9zAqa+QBzFAzVrLLoE6in/Mij85unbaY0
         Eiirl5ojqoUUyiiDS0JqZnrnHDXgFTFrXCd5/JJbRnQsgzli1XAqbBIp02CjX1ky/+R/
         9nqcOyfpGSok/D4WgybN1O+OIL3AbWG+5LeD+Pnm/2r/qvSbo298BjbLxRucdnoAjAD+
         MASACGBntedScsS9wvhezjGvP5e2bUa4TR5eFCAh5RVQXBeOkgDHBcc8ivbE5hp1dyIU
         ze3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s53-v6si4221681qte.277.2018.11.05.07.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:57:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJhFh-0001X2-QZ
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:57:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gJh6E-0004ZJ-La
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:47:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gJgum-0004Qs-Jf
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:35:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gJguk-0004C9-JX; Mon, 05 Nov 2018 10:35:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26D583082202;
	Mon,  5 Nov 2018 15:35:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC0C35ED59;
	Mon,  5 Nov 2018 15:35:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, geert+renesas@glider.be,
	alex.williamson@redhat.com, thuth@redhat.com
Date: Mon,  5 Nov 2018 16:35:20 +0100
Message-Id: <20181105153520.18528-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 05 Nov 2018 15:35:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RESEND PATCH for-3.1] hw/arm/sysbus-fdt: Only call
 match_fn callback if the type matches
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
X-TUID: lkMZE4VLnN5w

Commit af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with DT
compatible value) introduced a match_fn callback which gets called
for each registered combo to check whether a sysbus device can be
dynamically instantiated. However the callback gets called even if
the device type does not match the binding combo typename field.

Let's change the add_fdt_node() logic so that we first check the
type and if the match_fn callback is defined, then we also call it.

Binding combos only requesting a type check do not define the
match_fn callback.

Fixes: af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with
DT compatible value)

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/sysbus-fdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 0e24c803a1..a44cf7f255 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -449,7 +449,7 @@ static bool type_match(SysBusDevice *sbdev, const BindingEntry *entry)
     return !strcmp(object_get_typename(OBJECT(sbdev)), entry->typename);
 }
 
-#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), type_match}
+#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), NULL}
 
 /* list of supported dynamic sysbus bindings */
 static const BindingEntry bindings[] = {
@@ -481,10 +481,18 @@ static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
     for (i = 0; i < ARRAY_SIZE(bindings); i++) {
         const BindingEntry *iter = &bindings[i];
 
-        if (iter->match_fn(sbdev, iter)) {
-            ret = iter->add_fn(sbdev, opaque);
-            assert(!ret);
-            return;
+        if (type_match(sbdev, iter)) {
+            if (iter->match_fn) {
+                if (iter->match_fn(sbdev, iter)) {
+                    ret = iter->add_fn(sbdev, opaque);
+                    assert(!ret);
+                    return;
+                }
+            } else {
+                ret = iter->add_fn(sbdev, opaque);
+                assert(!ret);
+                return;
+            }
         }
     }
     error_report("Device %s can not be dynamically instantiated",
-- 
2.17.2

