Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1878970lft;
        Wed, 22 Jun 2022 03:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9NqhJMSpb2aac3mTt4J2YJ8WlL+qgu2yjYf4G9W1jU0tCS7K7eIRVx+vMssqDSxblQ5JJ
X-Received: by 2002:a05:6214:f2c:b0:470:41c9:9100 with SMTP id iw12-20020a0562140f2c00b0047041c99100mr12152186qvb.112.1655892389713;
        Wed, 22 Jun 2022 03:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655892389; cv=none;
        d=google.com; s=arc-20160816;
        b=EPXyzYeck83JVOI+jkFoIGEromxXz1sVwooNDIXKW5f2m0b2OEAENi0Ufwf17FpR05
         J0S1Fgt0kp4icYIqb9bF+EWP5uPQU5UivNIGWesTn1IGP/N7/hD5kLQkdiCsI7z2t1yX
         0rBOoyFptNEYua3DNYMTqfZtaAFB8lBsdDQPEStPrVFKKkFtrlnFtRm/3VxBGiuV+Yga
         jU4jsQTeW70CFeuP2sAVCdF28ZdJw/HU7hfGyer/ZmoKm/naQSFicoMOSLpaX4wwePRo
         mKY7bHBN4Gv5vQCTaNdJqPzV2xQppe1/u/eVuBziplkZiWMYvg9luDeJFW9IbYKfY5pb
         j+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=048IR1BCWtezerl6ePw6GsP8CqZKwTT1lnQ50IHMUGY=;
        b=Gp6WIZ/V1eD6Kzstbxavo3N5jVqOdc5t91nlerhlWEI2CpZellSRHpg4/yFmbMmid4
         3h0H3uKdLvB3EI8rMW4EbEbkBRyDQYTUlpay9wUPYYlEuPEsrLeUEbpiijfK4TqULURG
         T0mqHG6cLhUd5XDN9kd0bkXEntDFOmdI27aB/SL9Wvmo7tFdTAiUKC5Un5iMo25APTaG
         ghg/Ii9LEj2FYd3dL/2HPEQhIhObNWY2VsrEkv2D4jmDR4NqKftUGqCG8MxDLeCIRxUr
         rced9Kd3T29VTUlfowSjDzGZsiwuYJjtrd+OfFOhLnrb/2FXdpvsc4vGwaKdMPJ3FpYM
         TeFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a31-20020a05620a439f00b006a3224bfdb4si11399274qkp.297.2022.06.22.03.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 03:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3xFl-0003Yu-6F
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 06:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5Q-0005mr-85; Wed, 22 Jun 2022 05:55:48 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:50503
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5N-0004ma-7N; Wed, 22 Jun 2022 05:55:47 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdzy6Qh7z4xYD;
 Wed, 22 Jun 2022 19:55:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzw5CwVz4xD9;
 Wed, 22 Jun 2022 19:55:40 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/19] hw/registerfields: Add shared fields macros
Date: Wed, 22 Jun 2022 11:55:08 +0200
Message-Id: <20220622095520.3683321-8-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ubvYCpy5g12c

From: Joe Komlodi <komlodi@google.com>

Occasionally a peripheral will have different operating modes, where the
MMIO layout changes, but some of the register fields have the same offsets
and behaviors.

To help support this, we add SHARED_FIELD_XX macros that create SHIFT,
LENGTH, and MASK macros for the fields that are shared across registers,
and accessors for these fields.

An example use may look as follows:
There is a peripheral with registers REG_MODE1 and REG_MODE2 at
different addreses, and both have a field FIELD1 initialized by
SHARED_FIELD().

Depending on what mode the peripheral is operating in, the user could
extract FIELD1 via
SHARED_ARRAY_FIELD_EX32(s->regs, R_REG_MODE1, FIELD1)
or
SHARED_ARRAY_FIELD_EX32(s->regs, R_REG_MODE2, FIELD1)

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: Id3dc53e7d2f8741c95697cbae69a81bb699fa3cb
Message-Id: <20220331043248.2237838-2-komlodi@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/registerfields.h | 70 +++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 3a88e135d025..1330ca77de61 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -154,4 +154,74 @@
 #define ARRAY_FIELD_DP64(regs, reg, field, val)                           \
     (regs)[R_ ## reg] = FIELD_DP64((regs)[R_ ## reg], reg, field, val);
 
+
+/*
+ * These macros can be used for defining and extracting fields that have the
+ * same bit position across multiple registers.
+ */
+
+/* Define shared SHIFT, LENGTH, and MASK constants */
+#define SHARED_FIELD(name, shift, length)   \
+    enum { name ## _ ## SHIFT = (shift)};   \
+    enum { name ## _ ## LENGTH = (length)}; \
+    enum { name ## _ ## MASK = MAKE_64BIT_MASK(shift, length)};
+
+/* Extract a shared field */
+#define SHARED_FIELD_EX8(storage, field) \
+    extract8((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX16(storage, field) \
+    extract16((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX32(storage, field) \
+    extract32((storage), field ## _SHIFT, field ## _LENGTH)
+
+#define SHARED_FIELD_EX64(storage, field) \
+    extract64((storage), field ## _SHIFT, field ## _LENGTH)
+
+/* Extract a shared field from a register array */
+#define SHARED_ARRAY_FIELD_EX32(regs, offset, field) \
+    SHARED_FIELD_EX32((regs)[(offset)], field)
+#define SHARED_ARRAY_FIELD_EX64(regs, offset, field) \
+    SHARED_FIELD_EX64((regs)[(offset)], field)
+
+/* Deposit a shared field */
+#define SHARED_FIELD_DP8(storage, field, val) ({                        \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint8_t _d;                                                         \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP16(storage, field, val) ({                       \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint16_t _d;                                                        \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP32(storage, field, val) ({                       \
+    struct {                                                            \
+        unsigned int v:field ## _LENGTH;                                \
+    } _v = { .v = val };                                                \
+    uint32_t _d;                                                        \
+    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+#define SHARED_FIELD_DP64(storage, field, val) ({                       \
+    struct {                                                            \
+        uint64_t v:field ## _LENGTH;                                    \
+    } _v = { .v = val };                                                \
+    uint64_t _d;                                                        \
+    _d = deposit64((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
+    _d; })
+
+/* Deposit a shared field to a register array */
+#define SHARED_ARRAY_FIELD_DP32(regs, offset, field, val) \
+    (regs)[(offset)] = SHARED_FIELD_DP32((regs)[(offset)], field, val);
+#define SHARED_ARRAY_FIELD_DP64(regs, offset, field, val) \
+    (regs)[(offset)] = SHARED_FIELD_DP64((regs)[(offset)], field, val);
+
 #endif
-- 
2.35.3

