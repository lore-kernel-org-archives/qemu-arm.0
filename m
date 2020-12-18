Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2348212lfq;
        Fri, 18 Dec 2020 06:33:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyzBImyCFpitSQcXa+hkFXYLSSWXk6pkrqagdYpEDCQk3aBJu1SJJ0MDVsHZNYYb2VFQQw
X-Received: by 2002:a25:b703:: with SMTP id t3mr6716937ybj.96.1608302023952;
        Fri, 18 Dec 2020 06:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608302023; cv=none;
        d=google.com; s=arc-20160816;
        b=Vrl7oQYDom0jrZ6Btq7KiFh9TKn4IcNl26eIYHL2iUYvBozmuoAHTGqcjlvDR5FjJE
         uxwtHBJN6L4aJXQfkZmhPa7TcHQYWcmAETWuVulEvO5jE0t146mtZH7H/lAVV3qeuZTT
         SM/sunttiri1TzK8fwY309kM6gakM2YoDNU9D/DMOfGB9FareLmLZvE/Ns1x2HgsAKGG
         l7YRd1wLYdPH6ZmIsbY9NN9Nb2p1zwEb4lIgTDVIayDclfVLHediZXOveWKL3kZCjCcm
         b1pBQXoUcs02g9owx47mDc2dc0vU+Z+WWUmuYvVJAgu3q+U61jGIZ7WkJFrFWUklJvr/
         lQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fl6zaWovK9QmVLc9FgNyuGc9BhVvNvUwYhDm2CqMm/Q=;
        b=xwb55aRSchiDMnwfnTB7wkras1jSAGSDXKcn1MeziaTZft1aMxeZ/S67IKEZayXyX2
         B79U8PU7bHrYWdGNlGsK81hzDkRt5DI4LHfmn3QSqaVxJzpqmSz0c2IVgKB9c8O7nLjH
         9axTJKqn3eLkWeNqOHt9t2Gl0BYlz6MAJFe00DTPHhA9/UoszwthlitfE4t4ZsbzV02M
         lNNcj0B/KmewD5WFzPTUt6/SZBh7F+jMfK03ydEdffbJSSoMA1VFTwc7+UlEDyJpbu3J
         TdBZ71pR2+eyik88/QctoxUa3cSbCytyz2YdVDnOtPyfDbwNVuk1n1un6BkRSeFKlyvC
         uUtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si8315393ybs.204.2020.12.18.06.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 06:33:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqGpD-0001Wm-96
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 09:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqGow-0001V8-1z; Fri, 18 Dec 2020 09:33:26 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56810
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqGot-0007YD-8F; Fri, 18 Dec 2020 09:33:25 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 102F85FFBB;
 Fri, 18 Dec 2020 15:33:22 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 3/3] target/arm: enable Small Translation tables in max CPU
Date: Fri, 18 Dec 2020 16:33:21 +0200
Message-Id: <20201218143321.102872-3-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7884934.NyiUUSuA9g@basile.remlab.net>
References: <7884934.NyiUUSuA9g@basile.remlab.net>
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
X-TUID: PhG+EPmv1pWX

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3dc2f5da6c..8d3473db3e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -670,6 +670,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr2;
         t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
         t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
+        t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.29.2

