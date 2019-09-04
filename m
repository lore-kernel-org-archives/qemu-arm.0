Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1150133wrp;
        Wed, 4 Sep 2019 13:12:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0/MrBrCg0nbPKmKvn6vkI9Y22OcZZj14WcyJJimjvLwHoF6zScCKPYtan3BXWs5ICKksF
X-Received: by 2002:a17:906:3d62:: with SMTP id r2mr3363398ejf.63.1567627940585;
        Wed, 04 Sep 2019 13:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627940; cv=none;
        d=google.com; s=arc-20160816;
        b=ojxZQmooDlrImjREuhPj3m1N1NJKS+ZsnJ62bukSRxc2FviKufpboikDJmHQfHyROl
         hkaEvdIGp6ckq4cYJRlkJ1SEGzUL32bgnHXjkkcS7k9iG/1t3pmG2RHrf6x3L+fCl7QB
         2urR+aowH2uvdfHT2ABoUDNB7Kpljm5Sjm3oZm7topwGn1BKCEc0muRoEW1y+sdl1OtM
         pbGcPmX/aQljDaWR4jRP4TKdZF9dVi31rI3XFX9LV0Z80qP4c4l8N4U2znF44J6ezi+d
         OOBryA+XWwpNJ/GbmAaWWglj8qX+Y1MGJohq2LXrQoa+40wZtk01pITg2XRjERtrxOQy
         3uFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fNVbTJv60xmJj9T6kktIzTW/0WXFeS41CSEU1hxli/Q=;
        b=ZYeCbbeBw2X4MIpuGiJ+gUxI3yHtxoH6JsxD0TVxqnqkTZM+kOuvXgZtRKtgjMvsUF
         Z8MwMwXZjDyCr00r0+zcY917p/l8bLeoNJ/UoTS9asFSutfdwdxi0lrGmaM+YZivxUnD
         H6z4OcWH9gXQ4DE47vTZOr+RUttKl2JX19wUHvEVD4HDPnURLJXlUo2S3pyVr6VRKXQN
         ziIr2CLaE7N0IjVDE2JGrM5wegpwa4RmRGDfQXSyWgH1qblMVrFgkRqOk6YhtD9QFRVe
         lZrLaX6SHwayk90mVZRV2PcyT4YLS6FyBmGRuKY+ohpnNCY+Ekg2Jj67PVSyDb5JAymi
         PBvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R0l99mDm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20si49948ejb.305.2019.09.04.13.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R0l99mDm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bda-00067A-J9
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0X-0005Cz-ID
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0U-0002nz-FD
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:57 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36488)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0U-0002mt-5c
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:54 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y22so8278107pfr.3
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fNVbTJv60xmJj9T6kktIzTW/0WXFeS41CSEU1hxli/Q=;
 b=R0l99mDmG8Bhz7FJaVV83gZVzSWNzXbKZ2JcXFi35aYnjpBekNK8r+sH1vHvnXzdHv
 zEt4oIRXbQMNWQwaCIS2Uyn+hvvIdRHtznBz7S12BcdyqwqK00jFm1HpWYoXwsFSE9Q3
 JYN9DM3JxD3xLfp1tel9AmIPN05x+fzrWblj7afz6aqPGuy1+tlRgL5jcKm17iurJyOZ
 +9MZ0RAdXl4r+1Qx+6J6nPPiHQEzYt3EC+BDPUFRNs15p1Gt0u6Z4O+vdRWSDvvccCI4
 j/cocG/75N/5SbuX4QVT5it9/jlUNul8B3xJKMugOgs8eCAQFLTushhSvOoj08iVAWgx
 ioPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fNVbTJv60xmJj9T6kktIzTW/0WXFeS41CSEU1hxli/Q=;
 b=jy9W55+zZNvd+HFSvlBdxDBDuu9z3fIBPorthj+CQeeRxKk0hBPBa2d5mq9w6NTR44
 B5zLvokY2WSiYblZCJp2k4bpomKayhcMfZ/SylswNgWlYQpjtlg7/2auIeJMe+bseIhz
 eEpFc4brr6+B/ejJtdyG8DReMUoUoW5WnpEy0Jd/Fqsf8/MxitqrSmqRqBaQON55sW4k
 rlwDxBeJ5RLB8qjqmo5WPZW6PyoqxwRSf1I+SOmJpHuc0auUhxgUSA43/Wrba77MkPCI
 fDwTT3hXDpI4qqcbhfTxelh7wg6WBTJs5h55g20DOH63sfBE6PFAXmOcaEZENztF72PN
 OhGg==
