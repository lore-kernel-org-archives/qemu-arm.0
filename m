Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658CAF30298
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 02:51:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1y2l-00028i-F1; Sun, 15 Mar 2026 22:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1y2h-00028I-Mu
 for qemu-arm@nongnu.org; Sun, 15 Mar 2026 22:50:55 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1y2g-0000Ws-2w
 for qemu-arm@nongnu.org; Sun, 15 Mar 2026 22:50:55 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-2be4781d2baso1710103eec.0
 for <qemu-arm@nongnu.org>; Sun, 15 Mar 2026 19:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773629453; x=1774234253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqLIpVr4djLYDOqzYTbrP//evleS3LXj53m2D/JbGEc=;
 b=J5MUEOBJpePp1l+DWz22xvTfAG1AvzPeNvEkmb3AlYDu3HFBE1pNBbiCxOOgGMQL9k
 IWxiIxDld7rsn8GOLidNwRRVHKEMHjzfHM5fQWlsXoX5Y51CEiMJK3zWn5z5ZSEAjqCa
 u+/St4BAAPxjMN0bd8xbCuNP3Q/MEYAdYTcIhprxKJMrS8+XNydx6PZ5ZyghTk9ySmKt
 SOcH/+gA7I5KEIDImQ9qceNvwPpWCP/R7VdRcfqQIEishwl811LQvOIi0cw+CLFxJQDF
 mAE9+O34FeTb4DoPxrDDFXBwp7/lOSDGMlZUvywTARu0PuLQbYMyyaFQ6xZTEPBCelDl
 lAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773629453; x=1774234253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iqLIpVr4djLYDOqzYTbrP//evleS3LXj53m2D/JbGEc=;
 b=s4pYjVd9oDHKERFeGzZLbbf00u9BYHaFHf2hqWvq4rXec5waZJS2u0l4nZoSvwXQMG
 eZEpl4vEnkHbSykgFFLxZ/FdOTNvP1eOCyM+prLDX1g0+xjacZGt+v+1bWc3UKq3j8ZQ
 rxFdU9c7VjNcOrzQT+JtwH1JIRCvHxkx/mv5OJaGJFiA+cKp3cNPlKPPpxfkEsoE2SzN
 kMLEyzxKAjLdNj5d1PM2QOfEZxwEP7Pg0Q0me79mZqLtVAcDWxzDDA82wGzVITPmz+1H
 6u7i1pdW3EpL8LvTwppi/ZkEEVq0RdwVqvbbYmKNS6JZZW73G6mC/sc63ib3KdBMiCjO
 YKgQ==
X-Gm-Message-State: AOJu0YzrltwEt7/rDA8LxlNrkYGBTY50Y+2cnT1yezO+KM3y7H5YVyIy
 9GgH6CWWeV7TGjjZgqUiLMz1577Cv4TbqaPuhsD2huCgK46AeybP1qoi
X-Gm-Gg: ATEYQzwfbLATMChCzoVv9KRqs5qJGss3cSysunyJooWOPH8DxUgpvsPqZQ7eYVRNzwN
 WTQakIQoYBDclBYNhYKsU/AQQUHoAlmaZBBTiPRiNjUdl4JdICd3mQYwfRup1wpYxyMk7T40Zkq
 /38AYH2A0lOKv5cgIE7qMfroNxSZjPrvPm7U7CoC8+wb2Yeuj5Daxeji+u44M1PPdm9/mxMJ1t+
 GBiOiESwU9dpCx8/SHw55ULeB8FFfj6z2NWseTkrT91qmzjDdnuc8SH/gful8mV8Do+SgFOBk3N
 Am7LoEszQzs0h2q8hTP/hWPF6LdqVyQ3KVZl7uZgjBeRP70wE2CzpgjJqwGHFs3tzOV7QPIchxN
 jVX3MknskoXl6qorOyWcsnS1X2JNdJzPwepnO3o2knjIx/fmndlne9zJGT3oLI+jBbWjyakzs2W
 9xENVthmYojbsupWOmJG4j3Hyzq6Fh/lfL2V8/gVB872C9bfkw6g==
