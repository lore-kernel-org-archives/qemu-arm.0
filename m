Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1602877njc;
        Wed, 21 May 2025 20:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2ISOERpXHw+CyzZ4Hwt3JZGbbS/d+Zc4eS6wrGKN8BVRa+VVu8z+8VJH1iVAtL/7MJovyKuiZfAtc7A==@linaro.org
X-Google-Smtp-Source: AGHT+IHJSAd2OSd417QA2uX+9eNRO9lbTpH5CyciPdIVSZKMQqD7RXAAZy4DDTgXBjj3rN4ZDmb3
X-Received: by 2002:a05:622a:1e92:b0:48c:a62c:7568 with SMTP id d75a77b69052e-494b07e79a3mr356862661cf.25.1747885068855;
        Wed, 21 May 2025 20:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747885068; cv=none;
        d=google.com; s=arc-20240605;
        b=NDb7tr725nYEAUoMuPMYuKnj4KXNQRAcxGMAOMNxBXVHZfFhjH2O7YYq/nVS5A0zmX
         zweXZf0SONwcBRoLakfIcX0ZNvEOatwei7bTrt8cMUFt/Zlfbb4yLY/Zyhw+73Deq+7M
         DW9smLzoW2btiR6zJRPr1ubFHVVChMiOan7SZ1547rNa8kn66tK+oAOn6PmOGFq/0Tf7
         pdaRSsziRlV16bC18PUkeo6tdHiwAPxHyYIT6FnrFHzfA8avgkwHzfMHNvnV+68dwfbl
         JZbK0jT6eE7a9U8MD+R41bMqQ1QrSw4JMu4Sc+mcdR6fC1jsZZgmiL8mGBW9KkuQ2Yhj
         qxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=yqZQkF7fyoCyixWqJvPrcSXLF7zDV6t9Bf+U6Pb/AUQ=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=dBt7k0JEiqFIBNzd9dF7mdc6JSGbDk+gI0+IgarcqjY11Ujg8mxq4GWCZD4L6OuQcf
         S9m21F0gkzo1FCb0Re2OcGr/63Ty9IyOal77+Y1pvzItEzkj5BxsQfSr3tYrVP7qE7Ra
         cmzeFSlIlrIgvGqu9uI0NBgykArHw/anxACjK6r9B/d8sbZR8n+0WeLKlhMAUwiZ+Rzn
         qmC8ZQy6suS456o5CHMGHVFVFgaGu4RKLis4mCyfPALYArXikwQrFSaRxwK/0oQOsjZq
         59l9ufDbdr7yX2rXYuDCnZYEjw54HJz8o7yMx3yn5e4ZDHayoop4oM16MBXXiA+oDFSl
         kpXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494b1d3614csi146347281cf.617.2025.05.21.20.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 20:37:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHwk0-0005pd-VB; Wed, 21 May 2025 23:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjw-0005nv-8H; Wed, 21 May 2025 23:37:05 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwju-00047S-Nh; Wed, 21 May 2025 23:37:03 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 11:36:30 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 11:36:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 4/5] hw/arm/fby35: Map BMC memory into system memory
Date: Thu, 22 May 2025 11:36:27 +0800
Message-ID: <20250522033628.3752086-6-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
References: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: JrD4Mp+5nseQ

Add the BMC memory region as a subregion of system_memory so that
modules relying on system memory can operate correctly.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/fby35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index e123fa69e1..c14fc2efe9 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -77,6 +77,7 @@ static void fby35_bmc_init(Fby35State *s)
 
     memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
                        UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), 0, &s->bmc_memory);
     memory_region_init_ram(&s->bmc_dram, OBJECT(&s->bmc), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
 
-- 
2.43.0

