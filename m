Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp657873ejc;
        Thu, 12 Oct 2023 01:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH55mMrasK1QX3NXe96v1kJYYRrgZQM+6nAweX+tp38tc+QNRLsEBqLUUM+sZCxk5HDv/uV
X-Received: by 2002:a05:620a:29d2:b0:776:fad0:cc3c with SMTP id s18-20020a05620a29d200b00776fad0cc3cmr18234502qkp.4.1697100680558;
        Thu, 12 Oct 2023 01:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697100680; cv=none;
        d=google.com; s=arc-20160816;
        b=J5fBBcegjWeSKw1cTHjqUytyCgdPoLZMe1XM5lXXP3kg7a0hPL7bda/f0diC43g5ct
         p7XqwZVE/g63Hs8o+lFXKDZNHZTYfNpO01aS/7GRRa+CjcbDbZ28E/s8gkon49LKwqGZ
         ysnXSUp55NMkRO3ya+KSVgFVaZDNfL4uDAwyg65oyunQa4f6RWOjY9Ua7lZuctyXGcu6
         hYRBE4nhjfbIWZXJkp4EbgOEdzmrQyuEZ1lhCCx9KJgv5ZFuxZNkSWsyRI0nqL1QlvTt
         Ip/4S5FJCqAJweVttA6ogJgshUADXuKqZ77rVkTft5PgUD/I5MsvSQE1BokbVe7BmoC+
         z0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=v1F7G4Xgq3SG0dF9KevTpmDA/YRF0ZDy9td3eHU5eJI=;
        fh=7rabEz/QNvg2g//TnVS6eBYGfbv29RNInEOawnw9ijw=;
        b=ei5YVfVU4xERX/8x2fR7hKCPi5WG4Zml5wwElA1t4DNN0FcNiz0UwPShIAyLq5E1uL
         7WYr5SyqaW5UTuhXNVtAzPBwjVGLyu4GRJ2KNmky3sNgjc6juJAbFjaKkMD0gir0BryC
         41GoDoBvgnu/3aqKTfHqHWieDHpeaQ/b9tRx6A1Yka2lCQHwi4sM3njP0ycalNFbRGW3
         sV+RvTjcCBPxnK90q6ywSd/zyZ8fq6IIfgBlWrg+fynSjQKAvP4FmW1mUf6XlREzADXr
         3LbGtZYU8rnImmrofzxa2xZfsE0hn/W7Vqrr+5dl+z/YabctEzvWrupbu2jbj9ZQWrCa
         owtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05620a450300b007772e76ffb3si3545370qkp.549.2023.10.12.01.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 01:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqrPA-0003Wn-KY; Thu, 12 Oct 2023 04:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mironov@fintech.ru>)
 id 1qqrP8-0003WV-NU
 for qemu-devel@nongnu.org; Thu, 12 Oct 2023 04:50:50 -0400
Received: from exchange.fintech.ru ([195.54.195.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mironov@fintech.ru>)
 id 1qqrP6-0005g4-Ep
 for qemu-devel@nongnu.org; Thu, 12 Oct 2023 04:50:50 -0400
Received: from Ex16-02.fintech.ru (10.0.10.19) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 12 Oct
 2023 11:50:16 +0300
Received: from infra.fintech.ru (10.10.1.240) by Ex16-02.fintech.ru
 (10.0.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 12 Oct
 2023 11:50:16 +0300
From: Sergey Mironov <mironov@fintech.ru>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
CC: Sergey Mironov <mironov@fintech.ru>
Subject: [PATCH 100742/100742] target/arm: Adding a check for the result of
 calling the CPU information check function
Date: Thu, 12 Oct 2023 11:50:05 +0300
Message-ID: <20231012085005.848149-1-mironov@fintech.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.1.240]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-02.fintech.ru
 (10.0.10.19)
Received-SPF: pass client-ip=195.54.195.159; envelope-from=mironov@fintech.ru;
 helo=exchange.fintech.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: p7Tlj8fcpBN6

6 out of 7 calls to get_arm_cp_reginfo() are checked

Signed-off-by: Sergey Mironov <mironov@fintech.ru>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 74fbb6e1d7..cffbbaf571 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -198,6 +198,7 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
     uint32_t regidx = (uintptr_t)key;
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
+    assert(ri != NULL);
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
         /* The value array need not be initialized at this point */
-- 
2.31.1

