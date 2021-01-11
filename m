Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2928522lfq;
        Mon, 11 Jan 2021 11:17:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJImIYDev1N8W4m8ytl99IWdVVtITeiOpGdDDhZDcHHb+i7SPprCCmDtqeSn3QT+PwIbsa
X-Received: by 2002:a25:6ec3:: with SMTP id j186mr1826660ybc.335.1610392669146;
        Mon, 11 Jan 2021 11:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610392669; cv=none;
        d=google.com; s=arc-20160816;
        b=cqeto1bZl4kD8arddHyfXqRup+KZsEhMCS7bgOY7xp2NyW0zF4Al+ov68KwMa1Bdr9
         gIMIy+XWh6GL6J9VuRm5jWTs1gvewvV+1+8Vj7azizsX7Yei/bQj12GCPROWsE2p6bng
         vM13jsWT4XmAG+PLLXjL1AsA74NSl4RpQ0WYD2OfrG3zmaZxLlL6ogc5hFBPQtrKLX/I
         hFNV3ClWfvXWZ+NunZbNVoMXCOiqkUPjWHGe+v+RfdAjXRtGyNhz5paaaVnnFwen11N/
         E8F61XGObbK8yvUA2fL9AwbOAxgkGOzfqzxq+ga5UC9n1q6is8tDAed935K43VwP2d9v
         5Avw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4n1qdCl4BSNX+je6zlGPHDmT7d0/KM39fnJLGgL3o+g=;
        b=fE8ZHaklCXvdSkoxy54tvdsQCPETKp1ofJsqEp3eegREpdFun8I5GNjE5Vj+Glvz1V
         +O0f/8F2sJi+Qq5dUxNKiGQ+DOdNTm7iKspWuzUKHEdiuqnI+qyEGgWmpFLa0qGgFf3A
         N4jrekuXooOmr5kfgxGTY6FlLw/59hmJAhagZS+bxJSkSlY0wDja4N605/4YwaHrDzsV
         Ux+D7OKe4rstIL/AX+CDb4N0Y8FjDCdv1oAX5CDIq6QWntalio+Nkax71W5KyYz+1myb
         nODosOrluQj3eOJMh9bR/XY+w2RwfsOflAWb4mId4cWOpsK7wyLcrBzJNRkW+ODeaCY1
         4QDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vZ52RXzv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si615050ybh.449.2021.01.11.11.17.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:17:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vZ52RXzv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2hI-0002Mo-HC
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rx-0006AS-K4
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:57 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rk-0006SV-3I
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:57 -0500
Received: by mail-pj1-x1031.google.com with SMTP id v1so99231pjr.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4n1qdCl4BSNX+je6zlGPHDmT7d0/KM39fnJLGgL3o+g=;
 b=vZ52RXzvCu8qZKS3gNUC0ZhUVPiUGm1kQvwfR0adFZP12XhQ8sF4v2bX24OhwJsaa9
 vMouhEHvs8Dzu1ysfuOU+iLwetQ43Z1Jmg75i+YlFsABxntnV6xabFYxSg+zCJjtAe6E
 IYnhx3jkXldfZ9YNMbmwF15mOGFgE7G0aZJF/81yEQZX66pu2E5geBMooG3fWfagu+WU
 cmqcobp+P8w5u4N9dW1QSLdXG2eWV2mgs+FIY98KfAng3x3iCU70IgVymygS7EG9x36l
 jvUr6+ElJy3FlfLqJmv+c+Fq99wF5cumyGj8ZtotpbDeQoZ3T7dWtJpiT7EIifk4nLSO
 8I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4n1qdCl4BSNX+je6zlGPHDmT7d0/KM39fnJLGgL3o+g=;
 b=hWInroPTbsem0C4mld6uuJSsoK+eRrFmTzmTuKzZ+RUo9Lz0lrV2r9xu8+xykxIodp
 Jd5KOAVesoWS02b3JpUeqL3Y07dtt6JujAP1SW5vFguwMedVHoX08N3nCRayRQErgn+c
 0unuhXTvp1Psx26iUWB+2mni5aVtzSUGJitKUExxOzJUO9JtIJP62W9TimEiA1w8rc2J
 0NEEF+0t2JKOB9T7a/q2nVKEGCYH5yGrnpWRjGN3hg+S+TKAwLBWGMBFFuCHq+MISn5Z
 i229XCaqTVUECjYieNE4MUKrO2o/1A5Y5qaiME81r2bUhvtC2Lkd/izy1NP7pEukmXzZ
 N4Gw==
X-Gm-Message-State: AOAM53394tC1C0TIhoiMvmeFhScB1kQ0tBC+rTbFOuy8YakE+jIFvSAM
 +nu4Oz9UKIYKUk2PA1FAbNRz5GJwYQY+kQ==
X-Received: by 2002:a17:90a:1057:: with SMTP id
 y23mr268737pjd.97.1610391702604; 
 Mon, 11 Jan 2021 11:01:42 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/30] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
Date: Mon, 11 Jan 2021 09:00:58 -1000
Message-Id: <20210111190113.303726-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IKKsAApiTnS7

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9cc6a9f83d..ba68d4d7f4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6883,7 +6883,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
     tcg_temp_free_i32(tmp);
@@ -7039,7 +7039,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
     tcg_temp_free_i32(addr);
 
-- 
2.25.1

