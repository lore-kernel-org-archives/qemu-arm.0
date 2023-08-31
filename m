Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp246493ejc;
        Thu, 31 Aug 2023 15:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzQvf7ZWEv4ktTa5vUWhNw0a8rq902W7tYWY2F+mSCDYPOwDnfptfr/pbrHgf8QVLmIj/e
X-Received: by 2002:ac8:590c:0:b0:411:f5c0:5db with SMTP id 12-20020ac8590c000000b00411f5c005dbmr929912qty.26.1693522605364;
        Thu, 31 Aug 2023 15:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522605; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3PTTbDyxQ9GCpE89XjNCh4cBhP5wcftgjXFykdLJIpQGfekmncbxprLs0TaIfzFhY
         UGwQ75nxkrSyYou2KQ2uu+I3FdwzRXqj7zy1InvI05qv1HUEyPdgicDkap2PtUsKv6U3
         fZ0ryI54/Dfy3QMZpYpHhoqh6ioi1s27jLFexNRdmCnz27w1Z9wkVjCUm1W9ttcU0Ch3
         NO9HH/PEF7YN6yCapjCWq4OeCvVa+nvo7eg4V/oCUybHo0lALcTJ5yQ8oRIdqIlozDdo
         0vDEblMZxyBI+kazalv7Nwx+o4/oY4B5T8V8dzbQVA+oYvyo7nY+xm63ChpT23rCfBIA
         ngng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kEesyLIbjrA7oeyx/iNQirg7zO4jKel4RvIBPMrDvkc=;
        fh=CMH4F3RZ59Ef3SLg0ppc7vxpUPvCiZChm09KUhwMALI=;
        b=QM7YQDoSfDv73X6MLL6ZLDtGy4r1XDheWzwynWEFA2wFhOhaWYDArI9um2ZLZnSGyx
         Yp0HjOdwyOvrlnUwbD2d/RvPioZxALSUise04YnwMtvVU4Pd/J1h/oQO+sdYJyvQmpXh
         Z76KhzVEPVea4c40b2nYc5G2mouBofU4I0ytkqOcXz3T6fOXZk++C/3jeh1bpmDzZuUi
         3lIJ1Jdv1I52I4zGdTnJs+CM6+3lYhTLpBrtnlVUF/SWO04pR8DNSyGTCyA+ZghOQReK
         GUt+2jjgW6fl19ssnYZedR7xmoitFq7uFSRNEtgv+XIMfZ+424oaUNa2WPq0XiRgAf0z
         a7ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F4jVEE/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020ac85a95000000b0040fe2787c6dsi1416235qtc.542.2023.08.31.15.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:56:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F4jVEE/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbqaT-0003u5-V9; Thu, 31 Aug 2023 18:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqaR-0003t2-EX
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:56:27 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqaP-0002q7-4A
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:56:27 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso168505966b.2
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 15:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522584; x=1694127384; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kEesyLIbjrA7oeyx/iNQirg7zO4jKel4RvIBPMrDvkc=;
 b=F4jVEE/EC9e8pVSN7jp1DFlKqcEYCPgMMV8Kt3Y42JeEYljU7v5fkFy1wY1OVuYPUD
 YKLN4EOH6ZU4dwVr7wd7qY4HE2FkSJFDnQRx2+rmtiFxKlJME2wen2Y+TujK5dqgizcn
 5CwB/dN/lfSgqGIhhLtJurGa4CIwVf3p7tlH+XY1E10DxCl4P4k1yXTdYu2sPqDl4pQm
 o8lSsoy+wip0ruywOYrEpYLTJoAl2Ydi98FSsp3V9PrkQJtPGhmL2rcTd7nOGzbfVU81
 xt21lZT6yPV64kUaU9cRnvfDHz6rd5LoSDnoapxICq3wwXFDcWU0Nwx0X92Pg8yYZUDy
 /gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522584; x=1694127384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEesyLIbjrA7oeyx/iNQirg7zO4jKel4RvIBPMrDvkc=;
 b=WnAqS12Ny3Xhd2LmBhsNQqRiW+MksTSwQ8tj2hLG943ECPpJnZzm2JeDOmcX0tCUsX
 7DJifoBGwKEKqZmJnXLqGwoKA0DvUdHGLo/RSL879AvRIyYIPK2PHr2GM1d5DyEQExIb
 NWMD97XHH/sfpBvHbUIT5VVGeQPaqNcVIMMImJKWCU/pI/wGbd0GUn8uJOEvxj/Ogg2Z
 yXO3MxhKcrHQKyDOjLq/woi1ATLI/J1w4lkxAbXha1Ppv4S/ybenhfpgB9oN6hGSB5T7
 p3beSjGPlNbT09rvtYkFnwrQSuoKRc/9B/gEH06KfpZhXd0RRtDE10k4+7l7RKXVuBqy
 yo2Q==
