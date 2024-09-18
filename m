Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp978366njg;
        Wed, 18 Sep 2024 12:24:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQNHWkwUXRWb1GewCJAIg0WWl2s+WnYRGLjnG1B/5DCTSX0wa6aATQj8pvMoKQvav3wh6cT2XBuOiQCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHLp15nKS+6VGCnxk+lyYaEtYqqv+t8YTF29BbB6qtPzbTJdfIYR/HYmc7eZZGtMqCZIOzG
X-Received: by 2002:a05:620a:468e:b0:79f:4b5:3697 with SMTP id af79cd13be357-7ab30dcbaa9mr3307465985a.63.1726687476495;
        Wed, 18 Sep 2024 12:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687476; cv=none;
        d=google.com; s=arc-20240605;
        b=WKI8bbe+woMbBOtNuuQyhge6luGxQ65vXP2PbaZ789HGH5+afxlGk3YM+OBSTX4byT
         KlJkTsYh4CCcOhydIYox/BbaMswX/VWK2TuMGN4rgp8BWhAI+jMIwnaHFrRf+A+9sG7h
         t0eDqy8CLH0y2sjtkwAU3Zbxlr3rfXelXe53/cWrrefbONgUAolfP+aQppUTMdU89RUl
         u7aWMq6MrJKGCAY9bghsNL4nk4/BvQStoPMSPntfcjbrG4txuCCrtbG7LfguoNKb3U+E
         rEVKbuVG3qf6VA3Um2cX0VWd9z8BSPv4nq6wnyaJzAFp+zdmk48mtHXULsnt8Oh2BiJ8
         /a+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=UuK6tEDguSgEq4sOmbOCdqmyqurQ/O4ePv8cGHfnsdc=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=Dv20GmUdCwqjmTSrXdchPnZ5J6LIDmsPJXJcjqFJWnJ87XQGt837Tj9qjJY2Kk0hLi
         IJAd89hsmQpjTT0z0UpaCOc50qdUbeUlqZa0jvVKeHmnxkhiCewQ6VcFJHQf8OlHXB0Y
         jjsDH22XZc8Yu43NHaZuXaJIx5WBLzm2b8BL7pTIJgM9beUwTwOvG9RM8VjrDOG18DRJ
         UVHME9UXAdgVqHDFNaS7GG2g0DiC7svsCzVif7V/ZgGb8bssodft8wuz0knmxps4Z7pF
         UsaUVuc9Ap5eWDeX5ELEp4JJa87S6kc95owwnUhs85pWfy8V0nD2B50GXxS2gD58e/C8
         Jciw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=utTvjly1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb08f5c6esi9819485a.639.2024.09.18.12.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=utTvjly1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0HE-0006eq-Gz; Wed, 18 Sep 2024 15:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vSjrZgUKCPgyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com>)
 id 1sr0HB-0006Pp-Ag
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:45 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vSjrZgUKCPgyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com>)
 id 1sr0H9-0007RW-1b
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:45 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-205425b7e27so2026895ad.0
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687421; x=1727292221; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UuK6tEDguSgEq4sOmbOCdqmyqurQ/O4ePv8cGHfnsdc=;
 b=utTvjly1U8Nscf6zQyiavHd004zWQw4gICm1+4H8SddyU3cP2UZVP8VfKt6HELeH5M
 5IM2aQ6ayyW0j1lEWS+zVYeKjJifVFTjNbQ39XJJAQVFXMc6eA9IiblMqvb7qBrjQsNK
 FSzYIfggpxJbMH03IDfSa9Kb8cu0rF4KG8P2BE9N0DHtZMkcHa3zc/1mg3trYiLasTz/
 iCnc6LY68PwNB2cnPzTDGSpKBcuDwIEg0ba2Y+dpy2CYD+kxYFtQ0OPyz6IkrFgHbclr
 6YYF9JabPMCOKG4QmkGW1PURLC7+wTbiRwgJWyQR5CLVyUstMIKYqfjsqV52sIHKquK8
 OTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687421; x=1727292221;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UuK6tEDguSgEq4sOmbOCdqmyqurQ/O4ePv8cGHfnsdc=;
 b=igaYHxpufXReneRtYlxrlCqDinhXgvgyzcHq6rOgLNGOQDFyQs7VOUvMA9Uw4iHUmv
 CB7CUgCbogb/mqnIuBd7S2R3pAsjQQt/viFM2e/TUiVEGmneAxxCM66zLQkCWO/pX3zH
 Va2vELucu9uGpeQcSL2HaP0WXPy8icfjlxWyneqdCq6Mb0sGMHYkE21B36Vjn1AXdhdp
 NSshYUvZZ5VLAJ+eM1ZyK7m+6y6hEjO89+PysUzD1l4+mlzfobOsZGZM73WvKSAtcMyZ
 trF2q6vRNG+kuEcXU6lJXKtmr/i9HeBopHKUs3t/SZOeMTt56XPYejVYyg0oG89QwNN+
 M0oQ==
