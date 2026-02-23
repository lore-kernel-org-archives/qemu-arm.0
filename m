Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CADEC1115
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:11:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZM1-0003rd-33; Mon, 23 Feb 2026 12:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLD-0002pe-8B
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:28 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZL8-0000RC-1f
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:24 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso40278795e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866197; x=1772470997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Aa0SLfc8fXsQ713SAbRbmhAS+wd4hTaQKfR4EPdmzFo=;
 b=uzsPBFvtVqWGzJof15XJF9AexqPBKXN+S2i9eHCZXyFkYZTE9K2F9LW5ebksM5ohYH
 Nu9S5XAy1NIj7Riq0j7Zav4DLmDzJzi/hlkIkKnmlnTH+X31BZWokTEoXcIR6IVZgAJ/
 jv/KtgHXjymVrRaXuVRx19erLt99mOpgZ3vRiGFPnIEuZgSucIKlHjfndgtF2lpoXDng
 ezUo8nY+cMlLC3WPjRtjJfoqnP1V+7jOXy9NrUf5CU3FoCws41AdirKMr1JvyrdtdYv6
 MqHHJN3lhNIa0IKV96VVvH0diOn+29U55wFP48192D6jb8PC20N5iKkuyPsEp4/qWEtJ
 ipTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866197; x=1772470997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Aa0SLfc8fXsQ713SAbRbmhAS+wd4hTaQKfR4EPdmzFo=;
 b=an7S9ASkj5y2RipZrNR1j7nXMYtKn0hhEhsZ0N6z1kAa5D6FpsPxVo3uUuFqgRcmYE
 cSuy1A5+sf7jYD0dNLZ60x3ZoSxdNZOvEc4tN36fygHfmnGH1rZWcnIL6DsMQ36CBx6R
 TacKtNJyuLz4GDqzSbX45ZF4N6AspzPYzVgclXwsm7ERYyR+nRGYumgza59sc3XVQkxI
 FvIncCRujKfvlRhzH+8f+FeHoz+e7j5WN7uIpp57RpgnvtSJYwmX+z0diCi9YYZBXbGb
 GAMXFxJh9vMsBfIsO1sdJxBfAI9Ga68vmpbAZGqCTs13Q4MurH8SQEUZjYenX7fqTsh5
 MiEw==
X-Gm-Message-State: AOJu0Yzhn6mW36a0quBzgiTFn4cxcySvSCDTZ+EAm/3DSr7em87v4j8T
 gV0UMEYcwnn6zYMgP1I7Zo7mPX1B98NNg/y1cF6w/f6OoV6wKyIASPP8dpU/lnjxFyRyQr5zuyQ
 c1JBV
X-Gm-Gg: AZuq6aJasOJSZdkcts2WjVJ/73ivr74jVwmMjRSsFHwWocGtzK94a8fZGqwStyvjlTl
 7A4WZc9flkBJeb4bFt3wSuvComNv20Hy+Z+frIJcJz5CPT9osgr/byyar5+guADXJ7CneED1+t1
 DGEZrvgMy602Uk7ErCrrEzrHRRTNmsFjP/Mprl+tSCE998V8fpousK61c+pj201xbe2RxNLYLz2
 FoKZVmbTWeT6WC4nA7cqChf/Sv4JSyDn++PpkaOWDwPopgYW9BIgbyOpJsosHGpPAoBOqGCBDv7
 kKquCYU0Dp5xJWFZ+hEnId3ThK+TkxC4DV4j8TU7c2osJ/Sh8HePXGpny6y0mKmEKPTuhDEPho5
 Yw5UsdP32+GZgAtfPFlzi1Su0OE8Pobom0mwGckQEWl6KRID79mmIWy5mJEevyUFfa44pSKsaN1
 aFWKmdeA2ukL5AfNcdj3Ndjlzu3mihv4pwGsGipuPRoejhPB55xEhR9iSK150lcd8AcDyAyltQD
 CcprZV7dwhfV+0i9JA9e8eg6uCUUCI=
X-Received: by 2002:a05:600c:350e:b0:477:2f7c:314f with SMTP id
 5b1f17b1804b1-483a95f8af4mr145935825e9.10.1771866197155; 
 Mon, 23 Feb 2026 09:03:17 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 57/65] hw/arm/virt: Move MSI controller creation out of
 create_gic()
Date: Mon, 23 Feb 2026 17:02:04 +0000
Message-ID: <20260223170212.441276-58-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The create_gic() function also creates the MSI controller; however
there isn't really a strong linkage here, and for the GICv5 it will
be more convenient to separate it out.  Move it to a new
create_msi_controller() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0d1032967c..3c318680f8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -959,11 +959,21 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     }
 
     fdt_add_gic_node(vms);
+}
 
-    if (vms->msi_controller == VIRT_MSI_CTRL_ITS) {
+static void create_msi_controller(VirtMachineState *vms)
+{
+    switch (vms->msi_controller) {
+    case VIRT_MSI_CTRL_ITS:
         create_its(vms);
-    } else if (vms->msi_controller == VIRT_MSI_CTRL_GICV2M) {
+        break;
+    case VIRT_MSI_CTRL_GICV2M:
         create_v2m(vms);
+        break;
+    case VIRT_MSI_CTRL_NONE:
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -2515,6 +2525,7 @@ static void machvirt_init(MachineState *machine)
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
     create_gic(vms, sysmem);
+    create_msi_controller(vms);
 
     virt_post_cpus_gic_realized(vms, sysmem);
 
-- 
2.43.0


