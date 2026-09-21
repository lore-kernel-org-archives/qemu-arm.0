Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760A3C982FA
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrX-0006Cw-OR; Mon, 21 Sep 2026 17:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrJ-00065F-7X
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:35 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrH-0008WU-JK
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:32 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so20875835e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027250; x=1790632050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iO9iNINTzD2LX9sUzLOVLlEHC5CtR3JI1XqzgFFVw9o=;
 b=mw4xXXC3cTxTjAGozYlotrJuNloxpUfdW5GS+I7j1vslDFh3Jwmr+/J4/5l1vud/71
 oVOcsK6uOucw1cA7AtqrxO2pWDIlo2TQVZBlcCdU/KeyCCeko2zkxnvt9oXVGwdvOGNn
 qOhVtOXTWdB+8htc1h730M9ZjUgDs6K8NkYf4VHzsrPTEeOzog9pPNKfmIQRdP1YYbSE
 Q6dmm+8oY5whJeIEE7SnUm3JuxNHgXSqMAQb5D5ZiOIv12Wb3AhEMSwEf12xR6fs6Ak+
 o3sK9+1bZFBpAD2R2XNw8tc+1HVC4ukxMyRaEI3iztIcpe9Khewd4tC+tkntNVWzwZZz
 qemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027250; x=1790632050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iO9iNINTzD2LX9sUzLOVLlEHC5CtR3JI1XqzgFFVw9o=;
 b=paRMgFG0oObHP7b0TgVxZeuFlBLIrYpH0mkKui0NdRXKVtpHa0BTu89kA4c8Rfv36Q
 QBQbvcNs4GIm73GWFCT4Zxre5VpT4KJ5WQi7tcfgG1P7FyQHuCjCET8Lbs49xia6D0l9
 JQKGg77SixF9VgwXngt/p1zUHi75HgR2ewPBBwbuWlfffMuT2KvR1WN/ndEwUMKWEmVA
 6MTo0KEV9bDMqqvfsum7djk0bdFwGfIhbfYanF+QixDPa4mZJGpex7///eZON5Z8Yv/i
 IEV4suY3jF3Li/OG322+OirJHdRodrkG34xg7jcmc9jKyVticbcWVd9TdlZd7Subsiw5
 GevQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxB+FAzOsD9WSr0QZ02KdFreheMlobzwj0naiQWnfdYDKCqmlE4U1wcrTMSLbeVtJMZjZy1UOxvzw==@nongnu.org
X-Gm-Message-State: AFuF++mQ2bbaD101pKCFz1j24mvyY+tBoTmcJtrWhewwQ6KPmnJp3lYq
 Qn9eZiA/ne9T7XDdIDn0yhfv990uKprphjnx1K0HvKj9hqZHeSzjTr9Z
X-Gm-Gg: AYBFou16ECxIUd/AfPTHkbFXFf1hEgcNYy07InhL9pr6OF7ejhudIdlJXrCpxoPUGL3
 TfdUyFCuBTswQ6zf3XgQIRflHXJ3vAKK0tl03bhjaY9Nty24uxtw7/2VKJruzpr5AgsL+LlEvs+
 lGOsCuEylBblNuITmKJ1kBr7ADtp2pUcon2EbZzRNrxh2tQkD47z/t31gUMLlxc9UiZLbYxITRM
 0E6msPtmo93J6ePJO6e0mLxSD0K1kkB47dD9NstZ2MQ+J6v0bC3hRWax29W+LjEG8QnlvXxQZHQ
 itNFkaHXVFjbMRuIOMSlxtIRoK7kh3chuuWZqVXxscK4bRw8lAll+5zt64Nb0e/t1FzDGFLq+DU
 4aoFbE2qGAJFUhzaoIGGU5wThvWSy4fF3YO4FS7N4rqj4S+NcD6TNfKu2o3rlTzKGpqm7vWPFAa
 53Nw1QmQKDc8a5h9zxzUwsAaV8KDuGqxDD9uu24NOJD86d0LwiBF5ws10Cyn0Q8eV2FwRi1wJG/
 5txxfLfbd+Vd9PN7Qlt+ke7GvWxKHKyeWaYyk4AuT+N4L3ds8gWylLE8mr9tsECLKosQDT2+jNd
 BYM=
X-Received: by 2002:a05:600c:4e42:b0:49c:fea3:8633 with SMTP id
 5b1f17b1804b1-49fc5750a8amr168804465e9.24.1790027250229; 
 Mon, 21 Sep 2026 14:47:30 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 03/42] hw/arm/imx8mm-evk: Fix reference count of SoC object
Date: Mon, 21 Sep 2026 23:46:31 +0200
Message-ID: <20260921214710.29422-4-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Using sysbus_realize_and_unref() requires object_new() rather than
object_new_with_props(), otherwise the initial reference count is
subtracted twice, i.e. ends up being one too low.

Fixes: 7bcd1f30bc83 ("hw/arm: Add the i.MX 8MM EVK(Evaluation Kit)
board")
cc: qemu-stable
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/imx8mm-evk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/imx8mm-evk.c b/hw/arm/imx8mm-evk.c
index c3215b11cb..6de0d9c4a2 100644
--- a/hw/arm/imx8mm-evk.c
+++ b/hw/arm/imx8mm-evk.c
@@ -83,8 +83,8 @@ static void imx8mm_evk_init(MachineState *machine)
     ims->bootinfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     ims->bootinfo.modify_dtb = imx8mm_evk_modify_dtb;
 
-    s = FSL_IMX8MM(object_new_with_props(TYPE_FSL_IMX8MM, OBJECT(machine),
-                                         "soc", &error_fatal, NULL));
+    s = FSL_IMX8MM(object_new(TYPE_FSL_IMX8MM));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
     object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
-- 
2.55.0