X-Received: by 2002:a05:7300:fd02:b0:2be:8216:57db with SMTP id
 5a478bee46e88-2bea5418f42mr5173298eec.3.1773629452552; 
 Sun, 15 Mar 2026 19:50:52 -0700 (PDT)
Received: from 192.168.7.2 ([189.6.247.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab3a12e2sm13138973eec.2.2026.03.15.19.50.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 15 Mar 2026 19:50:52 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 4/6] target/arm/emulate: add load/store exclusive
Date: Sun, 15 Mar 2026 23:50:32 -0300
Message-ID: <20260316025034.85611-5-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316025034.85611-1-lucaaamaral@gmail.com>
References: <20260315034123.41921-1-lucaaamaral@gmail.com>
 <20260316025034.85611-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add emulation for load/store exclusive instructions (DDI 0487 C3.3.6).
Exclusive monitors have no meaning on emulated MMIO accesses, so STXR
always reports success (Rs=0) and LDXR does not set a monitor.

Instruction coverage:
  - STXR/STLXR: exclusive store, 8/16/32/64-bit
  - LDXR/LDAXR: exclusive load, 8/16/32/64-bit
  - STXP/STLXP: exclusive store pair, 32/64-bit
  - LDXP/LDAXP: exclusive load pair, 32/64-bit

STXP/LDXP use two explicit decode patterns (sz=2, sz=3) for the
32/64-bit size variants.

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 target/arm/emulate/a64-ldst.decode | 22 +++++++++
 target/arm/emulate/arm_emulate.c   | 74 ++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/target/arm/emulate/a64-ldst.decode b/target/arm/emulate/a64-ldst.decode
index f3de3f86..fadf6fd2 100644
--- a/target/arm/emulate/a64-ldst.decode
+++ b/target/arm/emulate/a64-ldst.decode
@@ -10,6 +10,9 @@
 # 'u' flag: 0 = 9-bit signed immediate (byte offset), 1 = 12-bit unsigned (needs << sz)
 &ldst_imm       rt rn imm sz sign w p unpriv ext u
 
+# Load/store exclusive
+&stxr           rn rt rt2 rs sz lasr
+
 # Load/store pair (GPR and SIMD/FP)
 &ldstpair       rt2 rt rn imm sz sign w p
 
@@ -18,6 +21,9 @@
 
 ### Format templates
 
+# Exclusives
+@stxr           sz:2 ...... ... rs:5 lasr:1 rt2:5 rn:5 rt:5   &stxr
+
 # Load/store immediate (9-bit signed)
 @ldst_imm       .. ... . .. .. . imm:s9 .. rn:5 rt:5   &ldst_imm u=0 unpriv=0 p=0 w=0
 @ldst_imm_pre   .. ... . .. .. . imm:s9 .. rn:5 rt:5   &ldst_imm u=0 unpriv=0 p=0 w=1
@@ -134,6 +140,22 @@ STR_v_i         00 111 1 01 10 ............ ..... .....         @ldst_uimm sign=
 LDR_v_i         sz:2 111 1 01 01 ............ ..... .....       @ldst_uimm sign=0 ext=0
 LDR_v_i         00 111 1 01 11 ............ ..... .....         @ldst_uimm sign=0 ext=0 sz=4
 
+### Load/store exclusive
+
+# STXR / STLXR  (sz encodes 8/16/32/64-bit)
+STXR            .. 001000 000 ..... . ..... ..... .....         @stxr
+
+# LDXR / LDAXR
+LDXR            .. 001000 010 ..... . ..... ..... .....         @stxr
+
+# STXP / STLXP  (bit[31]=1, bit[30]=sf → sz=2 for 32-bit, sz=3 for 64-bit)
+STXP            10 001000 001 rs:5 lasr:1 rt2:5 rn:5 rt:5      &stxr sz=2
+STXP            11 001000 001 rs:5 lasr:1 rt2:5 rn:5 rt:5      &stxr sz=3
+
+# LDXP / LDAXP
+LDXP            10 001000 011 rs:5 lasr:1 rt2:5 rn:5 rt:5      &stxr sz=2
+LDXP            11 001000 011 rs:5 lasr:1 rt2:5 rn:5 rt:5      &stxr sz=3
+
 ### Load/store pair — non-temporal (STNP/LDNP)
 
 # STNP/LDNP: offset only, no writeback.  Non-temporal hint ignored.
diff --git a/target/arm/emulate/arm_emulate.c b/target/arm/emulate/arm_emulate.c
index 6c63a0d0..52e41703 100644
--- a/target/arm/emulate/arm_emulate.c
+++ b/target/arm/emulate/arm_emulate.c
@@ -425,6 +425,80 @@ static bool trans_LDR_v(DisasContext *ctx, arg_ldst *a)
     return true;
 }
 
