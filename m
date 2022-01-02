Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp9952183lfb;
        Sun, 2 Jan 2022 14:06:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyih/FCiOKCM3mT17AWTsql0Y8ZJ1l761BiaxIC1Jofqi5kMZ6RQ0nS1TLpA9AitUFxbnvB
X-Received: by 2002:a25:d9d1:: with SMTP id q200mr43190325ybg.309.1641161204627;
        Sun, 02 Jan 2022 14:06:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641161204; cv=none;
        d=google.com; s=arc-20160816;
        b=lmvivW8dC+gOmzf0N+Qo8eFlJATcNqM2u8br+bcFDaxGTPyoi4d/i5JcDOkfS1Eed2
         2eat04nnnY2fuL2sTkX6cnMija+gloMv3nbrJ+9rMShfABNd4SuFOQ3nMfmBm5G3b483
         CaoJ1RXJlmBWcoSIJ++sgtZYyDF+vqDW1PxxwsCpPMvCYLzo3R6mn0dvFAOw1Dc4rqS+
         FL99Zvfdk0WBGygrMVgaXaqeUwauS5ceacxSe+7tJQhHXuG9rv3vhkMj2exDZMRrUPbi
         wessnX7UJagkWRMNAKNM4D7G1sk/S6PIHmTDWpO/eGfosr5GAQm77HIucz9+69SojY/e
         FnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=f6aHV+RQ8g72pXcMcalu5La7wzKW07c0b6pdNRtw5zg=;
        b=Yi9P635vBr7SvGcgyHyiRHcWsP2q4Y7sEpzMBIRZcDoZoWQ+QwwFp8QqVDzKdR9owo
         6K9TibgAb/6EVTShq7i5NGAGJuIjeqUZyBJWMGZzNwsqMeyoB+kxgkUtLhFpKvMGIiHD
         f9DsCHhIf2uKHx5WKltvWGyS62Osdq9kIBfkZPTRNleXf7zhKqByC2ilb1vqW7Lb1RQR
         DMUr8ZHKsdmrcpHQMza217IFEivUKqg7sL57Ojgi9J3FeZwMc2DvD968DaiiNxRsaREJ
         Zt8Kn2voMFVqpFo2bGGDVRkzTKZedvR1mhbxvCFISgC7TT33vmgCnGhOs1w9cyE+bx+A
         AOwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=aSMQdpId;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y127si23996523yba.189.2022.01.02.14.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jan 2022 14:06:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=aSMQdpId;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n48zz-00013v-U6
	for alex.bennee@linaro.org; Sun, 02 Jan 2022 17:06:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3QyDSYQcKCOAXGPVWTGIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--venture.bounces.google.com>)
 id 1n48zL-00012n-2u
 for qemu-arm@nongnu.org; Sun, 02 Jan 2022 17:06:07 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=37869
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3QyDSYQcKCOAXGPVWTGIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--venture.bounces.google.com>)
 id 1n48zJ-00068h-N4
 for qemu-arm@nongnu.org; Sun, 02 Jan 2022 17:06:02 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 b144-20020a253496000000b0060bddc72114so40174590yba.4
 for <qemu-arm@nongnu.org>; Sun, 02 Jan 2022 14:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=f6aHV+RQ8g72pXcMcalu5La7wzKW07c0b6pdNRtw5zg=;
 b=aSMQdpIdvy0/9LirwoKxgYohl131ekE0H86WEB/hmitGPJ8KHBHbXKl6WVpv4NTArj
 GJf1aNE/vB4nKLUC1TxqQlV1iTR+p/yHUFQl5kciA2EOontmRH5h9ovVn5AgHC065vGu
 BzQqSWOlZVkIvidRLXN5WIpJlb/lsh1QiDPVpF6uNanj9DvgQ40paGNqLw/0A/bNg1Y9
 6kPGFgVlqxtnrwtL9W3o2YxVmQ5gmxYO82QyaKfUZdfBQrFQUHVbLSG872LYSZqascQM
 ZLwIMXKYUhur06rJ5DK2En+mQnA+qCe4wYWsRdORyv3+AG4W+lyX9GDVYkZxdjWR//mq
 GrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=f6aHV+RQ8g72pXcMcalu5La7wzKW07c0b6pdNRtw5zg=;
 b=mTeqXn7tXYiCvW7ypMpXErNWzYVWv3KSJ0kllfAVRRaXbGuxblOeIhu6uVIbxWgiR6
 lEL4uBkJuYDqQ8mgR0rAL4UTGTcAfw4hwPp3sa/6RPahK8jQiiphh3dcfsCkNyaHnx4g
 Ti/ZyxShO3dHrst4cjPTpVRRW7vY0knKHh0Rjhw6EiHBEN+Uw+zs+YutVuWHNXDMZbrO
 IqGNbosy3sSmBLnN1D9yCulAb065BWDQpvAUwBTJ8K+RFupbX+8Gqm2CCHBWTepeUYEh
 35tIfjS/yzNaNb+0u7lbi404rCG4U3fkmTlNl1maQTweOLM/tDlvv2o4cUGvFpxqt9iY
 +a6A==
X-Gm-Message-State: AOAM531XxEUSC/2ltsmnFaCEAYXCf9JMq3Fo1akHY2c0ov2pfSDr+5NY
 5DswpGx/YvpQ/7nUWh+6x/DEItJiX7N+
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:a25:cfcc:: with SMTP id
 f195mr33313870ybg.710.1641160771516; Sun, 02 Jan 2022 13:59:31 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:43 -0800
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
Message-Id: <20220102215844.2888833-3-venture@google.com>
Mime-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 2/4] hw/arm: attach MMC to kudo-bmc
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3QyDSYQcKCOAXGPVWTGIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: UrjwWdRUZPNR

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
---
 hw/arm/npcm7xx_boards.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 37de9fef43..257bf638fd 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -399,6 +399,7 @@ static void kudo_bmc_init(MachineState *machine)
                           drive_get(IF_MTD, 3, 0));
 
     kudo_bmc_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci, 0);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.34.1.448.ga2b2bfdf31-goog

