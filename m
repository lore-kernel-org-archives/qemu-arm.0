Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1014292wrm;
        Fri, 11 Oct 2019 08:57:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6oHn5iKVaXhv7lq/64cWqxoGaqAb+LOWVNk1Ss67NSHVtM0NHTsmj4bh8n+vCYujNmLCS
X-Received: by 2002:a17:906:55d1:: with SMTP id z17mr14642365ejp.300.1570809457994;
        Fri, 11 Oct 2019 08:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809457; cv=none;
        d=google.com; s=arc-20160816;
        b=lLBR5nt9bSN+Mr32Ohsj129x12NFQEyyUMbEVpCk5+Ey1DCJxDpwhSCgazH3fKR+xG
         sndAcvbKgTULcGxZrQckITn9PBmc47UYAUR70VHsZvAc07kv4yU/+cyoM0BxWjQ/t+/k
         4PW3OltVhsnjcOVSgoLJbIsJQgVw67nkV/LMnx9Zfj15FuUU7oS88qm2pl656TQ45EEX
         pmfthgcxGuvxeqsQ6qbPxsuAkV2vZcimkx2k6+Mbdqz2QYgAtpxBBO9tXY+w8vtgq5sM
         eRO1eefhQIwSgCfaITasiFRxyMSdepGDI/rEg1xLUvI2rk11UebgaKpgEXel5aGVObYY
         QgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=nHlb3O+3OTrMLE5XtaApktPGFzFyl87vFrMc6HX9qtE=;
        b=TlB7E4ROQ2stR0lA6gxlkR5HVJsdL9O5P0soUg5DNX9/wXoMzbGLFFhfOViifBflKU
         QoVbdA1PcrZRupRHyyXtEaBan0swGd12SR8Fmm9Xn2AuskQfIHEHX2SeukyHefTyhfEv
         fWqz1OV11XfKUskxKQn2bHdxU16ua6mFyb5zhOYXvO8oJ6ndw5Ew15niiGJg6Y0GWdiL
         +5/nmCLGfgK2uuHEm1oJq8ly9D4gqHZtyyGf5rzXk7Ubm/HNxLnYi/CJ04HSbq62h33J
         Pe+nqpGw/Kjrre2vLv4q2u8eUCA9xJLzm0BVD9Q4WbBEEPcDSCPHGZBxot8zJ5oyrUKW
         Gixw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZqCEYIpK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si5556501ejw.76.2019.10.11.08.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 08:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZqCEYIpK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxIO-0004mB-H8
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 11:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGp-0002PU-9J
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGo-0007fT-3g
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:59 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:45858)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGn-0007f6-VQ
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:58 -0400
Received: by mail-yb1-xb44.google.com with SMTP id q143so3241135ybg.12
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nHlb3O+3OTrMLE5XtaApktPGFzFyl87vFrMc6HX9qtE=;
 b=ZqCEYIpKrjpd6xTcqoaQWD1C9Tkcc0sm9eGOxv1ubZPPqRcX+TOxubWYrzOSS9XNo5
 dYZTK851BM3lcBvB27RqGY5nfhDTv5ifqGKlWJCv9QK6aP4hojRXQ0H7Q+Td/9Rqh2An
 2F5ZYyMGCrVAdlUgkmk2KMvJL863w9y4bamf1jNqHQAVYelHZ2ibBVjreV1HetZ/bGft
 6dhLJ0k9ioCkWRpJx7swTcFEO9WY0WGfMQUYBfbrgr3tBgK7kijrrzhsSyI6h90Tq6WU
 AjmX6+7tODP1rKJIjOhZjo7diaIgg42/kuTaqpbuu8+eeuhn4liFCtUx8QbNV+BQePVs
 soGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nHlb3O+3OTrMLE5XtaApktPGFzFyl87vFrMc6HX9qtE=;
 b=dzQOaoQBqOoxuRcNyuZ/Cz5wbR24ppTsBRatjbh3hiDMN5EblDZZQb7Bdm8AgI7kE3
 DZyA01dKrN8LSI59fGx63J2butpnXhEq6vyVWYIjL7tAc+NKUGyeLFatcI5MsW7xh4ij
 dW7piTx74UZnSSUnqin9BAC/d6G3SC0o+B1d9aEOyYVRWAni9zh7e30q1Bw2xju1N+6f
 59MFwILMDjPlrywQxKmWrvW1Xs96DyerUp8IdvMA5lg95hutgN+rqaN03fmjW5Bc9Jvf
 RRwHKkaOd9xD2eFM/ZbQCc40/B8AwK3QrO+Xwb8diQfdk0xmfhZfflhPrpUFaTZQW79Q
 rjNA==
X-Gm-Message-State: APjAAAXA9hDNgiIY6gXxROADmkm9X6GbHsr/TkgZ+/RQTt3CZ2W/D04W
 Lxcpn9QTONF3vwBjEz6hmAQ7fw==
X-Received: by 2002:a25:2644:: with SMTP id m65mr10846131ybm.462.1570809357334; 
 Fri, 11 Oct 2019 08:55:57 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/20] target/arm: Split out rebuild_hflags_aprofile
Date: Fri, 11 Oct 2019 11:55:34 -0400
Message-Id: <20191011155546.14342-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pwPQxOu75YSM

Create a function to compute the values of the TBFLAG_ANY bits
that will be cached, and are used by A-profile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1cd54cc93..ddd21edfcf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11106,18 +11106,28 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_aprofile(CPUARMState *env)
+{
+    int flags = 0;
+
+    flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL,
+                       arm_debug_target_el(env));
+    return flags;
+}
+
 static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+    uint32_t flags = rebuild_hflags_aprofile(env);
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
+    uint32_t flags = rebuild_hflags_aprofile(env);
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
-    uint32_t flags = 0;
     uint64_t sctlr;
     int tbii, tbid;
 
@@ -11262,12 +11272,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (!arm_feature(env, ARM_FEATURE_M)) {
-        int target_el = arm_debug_target_el(env);
-
-        flags = FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL, target_el);
-    }
-
     *pflags = flags;
     *cs_base = 0;
 }
-- 
2.17.1

