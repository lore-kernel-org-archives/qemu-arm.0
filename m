Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1986075ejb;
        Wed, 21 Feb 2024 07:22:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfU+Cldd2P0GiYsmYJf/wOReJFRFp96xQ8FR/RQkWxiBjPc4kesonzAQZ/hvZMn6gS31D1thajqSPFdjsHaF+uJ89oaM1L
X-Google-Smtp-Source: AGHT+IHKBx1txVdNthR36yiNXEWg4FTkrhCPXMWvLYvl9w9KKESqi5aHQ8VcLJg0aaR5GhtmVkdY
X-Received: by 2002:a05:620a:4416:b0:787:8dff:d173 with SMTP id v22-20020a05620a441600b007878dffd173mr1987159qkp.28.1708528954717;
        Wed, 21 Feb 2024 07:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528954; cv=none;
        d=google.com; s=arc-20160816;
        b=jAEvPw0jWKqFswi+eoyO57FqxSGYgHerenAFs+z3OwMuQRDM+Yg4ImpO2607+FoLoY
         xX0EYPzN2PJIy8VN/A9sEdc5zseIZAVzRx54Jm+6zrkM621R58bQuUDV+YiMFd9IUkJO
         tMFnHEONPlbGSLFO2lG+739GfOjzJ55YElUG/Rn2h86mtOBEAN39rBsaf60Ci3X2kfB9
         jYqRgwbrB1+1yeMJaFHlkH0sEv8dQ/F0Xq8NJDNUUYE47U/cmdbGw/v86JGFsSdkAY16
         i7s61fj8A9XOsUlTAbnzQlipSHwIoyEMaEAm6AJJTvc2A216I63U/gPvpkQ9NNuv2dKL
         7iVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=wzASu87O8AcGK3XP2roXf8xFGDvyzZoaeHZoBmoGJ48=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=g8bNuRhBXXAWvpGj1bYc6oH5QAzgP0ybH7jOFGl1Q92y0y5u13v2BIyui9s/zzdTR4
         5XNrlAWQvZOIKvtZBxdOiPhTwnozS8+VcX/BxaI13Eu0NmBB55k4eDuBN7Jf1uZf0PCk
         oLTkuZ0uvsN0zvcRQRcs5o1oFdHHvTblgcd9gWBwPf5KzzSGhqwpjy3+OvS42KC/Vfff
         yvKtWuZeqDFRSkKZE5/gqdUIyVGzpierR9kUVMuF5yzZ2ufeQHUqjcTAKYojOG/uEjIU
         3AG/IiYpJv4tj1e+KUSzIHIRSH/MQExNf+LQYnnxppNB9aCqiIrjJdf3jBsZV4Pkf1SA
         7oLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05620a44d400b007873ae5747dsi12000486qkp.380.2024.02.21.07.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:22:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoM4-0003iq-AY; Wed, 21 Feb 2024 10:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoJu-0000wk-Rk; Wed, 21 Feb 2024 10:15:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLz-0004q9-4k; Wed, 21 Feb 2024 08:09:41 -0500
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxQ05G8hz2Bd9r;
 Wed, 21 Feb 2024 21:07:20 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id AB06118002F;
 Wed, 21 Feb 2024 21:09:29 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:29 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 09/22] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Wed, 21 Feb 2024 13:08:10 +0000
Message-ID: <20240221130823.677762-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NgVQy7k2E0p9

Add support for FEAT_NMI. NMI (FEAT_NMI) is an mandatory feature in
ARMv8.8-A and ARM v9.3-A.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/internals.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 50bff44549..fee65caba5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1078,6 +1078,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_mte(id)) {
         valid |= PSTATE_TCO;
     }
+    if (isar_feature_aa64_nmi(id)) {
+        valid |= PSTATE_ALLINT;
+    }
 
     return valid;
 }
-- 
2.34.1

