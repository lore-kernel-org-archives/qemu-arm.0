Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3887343ejb;
        Tue, 21 Mar 2023 03:26:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set/uvW26yAfphRd7SBgG8pjmv9PRUe+TdXQHAS9qgr7mPH1QHH4eHulOD39bHQQQ1qAWYKr0
X-Received: by 2002:a05:6214:2303:b0:572:636d:6281 with SMTP id gc3-20020a056214230300b00572636d6281mr2515894qvb.33.1679394360595;
        Tue, 21 Mar 2023 03:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679394360; cv=none;
        d=google.com; s=arc-20160816;
        b=bMAX60pJwRCVOCq1Xb6IcO+MS9jnWQGHiNLIxqUrDGWwvtJK/v1EH0BTJ9v9KYN4uK
         9g816XiwPsG1T1lCky1laSVw7bCvrOWLfmIIWaWvbCzepnBclmxjueAMBz6pm/G7a+AW
         Ss0+acMeVVh61qNf1kg4kunFSXPDB6kL1BnwDZKqvBtqdqiCs9xLsqt/GhwVywCpUlMi
         74CfQj2Tr6TDHIhUVzzVg39KkpoOWunuGqpFUZ2cwTQN8CTwduQHZQYFsFfXZBW6zmGp
         5zmDHrivJPXRcc9nZRlrG3+FvLkM6/0hs8JhpMBmo2O/PzK11BdP1QFyqP6Sc1QY793K
         EMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/GjgvB2u38AR4LL+srk2PmM/5h7DpyWr51tDaPP8FT0=;
        b=ehExzKmNOPyGSY4S5PKL/3CEHqeo0fcKpUMFeEOvBV1bth3GDKOuZ5nvN/9ZbpYh6G
         yJVWtsupie3QashCRo/6WKG8GNG6VGKGDY+lPDueAGjveYNbMDcsyVqn+KZbpRinDdi4
         9XdFR2q9JU7aYq1pnErJC7vX/oUG/XUm7O7mmemw3fi8VWulP6bVbjpfRYnBsLX5so7F
         q3sDDBVuQu1A4klUeXrPa4Hzy7X9SioC/fo6CuoMiATHPjPHStbCAbceizJFmUEhUfON
         G/tbJLQp6+KxM3+BKexWFHjiIS4kZVxQh2LIs1/ZK19oU4VErQPrp/sfTXW4x17jZfnK
         hpSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b="Z/Bh/p+U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020a0cd84c000000b0056e95b64b2bsi7675502qvj.367.2023.03.21.03.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 03:26:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b="Z/Bh/p+U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peZBS-0000Rb-Ty; Tue, 21 Mar 2023 06:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1peZBP-0000PJ-KQ; Tue, 21 Mar 2023 06:25:35 -0400
Received: from m12.mail.163.com ([220.181.12.217])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1peZBK-0008NN-Gy; Tue, 21 Mar 2023 06:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/Gjgv
 B2u38AR4LL+srk2PmM/5h7DpyWr51tDaPP8FT0=; b=Z/Bh/p+UeRsk3T6sc8MZE
 sGjxZ9jWm9JWoRZdWrqZyMtkG+yDeTYOPTe8bZnjCXBJoJbbzzd4fpREukNO18uD
 i1FUEDVVfSu1xLgFAKM8454inLKJ7jTIyBa0rAU0AAGq2W+D5jIj95nTzdhePwAu
 KiRDMjK+6N77G3ahYAEMMk=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id
 _____wBnznIHhhlk7VIWAA--.11160S10; 
 Tue, 21 Mar 2023 18:25:15 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1 08/11] hw: arm: allwinner-r40: Fix the mmc controller's type
Date: Tue, 21 Mar 2023 18:25:07 +0800
Message-Id: <20230321102510.16754-9-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321102510.16754-1-qianfanguijin@163.com>
References: <20230321102510.16754-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnznIHhhlk7VIWAA--.11160S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DJr47CF17JryUtFy7Jrb_yoW8Xr4kp3
 Wxua9xGr9Yg3yfAa1DK3Z7Xry8Gryv9w1UCr1F9343Gw18G3ykXFyYya1UCa4kKr48AF4r
 Z3WSqan5Xan5JaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEOJ5wUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXA057VXl5--QGQAAsk
Received-SPF: pass client-ip=220.181.12.217;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8wfN407Gq4Iq

From: qianfan Zhao <qianfanguijin@163.com>

R40 has SAMP_DL_REG register and mmc2 controller has only 8K dma buffer.
Fix it's compatible string.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index f1f6803cf7..191ce8b93c 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -265,10 +265,11 @@ static void allwinner_r40_init(Object *obj)
                               "clk1-freq");
 
     object_initialize_child(obj, "ccu", &s->ccu, TYPE_AW_R40_CCU);
-    object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN5I);
-    object_initialize_child(obj, "mmc1", &s->mmc1, TYPE_AW_SDHOST_SUN5I);
-    object_initialize_child(obj, "mmc2", &s->mmc2, TYPE_AW_SDHOST_SUN5I);
-    object_initialize_child(obj, "mmc3", &s->mmc3, TYPE_AW_SDHOST_SUN5I);
+    object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN50I_A64);
+    object_initialize_child(obj, "mmc1", &s->mmc1, TYPE_AW_SDHOST_SUN50I_A64);
+    object_initialize_child(obj, "mmc2", &s->mmc2,
+                            TYPE_AW_SDHOST_SUN50I_A64_EMMC);
+    object_initialize_child(obj, "mmc3", &s->mmc3, TYPE_AW_SDHOST_SUN50I_A64);
 
     object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
     object_initialize_child(obj, "twi1", &s->i2c1, TYPE_AW_I2C_SUN6I);
-- 
2.25.1

