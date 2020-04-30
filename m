Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2193664lfm;
        Thu, 30 Apr 2020 11:11:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJIiR9ZpKfnuzpFQu09ot8n6bZqfBX0BG68+bLfBLhjw/R9JOoMsq1mrpyOcbabdNI7DJtA
X-Received: by 2002:aed:31c7:: with SMTP id 65mr5242975qth.150.1588270278108;
        Thu, 30 Apr 2020 11:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270278; cv=none;
        d=google.com; s=arc-20160816;
        b=h+YtNEH7BIa66xq60+lxGWQEh34ol7ZEV8qYrJz9vzDVZZ3CpOwMs4LFATJKoNr3Y/
         Tk+GPAPpQkuQ9dfmrVnLDJP7o/+4HHLjLeMEXpnAzvGuUeP1JVyxVgOpNOhk3VIUD5mo
         fzN+MZoFNXxVZqz2L4LAUi09TLtghYJcy4W8+EwSfZVf4zrAhA4jnIUcJLEBIScn6blQ
         GxOfTxPf9WdphJiPCAsPhoAcYlvsMem2x4+3wGHsKnWbNDl51REFnQKWW4Gs89huRZ0p
         E3mLPWK5oUc3ccQMiDhwPPo8/IvtlFmDQm1jxJPBmPp4aFi89EMFJFIP0oLrY3/vCRf5
         +KWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Dm8eT7i1ZIH8eOPph0oKfFrt8J+uhOMpHYDcUQLS3eU=;
        b=1D9ed2iYVRLM8gEzlchWxN4TFQakrSf5Wpx5LTe0uvAS7mgY1ZkRxZ3vqTo/mXzgKp
         zzjgl2Aej0hhMZtID0cbHxqOO7oTnQqcLPpqnC8P0d71l6GebWtTAi33jDGShuPFysiL
         Ier0JgXLBI4dyuGBov9vH4z04Zm1sDNMi/298b2nxa2G+gu1KAnwm1a1PWeekHpBiaLT
         YivDpVD0taPkvIgo1fiSw5EigQMKIBmY0TGvlf9knf38XVS1xOuy+5oU8LIFSNcZEx2B
         mOPBlHuDamXDPVNxrnXLHcUwVMyDjhEIiuLpnftH8DG0XObAXo/4UnD/KS51GKTj6yT3
         HCxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLKhqxp3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id u16si277408qvm.9.2020.04.30.11.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLKhqxp3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDeX-00021g-Bd
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdq-0001Nm-8z
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdX-0000Ui-CR
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:34 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdW-0000EX-92
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:14 -0400
Received: by mail-wm1-x343.google.com with SMTP id g12so3071164wmh.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dm8eT7i1ZIH8eOPph0oKfFrt8J+uhOMpHYDcUQLS3eU=;
 b=jLKhqxp3K+yE1TmGDjvpITvWaQDy3WYx6DPrtvIcAvMS2GxR9OhZKRtadRBk7yq6oV
 8B8c1Cn5XJ1yHMHR5QhLc6nl+PJY9gzu0PPqx5dhczifT9kaJzwPxqPGqyb7jt84mJ3g
 dF5oGesY//ZKyqXcgBuA7MDZSA8NDWkWMKYKNxrQFeAfD1IaJHTS5KbVzYnOOa9NwC6q
 5JLSvLYRh9UrN4eDQKIFGyshjOc6nkOQjWqvkiLv04JOfQsoGe6S2bHX1uoa9l4sBUxt
 sEhhLaRl8mFTKQhFZummvd86px9CPgpoEjwl/GdIYAec6qkXT/I7ekVJh/MEhN8vtMN5
 Wk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dm8eT7i1ZIH8eOPph0oKfFrt8J+uhOMpHYDcUQLS3eU=;
 b=dDIGMJoptHmYslA460T+B9nH1zW3rbc6Sb/XgvhNooxpjAtEHZtsRqPSzOF+VetkPB
 EUI4GRpiJc9e5GZ+6X1U2c5Lu5tAAPuvSLyT3xZDpHlYwuXFoHXggQylIcBMvibBKJpM
 axGgJY0RZ6mq/XLO83lqBtwTGQd91G0653q1FPhCsnMLw55/mSF03fLJnDprnQefYWIX
 3J9HsTOswlqyQbx3ALTnkt3tsEc1qSipQZOc6PvDu6gH7IwN3IZSUVh6Han+w+u8vImX
 c57MF+06pJmxKHrxVGV2P9Ww11AT08CP8beQotpTezGPbMOyZXWolCf0SAqEhIZgO51l
 reKg==
X-Gm-Message-State: AGi0PuYmS+iNEjsSDMHg0alouxdzDX1WOZveSt9UO7va+is+An8WCp6L
 IuhfG3eL3ubJpO3H2m/triIvc98vDnoA/A==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr4183993wmi.72.1588270209043; 
 Thu, 30 Apr 2020 11:10:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/36] target/arm: Don't allow Thumb Neon insns without
 FEATURE_NEON
Date: Thu, 30 Apr 2020 19:09:29 +0100
Message-Id: <20200430181003.21682-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::343
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
X-TUID: v+NDywOSWdYS

We were accidentally permitting decode of Thumb Neon insns even if
the CPU didn't have the FEATURE_NEON bit set, because the feature
check was being done before the call to disas_neon_data_insn() and
disas_neon_ls_insn() in the Arm decoder but was omitted from the
Thumb decoder.  Push the feature bit check down into the called
functions so it is done for both Arm and Thumb encodings.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d4ad2028f12..ab5324a5aaa 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3258,6 +3258,10 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
     TCGv_i32 tmp2;
     TCGv_i64 tmp64;
 
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return 1;
+    }
+
     /* FIXME: this access check should not take precedence over UNDEF
      * for invalid encodings; we will generate incorrect syndrome information
      * for attempts to execute invalid vfp/neon encodings with FP disabled.
@@ -5002,6 +5006,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     TCGv_ptr ptr1, ptr2, ptr3;
     TCGv_i64 tmp64;
 
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return 1;
+    }
+
     /* FIXME: this access check should not take precedence over UNDEF
      * for invalid encodings; we will generate incorrect syndrome information
      * for attempts to execute invalid vfp/neon encodings with FP disabled.
@@ -10948,10 +10956,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
 
         if (((insn >> 25) & 7) == 1) {
             /* NEON Data processing.  */
-            if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
-                goto illegal_op;
-            }
-
             if (disas_neon_data_insn(s, insn)) {
                 goto illegal_op;
             }
@@ -10959,10 +10963,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         }
         if ((insn & 0x0f100000) == 0x04000000) {
             /* NEON load/store.  */
-            if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
-                goto illegal_op;
-            }
-
             if (disas_neon_ls_insn(s, insn)) {
                 goto illegal_op;
             }
-- 
2.20.1

