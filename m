Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3699791lfa;
        Mon, 7 Jun 2021 10:31:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFX0d7fmmErjt1WLoVQLo0sKGRHSsGlJSCEfI78k8GVCp6Q4Deaym1FblMwUwnEUVO25f2
X-Received: by 2002:a67:7d85:: with SMTP id y127mr9809639vsc.43.1623087114775;
        Mon, 07 Jun 2021 10:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623087114; cv=none;
        d=google.com; s=arc-20160816;
        b=d9B5cSxOKneJ2vpmd0mSlzGzhYOYtL+U3eWzxQAmRDyjHXbKMeIjWrBl9Era+iIj0V
         TMtBOQT8AhyUaoOJ8jbAaBpG095QCXpPg4RQF9TTb6r4eLdQBL8Xp5Xj+59esmhJ4YwQ
         D4DO3zCyrBkV0s7pIE7sEOaHSbsUiKbfRViN0SptCoM4bjMq2eVtLb1R6OiQvr7rKwfv
         iOHKRqvKFKhwbg5tfwcj+FDDrlNwkYzZ5j5rGGNtm6aXLD46JkLHAW5ww1y7R/OEjwtI
         HInoMBAxevcW6FiN3u17zV5evQEvDFqcFb9PdMZKdDRm/zgkQsuwXdVH3AO63n1F3llr
         U0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xM1/IljcmeixGn7/ya3GpB0ZkMzTXbAaR9fyni5YxU4=;
        b=VUVQFIjwDAidnRSnBvtl/IGzz5KsEUjdLlcfoBr/kqe5jT4fJD9e7OMLDX+xtdkUi7
         n9ebOlGMHnFHagw7ZxuIdN/Brv0jeZPUVU2p0bZmgU3Xb1D3pLKWUhh6zUJuDr1bBm5w
         ezat90VW/h4fG3gKOP24RzyagzliDbpf0JytHDXJHxXK2SqGfFapdLAGH/vvvKC3XCnG
         PqsyBpy2XzuEY0R0z3GgUA4oTLjEKtKkr4hqoFLNg+HRM3HvEhqmtlvLg9y0e1gCXP5a
         Y0S1NGYt8vax0PLfhmsU40ieeHOhOfrq1+qNF6Fkj+SPOjU151KkIdtpxwqK8fmHNaN/
         /Dzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QxOhZDGN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si1152924uan.160.2021.06.07.10.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QxOhZDGN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJ6Q-0000th-0s
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIas-0007gX-W0
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:20 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaN-0007zR-Nf
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so48896wmg.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xM1/IljcmeixGn7/ya3GpB0ZkMzTXbAaR9fyni5YxU4=;
 b=QxOhZDGNlJu69mR/ZAdppK6LVebKgg6rk7YA8BQxLN+nTQI7eqvhdXZRbX0M/G3XEK
 SCmlRcvND2S56SUWQchIKrmLSdFSnlhIj3NxyaoeIy7I51qslIwyTow0bZPTqtWxto0M
 RjDs1nsIpwsdj7jH0p9mfw7SpLQZJkR7F9IvRpB+M4fgm9b79iFREGTRhGrhwqupXadh
 Fy0jHy/WtjHCSkbccYI8zf7yvSwfKdwkNzGUT1n7STavePdmU7V1rE46YfBZRqM++jUe
 YLmqp2XMPrQrv2ptn4ODavlUIJAXVJwQiV2OUZkPReF9EbtgOYv+d3CR5e5+xewCPDcb
 DMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xM1/IljcmeixGn7/ya3GpB0ZkMzTXbAaR9fyni5YxU4=;
 b=enmDaCjnjz+kCCdD8ayamEjsFX/vrM5kSURgkeKrJziHlN3Jk582NPdL4DqQsBuVJw
 vJ0gUUFDNlqFCKaVPhF+PBWwIQym6+SV8EMyDLo4tlb1DtMZ7WN+Rg83Fa4Z2IcXJMgq
 ibNEXOClOI6QNYTHBS1E4LVN9DqDQ25NCaIohKtMu9yYq2/RMB8ZG9GzRM0CVV73CrVw
 KTB3PzcmKY/C55/RMmArzOiQucyKzmtAn7/xOZuVA89xuIL0gFad6/O6OC/2MvTUkISD
 zbJtrjRrsPyArwfVnTQ0RMS1TLgv5l01A4DJKDTu6l5xsdJryAa5SC2CfWh/cMw01NRM
 ZKBw==
X-Gm-Message-State: AOAM532lP/cUPiKpM4AMzZTlHMOJ/GUvBaNi3wt2/9nOT1tlvjA25Zrp
 WHKe6NzK6p432S88YgWhvOYNUp9EfrVU7qtr
X-Received: by 2002:a05:600c:1ca2:: with SMTP id
 k34mr9728310wms.145.1623085122966; 
 Mon, 07 Jun 2021 09:58:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/55] target/arm: Implement MVE VRMULH
Date: Mon,  7 Jun 2021 17:57:50 +0100
Message-Id: <20210607165821.9892-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: W5iWyQvM/km6

Implement the MVE VRMULH insn, which performs a rounding multiply
and then returns the high half.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 22 ++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 34 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 17219df3159..38d084429b8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -90,3 +90,10 @@ DEF_HELPER_FLAGS_4(mve_vmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrmulhsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ca4c27209da..4ab6c9dba90 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -85,6 +85,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 VMULH_S          111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 
+VRMULH_S         111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
+VRMULH_U         111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 45b1b121ce6..20d96b86f5a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -368,9 +368,31 @@ static inline uint32_t do_mulh_w(int64_t n, int64_t m)
     return (n * m) >> 32;
 }
 
+static inline uint8_t do_rmulh_b(int32_t n, int32_t m)
+{
+    return (n * m + (1U << 7)) >> 8;
+}
+
+static inline uint16_t do_rmulh_h(int32_t n, int32_t m)
+{
+    return (n * m + (1U << 15)) >> 16;
+}
+
+static inline uint32_t do_rmulh_w(int64_t n, int64_t m)
+{
+    return (n * m + (1U << 31)) >> 32;
+}
+
 DO_2OP(vmulhsb, 1, int8_t, H1, do_mulh_b)
 DO_2OP(vmulhsh, 2, int16_t, H2, do_mulh_h)
 DO_2OP(vmulhsw, 4, int32_t, H4, do_mulh_w)
 DO_2OP(vmulhub, 1, uint8_t, H1, do_mulh_b)
 DO_2OP(vmulhuh, 2, uint16_t, H2, do_mulh_h)
 DO_2OP(vmulhuw, 4, uint32_t, H4, do_mulh_w)
+
+DO_2OP(vrmulhsb, 1, int8_t, H1, do_rmulh_b)
+DO_2OP(vrmulhsh, 2, int16_t, H2, do_rmulh_h)
+DO_2OP(vrmulhsw, 4, int32_t, H4, do_rmulh_w)
+DO_2OP(vrmulhub, 1, uint8_t, H1, do_rmulh_b)
+DO_2OP(vrmulhuh, 2, uint16_t, H2, do_rmulh_h)
+DO_2OP(vrmulhuw, 4, uint32_t, H4, do_rmulh_w)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index edea30ba1d7..7e9d852c6ff 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -381,3 +381,5 @@ DO_2OP(VSUB, vsub)
 DO_2OP(VMUL, vmul)
 DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
+DO_2OP(VRMULH_S, vrmulhs)
+DO_2OP(VRMULH_U, vrmulhu)
-- 
2.20.1

