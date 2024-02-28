Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp109771dlb;
        Wed, 28 Feb 2024 01:32:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYIQfrVcUEBDNdYZWanolRHefqrwPSzkxDllN9nONCoNDctCNuEv/Df0XPFl7CxVTKyXByEhlM4C1QZKGaMoNaos67qs+h
X-Google-Smtp-Source: AGHT+IEZwAFUZWTzF6WUWrhwQWJXmfCnU3623RfoM2HPgn/D1w/lzaT7RW3ZANW7ciiOKeRt2eiW
X-Received: by 2002:ac8:5bc9:0:b0:42e:afc2:22cf with SMTP id b9-20020ac85bc9000000b0042eafc222cfmr913334qtb.5.1709112744790;
        Wed, 28 Feb 2024 01:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112744; cv=none;
        d=google.com; s=arc-20160816;
        b=MNkDmA3B2IBaiDvO8uEAQA4eHBSCIB8Rx1QPiso68GP+GUQJtTKvQYXAVWIVEj0+tD
         gUMfdFIn63Pp36bXT0fTJD+dkyohTMd85bfhKQKNKO6Th3ohQY+ql1r242seY8m7o9V+
         w+kvs8wAehsW5VYYp3K/e0fbybMs+3jMVAk3nH2RLcOJOyt3/CmwHKQKZ5D+pJ6IEnx0
         tLR/db/iOn/cdULz9EmTZ71Jj1Jr98t+sRVpoi+1/84igmuws5fJk9oskKORiJmNjz8b
         PFw/3WkM+QXtDHvnwcc7EparZGsCwm17msFhrNQX8qEEasGFl49rRygBkChdwRYM5ueB
         jkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=wAKUqxCBYvw9eDsYzm0O1Xm70fDB4Eud7U37jXd1i2Y=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=y9HQg18wEWxp6FcuBDfMsjvxBXW6yPcbxdd7ydCsDV6pWe0odHzWzi/ylEU/iLelKY
         ATHSBIDY5Ch7/AXd3Ye71uKQCfETBu0c24UYjurcYOm+hE4QXdS4rn0WXVaO2ra+ui75
         ei6sV82gQeRlrzQRNRJdzmeesq//fT6hy+VMti3vTKlU9CAcVfsWknf/x/s1MtmE9Oiy
         baAkWoI7PgA2ajItY4HJ6Ik4LuFsNG7z6AVrIUDaAfp5M+t1pQTlHVGH0+VMTXp3Wqyp
         Jdwvp54DmzKyNg6F5uzNqxhxzij7J6cEsrWKSJKTkyVpg57obkV2OW3/99RYE44zHtSx
         hxMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9-20020ac84609000000b0042e5a0d43fdsi9035412qtn.251.2024.02.28.01.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:32:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHg-0001K3-Qe; Wed, 28 Feb 2024 04:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHS-00015T-KX; Wed, 28 Feb 2024 04:31:17 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHQ-0001sS-Pg; Wed, 28 Feb 2024 04:31:14 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tl8DY54Vfz2BdxK;
 Wed, 28 Feb 2024 17:28:45 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A5C0C140383;
 Wed, 28 Feb 2024 17:31:00 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:31:00 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 12/22] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Wed, 28 Feb 2024 09:29:36 +0000
Message-ID: <20240228092946.1768728-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
X-TUID: N6iDY8QDSEEr

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

