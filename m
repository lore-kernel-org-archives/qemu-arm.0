Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1722081njc;
        Thu, 22 May 2025 02:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbo8SkyTU9u1CB2tkHCxd51q5AGInJkmz4u0zpL4tm5zLPmpp4Tv5Ki2qDgzsHsp9vB9f8ormmHbweJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHcW8IxRXSY9Yq76BF7EzjiHmQCOG/2s4mDIPKQp9FckBTVdRnosOKn4IfKtOPQ/DF9p7Mt
X-Received: by 2002:a05:622a:590c:b0:499:36b4:6886 with SMTP id d75a77b69052e-49936b4692fmr201524921cf.40.1747905480206;
        Thu, 22 May 2025 02:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747905480; cv=none;
        d=google.com; s=arc-20240605;
        b=BXrnvEsKbF/LJutIKQtOIExNgrnN+C4neVphQXLf2TPUOQTAgsVDGI6QgzysqIzeKI
         vJNE9mRkWR1OBOpwsRiloU2JEPrwF+w35zodDjWoOg5cTNuaM2RB1bl2lv9e7Hac8jV0
         KyakrVviLmoSb7qhaQ7fmoBe/AEbAcwVDp+dZsyvC2u0fbgt76AdCM7+D/ki7tzihet0
         HhQg272Ofdy/FCRR7hsZP1Fz9YbkPkfyuZPIFrxoShF4oS8Linq+hP/lduYnyX7PzTSR
         Mms+i0vdIVNNqf1oYGiGOjRyzVfZSTS1IgcyNaxYPXqSr9V+4aGL7QwWDvCkAVnUWIv9
         j/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=wI7bfTygocHC0XGUEuBAkYiBlWrU4gsemXAVCoOFUfc=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=jJNjZQ/Nm7e1sqq347Y7iPjEK+SpeSaEK0j7TGwukiZy1Lfl//VXWfhhV5Cv0EnqyH
         fZzX3Zrig/0ke9kbSGI5z3aZ6KOF5dvpCM0aCzXu+KWg2edLe4dheHudFJWgIQsPxsbI
         YPm+w2zM1weNW3TL6eNKdrqTMt1ExUK4uUUUgKN7CZDDor72mCVKYrcg9HtAIUeTg9kz
         lrmMQTxJYaXmE+4ZYgMqYm48b7ms6+BIRbYoi9/XkxVay4b4RtsFDM2J+/4H7Zoc8mbv
         8Zqwf6R5LMoKSPge5iv6rq18z/TMO0qpjsHQ+qPf5o5cxtiIkp180MA6iuryvbp/dhW/
         ArtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40c630si155511671cf.127.2025.05.22.02.18.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 May 2025 02:18:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uI23K-0006c6-Rq; Thu, 22 May 2025 05:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23A-0006bC-2L; Thu, 22 May 2025 05:17:16 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI238-0003Jw-Fc; Thu, 22 May 2025 05:17:15 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 17:17:02 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 17:17:02 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v4 2/6] hw/arm/aspeed_ast2700-fc: Reduce ca35 ram size to
 align with ast2700a1
Date: Thu, 22 May 2025 17:16:56 +0800
Message-ID: <20250522091701.354185-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522091701.354185-1-steven_lee@aspeedtech.com>
References: <20250522091701.354185-1-steven_lee@aspeedtech.com>
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
X-TUID: Q/zpQjyy8bGg

Reduce ca35 ram size from 2GiB to 1GiB to align with ast2700a1-evb,
where the ram-container is defined as 1GiB in its class.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0-fc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index 7bf4f2a52d..f8cb632bca 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -48,7 +48,7 @@ struct Ast2700FCState {
     bool mmio_exec;
 };
 
-#define AST2700FC_BMC_RAM_SIZE (2 * GiB)
+#define AST2700FC_BMC_RAM_SIZE (1 * GiB)
 #define AST2700FC_CM4_DRAM_SIZE (32 * MiB)
 
 #define AST2700FC_HW_STRAP1 0x000000C0
-- 
2.43.0

