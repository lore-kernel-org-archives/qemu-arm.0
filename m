Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3691938wrx;
        Tue, 16 Apr 2019 02:14:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2YU/zM/CkUOmk2RGFfMJHi3O1G39hhrNOm9aB/Kwr830+vcg+dfEj4/Ny5wrmgWOCCc9i
X-Received: by 2002:a1c:f204:: with SMTP id s4mr25733013wmc.51.1555406056136;
        Tue, 16 Apr 2019 02:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555406056; cv=none;
        d=google.com; s=arc-20160816;
        b=a/Apuy1QeoSZkA5Faiw+uIsc/7OMa6XhYXuSPva9Gj393ZedgV7h7xE2VTDWqv+9in
         SQTLrBL2Fy4T9sEP6OiyNlq29XJ0swOw+NXG8aRYquF/WdN8U5v0Y9elHhP3yQhKY8kg
         E6nAE21cm4SdcxUqOuEL9IjzTSA48r4JQ+nOwStuTxVaV+loMvlrg6jhKNmqylAJFkHX
         scK6uJUr4fk/jfTUCqmgOSV+S68HByDycY/Ixj+NuL1vLi0ZraOzmWF3RCGZhxAgSsZ2
         c/ttMMR7lYOaX/rlSTqT8nPtNozA0R81cu687WU7dY2H2vEJKo6oGJQL1kObAQ8wenJl
         XyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=f5hYjOusrmHny8Cf1KAXvCEpWw4svadXoGA3Weaz9Rg=;
        b=0VrLM4hCb0ptBgzS1MmVpEofE9aVCd2cJKmyWfq372z8M8Z9t55re25W7SJ2cb6QUb
         /6IK5TX8qaMKENm4N5SAwDX/QorsgnoNg65NKh9u253kPpthr7rWO37yNRk8HW4n3/On
         FEOCgLyZkQDOEKACxHXjBMlLD7zZL8pMVPMkdrjuz+izSuACwMnxPwLY+Qx6t2oHEaIE
         2ElrFIHVY8ErtrMJzKxRJ9e6J19bRP2W85dsXuhx7RIdYjKc8HXuLjhdakpQBr2ijv7d
         HElHcasgRUzgPB828ZW6AskBm2RwxUijSlNGJOxuq8HeUe8vkeg8WIQMxlU9gmE31X+v
         nzGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si34852273wrm.128.2019.04.16.02.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 02:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGKAR-0004QZ-5G
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 05:14:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGKA7-0004OI-QS
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 05:13:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGKA6-0004TT-SZ
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 05:13:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hGKA6-0004T7-Kc; Tue, 16 Apr 2019 05:13:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC32F66968;
	Tue, 16 Apr 2019 09:13:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9005C6013D;
	Tue, 16 Apr 2019 09:13:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 188841132BB6; Tue, 16 Apr 2019 11:13:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 11:13:46 +0200
Message-Id: <20190416091348.26075-2-armbru@redhat.com>
In-Reply-To: <20190416091348.26075-1-armbru@redhat.com>
References: <20190416091348.26075-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 16 Apr 2019 09:13:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/3] pc: Rearrange pc_system_firmware_init()'s
 legacy -drive loop
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	philmd@redhat.com, mreitz@redhat.com, qemu-arm@nongnu.org,
	lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CmvrIKiVAnzS

The loop does two things: map legacy -drive to properties, and collect
all the backends for use after the loop.  The next patch will factor
out the former for reuse in hw/arm/virt.c.  To make that easier,
rearrange the loop so it does the first thing first, and the second
thing second.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/i386/pc_sysfw.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c628540774..75925f5d3f 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -280,21 +280,19 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
         pflash_drv = drive_get(IF_PFLASH, 0, i);
-        if (!pflash_drv) {
-            continue;
+        if (pflash_drv) {
+            loc_push_none(&loc);
+            qemu_opts_loc_restore(pflash_drv->opts);
+            if (pflash_cfi01_get_blk(pcms->flash[i])) {
+                error_report("clashes with -machine");
+                exit(1);
+            }
+            qdev_prop_set_drive(DEVICE(pcms->flash[i]), "drive",
+                                blk_by_legacy_dinfo(pflash_drv), &error_fatal);
+            loc_pop(&loc);
         }
-        loc_push_none(&loc);
-        qemu_opts_loc_restore(pflash_drv->opts);
-        if (pflash_blk[i]) {
-            error_report("clashes with -machine");
-            exit(1);
-        }
-        pflash_blk[i] = blk_by_legacy_dinfo(pflash_drv);
-        qdev_prop_set_drive(DEVICE(pcms->flash[i]),
-                            "drive", pflash_blk[i], &error_fatal);
-        loc_pop(&loc);
+        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
     }
 
     /* Reject gaps */
-- 
2.17.2

