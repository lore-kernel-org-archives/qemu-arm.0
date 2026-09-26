Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E7CC98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:08:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMW2-0002WK-Ry; Sat, 26 Sep 2026 03:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMS9-0005Zy-Qd
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:15 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMS6-0000i2-O9
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:08 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-3429bca3880so926060eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406245; x=1791011045; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HQgaQ3pRlQZWTe+kZSuEPjW/N+yjSW5+B1zpZJSKnLc=;
 b=Knn3nu/wtMFOMIx/KjBn2hMaV1fwTFKy05NruLC5V9jSszCmPsBTU2xMTGtRcUlmJZ
 SGOfbH/t8akw29iq+sVUM2KaFfahbiSVo+jlAhLs8/nRmhe7kg71gfIhwpHj4WS280xq
 bXHs39HH5ItbPXae8JZdT/3lRqfEUfBnGl7uj/8+2gzF7TZEoxMfmJDoBZpOGtleuDw4
 CTOBniown60WBjsaxWsqpyKoehGe20RaQNnGRLXINHiDGxVTc04NTyIdjZC79E0Qyb+0
 5Zrf73WGAtzHOQj+kD2DjQsgRVgP1wDx5N4YDudHd9INkMLZTJCuDAZPbKaEy0l5sv/B
 K7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406245; x=1791011045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HQgaQ3pRlQZWTe+kZSuEPjW/N+yjSW5+B1zpZJSKnLc=;
 b=LjRB51DGedSOEX6oKA25d6K3XWOxfOJGETD6eilup9BScTHNFK9WALioPcItVDxii1
 klmT3tIzEJaY3EJTjuTK8XznGV7ki8G8hCdrWG46Lc+E7Gq/SelaWnRiIZ1anm/Cc0TE
 iGZzjWSS1Tca7bVP//TxbQNMyuLcdQ14BhGSYFLPfLooG+LwhZbLETYW8AnlOK2rbend
 2bD6+8RbYT3Ujyfzv8uJegRbiGiZfxRHwITETPqSdBf/90NcWR5tlDFDe+kecVKThg/P
 FjHXAQRTgPj8WG3WWwJbNlgOr+m8WJXMi6gC1XuoqMVVU/Fz7yIthmWRxQ7s+VaQskU2
 UotQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8wfWSgLy4JvTO9O7WrpH9zdQUhs5dyheIS3tZGw5urJV3oAd5U/RJXzVGHdEc9BI1Fp8rBQyqcQ==@nongnu.org
X-Gm-Message-State: AFuF++nvpHvLrIsLJA6c1oFrGFbAJIVs87lgdvNmEJaTS90zyVvpzbPr
 9lSc3zGVCxIaAZamxav1m+CC7G20cv6lbx+WZYijES0uPRx1ev43YF7F
X-Gm-Gg: AYBFou3QBCKF7wCo/fQDPsUdTOa//qO/hMM7qZY+j9RxwHZPhwHvs2Ph9xPAJWypX2o
 XHtvWKQJ7j233q70PGxOuYlIX43cWZZMJb/e0cV9PLijzEWGexrXL3HuYIKoWBxZHtiO9TQRcnQ
 hlwoNfD+ArA5Z26oZnLoWOKVNtpBqPzbHu/WTvoAoVptziet1wK4VX/cF1/NHhPbaKF1C4p9EGs
 WyO81szLQaaT9MDpfrUjkH5g+9g8B22V52nv97sm3NHuPFZAlZUs2ubVLvXQdsSEk5aFKlG99Rd
 S/ly8He1Uss9UWBmvzE7piDrfmf55VG2UdUAvBwWozNmdbz1s7Mz7DkBIZmd2Bypa/Ez5FzfmRD
 YuekpbVvVSfDrINtf+rk1iDV40kqhQgenhhqZ2pfEhktfYegjJdzEqyuCwV+8O42eJ7DHrnO1g6
 bNaJz3PR3/KJQRWAMt0oo4cCkLnVw5z+7+dzzFuwbgP1VftFjht0bJJwJs82CwQOCjJ9TkIf5Oy
 1iXYJD4gQ5ZBKyJdvgCMgCIdXdx5Og=
X-Received: by 2002:a05:7301:7191:b0:33c:35ec:c2b4 with SMTP id
 5a478bee46e88-34271a9026dmr2161927eec.24.1790406245422; 
 Sat, 26 Sep 2026 00:04:05 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:04:04 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 46/55] qapi: add query-targets
Date: Sat, 26 Sep 2026 15:00:45 +0800
Message-ID: <20260926070057.1234-47-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

query-targets lists each linked target, including none, with its
arch, endianness, and the machines that target accepts.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
 qapi/machine.json          | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 9c08b17510a..c7b73efa31d 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -21,6 +21,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/type-helpers.h"
 #include "qemu/uuid.h"
+#include "qemu/target-info-def.h"
 #include "qemu/target-info.h"
 #include "qemu/target-info-qapi.h"
 #include "qom/qom-qobject.h"
@@ -173,6 +174,35 @@ QemuTargetInfo *qmp_query_target(Error **errp)
     return info;
 }
 
+TargetMachinesList *qmp_query_targets(Error **errp)
+{
+    TargetMachinesList *head = NULL;
+    TargetMachinesList **tail = &head;
+    GSList *machines, *el;
+    TargetInfoNode *node;
+
+    machines = object_class_get_list(TYPE_MACHINE, false);
+    QLIST_FOREACH(node, target_info_list(), next) {
+        const TargetInfo *ti = node->info;
+        TargetMachines *row = g_new0(TargetMachines, 1);
+        strList **names = &row->machines;
+
+        row->arch = ti->target_arch;
+        row->endianness = ti->endianness;
+        for (el = machines; el; el = el->next) {
+            MachineClass *mc = el->data;
+
+            if (!object_class_get_is_available(OBJECT_CLASS(mc))(ti)) {
+                continue;
+            }
+            QAPI_LIST_APPEND(names, g_strdup(mc->name));
+        }
+        QAPI_LIST_APPEND(tail, row);
+    }
+    g_slist_free(machines);
+    return head;
+}
+
 HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
diff --git a/qapi/machine.json b/qapi/machine.json
index 6aaa2af709a..d8cdea6203e 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -307,6 +307,41 @@
 ##
 { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
 
+##
+# @TargetMachines:
+#
+# One registered system target and the machines that can run on it.
+#
+# @arch: the target architecture
+#
+# @endianness: the target endianness
+#
+# @machines: machine type names, not aliases
+#
+# Since: 11.2
+##
+{ 'struct': 'TargetMachines',
+  'data': { 'arch': 'SysEmuTarget',
+            'endianness': 'EndianMode',
+            'machines': ['str'] } }
+
+##
+# @query-targets:
+#
+# Return each target linked into this QEMU binary and the machines
+# whose availability check accepts that target.
+#
+# Since: 11.2
+#
+# .. qmp-example::
+#
+#     -> { "execute": "query-targets" }
+#     <- { "return": [ { "arch": "aarch64", "endianness": "little",
+#                        "machines": [ "virt" ] } ] }
+##
+{ 'command': 'query-targets',
+  'returns': ['TargetMachines'] }
+
 ##
 # @UuidInfo:
 #
-- 
2.52.0.windows.1


