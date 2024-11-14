Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp1708dll;
        Thu, 14 Nov 2024 09:01:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrd8dIQh8LEzBSvLXns4wbVA5uhmbyLXSVfIvtPFgVUUCHY1I9mtRY7Ld2abeDa7TOo7RS9GJbFbK1ZA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZ8vsXTshSyV+vg8zSpEHbk6dlwiQbe9ekRS5VNglSpVo7XzZJhgSvQc3ZGrLc7wVSsDQj
X-Received: by 2002:a05:6102:4188:b0:4a5:220e:6fac with SMTP id ada2fe7eead31-4ad468b108bmr8763057137.11.1731603638299;
        Thu, 14 Nov 2024 09:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731603638; cv=none;
        d=google.com; s=arc-20240605;
        b=E/itYYPhap8c19uwvciMRnmxVUxpuQZ2RXYv+xLHP4HgvgD//n/HSNkvrQsUDXxyBJ
         uPwxR2qcA+w5YjTOw+0d5e6UsEr+LCuvQr7PkJAsG8opni2hsJtNToOmKPritPNDVK23
         sIjySPYsYBZvC13egfbnzhmxZSgfNq2aQs7DWw3jxLN4rfqPqcDK8nWRfBz0a1ALrSYx
         VwyrGGh7hldidJ2mfidJ0sxTjAFWzGVB0RKpSWrj9Xk3f9C8B6NhKIfP2oL1e5NW8PoI
         7pMmoQt7WwfHZKctPkkjcmfZm96ARlQlhrayJSYQLDP8ezxKEOuTfs1Rv9/i8kpnbf0w
         FEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OjqNSEAeDqZHUwaEAq62cXj/YVXs2ncKcqAnAF2TK3M=;
        fh=EPFc8dtGuClVXJMwXVwL7gioHtL8jGgXDLsOPLHHYco=;
        b=Vm7qniFvkdB9qiIsRYBUniyGcha8kL/2FXoB+J2J7XovsSk3NQOP0Uw+k0XE7LpAMn
         3rbE4fDez9jHWqBnCL+B1idxxx/EAj4NBaPNZqgTzlxXpMrKjqrJj5FBXM3apPeLV16q
         uFkSPKaQY9S64AD2Lm8jknFx6eZa9ySJEFvRTKiOmJMWmFtEMROczXlr3UQBYZ4mBErd
         0xhVBmxBTCUhaGWgPt/fap4UwIFHr27X2h8X7pRNBr/aMm3feEmlzbdjjIM7xjE4RQAQ
         Qtkw5OsONejg7TG92SSNd2HuDqqv14k0iQ0C5FMsHrgF70Duxxx5kZKj5fYIcAQIJORe
         drew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FogwjpGX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ad5982474csi549542137.244.2024.11.14.09.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 09:00:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FogwjpGX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBdCF-0004wx-D5; Thu, 14 Nov 2024 11:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1tBdBk-0003wD-61; Thu, 14 Nov 2024 11:59:24 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1tBdBi-0002lz-3D; Thu, 14 Nov 2024 11:59:23 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ff57619835so8773871fa.0; 
 Thu, 14 Nov 2024 08:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731603560; x=1732208360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OjqNSEAeDqZHUwaEAq62cXj/YVXs2ncKcqAnAF2TK3M=;
 b=FogwjpGXgHsijVzcINWh/u44/FSuSL/GQtTo6x11UBWR5IFRQQ45dFbvaO1CsdyW9g
 0SYBCMMLzAc/6E4Mcbybohdk1VLXZVlljwr5QE+ftZILrOpu0ZvkGPJF+MtMShTHBsn7
 AQrmLsrwaNlnqJHuepppz42kWaE9EZAN8gOgsmaQ/DC3C4Q5edNSShJjQRTMDvUxO7Ty
 K14s7umi8s/iEew8QBbwS+FV6kqADC0zrcpSZRiTyJTsl9FiVTNT55fXJYYLjUaORKyU
 qWJKpLZo/Di5JLNh78CwNRZ2vTv+JiXZlNf3U6l5Jeace8G0HxYhOooAyQl4fGXj0ssA
 XucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731603560; x=1732208360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OjqNSEAeDqZHUwaEAq62cXj/YVXs2ncKcqAnAF2TK3M=;
 b=aPN18e1J+MfYaskdaqGlX8J4mLcOATMea6W6Sjn3RG3M6JZCx1cj00haqR0bt78MnT
 dObNzPwQlRLGBWMpGo3rdFO79Q08JgfQxUrIyEOitTjcn33077WwNbmUpjp9+REeb5Um
 bBY2pivpW8h5GcDXmjiFnLbufTdm5UsqO4FWvwSEBg5W/r7N1sTX85cqhbcm39YKwKey
 wHZt/D03UzzmsSUfpuYIvA1W7WvWsKHpYjzBMXVg2R+MMh/bSJEn2Ixu74qyl2uMJBZX
 Swg2znLwP+VNwjD8IoQnOpOPwKpIIeR4iy2UpbGgUQoQIOccvdKBftC3UCx7BDDjfRqR
 Z7iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM7N6faHzsMAzxfzLR/8JTHcqtNP/xchbJwgWrsmWObzK6EgogPNeCrMFmd2h+0/MqzVe0kr2JmqAE@nongnu.org
