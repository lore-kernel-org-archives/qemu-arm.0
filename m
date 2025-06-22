Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2123185dyb;
        Sun, 22 Jun 2025 10:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8MRfe1EsUblwlBo5wJ5mNUh+LBu7MlavkVE5TGvpl6KPwGjOE3P6dsredDGD1mcUVc9RMIZ2yWTh/lA==@linaro.org
X-Google-Smtp-Source: AGHT+IFm6cC031EXjj6vsfjbrdemQKnuO/zev0WANdry/NPVrysyxNQA9iduQvkZfCXGnmWLfMkS
X-Received: by 2002:a05:6214:2c0a:b0:6fa:bb74:8d72 with SMTP id 6a1803df08f44-6fd0a31da06mr182576686d6.0.1750614695187;
        Sun, 22 Jun 2025 10:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750614695; cv=none;
        d=google.com; s=arc-20240605;
        b=V8E2TS0ganIPP1OXFWdfhzWFak+M45Egc5pWWlndPT+vsQjbC/AZf0cA6fbHDWJkJ8
         5a8yaDIJTAzhHLJf0XQTAWl9I+0Nvqphvanu97VNctVCXt6DpNs8wH/qQMSz4A+YpWJk
         Kdz5BdAD2I1ZZxYRDHAdHGgnvY6IWIOOdxmel9s3hkb/4KxbgWHA66FGdvjEpXpJgHBp
         bb7eZmGSabHgFc93T+WJIg/hcC+1eQnipnwbv3nRckg63VmTBUrHndtXPs2cCYHTYqpm
         7m/phikkxbCo3gPp1bTKNLJpt186O7DzxBM2oZKmmdsf265Aa/jyTFuXpI3DhkFFewOs
         MFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zz85mS8Aj0NqtVluLQ1vpPK1jkJFPwOsi7JR49MknDU=;
        fh=quVKJN+JogokNzsp4kwoA7mheGRSBID5PxcC4hooSO8=;
        b=lzUDOUi/DJRjlEYYq7PmhkReecVyo37n63NOMKdOSiY5f5Otvoo6EXIEyD/x9CrCF9
         JM4u+c4Y2LhFGaoRdqAKRM8BCx7hbm+UV/8BEOZYCBjoxqTqzwcab+uUrPWXykitAjit
         7QuBFBfVcOZuffKUa/PhItWUBOx67C5ne6DWYyqtQPYaQ53TMMajOiBsb/1KvHNDRweM
         oDYX5B6zwiGHTJX6dkD4krJcOEB1+9zMo6fDzrQM5qe+WZS9NnZZFA70ErZ6cuffno77
         3ked0LUJFwcF8LxKCtPqAbHFLGUX4pB4ZWZI1O9ixzo61xCAjV9Cemm9lddPCQttWGUa
         USVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cW8xadc/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd0957e4d8si70520906d6.317.2025.06.22.10.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Jun 2025 10:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cW8xadc/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTOqK-0003BQ-CF; Sun, 22 Jun 2025 13:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uTOqI-0003Aj-7V
 for qemu-arm@nongnu.org; Sun, 22 Jun 2025 13:50:58 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uTOqF-00028Y-G3
 for qemu-arm@nongnu.org; Sun, 22 Jun 2025 13:50:57 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-23649faf69fso33238455ad.0
 for <qemu-arm@nongnu.org>; Sun, 22 Jun 2025 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750614654; x=1751219454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zz85mS8Aj0NqtVluLQ1vpPK1jkJFPwOsi7JR49MknDU=;
 b=cW8xadc/QQK51J6ohuBFv1VyyC1odA01wwXwuSSJl56JzxELgd6dR3USLiK6oSA57v
 A8VbgGNUAeBg78dMLWhgnc9VC/6GHuJ1voxfyjCrY7TCYJhEFVm3TYnLpdf52Ljknjvt
 27iC8fvOk4Jl6VpN25lTkGwKw9Yoen5GFmVrEgluYNKs2gMZuT8H0ArFyCLiDSFE4n3b
 fONaTnFd8KATtBGhBB2tvbhsTCjMCKnZelPMIxWQYu/kf+ROMPYfu6DlVMJP5fa/914S
 es4oEu9ppTLzWnvDSZYojs0cwFRfDKynhl3NSXcTAlVwN1q+PPPzymZFaKLSFd6gP8NC
 d9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750614654; x=1751219454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zz85mS8Aj0NqtVluLQ1vpPK1jkJFPwOsi7JR49MknDU=;
 b=GMmC0EDcB/54oniW/3xqUnAwsvStdgdA0W/W1oI4iCDIcchqO5PfvGXEy2WSfF4YEV
 S+OrzpL+l02xv4P8ku4MVrkIPDmaoQ/xLvt57eEk8A6NNHBCXC+m0Z3Kp/loDjY6AsjT
 oQ+e9C5xd8V+r8qRPXtY+DHD7SX/LsNAr3Ho/F4ZA1Nqz9i/qzGJr/C2GYiItGbtumwH
 WEpDx1RTXP5Q6yIOEQd4BxOdNy5aQG1zsDtO5LhGC9tWpH7DQiSeSdE/0b+5AFdiCQrj
 HbYo9WZrn+92yEV+V1kXzoU6y2Z0jXOvN5Oc8x1Q1MGD03scSHYQH9POvD+O8CAfrU48
 mhRA==
