Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2615775lfy;
        Mon, 24 Aug 2020 07:43:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTmsTPM9MNVgTnHpAhUiAo0CUnXMaN69cFuMmZdxThB/YUljiGEDe0HEY0yYoa9hdivRgV
X-Received: by 2002:a25:b8d:: with SMTP id 135mr7061970ybl.481.1598280205204;
        Mon, 24 Aug 2020 07:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598280205; cv=none;
        d=google.com; s=arc-20160816;
        b=Xj5Q8eYkHaWZnjQ6TsoMaz5fzUemSJ1eoufJFZZy6cub6/jBlhjQmOpSr1EnQZOM6X
         v3qIcZgPk0CeqxhHVq+Xv++OUraolyniYpBdPQC71jGWKZ2l6nCJPV5ROPWFPFYd3fmS
         cpZvqtdyqMAM2T3WE3XY8ILGtNR/Jmi8NmPm7skTXSUdRU4R9PckWc3z9O22BwO6NOLc
         vD+vJU8jjMPv1hbAMHFopXFP3bVxSTJtU5lChylcBBV5W+rPrKeBiO3wGQkFO7IpoHAK
         aQTcYuwUVWEmp0HumSkSLag8j/9fkk7Pu80ykuk5CW8eEiXHxj7OL45xSblEHas1jQ8I
         4jjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IkFQo+GYBfR/QC0YRa+lSr9XAhK0cCAa4Tqr7T1eAMU=;
        b=zYWavVgq/GTJHU9pMSRYEbYWTJRwCQoQVObdoJ63LYFuGw6eNCRP61nOIjJyf+fvUZ
         TfhiOrnrQsWvgaOOrJf9YSp0ry89q1HIMJJvFxkWwX9n3GoUAJVnLUbcmCMiES2eADZ7
         LnEv9ppNt3Kf/dOH96AMfYtoU1URCS2YxZDefLK3XqXWw5Qjn+WxD1QmzvnjRpvS6aeg
         W6zdiuc7TpOH36AbvFMZFMzBVBJ49wZciYhUcdiJlfn7Vun4E2qB2sezKGUohmz+z0wZ
         1FpD/sPMvaF7lDWwd7Iqwy12sfU4MTBPEJtXuZzZcT9mZsjNdI9YLpLRAZbw/UU1jbH5
         mnFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsVENMG9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si12951306ybp.15.2020.08.24.07.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsVENMG9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADgy-0007hX-Jb
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADUE-0000Sw-2Q
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:30:14 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADUB-0002mi-KV
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:30:13 -0400
Received: by mail-wr1-x443.google.com with SMTP id p17so3239488wrj.8
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IkFQo+GYBfR/QC0YRa+lSr9XAhK0cCAa4Tqr7T1eAMU=;
 b=EsVENMG9/IwdJjMtaHC4stzc/khwP4qFIB4oi35LDF9IW7IbPUvtvaDzyQe3MdhklQ
 g66Nn9Y3w2mOE3HR/PHuod/zJfVH9Zy/ihgGiVgHEhHaSFMT+mgPxqGsuXeyJNC2SqN4
 TOoqkdEbRG8nHCFAa7T0J4/AF2eeThkvhJugqlUfveMfjqSKziWN4xiKymcbk0f6LLja
 U8CxqCBOv5F+o7jPOjEA+506LV4OyMPO7Yb+6bPkx2hhHLf3qE6ZnAt1rkOJoyiphR+2
 mxCphPJvjcwpuOjfS7ah/afbnv1nDnO8dqy2znLjir3TeAt0LIuRcLX4k5+cau0nrfOF
 cvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkFQo+GYBfR/QC0YRa+lSr9XAhK0cCAa4Tqr7T1eAMU=;
 b=GD2IWlIxG4oXIVyncbHTZ5Mrkes2H242bHCu/D87MxDqmKJf8xhE0DziDTqYaPdZyW
 eSBW4oFOWC/wgtkWJRmGp1KfNlr7AgBktl8r1+mQsZ7lek8UnIYNLhIyESpCPvmJ6ZdR
 AAmmTXsuJBI8nkLgJco471D0f70C3AvDE+1dqhkXajaoAAAQCiwF4ATnRt/7T9S6CQTJ
 JDphuqvLW7TervdjelKvb7hca48GQFdR5RbVCxV4Fo5DXyz1st+Wtw6sAtF/S6ngy+ra
 dM5dp3XiiEt8ghrzjI0o5QuzeP2A2V+sg2JrQfIkSMXL9924Y75By9MILbi9CLRboW8a
 eJlA==
X-Gm-Message-State: AOAM530LSPoQ7esJH/RiQah0Ccp7ZWMW0G/Q/nb8iglOt6F4aeFjZ8mL
 i+26GX5PWis5Yn7Ojaj3eMTvEZnfHzdWORro
X-Received: by 2002:adf:f8c7:: with SMTP id f7mr6564230wrq.117.1598279399011; 
 Mon, 24 Aug 2020 07:29:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/22] target/arm: Implement VFP fp16 VMOV between gp and
 halfprec registers
Date: Mon, 24 Aug 2020 15:29:33 +0100
Message-Id: <20200824142934.20850-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4e/VoDwXvLGD

Implement the VFP fp16 variant of VMOV that transfers a 16-bit
value between a general purpose register and a VFP register.

Note that Rt == 15 is UNPREDICTABLE; since this insn is v8 and later
only we have no need to replicate the old "updates CPSR.NZCV"
behaviour that the singleprec version of this insn does.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp.decode          |  1 +
 target/arm/translate-vfp.c.inc | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 9a79e99f1b0..51f143b4a51 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -74,6 +74,7 @@ VDUP         ---- 1110 1 b:1 q:1 0 .... rt:4 1011 . 0 e:1 1 0000 \
              vn=%vn_dp
 
 VMSR_VMRS    ---- 1110 111 l:1 reg:4 rt:4 1010 0001 0000
+VMOV_half    ---- 1110 000 l:1 .... rt:4 1001 . 001 0000    vn=%vn_sp
 VMOV_single  ---- 1110 000 l:1 .... rt:4 1010 . 001 0000    vn=%vn_sp
 
 VMOV_64_sp   ---- 1100 010 op:1 rt2:4 rt:4 1010 00.1 ....   vm=%vm_sp
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 4b26156eccc..28e0dba5f14 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -809,6 +809,40 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
     return true;
 }
 
+static bool trans_VMOV_half(DisasContext *s, arg_VMOV_single *a)
+{
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (a->rt == 15) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (a->l) {
+        /* VFP to general purpose register */
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vn);
+        tcg_gen_andi_i32(tmp, tmp, 0xffff);
+        store_reg(s, a->rt, tmp);
+    } else {
+        /* general purpose register to VFP */
+        tmp = load_reg(s, a->rt);
+        tcg_gen_andi_i32(tmp, tmp, 0xffff);
+        neon_store_reg32(tmp, a->vn);
+        tcg_temp_free_i32(tmp);
+    }
+
+    return true;
+}
+
 static bool trans_VMOV_single(DisasContext *s, arg_VMOV_single *a)
 {
     TCGv_i32 tmp;
-- 
2.20.1

