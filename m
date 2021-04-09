Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1569362lfr;
        Fri, 9 Apr 2021 08:05:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCUzEWSgsQy/cBxDhF3oelr2XMQRPb0QCWCocOnzuhhdBvsjQQi3/wgj+HpAsqFfj8M8gC
X-Received: by 2002:a05:6602:1592:: with SMTP id e18mr11337909iow.49.1617980754497;
        Fri, 09 Apr 2021 08:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617980754; cv=none;
        d=google.com; s=arc-20160816;
        b=N31qowSGjYy89X8r8S1WA06R6KmNDurSZ1dipXlrEsUcWxmuXc4fqkYpAD6uWhAq/j
         U52NQLnCAZ/DHwbwh1RQJUnNsOkkWNpW6KSgXIr4zvdrCoQME9kp0OU5tPWYXZ+cx/nt
         H20ymWoctWwbWBUSDH8PVNwyhccW88uHEU2shkebABwt1R2Go4PgdnKotQ5MCtm8VZeD
         0wWQB1FKJU8kr5KfDPTPYjr1Tt/q2Kgte6x6Q79NjS8bZGcuKlC8AjsPb/ak91MmZhAm
         ndxU9lm94EMqL2iWVP+S+Ul/C0aoLLj1lYDWptwMCO7zFcoOrM6/ZN0mPa61HP+uCn1p
         a0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=reJEPf1Ear5sT/gFdxp/wDkAg24YTHHfbcML4QVdPq8=;
        b=HnWTXMh0VR8cOp9k7UlsvI25lRwNe2m3IE7WEVCDtl1v0lWNlSckw5/uW6sHnCenH0
         bIrq7BPTO7Vfa+Fh/il1tc+qRt0BevZ0OHaOkV3254TlPJPqpQ4KDxhlHLXU3vZNQsK1
         GZLGQ80Vu6+Uyr6QNIHV3lT9oL9pDEZSG8Tke7sFvRcXQ1przakDUA1LIW4mHVlBKX4W
         3+O+Ioh1LOs1YMdb1WFOIhc7MWINuTkOvJNOAAFxaOO1dm67444fRywoOx/HZVVuVCXR
         CW90eFO8obE3Bg4RLttfEQWLz6h93GSih4Q3Val0weQ4Xcv2V6/Gzmbv3Kk8JFefVBUQ
         LDnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxbsFrt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si3223213iop.67.2021.04.09.08.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 08:05:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxbsFrt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUshl-0002ez-N8
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 11:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshT-0002at-2R
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 11:05:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUshR-0004TT-EU
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 11:05:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id a6so5952987wrw.8
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=reJEPf1Ear5sT/gFdxp/wDkAg24YTHHfbcML4QVdPq8=;
 b=yxbsFrt4Rh/ZBiGQX4zsAuiagmjzYX5B3PzpupcWwaPlG2bOkU7aFuiP4F5DqOzN7h
 7+vih3S/9oQAyLiyZMy61SyVGaLHYfYMM4NGJHFJ/mo+xgFIr4O6v/a3f5TfJm2GdQy9
 Rcdat3JtW2lbenyVOtQbZrSFEELq51tMbOjCswh0NbtZBumgUVYP3yP1pqpKbHVOWN74
 4SH/PjPTJEXji/PHcV06ceFWN9DdGJxIr1shMNu7Pfn8SX1/zi5uclZs/KVls9cMLN+B
 NkZK97vyVF6I5eiiQjx2scnl6cRnmcMe9wgJeYv0yRykEgCnXwz3iORYauOzxPOCC/zv
 +o7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=reJEPf1Ear5sT/gFdxp/wDkAg24YTHHfbcML4QVdPq8=;
 b=c4Zt18pdNmC/xXeJBYVpQZJ3DJAtrwexxMs04rFyiMtmxiGxxt6rvZt4V2oCSA4Eic
 sy6Q6EmEvPLi0eB3DmcUF+iXhjyoHp3Fn2a4xkmKfZSHbxytoS+29rd9BTlGebLMDFuR
 1q52yoZGF9c5iz8bT/+I79Dx3GBmn2Bo2npQfF8G+QEMuEKlXf2YQWk14y06TVKz8gwY
 xtiK+EXuZQnw3fWvX2vYJSAP3cvCUZWOy3yN/lwAyvE4c5m9HFgGvhvB2/nQ/+rKG60v
 zszMNoAuGUGNbmEPq6cODxLL+RMCw0aQremwLDJCEOv5eMEnkAIALiyp+tK//TIMjTo7
 IAjA==
X-Gm-Message-State: AOAM5330oPVZ8bsaNa4+jtX3jGTcUEH8BLvpcrPJDS5NFBtQmlkh5FHS
 UOubcY6sWP7G7FvhjpMDMu12mafIYWvE054X
X-Received: by 2002:a5d:4579:: with SMTP id a25mr9947609wrc.160.1617980732166; 
 Fri, 09 Apr 2021 08:05:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c18sm5048094wrp.33.2021.04.09.08.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 08:05:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/2] hw/arm/mps2-tz: Assert if more than one RAM is
 attached to an MPC
Date: Fri,  9 Apr 2021 16:05:27 +0100
Message-Id: <20210409150527.15053-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409150527.15053-1-peter.maydell@linaro.org>
References: <20210409150527.15053-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gMt6HVe+LKRs

Each board in mps2-tz.c specifies a RAMInfo[] array providing
information about each RAM in the board.  The .mpc field of the
RAMInfo struct specifies which MPC, if any, the RAM is attached to.
We already assert if the array doesn't have any entry for an MPC, but
we don't diagnose the error of using the same MPC number twice (which
is quite easy to do by accident if copy-and-pasting structure
entries).

Enhance find_raminfo_for_mpc() so that it detects multiple entries
for the MPC as well as missing entries.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 5ebd671bf83..25016e464d9 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -306,14 +306,18 @@ static const RAMInfo *find_raminfo_for_mpc(MPS2TZMachineState *mms, int mpc)
 {
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     const RAMInfo *p;
+    const RAMInfo *found = NULL;
 
     for (p = mmc->raminfo; p->name; p++) {
         if (p->mpc == mpc && !(p->flags & IS_ALIAS)) {
-            return p;
+            /* There should only be one entry in the array for this MPC */
+            g_assert(!found);
+            found = p;
         }
     }
     /* if raminfo array doesn't have an entry for each MPC this is a bug */
-    g_assert_not_reached();
+    assert(found);
+    return found;
 }
 
 static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
-- 
2.20.1

