Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1602907njc;
        Wed, 21 May 2025 20:37:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWNR7sceQ9zX0F4rM1GrafCWNLknNFqQ6ldBQVOuuXvwfOksBxQtRPV1/uIvvC2jxsj5dDQ9oSRc3p6w==@linaro.org
X-Google-Smtp-Source: AGHT+IHNX1uKan9lHDeLA+7bqD2yYlFwzi1kYKK4BKZ1rcTNpf7mF0Wln8VH0yzTIJ0yr7pOgnMP
X-Received: by 2002:a05:620a:280c:b0:7cd:b58:f4b0 with SMTP id af79cd13be357-7cd4672d90fmr3504901285a.16.1747885076067;
        Wed, 21 May 2025 20:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747885076; cv=none;
        d=google.com; s=arc-20240605;
        b=CnDdVwXLsRbbzo/3fGXgvk9OY+3MLB5kMeKxXTm72E3NaqjkM+4GEsTteRgJpmkwM/
         KHGKyBPXRhMytPwC41kw2b7kg1t7GgSijWRIGY0ZAwMNeRnvLLhgWVwhqhjUcE6DwB0/
         Xhk/6egKuidav+zxuF121Vj0evbgpHRzxAMY33KqqjAXLu5DibT5RbFNa1aSQ4sv1ytP
         dMNiKSJfFXhZEooLqCmO5esKv7RLvpLAw7Ys8d6rOjLEfMH+bgi9DU2/IbKu/7ONXyoD
         aEtp6TV95QNSLTvcG24aBVFOFoJ9gKurNVxUURwp7ceACnnc6qJPgsV71+Z4sbNmwW0E
         uT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Lgytif7lwepofayhLCbnW38quJSRwsllpPmMdW65U6s=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=XEKp+0YVfxzt349Dg7O8cffuJh/xCLYXxy+Ps/kd+2wATsAgugtdQFNYkdyokTzyB2
         7hpj4z/lL8RfdbQrFkIb2EtILL41VGxcxyFU1UINGMwIgYMhsAHTedLS1mWFWzWOpDdE
         LKE5PbrQvLUWSgbbNne0XeX636O0DaPMiNdWIHQW0k/Y4xVTaAJ8hSL4H0Q9wBgVOXnM
         fN6Ch/LTy/T+DjZJK+KTlwVcK3OJGDIOuc4zYSwJ9RBth4ScIZnRK8m165Jp4YYH0HYW
         v7/haDiOgv/rYLHD6Hbi7qYNZZWDfxEq8l92nCUunpkGtbm5VSLwk3Q2Gq9pEuZe9kBu
         kUhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd4688808fsi1473916885a.271.2025.05.21.20.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 20:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHwk0-0005pb-ME; Wed, 21 May 2025 23:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjt-0005nA-NX; Wed, 21 May 2025 23:37:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjr-00047S-Pq; Wed, 21 May 2025 23:37:01 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 11:36:29 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 11:36:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v3 3/5] hw/arm/aspeed_ast27x0-fc: Map ca35 memory into system
 memory
Date: Thu, 22 May 2025 11:36:26 +0800
Message-ID: <20250522033628.3752086-5-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
References: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sUEkCToou/Xi

Map the CA35 memory region as a subregion of system_memory to ensure
a valid FlatView. This prevents failures in APIs that rely on the
global memory view, such as rom_check_and_register_reset().

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0-fc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index f8cb632bca..7087be4288 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -68,6 +68,7 @@ static void ast2700fc_ca35_init(MachineState *machine)
 
     memory_region_init(&s->ca35_memory, OBJECT(&s->ca35), "ca35-memory",
                        UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ca35_memory);
 
     if (!memory_region_init_ram(&s->ca35_dram, OBJECT(&s->ca35), "ca35-dram",
                                 AST2700FC_BMC_RAM_SIZE, &error_abort)) {
-- 
2.43.0

