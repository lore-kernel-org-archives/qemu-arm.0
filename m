Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1721995njc;
        Thu, 22 May 2025 02:17:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXdrevW8jqEFQRyPXNKu5Qs9QsuXICnKNSp2Wp1gUzDHVtBDcnOfeqdNv5pGQ24rKE+TGJEz9qdL4i6w==@linaro.org
X-Google-Smtp-Source: AGHT+IEbncRWvZLJTv4K1x2l7qqxBUqmGK8fvjf0NFrbwJUkgLA+OUZpa25WbJYiLqftnwuMplv8
X-Received: by 2002:a05:620a:414e:b0:7ce:c603:f054 with SMTP id af79cd13be357-7cec603f16bmr1664226885a.56.1747905469869;
        Thu, 22 May 2025 02:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747905469; cv=none;
        d=google.com; s=arc-20240605;
        b=WrIU9pJbS1eyfqfpqy5HKvRHJ00u1hPZujD0afY+r/Ph5YKvivFxCjuzYF7qCqrxnC
         MsdXJZ2vmU6qMacF0nnm4uijcIySeBFbUtWo0WRdpbmMFce7rhxy9amEkyRNT0wJWLOF
         xN/bZxsxtNH/7vNMj+aBxghyvxUaeYoI22x75ck/iyD8v3FzryOHzCdN38jhz2XH4T/D
         A6XzbnkxCw9S8r0TRH+l9Oh668YXlS1hH0HgRSMMFeZZ9wlVG9B36pZ7RUNLl4frSMfC
         FgUCcMc7G9b0Nq+FbrzjEBkj9wjfBjt9eLrIOi5PPDCmqL8gG5rTZX8/A+C9YB49aBm3
         HMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=s1xtxPQfH1EvsCv1iBToWdMOTyKcHNBChuY4C17hlLM=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=IFQGXyTmLqj7aOVNjgh4kt478OqRMrvAF13GLRHlWBEtNrJX4MWRQyoWLIQQmlzHXG
         F0tUl7+Xp6XL5AaSZvp/U7x5ybGdwJupcZmdFLyeVV1XGOsccr1zMnJBm03RBnq5VYUZ
         OKwqxZCvRb8FiwTJJLqPC7hIZHXq/zmBMvhu8GKtQPK5zibdT1a1uzBY0l1T88O/UhJl
         0vWuRdUS5kVeFz6B6zjcvNLDPREVP+JvVpuz6mtkAx4p5d8f8fIJFbOHmV6kTPWGqTFM
         9nU66Ck4ddpLrOBhR8mBHW7h8IVRXqOw3mOvAY3TPeEQSjTd/rFeoLmeJ5mWIg9IU/sp
         BnsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467cfbc9si1264368485a.37.2025.05.22.02.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 May 2025 02:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uI23K-0006bw-Sr; Thu, 22 May 2025 05:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI237-0006Zt-Gl; Thu, 22 May 2025 05:17:13 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI235-0003Jw-Sd; Thu, 22 May 2025 05:17:13 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 17:17:01 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 17:17:01 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v4 1/6] hw/arm/aspeed_ast2700-fc: Fix null pointer dereference
 in ca35 init
Date: Thu, 22 May 2025 17:16:55 +0800
Message-ID: <20250522091701.354185-2-steven_lee@aspeedtech.com>
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ct+ECkRIcOEI

Clang's sanitizer reports a runtime error when booting with
'-net nic -net user', due to a null pointer being passed
to memory_region_find(), which subsequently triggers a crash in
flatview_lookup().

Root cause:
- Missing NIC configuration in the CA35 initialization.

Fix:
- Add nic configuration in ast2700fc's ca35 init function.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0-fc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index 125a3ade40..7bf4f2a52d 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -86,6 +86,13 @@ static void ast2700fc_ca35_init(MachineState *machine)
                                  AST2700FC_BMC_RAM_SIZE, &error_abort)) {
         return;
     }
+
+    for (int i = 0; i < sc->macs_num; i++) {
+        if (!qemu_configure_nic_device(DEVICE(&soc->ftgmac100[i]),
+                                       true, NULL)) {
+            break;
+        }
+    }
     if (!object_property_set_int(OBJECT(&s->ca35), "hw-strap1",
                                  AST2700FC_HW_STRAP1, &error_abort)) {
         return;
-- 
2.43.0

