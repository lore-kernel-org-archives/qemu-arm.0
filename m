Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp599614ejx;
        Tue, 22 Aug 2023 02:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdMLgz62VG5K/4yXMrhtbSD/ak4N93uUX7PQEcR2UR5AzJCBs4OvPUZYNrj90yQ0ZamvnZ
X-Received: by 2002:a0c:ab51:0:b0:647:2e3f:d9d9 with SMTP id i17-20020a0cab51000000b006472e3fd9d9mr10567574qvb.36.1692697936036;
        Tue, 22 Aug 2023 02:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692697936; cv=none;
        d=google.com; s=arc-20160816;
        b=Kl0uCvBbWMoVBhdDJqbuKLfG/J0cqDt2zOsz9T96EFn9BGU7qFEVV0NwrJsh6LuV1+
         3Q71+5YOoBCeRW9OpUEIzEW7cO1BEx9hl1ckxwl1GeyNSX7g6cupuNngkW9nTVMzLP0c
         H/XBi4X5MptsIg6w29gJEqVmnHXxn6NjfvMui7mdWTDKFqK2UvvMnUiPAlxSQhcqqYS2
         DtYgSCVs1S0XIXjyUducR+hbr8Xz2w07HriyxG59W01cZEfbcuX9Oyjvp9tNq18I3FMq
         Exna/xgfuUe5DW+l5yzix+1QJSizPGVmE7Hr/gsPqBIhGXo8mffG70C+mKNlaSicbrf1
         oGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=10kcRy9z1cKJEzX7FuFBXFhfePOgoiTUdtJrOcIYFcs=;
        fh=2zmN866YCAaBnN18XCVMGaUzsHNTqEa8Yan9v5DedRY=;
        b=PnpLGjBp9PrxAq1MvW51UEX9FwnSReZV+G3aEg3BpNYx7kSS4LmpyFGE2kwQDk1/T/
         JWpGN3Kykp+W7s8m/j3AehNJePHuEMjg9B8YGaVDDs0u/MBngxY52FPFhrOqwSeQanrX
         Cd4yx4rvOw2KKu85Vx9A4L8eGPpWN/3NVwUzz16NTJJGyZ2iajKX7XLL5wt66HHHfSRw
         JZCA3ESIZjP8ef1r7dXd7z2Fn9ylFZjuX7DmRrowBVI3uNhxoVgszjVmm7n5z5yFab88
         MZdIe4yyi03Jvs+8OCsj2bg9cVvPFjFrd77kt7WFX82GE6afdWkyBE2/tKoSFbfmLTM2
         8mow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mn1QR9C3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a400400b007680f98a83fsi6031443qko.495.2023.08.22.02.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 02:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mn1QR9C3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYO3Q-0008Mg-96; Tue, 22 Aug 2023 05:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYO3P-0008MQ-7R
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 05:52:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYO3N-0004aS-1m
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 05:52:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe8242fc4dso42346035e9.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 02:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692697919; x=1693302719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=10kcRy9z1cKJEzX7FuFBXFhfePOgoiTUdtJrOcIYFcs=;
 b=mn1QR9C33jqIHvzU7XC3AO8rSywqi5U2/WCVD1YM4QcCopID1heZ4OhWFeC3crAIpQ
 L3vZAQ9e7wRzqtGNIH3M9C5EvT0vuhTNJkBR5T/afC3+M+/o+xLtigzyPsjRpIkmF2cV
 KPzPIvh5dtkZH7C4nwvwZ7bCXw3xPwuq/5gmkontOdd3fIGtMxur8rn16zKWLNrg266P
 GmKFBfWxpsmaOy3lLXkn+IfT/HeoWVj52gMS3e27WrYFb8+35z9Z/Cgrm5RY46CO54SB
 dXghuOSRFZocjmknuFDW4oPhOrDP9FBSKzZFBjxe+87SOA0wV0gL5IpOR5aaNPvSGxC1
 n8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692697919; x=1693302719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10kcRy9z1cKJEzX7FuFBXFhfePOgoiTUdtJrOcIYFcs=;
 b=hwdF1wVv84m/J+Ujja+gvYRq3nzw3PpO6yMBkiA3CXBKWF7ZnkpariDfjr1TRjbYUH
 qk8OYyd6lyp17rgVm+s4T270u1NrmMLiP3nc5JpmdVD+QkKyuq+Xy5N4N9t3fZk6V7ZX
 Ge1JCPMBXqNiZ587PCz57ooLCw5tJ4huNsOxxcfEEnwUTIbkvmK81hUNfnIlF2Mzr+2O
 QM2XgOVT+I9fUWzDZhszHl4EVVhC0+S8jnX9sGqSxnZqLfC6L1QX7Ldcwh+DJecZupfL
 irmr2DDmGoJm0U9upQwpozWRdaRQQQx5ZdABTsx0WEUXzWEC4zgtoY1rgJlpKrWtUz9t
 hsJw==
X-Gm-Message-State: AOJu0Yyth2mli+WVMI7WTSeByp6DZK6iT5T7mPShpaFj6zdkEdclDU15
 pgiUl3rXZkdnE8nH2SGc5nNjTg==
X-Received: by 2002:adf:e7cd:0:b0:30e:19a8:4b0a with SMTP id
 e13-20020adfe7cd000000b0030e19a84b0amr6646848wrn.2.1692697919378; 
 Tue, 22 Aug 2023 02:51:59 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a5d6304000000b0031431fb40fasm15315882wru.89.2023.08.22.02.51.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 02:51:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/arm: Use deposit_z() in BCF opcode
Date: Tue, 22 Aug 2023 11:51:56 +0200
Message-ID: <20230822095156.39868-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: AuqBhcpRDMsF

When clearing a bitfield we don't need to lead the
source register. Use deposit_z_i32() with the BFC
opcode to save a load_reg() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b71ac2d0d5..1a6938d1b3 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7255,7 +7255,7 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
 static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
 {
     int msb = a->msb, lsb = a->lsb;
-    TCGv_i32 t_in, t_rd;
+    TCGv_i32 t_rd;
     int width;
 
     if (!ENABLE_ARCH_6T2) {
@@ -7268,15 +7268,14 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
     }
 
     width = msb + 1 - lsb;
+    t_rd = load_reg(s, a->rd);
     if (a->rn == 15) {
         /* BFC */
-        t_in = tcg_constant_i32(0);
+        tcg_gen_deposit_z_i32(t_rd, t_rd, lsb, width);
     } else {
         /* BFI */
-        t_in = load_reg(s, a->rn);
+        tcg_gen_deposit_i32(t_rd, t_rd, load_reg(s, a->rn), lsb, width);
     }
-    t_rd = load_reg(s, a->rd);
-    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
     store_reg(s, a->rd, t_rd);
     return true;
 }
-- 
2.41.0

