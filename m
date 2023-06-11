Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1372420ejb;
        Sun, 11 Jun 2023 02:04:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7i2jWOsIu8zIh80YHMev4K68hflBdSlYQkzbBHn7LqhmdVSe+VHOweFFO7yK887ZWL2c08
X-Received: by 2002:ac8:5c14:0:b0:3f8:3d7:449f with SMTP id i20-20020ac85c14000000b003f803d7449fmr8697864qti.39.1686474257804;
        Sun, 11 Jun 2023 02:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474257; cv=none;
        d=google.com; s=arc-20160816;
        b=ws6myxBxKtMjBELh7g84jPllNHmFR63UouQDWx5oHagFChmcnVOVLWKn6xhOQmPTML
         CwcJ/3EgzZDHUPZB5i7zzwFt1gb2vw6A8F8qbxnZW7+SRMR4+2YNnxsWMMQjAnIV6JeT
         oPZg69bQoUP0PYIOmuoQm0kEaKcnQdhNETawtlWCCkPeMhmWg/qcjtSW86cGJWvAz4rx
         NWoF9GZveJEHONnBqZgJjQZMqdKrj873kxJFP7fHeVK1aZ0HK9pFBT49LOEf6Z0hQCFK
         adGjWX/eniOA+YLgJbPqFfSt1PmoWjQ2CbmAa9hMjCxaHUqD5lAwMlOJuyc4GWZzhdg3
         vl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sFrqSxuYHrI3cS6SOens6cMF97H9CMcbIb+bhGC3+VE=;
        b=TCvfWKj1ZUd9Us9CqAO27JyiilZWiVsWCWEwqHaDLLSqXG+1FHA09fVEdbNmg7dkXG
         TfQcDjp9p3tFIXNaZojE/W0/PN2GP1SWyhBdBVe0b5+wMErTI6/LMrlOcZxl7/Y6luT2
         qzcA9jUsY7TT2a0aWikSoEVuwrhlpRCYMAR5TOWf7sQQkmUQNJdQoZzHMO921JJLwkPT
         PdFUD5A1C6KyI0M8kTB2sa4nOjrefp9zK8sj3rzOYKvqa1Eu0MMPsDWT39uB929+LaHt
         ovrwMejZm65dBgdhBjFCGyaSgwmWm0Dmpi9Jb8WVAAaWHMLx37LUmo1SQsXxWeDq1CdG
         Md0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Amm+rujT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id e22-20020a05622a111600b003f222dd7bf2si4620553qty.105.2023.06.11.02.04.17
        for <alex.bennee@linaro.org>;
        Sun, 11 Jun 2023 02:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Amm+rujT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q8Gxa-00058F-DQ; Sun, 11 Jun 2023 05:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gvu-0002oz-Qc
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 05:00:24 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gvt-00043K-05
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 05:00:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-307d20548adso2161258f8f.0
 for <qemu-devel@nongnu.org>; Sun, 11 Jun 2023 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686474019; x=1689066019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFrqSxuYHrI3cS6SOens6cMF97H9CMcbIb+bhGC3+VE=;
 b=Amm+rujTZFaiFRW1MTIaW1l3ApJ8Nu10NtTmtnrVAs33pd0UPuDF+PfyhZ2XRW2oL4
 VTHY5cHRIwviP1IdNOeK3rRvLzxTFsjePuSgw7wICl6bLOT3qKnyrJSoCJc8gNaQAdvp
 vmXzMcYnvrBJ5kv5AovsA/Hdoojjosp6SH7qaA8ydARzsR8ICT6IJskImN6CzW3HXEDC
 4rzhNFx9JiNQfUwg8NO+01T/pL4uBTHC6tN+6Lco3SG4HlgWdBFDdpkFq14BRhyNZSTg
 mEkhTs5rXhbkAmMg8MoRiXzlhbh4q0WgGkMdlkCqHXbe12zalueR0mF/qEQqwt/gVisC
 7vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686474019; x=1689066019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFrqSxuYHrI3cS6SOens6cMF97H9CMcbIb+bhGC3+VE=;
 b=WgsoCwNJn7neHPhmvgkZFqrNbNRvnQ7OZoHaPERMTq12jWCLEpKX2EpfQ31olRD5tT
 6ilzbID0ttcA1MyT6mhNPIM85EWOGCSDKWuvjHcwCx713EWoVRBM10wYm3CLtboTVrbK
 h7QOgya8RV0LKTfe1URcRm7/EGvMdklqzzExNyctxlVuRgQeBy9sdn7mPirtzQuOq8tb
 mnxVQLuR3XE+r7PphvSJftXOsaVJZGJwuHbj85qI/cQJp0uUVfYA+1OsRoklveLsB7oI
 AK5NiJtDmcMxtkLvYzKcUumx+ANck8RnjFneHWP/+Mvdvgag0mAlroS68DJ8BuJjsFaJ
 PWjA==
