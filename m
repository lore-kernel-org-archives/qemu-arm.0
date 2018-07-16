Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1473960wru;
        Mon, 16 Jul 2018 05:59:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcHFwEI3OLesG+VIFLXicOno+r27Kj65CX0w80xc39iUNaFxpJK1iwxO9rxaPlHoZ9tq0L2
X-Received: by 2002:a0c:afb8:: with SMTP id s53-v6mr18006378qvc.164.1531745993527;
        Mon, 16 Jul 2018 05:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531745993; cv=none;
        d=google.com; s=arc-20160816;
        b=MM9WGza+nhx78rdSpzOS5kOi5/0DvU5vK39n7obv9AOXN4KsabmbQ4PIhtz3sAUSNj
         DAo1oOWTicSrsLXFairK4FTMTMkFd5sHAgAUiC/TfVxzQBzdKphn3jQfdVDlTfYmhFRI
         Bq7iYVDgtNC9DKj8CC3nbzl3r3REWDj+nOPumw2Vkysktcfbm4pUP3aPCnHay+So6Utr
         GaxOUvcYCVXJptHlcT5GH56/g9p+1WuDBk0XrPeQCD3U5x2nhfgGPf6delnIz/vHQewG
         MDQQxx4+G645ENIP4dFZHFqjV5E5v62GjLChpHM75dbtoM3vmyACtbyUcaU+fv4peVWo
         Sdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4ZzhvxvWQ4pGpC8HL1H6WxGYkYeCmb2MbQY5jjzAPnw=;
        b=MVDDX4kCP09LWJKwWitQz6+YHohoPABQw525XBquB8zGZwvn8oEif1xAulbEwmcE5d
         l4k6DmZDEvXBBFo6Ox1cTgP6y6289qh3PrzAkUIFzcwYtgLGUYsraaEAMxgHOHtn12Nv
         5Z1Dcv9HQW+c/THjJm85WK/WmkgEBYrCgpJYguNNlhiSfVPFKSCJmk08amBk8ri3kuqo
         zzrd9C7/UjQE/bPhAoxS+rXs5uC7+aSTC606R5w1Ej5D5zCXEcpsoKRprM5L47B/Z54i
         mjfs3SDRPQyXdGzmil7NRcOQs/0ySU1pocis7QqfzL+T12D1K/9jC1H+CEegynI8SS4r
         57vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y56-v6si80253qtk.390.2018.07.16.05.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 05:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff36W-00014W-Ut
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 08:59:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36M-00013o-U5
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36L-0001zZ-EJ
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48740 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36L-0001yq-96; Mon, 16 Jul 2018 08:59:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4999401EF0B;
	Mon, 16 Jul 2018 12:59:40 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FA2D1C589;
	Mon, 16 Jul 2018 12:59:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:19 +0200
Message-Id: <1531745974-17187-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:40 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 02/17] hw/core/sysbus: Add a function for
 creating and attaching an object
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DfOyAK4lL1Sb

A lot of functions are initializing an object and attach it immediately
afterwards to the system bus. Provide a common function for this, which
also uses object_initialize_child() to make sure that the reference
counter is correctly initialized to 1 afterwards.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/sysbus.c    |  8 ++++++++
 include/hw/sysbus.h | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ecfb0cf..3c8e53b 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -376,6 +376,14 @@ BusState *sysbus_get_default(void)
     return main_system_bus;
 }
 
+void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
+                           size_t childsize, const char *childtype)
+{
+    object_initialize_child(parent, childname, child, childsize, childtype,
+                            &error_abort, NULL);
+    qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
+}
+
 static void sysbus_register_types(void)
 {
     type_register_static(&system_bus_info);
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index e88bb6d..0b59a3b 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -96,6 +96,23 @@ void sysbus_add_io(SysBusDevice *dev, hwaddr addr,
                    MemoryRegion *mem);
 MemoryRegion *sysbus_address_space(SysBusDevice *dev);
 
+/**
+ * sysbus_init_child_obj:
+ * @parent: The parent object
+ * @childname: Used as name of the "child<>" property in the parent
+ * @child: A pointer to the memory to be used for the object.
+ * @childsize: The maximum size available at @child for the object.
+ * @childtype: The name of the type of the object to instantiate.
+ *
+ * This function will initialize an object and attach it to the main system
+ * bus. The memory for the object should have already been allocated. The
+ * object will then be added as child to the given parent. The returned object
+ * has a reference count of 1 (for the "child<...>" property from the parent),
+ * so the object will be finalized automatically when the parent gets removed.
+ */
+void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
+                           size_t childsize, const char *childtype);
+
 /* Call func for every dynamically created sysbus device in the system */
 void foreach_dynamic_sysbus_device(FindSysbusDeviceFunc *func, void *opaque);
 
-- 
1.8.3.1

