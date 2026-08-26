Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE2BC61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:44:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIbg-0002pQ-Be; Wed, 26 Aug 2026 14:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIbe-0002jD-P2
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:44:14 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIbc-0002dE-GU
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:44:14 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2d7200b2e15so3741085ad.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769851; x=1788374651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eug6luKp4bq+h2AS/jTlsfDJn7/9afiJb85NExHjGfA=;
 b=QIbqgkRxr/pzimwRLzJ0Btotm5k4RcsHs6Q/4GW/rsLZfL4JrPkW1y09tvR8n7LIQs
 VVqRGGscB6ityjg890dfGQcD5H5cNIZFC829w6UGTbkUdGAt2QAPgphR5AaRe/WYE4vn
 vOyv8KPjoTO1kRNA11XUW34NVFrcd7ZCJmrdOx6gkbQUHrFk/Ug3TXg2NdX5TlWrQ/r+
 mbokCMfVrww5Jpk+t44zmuieRLCwhelVhnGh9MDRJ+CoUfPIeekP5f/NqacvaMGTiGD/
 o6Xk7jb1Iwv1ga09uX35pQgedlFQh/or0i4NO/gnaw365aIIMz3dFouaPMhHzVz+Tfob
 mCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769851; x=1788374651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eug6luKp4bq+h2AS/jTlsfDJn7/9afiJb85NExHjGfA=;
 b=BYmRs2qHX4cCg5rxyykGZqgU1xFGR+wwUMk/j9cXvoAqcGSMJPHQS0Gs97DbeTXE2z
 bq7ZvZZinxx1FmnWcPUI5bljFHMUCAsnY1KG7MyJlsby5gfFB39S2i8HYU1Ups9DgzHb
 MmAmq07TnIbEkLNHR+ekTx4rw1U1i53cMk+vtdfxP85JsXHtbvGnxPdm1/xbUNom7gay
 7cpSAcrnkxjUC1brE6h7kp36w+kM5UdioYKqLNPiWHa0Et/VKqlWPx0TIFguLnCV6Ian
 PJdY3Pid6SiT3YtulQeY9e6W82CHZqII8URmgv9NqCV0Cj42AXpbKonGRbnVTiGs76NB
 a3cg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpqKUh5sPzWMj4IKOW1EFBbLxLcHUxG9Jgh+g0H56tPvKXxK/c5CBFuzL4h68FwhBtNdfnapMnmrw==@nongnu.org
X-Gm-Message-State: AFuF++nL7pOJJp8lVaIOz1E1Sw4ls/q3a7w7a9iE2JGHOw1qzcZ3sesZ
 7BC98oke80XfEc/guX6KniAnt0mB9mHBQKZ4L0Qb2wtbMp4b8J3ZBWSU
X-Gm-Gg: AR+sD10cWmMgMiMkGOPzWEg33frMWasL87+3/i/HyBbp3WRyMVg06LZ7NJzOuFpw8QT
 R9PMtgye60e4DWUx5CHqYa7ACW9kDUHwd9RiQ+GGekCHfPcK/4/JmgPHndVaqJGTX9IMoHAT6ex
 uBGNsL0VhOum4YAImrEI2j0xnUSUgu+WqhfzRoTP+97LMwXalIBtM81qBa0qdOiyseoiiVo5jym
 OYbph7BmO4dH68KMZn1JlRSaBu7c7fUCqgrN1DiQCfatNI9C4isogc0KxV6PpHQiWgbYcuLgrgX
 5fKUtO3JD8xwh0ohUiERzweXHMjgVU7FgWrSQzDAfwCiItd09lZkECMzwGgyR/BgEdEw7+U0tG2
 cXTutLZp57AuG1DtLxIsayEKpUEuAwzbIKYHr75a2Wr4Umwr4CfCMGhPVPyRBGb+jl13xG0AcG/
 VRFVVudwStn8qGbisctuPyJCzp0oRerbZa3sDh3kGxuTvG74aTcRAbsDkSDdSj05FPoiZZ0SStq
 qiy2dGu0q29JSTM3wRXXdWFw1jp9nF1
X-Received: by 2002:a17:903:2392:b0:2d0:cc92:f7a3 with SMTP id
 d9443c01a7336-2d707a53a0fmr178131955ad.2.1787769851181; 
 Wed, 26 Aug 2026 11:44:11 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:44:10 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 10/13] target/riscv: uniquify TCG crc32, crc32c,
 and wfi helper names
Date: Thu, 27 Aug 2026 02:42:24 +0800
Message-ID: <20260826184229.1145-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

