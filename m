Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp19891nji;
        Mon, 26 Aug 2024 23:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqIqhaNET8Qlr627udbiIS/Os9CyERi72ou7hzqY2wiFx4b2J6K1TBlbz5WMFwhjiJfafqMgK7JKEKjA==@linaro.org
X-Google-Smtp-Source: AGHT+IH6STRpE9NCDQSOIYyl4ROaKEYVLzkp4IDm45JeSvxvZq5qPhi6QbXrB3h6WY4ymRrNsjA6
X-Received: by 2002:a05:6902:1549:b0:e13:d34d:f3bc with SMTP id 3f1490d57ef6-e1a2a5dc780mr2263530276.28.1724741367410;
        Mon, 26 Aug 2024 23:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741367; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6lPXI5wlWUr1AOkyY5fTeFF3zsUcp9X+X9PuyXilnma3O1HdmZ9YWzRQs6xA4xft8
         yzW0KOzdckX/B20CqcoDYglYavjSd6g/bX7e1Cic7ceK/yepJXnX14LHKPl1rPokyfZc
         7DOv43FfOs/hxJELV/41IjCgCnYymVjtFLjsuPedDS4NYlOfBoOksKpXrTGiBlavm9bg
         M2H6qEUkrDrOx2tjrM/leIemJyJdVeLyaIf6tME1Gc+tDFuyoI53OXFRRn3JsP0vYcSW
         8evL2AlB70hzw9ZzuHM+5gZIP5ofIQL3/5/7WZ8Sm6O8BeeNhREWfU4u2gXgQS5AOniI
         KbjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=l2IJ23AA+L9quejsK+HDOTMC8Z6ryPJ4LKtPu/6Wdss=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=A8BKW4UjY5pfEf5mtcBpmr0qKhPM6JTRAsXqjdH/Tb5maICEG9C9hMvuXopCssKSRM
         LYJ8EXuMX2iDsByWl6H1OhvAQ8mJnkdvXuNBNCgLcLPczo9GyP7GOWTCQjfPBCqn0T4z
         DSJPO9fFTmBjLx+x9vDE9BNkT9yJ5aeAcpyULQfLNUPorkAfl4esTfa16sAW6TLB4SND
         dPjvQonlalEW6UuXehjghuVmabMgYPPfM53zt44vwMfzWVv7mn58EW8sL39geceS/F4X
         bAzBckk2uVbdCOrNPyn95neqyJKNuu+lMuV6cRjjd646ei5PuCO+cDP2pPZbx6PAQzKe
         T/wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=keOwgcUu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe0d3357si129556481cf.70.2024.08.26.23.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=keOwgcUu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sipyU-0005E3-Ra; Tue, 27 Aug 2024 02:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3J3bNZgUKCIY3k5szqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--tavip.bounces.google.com>)
 id 1sipyG-00048k-PD
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:31 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3J3bNZgUKCIY3k5szqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--tavip.bounces.google.com>)
 id 1sipy8-00069N-8U
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:25 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e164ceba5ffso8711430276.3
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 23:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741159; x=1725345959; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=l2IJ23AA+L9quejsK+HDOTMC8Z6ryPJ4LKtPu/6Wdss=;
 b=keOwgcUuX5ozQA/Z8jDrWMCMnw3ke2axr9Ms3y0qOG0Pycmgfn/iQ+3nnOeVYr8zbp
 cV/PTtJ/t+gnskbWepkAulLKMe51CB3hAmsw6XEyr7SArN/cXCfZ6aoyTMDgjIJL6Wrk
 WWGWCFImM8WK+y1+fd0tJoA34LShnuoWyqaKqB9wpZi8RBpNUipoYz5172oZ960K8fOJ
 JoivXVvbELVgk1/gUam7sgKw3S2Y5RP9YDgDpJL9SCt6LsO7I+wufjAhjny5mYXLMGxv
 iH1rgKDgbQlCQemg6jfkuM47VRp5l4eirnRoa/rGMlvzp5qL8/0kxFZiLbXqN990m1M+
 PaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741159; x=1725345959;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l2IJ23AA+L9quejsK+HDOTMC8Z6ryPJ4LKtPu/6Wdss=;
 b=n5zwG8J6FPxDXy7heb8vLo3NKFe+mF5bl8hzBBIir9cKyG1rwM8qRcXTODb3ARVtfe
 O5lk5isFaUYtHjkNDTDZbIv0qElz29wmM7eenkae8Dn/GJcqB/q7F+odOxfxyNIEoDKg
 /m0Ar/PHge1FX6KH3jqpCnrNEkrNOwmTba576pMUAGC4lE/d2/DZVW2NLfaw3JkgxkLK
 00hG++KGEYyQ2KLlG80tlPsUn5zJyb+cyPaVIxzm8SbxZ57XXpvhYZvtpbnhK/nDwiCR
 NUKj317Wp2osTf/b/AHHwIVtZeeuZ3JDLEtQWkFXnYImxdGA/jpMKtXxf1HR8LliHWMs
 FM0w==
