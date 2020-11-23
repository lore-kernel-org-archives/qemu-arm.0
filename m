Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3397040lfb;
        Mon, 23 Nov 2020 00:20:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE1sUncnqO35YK5IChd3+Ndy4Q4uC6q/6b74BaYhqjRTd+jBEbfzJ8B+jaL4i0TjmqaS+e
X-Received: by 2002:a5b:74f:: with SMTP id s15mr36558846ybq.11.1606119655751;
        Mon, 23 Nov 2020 00:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606119655; cv=none;
        d=google.com; s=arc-20160816;
        b=uzzw6FZW4ubHKH8GM/K5Dun4UQkxZ+5w7sl/jgl1QYIZ4tId2SdTq8959eicG61Pz2
         sgbDaL8ProIi003LK6ssQA1dHOTeh7LQRWvJ1RBALh6MDDrdHPHPitglhPPKAMPRoTsI
         SqAmM0+LxibIoAL5l+gtB9E6jx/fQxX/sUugXd91Vw8uKYmpWZqbG73B5Hzrs2LYcgYk
         5dgBGdO0chDSMXZHkHIL+8HGo5BF11maguA2wejmd9JAPVuNyXFluktOuStpL7fpuKrK
         5BW6ggVKtBDCeDwfG82gRBKu8t4l2zG2hOu9VSS8RfPhI36yzMDweM/hs2WIV/YAEL9a
         HzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=u6yTHDOK5qJzKEdygnpMTZuxtAmC04kNzHqborQv8aU=;
        b=tploiSKgQQhDw72G1kw0TRKX1DDgZOjQsPdGYpwRtF8IbqImHsfZe0FPmTIpUFutH2
         iIb8admOF/EScfm8KZWPFtmzgBqw5qO047oHQZ/VaNAJjaOav9CXRBqYmX20FOzhDsmi
         M+NvmtP5wVHrwCTtqXMviB4hy57zjU16Y09kFjjkVZXU19yUzpYVm9FKa8+VqbOIRSH+
         4/SBRd2jwf/wVt/fLM/swWFgTdz17MMJxTQqsN8X10R2twbCxHj89lb8ELip9ie3uevK
         2wr2IMRgn2xLd7mqbX7PeWDOJuL+YcswrIIgb8pwE/+mlLoGLKPFpsyeE3E6CqztMTiH
         oXGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si11061608ybq.304.2020.11.23.00.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:20:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh75j-0002Xu-1a
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6oT-0006LL-VY; Mon, 23 Nov 2020 03:03:06 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54628
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6oR-0004f5-AI; Mon, 23 Nov 2020 03:03:05 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 2678F5FD4A;
 Mon, 23 Nov 2020 09:02:41 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 16/17] target/arm: enable Secure EL2 in max CPU
Date: Mon, 23 Nov 2020 10:02:36 +0200
Message-Id: <20201123080237.18465-16-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
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
X-TUID: sSuKDdvqno0S

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

