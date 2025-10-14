Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DB1CCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:19:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJA-000244-0l; Tue, 14 Oct 2025 16:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ5-00022J-EU
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:41 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIs-0005KY-HM
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:39 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso5041099a12.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472444; x=1761077244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q23tB1U9bNaZ2l7nF9RSiGdiVjLTeNqTC1oumAamC1U=;
 b=U6t1AZC7MozmxazCbDeogd2DlZSgW00UvxX+YVuP8QzCaLjuOFzy6/tpXUMfJHb8GJ
 xxy6+5ktx1gqDE6S2HweW2yopTxRPYWI3EJBKnk4mmts8+35H3FRM0r2Q4C+r3NxVJ3g
 eNDhj0DNc6JNCeNm76Ojyl3aoyQX9AKBirsK/K177RBA6MQOhbxISUoCkRuoUq4/6k8Z
 Bf5XPLN6SLB+xHShnZXhOy56KQqXvDlg1cDSW3WyouSYSVIgQBqJwGZjWSU6VyiPYeXg
 aFpsPbB72j6WBmx0vIUgzE1yFZoVOVdIpjXU5X8tY3TsORoL/rIq6v7q8u60rzqE+vqS
 X5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472444; x=1761077244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q23tB1U9bNaZ2l7nF9RSiGdiVjLTeNqTC1oumAamC1U=;
 b=MYFl9AyaRWq+MoTkVAFsUuJWkZP26xbdYTxBFYVs9itLBAt1ubjdtWcQq6Sm+LL2Pn
 DqHShjsc74bKfazXfTuJ3x987xzS5oYATdH79O1Wc8SDSJa5rL+S74B4DSZvYjyp5+az
 JgRGVM2M3TcO7m23MoucGNO93mk3DNa++5bc+JhcEzSUycKUzYHGfo6sk5T5gEQO8W6I
 74NnVRy0LpbglTfgl3AWOV07beJh8+C5Ea5PoFVoNjmTUMh118K3S8cVGNy28hh4Uhsb
 AB01rZ9vjYzMiDe4iXNSgBym8FCvrAVWh+bPcfFex+6xgwkubwCAOHHpanTnX28EaPrl
 ENkA==
X-Gm-Message-State: AOJu0YzQ+94DZ/gkuTbl/tJ2aSqqfDIh4e6z2OYbudFGnzuHtNfkZCkb
 dUm7N6SXCA8yU7gPhGVxp97x/QDHMUEK8HqjAhPcGZ5ZfAZWOPmGnD0zMdvKV89ZVj1nsRwIjwW
 pNzs4DuM=
X-Gm-Gg: ASbGncsxxjSeWRyH2jKp+OOURTy1DVkt6h5oPDKbOqh2KS2SAQJePY+k8RxWX3fl4i6
 eJixt4KucYBLTT1+gCyPGlmrfo0g/ZuowiTap2U0+oIjQvET+vqui3xuUVUjlVuyc4mogXQCn/G
 B0qq3HhkmH4GddpE0JTvpNHV39ACfOkRd8HcbAoMb7+wcS4/JiohU467/WZRivatBqxmtV0tvXS
 /Bx9oLI09ifl/Fiqwf3cgyJMbO//PiMpl4pN57t2lsNPkU1nM8p7ax/wZXrRuKOk/IFRKwChB9N
 TWgRvn/R2tkMfWmUbR94QrhK5G5l+mhiM6A9G4vKaNNgPChVpuMVqqVvcTj4mFFOwU8V0ukQ82A
 QXTJ8D13Oi4B9P0zLRKcHdENDaqcL9XAF8wlJDd3Ja9VM596AJxo=
X-Google-Smtp-Source: AGHT+IEO4s/P9HUhma3VWST/lnjLQgQmfXj101exd0n7+EOTmPFTKhqYsSfXKXkEK2h46wwY8/fjmw==
X-Received: by 2002:a17:902:e94e:b0:279:daa1:6780 with SMTP id
 d9443c01a7336-2902741cf99mr333450205ad.52.1760472444078; 
 Tue, 14 Oct 2025 13:07:24 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 07/37] target/arm: Add read_raw_cp_reg128,
 write_raw_cp_reg128
Date: Tue, 14 Oct 2025 13:06:48 -0700
Message-ID: <20251014200718.422022-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Add the functions and update raw_accessors_invalid to match.
Add assertions for !ARM_CP_128BIT in read_raw_cp_reg and
write_raw_cp_reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h |  1 +
 target/arm/helper.c | 49 +++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 0b0004eff9..f6658abc57 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -1157,6 +1157,7 @@ static inline bool cp_access_ok(int current_el,
 
 /* Raw read of a coprocessor register (as needed for migration, etc) */
 uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri);
+Int128 read_raw_cp_reg128(CPUARMState *env, const ARMCPRegInfo *ri);
 
 /*
  * Return true if the cp register encoding is in the "feature ID space" as
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e321f404e6..d9d8ae56e8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -119,6 +119,7 @@ static void *raw_ptr(CPUARMState *env, const ARMCPRegInfo *ri)
 
 uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
 {
+    assert(!(ri->type & ARM_CP_128BIT));
     /* Raw read of a coprocessor register (as needed for migration, etc). */
     if (ri->type & ARM_CP_CONST) {
         return ri->resetvalue;
@@ -134,6 +135,7 @@ uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
 static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t v)
 {
+    assert(!(ri->type & ARM_CP_128BIT));
     /*
      * Raw write of a coprocessor register (as needed for migration, etc).
      * Note that constant registers are treated as write-ignored; the
@@ -151,6 +153,35 @@ static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+Int128 read_raw_cp_reg128(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    assert(ri->type & ARM_CP_128BIT);
+    if (ri->raw_read128fn) {
+        return ri->raw_read128fn(env, ri);
+    } else if (ri->read128fn) {
+        return ri->read128fn(env, ri);
+    } else {
+        return raw_read128(env, ri);
+    }
+}
+
+__attribute__((unused))
+static void write_raw_cp_reg128(CPUARMState *env, const ARMCPRegInfo *ri,
+                                Int128 v)
+{
+    uint64_t lo = int128_getlo(v);
+    uint64_t hi = int128_gethi(v);
+
+    assert(ri->type & ARM_CP_128BIT);
+    if (ri->raw_write128fn) {
+        ri->raw_write128fn(env, ri, lo, hi);
+    } else if (ri->write128fn) {
+        ri->write128fn(env, ri, lo, hi);
+    } else {
+        raw_write128(env, ri, lo, hi);
+    }
+}
+
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
    /*
@@ -165,12 +196,22 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
     * The tests here line up with the conditions in read/write_raw_cp_reg()
     * and assertions in raw_read()/raw_write().
     */
-    if ((ri->type & ARM_CP_CONST) ||
-        ri->fieldoffset ||
-        ((ri->raw_writefn || ri->writefn) && (ri->raw_readfn || ri->readfn))) {
+    if (ri->type & ARM_CP_CONST) {
         return false;
     }
-    return true;
+    if (ri->fieldoffset) {
+        return false;
+    }
+    if (ri->type & ARM_CP_128BIT) {
+        if (ri->fieldoffsethi) {
+            return false;
+        }
+        return !((ri->raw_write128fn || ri->write128fn) &&
+                 (ri->raw_read128fn || ri->read128fn));
+    } else {
+        return !((ri->raw_writefn || ri->writefn) &&
+                 (ri->raw_readfn || ri->readfn));
+    }
 }
 
 bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
-- 
2.43.0


