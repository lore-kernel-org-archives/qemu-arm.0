Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3296244ejc;
        Mon, 23 Jan 2023 16:05:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuKa3L6hspPf0NNLJ/2zBmDynxzS6FLohvojSEyqDwGTexvlxH0S8eJ0oL6XleskxYuxPTm
X-Received: by 2002:a81:52cd:0:b0:4ff:dc8:f43 with SMTP id g196-20020a8152cd000000b004ff0dc80f43mr7783448ywb.11.1674518709448;
        Mon, 23 Jan 2023 16:05:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518709; cv=none;
        d=google.com; s=arc-20160816;
        b=bDMSeJGs+PARphQIMspqcIknXlzZNlbLanPGbUQGPx7MkRzlxeff5H+bF1ivkfFBpj
         rhQ/0CPcBmG6mHq8gxKZ7owSW+bnvy1gnQzwPBo0+oxNrNX0cgkdGign09KB9YaEP/y3
         5YF1oZGTajZz3PISebpa9jKqpnltQpeSQ9XnMveFp9v4O7UgK4piGnr3TUV1dtBubwW0
         TScoVuXP2oKnYvlpFPoDDJCL19aBO39wKF+Q6sUoDd5o0ls+cZmQGYM/IM+Ot2KpbMxy
         opQLfI0dP/OMpPMiWpmQ5S9/mib+QoZg6Z2xZ+kvOqazOfCRbjP65ki0pGCFvncc2RE8
         Xl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Go52RyLr599mBvLq+RmbiVaK0sm0+xrVqrOqv+d33DY=;
        b=XVlZfAkFY0sgaCZWoJzp0Qsa36fhfpSARCXb6Rz323t6SI5c0GSah+YNs0jaPByHEE
         3pfoY0ob/ilm3KT2OkUnwh4esedwIoZ8IqBgcw/1jra3bmlKeDGoZoJZOGmdU3a7EXVS
         fdCWzibzChrrJ2DghDZRpzFzmghKfDFFKZWxY0Sb8FVqPCCPLA9kj0Lz3IdAYL00dcom
         vaFtqE2g/Dj/xP9ZRk0a8b+3z6es0vy6b3FKmsx5KSX2Zda+wE0SaNgYKd1s2hAk5WcU
         0lYd1mx3u1KkavD2FLfRMLTmKu52J2voVRIYLby1axiv39mxyyB+3aRrVDw/8wosR1U9
         FPKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B6yo35Q5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv1-20020a05620a1b8100b006bb66b325adsi481436qkb.618.2023.01.23.16.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:05:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B6yo35Q5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kI-0008Ii-Fc; Mon, 23 Jan 2023 19:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kF-000897-1L
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:59 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kC-0001rr-Ta
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:58 -0500
Received: by mail-pg1-x52e.google.com with SMTP id q9so10246238pgq.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Go52RyLr599mBvLq+RmbiVaK0sm0+xrVqrOqv+d33DY=;
 b=B6yo35Q5oDbiBExkcE+0oPzPlwG2fHDXd82K6zZcwQA7wWesDJwjMGY0/xGywzJLh7
 krx9hQFh4HhKvMfRRp3wDT/rDk1623km8MTghWNB+DeVEoEb7YLz4k1q3VOICaDNKKEB
 lsuHnKu1lhnMjrY2T2lUPI9gjtnfxmqhXmRM1CXu89vO3T4qFCFfc6Y2iANU2JCrL1Ux
 GtvzQOOy51uHSlGj3lH3RrUMD/KIdGA3oMYA3+CJRjnPlYFxT23V281Y4HrlVTM5bhOQ
 +AHqNujRMlAwfjOi+qJtdjQXCIuu+ZmVGMouWxseYX9WtqXjnyQn/v1tMXw+pDVD+z4O
 bS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Go52RyLr599mBvLq+RmbiVaK0sm0+xrVqrOqv+d33DY=;
 b=pksuDtjw7Z8DiJ33hgfm0+d4ADkCKJpkcfLG+kGsiCDLzYd4HPcmnowbFqHudhwIqe
 UqrF4SWwRt+5ZkLo6aqsSgsCkBspZjaNzaX4USHO1ok1Y+Sg0OH27IuPjyF9Fo8dzDwF
 4ChnW4raTqYmPZHLdCZSCydWp+Eq/Hsi55tKsr5qR0PO3NGXwrc6ydIRZhwqmfExCfjK
 fHlLh6KdcYuQAXpV3piOFzUJ+nMFfxF0gHwGFbrlkYIRpgeUgZ0FyoWktAmx2Nw6/8le
 M5DEoGDBDDQcmCXrJdBFTuC0110TCvbmKr+FbPvNcSXH38X4BruiprXAHSep/Gpa+A8y
 v/tw==
X-Gm-Message-State: AFqh2kpKcRvujPTOh1TEkYHGHLNaWIzLM5MxCBboJgKGHp+7JU9vE7FN
 1Goajhc/njHKlr3zyAkrFZj/Ljc6BNR49h3s
X-Received: by 2002:a62:19cb:0:b0:58d:b2eb:86ef with SMTP id
 194-20020a6219cb000000b0058db2eb86efmr24742583pfz.9.1674518455493; 
 Mon, 23 Jan 2023 16:00:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 05/22] target/arm: SCR_EL3.NS may be RES1
Date: Mon, 23 Jan 2023 14:00:10 -1000
Message-Id: <20230124000027.3565716-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lWWNav8EfNFD

With RME, SEL2 must also be present to support secure state.
The NS bit is RES1 if SEL2 is not present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 293f8eda8c..783b675bd1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1853,6 +1853,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         if (cpu_isar_feature(aa64_sel2, cpu)) {
             valid_mask |= SCR_EEL2;
+        } else if (cpu_isar_feature(aa64_rme, cpu)) {
+            /* With RME and without SEL2, NS is RES1. */
+            value |= SCR_NS;
         }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
-- 
2.34.1

