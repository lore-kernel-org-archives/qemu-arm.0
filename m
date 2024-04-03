Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484579ejv;
        Wed, 3 Apr 2024 03:19:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQb/AvwZIJ5ri+qMZC2/DvwLStOnXBIFMEjuMQ2Hn+MpXODd+WD7Nhb4beQZju1g7oi1pMeJOGKUKVJ5e31/6ZROlOx1rb
X-Google-Smtp-Source: AGHT+IEaZy1Ew97ul/G3UYC5zOdQukZIHwyGieAG2fp9qP2S1ePMBbeRMis1QNePlMkYfBop8QRw
X-Received: by 2002:a05:622a:1:b0:434:45d2:43d9 with SMTP id x1-20020a05622a000100b0043445d243d9mr481186qtw.45.1712139575998;
        Wed, 03 Apr 2024 03:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139575; cv=none;
        d=google.com; s=arc-20160816;
        b=Q33cK9INQs4gaHlQIXKBJ9eDXsscpUddlAIaxMK7uj1TprgOuixqyAyLfQlT3DrOxh
         jw/TccFNotRyhezRR/Ctfu8kptBlXM+sThyec8sKj5SPw5uaz0SdFI4Qj2SMSf3v4Ol3
         4m4HFz0y/z+2QvQ1MGBKvi0zzTEWlrmtsBErVPPfDhxB0ID/ey8I+MwHLimogsBACe3f
         7hd2szimUJBH4pELQoT+kySSDGEdyDMeUDXNlKaiBXtoO6mi72sccJYpGxLrL2ONAdK+
         muv9Nq8Mk2bMzBne+/uJMURfVwI4poN59CwvZf/XAnu7BZTrHutxXIYs5j+hLUfCutKU
         Btiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vZsW8G+RtRILClrNkfcK6iYYEWfTs3Cih3PQNWOAH8U=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=FuFFcU8aJkgcYPT6ldQXXTDqjX2PEOEgzqLD8u3rY4A6hEQ2Yxq6tF+gHXPpO6TP8H
         9rGaHk8bHm7XAyPkWoR5EzmDs+MgKahysWSfJ96enEUJjIHFNYJRlm8+PqAho5IuPR+3
         vjs2+i8ZdVmZlomvjOtSQ2/1mfbnRkY4NSqqT0At/Vkwpgl9SEspRGk1NcODiQGZuubj
         Bcy/mYfNZjnRGpyvTFvJAgb9bvAjjAVmRye3GmFpz8oVOvZm8MObLHkRTo81jxqqYmec
         OC7t3Wj/bfKOnk+21Z/U1cvO0l4IUIzkRpwciZXt2iqwhGCelZ1rGeM/NyOTWwK1zgVn
         moZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05622a164e00b004312a4707cfsi14050093qtj.710.2024.04.03.03.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxh6-0000yS-LD; Wed, 03 Apr 2024 06:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgx-0000sW-5m; Wed, 03 Apr 2024 06:18:04 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgq-0006db-Nq; Wed, 03 Apr 2024 06:18:02 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V8gbp0RXxzwR46;
 Wed,  3 Apr 2024 18:15:02 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id DEFAE140F81;
 Wed,  3 Apr 2024 18:17:49 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:49 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 12/23] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Wed, 3 Apr 2024 10:16:00 +0000
Message-ID: <20240403101611.3204086-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: qp9j7uoMGbFF

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
behave like IRQ. And VINMI(vIRQ with Superpriority) can be raised from the
GIC or come from the hcrx_el2.HCRX_VINMI bit, VFNMI(vFIQ with Superpriority)
come from the hcrx_el2.HCRX_VFNMI bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v9:
- Update the commit message.
- Handle VINMI and VFNMI.
v7:
- Add Reviewed-by.
v6:
- Not combine VFNMI with CPU_INTERRUPT_VNMI.
v4:
- Also handle VNMI in arm_cpu_do_interrupt_aarch64().
v3:
- Remove the FIQ NMI handle.
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 65f2ddfa56..0455f20ccc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11649,10 +11649,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         break;
     case EXCP_IRQ:
     case EXCP_VIRQ:
+    case EXCP_NMI:
+    case EXCP_VINMI:
         addr += 0x80;
         break;
     case EXCP_FIQ:
     case EXCP_VFIQ:
+    case EXCP_VFNMI:
         addr += 0x100;
         break;
     case EXCP_VSERR:
-- 
2.34.1

