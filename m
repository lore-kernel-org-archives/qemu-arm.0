Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1197204wrs;
        Wed, 28 Aug 2019 12:52:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxl2lCPd6b0vJ5A7S0YSovUm0Yx0ITXJzVbUI0dMRhS6zJeMqa+9J1rwKzlmJtJ0Zoy78fB
X-Received: by 2002:ac8:45ca:: with SMTP id e10mr6232332qto.15.1567021923763;
        Wed, 28 Aug 2019 12:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021923; cv=none;
        d=google.com; s=arc-20160816;
        b=GKFnmYfau+AInpNhy9e7xY3tyeZ4atIVbDOB9bXvwz7YWgM1xTnsTqvYkr+VfuSKB4
         //w+1ZWUOXKDdA/h18WFmSPScRnvY1bakPIx/nFuBzV2EAgNYKNb5YDcFAIA7QmA4LIf
         1hvW+z8Lw96V0DEa/gYX1TE6E7WCSPx281M1h8v6DOJtP7sgcWZ+OXBwUi0VegT7nfB9
         fjdsqslls/cNHJ9bjN37p4yitpLzDgAm6xo5GVIOoyEv93wNMnPl/GVM22L5IGIk5q86
         ix81JDB4jBjCsKRZcEbqAff5IBS/axvmfGZTYM+BhNdL4IuOpGzPwjueysKw62dhnmDG
         JB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=HN5caKoOORxiigixHNAW+6u13INbJ94cJ6ViPIOo+M0=;
        b=cdvFHl1sDM2vMOHEG9J/fhF+x2YvxoYRicJlWCslX5kYdJLkhoMv8bLC/K+baZMEHe
         9S7d4Kp0pWHte45YkRdJRI8GoCP81Za+iVMLncnYtG/kdorbpTenKdQdgHl1iQaS/xIm
         S1+s046FJQthP2e23m0xpBL5gfEa3NhrsK4MxTaduI9lzGrbmXoPvF47bIts2yT3/b3Q
         qCfpIysn1Ar2brgRsZ3MtfSPzQ8jiTuep6PUzgqfYkwhMWjAgL+F99ZA/lNUKt5WWoMc
         JfBWG1loTmZCCgTv4UuAebvxuM7C/328b2Xxf2FH1Avjp3oAxiIRdCw86ERed8gw5Xpx
         JDxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ueJY2T8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n193si233849qke.265.2019.08.28.12.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ueJY2T8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33z8-0007KH-V3
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gu-0003zh-Sy
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gs-0000jD-7k
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:19 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38383)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gq-0000hV-FK
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:18 -0400
Received: by mail-pl1-x641.google.com with SMTP id w11so400920plp.5
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HN5caKoOORxiigixHNAW+6u13INbJ94cJ6ViPIOo+M0=;
 b=ueJY2T8d/n0lymoCa2wSKjX+q7S6okwtey5AQiz8K8aKHYfFa7SYGJJMa0k64KrFfr
 rdIEygtubUsh7sdtrIPmyJrBSyh49urZ7g0WL39rbet6tQninGFvnsbhDrZRJeErmVKI
 yaVmDFD2zuMID2qrYM0a0CnWdG9RHO0ziPdkzhGItNSGX+0rKPSWFZUDkmPyW6qthDjo
 VBMbcLuQ48204BRESN39RS7uSXAY5QRttsTR5WIlEo7MY/OP/wdz7BVqu9zi0qGtYECV
 Jqk00zpvCrP1Lv9IhsboavwdHrea3M81tEt9kLHGKxtZJsNNgDxJnfXtx7K/Dxy1kLST
 xyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HN5caKoOORxiigixHNAW+6u13INbJ94cJ6ViPIOo+M0=;
 b=eRrvd9ttEezzf68lY+MXl6n7cEKWKV+uOkPDAsWlufm0UmCPjY/GZcTrj6bYC+tefx
 +Wz/SuoPQQCaO1v6UvvF1LgLVSxSgYOQ15gF4XRhOt0KFH8x7RmE+PAxV9vjuPtn0/ID
 /ATISiEGgqM6Dxxmes2yeSjKr51OF0ZQPG9nJC4VX2tF5PPtY7TbaJ6HZl2GdNoCRB26
 k22kYe/4NN61esiryN4lIG7kaikLSqQRvk7VxkhY/ZbVK1A6NWySHyEa2fbZzAYN65dh
 vYlGYHbUud0NGIyDQOtO3hi2AxKHf3q9Avfu7Wz5FQh7JwkIFGFWITOcIIx0ASVwXfxY
 INtA==
X-Gm-Message-State: APjAAAVRVCt9xltcoqDj63LISaOf0UxRlbqThIUlJUJUg1yW/eRrXDR9
 tJxxjFZDXbORBsSTGvXQ3wo1IA==
X-Received: by 2002:a17:902:b191:: with SMTP id
 s17mr5975793plr.121.1567019174831; 
 Wed, 28 Aug 2019 12:06:14 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:46 -0700
Message-Id: <20190828190456.30315-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v3 59/69] target/arm: Convert T16, nop hints
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4hDsqKwp4xn

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c |  3 +--
 target/arm/t16.decode  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ec5b095bd1..1bbfea8ea4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10868,8 +10868,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 
         case 15: /* IT, nop-hint.  */
             if ((insn & 0xf) == 0) {
-                gen_nop_hint(s, (insn >> 4) & 0xf);
-                break;
+                goto illegal_op; /* nop hint, in decodetree */
             }
             /*
              * IT (If-Then)
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 19a442b894..5829b9a58c 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -19,6 +19,7 @@
 # This file is processed by scripts/decodetree.py
 #
 
+&empty           !extern
 &s_rrr_shi       !extern s rd rn rm shim shty
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
@@ -204,3 +205,19 @@ SETEND          1011 0110 010 1 E:1 000         &setend
 REV             1011 1010 00 ... ...            @rdm
 REV16           1011 1010 01 ... ...            @rdm
 REVSH           1011 1010 11 ... ...            @rdm
+
+# Hints
+
+{
+  YIELD         1011 1111 0001 0000
+  WFE           1011 1111 0010 0000
+  WFI           1011 1111 0011 0000
+
+  # TODO: Implement SEV, SEVL; may help SMP performance.
+  # SEV         1011 1111 0100 0000
+  # SEVL        1011 1111 0101 0000
+
+  # The canonical nop has the second nibble as 0000, but the whole of the
+  # rest of the space is a reserved hint, behaves as nop.
+  NOP           1011 1111 ---- 0000
+}
-- 
2.17.1