- ARM already exports helper_crc32, helper_crc32c, helper_wfi, and the
  matching helper_info_* objects. RISC-V used the same DEF_HELPER names,
  which collide in a combined qemu-system link.
- Rename the RISC-V helpers to riscv_crc32, riscv_crc32c, and riscv_wfi
  so the generated C symbols are unique without meson -D prefixes.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/helper.h                              | 6 +++---
 target/riscv/tcg/bitmanip_helper.c                 | 4 ++--
 target/riscv/tcg/insn_trans/trans_privileged.c.inc | 2 +-
 target/riscv/tcg/insn_trans/trans_xlrbr.c.inc      | 4 ++--
 target/riscv/tcg/op_helper.c                       | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 542b7c264fc..dd4623d2a79 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -84,8 +84,8 @@ DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(riscv_crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(riscv_crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Floating Point - Half Precision */
 DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
@@ -135,7 +135,7 @@ DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(mnret, tl, env)
 DEF_HELPER_1(ctr_clear, void, env)
-DEF_HELPER_1(wfi, void, env)
+DEF_HELPER_1(riscv_wfi, void, env)
 DEF_HELPER_1(wrs_nto, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 DEF_HELPER_1(tlb_flush_all, void, env)
diff --git a/target/riscv/tcg/bitmanip_helper.c b/target/riscv/tcg/bitmanip_helper.c
index 1156a87dd31..18ad2fae1c9 100644
--- a/target/riscv/tcg/bitmanip_helper.c
+++ b/target/riscv/tcg/bitmanip_helper.c
@@ -132,7 +132,7 @@ target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
     return do_xperm(rs1, rs2, 3);
 }
 
-target_ulong HELPER(crc32)(target_ulong rs1, target_ulong sz)
+target_ulong HELPER(riscv_crc32)(target_ulong rs1, target_ulong sz)
 {
     for (target_ulong i = 0; i < sz; i++) {
         rs1 = crc32_table[rs1 & 0xFF] ^ (rs1 >> 8);
@@ -141,7 +141,7 @@ target_ulong HELPER(crc32)(target_ulong rs1, target_ulong sz)
     return rs1;
 }
 
-target_ulong HELPER(crc32c)(target_ulong rs1, target_ulong sz)
+target_ulong HELPER(riscv_crc32c)(target_ulong rs1, target_ulong sz)
 {
     for (target_ulong i = 0; i < sz; i++) {
         rs1 = crc32c_table[rs1 & 0xFF] ^ (rs1 >> 8);
diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
index a8eaccef67e..0df78e89745 100644
--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
@@ -144,7 +144,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 #ifndef CONFIG_USER_ONLY
     decode_save_opc(ctx, 0);
     gen_update_pc(ctx, ctx->cur_insn_len);
-    gen_helper_wfi(tcg_env);
+    gen_helper_riscv_wfi(tcg_env);
     return true;
 #else
     return false;
diff --git a/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc b/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
index 01da2b6ce1d..795231f0839 100644
--- a/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_xlrbr.c.inc
@@ -29,11 +29,11 @@ static bool gen_crc(DisasContext *ctx, arg_r2 *a,
 #define TRANS_CRC32(NAME, SIZE) \
     static bool trans_crc32_##NAME(DisasContext *ctx, arg_r2 *a) \
     { if (SIZE == 8) { REQUIRE_64BIT(ctx); }; \
-      return gen_crc(ctx, a, gen_helper_crc32, tcg_constant_tl(SIZE)); }
+      return gen_crc(ctx, a, gen_helper_riscv_crc32, tcg_constant_tl(SIZE)); }
 #define TRANS_CRC32C(NAME, SIZE) \
     static bool trans_crc32c_##NAME(DisasContext *ctx, arg_r2 *a) \
     { if (SIZE == 8) { REQUIRE_64BIT(ctx); }; \
-      return gen_crc(ctx, a, gen_helper_crc32c, tcg_constant_tl(SIZE)); }
+      return gen_crc(ctx, a, gen_helper_riscv_crc32c, tcg_constant_tl(SIZE)); }
 
 TRANS_CRC32(b, 1);
 TRANS_CRC32(h, 2);
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index ba3c7da375a..52bcedc7c6e 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -541,7 +541,7 @@ void helper_ctr_clear(CPURISCVState *env)
     riscv_ctr_clear(env);
 }
 
-void helper_wfi(CPURISCVState *env)
+void HELPER(riscv_wfi)(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
     bool rvs = riscv_has_ext(env, RVS);
-- 
2.52.0.windows.1


