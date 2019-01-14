Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2534385wrt;
        Sun, 13 Jan 2019 17:18:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5rbu6Kyxwka2oqJ215b79QMyz6TNuPLouZxT1U+vXoVEWYdMQHLmAJGbWla1ufUUDmCw6f
X-Received: by 2002:a1c:2902:: with SMTP id p2mr9724285wmp.19.1547428698341;
        Sun, 13 Jan 2019 17:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428698; cv=none;
        d=google.com; s=arc-20160816;
        b=zv6ZxmR+qCVI9zsB5UTpp6rlDbUFm3y6tbag1r6Qk1k1PPTnQMhnMrD7uPBBu1OHk/
         SPm4Sf1PcDrsc/HVSdSK+xUeYikMs+29yDnfz83FLFS4GQdvehi24COefpJHeOEMNWP/
         VUwMzLMyM8CuEZYqQxoiLffbt8/ulRrvIw1z6zHHBypCxMw0gHIlc21Rik9XHuNdkAPP
         xTUf5Q9+4yQv5+UcOV58dcZWoJKHLdV/NsLYDJiiIqUq4zRWH9QgQExCYKFPx9lG/2Cg
         NJQKy3e+o0i7G856ecLrUmdZKFLaIyLSbMGA49PYiwTcMV+Wr2gWY+YL22x2TRn9q5hf
         H8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=X08leWf/xNJZ1dHLJE3vkUkRS4X1tK3TxBJrpZ1VA/U=;
        b=lVVc6cWCudOMEry7CTsJCHYFfqjAPRl4blHgz94ijrKaZAEochJlC25Eyzdr2Nf1Q3
         FZEHs++jeqOvYu/kpbl5cAEPElxH5JQ+x6mbDFsm3aDI+zcGcpb5vExuMeLq183e+YJh
         s+Qss71w0qrZuDgHSGXlpxbdbW05DvVolH6yHJuqpltKelZtELVFrpKKxD3U7a/32NRU
         1wtpWxL4goPiBU5LvpNWRwZjK+ZCHv9RsL20bxpO9wAne/f2S4TLEWXSyivj1iCGA4vq
         kJqIXwJM9ivIBWy7pKPD1UxSu4POvG6pqLXtmUZcDlNZmr8n60jrjc9wNGNvTe4pZoAT
         /uOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F0BObSRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si47951616wrs.133.2019.01.13.17.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:18:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F0BObSRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqtN-00022s-6A
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnQ-0005ob-3q
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:12:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnP-000125-DM
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:12:08 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnP-00011q-82
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:12:07 -0500
Received: by mail-pg1-x541.google.com with SMTP id d72so8725696pga.9
	for <qemu-arm@nongnu.org>; Sun, 13 Jan 2019 17:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X08leWf/xNJZ1dHLJE3vkUkRS4X1tK3TxBJrpZ1VA/U=;
	b=F0BObSRXmP7jI7eDtpku8ieI/fHZUk4vCfE79owe3NzNNroeFtTePOCbhUaUR4oM5h
	bL3zwL8KQT3PBqPI9yPRLKMsSSkRjdOrEQKwz9k1+WLJQ4G5fRUMAV/TqnePZBueEptI
	XsQk6pHZsys/I2AffzHrGey7oWS5q0igPFWuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=X08leWf/xNJZ1dHLJE3vkUkRS4X1tK3TxBJrpZ1VA/U=;
	b=P9IzesELip1dIZ9OsLwSI5vFyIMHH6VbtjdHRNLtMCuz97f6kdDZemhCFdO8FcuPm/
	Nu9eK2B0B3Wfxs2Z3OfWae2Acjpjo527xGi8YRZ2M5yWIpzZRI5vTk7XQaRK7yMSUbSI
	Tj9lYjCHMdLOVrtG8jc+zbUrcIVB5yL2kHPgtMhSBJlUyNXW2LXXmAKHv4NHVoiV1F+Y
	6UR27ILNEOB8PBcog1eFdX74Ta2A+z8wr29tc1BduKaISti5WOuXF5s6URZzFYm/r40U
	E6G3x4/iNX4gvGXz8r6ssZmHv3jCeuAkbZSvg+UOzTaejs8FucQH6hn/OBcg4myUGb0a
	v+uA==
X-Gm-Message-State: AJcUukftCN1RCVlNiSKYfmqfl5rl6XaIjPB6OJ0URhMYYaGPngRCf7pj
	cjm0H6XfWwuc4SPtmKevghbOcg==
X-Received: by 2002:a62:ca05:: with SMTP id n5mr23390909pfg.154.1547428326344; 
	Sun, 13 Jan 2019 17:12:06 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.12.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:12:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:16 +1100
Message-Id: <20190114011122.5995-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH 11/17] target/arm: Implement the STGP instruction
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cVvMxKK3x56l

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 60865945e4..911d6f06b3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2696,7 +2696,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
  * +-----+-------+---+---+-------+---+-------+-------+------+------+
  *
  * opc: LDP/STP/LDNP/STNP        00 -> 32 bit, 10 -> 64 bit
- *      LDPSW                    01
+ *      LDPSW/STGP               01
  *      LDP/STP/LDNP/STNP (SIMD) 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit
  *   V: 0 -> GPR, 1 -> Vector
  * idx: 00 -> signed offset with non-temporal hint, 01 -> post-index,
@@ -2721,6 +2721,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     bool postindex = false;
     bool wback = false;
+    bool set_tag = false;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2733,6 +2734,14 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
 
     if (is_vector) {
         size = 2 + opc;
+    } else if (opc == 1 && !is_load) {
+        /* STGP */
+        if (!dc_isar_feature(aa64_mte_insn_reg, s) || index == 0) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = 3;
+        set_tag = true;
     } else {
         size = 2 + extract32(opc, 1, 1);
         is_signed = extract32(opc, 0, 1);
@@ -2783,7 +2792,12 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr, rn == 31);
+    if (set_tag) {
+        clean_addr = new_tmp_a64(s);
+        gen_helper_stg(clean_addr, cpu_env, dirty_addr);
+    } else {
+        clean_addr = clean_data_tbi(s, dirty_addr, rn == 31);
+    }
 
     if (is_vector) {
         if (is_load) {
-- 
2.17.2