X-Gm-Message-State: AC+VfDyoja1g1e91RSVrcA72Cx0Am+vKvrKyZfPxfIVCEagkKr73Vu9B
 y//pTu+exgbC5NQbkPvjbCzE+tYxbwXTXCDsOnU=
X-Received: by 2002:adf:f6c8:0:b0:309:50e7:7d0 with SMTP id
 y8-20020adff6c8000000b0030950e707d0mr2664023wrp.31.1686474019087; 
 Sun, 11 Jun 2023 02:00:19 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm9088473wru.97.2023.06.11.02.00.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 02:00:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 21/26] target/arm/tcg: Extract M-profile definitions to
 'helper-m.h.inc'
Date: Sun, 11 Jun 2023 10:58:41 +0200
Message-Id: <20230611085846.21415-22-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nYGwDk/AhRxi

helper.h is used by all units, but not all require the
M-profile definitions. Move them to a new header; the next
commit will remove it from the common helper.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h           | 17 ++---------------
 target/arm/tcg/helper-m.h.inc | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+), 15 deletions(-)
 create mode 100644 target/arm/tcg/helper-m.h.inc

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 71e2cd5580..05117934f3 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -62,21 +62,6 @@ DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
 DEF_HELPER_1(cpsr_read, i32, env)
 
-DEF_HELPER_3(v7m_msr, void, env, i32, i32)
-DEF_HELPER_2(v7m_mrs, i32, env, i32)
-
-DEF_HELPER_2(v7m_bxns, void, env, i32)
-DEF_HELPER_2(v7m_blxns, void, env, i32)
-
-DEF_HELPER_3(v7m_tt, i32, env, i32, i32)
-
-DEF_HELPER_1(v7m_preserve_fp_state, void, env)
-
-DEF_HELPER_2(v7m_vlstm, void, env, i32)
-DEF_HELPER_2(v7m_vlldm, void, env, i32)
-
-DEF_HELPER_2(v8m_stackcheck, void, env, i32)
-
 DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, cptr, env, i32, i32, i32)
@@ -536,3 +521,5 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+#include "tcg/helper-m.h.inc"
diff --git a/target/arm/tcg/helper-m.h.inc b/target/arm/tcg/helper-m.h.inc
new file mode 100644
index 0000000000..122311b6d0
--- /dev/null
+++ b/target/arm/tcg/helper-m.h.inc
@@ -0,0 +1,23 @@
+/*
+ * ARM M-profile helper definitions
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+DEF_HELPER_3(v7m_msr, void, env, i32, i32)
+DEF_HELPER_2(v7m_mrs, i32, env, i32)
+
+DEF_HELPER_2(v7m_bxns, void, env, i32)
+DEF_HELPER_2(v7m_blxns, void, env, i32)
+
+DEF_HELPER_3(v7m_tt, i32, env, i32, i32)
+
+DEF_HELPER_1(v7m_preserve_fp_state, void, env)
+
+DEF_HELPER_2(v7m_vlstm, void, env, i32)
+DEF_HELPER_2(v7m_vlldm, void, env, i32)
+
+DEF_HELPER_2(v8m_stackcheck, void, env, i32)
-- 
2.38.1

