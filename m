Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2038577ejb;
        Tue, 23 May 2023 10:29:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47rodnau4ljb2hvGPJM+n2xlqKwOy5DCr1FBb0IogrMqK/bOizEGLsRripvzjOHfeHQWGM
X-Received: by 2002:a05:620a:147:b0:75b:23a0:dec4 with SMTP id e7-20020a05620a014700b0075b23a0dec4mr4600295qkn.66.1684862963988;
        Tue, 23 May 2023 10:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684862963; cv=none;
        d=google.com; s=arc-20160816;
        b=oDmMT4q/oE6wR39RZs3dNE1oytWcDxeRzjp8ZKssiqo/y49M8IjEno0WDu+lzLCipa
         nzJeCh5Ke0ujAGhq26828/uLPh7PBYsPKLnznF57ZAXmsNMHKbafFnU4hEnF+VaOBs63
         SJLYzfLZmQiQUOqLwHkKEWcn6WEOoZdUr3IgSHoK3nVfHV+eYfvmFMJMeQnWdZ6px8k5
         3ZaKXu2vnvbWT/oiBrYV5Q/XpBAzLGyKCnNCh6rTTpDcvSaANSyd5tw5De+PKWDuO2Nf
         hmsPiKJV2ps/OUgfdifd/l7Io4OMKz3QZv+nVZXr3wYnnLjkuRC5wduOpBE7XB97cs0Y
         yzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=pRJlzK0ZGD9ZAZw/HEOzb2gMD94xAylCd8I4Dpvi3eg=;
        b=VtwOamaVt/o+NR3lzVeKnyBZss8SB5w85LOm7Cg6V23wxt9wWMPx103mcDrviNwK/O
         uOmQbAybcTbsUPWz4/XWyhWFENBEVwxyKE0JGn3Sg+o41K9ehsQd02w8Dxjm6H/8pe6W
         1HosIZudFzfMyEkGVfezWPcHPH3jJHNDB0y9ZP4TAMq9AKkfvxEGKCZAUe9dVqKun4U6
         XWGhfMjtZ2/sUz0tHcuzgAHWoOJhvBip2sWhL8dYNsanTWbPjD7N7NVFrJJvPZSgbuvm
         1o+8DG1nL8S7605hlGxyPIpArFzGzh8H0PCaEot9i1YbgtTwaBXz/7GzAjSfGqxiLZ6k
         vC5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020a05620a03cf00b007518941ffd6si5194563qkm.52.2023.05.23.10.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 10:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1Vor-0001ig-7V; Tue, 23 May 2023 13:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1Von-0001h6-30; Tue, 23 May 2023 13:29:08 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1Vok-0006rk-Js; Tue, 23 May 2023 13:29:04 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 080AC260B85;
 Tue, 23 May 2023 19:29:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5HIjaARCmwv; Tue, 23 May 2023 19:28:59 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 91C69260BC6;
 Tue, 23 May 2023 19:28:57 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 3/3] hw/arm/Kconfig: sbsa-ref uses Bochs display
Date: Tue, 23 May 2023 19:28:55 +0200
Message-Id: <20230523172855.679018-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523172855.679018-1-marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230523172855.679018-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: gOGXb4UrFjfe

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0f42c556d7..4484de67e8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -249,6 +249,7 @@ config SBSA_REF
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
     select WDT_SBSA
+    select BOCHS_DISPLAY
 
 config SABRELITE
     bool
-- 
2.40.1

