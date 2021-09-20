Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2421260lfp;
        Mon, 20 Sep 2021 13:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOAUWPBRAwCPsffLxY+mZ8ochVdavScerydgrATdNlBD1OdqrP+IDT9C9/GzXXthdyseFS
X-Received: by 2002:a05:620a:49a:: with SMTP id 26mr3582218qkr.443.1632170390125;
        Mon, 20 Sep 2021 13:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632170390; cv=none;
        d=google.com; s=arc-20160816;
        b=eVL+M5rcpYf12zT+QRWae7kHnda1DSJl1ue0UGvL9wVGwzlq7bV3YcYYEik93EwHP9
         XY6qMOa7eoVL4uPyN3hfZKIh6mBtZdUkqbrRi1jsEza7XYvjhRNcfiHcGp+AoYxslSsd
         oFVxZzk0VaELPpjQSPTplS+22Cmm7wX30NGrBPBa5eyNvM93KIQllkAaUBJ30d2Yvf+a
         PUyTE5f99CzkMaGZ+G/dRDF029SQL/BNtG62IEBo2TC4ugTyYybINgc2Anal84dsrbcp
         i6L0TkrhTf5FnhY42qgkSOezexDhoONwOtv6UwxWzX8oBViSCitunUmQ8FYyBfLSBUCc
         Ef5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=GLi+amZ+0LAdP9d5DPBY33ENkSjqeNk05BM+2AB1y1M=;
        b=Ve9GA7Oy4UAZS+P/q1ReXZi1vGopk83PtrHnUTYI64g7nLwDcb5JXdnpuDQdiNXOuA
         +1JRFI8lhjhVoYW7W8KLJ8/+KmcExsZb1GDrhu/+/M0/zZB4ms6xt9WZhoRa6altkKYF
         bXdE8jEVco+Y5Kwlg6/gQhLF9GPGWNlv+//dAdHQIn5t5e3X8ZLnt7meuZqhxgFSs9U7
         UxPPYDClyXHXQ2KJKWoKvQx8LbTxx25WDzEWY4Fv3YZ/4blwGJjtqWEQJo6X/v6jjJc5
         8+oSQhQ9auuXHzeBRaIaK2+Fynagkwj0oWXX+SwtxFhWkip4Ep2NeVeDSGq8lPULG8Ro
         ZAAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si8986552qvx.151.2021.09.20.13.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 13:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSQ4r-0008CC-J9
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 16:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mSQ4g-0008B5-0S; Mon, 20 Sep 2021 16:39:38 -0400
Received: from mail.csgraf.de ([85.25.223.15]:53656 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mSQ4c-0000aV-Lm; Mon, 20 Sep 2021 16:39:37 -0400
Received: from localhost.localdomain
 (dynamic-095-115-125-107.95.115.pool.telefonica.de [95.115.125.107])
 by csgraf.de (Postfix) with ESMTPSA id 71A896080333;
 Mon, 20 Sep 2021 22:39:31 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH] allwinner-h3: Switch to SMC as PSCI conduit
Date: Mon, 20 Sep 2021 22:39:31 +0200
Message-Id: <20210920203931.66527-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Gs3Gyodk0wd

The Allwinner H3 SoC uses Cortex-A7 cores which support virtualization.
However, today we are configuring QEMU to use HVC as PSCI conduit.

That means HVC calls get trapped into QEMU instead of the guest's own
emulated CPU and thus break the guest's ability to execute virtualization.

Fix this by moving to SMC as conduit, freeing up HYP completely to the VM.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Fixes: 740dafc0ba0 ("hw/arm: add Allwinner H3 System-on-Chip")
---
 hw/arm/allwinner-h3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 27f1070145..f9b7ed1871 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -237,7 +237,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
 
         /* Provide Power State Coordination Interface */
         qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
-                            QEMU_PSCI_CONDUIT_HVC);
+                            QEMU_PSCI_CONDUIT_SMC);
 
         /* Disable secondary CPUs */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
-- 
2.30.1 (Apple Git-130)

