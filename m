Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3670220lfb;
        Mon, 9 Nov 2020 06:20:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEL33Rxkvc3i7mxcARkLlwOfzo5huBb6dbjo8Gzb5qno1SKEMoMFjms6dS3IGv0nU4gXr5
X-Received: by 2002:a25:bf82:: with SMTP id l2mr17971322ybk.1.1604931635356;
        Mon, 09 Nov 2020 06:20:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931635; cv=none;
        d=google.com; s=arc-20160816;
        b=Q95Zs3S/h6bb7+NwgdKURJ5jnTwYeJYOJM2+cE0wufxM/6foM5DMk0HU6Axk/lmjmW
         mZ7NXFdZjk/CvpnTCKuruUPqgV1ABi3Wl2Moq8YL6JirKLCJ5HgYrJCtXKht1D8HltDx
         luw+4VPeKKWSvHNLIak9i9E0kT2qqx2iAJ90Y96M9Niozgq6QyC0y6wtJ00U2wNxcjQE
         h/HqZSSky/cHnSdOEP24/ZwnJzetY5HxjanKx7ih0T0NuF2HF5aoDHIBeJeCiAXuV2Tq
         JrfcA3zpPWRhzSqhHMapR6btgz7N8N/dRFnYxhu+eDAgvJkxKc0PhTC1VbyxVFkykkyB
         4/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=u6yTHDOK5qJzKEdygnpMTZuxtAmC04kNzHqborQv8aU=;
        b=RftsNsxX0xzAYQ7i/wt5d5eIsbFhLWBrFkgMAmeiU+GYFNvL0K/nKpyyM352b7WfNl
         7FNlHzKaqLO4Q1wdL8gf75eqIy70ha+TNI3CXOD8DoYgiamM0dF/kPDX8xGu54sIydbx
         i7vOSmyVbRl7AwXQEtIifMadCrSDn6NB4bFPe6ncU6Eq8HwHodZHrS/D+hUF2/nkmBtO
         2FlvCE4Nd/NnFj9ukRWoWCo+iYLEewlmHzgbAh/i4WAqD/MMS0Uz4blP0WBDmeDPHggT
         em0+dGtKhDALD4dRUL5iZk2Wb6/f4DooxmouDdqpPle+BON5H7Kxm5FM4A0OV1HVdAV5
         yTfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si8154405ybf.277.2020.11.09.06.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:20:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc826-0006eX-Kz
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sj-0003Q1-Ua; Mon, 09 Nov 2020 09:10:53 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60180
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sh-0002nS-11; Mon, 09 Nov 2020 09:10:53 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id D32A560640;
 Mon,  9 Nov 2020 15:10:24 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 16/17] target/arm: enable Secure EL2 in max CPU
Date: Mon,  9 Nov 2020 16:10:19 +0200
Message-Id: <20201109141020.27234-16-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
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
X-TUID: L1kPMC/jj/EG

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 649213082f..8c3749268e 100644
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
2.29.2

