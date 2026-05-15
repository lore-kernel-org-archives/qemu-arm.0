Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDD2CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:28:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUA-0005mZ-Og; Fri, 15 May 2026 10:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU3-0005e0-Fv
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU1-0000uF-Px
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso5105774f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855144; x=1779459944; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Yf8wcNB7EGw9UdeWFsayhgKXIy2x+KdJELXRYJSdqk0=;
 b=wbJCCcQy/nyPQD9steLrXg1kYhmWpCQA+B1QnAGGjYAAMwHIhnVC0pP1qAIE8am8XC
 rb+ZpHXf6MF6F+i230I2q3hiTrnpd8iIlTpABjRTjGjUN9TIskNcWyUjYBnbE9PVgbnf
 4L6HwbbxtHgFdwI+uQ8ZiHTz1hDD1DxbErXQOrVrXevWJPZRP1NYm0+2gxJVLXj/Ambx
 u8s4UgxLzczDAQCMo14Omm88EGh65aY7LXg8S/zZlf/6fSBNA7nSBbLNvrABzU8fD4Id
 e4lchvIsB81ViTMXZfHQ0L7XL2PUOcGSYH/c+PwaXms0PQWM+wlLGHz/lMXki8ZtXUiY
 gFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855144; x=1779459944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Yf8wcNB7EGw9UdeWFsayhgKXIy2x+KdJELXRYJSdqk0=;
 b=SHRd3N48bTfXi0fxaipJ1ctHWemDRgxmvsR1uOEEeXTFwd5LC805ach4xBOiCrTODk
 0GXVBvgb292tDW6F2wUp1McoZx+J//buafw+mfOcv9xykUG0T5BlLIk8+TyEwPpXn3bm
 HDOHlhflSBIaZ4vzbukmbMYEQITSrqjxb9+kqz58GHaPBDrh6DuAOl1fXWcZIJkQqINc
 +MZm51FvdcldfREYbctMre/7olpvhsv2SIzUDhqt62Emop6PxyI1DTUNXkzUkL3yiFVQ
 utPCuafjCi20EpXYXmknJTwk71/FGS+slImA2n1dzNsiBZBWF+DztiYUcR8DruzNmP6C
 NJCA==
X-Gm-Message-State: AOJu0Yzka4F6BaJz6btq3DRfociTTF259OJh2QLfvmZBtSNzS42a09l4
 s/fKuuUHQI5R6KVpMvcICCEZ8Emgw/mwxqzrU8OBC/QMC6riu+EsG01HcZu4hc6WEiEpBQ7VHwm
 Dt1BP
X-Gm-Gg: Acq92OGsIxWchsN5TEhxMb5KDI2pN2p7ts/AEPH1VHaMrUy1WxEeqVa2UoTblwTeSEF
 dwXl+tcsF3dlcV5lFTRwWbH7ba8KmckudGgaEnOa+X7XQR9Hno+noEOTTBLSfCARxofo8dl4no6
 Gewbqo3yg+saYanGuce2qPHUeOJ8yRDTkOSoajii2wQRKg287Rra6r9s4bLRJ6qyLmnhGGEhTmp
 lJWQcAC7kTskuixRTVQKe9QQs9izGcst+vYaU3mMc4f8lBgHFnLabNL65FqNsGUDeQhD0ua1y0M
 q3CoLtEVfdDBz8ubJ7qrn9QNRUYICDWqV4g5CmB4zD/oIidFw2vCvU1I4jvzkjEstgh60ZI6SCc
 Wmh4GeIMznrjVgCsb5PE5kS0n57v8s0Zu7A5CQJqX0x47EM5P8BsXrKvwDjTcP0vbzlK7jDQEDF
 ITM12FBXoWvrL2ptM3gI/OGDN8fSL5+ZNaeb4OvzynUq1tQDLBknIAjW/ktmWcW+M0erMn1O+z8
 XPHq5Pe7mKq8V8yb0Y+UVA0dGSIj8s=
X-Received: by 2002:a05:6000:1844:b0:43f:ea91:63ff with SMTP id
 ffacd0b85a97d-45e5c3673a5mr5736112f8f.10.1778855144101; 
 Fri, 15 May 2026 07:25:44 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 01/14] target/arm/ptw: Flip sense of
 get_phys_addr_disabled return value
Date: Fri, 15 May 2026 15:25:28 +0100
Message-ID: <20260515142541.571911-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We want to bring all the get_phys_addr* functions in ptw.c into line
with the sense that translate_for_debug() has and which seems more
logical: true on success, and false on failure.

Start with get_phys_addr_disabled().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8706dd59dd..8a412f463a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3506,7 +3506,7 @@ static bool get_phys_addr_disabled(CPUARMState *env,
                 fi->type = ARMFault_AddressSize;
                 fi->level = 0;
                 fi->stage2 = false;
-                return 1;
+                return false;
             }
 
             /*
@@ -3548,7 +3548,7 @@ static bool get_phys_addr_disabled(CPUARMState *env,
     result->f.lg_page_size = TARGET_PAGE_BITS;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
-    return false;
+    return true;
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
@@ -3682,7 +3682,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     case ARMMMUIdx_Phys_Root:
     case ARMMMUIdx_Phys_Realm:
         /* Checking Phys early avoids special casing later vs regime_el. */
-        return get_phys_addr_disabled(env, ptw, address, access_type,
+        return !get_phys_addr_disabled(env, ptw, address, access_type,
                                       result, fi);
 
     case ARMMMUIdx_Stage1_E0:
@@ -3782,7 +3782,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx, ptw->in_space)) {
-        return get_phys_addr_disabled(env, ptw, address, access_type,
+        return !get_phys_addr_disabled(env, ptw, address, access_type,
                                       result, fi);
     }
 
-- 
2.43.0


