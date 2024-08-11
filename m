Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp498169njh;
        Sun, 11 Aug 2024 07:13:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1/IjWvtZzf+h5Dj1HyM3SZXbKbYwAsqsL7sSIRdbREz+BskZxmPTOYsepFV9xKksDgmv0dPbNnRRNfw==@linaro.org
X-Google-Smtp-Source: AGHT+IH5p0MMpcnDUER9wDJE+1c3v68QyC8ELoF0RhdaaTES6e74CHhbHnqT4y1Gi+iVDj7TTz/W
X-Received: by 2002:a05:6808:2228:b0:3d9:3f51:f351 with SMTP id 5614622812f47-3dc4167b9d8mr9766604b6e.11.1723385635137;
        Sun, 11 Aug 2024 07:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723385635; cv=none;
        d=google.com; s=arc-20160816;
        b=gmaXmC0gPtpX8tcgLhEQs7GC8umj3VmpD0YwZKEEErw4wPFo/g3sPpdEKdJHLf7uEZ
         tTSXlbleHUbmbZu8geTSSUfV9y1xWqrkeMspVRT7CM6wzKLkh8t0LGoz1TTPdccZ91nu
         seRCk3ghooKxWN50c/JKPNlzg216PD01cKI2nIn7+1/IIZcMMG091OT9rzD3IYz1oEBl
         lGlCyHSBp9Frj8zMOTc4foGOybuCCymTClBQd5snbowubGQY16i5JGIVnaO/cfLSPAe7
         EKnY+PzsAjWHpkeu47YB1Qy2VRzD0D9OtuTE/b1NXqcDZFs/2Uq6kn2cOFQQ6EVDi15G
         74yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=b3ni80TmcfFPDDy+2o1RhH8opiDXCpzTFuSue7Ko/ys=;
        fh=0ffFkGPj2+PriXw1Nhod/6X1pKVWl446VZRpuZNu8mk=;
        b=i/6cBVuJDZ6MPD1QCq1H8s1NW1BJ5Pbc54mMUeFhUHdy11gAtV4Q+AqB41NLS4rU03
         fqQXkexsiiOkK+40HxNoHJyB0DV7QEwT3HdBXp/stR1KIZ8aJY5ud7MOcMBm4Jlkav8o
         wqVEzxGa5TL6lwzklwGLHjGDfgqcf1AVXIIrG5hCo3GW3QLaF914UeEyDxdfdqa7ZFNs
         9E1CQYZu3Yy12mG6tNN/hv28rKoc/G6OJUGk2civvtqNASzowqpmZ7/1Ili3VUi5WuM4
         JO0IT7gNGPLr4c5SOyDZCV/WYfzEoUpa4cel2bLSR9BpMlEV7jN2bSa35iF14wG6PWaN
         Lj8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.s=20230601 header.b=tdHeBWHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c2a980asi39225071cf.571.2024.08.11.07.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Aug 2024 07:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.s=20230601 header.b=tdHeBWHM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sd9KH-0005Tx-5G; Sun, 11 Aug 2024 10:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joe@pf.is.s.u-tokyo.ac.jp>)
 id 1sd1N9-0007SY-E4
 for qemu-arm@nongnu.org; Sun, 11 Aug 2024 01:44:07 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joe@pf.is.s.u-tokyo.ac.jp>)
 id 1sd1N7-0000k6-3T
 for qemu-arm@nongnu.org; Sun, 11 Aug 2024 01:44:07 -0400
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-39834949e42so12727895ab.1
 for <qemu-arm@nongnu.org>; Sat, 10 Aug 2024 22:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1723355042;
 x=1723959842; darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b3ni80TmcfFPDDy+2o1RhH8opiDXCpzTFuSue7Ko/ys=;
 b=tdHeBWHMzYvEtvyKOeUx17tgUZSXCyxX2rvFPlxBJMMzo1R5wIXhaHsaNp1h5RLEf6
 /Mupu42WSgcssgo5YAaIStFDTHityNfGj7r5rKSFZYv/AtiV6zZUCnHxtUFRgJUzDvI2
 LDFfnH9BN+g2+sRbnjKP9pmDxgTlSlRPG27NqzWPMCX9c1N4bmeooVA9C3qiccZWJc4m
 OdmveWWEwe8gkOJ21g7R22rEle3+0U85e1g+K/J1cwgG1ENPdHNkuxkFHR9ZpSLfutNI
 OhCvTQP6r2IJS+DY5VUJ7qleW6LHw/6+gMaTsCv1NfUKORlOakPSgrf1f5w6cvI/qQCo
 lSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723355042; x=1723959842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b3ni80TmcfFPDDy+2o1RhH8opiDXCpzTFuSue7Ko/ys=;
 b=AO3BlSmAw3rsQ/Io4Joe7LvYW4J0D+MMBJeU0LKRraTiThsC90/34cAAQ+dZ5apD49
 quJG7HaaP7JBOSDMACAMd5CxGfsp+3D5N4g1bKTHmLjM6cj91yesQIzH9Z/OyySK/9c3
 n24p3p7Pu10AGbyl6055e2IQEVIHf0knfoNxCNyF0kZIW/YfJ8rcupZ92bcS+pzJ/FZ0
 Exg/aQpmG220zfmEnnGf3SArlTdia0H4hvGpF6pOI0PqYkZEZY4rOss63a9ahj2z/+ui
 l1nnLeaslIWR2DzQD2wsWE5Y84YxaPEGA0L/cvTYZMaYpDfqj3Nw8FpSHbI0smkiDWpF
 jMtA==
