Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564125ejj;
        Mon, 25 Mar 2024 01:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJQBA2+pa2XMg17MZQReIr2SQbIxlDe7urnu91sWi9tDwaiPquEhQe5VssfXJY5SvlH/8KVa+zC4yLB85puQicK74+2/eq
X-Google-Smtp-Source: AGHT+IEAezUzvGg/Zsb2Nqn9GKZJqakopQVvpxWZdXPCQHHTiLWtY0edELx+OqHS9fqodLBf4g7u
X-Received: by 2002:ae9:f815:0:b0:78a:3eb8:5693 with SMTP id x21-20020ae9f815000000b0078a3eb85693mr6135888qkh.16.1711356794374;
        Mon, 25 Mar 2024 01:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356794; cv=none;
        d=google.com; s=arc-20160816;
        b=nw88/SVntBEZib3zd3cioiu/ByaXEcIDHuqKYpQ9zZ8M/HcDXtV0/oAc57OXK6It95
         03OwjZEG3Zf3BsxS7RJLb+y2e479rIprm3D88teIV2ENJYtRMwrBUY2aJ467r8/mJfwO
         1lvwPWG52L1Kdp1e4jAF90YzBFpK9c0WRI8MMRydob+D3QcxexN3Y9rZVTcv4o5cO0Pb
         stBs2wQkUHPPghOeYCwETU17yb91TVcZmDnO8PUeMU75IBhG+EmpzKk9Q+FQFDrH6CRm
         DMx16F0YiPQO1h/NkrbDqXsP6gW5LtOYv2cOAV54ujS5mf3gLgFBMlr2+Ky4OLhlceGc
         TA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Ow5feWawxVkNN9JX3Uqntt4tHXITGOuC/BC7CrPQZ/c=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=sYCYEl0vB4liWcg2MAgQJa8HWW2KBSh36EuMJlN8fXYmhtCXk66OkF+14GDwnCgO3u
         t7NppqFXARZiveXQfX7wIlyW5Uz1HQ06p+DF+g9y4EDsUk8qf2nMBTlLy+dbAd/bDtcR
         9o/4zeF7sjSCaTBSgOycS92iBGXmzOXGs7xUFn88Vyug2/lS0WNTEx58H9jtwovDAfKr
         uf5pYAjkMH/2ZJbAzN8Sul/BPMnkBxzPZ9G1erIxPYTiZAZ6a5hnTDOiOc/vTD3eestI
         lDpsR4oQzUyJFtQEYToydO5961ZaLP3eSdXsSqdu9tcam4+lYGlnJVHqu3XQvbJ2lSXX
         wkJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1-20020ae9f101000000b00789e232b39csi4798448qkg.494.2024.03.25.01.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog4F-0003Bv-8K; Mon, 25 Mar 2024 04:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3v-00031B-5u; Mon, 25 Mar 2024 04:52:12 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3m-0007PU-OY; Mon, 25 Mar 2024 04:52:08 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V36761BcKzwQ9b;
 Mon, 25 Mar 2024 16:49:22 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 29DBB140429;
 Mon, 25 Mar 2024 16:52:00 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:59 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 12/23] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Mon, 25 Mar 2024 08:48:43 +0000
Message-ID: <20240325084854.3010562-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
X-TUID: L0eSLyQmU3BW

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
index 967e833ee8..eef37b801d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11650,10 +11650,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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

