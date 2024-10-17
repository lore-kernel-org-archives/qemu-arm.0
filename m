Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp338290njb;
        Thu, 17 Oct 2024 10:24:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjwdYvAPm4kbCjzJEKhA4WNVvHnue/61HqNXVZDrwvN3nu6wMFlrlsKkBCS3A77uJqI2+nk/UgbONDIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFsH/UE4rlkdCf8WAmmfqwcwOpTVja9RF6hNCdoCAstKzDmCADqwEOKQu1GpTUHS77w+Gz0
X-Received: by 2002:a05:6102:ccf:b0:4a4:9363:b83c with SMTP id ada2fe7eead31-4a49363da99mr15821243137.23.1729185849242;
        Thu, 17 Oct 2024 10:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729185849; cv=none;
        d=google.com; s=arc-20240605;
        b=I7XAi1+K/N3bxRX+jnxhZH8tFDmWB6+VpFgPo7lmtjm0AK6ZxP1Qq9+FXo0wPw8HMs
         jRhC+JVGKOMp7IrZXlWJUdT4rbQIczVTylWWjkuALeLNNJspoYGurqmd9qi3kr5GfmCd
         TJXu2sdg6MuwFMjQX4V3DCb2P2T18m0A2Hu8cN+P3WxgtFTZLOdK7RoImnSZYMk7AVXn
         q/RFoyR6GKqcTCccFIea6GNUM5+mZawCnNsTrWvwRA8+0gCJIfVC2ims/ys5WQJsNOcm
         P4AX8+aIYVmhKPXnSED7x+73Pkv2ZA2VlqssluxTOQhV+BMuyk69UTWclzYgYW19p279
         Kjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qz3v+9Z2w3tFod8iKILXk4rM9BDOry0+5vRT/wn8qqI=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=LP0FwFFRzPGysSvl0p6F5Swo0fOsG6UyCkyxTl/EX1ZiZaxYzHihZMQKqBRj1/o5H9
         CTY4gnNDSI4d7BPU1DDc11FKdi6wcPF/xbp4BTxV1tI9O0BOXlCjhb4Be0yXt6YVBUBJ
         gyXo6vwjpd58hR3hDDFDSyrraa+FBukvxMbrWn5MTFz/4lhWBUg1hXL07odc/2V6NZXD
         m73FzGxurq2c5b2r+WFsC2jxrmKU/A6pLc8z3ncQdY+txM7CYpA4Gfl3azS1O3p9JoDZ
         G5WCrZ+SGQx7ULkgAXazQ8YL6QLojFYsQxLL09C01jiCjqUM2Kd6f8jI6dJ/MlHRWQIy
         jQaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dmqDajDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a5acc22b59si1926273137.328.2024.10.17.10.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 10:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dmqDajDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1UDr-0006oL-Gz; Thu, 17 Oct 2024 13:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1UDo-0006m8-Vn
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 13:23:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1UDn-00082x-4X
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 13:23:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4314c4cb752so12455975e9.2
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 10:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729185813; x=1729790613; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qz3v+9Z2w3tFod8iKILXk4rM9BDOry0+5vRT/wn8qqI=;
 b=dmqDajDiWalTlCq7vR61B+IWJ4d8qK2OnsVuZkShJp87s5K80P08zqBu0JpGKQa4eM
 AU4WC7MICiOmFhZrcbZ8o0F3l0iour2bH5/HcfYEAWI/36wQ6mwOJmf954CRvZnL1cXZ
 5dsdttFeMYdrFSNMRoFcZntoI3ApBPx7VUTO0423G8mvGkOY4cxEfWVC/lcaiA5TeCgd
 +zxy9OetU0dPGl7TREOkWEn9hT5P5hzVQLlboTrbbFC19O6GrxkcioVVfQA0BGgd0gs9
 IAfAg7aIUwzWBOoo4x4eAqgOTXB3N18jWVfVGPm582Dbq52dJcMRnZoELEC8oM/jK+nr
 biSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729185813; x=1729790613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qz3v+9Z2w3tFod8iKILXk4rM9BDOry0+5vRT/wn8qqI=;
 b=MagOSWGkl3Nu8m5gxWh++2cc3Wh/agjpeh4rTRyarSUMfOGFVT7fzrCMuh3NtbEdzk
 7ASovt4qpZw4DbkLtfxin9TUyLt5xfLWDYLkZnrC/kJYZOGvFbIdQJ1DecBNEMU3xavk
 CXCOlVYeuNqWVYaLzy2u9ckRtg/77Ew81/Y2boavUnzgGm384PWAmGONod1Bv1EkuyEb
 LJ090OXNtux372DxlZlrudtXgEHEJnpBWqnPzDMkXJ+YCFxP/+nqCZHQyRkT9l/waYHn
 9UD9HTmihiEBm7NDTvT5mmK3n20+zbfBRBef727yimTAv8rN8JQncIkDJX/sby535wG+
 qC6w==
