Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1224554lfi;
        Fri, 2 Jul 2021 03:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxklLsNi8kPTPJdMtlN9Ryu7NbZdqRcqqUcbbqkjN9ZrCJu0R9E3pLRK0G46AHMi3sPi8eJ
X-Received: by 2002:a37:7d04:: with SMTP id y4mr4782502qkc.399.1625222601496;
        Fri, 02 Jul 2021 03:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222601; cv=none;
        d=google.com; s=arc-20160816;
        b=in2K67ARaxdZDn3PdO0D+v2RRkUsF7qnHVr+CSeqV7IxwqMf+5973O4ndjHmPfzgYa
         CpwSTy0MacgVvajsDuuZcUANWTDUl3N2M42lYJ2uiDnJbaQLxvdCD4SXtSSHaZm+qCO7
         +CxGfOuUcvozu7/Q8M1xTqyedDoFQtMlzB4HAYCJPb4BM9XxpV2tHEJfOCSqowblfgno
         zNifxvUZF6MfKQZwzjrutjppjfvGCIDq7Oc6ukx5IdyqNSUfkaCnT1JfvB/rB27c9G97
         wVfUF0Nbd+rSpRiiKK4zRnD3F4QZXlEcnAJKxPySOOioi9/Veb7FE4Bpbo3tNG5IcgCW
         A6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=b4cQvDxv3U0hq7oSF/cGe7YwUjG/pIr/hMSWdlGoaBw=;
        b=Zhnx3lFShaX6Ne+eJ7WV+ACFLqe4EYTXbwk5U3EjfahTEb5r6uVpt0cEYyUD6Z3QLY
         n8WN8kVBiPcC7GlD4hEJkvdPVY7oGNOit+6rYxqXRjk+4oRWtG1YHQNK6BA5YOfVLsPp
         +vQd/rSZEHy2PfDdosUlG/9KJBy2TJ22RZ4IjmH/iZZEf4OkYcvXUdTRkvYLUNEKBeGy
         vIQwGayZj5TEcttaqO2YtJiK7AF6EsfXfGqQknBd3p3navRFgRfvPDx+gDyELU7+vviR
         rjieYVyHD5/r5pDhqcwuxwVZXgWhkXFlAOGRF9ZlTEgJlW1LSw7xn5oPfunJ80PLSr31
         nGbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PEVszNmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si2468945qkp.268.2021.07.02.03.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PEVszNmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGdk-0002Ff-Oz
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb1-0004hZ-BT
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGaw-0006cl-38
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id r3so6388157wmq.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4cQvDxv3U0hq7oSF/cGe7YwUjG/pIr/hMSWdlGoaBw=;
 b=PEVszNmTs/x19yK9bZJV98DZatrUysk+75eEB8JwhZvZSkjxT0VxfFwjdW2pZv2h8Y
 5XVZBuqmBXMtW5bWHmHBEuSw6XiZ9uQtDF2TQeLnW336RgyXImdzoJEVU99rhiX0O4da
 GK5bEC+Lin/VqFdiKOJFSDS0wJ3FrXTnvWwSjE9p2a6S2+kUmdBegUA1mTRuxsS7XAJB
 CWhcxRvXFKVC1mRldZ4HJ0/MGjehiK10LuUSZjht71W0x53GB8yKhyXoqO0u64kxuIcw
 qhVTq96fn35DUGHtTrEIPKLSCwY2WiszXGzomqBEBnhx/TINgHMFLLXwJTMsjfATWwdk
 OiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4cQvDxv3U0hq7oSF/cGe7YwUjG/pIr/hMSWdlGoaBw=;
 b=ni0HTqU1L9KW47IYPBtYiz3i7/pVD4pKcfkNIvl8hMg6wYGlhVxViYzHX4lhlrI9z8
 RFUxQyhGTHqtl9tvaPxBFiGlkqKdm9AHyNCJrVaIK7KVzOXDgPeG1jxbJMkVUtKl3MlU
 9OkvrMtNyBHZJV4cD0n6X7rAmu3ZMdd/fHJGOrbyjlEuqRsgRmzL8y1tUGzSeaI3OMpt
 XS+o//+fhKc4K1LYBJ1zVqp4xy+8F+uvCrc5QD7bHQa3ypvPgR5Q9+ZyI17FgN+kuyC9
 PbpsKBRf5V+E7S5SO0Ec7pULIU6UzIeBXVjJErnul6KDkxnYGkt632m6I5+JHzUHuD3k
 HW/w==
X-Gm-Message-State: AOAM5322VLnzUkdGrSeJ17LZB0sfyQzp0jF4piSUzc8UTjNdPRoeYtCi
 M2TEQWaKjHPjCnCdFO8pzOElC1AlNFxbnKOd
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr15536075wmj.60.1625222424453; 
 Fri, 02 Jul 2021 03:40:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/11] hw/gpio/pl061: Document the interface of this device
Date: Fri,  2 Jul 2021 11:40:12 +0100
Message-Id: <20210702104018.19881-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZlSU+m1ios0s

Add a comment documenting the "QEMU interface" of this device:
which MMIO regions, IRQ lines, GPIO lines, etc it exposes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index f3b80c7776f..06a1b82a503 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -6,6 +6,13 @@
  * Written by Paul Brook
  *
  * This code is licensed under the GPL.
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the device registers
+ *  + sysbus IRQ: the GPIOINTR interrupt line
+ *  + unnamed GPIO inputs 0..7: inputs to connect to the emulated GPIO lines
+ *  + unnamed GPIO outputs 0..7: the emulated GPIO lines, considered as
+ *    outputs
  */
 
 #include "qemu/osdep.h"
-- 
2.20.1

