Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp277693lfm;
        Thu, 20 May 2021 08:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj2pYO/7OQnVFojChHMICrio3NwzNLNGcfpe9aHR02dDAeB23imZnAv9cp8RIrCifNl5Tb
X-Received: by 2002:a05:6638:a2c:: with SMTP id 12mr6923636jao.99.1621524980084;
        Thu, 20 May 2021 08:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621524980; cv=none;
        d=google.com; s=arc-20160816;
        b=B+oXW9zpY4GIJTZJKXjWk3whM5TNu5wbYRHMzns3G+aYTr3Lir4JJNeV2J2WVsl2Q4
         Ctu0ctoM61pPwjLka2STTwHC7jud5YHgwPv27nS9QdrvtWCDYYqsDBqPrq6aIOxPPXW3
         N5/XaPv3lrK82viSqqDRkYo8cgYUw70JOQH1xekjoGs2YpMxlQgU15758eJ9OinrkJhi
         Mu/lFBMK49e/E7tPbHm9n8/dVTGP+2I9cBcj/ngLuSJPFFZU325zFcSqhwJdN/FjNFfj
         JFMG6sGz0virUVFsP56cKIJiIpBAAvcOY6vYgfk/FbzXvL2OJqR9ip9qByQAn5CTlOUM
         Gu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1oOgxL2tL4yDEyW5l0fIMivAaVwszzcwhe2CoFdgg/Y=;
        b=atCnci39cVgtn79xyDPa+cSjJXnhhD/kLD99a71kDJuOuNVHULxuKVPJ8VdFtnfGQ7
         gbLQcxOdmK3KywAq0rBrZfrsQJBIHlSw4+knkeY94zQ5bq6EpjJcDshEGs+nxmnb4jCZ
         6uJ47D/aAMHhVyur1G9zv3vnmaTSAbnM2Xxx4BvYnj4GpIZrybjnlj3PvPWjDlxWNBuI
         neBJvXuN3agFokg1vJ/hd9bcWzz/oRVJEkBsUUgcbSd6/9iMP7reK2yNxpiZesxmnh4Y
         PSAQsU6GhtWXbHK8XnIjlfmqyKnjle7ENbWqjww/atVwvyYYj/P408vtv/a9O+ov2kDw
         5VSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LEGNv2wX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si2503255jak.13.2021.05.20.08.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LEGNv2wX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljkih-0000YZ-Cq
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbS-000811-Py
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbQ-0000gU-B0
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso2954129wmc.2
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1oOgxL2tL4yDEyW5l0fIMivAaVwszzcwhe2CoFdgg/Y=;
 b=LEGNv2wXcG7PQKl5P4q2u5e4ezxAdwLoApRXP5TP/AKv5OUsizDaLCKISyYSWGOPIH
 Q+9qo7suJjWnRtb8n3Gk7QxZ21iSd0p1B5Lit80b3uIMH262SK/uAegLx13HTsmS4vkU
 V3LNnRVO6pIaO7MZ2XUF1PEOGoK+8n2S21SQOHXFXqAyQficzVn9I4U78idTFR/igEq7
 39okDVf1SPJZ7SPTqCxNUjIJTD9Ay21hUIMLmU8RJSXOTBl4hl82ObS8+/UsTed7/A8N
 qF0jvj14fVWbied4Go7PoUpwGuUWuDJyJK5vDG3kD7Sk8K1SNiMl3SZBs8Rmqpf+gFaQ
 s2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1oOgxL2tL4yDEyW5l0fIMivAaVwszzcwhe2CoFdgg/Y=;
 b=Yhlp+NDoMbd6dpZ7Zx9QtTq/TjWTpxHiaIVAQRJ9EXP2KSuLmefGhoZMY3YQfUXGQe
 4nMHIgo8Prlk8IpEPoUJBTCd1ObFtiajLwD1VZDxZKptGSnod0kvK79/PsyeysDfn7fk
 OBWEzpWJtmpFcO36J1Byw6ZpNryp7V2lM/cLrWD36btbK5GxwlTLSTcMizVMIVM+Ct4H
 vVHPI3BqCNkt6heYIZtL85b+h7EZJKKZVXDS7cZGKU8as7irRdZ7JEyZv2TeJuX51bo0
 mRgOz8wGokRkQw+0HCkjckIj90j1+aZ3BZdqPy/vVjyKGuCp34L6ZVTOk5mk+dtPwZMc
 vUvw==
