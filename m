Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp150351ejj;
        Wed, 22 Nov 2023 20:45:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmtk1LGQam2MHJlvbANivGH5jHnmjFZ+Z7Wx2O/+g8Ta5PFhbhImSWHkHdzwRq/3d9YPfI
X-Received: by 2002:a05:622a:601f:b0:423:8b3d:dd27 with SMTP id he31-20020a05622a601f00b004238b3ddd27mr685339qtb.10.1700714723746;
        Wed, 22 Nov 2023 20:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714723; cv=none;
        d=google.com; s=arc-20160816;
        b=zo2RjQnCyBZGvxMaPCmsIF0XphGDVYh8wafWg/QaDoy0PXCFS6Eb0BRHMxfvZeHtir
         tXnB/+vYS2Mh0hETd3YCTR8VV2utT+i3lOnOfLYXCb2rV2Qp9lWSASK+sn9R5nCh1Asp
         jzDKSgyFXHmIuZpjrYSmdH6hseQXPCBp3U9jIYJSmHv3rrvjMra7CPuiIorzBWkmcCC9
         nnpC8nfPwLXdJecrT/d9xz1WOwmfKutYsRLCqXcJBW5UlPwv71QmS4buqZgn6yEEMnRt
         Dl6j5RC6uxEeVTuZsbnu+f6jhBqfWD8hYSP140DWrw7tL/Xgs4rkrwrfFF6thkBpb8eO
         SYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XoNhjamHa23uC1hFwLD47ZBDARlMJkpmLpzYJFJqrbI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=R3hTAuO0BWFUU7hk+Q9LU6G+dJf/+GidoMqiNppTqS5BbL6jeHQF0vFjsfxeNwN3Yh
         xz77idM5ydEhrKda/nNdlX/04+GYwQ4jachp7f7clxltsmjsSddxs8rYPzCNJcP+WL0F
         9D5aIL1J24314tBVqD7mpScEQFUWWjGa6F3IUqbeamQ1aU9Jg2GOLard64PQYORCSvL9
         pPQT0ykUKbz/bMjyP1w2Q+Fc7Dye/Vin6UhlcZNn40zozyXzDGBzHBK7eMm5Hc+dHERy
         0Mdsp9SYqWp7io+8XJ+NJnu6TE1eqWWD3gLbWwVMj7woaIrcB2L+/t3ALinBkL/RDry9
         Drfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ei+ILln1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020ac85ccb000000b0042370d95b5dsi449482qta.405.2023.11.22.20.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ei+ILln1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61YK-0006bn-GF; Wed, 22 Nov 2023 23:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y4-0006OV-9c
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:44 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y0-0006Ep-LF
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:43 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1ef9f1640a5so347062fac.3
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714558; x=1701319358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XoNhjamHa23uC1hFwLD47ZBDARlMJkpmLpzYJFJqrbI=;
 b=ei+ILln1SJpymayDqmD50fVEU7Yxr+21oTx6JFJB3DWSnHd09em8ejKrpzuuC7brX3
 dIrRrENXCshKDeGx+W6V8z+Owf44aiKGj70ip/XZH43COduCV/J41T5L1lh0k76bLSIL
 b3qoJ9CehkOJFJoPHoIo+AqtNuW+M0xfP0PiiCmZQXi7Tbfo+LI/KFb4jJnYe5qt+vNo
 3HZLh45WKFQWykKkl8aRGzDbjkvKMl3/OTgZzLZSos+4nzzgS8unZ2085b6fxSLBOt8i
 p1hJzu/8ApWxkmyUwYofoerp+sRvFf5hOyEojDFv4cyrW4I9DDT/xvqElxs15wAigRal
 aOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714558; x=1701319358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XoNhjamHa23uC1hFwLD47ZBDARlMJkpmLpzYJFJqrbI=;
 b=RhrVkw0xmOYPhXXXY8bbwXJqJedogEgsiMJHBAv4gWSYQG1CmJB3DVRywVJ0cfkavw
 pZW1K3SZPYGy1kJGBzNz/kfjLJKt4h31tSL9eeJQrSS7aTNArIEZJMs0z3cPDzOx/AFg
 ohyivNtU5yT8iFRbvDrhUBGVolYusNSOOyrDDK29JmToGnPdun9AP8yT5Ms7lIqIL8uy
 1CnfrVcp4DB7Dnd8rTDNsJBqX8S8+iX6/s5hmu2NfBn9fYZoQnO0s0VGBMeB1cLSvPsL
 8LTEoOFHjtoSSMfoBmOY8rpChgwd637RITK5ahh0SkFMGlLRto+QtqqYq4oYAd8LKtM+
 KAPA==
X-Gm-Message-State: AOJu0YxXfFe/58ExicigB6HsOIWPVtgyTWmdThkwdls8aIzmQx0VtNZ4
 dWXdcdHspVzE+XmcO/nO43k8sQ==
X-Received: by 2002:a05:6870:1f1a:b0:1f9:52e2:a8d7 with SMTP id
 pd26-20020a0568701f1a00b001f952e2a8d7mr4751694oab.43.1700714557955; 
 Wed, 22 Nov 2023 20:42:37 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/21] target/arm/kvm: Unexport kvm_arm_vcpu_finalize
Date: Wed, 22 Nov 2023 22:42:14 -0600
Message-Id: <20231123044219.896776-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: eu/Sy5hRakS3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 14 --------------
 target/arm/kvm.c     | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b96ff35e34..9b630a1631 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -18,20 +18,6 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
-/**
- * kvm_arm_vcpu_finalize:
- * @cs: CPUState
- * @feature: feature to finalize
- *
- * Finalizes the configuration of the specified VCPU feature by
- * invoking the KVM_ARM_VCPU_FINALIZE ioctl. Features requiring
- * this are documented in the "KVM_ARM_VCPU_FINALIZE" section of
- * KVM's API documentation.
- *
- * Returns: 0 if success else < 0 error code
- */
-int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
-
 /**
  * kvm_arm_register_device:
  * @mr: memory region for this device
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a864d0852f..20d8c81667 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -79,7 +79,19 @@ static int kvm_arm_vcpu_init(CPUState *cs)
     return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
 }
 
-int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
+/**
+ * kvm_arm_vcpu_finalize:
+ * @cs: CPUState
+ * @feature: feature to finalize
+ *
+ * Finalizes the configuration of the specified VCPU feature by
+ * invoking the KVM_ARM_VCPU_FINALIZE ioctl. Features requiring
+ * this are documented in the "KVM_ARM_VCPU_FINALIZE" section of
+ * KVM's API documentation.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+static int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
 {
     return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
 }
-- 
2.34.1

