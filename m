Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp770035lfr;
        Fri, 16 Apr 2021 15:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf2xwPejXdI0RnCSA35BWaiZgnx6yfvuCX/MM1aYNy9bA5NgHX/KFGCHnr0SaEMrDlsAu0
X-Received: by 2002:a25:e043:: with SMTP id x64mr1853830ybg.299.1618611653142;
        Fri, 16 Apr 2021 15:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618611653; cv=none;
        d=google.com; s=arc-20160816;
        b=tUh5MoBqnYkFFcS9iWEOcynUmzrI5K0mOzvltzysvrjHrBU3dv4xScYrm5fCy70dor
         CYTl0EOC/CCdIm/5ZmmiRX5fn5Me5axxeXg7Fokxm1RiKWCnTVdEM0l9tUbQhbfVsQxn
         4edj/CqAcW70Nv7ZkJFX4bz9dvCvXZ/XlbXdF7CenZKO65tTeP9MfVa//x3MEZnRFLaQ
         d5GVNvCF9MeWBBoN8vEKdgJBYPu4HxUqYMSwjfrwKU2ybIEdbLsU+xoSAxXneLjKLQW3
         If642HaoWwAW2G52BkKO2C3149p9f3gxP8pY0CSTzTm2kk/WTkIZmfOAOBnfWhcjjCsO
         j1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8Vthia0uCLhbBTsJ1gqUumg4ccjBueHeraGUzoP/hUo=;
        b=08/I+CzWefivYzIMBrkGLMyiQFDhlLBBeZJgKWNtWGMr3rjYDMZhbRXcn2QtBK0SnQ
         tYxsOQuTls0TOUu1iGtVkrz/oAysQSPAH6dXYUb89gSggV7170Gc4OAXOBw8gZR8agxY
         LZ9dWyvF3Ua/+5hOGmdaV8EHkdOUPRfGH2WAJ/tzt6Zp+eIP5TalxqjkoskSUxOb3hJr
         en8P7ThEy7ncrqrgzqqecq/P9zZNST+23HrhhnfJOsOQjh/WCmbIGf0fNSh1+krMka1Z
         SmLTkA4xQpgtvjj3YZXuV2fMY0VLVJ86FkRg9xCTErqgUbsGBagk4zHNdGGgfLRBA382
         9Pxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPN6yWUb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si6689827ybj.311.2021.04.16.15.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 15:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPN6yWUb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWpY-0000f1-Ii
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 18:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdw-0006pl-DS
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:48 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdb-0001pl-Kp
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:48 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z22so9508878plo.3
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Vthia0uCLhbBTsJ1gqUumg4ccjBueHeraGUzoP/hUo=;
 b=mPN6yWUbNavADuJXATWt8nvOEpoCFjFSe56nvdRqQMCUZs8HtfXsi2B9j9qjL5qBVo
 770Y/9yYZwTH+4mP8dAUbg2aWF63UxA1F7K+nzJfX8tF6ELw5kMnHe5KHTfOuRrRUlHd
 jWxCCyrBZ0EoI3zYk+ksBykYVQsrWmJF72Ur5JiJ1lHrFradv0AQGineOWlr7RE6KgeK
 z1OJodYCfloC3mmaQ95YU8AkwJrwNIgdLPI2ZCCikSgeRWUwqDrxnugGvwvECpiooNO9
 o9a3RVyldTq83H1uHYPJ9DfehsuKDDrSX5wfAuc2ClEs834NsUkvA8bUfeGreLE2tnDR
 2Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Vthia0uCLhbBTsJ1gqUumg4ccjBueHeraGUzoP/hUo=;
 b=tKw9ZiQQgHyuUxGRmhRR1hUKhkWhPOBIRhMMXq3ILfvXkyoAC6cV1PaoHzp2WcfPEJ
 fmVLYtToYW/3SDQLPZOp5QUStm6XfahYTkizvRQegqoa2vBSCCxeyrcj92O9SjKktuf9
 7X0SQO3bLyuDHU7cE4holR7S2tgGHQDknUWzilcspIQTRrE2vvws3nQbHJNALMDxNFKd
 +vRVQZwMu3dAVyv47vwPOD+xq9ME3S7xqBMRVElrQU+5Lu3mzti9isvHlHirQGjblvlw
 iAzEY0C2jWUbPWGofbLGVrT7fzl2z9Cf8o97GAJojsYe4nEHwBzA+8gi2Sspii/sjdV2
 QD1g==
X-Gm-Message-State: AOAM531xkVW0c6k6d5IjvBXQZdkdJDuxkRu6Bd6blce1jX2+Ni4Nrvdq
 j0gc4Xj/38Fvx1h/GDuzlWrMaw==
X-Received: by 2002:a17:90a:fb89:: with SMTP id
 cp9mr11363346pjb.47.1618607066445; 
 Fri, 16 Apr 2021 14:04:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 76/81] target/arm: Remove unused fpst from VDOT_scalar
Date: Fri, 16 Apr 2021 14:02:35 -0700
Message-Id: <20210416210240.1591291-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WRZl2WUb/q0l

Cut and paste error from another pattern.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 6385d13a7e..c1fbe21ae6 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -316,7 +316,6 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
     gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
-    TCGv_ptr fpst;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -338,13 +337,11 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 
     fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->rm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
-- 
2.25.1

