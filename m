Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp714705lfb;
        Thu, 9 Jun 2022 14:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrGEhyjA2HVcOJM62VXnAFmvOyyM659xIU6Ryobo3qZNA0ALVaPgiTzan/QLs95+98/x+O
X-Received: by 2002:a05:620a:318f:b0:6a6:efd5:ff0b with SMTP id bi15-20020a05620a318f00b006a6efd5ff0bmr9860731qkb.236.1654810932103;
        Thu, 09 Jun 2022 14:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654810932; cv=none;
        d=google.com; s=arc-20160816;
        b=v+CKGChxdheAKXRC76veniGybjg54ZefPZzE71uQAL+G4PeIR3C7B1b2DBeacuL2Wf
         HdW1lukJ5stTi4TwV0HAA16/r0OqtX4twnVDCqEE8hP0noVNy7CgBEvDVnNSo2Cz61NP
         P6ifFR93wYr4oQzBhnua4G62ZYPnDUYqrlCP8s1m06nOqwKAyGQ7cQVbE7mZAtr4eINl
         X9tWgyKanf2ijfGHAxt8UahZNwehkLXhyW82yCceTRejOqr1CLLV66NdLSgJRq1oPeSR
         idy6BLNrou/w5B5v4xQzF+dDYnlimIv1KRi1cNi+1g8Y5UKG7PEujp9gvw8afeYR1yB9
         w4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=+fhVv/HkKL9POu6/6BiCdonPJbGD2u6DpfYLTcqsi9A=;
        b=Av9bM6Kqn1FW+7Tk8oImxWjv2rWJo8rvd+wbhKZT+22BYx+QAsjr5HSlZt4IEwCr+J
         jkhv0viy3J8QabYM17wBh10WrTlrASaf0Zf02lkB97/886w2wcfy/JmHqZr/NtKyChB8
         S8jwFM+PDXe0F0RsJ8gXyvUwwYCXD5U6zh0TnT8DENmUKr4ggcu96bSyRU8jaWeSeuig
         /6rUkQpB09AhvxI9rkpFfMNm+Hi05mbN+7gxRXt1ZWSMq8na/Ev0t8+NRUoEJdoFghPS
         Uain+ZifvxZR2eQjm/IbwBaw6F3+HN/a/A7AdGLiPcZKRIQLg/cMlpiclvCY9IEfJA5G
         zAdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=fsOH2uzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020ac85b44000000b00304d8c2e4f7si12047869qtw.205.2022.06.09.14.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=fsOH2uzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzPut-0007M5-JU
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GmmiYggKCJEHF2v9ED219916z.x97Bz7F-vC789818F.9C1@flex--wuhaotsh.bounces.google.com>)
 id 1nzPua-0007KI-74
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 17:41:52 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:52216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GmmiYggKCJEHF2v9ED219916z.x97Bz7F-vC789818F.9C1@flex--wuhaotsh.bounces.google.com>)
 id 1nzPuX-0002xz-JJ
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 17:41:51 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 t14-20020a65608e000000b003fa321e8ea3so12292332pgu.18
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+fhVv/HkKL9POu6/6BiCdonPJbGD2u6DpfYLTcqsi9A=;
 b=fsOH2uzRFr5AuJzWP2PvIpv1cuc1OUbQBkPPRx/G+z5BWlGtaah1birIftg7O2vBxn
 0RMUmWqmZ8RmvmPOD2a4SKTCDFxDS1h/A0+hoeHE+LrFTdFlMwTDwBKtWUGsxBOmWsQG
 Y7Csv2jJy0/46cfbLM7cHbH7dTKwi8AR+qxdHCqC3s8xibzjiA2OzOC3lZZcTB4W+LTU
 UG9PknK4X9S1Tvb+QxDiRolL2I/f23JGrczm/FM3sSFvMfyWgaYwiTFW6IaAQ7gHNhhQ
 iOv3EtkvruImxYgA28qbSkDve8pQOHoSrTraFeZg2b1dxrBqSM8VfpGf5eirG+FFt52S
 mWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+fhVv/HkKL9POu6/6BiCdonPJbGD2u6DpfYLTcqsi9A=;
 b=n9ERhpfOe4iq78OOZ7Cf5ckjbV+ew97lY3+oM0Q8rzNs6PszfpVfVe2iMpt1J5ziVz
 xwQC0LCkE4Eny9YsAet4UIENm2pW9v0t3vOorHO5QCfRhd86EcF+EiZZm3DMLDtBtzyQ
 tKd9gr8ntUS76/vd6oHpzcQzuhuDwmWqxNOoLa+5xmmGOb6wp+oWnzaJsGZCel+Xsi+a
 kD+CtXmwRm41/mLUY8XmvE2eYc3vMU7W+x6sYkMCat1WUqTSTzP6/40MTamHYgKaLwK9
 d1k+/m6rPRTVGzysT2O2AUFQaXLWSLxilkiIEHwf3ILb6eJqYqrH8ysHxDozU8MWbLgk
 P9dQ==
X-Gm-Message-State: AOAM530Dm2sT7jOns6QS6SHhNf+kCo1H0RrtowsV9+sxLkKGzQBIg3LE
 L0RVLLA99HThqipR9mH4f6rhNVqGK9swrw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:d4cf:b0:167:735a:e7a1 with SMTP
 id o15-20020a170902d4cf00b00167735ae7a1mr25207966plg.161.1654810906698; Thu,
 09 Jun 2022 14:41:46 -0700 (PDT)
Date: Thu,  9 Jun 2022 14:41:25 -0700
Message-Id: <20220609214125.4192212-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH] tests/qtest: Reduce npcm7xx_sdhci test image size
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, stmao@google.com, richard.henderson@linaro.org, 
 jsnow@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3GmmiYggKCJEHF2v9ED219916z.x97Bz7F-vC789818F.9C1@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6vWLmAt/bnYH

Creating 1GB image for a simple qtest is unnecessary
and could lead to failures. We reduce the image size
to 1MB to reduce the test overhead.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/npcm7xx_sdhci-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
index aa35a77e8d..5d68540e52 100644
--- a/tests/qtest/npcm7xx_sdhci-test.c
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -24,7 +24,7 @@
 #define NPCM7XX_REG_SIZE 0x100
 #define NPCM7XX_MMC_BA 0xF0842000
 #define NPCM7XX_BLK_SIZE 512
-#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
+#define NPCM7XX_TEST_IMAGE_SIZE (1 << 20)
 
 char *sd_path;
 
-- 
2.36.1.476.g0c4daa206d-goog

