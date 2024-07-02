Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp2375213dlb;
        Tue, 2 Jul 2024 07:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXj5cFkQm3gqxPhDmPkLIHyqsnHii6I2DtR/0WeUt35YozQP5zi7K1Yc5gZT+zbSfGNKMf288wKS/3ebbpKMn9a9g4FrLr
X-Google-Smtp-Source: AGHT+IH/4EKayC/mO7b+03VAC79kKq0CwI+OnDGaToHc7FttX4lJS20oO8NT18c2p/WzB3CAwqz7
X-Received: by 2002:a05:620a:5812:b0:79d:55f7:2536 with SMTP id af79cd13be357-79d7ba8bcbdmr937183085a.71.1719929585080;
        Tue, 02 Jul 2024 07:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719929585; cv=none;
        d=google.com; s=arc-20160816;
        b=jtzeNdtdEtTCs0iaPDdhQXJlXHG7CakEKi8QnKC7+RvFcL74fVf/DFPPX2uSsJmcjH
         lYYkcZaVtD5KF5AYLlznleZb5x5NSyWjKA2AtuHpK3XSiq6fx1V4RyFPFnNQKCUxugyC
         4Gjn6S3y19JpN0PLvqk89YZKkh2fWa9yRACguoO2mlLsa/FYQ7Ir0v6P97PzQOw+5Oc5
         PdDYeW3LrVpnzSipqrqx7glp1E3PxG0BekAd0seQNvbrs7xAKfVYt08+KJMZ1e3wCzP5
         DlAMrsNx/Xp8IiZJr8yGviJNHcY2RUO08+V3Y09Pj292gIF0etoLWx4JMG6fhRMR0bMT
         BLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XWggSwLJ6RlaYPnvt8r7pYn4BtA1ozuqT1p3WRkPS7k=;
        fh=Ltmo1M0cbBlwZZT9wU9gQIKc0R/WeSNL65apJZOLKjs=;
        b=zm2E4BtnJ87p+8VtpvFanBJ/Hr4KDn9dTVidu+bY7VAS0BiILoHId9QNMrYP7akr86
         Z/xsqtrZQlQCHcTW+iEQEswfOZQ6Eo+kkiY/icef5xNHXFNicJRZgNg6i5+j3sKEtClD
         1P6uLnHN2WCbJzn9zBOOU0C2i+fh84bxtFLuUrVZnGgeR8W6/W/WqqofCLt8H9AAkezl
         0diuIEw9N96jTgL759RyxlzQYC0E8PjctvfzIuXfk7rcd73Q85gw1aK4c9Y6b3yEcWZA
         MqYimr1xTDptQHKMMpYhQWj0m5EyxRPuRG7BrJwEpltm9jOdQPpXNv23EG2Nyn5iatTG
         cANA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tfFlFu5N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6933bdb4si1143546385a.667.2024.07.02.07.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 07:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tfFlFu5N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOeCG-0006cE-JS; Tue, 02 Jul 2024 10:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOeC6-0005ra-Hy
 for qemu-devel@nongnu.org; Tue, 02 Jul 2024 10:09:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOeBy-0008Ih-TO
 for qemu-devel@nongnu.org; Tue, 02 Jul 2024 10:09:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4256eec963eso30021385e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2024 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719929348; x=1720534148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWggSwLJ6RlaYPnvt8r7pYn4BtA1ozuqT1p3WRkPS7k=;
 b=tfFlFu5NY7YgN8x6JsTLpST44yoW8/ClOoKyPv4pYCi6ZFfXo6waeDo3B83y+UxJnW
 yCKxLOR4PdESBte0J3GGLzcItjjXbvEiNeMWe9+DHZBjHcI1hGxiWCPwZ543DZu3ipwD
 Yss2MEdpEK7f8xIaZX2VhdTGtpv6lcx+NOQLri3S8Gcwy4jXZRMxPrlrPaCkRj5jptNm
 Rq+3IfR3VxBNuapi9FX0Y8bNMUv6ek82fClhMbTsYfIGp3lucd7GaZfaKJlaSSYQXYKH
 f60dJa4APgkkjNm24EaA2b9MF7FyNQEBt01mG3VqYfnYanwSbIKj9mtr3GGVfyg9n3AV
 kcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719929348; x=1720534148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWggSwLJ6RlaYPnvt8r7pYn4BtA1ozuqT1p3WRkPS7k=;
 b=c9BziYTAAGQFF01vOo3zKbfj0w7sq8zZ75BwIKPn35j9Ukm5V01DweOLoT9XSfvvUg
 Oe7s9FpZ4XUBM1HQTW2U6RpaHlaRgSF+EGo6P0gBQnBtRC8F1vL97E8fQSwgBKUsFYc5
 fMQs5ayOJYCClZOu8ETZfJ+Tzy2aykm9bBbZU5LfGJUissZlmZ0RPpM/ke3D9qjsGAR0
 Tpim0STORlPT5RDSMsnbvG7265tw/Y09NJlLu+3UizM/cTAAXZxh3p/Fr+qe4AnBbTzO
 SGeZgzuCUl6BISqtGM8zToiz4EKiyak6bJ7TjtS3Hx1XimH+SwaXNtDSMWd4feGXI+IT
 Okzw==
