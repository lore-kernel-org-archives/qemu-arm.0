Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320381ejv;
        Sat, 30 Mar 2024 03:35:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXkPkjYZIv7fw0TyV+l3bSKAQUsrDT5CUziItYvkg0HVMMElrbuhFTlGqO591lEU3+Saat7aH4S9uSidkbQXvMOW4WFuLV
X-Google-Smtp-Source: AGHT+IEgXjequf4kmcttD0E0i04/2vL0ldmqQPXEY0athu9kT8Nu42Tx3MaQ5YFlv9IW/fR+fYg1
X-Received: by 2002:ae9:e114:0:b0:78b:cfdc:b0fc with SMTP id g20-20020ae9e114000000b0078bcfdcb0fcmr2510586qkm.21.1711794900566;
        Sat, 30 Mar 2024 03:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794900; cv=none;
        d=google.com; s=arc-20160816;
        b=ekrwsuDw3bc3y8Y8IPY9cG3cNcMZ3g0Ey1NZPBoVaVP5CO9cjJY9NCZ/iDoJJK2yMP
         pMe0MrVgeLy+vpG4aXt/j89UW2cz/xcVNgYbFuUSQuEuiJaUx4azf5dMAjBgGq1XTZpt
         fuEfGLnsE5eIOkC9ClEhruoTnmv50hZwIID+ORrxy96y+AwnCdRvmdh1ErmpA4xSMW9i
         bBC/QxerCqGVZeZm7fbVI29xkNQnR/ONamKPUHuJJIPtPJ1YHP61fAkljck4JfCihXoQ
         m84vJFqFW9JvyRt07FrYGpI/bl3sbzjdbdCNipGNKDFoGhwOPiVVv3AmggOky6GiW/vi
         U9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Ow5feWawxVkNN9JX3Uqntt4tHXITGOuC/BC7CrPQZ/c=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=cMaXl9vp+C6JTCBnZ4ccLQ7WeYQRS8LSP3afVLiDdu5Jq6hpoFQkZHGdmWxT67zDSQ
         z8dizVNY2H8vDGYdiFrCllJWXOxjMEmSdLK0Uo45+6ThiTEAzHyUykyPqzN7OY5Jujn5
         a9FZrD/cZk44Hq2XEpd244zHm40Y83DUR4ED8twOKKkVn+AImJTuI3vPUV8japY/xHUO
         r/1NGAf+ZHVC4bM8RXg5+L7QPZ+/uahhWWALqBFRWtq+yuxKBv9WWp7vjyT324oLE2JI
         wnibwzqrhhQUnjhCkXELy43E5IxUq5Yid37yiA5moeXqCa9uOMkMh5jdrevpcs4tORCH
         JJgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21-20020a05620a451500b0078bc1d1322dsi5097580qkp.484.2024.03.30.03.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rqW1M-0000L0-Ig; Sat, 30 Mar 2024 06:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1K-0000I8-1Q; Sat, 30 Mar 2024 06:33:06 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1I-0000oo-He; Sat, 30 Mar 2024 06:33:05 -0400
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V6D7H2pD7z1R96M;
 Sat, 30 Mar 2024 18:30:19 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 1D1551400D3;
 Sat, 30 Mar 2024 18:33:00 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:32:59 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 12/23] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Sat, 30 Mar 2024 10:31:17 +0000
Message-ID: <20240330103128.3185962-13-ruanjinjie@huawei.com>
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
X-TUID: 4rm2zdBlD4z+

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

