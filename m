Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp260408njb;
        Fri, 7 Feb 2025 07:12:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzS3HGQDbclCo5pMaqpKZQ6jSXbkOsIMgHK/xvHOViiSDAFyurf10Ji/LCkvTBiiH3JvhgCVEiqY7XMg==@linaro.org
X-Google-Smtp-Source: AGHT+IGQQwDKXZTMn1KSYSOyAOyREUkMd4WHgbYBHZjX2t7GT9Nfby3CPpHJsuq5UUV+Xgfe+uMJ
X-Received: by 2002:a05:6102:a50:b0:4af:b94a:3c3e with SMTP id ada2fe7eead31-4ba85d88fbfmr2465963137.5.1738941144478;
        Fri, 07 Feb 2025 07:12:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738941144; cv=none;
        d=google.com; s=arc-20240605;
        b=hcAeIt2kwo56N4LWDR1z3L5IzScGj2pkprPZSG2Hc0u9E5oFzlJeYygJmvlxBXrNoM
         zpaYa9SBO+DezSi6SeyWMBhbKK+CKdYMw8NNIdcCKqMQVDLXi/KLCTdrQCQWpUIF2uG6
         q4v/sE/cqiElq4hrwcPbazo+EsvkfVUkD3PmOo7ohMuuaRj4qPDxQyCTnFMW+dUH/Y50
         hz2x3tuZKmctdLI/7LFm9jDnskiizRv7cmeudJ50L5qn5++oMzyoo5wQKOgbJWMZTfgw
         V5gPAbvCwWapQcGpH//t7ka9pQodAS9h60UDmfBGH2MY0XwueUL1ce7jAzfQp7m95EPE
         B0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1obwOCQYgIJoyANHuisDQcFcRKOfDSN12M2elLIY2RY=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=bhsWx33kmt8KfrMno/riTlobmOEbZ0xHWFjdrVq/M6+6o6quTRPXh7pjmy0XRSJ5mZ
         n2fY1HEb9A+PXvMr04F0CV1m7xCmMYqOLRDLHSV7jpS2GqdkXI7RrI+zalSqUV2aiOKx
         HGyOZnIpwTfFojzn31a+e3NLXN5rfTheeFkTox5lB7zCbqfZz2SJFCBBx/gPTfNUeGq0
         yvebOaMSjMqZgnsS612acoB2AblZv4z+EIRbl4bA0vP4vKLx0lX9spl6qWNDIAZXPi5T
         Rptn11pD0hp1cYKuQEuu2JDBPIaJoTOMXOt5xgtvTAVGcyFj3APdck2RpPgNohmiXkgV
         2QZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEdAEZJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba96b3983csi39752137.377.2025.02.07.07.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 07:12:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEdAEZJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgQ1Z-0001i4-RM; Fri, 07 Feb 2025 10:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgQ1Y-0001hd-50
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 10:12:08 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgQ1U-0002lA-NE
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 10:12:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4368a293339so23756075e9.3
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 07:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738941120; x=1739545920; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1obwOCQYgIJoyANHuisDQcFcRKOfDSN12M2elLIY2RY=;
 b=jEdAEZJXGnEdjtxP8WI73ISp6hA2CLurZiR1Kd4rWggBrMrfg9JG1aH/MsDHRgGvdj
 wL63Jc+Y22xxM1caPtDEkdeByM6ERxqIl/reSJs+uetdptMD4DpqHNFjZ1SyblfwO1IM
 c6nJxN4jYVbcbzt1xBVtx6sHAgOnQKJo6zz3A65inO5RXsyU1baJy77jravrOAI52URm
 IRuOEwiZFre0Ks52YfB+VXrlgIGuYl4+6OObx98C255j7+VGvnRwspKFDDjawsInd9wC
 sgJ26mDaXY57afGR1l/tXryjujgUCcqtMxed5y3HzQwUcp5rVfhCJQ+630OPjKqlkdCi
 2exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738941120; x=1739545920;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1obwOCQYgIJoyANHuisDQcFcRKOfDSN12M2elLIY2RY=;
 b=eSwZRuZxZHYkEqCdPaiN6qJ7/wAfRe03kq9EMUotQSfsg+vE36fJEj9cXMEJu42XG8
 1kqezBqX7GriIfMXtkghvXRz2TNFoWWrOWC4JKLKal5Oakl6qYOzM7NuwMj8IXe42cnM
 rGGm+yvV6Ru+zYnSddwBbZKae9r9o3XcnA0hfEQ2ztGlfAP1J9hrmZ7yGqDQ7TL8PQeW
 MSd7KYMFUG5qL7kPsH/sqoyoJo2x773xILDxXzfSzdJ+Ve02R7+hTyWTODiPqICkrTtz
 3MIIV45DROZNxi2qiM6A6dJBTvza/xiwj8C3Bp+hhpttv4kpFdgmH+Qhnvx/dUuLokR8
 nBpw==
