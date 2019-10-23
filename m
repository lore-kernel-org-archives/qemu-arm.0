Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1036094wrq;
        Wed, 23 Oct 2019 08:25:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOC8vUfoRz9ZojC9PgZtm78dWgDU42JCXtL+H4ZX8ZfjIItcQcavhTl7N5TZTlWdaCA3CB
X-Received: by 2002:a0c:e6e5:: with SMTP id m5mr9239954qvn.170.1571844301268;
        Wed, 23 Oct 2019 08:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844301; cv=none;
        d=google.com; s=arc-20160816;
        b=CaGuW4WGpdKeEMWvmIItJ1hqrV+1h+1nKSIoijBpnccM0VRwxogU5FK5klD0mE9mFI
         faoOcSDBOGF5SovrfRTeZNxL0j66Qhga5oXRAHPSO8OQVBS1cxjGNp7Ui2tBHz/LFedC
         ecZerK6Nkof3CZjbku4o4R6l7U2tnLbiSdX0oTE//FqP0KCsCVlg3TbmQrYGz876FMsR
         vdXarx1Z/AjW6Sc12bfA1x9HZu9xbBMsI1vhjEQPG6okRUcV75n+IHl2xDYQovO/rLPH
         QmlNJ8d8/cto5GSR47E7isOEHvYwR/3Dgif512GRS8Am5j7hVoKlm7g871+EfAo3v56Q
         OIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
        b=Ml0ccWOkS9LrLt6T/2vLrWyoENjYtmN22au/qtgqnd4Z+mtUZEjFffD+sMnGji8ssW
         ofpYcQlBeLGEmI9qeRXODo6d5EqTWKWinEpeZgCb9fGPK0vMP0HiWA5l1uC3PYieP9KC
         3jLjNrAZ7rjJA2iHHEqc+2b68ByatPUmjy2VqzMxAx48IZUxdGhxWE2Z9tnNqT4nWdqC
         W7BQN9Hw6vAQrTe75OxIb6P9iPd+nobjMmi8ZXHU1ObXcjCeTtygEow9rDPa4DlCCGCQ
         MWJNPuE1mgAv+dFDBoSbeflwBzMxHWz5v0uy9s+y6kZUlEzA7TUohVuTdCJREmjopd7d
         +oew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ToQyPTDt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si4721065qtz.384.2019.10.23.08.25.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:25:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ToQyPTDt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIVQ-0001ZI-7o
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8u-000899-1W
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001FQ-By
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:43 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:33722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-00018U-3l
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: by mail-qt1-x844.google.com with SMTP id r5so32789254qtd.0
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
 b=ToQyPTDtGgKWs253kz1CECPIV+6/w1Axc2rqud0q/XD45AKLnTK3jL26xz1ef0xRP8
 KwEpp57ALlTCzWKaaQPEvvSk3E8uxlVb2Ez52IJxC2+ijQT+o0pQEq0qjvzTNavYI8b5
 +y/UNhxiiO8xVwUQdL70UKQ5loEDksmc10WwKT0lfBmO4vYb4j4aqrkHMKbAP64oateO
 S+7h2AbDRg4s88Xro5zkyh7JjitiGd637Lloe6pUMAzbK3Dg1ictt+mP9n8UEw0JntxN
 iitFcX8P1GOXE4vtNMR00cqbxIhPMlQTR4nIODejXzIRjnMOY6uSa4ijkbf0ed9C8+By
 KuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
 b=BK0Kjs+NoCs6MLr7eUTVp/PqipfTTTEfKzELaZHRYDNcgajBSEtgqCcQ2h9OeqNScI
 lhsIphpTLCefLV8o1K95SjAada9TsNB2vd4SPQX4vY3DKY2hEP7zP4amTUAThKSaUI9K
 SvSLLMrLTuwfgWzK40AW5SmWQT3dZ0WnhDYiPSn95lzLw42VRVDivzB1UkPyoH5aFbMT
 gnVMjqUIRgddRmgPRYHoZOosi6BsOVbAiewe4MfavkR0FEHlm9yjWh14NHr6zMfOfsUp
 OH6s2nRRrczhBrrN5bqBLRPTBI3qxUKj1OVBk31Y7plIIeCdfwZPPXJi7O0fgRfkVdt8
 sMAw==
X-Gm-Message-State: APjAAAVZn+1384z7LVkdVspYVsOc/DVxCBWchyP2emH5T3dXFaAuQ6zL
 gg8oNckh+kJmiXtg4kVF2f1dK5hqSaw=
X-Received: by 2002:ac8:1604:: with SMTP id p4mr9899981qtj.276.1571842883078; 
 Wed, 23 Oct 2019 08:01:23 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 15/24] target/arm: Add HELPER(rebuild_hflags_{a32, a64,
 m32})
Date: Wed, 23 Oct 2019 11:00:48 -0400
Message-Id: <20191023150057.25731-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
X-TUID: 0eqMv/FoDAJD

This functions are given the mode and el state of the cpu
and writes the computed value to env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h |  4 ++++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1fb2cb5a77..3d4ec267a2 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -90,6 +90,10 @@ DEF_HELPER_4(msr_banked, void, env, i32, i32, i32)
 DEF_HELPER_2(get_user_reg, i32, env, i32)
 DEF_HELPER_3(set_user_reg, void, env, i32, i32)
 
+DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
+
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37424e3d4d..b2d701cf00 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11220,6 +11220,30 @@ void arm_rebuild_hflags(CPUARMState *env)
     env->hflags = rebuild_hflags_internal(env);
 }
 
+void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-- 
2.17.1

