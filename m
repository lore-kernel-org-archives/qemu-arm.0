Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564605ejj;
        Mon, 25 Mar 2024 01:54:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUM/0dNT0BjPSOa2EU/zoktvOUcYNz+Kyq3Dr9gntF0FmyXYZWRtzBk+SPj7sYVrSjEGJp7Sv0QKf6TPXTWkIQacyHUBKRh
X-Google-Smtp-Source: AGHT+IGFBFENYdQZiOD4KHgexH1vTpxvx2aPCt89bGf8w/gkIrf2sqPXKBMUmmUrWUmF1RbzO1hz
X-Received: by 2002:a05:620a:228a:b0:788:776a:bcfa with SMTP id o10-20020a05620a228a00b00788776abcfamr6130802qkh.74.1711356880552;
        Mon, 25 Mar 2024 01:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356880; cv=none;
        d=google.com; s=arc-20160816;
        b=o6hj/H/0qKyh3VGQLyV64AgQ7C7P1njv5yPOpDJAVLeSks+6aVKoBJQakryXaaeKl8
         6rbbkuwJ8OGUGZcZ/k+lKn+0xsqPkjcUCLQGTqE0QL0c2q53+FO41CIGZqNLaKNbSSKE
         ANqwSdvaMfGRRjdF4iSqPFJnWlI/3btOMdp3Sh90ts51oiuA3vUuM0QXY58zTahTXivU
         oXqKJzDdcsM3Qlidz6LUVlssjXkxchjimrSZo/8BjQjJMLD2hXQ0LIcfquU7n6C1KegK
         ed/3xDZpx9vhV7/xE9Zoj+1PkTvlIU0PJ9yM0Fk21hvZrI1/2pEKe623SXq4Bm7Vsn/7
         6tCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=nH90myY92tVLZCTudcrh/aorpntNT7/cn9CHteTr0rA=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=f8um5LRcW5Em+XfYTpGFbd0E0xIJQQPlUzUTR7jGL2UiX4q0gEuK+yF320Zgzqqomq
         xO1F8GOCNeZThD3y8oJTn3Q+MZq+YlogV7Uwi/Rs2G3aBOLL9cmFliwkSjdKUZzCqbOa
         9vLJrh6MlVBYt5gU0pTqc8UE5gMoHAUVLjahPmRrcEc2ruztbDZou4wwgqT2rVwpOzRv
         3SpbkqWkM1veDKUf+pfs9oM21HlWHjUjYO8hqol4eswNdjrC1Wi58Qxw4UPrZEBx1UAd
         uqGeOHnLRu+5RBYcbH6sey9EYKH7kAxw/bfli4SsJyz8dJsSlMkd+LIiR1K4/AwuJv3O
         3SMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020a37ef16000000b0078a23d6899csi4881029qkk.533.2024.03.25.01.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog4Y-0003QC-6R; Mon, 25 Mar 2024 04:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3u-000311-9t; Mon, 25 Mar 2024 04:52:12 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3m-0007Oy-2e; Mon, 25 Mar 2024 04:52:10 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V369X671pz1GCjR;
 Mon, 25 Mar 2024 16:51:28 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7311C1A0172;
 Mon, 25 Mar 2024 16:51:57 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:56 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 09/23] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Mon, 25 Mar 2024 08:48:40 +0000
Message-ID: <20240325084854.3010562-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: MBrPu69SmkHD

Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
SCTLR_ELx.SPINTMASK bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v9:
- Not check SCTLR_NMI in arm_cpu_do_interrupt_aarch64().
v3:
- Add Reviewed-by.
---
 target/arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b57114d35d..967e833ee8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11730,6 +11730,14 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         }
     }
 
+    if (cpu_isar_feature(aa64_nmi, cpu)) {
+        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
+            new_mode |= PSTATE_ALLINT;
+        } else {
+            new_mode &= ~PSTATE_ALLINT;
+        }
+    }
+
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-- 
2.34.1

