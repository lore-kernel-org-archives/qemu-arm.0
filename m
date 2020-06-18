Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1266464lfm;
        Wed, 17 Jun 2020 21:39:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztSJY21ZOt3u70IHVOcBLreC5yKO1QDZVXDKEjGEellAdtJavFFgurEbCeMPqkfLxBqMDg
X-Received: by 2002:a25:b909:: with SMTP id x9mr3595635ybj.163.1592455162120;
        Wed, 17 Jun 2020 21:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455162; cv=none;
        d=google.com; s=arc-20160816;
        b=LNbO8/Sq3x/Iv0H0jpeU+B/PI5GKcMqvUd6dDPbsFxSn7FMXK401qJMETOi9cyNXec
         q7FbWE9PFWtyhKujQ7APz653iwUmoB/JpnzAQA2QjBPjAYcFx78c153or4i2SUMleDXr
         WzB2Yta2GGn7372/R7Py/XdWCbjUwseltlmWn0sB9R+D6VHcZWNmpw3U/bOCMXv/3qkU
         VzYBMT4fwcjAOnzZt6Yn6h7cs48xGAubJU6y/Iur/QEZOuKYOu20ylcWQIRPoIp1g63J
         OrAxdzeQbq2RzN7FV7mQM8GDm/+gFqXAJIRTXPWJ2/qorFJyM4eo9FMeagmICDjikFk4
         BuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/0zBkQsg9Sj/Ez3d1lzv6H6xUILyk6EquirlDeFiwsY=;
        b=RAVXVMjhS/FmWUfjIhRTMrKNHiA3HFQgKbX3tCHorN0k1wxwjz6Jd9FTCMe7vDqL2x
         Nc+EhnIC7gKnI41VcK9z8D0PUGDiFQSl1DLRsP2bILtu/wI7b7dXBM2DMqJ295z5AdNF
         GCam/c8HNUxsvQSItaWh1NKufHEhqNzpJ4+ATXGVfBtS+TJitPS8kHmT++uksmOY7t81
         oXzJQ6ubwcYeW2Ta+GeAIAj2162XkgllMVULeDmLWFY4HJKo83Ul/4hLghkVCanZJgUY
         S4CoGqHFY6hXku+XxB5rPC3GyTZtd7OloVna3gw0egsACjaLTZiPvTuvPPqj/9ixYKcf
         iSXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=slI3oD4w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e187si1632733ybf.249.2020.06.17.21.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=slI3oD4w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmKf-0008S4-Fg
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9O-0003G9-5k
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:27:42 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9K-0002Sy-GI
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:27:41 -0400
Received: by mail-pg1-x543.google.com with SMTP id l24so2338429pgb.5
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/0zBkQsg9Sj/Ez3d1lzv6H6xUILyk6EquirlDeFiwsY=;
 b=slI3oD4w0S+8kCZAsm2TMfFhAsUMFVLyx8dr4drrhKyFdC3cpH8vtPX9UbRfLmMr+W
 z1YB74B6bzqzkAXXe3r1ei/kv5zQ3G0gkVxox/InmT7UC6b6Pa3TJlTBINru78eVKlBa
 cNgcb4Wys4iAl99LsKQaSTPdTj6rtLSgVFEnSUciK96rpC59OLVv5r7IhvaPGxtE938Q
 3DlKCXHQYYS6jxAhQtcgXVdQSdRYIg85/5LncQv/Mk2H5L7m5o8wzTaPJ6DcnSEyvcJr
 lMO6TiX8VbJspA15OsrfyztMZSE58g+MqTAvWpSANLDlr0FBeOvC2U6E2pNO+fxqJTmN
 SmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/0zBkQsg9Sj/Ez3d1lzv6H6xUILyk6EquirlDeFiwsY=;
 b=Z8bSMZOfJbmnPNq1cHMhCV56U0pIhSfDAezsuf11iKfGx6Ygzlm/7ertvBDwcY1+b2
 q2K6FkWraXQAlKOrQRLGTTmFnvd99xHRr2Speg7ZF/hW4MwC8+Oni8Bnz/+Zo2ht/j6E
 5Kpa8Pp5CzbBOsoUSQyLrcm1SFNlPpxfU8sHIyff83FzmUVCav+4Am+JMhpLowzRuMdi
 00tui2kgYhkcnkZa6yFjtfUNr8Qt+v5M01pZMlUinHyXSlw/3q6ZvFtGMVfsVTXNbeP/
 59ncQSytevy1OK+IYIezacYT/5OnIUS5llCfQViOvUFhd/wHL+FoWXQ2LrCFxAlJ/159
 mpkA==
X-Gm-Message-State: AOAM530joURpsy9bFxj1yXKI1CSLY/OfWnavUr4L0RKGhC4yPEzCPeil
 sErSyqnA17EyQEN1qPKPs7APeYflFsU=
X-Received: by 2002:aa7:8388:: with SMTP id u8mr1942052pfm.253.1592454456857; 
 Wed, 17 Jun 2020 21:27:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u61sm964897pjb.7.2020.06.17.21.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:27:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 015/100] target/arm: Enable SVE2 and some extensions
Date: Wed, 17 Jun 2020 21:25:19 -0700
Message-Id: <20200618042644.1685561-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9j05G5dGek05

Sort to the end of the patch series for final commit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 778cecc2e6..7389b6e5ab 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -670,6 +670,17 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
         cpu->isar.id_aa64mmfr2 = t;
 
+        t = cpu->isar.id_aa64zfr0;
+        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+        cpu->isar.id_aa64zfr0 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-- 
2.25.1

