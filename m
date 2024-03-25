Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564178ejj;
        Mon, 25 Mar 2024 01:53:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEC4Je6q5peToEJb3KmXJzx/AAp86uBb7HmZLwWLete477SSEiF71KB0pzoOWCfywF4iW6dVkXkecdisA1i2gEZ7k+KLCl
X-Google-Smtp-Source: AGHT+IEWYtKBw503VCV7FXzqaMusZNZDQJZ+l2ZLMTdATTS60JJ9CxPf+1aTlr0l5zlyDCzx4mNF
X-Received: by 2002:a0d:e743:0:b0:611:71f8:ecdb with SMTP id q64-20020a0de743000000b0061171f8ecdbmr1946883ywe.2.1711356802651;
        Mon, 25 Mar 2024 01:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356802; cv=none;
        d=google.com; s=arc-20160816;
        b=cSiaYAJsAiH5chX1DGlFuzJ9ON0qCic4qjh/PuwA5S2tRJz3XxLxieQXs6uU92y4/T
         b23+9QM/obq/aX9A0rJ9fbZNQFBzFoyFzQInk+b4gjV0fOT9Qq0oVh7mXNrd3YNLSizm
         JasTksUKfHgZ5+3OPKzNt6EsXF1ArgMR42oS6OXaa38vHa/V+fwEo72vU8i+0ajE9xPn
         HHbGIm75aC8tSRpcjCAeaW+Lh6iVBobI024d30AK3wieOgshd92vxL4RSxhhcebtNRne
         +8cMz20643fHbaMM0w9GPuuUTJW/HLedcOyzFLarq4veTkywA4LW3uhgjmLGOkVIrURC
         BrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6isEtGqC/xkVhiOwzs1udE8M7np4HLCHPTCpQhwXgaA=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=ATtm6lelrhKYAfkJq3U31HyjOduMTJRMRdjHMeyl1EQ9oXjcd22HOdQSNOUb5e8NKS
         i+ABkhv4oUJkzwHRypK/VfNcyDA7v+98Au2WKsgupdhzepaLrmmo43Q5zcbjfGX5NJ0e
         v04VZIfQxqdeVQ0uMGPJW7pVy2RsZkQewlieK5CO9NGvMVkAOKcJkSGxvuVNV/lgWS7h
         bT31TSnLBDEzsoex9H7Q7TmMht4pwqjxBP8qu81p6Og6DUJjXff/ZfFaP418nYWchctz
         ao9IU7SGk1cVjm5/tI1PY+6vsitXg4zHLCASJq5n7VxxL7wQYuNx9AbduA2EpNKt+nF5
         2ouw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hg1-20020a05622a610100b00430d4cdebc4si4616313qtb.289.2024.03.25.01.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rog4C-00039S-GI; Mon, 25 Mar 2024 04:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3m-0002zf-HH; Mon, 25 Mar 2024 04:52:05 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3k-0007NJ-IT; Mon, 25 Mar 2024 04:52:02 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4V367b3c3rzNmLN;
 Mon, 25 Mar 2024 16:49:47 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 248E514037F;
 Mon, 25 Mar 2024 16:51:46 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:45 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 02/23] target/arm: Add PSTATE.ALLINT
Date: Mon, 25 Mar 2024 08:48:33 +0000
Message-ID: <20240325084854.3010562-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: INpZWBh2ixSo

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