X-Gm-Message-State: AOJu0Ywdys+XxKpD6bwc3P2IXwkkO8SD0+eE3chYIgK0M9tRZoZyd7kv
 HUgqMxwZ8S3yjO7d2xda5rZ1x+lfZ4x19eM4IdK/AJa/hzpMsI8LBdAJLlN8Zp0Xd9wmq09Inmd
 G
X-Received: by 2002:a05:600c:35d6:b0:424:e04b:88f9 with SMTP id
 5b1f17b1804b1-4257a02c83bmr62402145e9.3.1719929348204; 
 Tue, 02 Jul 2024 07:09:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b061eedsm191171385e9.26.2024.07.02.07.09.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Jul 2024 07:09:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Laurent Vivier <lvivier@redhat.com>, Luc Michel <luc.michel@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Patrick Venture <venture@google.com>
Subject: [PATCH 3/4] tests/qtest/npcm7xx_sdhci: Access the card using its
 published address
Date: Tue,  2 Jul 2024 16:08:41 +0200
Message-ID: <20240702140842.54242-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240702140842.54242-1-philmd@linaro.org>
References: <20240702140842.54242-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q52B3ms6+Jc/

Currently setup_sd_card() asks the card its address,
but discard the response and use hardcoded 0x4567.

Set the SDHC_CMD_RESPONSE bit to have the controller
record the bus response, and read the response from
the RSPREG0 register. Then we can select the card with
its real address.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Cc: Hao Wu <wuhaotsh@google.com>
Cc: Chris Rauer <crauer@google.com>
Cc: Shengtan Mao <stmao@google.com>
Cc: Patrick Venture <venture@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
---
 tests/qtest/libqos/sdhci-cmd.h   | 2 ++
 tests/qtest/npcm7xx_sdhci-test.c | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/sdhci-cmd.h b/tests/qtest/libqos/sdhci-cmd.h
index 9e61dd4944..90efa028ef 100644
--- a/tests/qtest/libqos/sdhci-cmd.h
+++ b/tests/qtest/libqos/sdhci-cmd.h
@@ -22,6 +22,7 @@
 #define SDHC_ARGUMENT 0x08
 #define SDHC_TRNMOD 0x0C
 #define SDHC_CMDREG 0x0E
+#define SDHC_RSPREG0 0x10
 #define SDHC_BDATA 0x20
 #define SDHC_PRNSTS 0x24
 #define SDHC_BLKGAP 0x2A
@@ -38,6 +39,7 @@
 #define SDHC_TRNS_MULTI 0x0020
 
 /* CMD Reg */
+#define SDHC_CMD_RESPONSE (3 << 0)
 #define SDHC_CMD_DATA_PRESENT (1 << 5)
 #define SDHC_ALL_SEND_CID (2 << 8)
 #define SDHC_SEND_RELATIVE_ADDR (3 << 8)
diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
index 5d68540e52..01f237a816 100644
--- a/tests/qtest/npcm7xx_sdhci-test.c
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -30,6 +30,8 @@ char *sd_path;
 
 static QTestState *setup_sd_card(void)
 {
+    uint16_t rca;
+
     QTestState *qts = qtest_initf(
         "-machine kudo-bmc "
         "-device sd-card,drive=drive0 "
@@ -43,8 +45,10 @@ static QTestState *setup_sd_card(void)
     sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD);
     sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41 << 8));
     sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEND_CID);
-    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR);
-    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR
+                                                    | SDHC_CMD_RESPONSE);
+    rca = qtest_readl(qts, NPCM7XX_MMC_BA + SDHC_RSPREG0) >> 16;
+    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, rca << 16, 0,
                    SDHC_SELECT_DESELECT_CARD);
 
     return qts;
-- 
2.41.0