X-Gm-Message-State: AOJu0YxBhNqrU6pnj6LAH8nh+cP5DeknYcgo4uYLGePaFO8Hj4HyEOWl
 v3fTvdLM/CpzvCFh2K/Q3sokaq/Mia/nOZpzmT2PdpDAAS8UOZeoMof0ywzvnGYLQKM=
X-Gm-Gg: ASbGncs77zG7AtaNQwtysBmrf+/OhyesRSZkgMcY6SBvR4aPldgDGIkV2UOI75jprh2
 7UFhJaWBh67CVKY6YaIDp4cETuS3BrZET1do8MQq1C8Lcj3d2uXPpfAlJgqlx77psPETUp5GHNb
 n2fJPB8HPWCdBQbTIPJQdWsQSr+6ek3VbIOej2tJPA+wykvvNQH5RVwn+iEfhXXIEg0Bsa3nfcW
 mf+J7ElTif+NjdgLUTBfrHhlL8COBY1qzfNQT8bjjCv4dq7vnBf0f7umsGiN3RyjV2TTdFFv4IJ
 aVS8wb5GPclXK92iM1GAiNasL3DVIEquZ8wbAGFDqhdfaCZbVD8gLXJdVVIjjhcg6jnnMHhdgNG
 h04yTs8OusS2l35aB3Ff+
X-Received: by 2002:a17:902:d58c:b0:234:b131:15a with SMTP id
 d9443c01a7336-237d9775661mr144441765ad.4.1750614653581; 
 Sun, 22 Jun 2025 10:50:53 -0700 (PDT)
Received: from stoup.. (174-21-67-243.tukw.qwest.net. [174.21.67.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860a426sm64747445ad.117.2025.06.22.10.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 10:50:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix SME vs AdvSIMD exception priority
Date: Sun, 22 Jun 2025 10:50:52 -0700
Message-ID: <20250622175052.180728-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: vhc8h/1OMp0Z

We failed to raise an exception when
sme_excp_el == 0 and fp_excp_el == 1.

Cc: qemu-stable@nongnu.org
Fixes: 3d74825f4d6 ("target/arm: Add SME enablement checks")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 297064806e..427f029e28 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1494,7 +1494,8 @@ bool sme_enabled_check(DisasContext *s)
      * to be zero when fp_excp_el has priority.  This is because we need
      * sme_excp_el by itself for cpregs access checks.
      */
-    if (!s->fp_excp_el || s->sme_excp_el < s->fp_excp_el) {
+    if (s->sme_excp_el
+        && (!s->fp_excp_el || s->sme_excp_el < s->fp_excp_el)) {
         bool ret = sme_access_check(s);
         s->fp_access_checked = (ret ? 1 : -1);
         return ret;
-- 
2.43.0

