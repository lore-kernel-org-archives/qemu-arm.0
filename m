Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp266922lfq;
        Wed, 7 Oct 2020 03:08:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIDkvMBxXLmePazuVGOt9gdUtZkZ1VBoJ6WrgNE3IxFjrQfGpaZUn82jAcP7p1mw8NJgg7
X-Received: by 2002:a5b:601:: with SMTP id d1mr3098213ybq.417.1602065329600;
        Wed, 07 Oct 2020 03:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602065329; cv=none;
        d=google.com; s=arc-20160816;
        b=l4cfaYCaPVmdzfbTIopHGOwybb7t3nzXNcRQbvoEhRKX2PlSBQgTD8ml8JJUQRqN5Z
         K5rT8RK3+tyqfnxbB2H68JYgnI5wa5caqrogARUHRzCEWg8eYxVAwrQOhEXffGObXwf+
         kRiSNBBvtkkihSEBuVcqPLd2GrIp8h+sLsy5hntcyylCxlVRP7kgiD+GqvrQ+CXvpkQN
         /Hc/s2vCcmZyANbRWFzOKAF/6GvGU+sCTiwrf8dHzIC38rLuLi6hp/5ezwuW+J7sSPWc
         ERf1kPSW8kT7Q2/fI00r00WQmYiJSgfKq+EvuKed0OmZ/QsPMt8FCuYZXbGabcf3188i
         qyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BqNDRb2steS2WJ2AjGexGDlC3vfLL/j0O8907rJNfVY=;
        b=pHTL8xhvWnOptvBLseK4oc4TkhHffqp2UuiNwNWRREerKTki9ax5GjJPGVFOr1VOP5
         lBV42owt1xEw4Gqscw9tSCDuNlD/jpUVCUBGp0dD+1/fujTvoLsx0WFoJ0wk0BJSLPoE
         LePNAh2wvKvvC0+2bmzmC9KoDz1kys5zkpaqUdNIBiz822UoSpY2ySS2M8PVyaXxVYF8
         yidPs9K7oplfmG1+knll6W6qM2aEWTjGccOLR6sKV6AePGjGzvgNJxJNy2YTkUHjlEty
         aRFlQsXvCKpzdwl6SrCpIyNhla5ttlwoOWqQdsTZUBqC4PhCpXREUK2kf1ozGrb2SiHN
         F+tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Oho8NbbX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si1416715ybf.118.2020.10.07.03.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 03:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Oho8NbbX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ6NM-0005r0-T8
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 06:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ6MX-0005UW-HH
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 06:08:00 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kQ6MS-0004Un-W5
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 06:07:55 -0400
Received: by mail-wm1-x342.google.com with SMTP id d3so1682835wma.4
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2020 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqNDRb2steS2WJ2AjGexGDlC3vfLL/j0O8907rJNfVY=;
 b=Oho8NbbXTyjx5t4FLG772eAwBA2m1fV66DeXs0Tg/JNLXXXFsfyfIXPk55/hZNq7Aj
 cqikVdYp3Ch+Xevkhvb+/l2yZSo2yVFa69iYbUcf+qSIVVbSUMrHURyp7mVjyCnIOPjW
 80pb1TTQarflWzj0iYrarqu4/Lg2uVcxAThymXxNsgFNQUvz8wocvYt1m7bdmxzT2hOz
 M1WROjqtgSlnTqYXargelQImOCIsJgfblJA5RvokddpAJgbUSp0dYFQMKiVKO5rCvETm
 Qz+O+ISE8JEaGgT1MHMJHUmwYEtTNKA80owNMiW97aS/sC2QX2llJbiMgALa7JKkZ+dW
 UFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqNDRb2steS2WJ2AjGexGDlC3vfLL/j0O8907rJNfVY=;
 b=uX2/s5YL6F0v8eYCixZs5balBQQO2t3tADM6eDG1zPJlh2x4mlydLS2NrTVyQNi5BN
 E2ucfrBGqSM1XFeMnGneQKjYSEpb4Jfegu83U8X5BlquA4mCKH/lqFP8c3Gz4ALcdWbc
 XSINwulNGBFi5rOuEYPcrX4+n1njvHduFOu4zAS2Q+gz5U0N5RiCU6xT81OI3Q2oouwg
 uzbXJvkNJTIfJ/6deDwC22Qu769y0zPtEH3ADnrKnR7aYELRkHMZlCmtPwvbbf3mc34D
 M8E11zPkqVuF9e3uwous9484EPZ2E/Mnb++Js7fEDcrP9ifVZ9Wcqh8z/1U9T4gXqzDN
 64jA==
X-Gm-Message-State: AOAM532RKxs0bXiTdI+XAEvnHJzRJXX5KDabjqDYKcYAQFtoccIwocCh
 omr/kgLi1LsmTzayjjwsXzv3IxBKwhBY/fmBjWR297JPC7OHVM7dGQw2J4vTS5AzDWiU+RAEsLN
 7NHINqrRuDm2w+2W9djW2Fxbx9a/91cxbrdbs2pUhfWLDPiL2cqcCJQPE3RMz8fEhCe97Yw==
X-Received: by 2002:a1c:bbc6:: with SMTP id l189mr2588480wmf.52.1602065271293; 
 Wed, 07 Oct 2020 03:07:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id y6sm2208504wrt.80.2020.10.07.03.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:07:50 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 2/2] hw/arm/sbsa-ref : allocate IRQs for SMMUv3
Date: Wed,  7 Oct 2020 11:07:32 +0100
Message-Id: <20201007100732.4103790-3-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007100732.4103790-1-graeme@nuviainc.com>
References: <20201007100732.4103790-1-graeme@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Graeme Gregory <graeme@nuviainc.com>, peter.maydell@linaro.org,
 rad@semihalf.com, f4bug@amsat.org, qemu-devel@nongnu.org, leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SrzlMAQHOt3h

Original commit did not allocate IRQs for the SMMUv3 in the irqmap
effectively using irq 0->3 (shared with other devices). Assuming
original intent was to allocate unique IRQs then add an allocation
to the irqmap.

Fixes: e9fdf453240 ("hw/arm: Add arm SBSA reference machine, devices part")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 65e64883b5..01863510d0 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -133,6 +133,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
+    [SBSA_SMMU] = 12, /* ... to 15 */
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
-- 
2.25.1

