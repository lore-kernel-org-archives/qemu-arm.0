Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1455870lfb;
        Mon, 6 Jun 2022 08:34:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPC4sVzNjed70teT2k3ejZVCidwxls/xDISz/xUQpJTcOp/wiYmpSDNgrGSEIrwBr6sYen
X-Received: by 2002:a05:6214:238b:b0:456:30d0:140e with SMTP id fw11-20020a056214238b00b0045630d0140emr72366364qvb.84.1654529650173;
        Mon, 06 Jun 2022 08:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654529650; cv=none;
        d=google.com; s=arc-20160816;
        b=zFQjwuX6wOEXtm/mal/yVoXYaQuBCc94Lqy2jlsAWF51/mElt7yRLPx1LLLEMOxXs7
         PcwS8ClA8z3v9wSDJ9igYb8xnrnXQFLVtux5b/lqmqQxc0ACgJoLLIpm5XtrQUgTNhIe
         H/ucgilsBK2klhTO9m2N+9ycnL+jnMGhl2xyBe/kvrcWEIvhAjR3Exe+JwNKtKOyiSBW
         roSW3uKGxRIAcu+9SIdjclxcoTREhug3IVf1Vu25cu4x8ozdg0syaJ2Re8uCsz5g7/Yk
         5BHMNmEythVDWIGBVyHBH5wvRtG5a3PBEFCL3CSQ0SrzM2QIV1UUuud0kByO01Q/EwZ2
         MLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=048IR1BCWtezerl6ePw6GsP8CqZKwTT1lnQ50IHMUGY=;
        b=OKN5bVws6YbnpIhwO8npM+qGtNQyhgNXqMcs67vVjyjrzY7bE864OLsGfCK2Dk9z/F
         AuJAv+B+OC8nBgo6A7yb/7MKt7x+2pLFqF7yFiRNVxRdnzzv6Lltc6gJoK1nrRN9U5Rh
         sGJ3FXOS8ggeoZaCKfa9kr4Ohbxck/Kw864C2LyVV8cRDvxuSe5gXfS1ruMB6/UVCgCj
         LT3NN6zDfUi7Z2P9A8y/3tFTqaJ9+0WXkpO0X/kiX5Am21TK3P9Iua7PILfW+lJQOyfb
         R5nbHwix+CesKVV4gtYlG+1g3/eyAcnfht7L5XzdrI68NscNJ1mtyCFRRvjcpPMsG6Wz
         tFag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020a05622a020d00b00304b8df4730si8826787qtx.188.2022.06.06.08.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEk5-0001cJ-Lg
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEKq-0004pq-V6; Mon, 06 Jun 2022 11:08:04 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEKo-0005wx-UY; Mon, 06 Jun 2022 11:08:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxgb3rlWz4xYX;
 Tue,  7 Jun 2022 01:07:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxgV1Gxrz4xD5;
 Tue,  7 Jun 2022 01:07:49 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 01/21] hw/registerfields: Add shared fields macros
Date: Mon,  6 Jun 2022 17:07:12 +0200
Message-Id: <20220606150732.2282041-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: LwMbR/iEoKRy

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

