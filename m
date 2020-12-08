Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4233350lfb;
        Tue, 8 Dec 2020 10:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKUCGD++Xk4gcdcSaDB4/he+X1CPLY2Ll9ddYLtH2Bpjv+kYWc6wQZd1fGXKrKD+ribl1z
X-Received: by 2002:a25:ce8e:: with SMTP id x136mr30865999ybe.488.1607450597035;
        Tue, 08 Dec 2020 10:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450597; cv=none;
        d=google.com; s=arc-20160816;
        b=PVX7QQTC0X3b9BEErMc98DmGQR8uvb9Mqe01fCgI1rm6UgS65aWG2RyiIwVqdRGPQ/
         +G4XACNCQ8KL+59deG2uLE20McjDa0+Uey7ewyrn1XVJ4/cH359QWijFpfYJCSmM2msO
         9ka/DjCPCL5EeV6Ov33fvu//zIfLvdwP5LHZIrnJBvw/vTg9OIBCvOSRWqvahje67jPq
         YjLuqCIcqEaDF+2cWj9gVDHk5OisCAL1UvRnaf1X/iZUotyKcgje/xJKqzmWLaxeX3iJ
         wKF3HI9PK22GXcFV5xdko2s+yrUbFailSnRVX6o8uEcRajoEqNF//e3SIAShA+eQoLxo
         u/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vv1BLXikhvXOC7shYMx2SJNp4mEHjfewjMXNyOaAtsI=;
        b=IQs4kss4GCr+qbTrEjsk25yGhLO+jR0lbODLcNFbEXOIr3Igw1LORf1ONO5UOseOkr
         gwQmuRV3pisGlYPxMHxHiQCcbb/hWijMXs/Bxr6rkHmrvDQmSsYBkcWmREXSRwhAwhZh
         6X6cOCp7v1YbYmKO9GHRV19sj5Wpvx7jO5NKLcbN447OMLDgo0BgR5GDjN0N1zeEwEph
         lVA1TwIXl2etOR+d3bWzCdPFDmKa1+RaVG0qwnicXb+l/wqBbseCVL9IhiGCMgaok7rL
         EscU6igSoY8pldmVaLXnR5L7OslwlUbZduvfpiXGTto361Fovjaa8qGWDqE/vESZGsJj
         BFpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LQtZumpo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17si14143367ybk.283.2020.12.08.10.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:03:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LQtZumpo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhKW-0000Ek-CH
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIw-0007aZ-Pp
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:38 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIr-0006Lq-KP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:38 -0500
Received: by mail-oi1-x243.google.com with SMTP id o25so20325614oie.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vv1BLXikhvXOC7shYMx2SJNp4mEHjfewjMXNyOaAtsI=;
 b=LQtZumpoD4FiWXM+q8BthmPzMJA1ijwPSx8M4BsEQprSIptE+9PXw3NGxCRhk/8Qjw
 FRgNaLgOhz3zie1nUQTYxqT7mXZrBubfc8SqyIQorCEglxo+KIiHP7sA4L/v4rFt4sIO
 OSAP82Z4AJj5da3x6tM1Yzd+Im0Ha7hTNCxs/NOpxfl6jNj9//RGNFO7n0MjcSUkVKpA
 dpVUsbSOmtM9UZkvag3TxkuVFRUDM72+hg8vL1WvdNR9EGBVnhSAHsvbfy6Zs00onhiY
 Psx+gNjOLUTX/qwZeGco2JMgf9yksqyxWrbmqWI2vFFsTZZZthqLT3x+FKGPHJQ/KhEu
 MXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vv1BLXikhvXOC7shYMx2SJNp4mEHjfewjMXNyOaAtsI=;
 b=rcPfjk0eYEmoUCDroI+NXkA9glqAzOyYqJHJBm4l8cJQADpIZyx+TNE2hXX+xJRsWW
 E7btMNwsiwismZpD0VVd9qVgQojrUg5/eEIH3g8BHfbzRWovhv0nvb0UckKuhavRbzU5
 vGeEv6/xPM54JevWM8X48gKVoVyR+/SLL/9yAk5Fjxr9BCeVLAO6QA6O7YlisQEWcYNX
 vHzvRXKRgPr2onwd9M2MTOPmi0ZPrSCaJt2bQxYotbxu0EGiavrONBbl+Yb211KuDImi
 KwkRtD3W71YDmFber1FFFHFnI7hQBHY9o6fvrJt9FDZAIvIP9rZfVfHQ87+4T3HdlIcU
 gjJw==
X-Gm-Message-State: AOAM533IQDD09MPdvhYWtphuT3F1mDtltE2P/8Z8nzTn6YSEplJOLqQp
 An9xfSXS50JKVeQpOnDbsJM/Bp9lXfnBk3Iq
X-Received: by 2002:aca:f1c1:: with SMTP id p184mr3745605oih.54.1607450492148; 
 Tue, 08 Dec 2020 10:01:32 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/24] target/arm: Enforce word alignment for LDRD/STRD
Date: Tue,  8 Dec 2020 12:01:01 -0600
Message-Id: <20201208180118.157911-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wTeeKwpTgsEc

Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f6007c23a6..9ca06cb373 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6468,13 +6468,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6497,13 +6497,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6605,13 +6605,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6644,13 +6644,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
-- 
2.25.1

