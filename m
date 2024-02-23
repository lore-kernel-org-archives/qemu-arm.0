Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475197ejf;
        Fri, 23 Feb 2024 02:34:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURJCBc3nlwpXLoiQ9YUJZrt7eBG8RIL5ctzEgTuJ31cK4hD6UG7ZqHbcCA6hZBKoUv2tBhgMmYLishiffVH32MTx8i+JSw
X-Google-Smtp-Source: AGHT+IHwjc/CqmUIjEE4rJkHniiXTtTqeIVkx3csuIm6NWrvA4EBjfU76XP1Ecx81mQLYK/4e8K3
X-Received: by 2002:ad4:5b8f:0:b0:68f:20b0:5b25 with SMTP id 15-20020ad45b8f000000b0068f20b05b25mr2240460qvp.14.1708684484184;
        Fri, 23 Feb 2024 02:34:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684484; cv=none;
        d=google.com; s=arc-20160816;
        b=LhkiZvFrJ6+1l9vwpNevi5LJJKvaE9F1c3mkXiNh+gHz+VXJihl+jS3HwHrkGiNi0P
         asoT5AbFC/YV2S12D8W/LqUsDc5aIEvAamqWRSE9l1uIR96YOaw8WuUwDTuxTNFOkMqU
         w3HOSKTPXDSXApO803EIgORYJSWA2UxTkWClP+lTlzIUiH3izW/N5SI6nF4UucntZAZ7
         Ehs9St4ktOfiM4ZbB9tfpAvRnxHpwzSaaoMbwWL1kfhWMRRj1DBmU+etS3mvdWCrd+3Z
         2nEFeCS16aM797r4Fl5AfMaoIfzPTE/QzLrBllH3yC9rJhUTmWzCO5PjutBFKSibYxKQ
         GB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=mdNU9YFFw5Llfho2iM3bX9hNk6RZRKQsUB8WmjzU7N4=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=wF7wgxpqVKw0cZrbDTovOzhBxG0eK5p3Hk/2WZv991Mr9ah+z8qoDC0kuguw+ZaEPX
         u8Z++eyvYz7CNzOKGNoHDFJydQ9gI4Ck0x5r8b5dtuSRakFHtN0HZfLj99uGcgJroYlz
         TBSkaWhJswB4o0VeG5ZW7R0f8PapzSE4nPYmz/tHDemrMiIWRONhoBO6tHWWlhqtZIV4
         tuN7sMU+bPha3avPk1yVAlFlGiE3G4I3LIAAJHVaZBxnur7RuyVTv35P+p3hVR1BBIJh
         nUUtgDJ4DiedeIJ/ACCYM85UZIgXLIJyki3TEdTR9gVdZHiU4/i+JdUS/HA+sunfwAvr
         UxFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a0562140dab00b0068fb26a9f72si4393665qvh.447.2024.02.23.02.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:34:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSt9-0004Bg-9d; Fri, 23 Feb 2024 05:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0003at-GA; Fri, 23 Feb 2024 05:34:00 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsE-0001vP-HX; Fri, 23 Feb 2024 05:33:50 -0500
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Th5v21Cx8z1vv6b;
 Fri, 23 Feb 2024 18:33:02 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 3128918002F;
 Fri, 23 Feb 2024 18:33:37 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:36 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 03/21] target/arm: Add support for FEAT_NMI,
 Non-maskable Interrupt
Date: Fri, 23 Feb 2024 10:32:03 +0000
Message-ID: <20240223103221.1142518-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
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
X-TUID: ejSGOga15g61

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