X-Gm-Message-State: AOJu0Yzr83EPwThGhzn7Bfs87SGSuxDz3zXfoghEwyMlVd9Ep8zpVQ/Y
 Ar4KWgsG74ll37kdmG6iMwu7Fg==
X-Received: by 2002:a17:906:224b:b0:9a1:bee8:9252 with SMTP id
 11-20020a170906224b00b009a1bee89252mr542069ejr.29.1693522583206; 
 Thu, 31 Aug 2023 15:56:23 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 jw26-20020a17090776ba00b00982a92a849asm1252665ejc.91.2023.08.31.15.56.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:56:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 02/11] target/arm: Clean up local variable shadowing
Date: Fri,  1 Sep 2023 00:55:57 +0200
Message-ID: <20230831225607.30829-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org>
References: <20230831225607.30829-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j3aF83v7hFKS

Fix:

  target/arm/tcg/translate-m-nocp.c:509:18: error: declaration shadows a local variable [-Werror,-Wshadow]
        TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
                 ^
  target/arm/tcg/translate-m-nocp.c:433:14: note: previous declaration is here
    TCGv_i32 tmp;
             ^
  target/arm/tcg/mve_helper.c:2463:17: error: declaration shadows a local variable [-Werror,-Wshadow]
        int64_t extval = sextract64(src << shift, 0, 48);
                ^
  target/arm/tcg/mve_helper.c:2443:18: note: previous declaration is here
    int64_t val, extval;
                 ^
  target/arm/hvf/hvf.c:1936:13: error: declaration shadows a local variable [-Werror,-Wshadow]
        int ret = 0;
            ^
  target/arm/hvf/hvf.c:1807:9: note: previous declaration is here
    int ret;
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c              | 1 -
 target/arm/tcg/mve_helper.c       | 8 ++++----
 target/arm/tcg/translate-m-nocp.c | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 486f90be1d..20d534faef 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1933,7 +1933,6 @@ int hvf_vcpu_exec(CPUState *cpu)
         uint32_t rt = (syndrome >> 5) & 0x1f;
         uint32_t reg = syndrome & SYSREG_MASK;
         uint64_t val;
-        int ret = 0;
 
         if (isread) {
             ret = hvf_sysreg_read(cpu, reg, rt);
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 403b345ea3..32087b6f0a 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -924,8 +924,8 @@ DO_1OP_IMM(vorri, DO_ORRI)
         bool qc = false;                                                \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
             bool sat = false;                                           \
-            TYPE r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);          \
-            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+            TYPE r_ = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);         \
+            mergemask(&d[H##ESIZE(e)], r_, mask);                       \
             qc |= sat & mask & 1;                                       \
         }                                                               \
         if (qc) {                                                       \
@@ -2460,7 +2460,7 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
             return extval;
         }
     } else if (shift < 48) {
-        int64_t extval = sextract64(src << shift, 0, 48);
+        extval = sextract64(src << shift, 0, 48);
         if (!sat || src == (extval >> shift)) {
             return extval;
         }
@@ -2492,7 +2492,7 @@ static inline uint64_t do_uqrshl48_d(uint64_t src, int64_t shift,
             return extval;
         }
     } else if (shift < 48) {
-        uint64_t extval = extract64(src << shift, 0, 48);
+        extval = extract64(src << shift, 0, 48);
         if (!sat || src == (extval >> shift)) {
             return extval;
         }
diff --git a/target/arm/tcg/translate-m-nocp.c b/target/arm/tcg/translate-m-nocp.c
index 33f6478bb9..42308c4db5 100644
--- a/target/arm/tcg/translate-m-nocp.c
+++ b/target/arm/tcg/translate-m-nocp.c
@@ -506,7 +506,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
 
         gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
         /* fpInactive case: reads as FPDSCR_NS */
-        TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
         storefn(s, opaque, tmp, true);
         lab_end = gen_new_label();
         tcg_gen_br(lab_end);
-- 
2.41.0

