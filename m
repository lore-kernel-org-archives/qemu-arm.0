Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E42CCD1AB
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:12:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAy4h-0006Q7-0b; Mon, 20 Oct 2025 18:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy4f-0006PZ-5P
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:09:53 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy4d-00062g-Cc
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:09:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so38398025e9.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998190; x=1761602990; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6E1wKLq7nmDSAhd/TLUL+t/dNL7Yzwczc0AaVB8kGis=;
 b=EVrdonAzejxc/KksvQ64undNU1pZDZ2024Ll39uOPSIllVTYxyZMg7XmOyA9PnW4ei
 bADbeQbE0GqZrVB/jAgqIujs50hIAZ9IBWEXFK3vRuFVor+iVJY+2k+E01hXbnaa8HKM
 lEejH/MUdfZB0yzzh1ieazNUXGnB7S1Ld9jMJGy0JfcsqSBNwaTPyyIu0odlxJ1obXsl
 EhbEJ9fUMYaoK7u7I6RbHuL2r58sDegUI772Oti4uGnb1F9m1PCwKMN3nzrookhfTpDy
 zRCG44c1iEynyC4p7R3ELB1AGf6NqMA3dNIxQPeoyyeTJdsYbWACLz67WEGgcUz9nJrC
 AhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998190; x=1761602990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6E1wKLq7nmDSAhd/TLUL+t/dNL7Yzwczc0AaVB8kGis=;
 b=jKZ7nL8/6YyununRInl6VnVEyN1mdQvdb2H7OV9L7yZS2ZVJIZBCMJXPEE/0Ea84bY
 np3BKf7ppjDPEhqzzWIrGEMIwp5YEF1nQIefEQWV2O53619NuSFHKaiHWVHWAwaBQgiB
 bONAlO76bGc6bDx+kzLIPSr9bzLUZuZzMsv0id/rhGK8sqQaXkPy+Wc6PqJ1zuSr9A58
 G0IfJxxcd1O1mRbTCjpzFMHGfoDeShKTbmhR8KoVcnhgvsHuXcalfLKNwKaZEs53Br08
 /PsADAYIFo3VTrxMYWfEQu6KjFLsOipnV3otNTi2YyUE7r4lV481sHZhDNpJO3PJxoyO
 /ktg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtJxYm4YjLYuj4gaYZRo6ltiUKoVuelRZ5qbHqqvYwcw/rgFOmei3us09jeIdSwUMmVnalPio8eA==@nongnu.org
X-Gm-Message-State: AOJu0Yx4oaJolan8RsQ4YW9WoWpIaVOUjIGikZDSdVPR9jWGdMcuUHNj
 kyjLl5tiNPPodh9TIt0phG+rR3KSNWmKC3lb2JYAfqZrO8CAv+bERtycnvpEnB/tq/0=
X-Gm-Gg: ASbGncs0PoK8uAn1vo+drKS3M7Yk8gwD5IUmneZU/rgennOPBBFKC3ilxeMWwz0w7tj
 S0AxsehSx9JS2CMIK4/8kBNw4tIpXdkPM+O4s+6rbp2A0spsqbjgsKjDQKgJ9cJ7kt6IcRoAzQH
 R8QfUvTjgGp7QiwPRdN/ZiZuPG8ETljhXoMPYeOConTSd/5u3KNR2o1lwVtTQ9Sbh8OfRKXL3Qx
 /u1eZAaNmAb0utJZY+86d8r33tFrA5fTcDL5wU3tjwkH7g1QRlaUStNf0r9Npoe5LPaILiWfSQ+
 6EHz+5B4KRT4I4dxfO6HO/Uodt+Cgf3TKBNvATnAJM8raollB4EPLOmkyUcLYYMWStAr4BJ16Lz
 450a1X6JsGpGYWHN/nDXZ0qgJfnJDIK5uB5I37X3UuPCYmA8hDjpEdCQAMDZlHV+VtDvHDJW3nA
 9hiJaqyZ7ARFgHPkQW2elRufXrqX5+GfUoTS1spEjrRs58uWBb1+EAKweuAKyZ
X-Google-Smtp-Source: AGHT+IHuNcuKUHXB8XXESFW6EINic5NBOMyERNnN4lco+C4wFOEKCzTkC7rJIY4k3+kEALoUhRsxuA==
X-Received: by 2002:a05:6000:400f:b0:426:ff91:2f25 with SMTP id
 ffacd0b85a97d-426ff9142c8mr10911496f8f.21.1760998189735; 
 Mon, 20 Oct 2025 15:09:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47152959b55sm168862565e9.6.2025.10.20.15.09.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:09:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 01/30] hw/core: Filter machine list available for a
 particular target binary
Date: Tue, 21 Oct 2025 00:09:10 +0200
Message-ID: <20251020220941.65269-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Binaries can register a QOM type to filter their machines
by filling their TargetInfo::machine_typename field.

Commit 28502121be7 ("system/vl: Filter machine list available
for a particular target binary") added the filter to
machine_help_func() but missed the other places where the machine
list must be filtered, such QMP 'query-machines' command used by
QTests, and select_machine(). Fix that.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine-qmp-cmds.c | 4 +++-
 monitor/qemu-config-qmp.c  | 3 ++-
 system/vl.c                | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 51d5c230f7e..28dfd3e15bd 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -20,6 +20,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/type-helpers.h"
 #include "qemu/uuid.h"
+#include "qemu/target-info.h"
 #include "qemu/target-info-qapi.h"
 #include "qom/qom-qobject.h"
 #include "system/hostmem.h"
@@ -94,9 +95,10 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
 MachineInfoList *qmp_query_machines(bool has_compat_props, bool compat_props,
                                     Error **errp)
 {
-    GSList *el, *machines = object_class_get_list(TYPE_MACHINE, false);
+    GSList *el, *machines;
     MachineInfoList *mach_list = NULL;
 
+    machines = object_class_get_list(target_machine_typename(), false);
     for (el = machines; el; el = el->next) {
         MachineClass *mc = el->data;
         const char *default_cpu_type = machine_class_default_cpu_type(mc);
diff --git a/monitor/qemu-config-qmp.c b/monitor/qemu-config-qmp.c
index 9a3b183602d..8bd28fc2328 100644
--- a/monitor/qemu-config-qmp.c
+++ b/monitor/qemu-config-qmp.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qobject/qlist.h"
@@ -128,7 +129,7 @@ static CommandLineParameterInfoList *query_all_machine_properties(void)
     ObjectProperty *prop;
     bool is_new;
 
-    machines = object_class_get_list(TYPE_MACHINE, false);
+    machines = object_class_get_list(target_machine_typename(), false);
     assert(machines);
 
     /* Loop over all machine classes */
diff --git a/system/vl.c b/system/vl.c
index 646239e4a69..a96063f9901 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1672,7 +1672,8 @@ static MachineClass *select_machine(QDict *qdict, Error **errp)
 {
     ERRP_GUARD();
     const char *machine_type = qdict_get_try_str(qdict, "type");
-    g_autoptr(GSList) machines = object_class_get_list(TYPE_MACHINE, false);
+    g_autoptr(GSList) machines = object_class_get_list(target_machine_typename(),
+                                                       false);
     MachineClass *machine_class = NULL;
 
     if (machine_type) {
-- 
2.51.0


