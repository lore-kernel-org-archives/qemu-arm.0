Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2052303njc;
        Sun, 17 Nov 2024 05:50:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWf3tTIRRTrks1RiPdPQOfsl65EsUobKUqypHAhCf1KsFnSFe3NnMC3ivLbDTrZM2reK8KmwErazSMF6w==@linaro.org
X-Google-Smtp-Source: AGHT+IFvk0GInUyeEOAF0YdvrC8FSwxbFVjcZMWqnpfArLiS+9Znz37Q+ENxudDnvfXhLr33fUVn
X-Received: by 2002:a05:6214:428a:b0:6d3:b571:5cdd with SMTP id 6a1803df08f44-6d3fb7497bamr149144696d6.2.1731851425183;
        Sun, 17 Nov 2024 05:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731851425; cv=none;
        d=google.com; s=arc-20240605;
        b=lvNZYUruz7RsD4u5cCmM/8ynk2MxJfs0IoO/cH8kOtdUXXL30/CgoOImd/82XFuhBD
         mENxn3AxxiwKIKXTBjT2Lekr5Jy08aq8bVOwUHsH4MwfwYUjcfqQQulWdtjGKxxxteTQ
         y/r4YIRDHvy4u4rsQIx+Y2MZyFzRVhDpL5egeeXeughTwkj+Kj4bOj9DkG1O/3USy4b3
         MhtEYdQUd75QUgHmcRsDuTHtUm2qamqIvYxP4/2C8IG9jNIaaw8AblY//+leX5dPq7Pf
         9zm05tqZ5UuqocV/pay6q4GNPA0S+5/kBHJtQDoxkmyQ74gvEdIlfVWDH2h+WNPNaQj3
         rquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gjWfFSgM5KEzdl52FE7hGAgllBGqgBXace3aPtnBxZo=;
        fh=74Scric1GX0tTMHEfM0IO5CkTffYdSJm60xCkDkXWg8=;
        b=KsQT919NrBEiEYDaUNm7y8i2Z0MlGdroVWH/G0HDZINrVF/LbCEW0MVyj34KKloyRb
         11K+4j1FAOYQ5w4Csy57jY+gwsNDGa8w1S8Lf+AgNDyzYZ0ckvCTMA7PT90DKAO77S0h
         jAi4EIC1eYXXtIt6OIfMGbjG9R2b5YMEIVDc7RxtIIhntsHZ6XSFAb5k0Z/D4HwPXEVa
         iWdI4W96QC9oP2Tcf241G4DA0GDnv9Z/fDc9dT/7xu4kzY8oBrtLilYJlVcSbN1ewJKj
         1PMMVsvOMMBxLPnl2WfJQiBcYLy5llCNVGpYrJUYEVxsZY7S3XbNgDHDwdqTR+1OWYON
         iO2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3HudcZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d40dd01edcsi40206586d6.464.2024.11.17.05.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2024 05:50:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3HudcZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tCffT-00064c-7C; Sun, 17 Nov 2024 08:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1tCffS-00064K-3s; Sun, 17 Nov 2024 08:50:22 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1tCffQ-0002HK-HX; Sun, 17 Nov 2024 08:50:21 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fb561f273eso31862121fa.2; 
 Sun, 17 Nov 2024 05:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731851418; x=1732456218; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gjWfFSgM5KEzdl52FE7hGAgllBGqgBXace3aPtnBxZo=;
 b=N3HudcZLrV456Wbgpl0lsX3JIcV8znvXZIrr5issKus75Ocg7fIpmeDVPpx1/R+fEv
 GvkHi8NA6Jg2olwArSd5OMPUxijw6GrG0bLY1aRiqEVfOtJsuPkqoEPdO0b8Xxg12bdn
 gy6nt8wlkv3D0e/soZySdw0rFyYvaSCfj+jX9gUUuwrBmwlyWzVV9lPF6A4N7Xa7kuL6
 wjmqwx3d5wgI6mM1wMvoMQOBdX1/G5B3LRN+sPL7mlhXdp0/NnZyRc6O/XijQNlS98BA
 DbTZyE4U/ukglXN+rGNXu3dQlLTO0LaOVMEgc0jsuI46J8J1nb9bl0djGQ4P7hOvQABo
 jp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731851418; x=1732456218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gjWfFSgM5KEzdl52FE7hGAgllBGqgBXace3aPtnBxZo=;
 b=tT5SSoegc4hdxSaubiamTBRhOrowJE2K8p+QGibvX2fNJzykO0RB+8BTqmy19a4WwW
 EoFVNzo6F/AZWKbNZoEZH5UjUvcciviQg/AoC/lFZ18j6uqS0vevgkBmAPD9VK9T+z20
 4XAviISTDxl4Is3NHeA1l9by0dJzg4qQYsmsuwCZXxSNqOdaxFJYsTu9T3VthjNCH5oh
 RJxHYGSn48TAC0KFKeO2SPTF1/Xmk7psazM0hSTCjpBRnlkri2eBWEyYelt6R5YkZAHi
 2cfjmGN6uu5BRasHL09+DGCD9nwxkMtE79Y5x1TOvS5WvyBwiArRYXirPStjALVCdJpa
 2ohg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGz8LInRRJSsAfMoVsPq1Fwefb631U/jVTIcrio3sMMT6zNUhzsEsT9I4gVUhw5iNtM+LAXlP9OK7x@nongnu.org
