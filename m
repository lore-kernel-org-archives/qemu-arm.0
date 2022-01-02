Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp9952488lfb;
        Sun, 2 Jan 2022 14:07:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6DzCX0J9GbhxMxPhzJirqnJE9q2uuQDo3JAAyT5OXyMw5Pb41cLISvZXmRC8/tIYCPG+n
X-Received: by 2002:a25:d854:: with SMTP id p81mr44768670ybg.256.1641161261537;
        Sun, 02 Jan 2022 14:07:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641161261; cv=none;
        d=google.com; s=arc-20160816;
        b=bl8RHFglgMV7vSF/QEnUwjom3KWGAl3SwfgEURlRjfdzF5J9RYTn5uIVLmrFlvNwh1
         iVDv92wph4vaTMTr1p9+OlhyiBXRn2er0eK+yPYRq1u7k7LcUxnQZkt7uXahElWo6dRA
         4AZ+V5dcM37P8TdkZV9/vMQjAiOuACIDXNMaU5QaR7828JqMDV7ebhmkV5nppgmy0bWN
         uucoEkLCwUnsunoTY2/kDc9iljMjL/x+69ryOd1LB3GfL/bQuxMowm6wuFhrgZ/76q//
         Qc54jvg9kQyjAO3HZ7+fYRjSJMobcq6RPnE5+8pA2hc00QCVW+YvIpvwwHZ26lfxVfCP
         zAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=LppqlFN98GVmb98Ji5/oRgfzsW3jaDcyDZcdlq1a/gA=;
        b=SdC+niuJVO955x3gc63b7fbv7q9sGzlgopQMab3qqwsvefFEe+20MXylMA9CpB7JFt
         cYnNJFC2ZM2El6y0K33Pxmbp/9/oP0lR+wY4HgNEO4r3nOhZBG1EtNEYFI2Xd1ok30Pl
         xuvnZOveL32LJx2WFkNa+Ln2gmS+dswh4YPU3YKfF+UuE7xWWYaQ0UdCCFPq0W+4ftW6
         ozzO0i0vpoz5yeyQpQ7mbAiRzxR/j94csV1P/a7EmtqD3Z6/Y4rAET4GgJkKjh/goeQO
         hzuT0iUMdkO450bnHlt2VaeyLUkMmB6Woz748kvVTsLql/2wfFyUUJmnMiAN5ScUZ/rt
         MLRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Rlbpecof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8si26849644ybp.208.2022.01.02.14.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jan 2022 14:07:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Rlbpecof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n490u-0001ew-Tn
	for alex.bennee@linaro.org; Sun, 02 Jan 2022 17:07:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SCDSYQcKCOUcLUabYLNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n490d-0001dU-L9
 for qemu-arm@nongnu.org; Sun, 02 Jan 2022 17:07:24 -0500
Received: from [2607:f8b0:4864:20::a4a] (port=44865
 helo=mail-vk1-xa4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SCDSYQcKCOUcLUabYLNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n490c-0006EB-8v
 for qemu-arm@nongnu.org; Sun, 02 Jan 2022 17:07:23 -0500
Received: by mail-vk1-xa4a.google.com with SMTP id
 78-20020a1f1951000000b0031456f5d53eso1958577vkz.11
 for <qemu-arm@nongnu.org>; Sun, 02 Jan 2022 14:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=LppqlFN98GVmb98Ji5/oRgfzsW3jaDcyDZcdlq1a/gA=;
 b=RlbpecofOmrFTeGIK9bD1bkuH3qHH1xCOBY9NKAUwe3z/NbHFvCppHzmTJquswNWm/
 f9toDJciUY8pI+K0qXDVMI9gKoT2r+YPyogt6jFSBVNQLtcQp3ly6jrVZddPsXuh9aXN
 tvhFKaCXdHKsrkrPFHQjC8YVUOwLX+1U2n6TbdxntjMA5SieUDqjEI3U4if6aumK/n3L
 0M06M1WiPjuaj2QkGOQvLirGIfZBG3qtaNtQc5sDZM66vqnDlB/U+9E9166T7Sml6/oD
 ZuazDL+NzFEk6w8MbXDGx2wQ9D8H7w+OJiQXMcbKMXTGDaNPHYgmmAraD4xlX2T5LVr7
 ypTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LppqlFN98GVmb98Ji5/oRgfzsW3jaDcyDZcdlq1a/gA=;
 b=CXvKfRqFWRDqune5QysLF0prk6kf2o5QONh0XLNzyBHjTWS68uPa9WIAfR4YrucM1E
 iPHrfk4YcQUpWWlxoOW55w6QNJkfqUdK81iuIhBFDf1PqrNKE4EbNXvEVWjoWrK5rPJD
 BGdWRw5ct063+cjtsgyU9HfyesLDe/CDJcZfMB1zSNQZrwNU2fO+XfXGqFTIgQHLtGkn
 Uz/udk2wg0u292RYbjYecScusUR5c5ZwfefYcA6o64AIhNRb8AmBGx8rjtlwbUkQU4S7
 4+noSjncYHC7D8nqz9QxEWTDM4vw607iDZTKJvPmJDias5K6qxMQWUKMKiO6FhK7aviR
 5Vcg==
X-Gm-Message-State: AOAM533IoqZzYRr0ZstRiqRG3xxJOajPnciPRLjDwrb3FKCC9oEPXeLM
 wUS8zAF0huJWapWLaCHRFYq0LrEgt2Md
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:a05:6902:1209:: with SMTP id
 s9mr22395167ybu.48.1641160776047; Sun, 02 Jan 2022 13:59:36 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:45 -0800
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
Message-Id: <20220102215844.2888833-5-venture@google.com>
Mime-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 4/4] hw/arm: kudo add lm75s on bus 13
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a4a;
 envelope-from=3SCDSYQcKCOUcLUabYLNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--venture.bounces.google.com;
 helo=mail-vk1-xa4a.google.com
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
X-TUID: 6SOGy5IdHt3F

Add the four lm75s behind the mux on bus 13.

Tested by booting the firmware:
lm75 42-0048: hwmon0: sensor 'lm75'
lm75 43-0049: supply vs not found, using dummy regulator
lm75 43-0049: hwmon1: sensor 'lm75'
lm75 44-0048: supply vs not found, using dummy regulator
lm75 44-0048: hwmon2: sensor 'lm75'
lm75 45-0049: supply vs not found, using dummy regulator
lm75 45-0049: hwmon3: sensor 'lm75'

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/npcm7xx_boards.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 4cd58972c5..7d0f3148be 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -330,6 +330,8 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 
 static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
+    I2CSlave *i2c_mux;
+
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
 
@@ -337,7 +339,14 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 
     at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
 
-    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13), TYPE_PCA9548, 0x77);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
+                                      TYPE_PCA9548, 0x77);
+
+    /* tmp105 is compatible with the lm75 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp105", 0x49);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
     at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
 
-- 
2.34.1.448.ga2b2bfdf31-goog