X-Gm-Message-State: AOJu0YwbgehPsYP8UP3+368gXaXI9x671NQa++dekFghTQxmmKewuH0S
 UwbTq6T3ONMIHTMEiWu9mwSVLi0gXsCu4C83mf9cNhzol/B8pw7/rK4xom4XPCbNiur6AfWVqZ2
 o
X-Received: by 2002:a05:600c:1c2a:b0:431:53db:3d29 with SMTP id
 5b1f17b1804b1-43153db4041mr45641395e9.18.1729185813130; 
 Thu, 17 Oct 2024 10:23:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43160692d8esm1709895e9.13.2024.10.17.10.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 10:23:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Don't assert in regime_is_user() for E10 mmuidx
 values
Date: Thu, 17 Oct 2024 18:23:31 +0100
Message-Id: <20241017172331.822587-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: B8bYEMxFjxKR

In regime_is_user() we assert if we're passed an ARMMMUIdx_E10_*
mmuidx value. This used to make sense because we only used this
function in ptw.c and would never use it on this kind of stage 1+2
mmuidx, only for an individual stage 1 or stage 2 mmuidx.

However, when we implemented FEAT_E0PD we added a callsite in
aa64_va_parameters(), which means this can now be called for
stage 1+2 mmuidx values if the guest sets the TCG_ELX.{E0PD0,E0PD1}
bits to enable use of the feature. This will then result in
an assertion failure later, for instance on a TLBI operation:

#6  0x00007ffff6d0e70f in g_assertion_message_expr
    (domain=0x0, file=0x55555676eeba "../../target/arm/internals.h", line=978, func=0x555556771d48 <__func__.5> "regime_is_user", expr=<optimised out>)
    at ../../../glib/gtestutils.c:3279
#7  0x0000555555f286d2 in regime_is_user (env=0x555557f2fe00, mmu_idx=ARMMMUIdx_E10_0) at ../../target/arm/internals.h:978
#8  0x0000555555f3e31c in aa64_va_parameters (env=0x555557f2fe00, va=18446744073709551615, mmu_idx=ARMMMUIdx_E10_0, data=true, el1_is_aa32=false)
    at ../../target/arm/helper.c:12048
#9  0x0000555555f3163b in tlbi_aa64_get_range (env=0x555557f2fe00, mmuidx=ARMMMUIdx_E10_0, value=106721347371041) at ../../target/arm/helper.c:5214
#10 0x0000555555f317e8 in do_rvae_write (env=0x555557f2fe00, value=106721347371041, idxmap=21, synced=true) at ../../target/arm/helper.c:5260
#11 0x0000555555f31925 in tlbi_aa64_rvae1is_write (env=0x555557f2fe00, ri=0x555557fbeae0, value=106721347371041) at ../../target/arm/helper.c:5302
#12 0x0000555556036f8f in helper_set_cp_reg64 (env=0x555557f2fe00, rip=0x555557fbeae0, value=106721347371041) at ../../target/arm/tcg/op_helper.c:965

Since we do know whether these mmuidx values are for usermode
or not, we can easily make regime_is_user() handle them:
ARMMMUIdx_E10_0 is user, and the other two are not.

Cc: qemu-stable@nongnu.org
Fixes: e4c93e44ab103f ("target/arm: Implement FEAT_E0PD")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 299a96a81a7..fd8f7c82aa3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -963,6 +963,7 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
@@ -972,10 +973,6 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     default:
         return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
     }
 }
 
-- 
2.34.1

