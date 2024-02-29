Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp373726eja;
        Thu, 29 Feb 2024 05:12:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkIdtEF0Y9iIzkM39JGMbBxs6qEGqifL3UxsZNd4z+I7MtGOD0dEYJctWO2koDOedAjer/EcJBNQjtsr+3YaIYVLDgHD8/
X-Google-Smtp-Source: AGHT+IGPjEHLADZKi3Je5072zdoM3St2Nm2wY/e9+PZulAqA+oUS3Ra9bq/XXKAD7EH1hGDQEFwK
X-Received: by 2002:a05:6214:18e6:b0:690:4506:b38a with SMTP id ep6-20020a05621418e600b006904506b38amr1955716qvb.1.1709212359101;
        Thu, 29 Feb 2024 05:12:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212359; cv=none;
        d=google.com; s=arc-20160816;
        b=utLD3HiAA1V2blbvO5+HNGdxG/rv81lEanpYdub5Oh2IaH895R6x/MTB0LvGwhFeOE
         bXJrdalalAJl2RqPVcS45Dynw5oecOItk3GV2BNRDcRMLaQBcYphqZbI+lxg7Ipg1NfY
         k3FYe4WHWHpaHiU0psVFxg0B/60IB6y7Gon1fUzO0ciga+X10s359DaVkDw6B0TVFvNZ
         5Zmtynb8aTOAA1DUeiZjabACb2YN8cQi9CryA5idQYFkuhLKj3lbHzQXdIl7b8sVMfVg
         ZofeWjlhBcYRpJoHOwYi/+LTQhZ1hwGuO4zekhthmkt2XwxabgHZLQfCWI2mo+GJIAzz
         gMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=wAKUqxCBYvw9eDsYzm0O1Xm70fDB4Eud7U37jXd1i2Y=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=DiTBu7zMEntOAGTjZM6C+TxDDZVTaENCi0+K4lnhZ392UG3zoioNl2ObJHroah/Fya
         gf10tRPtaBPnO/V52nyhY9CG/x4zdiYvdqKF1L1XGxC7GPVrRIXsbuLN1mQreacmhQ82
         nTT9Wwg/DChYP9vthF7XUd9PM6Oay8gdbGkpU50uejxsVNy5vffNuYsDOpkY0c5fyf0T
         WW7Jy3EFZTGItgIRcd9rgTIb3N5Kc6+ks1JKkIBDa6+LtEm4TIvz0IfUzHlRZIZ2BTIs
         UtH1+sWJWHjWEvffi1oERjoAtdWFhPBFEvH/861vCz3Kkx+XXwfb7Mr46itM0k5Au57F
         pKfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020ad45aed000000b0068f765ab5c7si1274686qvh.292.2024.02.29.05.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:12:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfgCh-0005hh-Fz; Thu, 29 Feb 2024 08:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCa-0005Zw-JU; Thu, 29 Feb 2024 08:11:56 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCX-0002ek-Iy; Thu, 29 Feb 2024 08:11:56 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tls4v0vRzz2BdkD;
 Thu, 29 Feb 2024 21:09:35 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 1977C140390;
 Thu, 29 Feb 2024 21:11:51 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:50 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 12/22] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Thu, 29 Feb 2024 13:10:29 +0000
Message-ID: <20240229131039.1868904-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
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
X-TUID: DKRRvs0n7Def

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
behave like IRQ. However, VNMI can be IRQ or FIQ, FIQ can only come from
hcrx_el2.HCRX_VFNMI bit, IRQ can be raised from the GIC or come from the
hcrx_el2.HCRX_VINMI bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Also handle VNMI in arm_cpu_do_interrupt_aarch64().
v3:
- Remove the FIQ NMI handle.
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b796dbdf21..bd34b3506a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11459,12 +11459,21 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         break;
     case EXCP_IRQ:
     case EXCP_VIRQ:
+    case EXCP_NMI:
         addr += 0x80;
         break;
     case EXCP_FIQ:
     case EXCP_VFIQ:
         addr += 0x100;
         break;
+    case EXCP_VNMI:
+        if (env->irq_line_state & CPU_INTERRUPT_VNMI ||
+            env->cp15.hcrx_el2 & HCRX_VINMI) {
+            addr += 0x80;
+        } else if (env->cp15.hcrx_el2 & HCRX_VFNMI) {
+            addr += 0x100;
+        }
+        break;
     case EXCP_VSERR:
         addr += 0x180;
         /* Construct the SError syndrome from IDS and ISS fields. */
-- 
2.34.1

