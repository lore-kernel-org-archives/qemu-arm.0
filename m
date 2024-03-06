Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272312ejb;
        Tue, 5 Mar 2024 19:59:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbpaW+mqgYNVhd4Cat26KgE27DZCYpM/7f6doNzrvk4UnY9GKrdJHUmrnypnywPrDJ1FvR5isAQqxQrlgT350oEHPZz+MD
X-Google-Smtp-Source: AGHT+IF7+ua2UT1kdjY1fFiRNmm4r+Jd+N194K7/3gYvkinc97iuQvbtxmcESncaRAT9yM2sabGg
X-Received: by 2002:a05:622a:185:b0:42e:f01e:84a5 with SMTP id s5-20020a05622a018500b0042ef01e84a5mr4049576qtw.67.1709697547607;
        Tue, 05 Mar 2024 19:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697547; cv=none;
        d=google.com; s=arc-20160816;
        b=vCaOBlMRVu7vJ0ECYOsOmWi2TV3wlBPGyWUF2UqYpBxRrrfMTH+KBQSMQXqdrhGyyK
         Q0o6b/CRKD3YzY67cGWV/U1URU7GI9N9HtxkWOqcVKevyGKcvibUMpa7OHk+t9n6QJYE
         REC+sK50Dlk5VuiT5sxu4AShb+K30DlUrO9A/ELpsavJJCUMzpvVwK0WRXryZLqqAYAX
         S3vqnpjwBCvgAI401mE24VgHCyYG2Ag/mOn8r+q61cACiW9MISBRS0uP5xX6ngOyMxHI
         LbriCbTvuFIncZf7ZUf6TvSr2P7Uq3gX6qZPnjbMux9fF2SwpvExFLJ853dqLrfDAPpS
         Kruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=oXHvZSSa9h+8Mz8DyfJrbjvNrGe/5sl/5TlgD5fXzlo=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=O42GpwrGCAqKDXUlljKoXN5ehbaU28szAvyw7XPvrRFts6gVv8g6y6YTsUZtAXDlQm
         b7J7aAXC+o8VN9P+9kjc8zmlkvLkHktp2TlC/RL3qhIuaQ9wNNDK8RwOWrgFQeRlR6i2
         +QjOLSoWqOZKf4FGSumP90qWahXR41NVg3akW6yKNl7CYXihJWNupkM5kAUoLuPDMnHO
         bqWBOjgIH6Vv53BmLVK7bjnB2m1NnKdQw480Ji5OCcw4URTg8UQSE67fv8I8+uYxD0Re
         PY6ed7Lefs8gwYGysKs3VW8BHtB+86YrSX1Hfwv/lo9h/PiwGebEt4YKgEJyWJdW9tDv
         THug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020ac87d83000000b0042aaa53f36dsi2066983qtd.573.2024.03.05.19.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 19:59:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhiQO-0000n0-Jy; Tue, 05 Mar 2024 22:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQN-0000m5-1P; Tue, 05 Mar 2024 22:58:35 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQK-0006kG-FD; Tue, 05 Mar 2024 22:58:34 -0500
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TqJWX6RpJz1h1C4;
 Wed,  6 Mar 2024 11:56:08 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 9265B1A0172;
 Wed,  6 Mar 2024 11:58:29 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:29 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 03/23] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Wed, 6 Mar 2024 03:57:01 +0000
Message-ID: <20240306035721.2333531-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 8l8UfIYGOMYt

Add support for FEAT_NMI. NMI (FEAT_NMI) is an mandatory feature in
ARMv8.8-A and ARM v9.3-A.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Add Reviewed-by.
- Adjust to before the MSR patches.
---
 target/arm/internals.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 860bcc0c66..980af3c1c1 100644
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

