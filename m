Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3311wrg;
        Thu, 13 Jun 2019 10:20:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQLxmHXaRlpa53biHDjuczIAqMcnMyxDmiyz+t6U+1TZNZ+1mhE3SPUoy22hPG4AcCeUUd
X-Received: by 2002:ab0:45e3:: with SMTP id u90mr6982805uau.126.1560446448226;
        Thu, 13 Jun 2019 10:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560446448; cv=none;
        d=google.com; s=arc-20160816;
        b=og6IKHTmtSntG78G3KNrNlUusZN+uBSm3Ii0UzRzJCO8MZxmYt6ZJs1AvI8KviTtLu
         L9D1qunUcfs/ZsBozikZwXcF2rbk8ntoH92L7BzLW1P2IsNBAJNHHPvI8zxJd6tc2PRU
         NNg6uG7nVlN+MzvOftDGSacuxaIYhv7r4LIKFcYvgZApMKNOjj/G32f5F7FhYhSkJQjh
         gLcacdoSK3YLbbJyQ5ckuLs1k8I3qdjBdegyaQ9ObNv4xBy8O6XYjahsXGlP5Z1E77jb
         Z0SbktU+DdSxiXE41ToSun5/8myORqO0ZP80hN6VKkEVitjiSnHnf2+2733mIgwJ6INF
         M3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=/Qc/nXAc+oP8/OzVscPUxXsnQcb6vVHyqhqGzT5AlQo=;
        b=A2ET5APimbd8C6Vm/qwpq2WGJu77VSR/IcuLQPOQvNa8dyABb6YR8C8DFU5t9cjp00
         h0bU3rwHKnYLdI8IKPkkwsVPGAoR1bAeaArySdCtG8MuawsDwQz897G5Kea+XrYrrn9B
         /EC2H4Ky6fyWb9BlA5jDF2EFSO4PJugV3w7gmQ+mUHiXPeOsLgBOhJcZ+xP5CIRlp2Or
         JCIzQfPnjNByACNvO5mpvrP+Pd0fNiDYuH1cXd5Qh628Iow0Jbf+ELIxPfHrXxzLquVX
         f2qqNeLBQNvn0uDdskyDDe0e79P503R2zjGAVcQOgkjac7Sz8Y6IxPZof+x+drp29p/3
         CuMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qewI2yiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si147451vsl.98.2019.06.13.10.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 10:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qewI2yiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbTP5-0007LK-CU
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 13:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlJ-00046V-GW
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlF-0003Kz-Sm
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:41 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlF-0002Eu-Ho
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:37 -0400
Received: by mail-wr1-x444.google.com with SMTP id c2so21501682wrm.8
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Qc/nXAc+oP8/OzVscPUxXsnQcb6vVHyqhqGzT5AlQo=;
 b=qewI2yiuf7OxI47ViAwCrSL6vlIUMlPRphHa+CD58aPei488RRc5XnoXgsvr5q2uMY
 nriXpz3ZEuc/W+P5R3mhNcJOzkTFnGRlCRHHGyvOrfg7EH5XCkdlByQyhR4O0iy2dO/I
 Q6TF1HFG3pmKl+/tv8EokOXWkofRuOWGqey6NueS5gRUZS4iKjPVisxoASmv84ux87zG
 5V1PqmXJ/nsrpcldoA8D31WtogZ5vAg3rnmLOZQ44vFDYHWei0y19qRJiL4gFo0f0uLr
 PdbRqERjnHlNHbO/5SN4q0DKfpntXlZtcBiAkqzIR6SNw9sloKpsWPwRJo5TBth7b8CI
 BoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Qc/nXAc+oP8/OzVscPUxXsnQcb6vVHyqhqGzT5AlQo=;
 b=Osgrc4n029LMD6Qc4GOpw+1cyA7e0JE7BbK+GgDaC8CQSb74cLJrUzbacAQP6evDYW
 tPUZXLBHYiVnakDv43foMHF5/kvTYM8pLCWv3ZOgAdgejap4SyHjJQuAcdTjVM4JmpvM
 1LvsC25WwXN0ePLd1Ejjc78/Tqv/iltHvF8K7biSnDJo0cEGYV6XtY2Y0rxOF7TTcM41
 R6yBEaNJuv0IV/BSq7+SAq0CLjGYYkxKCaoJGwIXLCnkKkTo3tjKpym5tL/el85il+vI
 evJVLeUGhZMACBQXwg8N4OltVA624LsiKtB0yzDAb6uQY5D5KR/NzEViivs1QX9CoCHG
 uQQA==
X-Gm-Message-State: APjAAAXBysJioPgYezGe2QkLyyxqD+2RvNDXerFE1wgfkVqUACQs0Y66
 /mw0ZmH5k5liQySnmu2CPVU2Psu4DVrvDg==
X-Received: by 2002:adf:e9cc:: with SMTP id l12mr13445032wrn.29.1560443964614; 
 Thu, 13 Jun 2019 09:39:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:10 +0100
Message-Id: <20190613163917.28589-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 05/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VRINT*
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
X-TUID: mco7KUpodehZ

Switch NEON_2RM_VRINT* away from using cpu_F0s.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a006ab498e7..243dbee8357 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4181,9 +4181,7 @@ static int neon_2rm_is_float_op(int op)
      * what we are asking here is "does the code for this case in
      * the Neon for-each-pass loop use cpu_F0s?".
      */
-    return ((op >= NEON_2RM_VRINTN && op <= NEON_2RM_VRINTZ) ||
-            op == NEON_2RM_VRINTM ||
-            (op >= NEON_2RM_VRINTP && op <= NEON_2RM_VCVTMS) ||
+    return ((op >= NEON_2RM_VCVTAU && op <= NEON_2RM_VCVTMS) ||
             op >= NEON_2RM_VRECPE_F);
 }
 
@@ -6786,7 +6784,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                             tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
                             gen_helper_set_neon_rmode(tcg_rmode, tcg_rmode,
                                                       cpu_env);
-                            gen_helper_rints(cpu_F0s, cpu_F0s, fpstatus);
+                            gen_helper_rints(tmp, tmp, fpstatus);
                             gen_helper_set_neon_rmode(tcg_rmode, tcg_rmode,
                                                       cpu_env);
                             tcg_temp_free_ptr(fpstatus);
@@ -6796,7 +6794,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         case NEON_2RM_VRINTX:
                         {
                             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-                            gen_helper_rints_exact(cpu_F0s, cpu_F0s, fpstatus);
+                            gen_helper_rints_exact(tmp, tmp, fpstatus);
                             tcg_temp_free_ptr(fpstatus);
                             break;
                         }
-- 
2.20.1

