Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp1042165lfu;
        Wed, 6 Apr 2022 15:35:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0+Z6ncfLDW2l7NTVIkHL4XhqJhrM2UeNN8GoMZAimwd9Agv/xfs1IgwfUETlnkmPu7nFr
X-Received: by 2002:ac8:5996:0:b0:2e1:d3cb:45ad with SMTP id e22-20020ac85996000000b002e1d3cb45admr9641981qte.283.1649284511597;
        Wed, 06 Apr 2022 15:35:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649284511; cv=none;
        d=google.com; s=arc-20160816;
        b=GX0L1E49wc1kp+9yfS1iSXWx7Z/LfcLD9Q5SqlE8u21F3qRdTtq/aZzwdkuAs3ixNn
         PeS//rmDf4co5UG/Dv4JeJ1jZhEcqeQDW5TTs7wPHBr9AFbcBwd2hlhhHnRitBhjy5Xf
         ZioL63nPamnox75pd9DGguvevyDdVHliSl9vhzpy2l1YdTI27/bHiA6z5s4kkdMAlr0J
         qQvIa4fojR8MzWf8tox1PQvak2t4I6Wh1PI5ckAhXUO8oA+OvxSY58es+Cyqkf1MMFLA
         Oj+4pSgPsOcdbMoqMwYoTV7YulIBmzDUj0qcSAqARMz69V/DWvNM8l7/yOx9vsIIgccj
         em7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=ymjjOdC0992lny1+ec+yUqgw/mq/KDjWDZvAVTBHeg4=;
        b=GSttS71Rt5h2KfxsRJwSEOEl2frawn1/Ci06ATxziF8VTK7nvbIilL3Yk2VrPYU9h4
         1txFlE8yUJmiB5JwghUO82yAU/g6264rbM1NVTVE8/Duv2JeqIxWBB9zK37nFm4L+M1k
         qUylp6FeCtitDHylbrBMf/KVDjbhjEXzToIqozSb466L0VK3eOJs03LY43Ymrptx/dDh
         ZJK21c/wVE5Fdwwz9qw3oge9myZaoTXmnLJjXeCSIlmX9wlnYhNrU0kbPZHveZpO0tpW
         PKk2vESKerzpivlZlC4KShZlyEGjTuAbqke/S1o1+X4DkaC0fYOIpxAZO+jBhIydRpfK
         NXrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=N9Ki2Sms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28-20020a05620a121c00b0067e4be239dfsi6784762qkj.548.2022.04.06.15.35.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 15:35:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=N9Ki2Sms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncEF4-0002vK-GP
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 18:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3iRVOYggKCAY20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEm-0002t6-Ml
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 18:34:52 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3iRVOYggKCAY20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEl-0004Vi-01
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 18:34:52 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 t6-20020a6549c6000000b00398a43dbdf8so2104845pgs.10
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 15:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ymjjOdC0992lny1+ec+yUqgw/mq/KDjWDZvAVTBHeg4=;
 b=N9Ki2SmsSPvsTQ8w3Zy1EJYtrilsoYMv0ImeKrnRYRtDcb0ViNgg2eo+YBg1Zd26CL
 dlDktNZAUKmd7YENk0wNBPRYTxVrmMmVHqc64rFNiwlb4r058Rt2zWdmkv27O2GZrsYn
 LVbEwjADfRxye7zUIbg5ugSzlqLqrM8GRf1o26Po6PWrX+KZjSjnW+7MG05uK44E4kZm
 hBAuGL6MJxK7QKE0If2x9jKrQkatDWkVd/uBS8Noo62nFPxFsOTBmZ4KnbehGOgorxO8
 mRp4FEOzDSTdiUTSdBGoadUN/sAa4oDbI+hlP0JyAy3kZzHTlgQGrPWobVme8vyR9jGV
 nalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ymjjOdC0992lny1+ec+yUqgw/mq/KDjWDZvAVTBHeg4=;
 b=BPlJJonZzq0lqpCwqLFNzNEAsZaoLTk4Rpzh50/WFKnxXqJrFnMnuZcx8yiZhef4ya
 HofmhSSUFRPu+DmcA9zMNbmYBP2GC1C2VDloKGgbnUZ4j+R3L4zFJhRQ714sCoKEolme
 OyBRLlSjhedXWoEdBTlV/tFM+BUSKuiKaDrIBdhLWkQ8acbnekrLbfnRHnv7WW+4/djR
 OZ4+hwP4SqGYK+co47SCNkzk2cSbqp9qcny5bL4TtER91pFR44sC/R5C0QD4z5HJQfnv
 ItMJlFTKwK7cuef7Fi595ycJ4jRdwf8Ur1Nb+DICdzkuYndnD66YvYmxQaj/9dQzFNxe
 dcFA==
X-Gm-Message-State: AOAM531rF7tCciXdgJjJz+FuXzpE/JCe59e4aYWxXNGJvqZtpqYdfr53
 fZVTsnnv3nw1tbFfC8G7UnfKXK1ckzR2MA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:352:b0:1c6:77e:a4f7 with SMTP id
 fh18-20020a17090b035200b001c6077ea4f7mr12227919pjb.77.1649284489049; Wed, 06
 Apr 2022 15:34:49 -0700 (PDT)
Date: Wed,  6 Apr 2022 15:34:39 -0700
In-Reply-To: <20220406223440.2901032-1-wuhaotsh@google.com>
Message-Id: <20220406223440.2901032-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220406223440.2901032-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH 1/2] hw/misc: Add PWRON STRAP bit fields in GCR module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3iRVOYggKCAY20nguzynmuumrk.iuswks0-gxstutmt0.uxm@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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
X-TUID: xK/KfOtU+0uP

Similar to the Aspeed code in include/misc/aspeed_scu.h, we define
the PWRON STRAP fields in their corresponding module for NPCM7XX.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 13109d9d32..98da5d171f 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -19,6 +19,36 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
+/*
+ * NPCM7XX PWRON STRAP bit fields
+ * 12: SPI0 powered by VSBV3 at 1.8V
+ * 11: System flash attached to BMC
+ * 10: BSP alternative pins.
+ * 9:8: Flash UART command route enabled.
+ * 7: Security enabled.
+ * 6: HI-Z state control.
+ * 5: ECC disabled.
+ * 4: Reserved
+ * 3: JTAG2 enabled.
+ * 2:0: CPU and DRAM clock frequency.
+ */
+#define NPCM7XX_PWRON_STRAP_SPI0F18                 BIT(12)
+#define NPCM7XX_PWRON_STRAP_SFAB                    BIT(11)
+#define NPCM7XX_PWRON_STRAP_BSPA                    BIT(10)
+#define NPCM7XX_PWRON_STRAP_FUP(x)                  ((x) << 8)
+#define     FUP_NORM_UART2      3
+#define     FUP_PROG_UART3      2
+#define     FUP_PROG_UART2      1
+#define     FUP_NORM_UART3      0
+#define NPCM7XX_PWRON_STRAP_SECEN                   BIT(7)
+#define NPCM7XX_PWRON_STRAP_HIZ                     BIT(6)
+#define NPCM7XX_PWRON_STRAP_ECC                     BIT(5)
+#define NPCM7XX_PWRON_STRAP_RESERVE1                BIT(4)
+#define NPCM7XX_PWRON_STRAP_J2EN                    BIT(3)
+#define NPCM7XX_PWRON_STRAP_CKFRQ(x)                ((x) << 8)
+#define     CKFRQ_SKIPINIT      (0x000)
+#define     CKFRQ_DEFAULT       (0x111)
+
 /*
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
-- 
2.35.1.1094.g7c7d902a7c-goog