X-Gm-Message-State: AOJu0Yy0Pr5+t/kHgbUtbd16kwNjf5VxFWW4VmcvFSMDQHB0De/sRQxQ
 RLxk+vTaVUgNR/usCNEMChP6n5bfWqdw/CwH89X7izY/9Atld+FQeB4ADRp3WoMZtwD/IghHMSe
 6
X-Gm-Gg: ASbGncudGGkpRbC+TgZ2lx+yxPFYuZZ3RhKRBI+MFhdSgow/FEx9TJQNI9HLGNredMF
 gZPFw+cm6OK3Mifk4hfKIaE1ygn0TQMr46w9QWzLu2ST1k8X3Ny7aJVer/rA6sQkVengoMgpbOK
 0lkvW9YfubI0q+mBBRHLW9g3wRfkvAbVS/D4GgTS39vYhP06zqAGq3SkqjQMuenGD2lXLpyATRT
 GJcZvoxj3mtFI2wsdnU1TQZ430rNkO5SPz1SLyz6BwT8ULh+wS1lWawmIjcP30gtECzFheHGHY/
 srfcbyN29+Hu7zJkmbOMlQ==
X-Received: by 2002:a05:600c:4e56:b0:434:f9c4:a850 with SMTP id
 5b1f17b1804b1-43924989231mr35158855e9.10.1738941120346; 
 Fri, 07 Feb 2025 07:12:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da96640sm60568925e9.8.2025.02.07.07.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:11:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] hw/net/smc91c111: Ignore attempt to pop from empty RX fifo
Date: Fri,  7 Feb 2025 15:11:57 +0000
Message-Id: <20250207151157.3151776-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OzW5QaIKVKiZ

The SMC91C111 includes an MMU Command register which permits
the guest to remove entries from the RX FIFO. The datasheet
does not specify what happens if the guest tries to do this
when the FIFO is already empty; there are no status registers
containing error bits which might be applicable.

Currently we don't guard at all against pop of an empty
RX FIFO, with the result that we allow the guest to drive
the rx_fifo_len index to negative values, which will cause
smc91c111_receive() to write to the rx_fifo[] array out of
bounds when we receive the next packet.

Instead ignore attempts to pop an empty RX FIFO.

Cc: qemu-stable@nongnu.org
Fixes: 80337b66a8e7 ("NIC emulation for qemu arm-softmmu")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2780
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/smc91c111.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index b18d5c23c39..0e13dfa18b2 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -182,6 +182,15 @@ static void smc91c111_pop_rx_fifo(smc91c111_state *s)
 {
     int i;
 
+    if (s->rx_fifo_len == 0) {
+        /*
+         * The datasheet doesn't document what the behaviour is if the
+         * guest tries to pop an empty RX FIFO, and there's no obvious
+         * error status register to report it. Just ignore the attempt.
+         */
+        return;
+    }
+
     s->rx_fifo_len--;
     if (s->rx_fifo_len) {
         for (i = 0; i < s->rx_fifo_len; i++)
-- 
2.34.1

