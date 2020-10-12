Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1165134lfa;
        Mon, 12 Oct 2020 08:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRN3oktsCW5x+4x9Rvv6Gtf//ROqfLU21KQDfw5cWhdIgnq1OqtW1XE/Czui64q63y6W7b
X-Received: by 2002:a25:2054:: with SMTP id g81mr34548575ybg.490.1602518376283;
        Mon, 12 Oct 2020 08:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602518376; cv=none;
        d=google.com; s=arc-20160816;
        b=omNNuvuwqDJbFhDBmp5tb+QZZr4YwUWarfvDKe8LlxlGvKUR8VkekiY0qYlfq6Xll2
         JTaW8CzAq61E3Z6TtJiQ/3O95LpP6TTT3l8cVhZCdIRczDhWlfq6cquUADPogZEXr7hu
         8JvIB9XBjdYrxegyA8XryOhYYAc85qs2fRlmygapgJljRnKvUTLW1Z+/JNJdlA4TlDi+
         YRu4fELbNHciju6qqYt39hDoBDRmfv39pMhcvWDDYNgk5Blf3xEYWdZcWJPZGyup+VwT
         OTIoNsahN8hXxgLtrByzH2jAGaV0qOdW458US4BMpHjui0+s4jM8Uou04EFvkxI/wwlv
         2XVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=73sxXQONcqBgzHuOsaIz5hu+3BY6+pw52N6WyKkQfZo=;
        b=hPAkwWdkJaWTyc06yRIg4iYu1PJpYtxM7S5XZtyFeLL5q4PINGrqPrKDgX51XRFQnH
         KMtbuENfUZExOC5o2GLjKWHq8KxF+J5zhxyH/SqVuem+5sp6++JF1NN/2Xp9c+q5rdQb
         e7i2ezEsR7Jy5N+tn7d1y6KIxOWXmTrU6kXgNlY6q0Rp0B0D6pXbhzJRvpa5GgGWbvdi
         JGdxGGIt49GAuAc2mBrpUwwNqNYtkrS/kmw6xo4sP4wzB8D6jHwEppGp8ap3wKH5RS37
         mr8TPbLxni9QvCbtgmRoi5kItqhmGJeCLfIu8s4ycDvPWsDxAcYjGEnYmacMt8BwYvkJ
         IBlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exgSCy6T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f91si14881176ybi.478.2020.10.12.08.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exgSCy6T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS0EZ-0007L7-M3
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztf-0003b7-S8
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:37:59 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztY-0007lX-TM
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:37:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id l15so14008151wmh.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73sxXQONcqBgzHuOsaIz5hu+3BY6+pw52N6WyKkQfZo=;
 b=exgSCy6TBYKs+2u6PmauhdJ/pAV+QrSf2WLOJjFOA913gOLmL4t0hjV+pGDqFu59Kd
 shf6GEjbd5Xl9baMOMbtewoojWiuyQ1lZCErfoS3kXKtI3bWXD0olSbRYV1TsabJX/7q
 /JuIkVjG6Wj0oH+m7Hk+KEq52DO13lKiXQ3MhV9kMny4wRJLcVNJKKEYWo7aMIIHMgKm
 segKFQ8AK/ZTWrMvOWZZ5NaPOdnIwXzrtWxUQK93fM2sNdnX5MQk2hpbZi2DEOOt3eTq
 hyuH9Qv3WwK2VwWEQ+vSoTrHi/uqU8HHczSgqEPivdBX+3weH2MjPpKUR4hMhd334SB3
 9R6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73sxXQONcqBgzHuOsaIz5hu+3BY6+pw52N6WyKkQfZo=;
 b=APaClhsLZqnnq6hz9njUtVuDwKZhWJSy3gKdQODkj9q4mD5Qt6IvMg+UVa8j+RTvrx
 5/I0PgSwG1GNiA1I4acIiFZ9k9WK/L5f6eEFn03EAiDXSA/O44JT6J5BqkTucPggZPWd
 39JEmnfTeV8dEhpdWtyt10kQQcxbdXNpfPRaMhgld9wB1rnj6/GxvarWalQGZI/KB5Dt
 7VwDFXABuP+nPJBR6tRID/NRAkQ8laxFZ1LHEWiBfrtcuxfvkKco+iQuk5BzgxsgLRcY
 SVFYKR7o17TBzCjc/syXlCjh5ogHTBalPDGwEUkmJN5WMGnxinDEQKUb3eT+KgFq7Cxl
 Yu/Q==