X-Gm-Message-State: AOJu0YyXO1UAzV7fWxYHw9HYf168f2viV9o2izMoX2HM+096vw2I6NRB
 p5SoiehCWdMJZEyDVzurzyisCAJ3Y3rg2QHMxx7bNPTDuS+f3dRuEPs3xgFlKe0/OvBVvob1xA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:d486:b0:206:a574:b4f1
 with SMTP id
 d9443c01a7336-20782a68cfcmr17873365ad.8.1726687421442; Wed, 18 Sep 2024
 12:23:41 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:52 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-25-tavip@google.com>
Subject: [PATCH 24/25] systems/qtest: add device clock APIs
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3vSjrZgUKCPgyf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cJCdzlsPLgxk

Add qtest APIs to check the device clock frequency.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/qdev-clock.h       | 10 +++++++
 tests/qtest/libqtest-single.h | 24 +++++++++++++++++
 tests/qtest/libqtest.h        | 22 +++++++++++++++
 hw/core/qdev-clock.c          |  2 +-
 system/qtest.c                | 51 +++++++++++++++++++++++++++++++++++
 tests/qtest/libqtest.c        | 29 ++++++++++++++++++++
 6 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
index ffa0f7ba09..19ed34ae88 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -15,6 +15,7 @@
 #define QDEV_CLOCK_H
 
 #include "hw/clock.h"
+#include "hw/qdev-core.h"
 
 /**
  * qdev_init_clock_in:
@@ -161,4 +162,13 @@ typedef struct ClockPortInitElem ClockPortInitArray[];
  */
 void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks);
 
+/**
+ * qdev_get_clocklist:
+ * @dev: the device to find clock for
+ * @name: clock name
+ *
+ * Returns: a named clock list entry or NULL if the clock was not found
+ */
+NamedClockList *qdev_get_clocklist(DeviceState *dev, const char *name);
+
 #endif /* QDEV_CLOCK_H */
diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index c22037c8b2..51eb69ff74 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -408,4 +408,28 @@ static inline int64_t clock_step(int64_t step)
     return qtest_clock_step(global_qtest, step);
 }
 
+/**
+ * qtest_qdev_clock_in_get_hz:
+ * @path: QOM path of a device.
+ * @name: Clock name.
+ *
+ * Returns: device clock frequency in HZ
+ */
+static inline uint64_t dev_clock_in_get_hz(const char *path, const char *name)
+{
+    return qtest_dev_clock_in_get_hz(global_qtest, path, name);
+}
+
+/**
+ * qtest_qdev_clock_out_get_hz:
+ * @path: QOM path of a device.
+ * @name: Clock name.
+ *
+ * Returns: device clock frequency in HZ
+ */
+static inline uint64_t dev_clock_out_get_hz(const char *path, const char *name)
+{
+    return qtest_dev_clock_out_get_hz(global_qtest, path, name);
+}
+
 #endif
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index f9bbeb2e60..cfb7098985 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -1169,4 +1169,26 @@ bool have_qemu_img(void);
  */
 bool mkimg(const char *file, const char *fmt, unsigned size_mb);
 
