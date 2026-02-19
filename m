Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A396CE9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:53:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt5MM-00043I-6I; Thu, 19 Feb 2026 09:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5MC-0003ux-Of
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5M6-00084l-EY
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:19 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43622089851so1022719f8f.3
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771512591; x=1772117391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rt/W6ouTfZVSR4Ud5vC1h7zS5UVtzxCsy8jnIZDfYtE=;
 b=h57Ib7o1aBgP3FI+Ql0YbfZM/i0VQYkourJnOKHpxIqzu/9MJkyFDLaYFDaNxxAWGo
 JRGVYn6ykDNJF+TLy666ZB52LSaRjrtdXQFYaKZax4WSThLr19/ldEuaTl/Yj3uLPUQT
 FK+JOKDE9GK6SyEq+apKSUIfAzB2x8OuL2GO6vSELh14/+ifv47dNvntJZBJvTvDtX2D
 32Wy9x0h73hV5DSLfplSPTpz2CeGuddz8Om9f+a2Ab8efV4SPnlCBB1nrsL2hxQj8k/Q
 R/Q/l4cIaVwxMDOOEr7z1ufh9l81Pv+jAsKSeSm5l+P/dkriVyvUIxxdBvGp46IO6dNi
 pqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771512591; x=1772117391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rt/W6ouTfZVSR4Ud5vC1h7zS5UVtzxCsy8jnIZDfYtE=;
 b=A5P3eKWicAVisGCM5zujwex+oizhwmcoiEQqGTzUivkfuatoWEnINI5Iz3t75mZGp7
 fKx3lpTi+eaUG2I15AFusawG1+zhmwrq1c8aIBJUqVvCWS7lOYUocFDLYvrV7eCupWgx
 uDNKnTLPpaOsBfq/vf6rUsVQP4LLG0Tzt4c8kYrLIbp2p29Vd4jgmPRPXGHaFma2Wxqn
 d/TKmWF+9tJJO0oaC/Ogoj6EneAs77ex4FUaK9gXL07T1HXlmz5Pep5l7xOX+UxD3hjD
 9Pv0ZhImW2L1DLzVwxhqlge35ds4/M3rK6c4Loj+CLXH+DZawQs57St5PrcH6nwv4oHo
 nzNw==
X-Gm-Message-State: AOJu0YxgtEa/Snl3ARjdphX3p35nlpTK1ZvbzSiCrwEQFHtjNYVFZkG4
 QevZF5ZFh70f7gyWmfaYpSMTIx9008tslmSFXsweP/IDvunvvcQ4pVS6
X-Gm-Gg: AZuq6aJ8EKMM8tq82Ld5OOEJTaA11wUTM8NFw/YSd/PAOEEg+nsDOedRs2Ruqou6+uK
 DDdw+zSv5pCHPpBBhwth6PpD1EtBU3wAAzx7sAjDmyiA+qxV7x7jiJ9MUbl+750UeSTmVRO4xCx
 BYOHDGpZbIXOtcULGPqDh7yQcdbKRwhrNQyn0ziq0RnTN3S1fG4IzkQeulyRLuxGtDFaPfqQzVh
 NJRin0SoQRU/nH0gsrCVigqbNglkSivfUq0L/BZS6D6JlWEupXPS24HhvtNcZ55kuyZ1Hw597Q4
 3BCJGBYjhPuN/hl70K5SSdePSpbefjgw41ALPX8K8EpfVCKYVocm5g4OM6VFk441lga43KEnGXj
 KnI64LNMJheaWdaF+Yx/vO3KKTYCKh3EeFDeBFQ6pY42s/P4loCczmMN/K4GqFzOajvlFz7Q2JI
 RL7SgqQCxZZB2ZDIVpDifwnZ1F+OvxZUVPPUUdvE6oCsv72M50CWNNObNxBWkSS1rc+ldY
X-Received: by 2002:a05:6000:288c:b0:435:95c9:6891 with SMTP id
 ffacd0b85a97d-43958e4f7f1mr11279014f8f.42.1771512591366; 
 Thu, 19 Feb 2026 06:49:51 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm50163087f8f.31.2026.02.19.06.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:49:50 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 27/33] hw/core/fdt_generic_util: initialize serial devices
Date: Thu, 19 Feb 2026 15:48:55 +0100
Message-ID: <20260219144901.3317747-9-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219144901.3317747-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
 <20260219144901.3317747-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x42b.google.com
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

The patch adds proper handling and registration
for serial devices instantiated via FDT.

The devices with 'chardev' properties are
connected to serial backends, if corresponding dts
property serial id number is set.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index 3179248142..c58a9ccdc7 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -36,6 +36,7 @@
 #include "system/system.h"
 #include "system/reset.h"
 #include "qemu/cutils.h"
+#include "chardev/char.h"
 #include "qemu/log.h"
 #include "qemu/config-file.h"
 #include "hw/core/boards.h"
@@ -1216,6 +1217,7 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
     props = qemu_devtree_get_props(fdti->fdt, node_path);
     for (prop = props; prop->name; prop++) {
         const char *propname = trim_vendor(prop->name);
+        int len = prop->len;
         ObjectProperty *p = NULL;
 
         p = object_property_find(OBJECT(dev), propname);
@@ -1235,6 +1237,13 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
             continue;
         }
 
+        /* Special case for chardevs.  */
+        if (!strcmp(propname, "chardev") && !strcmp(p->type, "str")) {
+            qdev_prop_set_chr(DEVICE(dev), "chardev",
+                              serial_hd(get_int_be(prop->value, len)));
+            continue;
+        }
+
         fdt_init_qdev_scalar_prop(OBJECT(dev), p, fdti, node_path, prop);
     }
 
-- 
2.43.0


