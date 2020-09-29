Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4414053lfq;
        Tue, 29 Sep 2020 02:43:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/CLU3zl9hkMISPRPy0RZWtAZo5HaskzHuopKDXbo45jBE+Q+93k6pPS0d764qp8MeE+wp
X-Received: by 2002:a25:cc45:: with SMTP id l66mr4718913ybf.112.1601372603971;
        Tue, 29 Sep 2020 02:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601372603; cv=none;
        d=google.com; s=arc-20160816;
        b=W4VK1oOv5PQDCJJjYU1ms3lzjQ8xR7YoLrAcxMf0AVZa5LBhb4+OzB4+96Oe6rxbhF
         u1U6RTTztJNNeBv0m3pZHTxIIkxleS6GdGYircnoKsPQm5choFAltgtMygk5dHSfmo1B
         7e21rX8gqQho+yLNjPv51EXbsOeBPrHzjkbWdOPsqFGaRMw47ytH/UySNZY2qJlbU7QM
         WYPUGOX7LVTDC1OxaC5UFsYtx903DQgZVb3vMr+d2W4zvtG8nrFK82hUYp3iTapfABiJ
         F0NYVEn5D8JS2O+YGxzRhUUciKoQE9U2RXaaaWf0ucukoeQBgml4KjyNhD6tJ3KAOyy4
         1XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QDUv3dcjFWN3ygber7QxqtPNAs8gzuomgpWrmGLr5Rs=;
        b=HVJRJvXVGhciKYMp6He5LdJZ2tMdfV3RW3XJ+8b8Xun5eUgbBbMMb5tvI+FD/J6eW5
         s/U7AXVM2QjNZ9CvIcVnUU4KYDaXZsENo1/xSd9DxsZJPK2am2Zwwx0f4LKZADEuwnru
         NU7AxDG+dD62cGMmsfHiMiOhPaE8xePA1eRsYxFdG0hNKThOyDjkujpIY5AyYj4+TUFX
         LSL0urPf7hfvUK2w6SxWvu/OIwWj+6Clu3CDt5Sx/zGkeSnw2Q79CkgKlzwDpsmisnuC
         HtAgob+DC7Z6NwejOoQxDvlbMN2mdC+jaU9cPWUwQKasKzKAYnfiD/XZg4Sb2KQi7mBL
         xhJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=GqWPJvrL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j127si3571073ybg.362.2020.09.29.02.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 02:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=GqWPJvrL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNCAN-0006qE-9P
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 05:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kNCAD-0006nK-6Q
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 05:43:13 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kNCAA-0006pt-9t
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 05:43:12 -0400
Received: by mail-wr1-x442.google.com with SMTP id z1so4621859wrt.3
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2020 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDUv3dcjFWN3ygber7QxqtPNAs8gzuomgpWrmGLr5Rs=;
 b=GqWPJvrLgfArS+dwd2kylKzls0AMYrGW519QAwUsZ/SLN1hIUV01Z6sZwcdw+Yh3wP
 Tp0yPH6p3Q9+y89r4kF7O7XVeeZ0GBjo8id25sqx947B90bhM0SgOOd2z2e4pxBZMO08
 bR9TCnb45hGg5c3OyOEqUtL03AA1zNMvym/0ey1qEQ8GTHh4y+xKvZcNSJ9m2MoKnz9S
 7bqHLEFAXsGEROILAW2nGlf2iEzEPq7fre0kW1/EnfQVXZCJYkexXiMv00IHdgtvS0n8
 HLI3iVbxeq79xVEIeC3siyudzA/zVAvPgObCabxyPTmxLVbyxXs6Zwuibt8tSyIRrrVq
 soxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDUv3dcjFWN3ygber7QxqtPNAs8gzuomgpWrmGLr5Rs=;
 b=jSC9mHXCO16Vg3fukYUMjgvGUoyGF5FnX3mdSZBSYOUaZnzeuvhmIg7vwF46ymDdUG
 swFRmKZUbOO9lpizf65i0UvRwb/e1a77g+o0nteSwqMdQPf59W7tBtdcSTRkwRByxQhD
 UHLZ+nu34ugz9a600L2tQG0f+PdQqyTwj3NV6zZvRnwuP8clxkQfV98Qs1cf0LbhlKbz
 YhHBoV1fMFovrsCVdlfLBIvUazdFBJl8DtwsiTcWn9roAO3Fz6zP1eAmRdRebHbW+eGk
 rRxYRi4Uwi5eI71fE5URq7TQUs3cG7+0kiYI/tGfnbGjtFrTJCKkbKTTx+PHD46RXDhb
 +85Q==
X-Gm-Message-State: AOAM531AQaFsM7covStAZTE3DFyc7e1cVkrD8eFqqeDYzTXhlTotqGms
 OqZRozzchEjivXtCe4zV//Z9jC8m8NkjDPNW0szUM4yKw+Pvtx3/mPTeMFaKqBVMDSSxuwOSfZ+
 TQnRl52Scb9IMwCaR23EpFZC6Ywyx2fFzIoj7r7w9JlwJNMr/u9famfmiqNjYBRoN8KVsbA==
X-Received: by 2002:adf:9124:: with SMTP id j33mr3255862wrj.272.1601372588589; 
 Tue, 29 Sep 2020 02:43:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id t6sm5887797wre.30.2020.09.29.02.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:43:07 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/2] hw/arm/sbsa-ref : allocate IRQs for SMMUv3
Date: Tue, 29 Sep 2020 10:42:51 +0100
Message-Id: <20200929094251.151722-3-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929094251.151722-1-graeme@nuviainc.com>
References: <20200929094251.151722-1-graeme@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=graeme@nuviainc.com; helo=mail-wr1-x442.google.com
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
 jamie@nuviainc.com, rad@semihalf.com, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, leif@nuviainc.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ozuW7nvNLH6P

Original commit did not allocate IRQs for the SMMUv3 in the irqmap
effectively using irq 0->3 (shared with other devices). Assuming
original intent was to allocate unique IRQs then add an allocation
to the irqmap.

Fixes: e9fdf453240 ("hw/arm: Add arm SBSA reference machine, devices part")
Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 47e83252c1..9109fb58be 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -138,6 +138,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
+    [SBSA_SMMU] = 12, /* ... to 15 */
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
-- 
2.25.1