X-Gm-Message-State: AOAM532Q0iaYCFEnWGc5Jl8KNAczlO/f1vXcXAOg6CpwASQXUT+RtBGw
 W1HaGS2fxtCh0kdWHxScE0wGK9585kQlGx+/
X-Received: by 2002:a1c:bcc3:: with SMTP id m186mr4254834wmf.74.1621524526974; 
 Thu, 20 May 2021 08:28:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/9] target/arm: Implement M-profile VPR register
Date: Thu, 20 May 2021 16:28:37 +0100
Message-Id: <20210520152840.24453-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U8LKAkrBI/Rb

If MVE is implemented for an M-profile CPU then it has a VPR
register, which tracks predication information.

Implement the read and write handling of this register, and
the migration of its state.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  6 ++++++
 target/arm/machine.c       | 19 +++++++++++++++++++
 target/arm/translate-vfp.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d037f5530fc..b0237f0dc83 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -564,6 +564,7 @@ typedef struct CPUARMState {
         uint32_t cpacr[M_REG_NUM_BANKS];
         uint32_t nsacr;
         int ltpsize;
+        uint32_t vpr;
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -1760,6 +1761,11 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
      R_V7M_FPCCR_UFRDY_MASK |                   \
      R_V7M_FPCCR_ASPEN_MASK)
 
+/* v7M VPR bits */
+FIELD(V7M_VPR, P0, 0, 16)
+FIELD(V7M_VPR, MASK01, 16, 4)
+FIELD(V7M_VPR, MASK23, 20, 4)
+
 /*
  * System register ID fields.
  */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6ad1d306b12..62a71a3b640 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -318,6 +318,24 @@ static const VMStateDescription vmstate_m_fp = {
     }
 };
 
+static bool mve_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    return cpu_isar_feature(aa32_mve, cpu);
+}
+
+static const VMStateDescription vmstate_m_mve = {
+    .name = "cpu/m/mve",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = mve_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.v7m.vpr, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 4,
@@ -344,6 +362,7 @@ static const VMStateDescription vmstate_m = {
         &vmstate_m_other_sp,
         &vmstate_m_v8m,
         &vmstate_m_fp,
+        &vmstate_m_mve,
         NULL
     }
 };
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 791c4f5f70b..2316e105acc 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -703,6 +703,12 @@ static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
             return FPSysRegCheckFailed;
         }
         break;
+    case ARM_VFP_VPR:
+    case ARM_VFP_P0:
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return FPSysRegCheckFailed;
+        }
+        break;
     default:
         return FPSysRegCheckFailed;
     }
@@ -817,6 +823,25 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_temp_free_i32(sfpa);
         break;
     }
+    case ARM_VFP_VPR:
+        /* Behaves as NOP if not privileged */
+        if (IS_USER(s)) {
+            break;
+        }
+        tmp = loadfn(s, opaque);
+        store_cpu_field(tmp, v7m.vpr);
+        break;
+    case ARM_VFP_P0:
+    {
+        TCGv_i32 vpr;
+        tmp = loadfn(s, opaque);
+        vpr = load_cpu_field(v7m.vpr);
+        tcg_gen_deposit_i32(vpr, vpr, tmp,
+                            R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
+        store_cpu_field(vpr, v7m.vpr);
+        tcg_temp_free_i32(tmp);
+        break;
+    }
     default:
         g_assert_not_reached();
     }
@@ -935,6 +960,19 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_temp_free_i32(fpscr);
         break;
     }
+    case ARM_VFP_VPR:
+        /* Behaves as NOP if not privileged */
+        if (IS_USER(s)) {
+            break;
+        }
+        tmp = load_cpu_field(v7m.vpr);
+        storefn(s, opaque, tmp);
+        break;
+    case ARM_VFP_P0:
+        tmp = load_cpu_field(v7m.vpr);
+        tcg_gen_extract_i32(tmp, tmp, R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
+        storefn(s, opaque, tmp);
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.20.1