X-Gm-Message-State: APjAAAW6NO+Sc8uWzYI9Y8NIbgCypaiVqLKS2l6EFoVXRtUWpIwiS/0A
 Rau4C4S4c1KSkSyL0bfWp3IVpOwnZS4=
X-Received: by 2002:a17:90a:cf0b:: with SMTP id
 h11mr6642189pju.95.1567625512623; 
 Wed, 04 Sep 2019 12:31:52 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:30 -0700
Message-Id: <20190904193059.26202-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42e
Subject: [Qemu-devel] [PATCH v4 40/69] target/arm: Convert Table Branch
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WFJNe3DmaGtb

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 57 +++++++++++++++++++++++++-----------------
 target/arm/t32.decode  |  8 +++++-
 2 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7023ee78f1..96149eabf4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10081,6 +10081,37 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
+{
+    TCGv_i32 addr, tmp;
+
+    tmp = load_reg(s, a->rm);
+    if (half) {
+        tcg_gen_add_i32(tmp, tmp, tmp);
+    }
+    addr = load_reg(s, a->rn);
+    tcg_gen_add_i32(addr, addr, tmp);
+
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                    half ? MO_UW | s->be_data : MO_UB);
+    tcg_temp_free_i32(addr);
+
+    tcg_gen_add_i32(tmp, tmp, tmp);
+    tcg_gen_addi_i32(tmp, tmp, read_pc(s));
+    store_reg(s, 15, tmp);
+    return true;
+}
+
+static bool trans_TBB(DisasContext *s, arg_tbranch *a)
+{
+    return op_tbranch(s, a, false);
+}
+
+static bool trans_TBH(DisasContext *s, arg_tbranch *a)
+{
+    return op_tbranch(s, a, true);
+}
+
 /*
  * Supervisor call
  */
@@ -10466,9 +10497,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rm, rs;
-    TCGv_i32 tmp;
-    TCGv_i32 addr;
+    uint32_t rd, rn, rs;
     int op;
 
     /*
@@ -10514,7 +10543,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     rn = (insn >> 16) & 0xf;
     rs = (insn >> 12) & 0xf;
     rd = (insn >> 8) & 0xf;
-    rm = insn & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
@@ -10587,25 +10615,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 /* Load/store exclusive, in decodetree */
                 goto illegal_op;
             } else if ((insn & (7 << 5)) == 0) {
-                /* Table Branch.  */
-                addr = load_reg(s, rn);
-                tmp = load_reg(s, rm);
-                tcg_gen_add_i32(addr, addr, tmp);
-                if (insn & (1 << 4)) {
-                    /* tbh */
-                    tcg_gen_add_i32(addr, addr, tmp);
-                    tcg_temp_free_i32(tmp);
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
-                } else { /* tbb */
-                    tcg_temp_free_i32(tmp);
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
-                }
-                tcg_temp_free_i32(addr);
-                tcg_gen_shli_i32(tmp, tmp, 1);
-                tcg_gen_addi_i32(tmp, tmp, read_pc(s));
-                store_reg(s, 15, tmp);
+                /* Table Branch, in decodetree */
+                goto illegal_op;
             } else {
                 /* Load/store exclusive, load-acq/store-rel, in decodetree */
                 goto illegal_op;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 11a9a2ef58..d05673ff3e 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -489,7 +489,7 @@ LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
 LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
 
-# Load/Store Exclusive and Load-Acquire/Store-Release
+# Load/Store Exclusive, Load-Acquire/Store-Release, and Table Branch
 
 @strex_i         .... .... .... rn:4 rt:4 rd:4 .... .... \
                  &strex rt2=15 imm=%imm8x4
@@ -533,6 +533,12 @@ LDA              1110 1000 1101 .... .... 1111 1010 1111      @ldrex_0
 LDAB             1110 1000 1101 .... .... 1111 1000 1111      @ldrex_0
 LDAH             1110 1000 1101 .... .... 1111 1001 1111      @ldrex_0
 
+&tbranch         rn rm
+@tbranch         .... .... .... rn:4 .... .... .... rm:4      &tbranch
+
+TBB              1110 1000 1101 .... 1111 0000 0000 ....      @tbranch
+TBH              1110 1000 1101 .... 1111 0000 0001 ....      @tbranch
+
 # Parallel addition and subtraction
 
 SADD8            1111 1010 1000 .... 1111 .... 0000 ....      @rndm
-- 
2.17.1

