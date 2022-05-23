Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3753791lfh;
        Mon, 23 May 2022 13:49:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHAF8NqZXK++0CXch4uG8arQzoeoIInq8mO9tcxsBIWhEvun1flJNKSBdD/JOxg+dGwvB3
X-Received: by 2002:a05:622a:1006:b0:2f9:3e20:7640 with SMTP id d6-20020a05622a100600b002f93e207640mr2285798qte.550.1653338951540;
        Mon, 23 May 2022 13:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653338951; cv=none;
        d=google.com; s=arc-20160816;
        b=vlp4xmjnGNgiK750Xq1lAWdRDKWupPnykO9/6Y1tFhqS0igbWqbrCJ8D0uo7aSnF2h
         Yq2SVDtgUsQDKCb7hB1awvfIYKpCcov7IHeUs12IJB9DURHnPxupXBBG079kNeAXsfHy
         S27Zp2hh3YkLg2lWx/go/rFtjexAEr0NScXGnQIAhWHXMrXq7ROos0mOpzOwDNcXRGia
         LR1rq1upcrcHdISXxggHbL+L5HZTGsxN5beCleFEfnrHr0T4GZwbMlEfa5kq1Wa856de
         mS4s9eH1qGR2UetToD8bKrovxKYaQMV/NJQuGkJsTR059O2romo+G6hhRdfL1vwEo6oc
         eKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oJAaanvQuK73f6LtwZ6AmktcHVIa9UGFP+msm39TbKw=;
        b=AQRvB3s3E+1m+tSdavaZ3IMqpV371RjofnNJZxrsFDaJLNwKMSJnqVHeH8nxAEOONn
         O1U+7eAExgXXWWfQSI034G+r7SA4FZvcq5xmPejeCLkMGBX9MKlr7vm8tM83tLsPEN77
         jdF8Nj7tOpkI1aesb97PcUCh1JwWTYX3+LvrG3Hc4N3HmtkdxpKPFT9J4qYIU1X/6EdF
         8L754MK3AdNgcclfPZ+iySToCRy++Zz84vFspn0sp2X3lbsGl+cxQHr3h+cvcqDaHUdJ
         ftwsgo2/maEwcEFk4qqw7k2tJboTdSsMWR5dzFEV8JX4gJLIgdDIGU90+F76u0ZvqtKK
         1TDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KqldvE/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020a05622a008200b002f3f4a7b78asi3328788qtw.783.2022.05.23.13.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KqldvE/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntEzH-0001pc-12
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExw-0008BJ-Ll
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExu-0004zC-OX
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gg20so15065555pjb.1
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJAaanvQuK73f6LtwZ6AmktcHVIa9UGFP+msm39TbKw=;
 b=KqldvE/25cf1yARueOkRl5RWX6gwhTLo4/xbLytS/mKo40SnWXK/Iq65VuNH6UBrVu
 xVRDWoM0xBGHiwJ94i7YIN3CYzu0XxTVqlCdGTC95FSdtb+tPUc837xrQOKdiScajD4L
 Bo9+pReewtraBa9iVexbkcP6GHUTTuEkpRQ5S9907R68La3ozoZz7L8q2RAQUcr61/6D
 XGTH8zirNSFHzdiOGSpMQ/3K4nj1gpfeyPFIKY9veIu5+a0sgVVg02DFMufMzf3O8pv/
 qOFXaOnkJ4ziqi+yQM9GmcGtfYNwDLAn+AhSVaqIXSYziARIDFJqbnFCcs8kzN9fsQVR
 t9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJAaanvQuK73f6LtwZ6AmktcHVIa9UGFP+msm39TbKw=;
 b=S5woJJOT0+mN0YWJ65hy8HIvrEcZMAuav11P68N9Q524rgwftmXxvRH3590xEjGqaX
 xN6EWZRxqfsOM0T0BnrY+t9XUPhOiqM9K/+t995PkTv/l4kufJY4hzm8f7Y27p23/QlP
 VMSBcTKOZyNzI9VntS1NyI9c6s8xjQX0oqolvIMxl673BStffTcOvDzP+kjRZsUomFrj
 HLSvHb+JKtOxIEE56+LqBhzKS12Vy1xsvc1Cxhov0ol2MESltc2elHFM/I/LyZ9Dq/7l
 1hl0ADXwLFZY5SUEGbH55kZrlJDzedxPrD2J23b2UWwK5eNu7MijcavqCtvxU5mbKCNA
 ScXw==
X-Gm-Message-State: AOAM530+aMVZl71uaimVaAUmI0Z6ECPz+4jXTE8AVJsPD7I1fcrPh84A
 NHjaDd6Fd3week4EWuc+tX3xBlNPV9EUvg==
X-Received: by 2002:a17:90a:e7c8:b0:1df:fe28:ceb8 with SMTP id
 kb8-20020a17090ae7c800b001dffe28ceb8mr827372pjb.193.1653338865037; 
 Mon, 23 May 2022 13:47:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/18] target/arm: Allow raise_exception to handle finding
 target EL
Date: Mon, 23 May 2022 13:47:25 -0700
Message-Id: <20220523204742.740932-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CN9yNzmIJv6P

The work of finding the correct target EL for an exception is
currently split between raise_exception and target_exception_el.
Begin merging these by allowing the input to raise_exception
to be zero and use exception_target_el for that case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 ++++++-----
 target/arm/op_helper.c | 13 +++++++++----
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b654bee468..03363b0f32 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -111,18 +111,19 @@ FIELD(DBGWCR, SSCE, 29, 1)
 /**
  * raise_exception: Raise the specified exception.
  * Raise a guest exception with the specified value, syndrome register
- * and target exception level. This should be called from helper functions,
- * and never returns because we will longjump back up to the CPU main loop.
+ * and the current or target exception level. This should be called from
+ * helper functions, and never returns because we will longjump back up
+ * to the CPU main loop.
  */
 G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint32_t syndrome, uint32_t target_el);
+                                uint32_t syndrome, uint32_t cur_or_target_el);
 
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
 G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                      uint32_t syndrome, uint32_t target_el,
-                                      uintptr_t ra);
+                                   uint32_t syndrome,
+                                   uint32_t cur_or_target_el, uintptr_t ra);
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c4bd668870..6b9141b79a 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,10 +28,15 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
-void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint32_t syndrome, uint32_t target_el)
+void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
+                     uint32_t cur_or_target_el)
 {
     CPUState *cs = env_cpu(env);
+    int target_el = cur_or_target_el;
+
+    if (cur_or_target_el == 0) {
+        target_el = exception_target_el(env);
+    }
 
     if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
         /*
@@ -54,7 +59,7 @@ void raise_exception(CPUARMState *env, uint32_t excp,
 }
 
 void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
-                        uint32_t target_el, uintptr_t ra)
+                        uint32_t cur_or_target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
 
@@ -64,7 +69,7 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
      * the caller passed us, and cannot use cpu_loop_exit_restore().
      */
     cpu_restore_state(cs, ra, true);
-    raise_exception(env, excp, syndrome, target_el);
+    raise_exception(env, excp, syndrome, cur_or_target_el);
 }
 
 uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-- 
2.34.1