X-Gm-Message-State: AOJu0YwsutGohUUYZEkNRar1l8CtM10aLQ3b+z/BLtaP3PEUPd69wT2j
 6IcoOY/3IDG7BqXMiXBnR8td/+frQr3S/zWeVIAUDw6Ib63EUbAr
X-Received: by 2002:a2e:b896:0:b0:2fb:403c:268b with SMTP id
 38308e7fff4ca-2ff606fd49fmr42420011fa.34.1731851417825; 
 Sun, 17 Nov 2024 05:50:17 -0800 (PST)
Received: from fedora.. ([2a00:1370:8180:90b:d00f:257f:ffb:ac70])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff698515e6sm6229361fa.25.2024.11.17.05.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 05:50:15 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v2 1/2] arm/ptw: make get_S1prot accept decoded AP
Date: Sun, 17 Nov 2024 08:50:10 -0500
Message-ID: <20241117135010.37410-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117134931.37249-1-paskripkin@gmail.com>
References: <20241117134931.37249-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=paskripkin@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T5sPuv7T/o4+

AP in armv7 short descriptor mode has 3 bits and also domain, which
makes it incompatible with other arm schemas.

To make it possible to share get_S1prot between armv8, armv7 long
format, armv7 short format and armv6 it's easier to make caller
decode AP.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 target/arm/ptw.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9849949508..50eed0f811 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1357,25 +1357,24 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
  * @env:     CPUARMState
  * @mmu_idx: MMU index indicating required translation regime
  * @is_aa64: TRUE if AArch64
- * @ap:      The 2-bit simple AP (AP[2:1])
+ * @user_rw: Translated AP for user access
+ * @prot_rw: Translated AP for privileged access
  * @xn:      XN (execute-never) bit
  * @pxn:     PXN (privileged execute-never) bit
  * @in_pa:   The original input pa space
  * @out_pa:  The output pa space, modified by NSTable, NS, and NSE
  */
 static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
-                      int ap, int xn, int pxn,
+                      int user_rw, int prot_rw, int xn, int pxn,
                       ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
 {
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
-    int prot_rw, user_rw;
     bool have_wxn;
     int wxn = 0;
 
     assert(!regime_is_stage2(mmu_idx));
 
-    user_rw = simple_ap_to_rw_prot_is_user(ap, true);
     if (is_user) {
         prot_rw = user_rw;
     } else {
@@ -1393,8 +1392,6 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                    regime_is_pan(env, mmu_idx) &&
                    (regime_sctlr(env, mmu_idx) & SCTLR_EPAN) && !xn) {
             prot_rw = 0;
-        } else {
-            prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
         }
     }
 
@@ -2044,6 +2041,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         int nse, ns = extract32(attrs, 5, 1);
         uint8_t attrindx;
         uint64_t mair;
+        int ap_usr = simple_ap_to_rw_prot_is_user(ap, true);
+        int ap_priv = simple_ap_to_rw_prot_is_user(ap, false);
 
         switch (out_space) {
         case ARMSS_Root:
@@ -2114,7 +2113,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          * Note that we modified ptw->in_space earlier for NSTable, but
          * result->f.attrs retains a copy of the original security space.
          */
-        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
+        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap_usr, ap_priv, xn, pxn,
                                     result->f.attrs.space, out_space);
 
         /* Index into MAIR registers for cache attributes */
-- 
2.46.0

