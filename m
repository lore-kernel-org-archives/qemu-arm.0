Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1488487wru;
        Mon, 16 Jul 2018 06:11:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdnQC4Ktv3Zk+FvJy4i6QqkzVLK0e2f98bDWvRXgUE3nsgO6Wke3grjOdJDd51dbnYRLjot
X-Received: by 2002:a37:c249:: with SMTP id j9-v6mr14032473qkm.157.1531746662604;
        Mon, 16 Jul 2018 06:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746662; cv=none;
        d=google.com; s=arc-20160816;
        b=qSMg1FVwi+OwxJJQmg4Skm1txtaaSTNaAuyfNhIlqzMU5DjOVcaVTOo4fNU84OqRW4
         Fn967p4k0R36aEC47jxrPkRLIQIKFBMmrq2l1q8ywDgkO/t4YGLtxgZzhebS7WVOuUgy
         BvObqvR/8eeDZGma9wCbyM9K/zP/Kpy0oCw84AfZ//dZLRUFPp7J1EFRaJZo3zCuwMuV
         Qx6Mp+y30q+lvwRG2yoIcrFfQF7zsUfxX+IHwS3NVoynBrsLVkZIl/c3+ZxP/CRR0GR4
         0thEzFb9ps5bq69eo9DiHhbnG1vt/JdnXRRPGJJAB99U3XOmRCga60hzkF81tNMy2LC8
         W6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fgPQWpDBh6JgCm86KdPCqlQm+TN5BfUGQfvlRulI8WE=;
        b=A+JpLLYvtyAvlEWJkJQqEWYyC7zcjxs1HU9F+XZUvfv/Uh5KJalhCHbRbBmu+91m95
         kGRJbTNK5Z3XpOTvEzIx4FL7OiC1iRGqn0KGjYGdm+ErNuHpq657I7HzH8nR2URIsVhF
         BUe9noWmdP+IoCdDVVV1R+ruYAsm2Ejw1HrG2V0nZxzH5SYN3pEp4d5Qgy5O+haW33rR
         vnDa7eUSlwhw0ABnMhTTTUFwhe4Q8AzV/lm3/KZR5UzQdplTE0j7z/dAsfNMLqwoRd0l
         fUoWrKmw24Dew6RCKcbfY2db8suoKk8Z6twf/wTnwPmy1XaSL3yHmftF+SYZP0JHZCKZ
         3fxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z89-v6si1198975qvz.121.2018.07.16.06.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:11:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3HJ-0001js-T4
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:11:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36g-0001N4-TV
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36c-0002A9-E7
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48780 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36c-00029o-1H; Mon, 16 Jul 2018 08:59:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A639401EF11;
	Mon, 16 Jul 2018 12:59:57 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBCF71C589;
	Mon, 16 Jul 2018 12:59:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:27 +0200
Message-Id: <1531745974-17187-11-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 12:59:57 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 10/17] hw/arm/fsl-imx25: Fix introspection
 problem with the "fsl, imx25" device
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
X-TUID: xrnB7Ubs4OyP

Running QEMU with valgrind indicates a problem here:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'fsl,imx25'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==26724== Invalid read of size 8
==26724==    at 0x6190DA: qdev_print (qdev-monitor.c:686)
==26724==    by 0x6190DA: qbus_print (qdev-monitor.c:719)
[...]

Use the new sysbus_init_child_obj() to make sure that the objects are
cleaned up correctly when the parent gets destroyed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx25.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 37056f9..bd07040 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -39,38 +39,36 @@ static void fsl_imx25_init(Object *obj)
 
     object_initialize(&s->cpu, sizeof(s->cpu), "arm926-" TYPE_ARM_CPU);
 
-    object_initialize(&s->avic, sizeof(s->avic), TYPE_IMX_AVIC);
-    qdev_set_parent_bus(DEVICE(&s->avic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
+                          TYPE_IMX_AVIC);
 
-    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX25_CCM);
-    qdev_set_parent_bus(DEVICE(&s->ccm), sysbus_get_default());
+    sysbus_init_child_obj(obj, "ccm", &s->ccm, sizeof(s->ccm), TYPE_IMX25_CCM);
 
     for (i = 0; i < FSL_IMX25_NUM_UARTS; i++) {
-        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_IMX_SERIAL);
-        qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "uart[*]", &s->uart[i], sizeof(s->uart[i]),
+                              TYPE_IMX_SERIAL);
     }
 
     for (i = 0; i < FSL_IMX25_NUM_GPTS; i++) {
-        object_initialize(&s->gpt[i], sizeof(s->gpt[i]), TYPE_IMX25_GPT);
-        qdev_set_parent_bus(DEVICE(&s->gpt[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "gpt[*]", &s->gpt[i], sizeof(s->gpt[i]),
+                              TYPE_IMX25_GPT);
     }
 
     for (i = 0; i < FSL_IMX25_NUM_EPITS; i++) {
-        object_initialize(&s->epit[i], sizeof(s->epit[i]), TYPE_IMX_EPIT);
-        qdev_set_parent_bus(DEVICE(&s->epit[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "epit[*]", &s->epit[i], sizeof(s->epit[i]),
+                              TYPE_IMX_EPIT);
     }
 
-    object_initialize(&s->fec, sizeof(s->fec), TYPE_IMX_FEC);
-    qdev_set_parent_bus(DEVICE(&s->fec), sysbus_get_default());
+    sysbus_init_child_obj(obj, "fec", &s->fec, sizeof(s->fec), TYPE_IMX_FEC);
 
     for (i = 0; i < FSL_IMX25_NUM_I2CS; i++) {
-        object_initialize(&s->i2c[i], sizeof(s->i2c[i]), TYPE_IMX_I2C);
-        qdev_set_parent_bus(DEVICE(&s->i2c[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "i2c[*]", &s->i2c[i], sizeof(s->i2c[i]),
+                              TYPE_IMX_I2C);
     }
 
     for (i = 0; i < FSL_IMX25_NUM_GPIOS; i++) {
-        object_initialize(&s->gpio[i], sizeof(s->gpio[i]), TYPE_IMX_GPIO);
-        qdev_set_parent_bus(DEVICE(&s->gpio[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "gpio[*]", &s->gpio[i], sizeof(s->gpio[i]),
+                              TYPE_IMX_GPIO);
     }
 }
 
-- 
1.8.3.1

