Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp425204wrq;
        Fri, 13 Jul 2018 01:28:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeCfdvytK8ikEoTRDCL8+LBIw/c5g7WGkzkfuGUiRS8rSOMDo4tjbdNLI0DgjE9kqdEWu2j
X-Received: by 2002:aed:3cae:: with SMTP id d43-v6mr4877755qtf.379.1531470489935;
        Fri, 13 Jul 2018 01:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470489; cv=none;
        d=google.com; s=arc-20160816;
        b=m3CkbZFs1qEeUJdXUZpRvjdut+Kle5g3psQ0t7X7wLkVTX6t70FNDMlrlbejkwKhV9
         Eq7ytPtRz7ZwKN1agwF7dnSTQyIdOLR15m5LPxJnAF8zvBZ4LNwVGJS8F0hJAelC4dzv
         RohE2pbqfb+pgRCmrQxPm0lly1P0DzoPcEEvzZpfByny9yAImUWKl8Z4jzsLOvrVLwOK
         CYMIrWAN3QyjRFwePZmvnESvA34J4I33mI4BQHmIJlIRR/tnRApScgITkYsWAYi4fxZH
         VweQ52ferMXvPJyJF8+VRbO6euKlCDH28p9rxU+gO8FWqXqkZ9eq73zM4Xmp9AItYN4x
         BdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=RoT0FniFoh3OylpHy6D94wVccKuY7i9/+CkHGiGWPiw=;
        b=mwfV8TR38nhdSXoYv0RU4WVJpeALjptwpM5Ju2CemaMQEM3sNOkZrZyja2cvLbaGib
         zD+jBJe0hrOQpxxUoETxy195vjb3US0uP2TFLABEebib45JGFNeUth08IvT60geLEarg
         ARhdm39/dEfxNVAUXBKtzhREl19vRshh5JHRuNHHvpzDXKNwK3Qx1AboJwpZmrHq153i
         fGoTa5o8z5gVkEBUd79keVIyEctuOirdMYQ9goLnSw+wHtgb8zKvJcJRsa2Cg12OzES0
         4bipnxWq68kqQ1U2fl/6DNuBFkE7jPVCJ0Vr48RPn84bNc+o2602s+R7/OF3d6tzEGT5
         4ULQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q16-v6si6813791qtf.380.2018.07.13.01.28.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:28:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtQv-0002Bl-9p
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:28:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQh-00029u-Bo
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:27:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQg-0004Et-HA
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:27:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58118 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQg-0004EB-DH; Fri, 13 Jul 2018 04:27:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E57E972632;
	Fri, 13 Jul 2018 08:27:53 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA0E2026D6B;
	Fri, 13 Jul 2018 08:27:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:30 +0200
Message-Id: <1531470464-21522-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:27:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 08:27:53 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 02/16] hw/core/sysbus: Add a function for
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
X-TUID: YSuUQiKb88Zi

A lot of functions are initializing an object and attach it immediately
afterwards to the system bus. Provide a common function for this, which
also uses object_initialize_child() to make sure that the reference
counter is correctly initialized to 1 afterwards.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/sysbus.c    | 8 ++++++++
 include/hw/sysbus.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ecfb0cf..e2436ce 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -376,6 +376,14 @@ BusState *sysbus_get_default(void)
     return main_system_bus;
 }
 
+void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
+                           size_t childsize, const char *childtype)
+{
+    object_initialize_child(parent, childname, child, childsize, childtype,
+                            &error_abort);
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

