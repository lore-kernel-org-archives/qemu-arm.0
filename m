Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659358ejh;
        Sun, 7 Apr 2024 01:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrGvGcx9tnLF35QXIsLQXZ+U2QbfIqk8ELGdK48X+V4R1gMJCPDPxrOYIUrIJ/LSCePI5WEI1BdLzCdv1SMY6oHUSlvWd+
X-Google-Smtp-Source: AGHT+IHcKjf5sEdz8KBXZHxrKpoJBpDgpJZrpVSl4mt2s3CEG0famhObDcays2OKJ098KhGL4qHO
X-Received: by 2002:ac8:5bce:0:b0:430:bcaa:18f with SMTP id b14-20020ac85bce000000b00430bcaa018fmr6624076qtb.63.1712478095228;
        Sun, 07 Apr 2024 01:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478095; cv=none;
        d=google.com; s=arc-20160816;
        b=XJMkyH7SnWusCaxlUUt3SMvYI/7GEk4Ta4XxZN10rGSmqNUJ8gbES1shtBL6ZZnUgs
         ZjKqqnyFDnE8WvugtQb9eOgY4PcZSYlui/hekOWFbgBfQncLrHLVdaCsniTDv4oHzvHD
         OBPTngSDWdklJgKHRJwInTagKZf3AdOG1mM78QqSBCj9AUHypH/ihpJfH8ZgzZxvLuEj
         N3bWQx+I0M0EXXpP9YuhBRuy48W3XnQSxJ5uNDSALTIABxGNMdeibB53/TmoMHc+3dLq
         BXT/Et5p/ogDFFn3139NZLSsG8EMbVhBiOwKALDVR32qgIhb/bfawTzUz8xglJt1tPt/
         i68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=SElb8ihoIG6wWLULV4VTwt/rqUI9OTULhK1FlzqbQuE=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=MeKnQQcd3TxeCU2BQkN3IJR7N1gX3s326RvO9y8aUrtrHTmLwhXTkDzJjIOfXIVHVu
         5kyDhqQSCHMz6D4Yp9WOq256/v/IHh1dGoycjK4xQGlHZevVU7mDY+KQdOpMR6scoIzW
         dX3dRq6/NbMedQe+OMrL6O8T6r6PN2PXRxsLXKm0Zus8vx+A1rmnkS962iw8vDR78Qhu
         Xgl7Sy5bSRzgtboJ99uYKb01nLTd7+9x9NoTHaauMPT9zaVDdq9HN+pE6Rq58h7i6KV5
         Kn28lDZoo9FjbJ3f8dcyIchnpXvbTUMJ2l95aLjwFLui5YN9PLbtJrqnGcw7dbuMoitH
         UcWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020ac85706000000b00432b6d45178si5857456qtw.257.2024.04.07.01.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtNl2-0004Hi-3A; Sun, 07 Apr 2024 04:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkt-0004Cz-1H; Sun, 07 Apr 2024 04:19:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkr-000215-0D; Sun, 07 Apr 2024 04:19:58 -0400
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VC4nq0j9Bz29dNV;
 Sun,  7 Apr 2024 16:17:03 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 436F01A0188;
 Sun,  7 Apr 2024 16:19:52 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:19:51 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 07/24] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Sun, 7 Apr 2024 08:17:16 +0000
Message-ID: <20240407081733.3231820-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AJonf9LESvdl

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so handle NMI same as IRQ in
arm_phys_excp_target_el().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v13:
- Add Reviewed-by.
v4:
- Add Reviewed-by.
v3:
- Remove nmi_is_irq flag in CPUARMState.
- Handle NMI same as IRQ in arm_phys_excp_target_el().
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b82792f251..d9814433e1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10759,6 +10759,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     hcr_el2 = arm_hcr_el2_eff(env);
     switch (excp_idx) {
     case EXCP_IRQ:
+    case EXCP_NMI:
         scr = ((env->cp15.scr_el3 & SCR_IRQ) == SCR_IRQ);
         hcr = hcr_el2 & HCR_IMO;
         break;
-- 
2.34.1