X-Gm-Message-State: AOJu0YyuSwTau4KaP2e6agPJWWdsWXFC5iZDWhQHBleii0VDGV8UB2Za
 xvQCPaqELfFuyU6o3Wgltlnsb2BUsmZ8/5TIfSVfv2mdepWqf6UTXZ1nTCccHWI=
X-Received: by 2002:a92:ca4e:0:b0:39b:324a:d381 with SMTP id
 e9e14a558f8ab-39b748538fdmr87605725ab.2.1723355041948; 
 Sat, 10 Aug 2024 22:44:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:f70:2520:9500:9236:bb5d:265b:266a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9b210asm18385035ad.134.2024.08.10.22.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Aug 2024 22:44:01 -0700 (PDT)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] target/arm/tcg: Fix overflow in matrix-multiply accumulate
Date: Sun, 11 Aug 2024 14:43:41 +0900
Message-Id: <20240811054341.745674-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=joe@pf.is.s.u-tokyo.ac.jp; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Aug 2024 10:13:39 -0400
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
X-TUID: cSozNTx6cMmT

Arm's intrinsic matrix multiply accumulate instructions take two 8-bit
vector and add up a 32-bit vector. Current emulation causes overflow
when large 8-bit integers are used. This commit fixes the issue by
casting the 8-bit integers to 32-bit integers before multiplication.

Fixes: 2323c5ffd4b5 ("target/arm: Implement integer matrix multiply accumulate")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 target/arm/tcg/vec_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 98604d170fd3..e9c33520232a 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2718,7 +2718,7 @@ static uint32_t do_smmla_b(uint32_t sum, void *vn, void *vm)
     int8_t *n = vn, *m = vm;
 
     for (intptr_t k = 0; k < 8; ++k) {
-        sum += n[H1(k)] * m[H1(k)];
+        sum += (uint32_t)n[H1(k)] * (uint32_t)m[H1(k)];
     }
     return sum;
 }
@@ -2728,7 +2728,7 @@ static uint32_t do_ummla_b(uint32_t sum, void *vn, void *vm)
     uint8_t *n = vn, *m = vm;
 
     for (intptr_t k = 0; k < 8; ++k) {
-        sum += n[H1(k)] * m[H1(k)];
+        sum += (uint32_t)n[H1(k)] * (uint32_t)m[H1(k)];
     }
     return sum;
 }
@@ -2739,7 +2739,7 @@ static uint32_t do_usmmla_b(uint32_t sum, void *vn, void *vm)
     int8_t *m = vm;
 
     for (intptr_t k = 0; k < 8; ++k) {
-        sum += n[H1(k)] * m[H1(k)];
+        sum += (uint32_t)n[H1(k)] * (uint32_t)m[H1(k)];
     }
     return sum;
 }
-- 
2.34.1

