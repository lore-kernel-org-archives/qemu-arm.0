Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp272482ejb;
        Tue, 5 Mar 2024 19:59:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUg6N0nzHtwXCv40OQgbwHJD+yNW5IDoM7sa7ELe9H+J/z5OPew5HlWdpXiH2D/O8V7idGsy65iuViWJ3U468zt42IohksM
X-Google-Smtp-Source: AGHT+IG6p3VJafYxVXjA9ghPtbhnDaReZy0PL4I0LnYbOKPKhF3gD21sqzXyGY4Ciss0b+kt6/iX
X-Received: by 2002:ac8:5f46:0:b0:42e:6b2f:e7 with SMTP id y6-20020ac85f46000000b0042e6b2f00e7mr6541696qta.26.1709697585462;
        Tue, 05 Mar 2024 19:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709697585; cv=none;
        d=google.com; s=arc-20160816;
        b=blCkkO5pNJ4aexPrwXLTksyyNAIzx/TPa9zRjUbhxlOBMcLcNn/I4uNoUiQIzDs0zL
         CK+TFAfwtLkFI1znZJJa1EqWhzejsX2XK+GSQeuOg9jpeXJjKWfhg5CUktsyIFi6mhYN
         66h2dfLhfJAR81KyvPQlgCh0nQZdQ/+wdAJi6uhuKAM8VR+/9/s2ULY/O9iGWgHh677U
         e+2NW6qymqqnblC63QMPkeRJID/daEl+f6kUyqjWHcXW7wEkmvwGf45i9xaRq/DNbVsL
         OBTIzAumY8QrgnVfFyoJoyGYZLU5RosbGtaVcTo4muil9UCVKIpqDnC8SE8QRefkbTHd
         epvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=SFd0FzKVIily9tuo5NGY2oR5RjxOZt/wtm9FgkW4V5c=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=BPTrP8uBFAgme6KSrif6VBO3PlRu0aALDe7EAFjKJEjwEva3wClUjZH3cbkN5TCRv1
         OSm6ABCJiwpdCyZx5UZh1CLGh2Ky9hpF0ru8M7nI6KyLFEVtwxbZECQoF0mNCG5iiyIU
         lvVOQcEnANaTd0VyDvlRSY3T5glkbdJy3KbI78QM7Eip+0/wgDZXzgdGiObTQlwGUVec
         EywAyqMhMyTBDFq6+hJV9O5rkPA8nA66UyVkik6SQO+KO/cotdnyVJXoqcGkbpQ/dDfz
         dquS4w4Zk/PdMQIMRsiAlWo+5kCVnQWRQmV0GbeVZZEuR2zMQ2YNUNTd/HDQNjDzHoOX
         x20A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020ac87c52000000b0042eec5de503si7119512qtv.155.2024.03.05.19.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 19:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhiQQ-0000pB-DP; Tue, 05 Mar 2024 22:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQO-0000mq-I4; Tue, 05 Mar 2024 22:58:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhiQK-0006kF-Vt; Tue, 05 Mar 2024 22:58:36 -0500
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TqJWW5txJz2BfMs;
 Wed,  6 Mar 2024 11:56:07 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id AF2FB1A016C;
 Wed,  6 Mar 2024 11:58:28 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 11:58:28 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v7 02/23] target/arm: Add PSTATE.ALLINT
Date: Wed, 6 Mar 2024 03:57:00 +0000
Message-ID: <20240306035721.2333531-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306035721.2333531-1-ruanjinjie@huawei.com>
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
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
X-TUID: wrWKND9E7wqH

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
index a5b3d8f7da..9402d23a93 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1536,6 +1536,7 @@ FIELD(VTCR, SL2, 33, 1)
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
-- 
2.34.1

