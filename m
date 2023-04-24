Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2596549ejm;
        Sun, 23 Apr 2023 22:44:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350bdDY10ycc3wovnRUoj21QQNze82HvNrECcs9uQhkI5nwEbYTGIPThgj+CFBQ9z7v5DRFdf
X-Received: by 2002:a05:6214:d87:b0:5ef:4233:ee7a with SMTP id e7-20020a0562140d8700b005ef4233ee7amr23576191qve.2.1682315043123;
        Sun, 23 Apr 2023 22:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315043; cv=none;
        d=google.com; s=arc-20160816;
        b=JIEmIBpmpp5RNvvDCKmUUW65DKH8NQi84hb49yEZcuGbN7el3A51QT8ZxURLl6hlyM
         p1Xe5eLRMVrg6nIBjGoGyOopdN1VNpdOp2bOMppfWeY7oDhgLHe2YUbhEaApgSNUSS94
         Il77BTVw4Pq6KTpyz1WmUzuSMJzx3di1RPsHUDgbV0J+98t0jcFDWaXNOqzm610KWZWU
         sHSJq9wCeerREc5DdL1Yy9JwJzys9Hab6ZlozxFeKm05kk5od/0jD01TfhkNoY1+Z1sU
         BfGrYXrldpvLcb+9hL4mbvDicqjmCieFa4QJ6Mq9bVJoqnT6nF59hb7mgyArPor8ASz8
         PaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RzQZ5WVAoEKvcmnzgqGk5zASE/mhxboQtmOP6HVA4UQ=;
        b=vVyfNZTnvdNIwmFz++mE3SWt6OF2Zx20PUf2Zm4fkSf8BDY5wrdjvVzXx2Q97elmS1
         yHJSUPDlyMc//onXXjMdb4Se91tJcw9lnhtzYKSCBStxF0udIoR7iNuAPUz0lMYzBDzx
         98G57Zw8qk1MFWr0BvDqbVPMfz0BKXBPyFVfLcZ/HF9W57nwv/Tn/UC9xiUkOJLoPSpf
         fqkrz31Q7tyJDnN27h7QQixBlsJZImCwWfrVw3QLK+IwnseK6afKWB5Sfc4EF8qUc3B4
         Uaq+MnQNLL2lfLj2nhCpvTPH1J5OuerfzMxeVIRUNyFH69Ri7TPuekTCUSnplO8dYFrx
         idrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=inprkCKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx5-20020a0562142b0500b0053426d91114si6714937qvb.281.2023.04.23.22.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=inprkCKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqoyj-0007OL-QM; Mon, 24 Apr 2023 01:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxF-0005R1-6g
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox8-0004Uh-SH
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:36 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f3fe12de15so2311363f8f.3
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314888; x=1684906888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RzQZ5WVAoEKvcmnzgqGk5zASE/mhxboQtmOP6HVA4UQ=;
 b=inprkCKQ2eq4l4tV+Zf9One1wQTA7s6dXhx/w/lCK20zineyln5fst2bgj18TcYpu5
 DRZFzARzRthcIjn6y7n8iaeHogPe/fcjWZmFSso9w9S5k1twhOJagetX+7meIYl6D8XE
 AlZ52bb3Zo0x1iVd+u9VJ4uc23a0/FYOYyBkVwuqwpI08d+NagZ0L/uPoUPGLiCNgFo+
 IDQ/k45mKeJ58D6r9SxtaaKnOQaJaeZrxVrEMjIqm+pbTIsI7qqxkiqxBeWF4/EP9Yp2
 vJqVD7pzanXCQVhVHw8Y7qB1XzzexpsWVdeG1a9x0cjgLZaSekzdGfYWxmVLU83ot2aq
 T3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314888; x=1684906888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzQZ5WVAoEKvcmnzgqGk5zASE/mhxboQtmOP6HVA4UQ=;
 b=KIxHQzfANThelCzVFgiVRbgGyyXnP5EfG3cMT7PII9p0pUdoTDbMgiC5/SVPm6TF7O
 6tlzMp017BqGcxLH355ID+3RmBHwln4Ob1nzYFa+IidHBnG3NIuk1ofJqHrCPoXEok3f
 7naTwQcFWgr9Mnz+7cHfAT5dxMoRXQGiViHndhrcIlCXH0GxgzXAxXGy0Zfy+UKEirap
 +wePMAmMoQUtLmIOUuDbg9C+UUsiHL3CTKYtV5I5/C6mtwzQcKkwMoX8ZNW7fohKGGAc
 w6yKHsOmmZfQJctUaFuZ4dsXCE6/F1j2FyxEzDEGFB3dciVkQjd05d8RJOQePZhMZElo
 faaA==
X-Gm-Message-State: AAQBX9fhcegqOO1muUzUB+qnL9PUh+B5kigqAK1f2Oy6It7udQwQfTej
 9Z9SfR1KVaH/RAMU5NC5Di+cHg==
X-Received: by 2002:a5d:6e0a:0:b0:304:7929:470d with SMTP id
 h10-20020a5d6e0a000000b003047929470dmr1973859wrz.53.1682314887942; 
 Sun, 23 Apr 2023 22:41:27 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 37/57] tcg: Widen helper_*_st[bw]_mmu val arguments
Date: Mon, 24 Apr 2023 06:40:45 +0100
Message-Id: <20230424054105.1579315-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: VrAuSEzGuQIo

While the old type was correct in the ideal sense, some ABIs require
the argument to be zero-extended.  Using uint32_t for all such values
is a decent compromise.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h | 10 +++++++---
 accel/tcg/cputlb.c     |  6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..684e394b06 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -55,15 +55,19 @@ tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
 tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr);
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+/*
+ * Value extended to at least uint32_t, so that some ABIs do not require
+ * zero-extension from uint8_t or uint16_t.
+ */
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..665c41fc12 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2503,7 +2503,7 @@ full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_UB);
 }
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr)
 {
     full_stb_mmu(env, addr, val, oi, retaddr);
@@ -2516,7 +2516,7 @@ static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_LEUW);
 }
 
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_le_stw_mmu(env, addr, val, oi, retaddr);
@@ -2529,7 +2529,7 @@ static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }
 
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_be_stw_mmu(env, addr, val, oi, retaddr);
-- 
2.34.1

