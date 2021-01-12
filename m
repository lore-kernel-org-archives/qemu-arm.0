Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3447620lfq;
        Tue, 12 Jan 2021 03:05:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp5zUhTdDf/R6bMUh/zwXgDAqj1En7O+kaHvFn6vhXFPAPrN+Kc6ji3efbDU/L6aU9bg45
X-Received: by 2002:a25:2506:: with SMTP id l6mr6399830ybl.32.1610449556172;
        Tue, 12 Jan 2021 03:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610449556; cv=none;
        d=google.com; s=arc-20160816;
        b=KRyuikGl3vy1VJ3ZyrixfvB/faWnddZyWSji+0vkcM+UGppZzqzbhsiH8Z9akhrXeD
         DGzQ/XmhrR4T4I/JhCRAu3OsX+HQo5uJQQXXD65WqceC4mot38aaRCl+sZU5khbhck06
         6w+R1ujw5D4T/1bN5mI0QjEKHNbCTI3Nv4zuGr4RbHujQSM2TrQGiqTuZgJI1Q6+Jc1C
         osJok3ognOtOk29d5+4nIVxZbUNme3m36YNJQN63EesjYiaV1e0cH9fEzddobm8UEqSc
         Ev6jynGUHkzJYiMnBV9Y5svHq0J98YjyPPYGSSuhnmSZ+zUrvpGXxG7y3E1IKZiK/Rtx
         itQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9NqCmxYHzIsEpEg5Me7VnCOMV1vzqQDpMOkqrMrSMDU=;
        b=c6CDHP+Arj2voFGoWU2CKKNuFsScpUqEp6yBXIUFoFXsTTYXpehuyl6ldoK7ZIx7F/
         lYlRmBGUA40ciuZzaa9Gn6j90esJ9E/8DG22uwcCOcXyQqocmNfQKblk4OZaf+y8tipl
         qslfWBltZNB2Myn1HPG+3b/3ZKbZMdkrVzjXd/dFFyn6918tAusrp4/6TlQaVVGVb25g
         q7GLtKrQuuXd9qHu3/eJpLYSbENTjMTt0JyvlS+dM3TwDjxBiUM6FOnbFyePRUwXsXau
         BX4E4s0GtZ8+nfooCvdgFFZyMvtPUBq+/+azVkRJZ/CYZVZ0DwFmJlfIpr+Oqyh82M5I
         Omsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si2460025ybi.0.2021.01.12.03.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:05:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHUp-0007Rl-JJ
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHBV-0003vq-N7; Tue, 12 Jan 2021 05:45:57 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56714
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHBR-0003Ss-0H; Tue, 12 Jan 2021 05:45:56 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 2AAE760705;
 Tue, 12 Jan 2021 11:45:16 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 18/19] target/arm: enable Secure EL2 in max CPU
Date: Tue, 12 Jan 2021 12:45:10 +0200
Message-Id: <20210112104511.36576-18-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EZ/Vq9QnZtFa

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index da24f94baa..8d3473db3e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -641,6 +641,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
-- 
2.30.0

