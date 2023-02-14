Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1424405ejb;
        Tue, 14 Feb 2023 08:31:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9cnX+qH/H/1hByc0CO6aOhrWqq/DlPB7zB4iyDuQ/ItYIdBkM38aqpyTwcL5MpROqVCryc
X-Received: by 2002:ad4:5dcb:0:b0:56e:a07b:f4db with SMTP id m11-20020ad45dcb000000b0056ea07bf4dbmr6692904qvh.24.1676392278677;
        Tue, 14 Feb 2023 08:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392278; cv=none;
        d=google.com; s=arc-20160816;
        b=XEBW6Ntd5jO2xYKqM5PyOYvRZpeGIOErZg/0lmPrgqjWUMKMHf1ml7pNqknaTQFwfd
         ZPMDJjVMgetbGZnLypBdpx3MNWRH8+KO623Mpqsnbc99vrSsqBW3Wbv4QwUA/jvdNI2g
         kn2KQElFinPfebQpL6lV7WDpU+53iLyc5UvHWTntc1PPhJqzpCFvMkqeQz+mFXYKIZHO
         zXhce4YSpQ9vSKaSCXYlHfuEW3pOZemSgqdoJoqZYoUvl+5d/kX8qPIx2PhsEco93Cyt
         MqJBRDfc++dCDpLw3gCgv7IzUQJxsgifyHTcSqvBCTA9G0l8jsXo983l0gLAxTtt74nJ
         f9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xtIpJs6CDJTguU2qwCAmHY7gW26H1KWvwqoyvB56KYY=;
        b=ZEMtI4nTOakuDAF7HkZR4nSdgfVbAnUF1HLb87XSHO1vCNQn51QRkku0hL/ouGeY9p
         Aqwou+yLiyRURRw4eYEhNQu2TbeaTFCidnonMPL1cESfnkm6ckccp70TrJUlYsAzHIJw
         8mqprEuEVmTDDJ/HlVtjRSq4Dqjp6hJBIg2iA1aO06cxW48bH5E4vdsaXi8O7SDuKe4/
         n2wBbxBU9FkVdVyh6XDTtAIk2v43+aDAnC0ifb18HJi/ukD015cM2KL1Ni4WRavd5b1t
         rCQJS5cQXP1YdNHGkOlUW+Ln0qjxNuE62epvc7VxPQFWxhaU0iZd3EKlky2gy3L0Yk9X
         MHXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=evHAF1Ai;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay16-20020a05620a179000b006fec2c77e8fsi11832387qkb.481.2023.02.14.08.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=evHAF1Ai;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyD1-0006ZX-KM; Tue, 14 Feb 2023 11:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCu-0006Sr-2I
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:04 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCr-00028Y-Vi
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:03 -0500
Received: by mail-pf1-x430.google.com with SMTP id bw10so666221pfb.0
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 08:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtIpJs6CDJTguU2qwCAmHY7gW26H1KWvwqoyvB56KYY=;
 b=evHAF1AidzM+LkqXq+fgXah0HUl9BGOPSXyS+rOef2t9j7l6bnUdAUsM2JMuV+Q3Lb
 b+nX5d4GZsdK6iqeCrGVHyiyAyQyzkbp6ElJ/qA0aOj3nsR1T0XHys6RFgzyeDpz9fPa
 Vu7DgZ3em6bvS6qZW8hlATL052OGwrdKUaH4W9HLjXcIXNfp1WGjiGI98dnA5yarShxt
 R12Edr7GAqE9akcsvWnydvvCTdBEwYsGiWU+HVd4nXR7sF+CEUCHnnPoBZNl0+58ztJu
 mBMHUPgF4xcg8JrGW8K1SfgNXym3XGrdaHUDxOaEPlz/tihU+it4XxEXCBzpZzjHVcJo
 zlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtIpJs6CDJTguU2qwCAmHY7gW26H1KWvwqoyvB56KYY=;
 b=x9b/d4kK2B27vBLmSL1qtoAsZQMeqeck45sBduFEf1O4YfVfh/q6yF9vM/vrkGJzeY
 LeiIY+HQSQixGSGAHiSEZedEMo9khcQhm3MQ4/WNwG6sfnD2jhsfH8//gkc5tyEO3tyk
 9cuoCG+hmguOi7pTBFxDwCqQDsXDMpfQ27UwAkUwMvUJyND7+itKMzG24sKvCroA24xo
 FG43ghEZf75WYCcsant+Yz/yWFpp/iyLhdV43EtBS4TJ41pHM2dg+zSbDkq+rQPpugKz
 zv6S9UcDFsL6RXf2DZG0+2Smg3X2fEiYNTLAqzjEbDvMdn8YXHV1tGY0UyQwPk75ider
 XRpQ==
X-Gm-Message-State: AO0yUKVs19fwyQF43DNZZXaa2PN5YBGeDazGfBKj0jngYMFWKmsloXLq
 RzTBdwsYeosXk6aq2JZcNPis0nrtX67cUPSTlTI=
X-Received: by 2002:aa7:9591:0:b0:5a8:4ba7:5840 with SMTP id
 z17-20020aa79591000000b005a84ba75840mr2702300pfj.26.1676392260741; 
 Tue, 14 Feb 2023 08:31:00 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/14] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
Date: Tue, 14 Feb 2023 06:30:40 -1000
Message-Id: <20230214163048.903964-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0C5rEMU7DBYt

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 8d174ff6e0..02a0256c5c 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -283,6 +283,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
+    int pred_width = cpu->sve_max_vq * 16;
     int base_reg = orig_base_reg;
     int i;
 
@@ -319,14 +320,14 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
+                               i, pred_width, base_reg++);
         info->num++;
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
+                           pred_width, base_reg++);
 
     /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
-- 
2.34.1