+/**
+ * qtest_qdev_clock_in_get_hz:
+ * @s: #QTestState instance to operate on.
+ * @path: QOM path of a device.
+ * @name: Clock name.
+ *
+ * Returns: device clock frequency in HZ
+ */
+uint64_t qtest_dev_clock_in_get_hz(QTestState *s, const char *path,
+                                   const char *name);
+
+/**
+ * qtest_qdev_clock_out_get_hz:
+ * @s: #QTestState instance to operate on.
+ * @path: QOM path of a device.
+ * @name: Clock name.
+ *
+ * Returns: device clock frequency in HZ
+ */
+uint64_t qtest_dev_clock_out_get_hz(QTestState *s, const char *path,
+                                    const char *name);
+
 #endif
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index 82799577f3..3c9e2d5d73 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -144,7 +144,7 @@ void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)
     }
 }
 
-static NamedClockList *qdev_get_clocklist(DeviceState *dev, const char *name)
+NamedClockList *qdev_get_clocklist(DeviceState *dev, const char *name)
 {
     NamedClockList *ncl;
 
diff --git a/system/qtest.c b/system/qtest.c
index 95bb80a2bc..465666a416 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -19,6 +19,7 @@
 #include "exec/ioport.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
+#include "hw/qdev-clock.h"
 #include "hw/qdev-core.h"
 #include "hw/irq.h"
 #include "hw/core/cpu.h"
@@ -245,6 +246,20 @@ static void *qtest_server_send_opaque;
  *
  * Forcibly set the given interrupt pin to the given level.
  *
+ * Device clock frequency
+ * """"""""""""""""""""""
+ *
+ * .. code-block:: none
+ *
+ *  > qdev_clock_out_get_hz QOM-PATH CLOCK-NAME
+ *  < OK HZ
+ *
+ * .. code-block:: none
+ *
+ *  > qdev_clock_in_get_hz QOM-PATH CLOCK-NAME
+ *  < OK HZ
+ *
+ * where HZ is the clock frequency in hertz.
  */
 
 static int hex2nib(char ch)
@@ -758,6 +773,42 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_send_prefix(chr);
         qtest_sendf(chr, "OK %"PRIi64"\n",
                     (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+    } else if (strcmp(words[0], "qdev_clock_in_get_hz") == 0 ||
+               strcmp(words[0], "qdev_clock_out_get_hz") == 0) {
+        bool is_outbound = words[0][11] == 'o';
+        DeviceState *dev;
+        NamedClockList *ncl;
+
+        g_assert(words[1]);
+        g_assert(words[2]);
+
+        dev = DEVICE(object_resolve_path(words[1], NULL));
+        if (!dev) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Unknown device\n");
+            return;
+        }
+
+        ncl = qdev_get_clocklist(dev, words[2]);
+        if (!ncl) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Unknown clock\n");
+            return;
+        }
+
+        if (is_outbound && !ncl->output) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Not an output clock\n");
+            return;
+        }
+
+        if (!is_outbound && ncl->output) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Not an input clock\n");
+            return;
+        }
+
+        qtest_sendf(chr, "OK %u\n", clock_get_hz(ncl->clock));
     } else if (process_command_cb && process_command_cb(chr, words)) {
         /* Command got consumed by the callback handler */
     } else {
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 4055d6b953..cc11b5f42e 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -2065,3 +2065,32 @@ bool mkimg(const char *file, const char *fmt, unsigned size_mb)
 
     return ret && !err;
 }
+
+static uint64_t qtest_dev_clock_get_hz(QTestState *s, const char *path,
+                                       const char *name, bool out)
+{
+    gchar **args;
+    int ret;
+    uint64_t value;
+
+    qtest_sendf(s, "qdev_clock_%s_get_hz %s %s\n", out ? "out" : "in",
+                path, name);
+    args = qtest_rsp_args(s, 2);
+    ret = qemu_strtou64(args[1], NULL, 0, &value);
+    g_assert(!ret);
+    g_strfreev(args);
+
+    return value;
+}
+
+uint64_t qtest_dev_clock_out_get_hz(QTestState *s, const char *path,
+                                    const char *name)
+{
+    return qtest_dev_clock_get_hz(s, path, name, true);
+}
+
+uint64_t qtest_dev_clock_in_get_hz(QTestState *s, const char *path,
+                                   const char *name)
+{
+    return qtest_dev_clock_get_hz(s, path, name, false);
+}
-- 
2.46.0.662.g92d0881bb0-goog

