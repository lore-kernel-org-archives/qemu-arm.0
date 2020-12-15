Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3419062lfq;
        Tue, 15 Dec 2020 03:51:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynrzK+JkFojczxjcEzr159lZ4XqvLZBp/YQDSiwk77Mc2oJGCPXCUXgMkmynccJxmk5vdU
X-Received: by 2002:a25:cd43:: with SMTP id d64mr43470708ybf.296.1608033111037;
        Tue, 15 Dec 2020 03:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608033111; cv=none;
        d=google.com; s=arc-20160816;
        b=BCYtcPjC4NUjXm+8PE/DIeBa8ZaMnnO94cHjOw90oEQU2Pd2KZsuMYo9Xsg/Px0Af5
         h3xSq+umiSACDTlX0b0+wOMBV2beJImbsdWHAzpT10wYCSU+LRsUshG4aKdQd/5Y/v5K
         i8s67KgM9aIZF4R04WYMFXYaoD2uqSLmsBJtteWTnkrLmBwdvlad/yi2dDwsiW8PUJmS
         LLsJVOo235LO0cl7TQ8oRTvyvUQvscou9OgwpwiLdcS0lkjkebrQKWQNVxeS45dCFeNg
         VVKY7j04GqXzgG2Kfx21iAaGEbFuu9ARnnx2ZGdlEmE3ifIcY2oZ5576iI6HQ1AvB9Ze
         JUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6f6cB8+j9bmaE4tIz0+ycFzetfYNmLLuJuRVcmb/DV8=;
        b=Aw4W0rquqpzjlBmmC997bYikSuhtVUtTKpKzHamRgpMNBLFaX8KviqzXegs5b3W+ZV
         zBaAcNDm+56OxCFJCbJCdm4Rh2NTuV4lBZTbTZDY3Rv/25ev+9g7PVBSiRC6CSUfFTWT
         4VkVNGgzXgyjiOL5D/7ho7sTw+ilBnb5i+Rqrp+VOaDa9RtclK+vq860BhIOJJXBvwtx
         2xVvrhDdOkmIF47X1A6MM95p2GveRG426/N7N6I5eUgb9+fv5LXwVHoVScrSW8CvLx1O
         RKOLW7+7WKhQO6rws5KVX1eI607e2sjCpUExDspeosBm0dhryNJJUvEGpyX6QM6lVAdj
         74OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=K8wKjLBr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e66si20445625yba.279.2020.12.15.03.51.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 03:51:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=K8wKjLBr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp8ru-0002nx-EY
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 06:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ox-00078a-CJ
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ot-00015k-NH
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:46 -0500
Received: by mail-pg1-x52a.google.com with SMTP id n10so7041334pgl.10
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 03:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6f6cB8+j9bmaE4tIz0+ycFzetfYNmLLuJuRVcmb/DV8=;
 b=K8wKjLBrSeF+saIJdgKRCoT0CbOJDobCxGLSlQ62qhDg5SYd3KKZz5nkY9EP5/23Ro
 /wSiWj5W/PiBAUBEDxpxb51aMCU9ofCFdQDzy32A7HipNVhQ5wyWIN5x4RIvmHInZmjM
 ZAj0Jr8KEpJGVLWkJnvDhbFqolNoHpf8GKR3/cdmMyEi4FePjHQEhzAICOh4Ua2lZR10
 D+V4fm6BQIpk7P9AMD6QpAtN1U0QqCwlZqHfkwLc47rf+gQukC1K08rzoaLpmXfS0rpL
 xmAMQqZP2sMnELaVZ9qHE60BZXMQ3XVpchVdp3zpx0NvFzAuZxXdqO+IlPLCyJZx3ZUO
 SVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6f6cB8+j9bmaE4tIz0+ycFzetfYNmLLuJuRVcmb/DV8=;
 b=CwY21i3ain/V2K9X0OlgykJuflJx0ITB1Pt3mH96hib2AQdS7cnW0ZnGrayOjeSWVi
 QTEwNsFSnjkyz3MUSTCAVh70Y9uO1/zhfxKRmjcbQGJ6MEn7OeGiUKVpYbEwUD6eOHfx
 2ixNKH6bBXICgCU1rOpZctJTWtLOrUtfR0TBigxBvwVZu9yoY3FtfKee8zTh5rLXjhCN
 YuQbFOac/QZ4bec3RSMbYRPR3sXbwhZY7CghO/c1EV05sQwtRHob6nT/ibRATM8v77Sp
 x/uVte3J35YpIFJlqgDnLsD7OeyA6ppEZPp3MdeHszaMupyPEx4Caywd1nA6PS08JxqY
 nw7w==
X-Gm-Message-State: AOAM530KHVCRJXUM6noG2Pg6GpZumWdbe6CnZ3I/Iez7jJG1XTsSQw02
 hf9W9S+gBtRYzAWcHVVX8ZojmnDSw/mTuhaofNNcLmVmF7eeP7AJUm76emx3OGfZ2Ip6LnQlIHf
 LhvCD7KEemxNlWDvZDLs0Zv45f54TP3NzJVh/l+m0Hk+Y/ZzC9kSvfwE4woO2MNeP
X-Received: by 2002:a05:6a00:7c5:b029:19e:2965:7a6 with SMTP id
 n5-20020a056a0007c5b029019e296507a6mr28003636pfu.60.1608032920573; 
 Tue, 15 Dec 2020 03:48:40 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:40 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1,
 CTR_EL0 to cpu.h
Date: Tue, 15 Dec 2020 11:48:26 +0000
Message-Id: <20201215114828.18076-4-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=leif@nuviainc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9st5il/J6jLB

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fadd1a47df..90ba707b64 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1736,6 +1736,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(CLIDR_EL1, CTYPE1, 0, 3)
+FIELD(CLIDR_EL1, CTYPE2, 3, 3)
+FIELD(CLIDR_EL1, CTYPE3, 6, 3)
+FIELD(CLIDR_EL1, CTYPE4, 9, 3)
+FIELD(CLIDR_EL1, CTYPE5, 12, 3)
+FIELD(CLIDR_EL1, CTYPE6, 15, 3)
+FIELD(CLIDR_EL1, CTYPE7, 18, 3)
+FIELD(CLIDR_EL1, LOUIS, 21, 3)
+FIELD(CLIDR_EL1, LOC, 24, 3)
+FIELD(CLIDR_EL1, LOUU, 27, 3)
+FIELD(CLIDR_EL1, ICB, 30, 3)
+
+FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
+FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
+
+FIELD(CTR_EL0,  IMINLINE, 0, 4)
+FIELD(CTR_EL0,  L1IP, 14, 2)
+FIELD(CTR_EL0,  DMINLINE, 16, 4)
+FIELD(CTR_EL0,  ERG, 20, 4)
+FIELD(CTR_EL0,  CWG, 24, 4)
+FIELD(CTR_EL0,  IDC, 28, 1)
+FIELD(CTR_EL0,  DIC, 29, 1)
+
 FIELD(MIDR_EL1, REVISION, 0, 4)
 FIELD(MIDR_EL1, PARTNUM, 4, 12)
 FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
-- 
2.20.1