X-Gm-Message-State: AOJu0YwosyRV0TyPibKkE6aKP7hH9snvMGi8IXvMmI427wt7EIuPIbcj
 zames/JUY3XUmYHtbeCkxgGrFKNU3EYnJORT5f1E1WksxdSmXXvbGGHk1Q2Yrs5Z7cxb7T6lBw=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a25:8390:0:b0:e11:7210:f651 with
 SMTP id
 3f1490d57ef6-e1a2a944c13mr27345276.7.1724741159036; Mon, 26 Aug 2024 23:45:59
 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:19 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-16-tavip@google.com>
Subject: [RFC PATCH v3 15/24] system/qtest: add APIS to check for memory
 access failures
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3J3bNZgUKCIY3k5szqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--tavip.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: VI/oCcIrcoxv

Add read*/write*_fail qtest APIs to check for memory access failures.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/libqtest-single.h | 92 +++++++++++++++++++++++++++++++++++
 tests/qtest/libqtest.h        | 76 +++++++++++++++++++++++++++++
 system/qtest.c                | 44 ++++++++++-------
 tests/qtest/libqtest.c        | 73 ++++++++++++++++++++++++++-
 4 files changed, 265 insertions(+), 20 deletions(-)

diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index 851724cbcb..c22037c8b2 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -265,6 +265,98 @@ static inline uint64_t readq(uint64_t addr)
     return qtest_readq(global_qtest, addr);
 }
 
+/**
+ * writeb_fail:
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes an 8-bit value to memory expecting a failure.
+ */
+static inline void writeb_fail(uint64_t addr, uint8_t value)
+{
+    qtest_writeb_fail(global_qtest, addr, value);
+}
+
+/**
+ * writew_fail:
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 16-bit value to memory expecting a failure.
+ */
+static inline void writew_fail(uint64_t addr, uint16_t value)
+{
+    qtest_writew_fail(global_qtest, addr, value);
+}
+
+/**
+ * writel_fail:
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 32-bit value to memory expecting a failure.
+ */
+static inline void writel_fail(uint64_t addr, uint32_t value)
+{
+    qtest_writel_fail(global_qtest, addr, value);
+}
+
+/**
+ * writeq_fail:
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 64-bit value to memory expecting a failure.
+ */
+static inline void writeq_fail(uint64_t addr, uint64_t value)
+{
+    qtest_writeq_fail(global_qtest, addr, value);
+}
+
+/**
+ * readb_fail:
+ * @addr: Guest address to read from.
+ *
+ * Reads an 8-bit value from memory expecting a failure.
+ */
+static inline void readb_fail(uint64_t addr)
+{
+    qtest_readb_fail(global_qtest, addr);
+}
+
+/**
+ * readw_fail:
+ * @addr: Guest address to read from.
+ *
+ * Reads a 16-bit value from memory expecting a failure.
+ */
+static inline void readw_fail(uint64_t addr)
+{
+    qtest_readw_fail(global_qtest, addr);
+}
+
+/**
+ * readl_fail:
+ * @addr: Guest address to read from.
+ *
+ * Reads a 32-bit value from memory expecting a failure.
+ */
+static inline void readl_fail(uint64_t addr)
+{
+    qtest_readl_fail(global_qtest, addr);
+}
+
+/**
+ * readq_fail:
+ * @addr: Guest address to read from.
+ *
+ * Reads a 64-bit value from memory expecting a failure.
+ */
+static inline void readq_fail(uint64_t addr)
+{
+    qtest_readq_fail(global_qtest, addr);
+}
+
 /**
  * memread:
  * @addr: Guest address to read from.
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 6e3d3525bf..9057d019c6 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -549,6 +549,82 @@ uint32_t qtest_readl(QTestState *s, uint64_t addr);
  */
 uint64_t qtest_readq(QTestState *s, uint64_t addr);
 
