Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2B5103E160
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Mar 2026 10:48:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2oQm-0003al-Fg; Wed, 18 Mar 2026 06:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w2oQa-0003Vd-R6
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 06:47:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w2oQY-0003Kl-TS
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 06:47:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso61621635e9.3
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773830821; x=1774435621; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QgUepk6UMjnKqzufGDPkLxQrioV7HxGAbMXHjFPydeQ=;
 b=QhhvHPgKOfl/BhZ6pzwLgO97hGI8laNB4tBI4gqpH/3T1T4Bc7FNWUeshUSsExZ88F
 sUeXYbiZV/Q1pn59I0aFn8BpvRMr0te9TINo4oO/0f3pr0K1gkO2dR911MjWKAQxpG2k
 yzjXnFU8RJH8QDENlmwfYV2Hl5xL7Qo8lQ7W8wrvryYaGEZgI7+723Ma0ewohaK0M6PV
 nWxAsuiN9wH29MBzH3eTLvg700XsMhbL1jl0Zlt4oHnYaX0lBAORIQEwvurL3eWTHOcW
 kH8mbS5F4J0PTxXM4qQf7F+dpj5SydCtFkfzau6YtkOsx35GELQagVlz3ntsw7iTtMMR
 WKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773830821; x=1774435621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QgUepk6UMjnKqzufGDPkLxQrioV7HxGAbMXHjFPydeQ=;
 b=Foo8Zn7lIajRJju4N6aHjAtbGLMbvjV96YwlhSlbtUCtKvK4xUTy9LlhvJUxWFN117
 AuV9cjh6FDNgFRFHWNiQcprWJ5kMvPFfPSDnJ9Ih8EF8GvLhyM1uUNx1GFW2YYaKSnlW
 9qJSg0OkQEeQYmB+PL11ebn6ktagvpOuQfLaD8ZxlbaIXM4t0W/2KdnzmU06Q67xKgkN
 df+DdHtVSfNCUAo9K8KrBLqVNUx6l0bchGBmY3dRJ080ZK/Uyy/W0kHwcZeroRKqxk3e
 DVosxkyacacG8QhVvVciq9JHzQADZilZAqM0+e1nCubp6CYpEYfLFc0MI7z0go6FF3KS
 FfpA==
X-Gm-Message-State: AOJu0YyGZ5KpQjuNRiqNSSzlZWhYayR+NbVuKSYOe6aNVcr8N7+1JkiS
 inUVmUK6cBLCsccKHYWqM4z+5OfjJxKzdXuaUIdh7h4pwWnrJIlsdeID
X-Gm-Gg: ATEYQzzW635mlxPO7Hnto0kXxQGHL59Z7k8jP2Ad39WOZXT5IJ21dbHnjobJxWx68TL
 m/6hs34oToNbVIc2RQeMI0twVAIbMzoG/xcEdVleXMQjLeZjFNKNP3y38XP0uaVFd//5rZGcfNV
 Po+d2yU0rYwld0cliC1394eVph/zrp5qlUScILQCS1huMlmv1xabF4SUYNaX6y0YApf0d1HjCZd
 kqn18kYSd8ecX7JWtpqpqt1jsEbg5r4WB0q9fidUDcKP8gP0AkpaKeDW5sY8Ko5tClaT9ZwOl+j
 EmDcSBQJl6nLEmbjQgHc7/XF8MLfzsQCqgVGs2+KFQWLUH/4Zrr+ttnfx6cKzvzm/XrYUrywAuL
 VqwYuMrmxarbrvoVvTe4Jwd6KEbuy5TcWnxTKnHs82ZC7QenVFHuLr/PJQxEEGWB520kkYZOF/g
 Ja7Dd3QtsX8S+qkGPobGqjsKWxtRHpSkUlTa1YcUGPHBsY/u4259vVQPT6i4oxk2cTxmVIPUvZS
 98p
X-Received: by 2002:a05:600c:83ca:b0:485:3dfc:57a with SMTP id
 5b1f17b1804b1-486f446dee9mr43456345e9.32.1773830820667; 
 Wed, 18 Mar 2026 03:47:00 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-80-194.adsl.net.t-com.hr.
 [93.143.80.194]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-486f420de8asm56471095e9.3.2026.03.18.03.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 03:47:00 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 alex.bennee@linaro.org, peter.maydell@linaro.org,
 pierrick.bouvier@linaro.org, philmd@linaro.org, Ruslan_Ruslichenko@epam.com
Subject: [RFC PATCH 2/9] plugins/api: Expose virtual clock timers to plugins
Date: Wed, 18 Mar 2026 11:46:33 +0100
Message-ID: <20260318104640.239752-3-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318104640.239752-1-ruslichenko.r@gmail.com>
References: <20260318104640.239752-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

This patch extends QEMU Plugins API to allow set timers
in guest's virtual clock (QEMU_CLOCK_VIRTUAL).

It introduces qemu_plugin_timer_virt_ns(), which allows
scheduling a one-shot callback.

The patch also adds qemu_plugin_get_virtual_clock_ns(),
which can be used to query the current virtual time.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/plugins/qemu-plugin.h |  6 ++++++
 plugins/api.c                 | 29 +++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/plugins/qemu-plugin.h b/include/plugins/qemu-plugin.h
index 17a834dca9..bbd21e79c5 100644
--- a/include/plugins/qemu-plugin.h
+++ b/include/plugins/qemu-plugin.h
@@ -1246,6 +1246,12 @@ void qemu_plugin_u64_set(qemu_plugin_u64 entry, unsigned int vcpu_index,
 QEMU_PLUGIN_API
 uint64_t qemu_plugin_u64_sum(qemu_plugin_u64 entry);
 
+QEMU_PLUGIN_API
+uint64_t qemu_plugin_get_virtual_clock_ns(void);
+
+QEMU_PLUGIN_API
+void qemu_plugin_timer_virt_ns(uint64_t time, void (*cb)(void*), void *opaque);
+
 #ifdef __cplusplus
 } /* extern "C" */
 #endif
diff --git a/plugins/api.c b/plugins/api.c
index 04ca7da7f1..609ea69293 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -39,6 +39,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/plugin.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #include "system/memory.h"
 #include "tcg/tcg.h"
 #include "exec/gdbstub.h"
@@ -652,3 +653,31 @@ uint64_t qemu_plugin_u64_sum(qemu_plugin_u64 entry)
     return total;
 }
 
+typedef struct {
+    void (*cb)(void *opaque);
+    void* opaque;
+    QEMUTimer *timer;
+} qemu_plugin_timer_data;
+
+static void timer_cb(void* opaque)
+{
+    qemu_plugin_timer_data *data = (qemu_plugin_timer_data*)opaque;
+
+    data->cb(data->opaque);
+
+    timer_free(data->timer);
+    g_free(data);
+}
+
+QEMU_PLUGIN_API
+void qemu_plugin_timer_virt_ns(uint64_t time, void (*cb)(void*), void *opaque)
+{
+    qemu_plugin_timer_data* data = g_new0(qemu_plugin_timer_data, 1);
+
+    data->cb = cb;
+    data->opaque = opaque;
+
+    data->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timer_cb, data);
+
+    timer_mod(data->timer, time);
+}
-- 
2.43.0