+/*
+ * Load/store exclusive: STXR, LDXR, STXP, LDXP
+ * (DDI 0487 C3.3.6)
+ *
+ * Exclusive monitors have no meaning on MMIO.  STXR always reports
+ * success (Rs=0) and LDXR does not set an exclusive monitor.
+ */
+
+static bool trans_STXR(DisasContext *ctx, arg_stxr *a)
+{
+    int esize = 1 << a->sz;
+    uint64_t va = base_read(ctx, a->rn);
+    uint64_t val = gpr_read(ctx, a->rt);
+
+    if (mem_write(ctx, va, &val, esize) != 0) {
+        return true;
+    }
+
+    /* Report success -- no exclusive monitor on emulated access */
+    gpr_write(ctx, a->rs, 0);
+    return true;
+}
+
+static bool trans_LDXR(DisasContext *ctx, arg_stxr *a)
+{
+    int esize = 1 << a->sz;
+    uint64_t va = base_read(ctx, a->rn);
+    uint64_t val = 0;
+
+    if (mem_read(ctx, va, &val, esize) != 0) {
+        return true;
+    }
+
+    gpr_write(ctx, a->rt, val);
+    return true;
+}
+
+static bool trans_STXP(DisasContext *ctx, arg_stxr *a)
+{
+    int esize = 1 << a->sz;                   /* sz=2->4, sz=3->8 */
+    uint64_t va = base_read(ctx, a->rn);
+    uint8_t buf[16];
+
+    uint64_t v1 = gpr_read(ctx, a->rt);
+    uint64_t v2 = gpr_read(ctx, a->rt2);
+    memcpy(buf, &v1, esize);
+    memcpy(buf + esize, &v2, esize);
+
+    if (mem_write(ctx, va, buf, 2 * esize) != 0) {
+        return true;
+    }
+
+    gpr_write(ctx, a->rs, 0);  /* success */
+    return true;
+}
+
+static bool trans_LDXP(DisasContext *ctx, arg_stxr *a)
+{
+    int esize = 1 << a->sz;
+    uint64_t va = base_read(ctx, a->rn);
+    uint8_t buf[16];
+    uint64_t v1 = 0, v2 = 0;
+
+    if (mem_read(ctx, va, buf, 2 * esize) != 0) {
+        return true;
+    }
+
+    memcpy(&v1, buf, esize);
+    memcpy(&v2, buf + esize, esize);
+    gpr_write(ctx, a->rt, v1);
+    gpr_write(ctx, a->rt2, v2);
+    return true;
+}
+
 /* PRFM, DC cache maintenance -- treated as NOP */
 static bool trans_NOP(DisasContext *ctx, arg_NOP *a)
 {
-- 
2.52.0


