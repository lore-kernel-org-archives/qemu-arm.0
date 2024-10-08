Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2289345njb;
        Mon, 7 Oct 2024 18:22:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtdzZhh+lY+OVgMR+epll0Z4CdNdsPItQa5oZeKzOQz64TNfcoyH22SfLrb7RQPQV1k5lHh2B8PlBz7g==@linaro.org
X-Google-Smtp-Source: AGHT+IE3l00tZWhmAx1wTERcAhOTP8MWrrIwlEKY84dzB4iMCPJts27uA5Ut3Zh8ZY44uMDn8Swz
X-Received: by 2002:a05:6214:4806:b0:6cb:4c1c:508d with SMTP id 6a1803df08f44-6cb9a30e2b6mr226306026d6.28.1728350536500;
        Mon, 07 Oct 2024 18:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350536; cv=none;
        d=google.com; s=arc-20240605;
        b=ONCwfduZg1w8Nb5G+FFwwLoOxuI85/zbY9tkX2bkbstVZKaWOng3hfSFu7zq44hzk1
         4V2WCCwm7msSH6XSmX5yNXfV+uWi6xqG8U52PF4oBbZ07Nj4rCyRJrh124fIvGhTIP/G
         w3rM8e0W+vYrY6JZuyQ5b24e+w2V74OtPpjJ76ddtqJm3vatOgCrd5PrmdMdRQB+p7cc
         QARyVd+15udPELLjzj+PVvXlsn9EG2FjMMsQSV5uVxaCj8b5La6otOGT69jgMC1IFq04
         EmtG4SjtXrxbPEw0unCLzWuLD+MeCzhQFcJKqb1+dC/NMwifKJIkC/B7SAV7bJKNi3hW
         +0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=4/p/dqyX4FDV19scC8uVsqmc4fVxq0udNnyaIq4QvGw=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=Yl3damKPhMXdUOoP+RSeJrJrvplF1c2C0m0cLFj5FyOLPKOV6xMeQqJNYJUdXCOEtZ
         m3w9pWuvMcuyzZYJtLen6D9G5G8WKZ1eSu3+7LWtAdPcWbCNZPcfyDJDJA7a7CqaTel7
         gWSOARcPlZJzeixIzkClbNEwxkaB2Onyz1Hwh8cGj6mKZK3vfwwPUZu65fXlQsK0RRrT
         NcmTt2AT17DfESTyhbjvsY2Tg1mkBI/ICOCupBnSp5KNwYzD34Nz7Uif6vUZYNrtQMpH
         R+9umTA53G7nqBl7izfvODk4LCnSZi+rvqfvh12kLDQwcBRH9ltf3k5dLzupkYt35VmT
         MtHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=dRNmDKoq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba47ae382si74422476d6.616.2024.10.07.18.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=dRNmDKoq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxyuq-0007ul-94; Mon, 07 Oct 2024 21:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qYgEZwUKCAw5m7u1s00sxq.o0y2qy6-m3yz0zsz6.03s@flex--tavip.bounces.google.com>)
 id 1sxyt4-0000U6-SQ
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:43 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qYgEZwUKCAw5m7u1s00sxq.o0y2qy6-m3yz0zsz6.03s@flex--tavip.bounces.google.com>)
 id 1sxyt1-0000Gc-Tl
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:42 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e28ea737dd5so894716276.3
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350378; x=1728955178; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=4/p/dqyX4FDV19scC8uVsqmc4fVxq0udNnyaIq4QvGw=;
 b=dRNmDKoqGYJKz8PvcVLvateHdv0/LjTyXs3i9pC5R6VozwdL1isHYoN9bWZCTM0oaa
 mjsa4doJKgz+6W+zOH8rorErIEKmGYqPtejTxLrYDnDeRnhGYPp1mTxRhg48Vu7bFtak
 IzkillXatDI/zLTvT2Elgw+4noX0qZ5f9aTEkA3YtktRog7xAvwM4ZuJ341ekUECA2x0
 Psi9LtUmhIHJpv3X77x6bCmYgl9Ccd/rS15yLwSifOfXJPusQDndwdUDabaSDCHGHhko
 86O54MQ6Uwf/Sj6z0wdK9aMmBp8jE7EFio5q6Q6u6DlaowCJ8z/7Y8L3ZG5BwI/O6ya1
 HyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350378; x=1728955178;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4/p/dqyX4FDV19scC8uVsqmc4fVxq0udNnyaIq4QvGw=;
 b=p29RqA9SjGmBWTwChaXbsi5IwjdsD8s+p/uD0KO4K9TRPcbX7ggYtTGVuWyeySOi9F
 5uP9btwa0PbHbZ8yZspbyOqEsI4VDn082h8oWtT7RYkeZcWAhGHW31PN/cYcZnsJZDaU
 NSvH2lX72o3EXEhKYLoReC8pGDK4wrOTpwsjNTRtjFLH90p5AWH/CRRDKam0rSS3aDLd
 INQETEEAPigqoCk45KfxTM611JCZ7bstEIt/gM1xwDU2ZyFXih47rhuvcbcNYV2f9DQI
 lQKfkC5b5KDTZ+iDYxAlZRLTCKNxtN15RNeUatYXWVmS9MZjIe74ILkcWuH043vxuPJD
 M14A==
X-Gm-Message-State: AOJu0YzaxEXUWWpy1pZixt7zo0YdCiHcmLyfnFK3risuD1drQRzFNqPu
 EmEEUhG34DUwBsCqudclupsunK1q/z2hCtFJxOOXotmc6XfBgb0br/9pllOkLIC2EOq7RxmqiA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6902:1786:b0:e25:d202:d376
 with SMTP id
 3f1490d57ef6-e28be89b1a9mr5368276.6.1728350377903; Mon, 07 Oct 2024 18:19:37
 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:50 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-25-tavip@google.com>
Subject: [PATCH v2 24/25] systems/qtest: add device clock APIs
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3qYgEZwUKCAw5m7u1s00sxq.o0y2qy6-m3yz0zsz6.03s@flex--tavip.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
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
X-TUID: PHA/3EyIkmNL

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
2.47.0.rc0.187.ge670bccf7e-goog