X-Gm-Message-State: AOJu0Yy6RLI9akJerl6ZtvfqGPJQ9ecckw1ZD+ofnleVPYziIjJvh/48
 teb46sZrBeUWBUIFbELTcEjEf2eFM76/X8B0YvHRJvWp+Ens+vP6/7MsXUrFWVk=
X-Received: by 2002:a2e:8a9b:0:b0:2f7:6277:f2be with SMTP id
 38308e7fff4ca-2ff56689160mr8584901fa.22.1731603559797; 
 Thu, 14 Nov 2024 08:59:19 -0800 (PST)
Received: from fedora.. ([2a00:1370:8180:90b:6639:2dc0:6fb5:8401])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff59859fbesm2429411fa.75.2024.11.14.08.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 08:59:19 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 1/2] arm/ptw: factor out wxn logic to separate functions
Date: Thu, 14 Nov 2024 19:59:15 +0300
Message-ID: <20241114165915.6569-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241114165900.6399-1-paskripkin@gmail.com>
References: <20241114165900.6399-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=paskripkin@gmail.com; helo=mail-lj1-x22b.google.com
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
X-TUID: 5KTuyl2XD5ic

The next patch will add support for WXN for short descriptor format. To
prevent code duplication, wxn logic was factored out to separate
functions.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 target/arm/ptw.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9849949508..2a3933adec 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1130,6 +1130,26 @@ do_fault:
     return true;
 }
 
+static bool arm_has_wxn(CPUARMState *env)
+{
+    /* TODO have_wxn should be replaced with
+     *   ARM_FEATURE_V8 || (ARM_FEATURE_V7 && ARM_FEATURE_EL2)
+     * when ARM_FEATURE_EL2 starts getting set. For now we assume all LPAE
+     * compatible processors have EL2, which is required for [U]WXN.
+     */
+    return arm_feature(env, ARM_FEATURE_LPAE);
+}
+
+static bool arm_wxn_enabled(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return arm_has_wxn(env) && (regime_sctlr(env, mmu_idx) & SCTLR_WXN);
+}
+
+static bool arm_uwxn_enabled(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return arm_has_wxn(env) && (regime_sctlr(env, mmu_idx) & SCTLR_UWXN);
+}
+
 static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
                              uint32_t address, MMUAccessType access_type,
                              GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
@@ -1370,8 +1390,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
     int prot_rw, user_rw;
-    bool have_wxn;
-    int wxn = 0;
+    int wxn = arm_wxn_enabled(env, mmu_idx);
 
     assert(!regime_is_stage2(mmu_idx));
 
@@ -1432,18 +1451,6 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
             g_assert_not_reached();
         }
     }
-
-    /* TODO have_wxn should be replaced with
-     *   ARM_FEATURE_V8 || (ARM_FEATURE_V7 && ARM_FEATURE_EL2)
-     * when ARM_FEATURE_EL2 starts getting set. For now we assume all LPAE
-     * compatible processors have EL2, which is required for [U]WXN.
-     */
-    have_wxn = arm_feature(env, ARM_FEATURE_LPAE);
-
-    if (have_wxn) {
-        wxn = regime_sctlr(env, mmu_idx) & SCTLR_WXN;
-    }
-
     if (is_aa64) {
         if (regime_has_2_ranges(mmu_idx) && !is_user) {
             xn = pxn || (user_rw & PAGE_WRITE);
@@ -1455,10 +1462,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
             if (is_user) {
                 xn = xn || !(user_rw & PAGE_READ);
             } else {
-                int uwxn = 0;
-                if (have_wxn) {
-                    uwxn = regime_sctlr(env, mmu_idx) & SCTLR_UWXN;
-                }
+                int uwxn = arm_uwxn_enabled(env, mmu_idx);
+
                 xn = xn || !(prot_rw & PAGE_READ) || pxn ||
                      (uwxn && (user_rw & PAGE_WRITE));
             }
-- 
2.46.0

