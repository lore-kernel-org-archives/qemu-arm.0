Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2479684ejb;
        Wed, 24 May 2023 04:33:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DKYTBdKYy+gbGzU0zqOQRxls2CSPULp3zpS3JbCXlUwDN8IwfDmOlvL5QdiDoViLdAdZj
X-Received: by 2002:a05:620a:3998:b0:75b:23a1:833b with SMTP id ro24-20020a05620a399800b0075b23a1833bmr6165159qkn.54.1684928036227;
        Wed, 24 May 2023 04:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684928036; cv=none;
        d=google.com; s=arc-20160816;
        b=djN+Y4XxOdRSqS8/4XKwwS7P1kEzzbY54nzq1Y/eZjIlVrvqiDEJOoc5CYZA9wMzmj
         dvPVvTR/Jlcb+0CqwV6kupPKDgnd9PaosMni2c7K1yzjkuV2+Tw4vhBBf8oSIFCKghli
         DCgvOD/mXKk1kQ3xzOwfKjUaDBigo/yGYt/nm2BGcftGATA8VGjXexU/2G4pzkXMbgkl
         Y/nh6hmS+b/oPEz7Bm3/FbDCLZYC32/NpLeEQAwM82u33jKVmW2h837Opmj9T8xw7epF
         E1VpAIazl3UcFXk0dkH+QdejdaeJIH9HI6PxgtfRUZXi4865+t3WWqI9+6Ob7uWfzkev
         lttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=YEpGmRg5GUnndxj6u4yWHcwoKuZsUGvxmxfvfo4Bl5M=;
        b=1LSRP9+j2acqo2QMhhGaXFugBnzWI2KrrXVhj28oXLnzPVICg/hVyAuUrG+XqE5UEd
         lkOF4k3uIskh0UxH35jLxSiR94PMLPjklCxP7dKWVSCKJX1+0VV9wzi+Ys0UbKYDsEtY
         /1PMmX2XIXj9rLI9OGyORnkX/+QpRIdR+fOdyglpcLV3LYxaoVLGuU9na58YIMZ37g8g
         r3P3h6thDdWy34bui4yRqaqhDP+oau8hJZe4tq0HVGdDyg7JBYRDMWDi0lDjFIpiCL8k
         VOg+jor4+3n2O7/LQWzwpzeVSjnpSI+rzu0Wrz2uMJtUjqRnXeglDo0xgHjCRsdSbDpv
         RgsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pa23-20020a05620a831700b0075947ef3256si5882206qkn.719.2023.05.24.04.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:33:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1mk9-0005tM-PV; Wed, 24 May 2023 07:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mk7-0005q8-Bh; Wed, 24 May 2023 07:33:23 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mk5-0002Wj-Jv; Wed, 24 May 2023 07:33:23 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 8B2B9260287;
 Wed, 24 May 2023 13:33:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcuFo9atqBPO; Wed, 24 May 2023 13:33:16 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7C2CD2609C0;
 Wed, 24 May 2023 13:33:15 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 2/4] docs: sbsa: correct graphics card name
Date: Wed, 24 May 2023 13:33:07 +0200
Message-Id: <20230524113308.834675-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
References: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0hBE8lI+GACV

We moved from VGA to Bochs to have PCIe card.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index b499d7e927..016776aed8 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -27,6 +27,6 @@ The sbsa-ref board supports:
   - System bus EHCI controller
   - CDROM and hard disc on AHCI bus
   - E1000E ethernet card on PCIe bus
-  - VGA display adaptor on PCIe bus
+  - Bochs display adapter on PCIe bus
   - A generic SBSA watchdog device
 
-- 
2.40.1

