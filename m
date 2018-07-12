Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1504789wrq;
        Thu, 12 Jul 2018 08:31:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcpCs2J+Xl3IMWN8x1sRkVV3POB7Td49LoPzhm3v+vGayr8Xnku5wnUtzsQgDaG5LXEwVsg
X-Received: by 2002:aed:22ae:: with SMTP id p43-v6mr2286408qtc.393.1531409490537;
        Thu, 12 Jul 2018 08:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531409490; cv=none;
        d=google.com; s=arc-20160816;
        b=fl5Pu+g78XQj0PElf2C691sTIvKYsBlEunI2zqjAQnjYJ38LTQbBenYK6+SnAxDI0S
         c+5+AQrVctqmK9wL66qQufx02RODGI/GJ/7s8HwMR1oKf4e1T9oZfTsXUa2YsYn+vunH
         agBUQ2ds0jwotQ01wICc+fo1uZEr9f7GN1VhlWbrk2br2Ae6lyMNo4U1vI096QONzUXi
         bZ0V/7fyhbl2zAjyh+TMVwWVY+6Z8c4v//1zO3aaHtMW7wZA8p0b0sc8dP7b0YvGQSc4
         UpENzt74I1a3UJj/DIy8SZj7Zy0/750QICNYTqAEPje+XAlQX/DdHtHfklLuHX6d4jOL
         h7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=yN/tNMm2is2VIp3TvsW/wswahxrQMWhq+t8ztAbvGK0=;
        b=eUOve5ow06GBbZGpmdS8+8M7FRq6rJxBIZBiXc6jBCQ4J9zWfr438Cai9i8fv/MSDW
         IS+vKxwhpKO3VpgkTdlHw1rIUfU1xBG6ofsZvVF7bCHGJO49KBmQL+GBFMcDTyY57I+y
         buZ3UmlkwLwbnZ4Yk79O088TngCVXiOgYfXU6wZtHwSCcmfspk1Di06NactInHA3IvBK
         GXZr4IK3pXOJ1PsiQOeWbR5s+rcst55RS8+o+qsu5qVw+j1A6KeQINjkM+WqZT739BT/
         vVio8qcTO91LPcpGASNY6MqbFm5/GFRRtDKtidHTdjo5mo6tXHv3Z2NmtU9l1a/2d8K/
         Fuxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r26-v6si1603478qva.80.2018.07.12.08.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddZ3-0005Km-Ri
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:31:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYl-0005GM-MP
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYk-0007rC-Ox
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57478 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fddYk-0007qS-Lc; Thu, 12 Jul 2018 11:31:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E50E40073B7;
	Thu, 12 Jul 2018 15:31:10 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A08B21C66C;
	Thu, 12 Jul 2018 15:31:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jul 2018 17:31:00 +0200
Message-Id: <1531409463-3843-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1531409463-3843-1-git-send-email-thuth@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 12 Jul 2018 15:31:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 12 Jul 2018 15:31:10 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 2/5] hw/core/sysbus: Add a function for creating
 and attaching an object
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
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RpHx8VnCK5Rf

A lot of functions are initializing an object and attach it immediately
afterwards to the system bus. Provide a common function for this, which
also uses object_initialize_as_child() to make sure that the reference
counter is correctly initialized to 1 afterwards.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/sysbus.c    | 8 ++++++++
 include/hw/sysbus.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ecfb0cf..c164318 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -376,6 +376,14 @@ BusState *sysbus_get_default(void)
     return main_system_bus;
 }
 
+void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
+                           size_t childsize, const char *childtype)
+{
+    object_initialize_as_child(parent, childname, child, childsize, childtype,
+                               &error_abort);
+    qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
+}
+
 static void sysbus_register_types(void)
 {
     type_register_static(&system_bus_info);
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index e88bb6d..e405232 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -96,6 +96,9 @@ void sysbus_add_io(SysBusDevice *dev, hwaddr addr,
                    MemoryRegion *mem);
 MemoryRegion *sysbus_address_space(SysBusDevice *dev);
 
+void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
+                           size_t childsize, const char *childtype);
+
 /* Call func for every dynamically created sysbus device in the system */
 void foreach_dynamic_sysbus_device(FindSysbusDeviceFunc *func, void *opaque);
 
-- 
1.8.3.1

