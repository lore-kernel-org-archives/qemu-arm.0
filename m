Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320087ejv;
        Sat, 30 Mar 2024 03:34:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2JSDOgbmwuB2F7m+9Ii80K9zpYklsKCLRYvFi3d6HCbhp3SuYSt3VBbax2xfQkl1CXIz8m0YlMAD2ORxgy06v7Ddf3xL4
X-Google-Smtp-Source: AGHT+IGiovdoA03Us6Qt2kNhBJvrc+EbvJ6yEFhv9GFO7ERRMd7BIzg7GBVmVcDkbDK4JT74dEh5
X-Received: by 2002:a05:620a:ed1:b0:78a:41e6:55a2 with SMTP id x17-20020a05620a0ed100b0078a41e655a2mr4048434qkm.37.1711794853712;
        Sat, 30 Mar 2024 03:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794853; cv=none;
        d=google.com; s=arc-20160816;
        b=ECx3YlNNSQJcixR6aTJ9ahigCa7WofdAGIeQ/64tRYVUvcIgYLkK2yTnwL17dbyv92
         F/Y0B2RYRwHx2u63nZU/QDpG93LrN14ZAbgyhZWDQqzqmdh4Xm5Bk1qw0ZpKgIVGwsFl
         Jcb8VBkXz6FQg6nsAw7cl0LKuPkxiKo8ncU0RyhMw5CAgiXoUs8DAHbW3lx31IMcFIV/
         wMdnFKyCyQJnTWI8a4n4wk7V0P0UP8VXyWWCybnYv5OB1QrAIIpWvgxUhpWqniZxRr1m
         4zZURfNaQnkOrhMlgbPjkh0bBy6WDQEMTplOFj633NohGzFPc/3YMZn7UcoPx7JV+j7W
         xZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6isEtGqC/xkVhiOwzs1udE8M7np4HLCHPTCpQhwXgaA=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=L3ckLl1/6Lmq0pqI7QeHstUFYBnD8qvcP3T2ZOZIvPfLh3HRHnaZRYU5jBluhLfIej
         Npfpk6QQyLKLM0hc73TPZxQeA8OS2cLJENXiRRze8PLVJ8N8kQqqipjWjY72EUUeJbQq
         GEMv4Tkejevz3pzJsNw9FlwU64peB2YfUpk1+FR+cJwn9ggoPLXxfaTcOMI84W7/Rtup
         EhEF2m3rEz6igs6GCFojeWTAHT1ccFWxdJ+BgbRSC7pV8IjXS2Lp3nHPCl1GaQP/j2L5
         nWFU5Jax4gdvxaqyVq4QOUCRTfzgk65WyzQz8VGRAZfrcZVEjX//pXOxFIr4+RZsbxXx
         wWMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn10-20020a05620a2aca00b0078bbe55a5aesi5126559qkb.258.2024.03.30.03.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rqW1J-0000Hl-31; Sat, 30 Mar 2024 06:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1F-0000CW-9R; Sat, 30 Mar 2024 06:33:01 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1C-0000jG-9C; Sat, 30 Mar 2024 06:33:00 -0400
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V6D763gJsz1R96V;
 Sat, 30 Mar 2024 18:30:10 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 00696140412;
 Sat, 30 Mar 2024 18:32:53 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:32:51 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 02/23] target/arm: Add PSTATE.ALLINT
Date: Sat, 30 Mar 2024 10:31:07 +0000
Message-ID: <20240330103128.3185962-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ibg8Ag4VqM9O

When PSTATE.ALLINT is set, an IRQ or FIQ interrupt that is targeted to
ELx, with or without superpriority is masked.

As Richard suggested, place ALLINT bit in PSTATE in env->pstate.

With the change to pstate_read/write, exception entry
and return are automatically handled.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v5:
- Remove the ALLINT comment, as it is covered by "all other bits".
- Add Reviewed-by.
v4:
- Keep PSTATE.ALLINT in env->pstate but not env->allint.
- Update the commit message.
v3:
- Remove ALLINT dump in aarch64_cpu_dump_state().
- Update the commit message.
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bc0c84873f..de740d223f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1430,6 +1430,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
-- 
2.34.1

