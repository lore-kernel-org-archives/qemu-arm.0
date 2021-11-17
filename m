Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp966402lfk;
        Wed, 17 Nov 2021 08:37:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMueHYfSDBFtUOTCbZb0b6NoGQcI2XGNwbUaGeLKGEP8j17ccAr03Tt4lWAccJBZplO8Sq
X-Received: by 2002:ad4:5bca:: with SMTP id t10mr35619268qvt.35.1637167048997;
        Wed, 17 Nov 2021 08:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637167048; cv=none;
        d=google.com; s=arc-20160816;
        b=iSS9FHezeoUAFJcHKrjroqs5lHvj4JaZB2nod/eReQ/WyMMoCF4y7gXhKMT7r0NTk/
         2gEIsqU3hs8Fkwk+wm4VuCzcEiGMG80BCeiKvm4TWyIqo6Iox8XtCKPt0Dcq4QYWx/Je
         1myL7N+iE6lR7KCoAv3dwBB+lVreQJwJNHsTzDCt+gkFLX/NUX6is8m7VydwWaPnhhI9
         3RNxaFctlG4Vq66D2hOdOs0Cv/kmcqKD5jE67f/Fjw11soE1PxMISTZAKdbX4z4GedLr
         LN1e1bJug/AOUO7HYZ/jJcY6efcToyA48DT7T1yOoPpy7hyK3WO6g+HRrAUdQZhEWruf
         2G9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rYswMrWmEmAz/Uk6rnfHjwvLtZ0axzsg1ucyN0GZvJw=;
        b=n9/NvOJ7EG0GWXLxgxKCSFhBB9+ye6GM3q+HLzqByScIr29tuxvrFfhOyCx+egqxej
         1k0HqoXKLIgxAdH23IzPzTZi6nS2I5ceXAyRSsTof1yuS7XcjOy56mKjAG3izi8/+EHG
         WQh/6Q8cfJbpdwi6qCJijYlx2YKTDlY5oqIoP51UozV8QMM1kFpcTd3w8f0u5kOQL2Zt
         MSwCmVXAEMpedbVNjuFcxLEgfJIEP6w83mJEyEVyXc82tz+sYcK7c3dmc1pIMClTcvkQ
         fLGde5Emt2eFEM7lLedSG1NoAOlaqKu5sZOsy2x1dhN4aXZsexr/6mG6eBtqoIjv94tC
         SiNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SVdPfS5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si391211qtx.47.2021.11.17.08.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 08:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SVdPfS5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnNw8-0001GE-9t
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 11:37:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtE-0003MG-GH
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNt9-000897-ST
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYswMrWmEmAz/Uk6rnfHjwvLtZ0axzsg1ucyN0GZvJw=;
 b=SVdPfS5oFpsHbpxqVbJckKEVsdhYm/fBHmCbwFwnIZq+Axm1xyb9NK7yFiKFA/a/ofQUzz
 tVDDK+vpjZZGoHrVd6DfhpV/UXuk2nEf6Cu5VkNIJcOM8L2f6QIunwKyNvYmYnXYfcVQ1+
 S+ahcurQ1+CW6KARe2SofgjF9LRJKLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-i3Y4S7cVMYiULzdpXz7Suw-1; Wed, 17 Nov 2021 11:34:19 -0500
X-MC-Unique: i3Y4S7cVMYiULzdpXz7Suw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59FA110168C4;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 282B1100EBBE;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 975301132D27; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] hw/arm/xlnx-zcu102: Replace drive_get_next() by
 drive_get()
Date: Wed, 17 Nov 2021 17:34:06 +0100
Message-Id: <20211117163409.3587705-11-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LMT0GbX6ns4S

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "xlnx-zcu102" connects backends with drive_get_next() in
several counting loops.  Change it to use drive_get() directly.  This
makes the unit numbers explicit in the code.

Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/xlnx-zcu102.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 3dc2b5e8ca..45eb19ab3b 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -169,7 +169,7 @@ static void xlnx_zcu102_init(MachineState *machine)
     /* Create and plug in the SD cards */
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         BusState *bus;
-        DriveInfo *di = drive_get_next(IF_SD);
+        DriveInfo *di = drive_get(IF_SD, 0, i);
         BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
         DeviceState *carddev;
         char *bus_name;
@@ -190,7 +190,7 @@ static void xlnx_zcu102_init(MachineState *machine)
         BusState *spi_bus;
         DeviceState *flash_dev;
         qemu_irq cs_line;
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
         gchar *bus_name = g_strdup_printf("spi%d", i);
 
         spi_bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
@@ -212,7 +212,7 @@ static void xlnx_zcu102_init(MachineState *machine)
         BusState *spi_bus;
         DeviceState *flash_dev;
         qemu_irq cs_line;
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, XLNX_ZYNQMP_NUM_SPIS + i);
         int bus = i / XLNX_ZYNQMP_NUM_QSPI_BUS_CS;
         gchar *bus_name = g_strdup_printf("qspi%d", bus);
 
-- 
2.31.1

