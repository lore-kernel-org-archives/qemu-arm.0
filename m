Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2427785wro;
        Mon, 5 Nov 2018 02:57:29 -0800 (PST)
X-Google-Smtp-Source: AJdET5clZcGhdE4u6dktoKtWKIA23KuicH0j6pqSX6UOJfzv/U3D1RBoAnpf0mO8T2B/QVseMXF/
X-Received: by 2002:a0c:e84f:: with SMTP id l15mr20400056qvo.124.1541415449579;
        Mon, 05 Nov 2018 02:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541415449; cv=none;
        d=google.com; s=arc-20160816;
        b=jEjVXWQmkUdM/6sTHgkUWFe39GhvDUdLH3FyqKMEgHZZcQQ7pYDF6CLz2aenDUtwa7
         3i1N7w5cjGZpQpNaLaiQF5H+XowPHC78dGWvkITHHZ0Vuu4TmmMe6lCpxSmyO5yy98vL
         P7cMlS3TaHk1X1YeqGh79rJL1RkpXKFIELaO+E5dN+Kkx1JtqcgELNK0DRhHlnLfgSEX
         jc5Cpmh9kcZdXZirfANksuUJF0wA5ZO8gYBNMtmnKpAMa8FVxfZ5GZhLXZF+h65qZQp/
         yExWQIhnwz2mVuNaTqD0Z7sovj62njB8meLdZbe1z//wQEhbnKU0Xgn3LcJH96fCD2pp
         QGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=XKaleO/IqTZkdXkJgEd30jVXoKNDd7LX/E4H1cCeg34=;
        b=Msz12PBXHwY+uYgfuFSCGaoFX0Edn0Y/p9hqeN0eAOZX2x/2lM9SW/lvmVPjPIeDGz
         zf1iRR+BE2t/RUb92VC6LiLU8NLbTYW4/Zv/41lpDv/UjPfwxnDxtOKJPslW93Ja7awd
         HkRTD3SvF0RWjPDcc5slmK6s/ebP0yDY9E3VL3kYF5Zk9Mcd+FVDFfp8BHZ+JYkrIKEb
         bqy8OycujLtzv3LOk8xapuEiaU3yRxh8OzJ7BRFUhXeDwQxBYfGHLZdSxcK7RDKuIurk
         mD3eAWxGbG5R8ragqo5LrSXsMuk2PALucEQTYVkch9tjmMC2MMBU63fWNx+pko/P8waf
         A9wA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3-v6si606979qkf.0.2018.11.05.02.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 02:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJcZV-00077A-47
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 05:57:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gJcZD-0006yP-3E
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 05:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gJcUS-0007IS-53
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 05:52:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48138)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gJcUP-0006Qj-Gi; Mon, 05 Nov 2018 05:52:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 952AC394D24;
	Mon,  5 Nov 2018 10:52:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9EF960F8C;
	Mon,  5 Nov 2018 10:52:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, geert+renesas@glider.be,
	alex.williamson@redhat.com, thuth@redhat.com
Date: Mon,  5 Nov 2018 11:51:48 +0100
Message-Id: <20181105105148.15833-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 05 Nov 2018 10:52:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/sysbus-fdt: Only call match_fn callback
 if the type matches
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
X-TUID: lJ/1oaaZAXOQ

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

