Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3386740lfb;
        Mon, 23 Nov 2020 00:02:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLR5SV09HTB+HydHr8jv2ZqMQmgxLXAlHFnY3qyffVm2IF2OAsK/g1+rohN9wsnLedJk+j
X-Received: by 2002:a25:d305:: with SMTP id e5mr43335382ybf.358.1606118578743;
        Mon, 23 Nov 2020 00:02:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118578; cv=none;
        d=google.com; s=arc-20160816;
        b=hduAkqkQJYTmc+wKSueSu6sqcMmeSlWNeSz/zjzFwJzGLSvXgQUjyyHRZq3BVgsThg
         edfW2O+WQqtHlcgZ9KuXzm9k6gL/urN/LEAU/VFAPtcn+2F4Oipf5C53hdVw1mb6+gBL
         J3u0LXdO33nTI4Xfy232fnxjjHdftvs9xQLdgnbM/RvKMF7MLoZY/XK7lWPVHsjHI8tp
         ESwS7v2rhn29y1SKtTnCWSDnWSABCHpaczVrMxykR4XgU5v4mFPlgFOvS2HC9xBD4ezo
         S9acPhDci4UYyN6pQnrCAq2NQ4aDAfwf3TQQy0ZMn8tSozHZkPuaS9pJ+oWvIpdvw4vG
         GKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qiFcY95S5xNfDiQU1eB7PWSU0qM/WpLKJk5Qqroy2IY=;
        b=DZ0hPr8KYBmga8Wskm0W6FVHZwWbdNv5cJL45oF1DtNgdTvmT9Ffow4Jfd2OQKFZPk
         5I7B78UqOlzntVaLTLWlpxMHBitbJDceqqKVAOs64h+Uj6mu8K0DfFIMfSvqUH531Vky
         kE7OyjTnhQaYt5GWO5pfdr+j3uvuWvQ+5OrDiYzOyXnHVtAXHHBf4l9DCYzqXtqH8zT/
         bFtK+olOBXtr0/O74jZHkmlwcGwlVS5uNk4lhRHq+XVabvlLkFeE2nr6jTbGEu/cxVtu
         9wKc5kPpy7Ccpa4xB0YvB0Vtz6SrI0mWI510GQvWB/9SuMOdCCwWACo1zv/YxIerYRME
         Xl7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c184si9915450ybf.226.2020.11.23.00.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:02:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6oM-0005sS-5a
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6o6-0005mT-K9; Mon, 23 Nov 2020 03:02:42 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54628
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6o4-0004f5-Rw; Mon, 23 Nov 2020 03:02:42 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 95A7B603F7;
 Mon, 23 Nov 2020 09:02:38 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 06/17] target/arm: declare new AA64PFR0 bit-fields
Date: Mon, 23 Nov 2020 10:02:26 +0200
Message-Id: <20201123080237.18465-6-remi.denis.courmont@huawei.com>
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
X-TUID: QfR+qaJFuNzl

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9617e39004..1166bd8731 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1849,6 +1849,12 @@ FIELD(ID_AA64PFR0, ADVSIMD, 20, 4)
 FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
+FIELD(ID_AA64PFR0, SEL2, 36, 4)
+FIELD(ID_AA64PFR0, MPAM, 40, 4)
+FIELD(ID_AA64PFR0, AMU, 44, 4)
+FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, CSV2, 56, 4)
+FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
 FIELD(ID_AA64PFR1, SBSS, 4, 4)
@@ -3882,6 +3888,11 @@ static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
 }
 
+static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
-- 
2.29.2