+/**
+ * qtest_writeb_fail:
+ * @s: #QTestState instance to operate on.
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes an 8-bit value to memory expecting a failure.
+ */
+void qtest_writeb_fail(QTestState *s, uint64_t addr, uint8_t value);
+
+/**
+ * qtest_writew_fail:
+ * @s: #QTestState instance to operate on.
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 16-bit value to memory expecting a failure.
+ */
+void qtest_writew_fail(QTestState *s, uint64_t addr, uint16_t value);
+
+/**
+ * qtest_writel_fail:
+ * @s: #QTestState instance to operate on.
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 32-bit value to memory expecting a failure.
+ */
+void qtest_writel_fail(QTestState *s, uint64_t addr, uint32_t value);
+
+/**
+ * qtest_writeq_fail:
+ * @s: #QTestState instance to operate on.
+ * @addr: Guest address to write to.
+ * @value: Value being written.
+ *
+ * Writes a 64-bit value to memory expecting a failure.
+ */
+void qtest_writeq_fail(QTestState *s, uint64_t addr, uint64_t value);
+
+/**
+ * qtest_readb_fail:
+ * @s: #QTestState instance to operate on.
+ * @addr: Guest address to read from.
+ *
+ * Reads an 8-bit value from memory expecting a failure.
+ */
+void qtest_readb_fail(QTestState *s, uint64_t addr);
+
+/**
+ * qtest_readw_fail:
+ * @s: #QTestState instance to operate on.
+ * @addr: Guest address to read from.
+ *
+ * Reads a 16-bit value from memory expecting a failure.
+ */
+void qtest_readw_fail(QTestState *s, uint64_t addr);
+
+/**
+ * qtest_readl_fail:
+ * @s: #QTestState instance to operate on.
+ * @addr: Guest address to read from.
+ *
+ * Reads a 32-bit value from memory expecting a failure.
+ */
+void qtest_readl_fail(QTestState *s, uint64_t addr);
+
+/**
+ * qtest_readq_fail:
+ * @s: #QTestState instance to operate on.
+ * @addr: Guest address to read from.
+ *
+ * Reads a 64-bit value from memory expecting a failure.
+ */
+void qtest_readq_fail(QTestState *s, uint64_t addr);
+
 /**
  * qtest_memread:
  * @s: #QTestState instance to operate on.
diff --git a/system/qtest.c b/system/qtest.c
index 507a358f3b..da46388a6e 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -546,26 +546,30 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         if (words[0][5] == 'b') {
             uint8_t data = value;
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
-                                &data, 1);
+            ret = address_space_write(first_cpu->as, addr,
+                                      MEMTXATTRS_UNSPECIFIED, &data, 1);
         } else if (words[0][5] == 'w') {
             uint16_t data = value;
             tswap16s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
-                                &data, 2);
+            ret = address_space_write(first_cpu->as, addr,
+                                      MEMTXATTRS_UNSPECIFIED, &data, 2);
         } else if (words[0][5] == 'l') {
             uint32_t data = value;
             tswap32s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
-                                &data, 4);
+            ret = address_space_write(first_cpu->as, addr,
+                                      MEMTXATTRS_UNSPECIFIED, &data, 4);
         } else if (words[0][5] == 'q') {
             uint64_t data = value;
             tswap64s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
-                                &data, 8);
+            ret = address_space_write(first_cpu->as, addr,
+                                      MEMTXATTRS_UNSPECIFIED, &data, 8);
         }
         qtest_send_prefix(chr);
-        qtest_send(chr, "OK\n");
+        if (ret == MEMTX_OK) {
+            qtest_send(chr, "OK\n");
+        } else {
+            qtest_send(chr, "FAIL\n");
+        }
     } else if (strcmp(words[0], "readb") == 0 ||
                strcmp(words[0], "readw") == 0 ||
                strcmp(words[0], "readl") == 0 ||
@@ -580,26 +584,30 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         if (words[0][4] == 'b') {
             uint8_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
-                               &data, 1);
+            ret = address_space_read(first_cpu->as, addr,
+                                     MEMTXATTRS_UNSPECIFIED, &data, 1);
             value = data;
         } else if (words[0][4] == 'w') {
             uint16_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
-                               &data, 2);
+            ret = address_space_read(first_cpu->as, addr,
+                                     MEMTXATTRS_UNSPECIFIED, &data, 2);
             value = tswap16(data);
         } else if (words[0][4] == 'l') {
             uint32_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
-                               &data, 4);
+            ret = address_space_read(first_cpu->as, addr,
+                                     MEMTXATTRS_UNSPECIFIED, &data, 4);
             value = tswap32(data);
         } else if (words[0][4] == 'q') {
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
-                               &value, 8);
+            ret = address_space_read(first_cpu->as, addr,
+                                     MEMTXATTRS_UNSPECIFIED, &value, 8);
             tswap64s(&value);
         }
         qtest_send_prefix(chr);
-        qtest_sendf(chr, "OK 0x%016" PRIx64 "\n", value);
+        if (ret == MEMTX_OK) {
+            qtest_sendf(chr, "OK 0x%016" PRIx64 "\n", value);
+        } else {
+            qtest_sendf(chr, "FAIL\n");
+        }
     } else if (strcmp(words[0], "read") == 0) {
         g_autoptr(GString) enc = NULL;
         uint64_t addr, len;
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index d8f80d335e..62ba49d5d8 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -665,7 +665,7 @@ static GString *qtest_client_socket_recv_line(QTestState *s)
     return line;
 }
 
-static gchar **qtest_rsp_args(QTestState *s, int expected_args)
+static gchar **_qtest_rsp_args(QTestState *s, int expected_args, bool fail)
 {
     GString *line;
     gchar **words;
@@ -699,7 +699,11 @@ redo:
     }
 
     g_assert(words[0] != NULL);
-    g_assert_cmpstr(words[0], ==, "OK");
+    if (fail) {
+        g_assert_cmpstr(words[0], ==, "FAIL");
+    } else {
+        g_assert_cmpstr(words[0], ==, "OK");
+    }
 
     for (i = 0; i < expected_args; i++) {
         g_assert(words[i] != NULL);
@@ -708,6 +712,11 @@ redo:
     return words;
 }
 
+static gchar **qtest_rsp_args(QTestState *s, int expected_args)
+{
+    return _qtest_rsp_args(s, expected_args, false);
+}
+
 static void qtest_rsp(QTestState *s)
 {
     gchar **words = qtest_rsp_args(s, 0);
@@ -715,6 +724,13 @@ static void qtest_rsp(QTestState *s)
     g_strfreev(words);
 }
 
+static void qtest_rsp_fail(QTestState *s)
+{
+    gchar **words = _qtest_rsp_args(s, 0, true);
+
+    g_strfreev(words);
+}
+
 static int qtest_query_target_endianness(QTestState *s)
 {
     gchar **args;
@@ -1100,6 +1116,13 @@ static void qtest_write(QTestState *s, const char *cmd, uint64_t addr,
     qtest_rsp(s);
 }
 
+static void qtest_write_fail(QTestState *s, const char *cmd, uint64_t addr,
+                             uint64_t value)
+{
+    qtest_sendf(s, "%s 0x%" PRIx64 " 0x%" PRIx64 "\n", cmd, addr, value);
+    qtest_rsp_fail(s);
+}
+
 void qtest_writeb(QTestState *s, uint64_t addr, uint8_t value)
 {
     qtest_write(s, "writeb", addr, value);
@@ -1120,6 +1143,26 @@ void qtest_writeq(QTestState *s, uint64_t addr, uint64_t value)
     qtest_write(s, "writeq", addr, value);
 }
 
+void qtest_writeb_fail(QTestState *s, uint64_t addr, uint8_t value)
+{
+    qtest_write_fail(s, "writeb", addr, value);
+}
+
+void qtest_writew_fail(QTestState *s, uint64_t addr, uint16_t value)
+{
+    qtest_write_fail(s, "writew", addr, value);
+}
+
+void qtest_writel_fail(QTestState *s, uint64_t addr, uint32_t value)
+{
+    qtest_write_fail(s, "writel", addr, value);
+}
+
+void qtest_writeq_fail(QTestState *s, uint64_t addr, uint64_t value)
+{
+    qtest_write_fail(s, "writeq", addr, value);
+}
+
 static uint64_t qtest_read(QTestState *s, const char *cmd, uint64_t addr)
 {
     gchar **args;
@@ -1135,6 +1178,12 @@ static uint64_t qtest_read(QTestState *s, const char *cmd, uint64_t addr)
     return value;
 }
 
+static void qtest_read_fail(QTestState *s, const char *cmd, uint64_t addr)
+{
+    qtest_sendf(s, "%s 0x%" PRIx64 "\n", cmd, addr);
+    qtest_rsp_fail(s);
+}
+
 uint8_t qtest_readb(QTestState *s, uint64_t addr)
 {
     return qtest_read(s, "readb", addr);
@@ -1155,6 +1204,26 @@ uint64_t qtest_readq(QTestState *s, uint64_t addr)
     return qtest_read(s, "readq", addr);
 }
 
+void qtest_readb_fail(QTestState *s, uint64_t addr)
+{
+    qtest_read_fail(s, "readb", addr);
+}
+
+void qtest_readw_fail(QTestState *s, uint64_t addr)
+{
+    qtest_read_fail(s, "readw", addr);
+}
+
+void qtest_readl_fail(QTestState *s, uint64_t addr)
+{
+    qtest_read_fail(s, "readl", addr);
+}
+
+void qtest_readq_fail(QTestState *s, uint64_t addr)
+{
+    qtest_read(s, "readq", addr);
+}
+
 static int hex2nib(char ch)
 {
     if (ch >= '0' && ch <= '9') {
-- 
2.46.0.295.g3b9ea8a38a-goog

