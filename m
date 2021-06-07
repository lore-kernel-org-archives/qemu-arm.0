Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3686274lfa;
        Mon, 7 Jun 2021 10:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCm/IwRr2f5NkIbE1AdaCOdehw93bZcvLB1rAH9c0ccg3cNFrJ3nxwx6aj1A1aoQis1QNK
X-Received: by 2002:a67:e34e:: with SMTP id s14mr9816948vsm.41.1623086029344;
        Mon, 07 Jun 2021 10:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086029; cv=none;
        d=google.com; s=arc-20160816;
        b=RN9deUVsgJwNDVdut9BstipDeApZyLTlNMVT6+cEiBuFQ63tK45kuk7sPBfgzffZOC
         3DMXrddJvgeWvcalpvnwkG1cblduLNUAVcuxbRIBkBlZhV8KESAPKBOAYhq+6tSJoD11
         It5J0id19nnXFMQoQ0HEGR0lxnzsP20BzYrhlbH8xx44MsR7PXNY47NS101/yltjQFkw
         Dx1cwXCxO2BBXWIHPKxQQ5PjXeaA+vVaKnLjPofZxOyHZRTki6CCmWguygfJahFmsnS3
         inkz6eLbyiFSBXA7P5S2kBCDsVyFTlnsNgD++9+oOJqExZnK6j0EwSyCiRnzhtejkDEB
         eOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xwwgs1VhJ5RkuyQYCzmhNdM2vmJ3pzIoFzlXTB6yBCY=;
        b=TiXfhteppXrazvCUhvDzOo3EPdtTdKj6uB5p05NwDLN21RTmCZp1GwoJUnfQbcRaIa
         GhRyVJFN0+70V6/bf71c3UknCifOS8WFtAb4Z01Q7QW2OVaaJtEqkLm7+Y2P769FzEAL
         UCmzY5riDka7lFcIrFRE0M3zlflV6UoUZny0aWKojBYB11wjbNiiQsrYZMeM9JTrua8N
         qSU2LFUVaZ/JBe78/hvKcWf+eCrE0SkB7tFZmXdl2yjcCJ1haX4dMvP2k0ns5Rj25jbo
         3Y6+5RNMyXMWgNJ9gXcX71WFho2OL1M/GYWtzomQU9yECua2wbK/hD9MHEVuC2wn1I1t
         GNmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PU0NJv8O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si603528uas.46.2021.06.07.10.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:13:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PU0NJv8O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIou-000637-L2
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIan-0007ef-Ip
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:14 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaQ-0007zG-07
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:13 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so51051wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xwwgs1VhJ5RkuyQYCzmhNdM2vmJ3pzIoFzlXTB6yBCY=;
 b=PU0NJv8O6iL49QbGc99d+NiIO9nZZwMi2J0WynTbPEPPt/z5zAQbQGnjaLxSpzc6o1
 bf73ccqZ4ZHEU+jRT0Z9+TAKJUgMOKuJf0gvL8/tXWiZrNJB48Klmh2T0Lcm91SFPEvv
 zv8groHBmXgDCR42wXWUooFSjZ0Jxs/fDgsYopPUbmd72jES+sxSeWsbF6IOsIo3ZzA6
 YHBtplDjJe3ps6vtgd7+F/bKSDTpHWXNBMrnoXa6/QXoCB1JLSirsnRaYD+WHSzgdSCp
 f8zU7Xja/d7QtTJs6rOvQhwXGlAtR+8bJQ1g7N5udvmN7n4pnjKCsbD5DJyEAOOK83IG
 Rs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xwwgs1VhJ5RkuyQYCzmhNdM2vmJ3pzIoFzlXTB6yBCY=;
 b=gjszTnz5Y7Ot8ev+tzmWod9P6JGO/PlqPqadLetESSkp6mW5YPxvJAbpcxQIaAboJ5
 DUzx0E/7gis+l9SjRnG8Ckqh8HBXeqGY0KK9ZGPp+hbwHq7tnXsfZFytLjBpYM7aO88u
 +oGhVLD4l49f5QWN5/MH3gmk0XectnLeR66LAPx7hBFE3xGC4tuPtz2nB7LZMo/YSR7c
 arIN7ElZrTbjjwwL/Dz5vB0lThX5slOU1slrMna1ioe7xM82MhHxVY5AQxL/VPOt6sm4
 2OVcG+itYKi3+Qy8cU3nxmrc6l1Vczz+vBBmJIpdXmGua6XmSxzqz+EbHVq5f0Y2OwEj
 YvQA==
X-Gm-Message-State: AOAM533YvpixCQfXHToCv13wAjWFeujCA8AVuwX+FFywhRDzJhrTW+CN
 WKpYxwh6XYHkt8LUhhCtVMSS7Q==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr18270629wmq.42.1623085122199; 
 Mon, 07 Jun 2021 09:58:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/55] target/arm: Implement MVE VMULH
Date: Mon,  7 Jun 2021 17:57:49 +0100
Message-Id: <20210607165821.9892-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b61qkro13XrA

Implement the MVE VMULH insn, which performs a vector
multiply and returns the high half of the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index b7e9af2461e..17219df3159 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -83,3 +83,10 @@ DEF_HELPER_FLAGS_4(mve_vsubw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulhsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index f7d1d303f17..ca4c27209da 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -82,6 +82,9 @@ VADD             1110 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
 VSUB             1111 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
 VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 
+VMULH_S          111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 39ab684c0c3..45b1b121ce6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -348,3 +348,29 @@ DO_2OP(veor, 1, uint8_t, H1, DO_EOR)
 DO_2OP_U(vadd, DO_ADD)
 DO_2OP_U(vsub, DO_SUB)
 DO_2OP_U(vmul, DO_MUL)
+
+/*
+ * Because the computation type is at least twice as large as required,
+ * these work for both signed and unsigned source types.
+ */
+static inline uint8_t do_mulh_b(int32_t n, int32_t m)
+{
+    return (n * m) >> 8;
+}
+
+static inline uint16_t do_mulh_h(int32_t n, int32_t m)
+{
+    return (n * m) >> 16;
+}
+
+static inline uint32_t do_mulh_w(int64_t n, int64_t m)
+{
+    return (n * m) >> 32;
+}
+
+DO_2OP(vmulhsb, 1, int8_t, H1, do_mulh_b)
+DO_2OP(vmulhsh, 2, int16_t, H2, do_mulh_h)
+DO_2OP(vmulhsw, 4, int32_t, H4, do_mulh_w)
+DO_2OP(vmulhub, 1, uint8_t, H1, do_mulh_b)
+DO_2OP(vmulhuh, 2, uint16_t, H2, do_mulh_h)
+DO_2OP(vmulhuw, 4, uint32_t, H4, do_mulh_w)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 1b2c8cd5ff7..edea30ba1d7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -379,3 +379,5 @@ DO_LOGIC(VEOR, gen_helper_mve_veor)
 DO_2OP(VADD, vadd)
 DO_2OP(VSUB, vsub)
 DO_2OP(VMUL, vmul)
+DO_2OP(VMULH_S, vmulhs)
+DO_2OP(VMULH_U, vmulhu)
-- 
2.20.1