X-Gm-Message-State: AOAM5329HstHJywXv5JVmZE6fXiUBFEeHZxUcAsPfttp/s/GgQCp7RYI
 2L0c6cpM2lCltp7A/5FPtWTtiND/FtEZO8iX
X-Received: by 2002:a1c:1f89:: with SMTP id f131mr11867963wmf.10.1602517070880; 
 Mon, 12 Oct 2020 08:37:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm7095961wmd.14.2020.10.12.08.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:37:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/10] target/arm: Implement v8.1M NOCP handling
Date: Mon, 12 Oct 2020 16:37:38 +0100
Message-Id: <20201012153746.9996-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153746.9996-1-peter.maydell@linaro.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VCrWXfTLLiiS

From v8.1M, disabled-coprocessor handling changes slightly:
 * coprocessors 8, 9, 14 and 15 are also governed by the
   cp10 enable bit, like cp11
 * an extra range of instruction patterns is considered
   to be inside the coprocessor space

We previously marked these up with TODO comments; implement the
correct behaviour.

Unfortunately there is no ID register field which indicates this
behaviour.  We could in theory test an unrelated ID register which
indicates guaranteed-to-be-in-v8.1M behaviour like ID_ISAR0.CmpBranch
>= 3 (low-overhead-loops), but it seems better to simply define a new
ARM_FEATURE_V8_1M feature flag and use it for this and other
new-in-v8.1M behaviour that isn't identifiable from the ID registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               |  1 +
 target/arm/m-nocp.decode       | 10 ++++++----
 target/arm/translate-vfp.c.inc | 17 +++++++++++++++--
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cfff1b5c8fe..74392fa0295 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1985,6 +1985,7 @@ enum arm_features {
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
+    ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/m-nocp.decode b/target/arm/m-nocp.decode
index 7182d7d1217..28c8ac6b94c 100644
--- a/target/arm/m-nocp.decode
+++ b/target/arm/m-nocp.decode
@@ -29,14 +29,16 @@
 # If the coprocessor is not present or disabled then we will generate
 # the NOCP exception; otherwise we let the insn through to the main decode.
 
+&nocp cp
+
 {
   # Special cases which do not take an early NOCP: VLLDM and VLSTM
   VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 0000 0000
   # TODO: VSCCLRM (new in v8.1M) is similar:
   #VSCCLRM      1110 1100 1-01 1111 ---- 1011 ---- ---0
 
-  NOCP         111- 1110 ---- ---- ---- cp:4 ---- ----
-  NOCP         111- 110- ---- ---- ---- cp:4 ---- ----
-  # TODO: From v8.1M onwards we will also want this range to NOCP
-  #NOCP_8_1     111- 1111 ---- ---- ---- ---- ---- ---- cp=10
+  NOCP         111- 1110 ---- ---- ---- cp:4 ---- ---- &nocp
+  NOCP         111- 110- ---- ---- ---- cp:4 ---- ---- &nocp
+  # From v8.1M onwards this range will also NOCP:
+  NOCP_8_1     111- 1111 ---- ---- ---- ---- ---- ---- &nocp cp=10
 }
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 28e0dba5f14..cc9ffb95887 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3459,7 +3459,7 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     return true;
 }
 
-static bool trans_NOCP(DisasContext *s, arg_NOCP *a)
+static bool trans_NOCP(DisasContext *s, arg_nocp *a)
 {
     /*
      * Handle M-profile early check for disabled coprocessor:
@@ -3472,7 +3472,11 @@ static bool trans_NOCP(DisasContext *s, arg_NOCP *a)
     if (a->cp == 11) {
         a->cp = 10;
     }
-    /* TODO: in v8.1M cp 8, 9, 14, 15 also are governed by the cp10 enable */
+    if (arm_dc_feature(s, ARM_FEATURE_V8_1M) &&
+        (a->cp == 8 || a->cp == 9 || a->cp == 14 || a->cp == 15)) {
+        /* in v8.1M cp 8, 9, 14, 15 also are governed by the cp10 enable */
+        a->cp = 10;
+    }
 
     if (a->cp != 10) {
         gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
@@ -3489,6 +3493,15 @@ static bool trans_NOCP(DisasContext *s, arg_NOCP *a)
     return false;
 }
 
+static bool trans_NOCP_8_1(DisasContext *s, arg_nocp *a)
+{
+    /* This range needs a coprocessor check for v8.1M and later only */
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    return trans_NOCP(s, a);
+}
+
 static bool trans_VINS(DisasContext *s, arg_VINS *a)
 {
     TCGv_i32 rd, rm;
-- 
2.20.1

