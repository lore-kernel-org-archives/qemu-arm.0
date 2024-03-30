Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320225ejv;
        Sat, 30 Mar 2024 03:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqJW+NvBz1nQ/YPYOaa2cgF7gVFNHptKXGI62nDSZEXRf6BUn96sdm1dDouFKTduFN16mNvOjYsLQdjzRsbc5vMGbZ4Zf1
X-Google-Smtp-Source: AGHT+IFMIxEa7UCjoCTHoYXZdiL1P1SMOiw47EFzMO9QXeaqWl0Pjyabe9tWIQBe3Nzejld2B/b+
X-Received: by 2002:a0c:9a91:0:b0:698:f39f:841f with SMTP id y17-20020a0c9a91000000b00698f39f841fmr3297600qvd.20.1711794873153;
        Sat, 30 Mar 2024 03:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794873; cv=none;
        d=google.com; s=arc-20160816;
        b=OsX6Ql8aKw+U367p7NbXzvd288GaByDjG3r1/Y0LZQv9EJcB72/I8vPkshfjCbgr9D
         uzPxTwruoQWnfpoMm5rVrbFCE32Z0s2qP7+nwWqijJmr5Jd2fjS23mFuE50OSIr9vxs6
         gFCIBPYVkg98ATsDQoSR6pOOYjzUCxD64t2ErWGMZDtu5HoMaACJMFH0VlTy3SzBs8ar
         NFP4LiM4zoRUS4Pn8/rnpgRRPON5X5f+8pxH+X/qPZuRmUtnJqzYMJQOLMBpKWKIr59O
         RREuIP4gaelugyLVGLJsbjDIRDR099bFrDHvfZi0F7L0/zkVfJYqqs+ssiv1OzxPQ459
         wKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=nH90myY92tVLZCTudcrh/aorpntNT7/cn9CHteTr0rA=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=rrzPH0k5d4SB485Mii/WxARbMx9gp+TY2hELHGkf66XSgtzNNptGguPAQvEQb0GbNb
         LppanxwjR37d38c/U978znOwF0vNDJdabrtEonfcayYKYLn+qtP40wqzvBUOhmoncBsX
         59WUZ1QRWXcFgjgQpV46+wk5pN9qcDS9gdc10eedWi7uEli76pjJAZ3oTrCkOx4o/bme
         LflIoPU9pKtlt23fVrZPEgzA0pJUuFNmv/lDXmgUjUjKB24WDPColVRsJLEIclXu3l+v
         tmQYwOAtz40txot9sOpDEaw4i0wpOjD8chHpvFerQiy5PwSVF7NAwPgCmo6QJqWriuLE
         GWcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a0cf685000000b006969e68dcccsi5334691qvn.86.2024.03.30.03.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:34:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rqW1I-0000Gm-HQ; Sat, 30 Mar 2024 06:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1G-0000E5-NZ; Sat, 30 Mar 2024 06:33:02 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1E-0000l9-MG; Sat, 30 Mar 2024 06:33:02 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4V6D7x2y5YzNmlK;
 Sat, 30 Mar 2024 18:30:53 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 894FF14037D;
 Sat, 30 Mar 2024 18:32:57 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:32:56 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 09/23] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Sat, 30 Mar 2024 10:31:14 +0000
Message-ID: <20240330103128.3185962-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: j8J8/mLt+g60

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

