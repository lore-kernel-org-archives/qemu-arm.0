Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp484488lfo;
        Wed, 3 Feb 2021 11:06:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ1hpU7J3wCHORpNvGhLFku1PlMp9i9Ts02CVkCXY+7GhxVLF2BATwnuZwl0k1BBLJXEbl
X-Received: by 2002:a25:f20b:: with SMTP id i11mr6744144ybe.273.1612379185723;
        Wed, 03 Feb 2021 11:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612379185; cv=none;
        d=google.com; s=arc-20160816;
        b=YVGNxAzBLVjnFgZ4Mt9rLqFB9P/ZP/uvrZnqEn4lOEY1flLuP3p1DH4Bgk5lUyeZ05
         kccxTiAOSvBXvrDlUCKOxfC75gEn0tjqKY2fbfppnlSy9QF66rgfLZR+xFnMS2uckxDy
         kywH43lMlBCBKRhrWqUTxz876t0KWEps9SHjoKm6ws/a58TWUtiamGRanWI2IqCLoG/R
         9ctiHizMZnqubZJo5Y0rID2fmzk9pkbqM2i8wzGTuuZXHTVh+nke8+h5NyWe+MvRVWwk
         UBgtpPdVBoIRh6iQsq5H0MFEXG4slfydWipFKhRmvW/xRCgSGh7rvsGjYANWGAyq1hF9
         eHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
        b=vCLyxhayixaxbP42tOdiZ4ZeUFYNdO7pRfScxqH22rxIR7j8EXE/o0J+c0aiIdYlR/
         j65hbKPRtx7YB67xXSVYai6BA3X+A2Ea90MjbuYXH6p+ud5GaazFxd8NK6IbST9wGIZt
         p0KZOfF2dscF4l+fQevmkGL69VbDroUAU9isQKPV/0JWcQJZHVnjYdgxvgO3xcv8vKS/
         VRMTwBWzbltG/Saf/te5ablGnQNS5ey8gqid8NhvohLIbYHX7uoDiJlTUEB0wvvls4Qa
         hyCcWoSpZ1skOIqx+Y3WJtq+GvuXLQ/myMR9gXFxSwDS1FKX0DgPUwXuwLqfq0sDIPx7
         GHvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v9GoRtut;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z95si3637730ybh.58.2021.02.03.11.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:06:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v9GoRtut;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7NTt-0002T9-4R
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NON-0007Jc-Ud
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:43 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOF-0001Z2-2b
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:43 -0500
Received: by mail-pj1-x1035.google.com with SMTP id q72so230376pjq.2
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
 b=v9GoRtutR3idBBXtfxTizd1A4cp0GGn00gTm2PA31jYYWTUZgAfwlPmtI9VD2jFGTC
 s2kp7kkjbYvTWeljhoQduJ+r+Kbbos+BLNjft6lIYWYrZmAfpthfrhsJn5Vnq1eEcr2W
 tsHRqJM5D2sLgAZp5AQr7dsFf2JebIvaA0FbtEDHn38R1fUQhe2gEEf/uTWh1UAs/67Y
 lI5dW6cRUGqPrH0zfydeALs8a/JnLC30bsP9nPjCdQHC035DZtaUMoUdtHogzEIVKdv5
 fZr1suxFvQ86+1LM8GHX8KawmriRIrEKEu4NTiVBWTAmfq3ORyl6K7ZSSp8TdMdYN5OV
 hupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
 b=ezMpMnu2pnjHze9Tg4yLbm+M5NVAn+XkIQBK3XVOF4aF5068z+JGCZEDyKztmkZ07y
 rJ5iCukECxO55H8TcczPIjuzeS2xq3mNTV4Z4ShfFY8lnmJHjv27jdhFA/EhoVqjAM3K
 E0KTwA369Q4+xwX3+2pD+ViYkLtrUhfQFgtkAau9Ap8urfaXMWMgmmythDst8HZeItsi
 yUc+bEkDz/UJaFY2P81oBhmMCoNDRBBJ7KENGPNhuQym8GOVtc8VZLYxFJJP1ePHVfjc
 cMajtiK7/2xPTirHjv35ETX+y3ZjhNiUCgUIvSOkzkcuO00CxKoOB0/FE+kgZb3YeM7w
 gd/A==
X-Gm-Message-State: AOAM533sZgllw1dKh5cUnPH3QC5seMC0w+61htpS9+vx/Zc2NAe/VPI7
 W1P7QYvCPpyQcqyiyIewH+RhUTSpyPAqebhx
X-Received: by 2002:a17:90a:5601:: with SMTP id
 r1mr4390757pjf.236.1612378833161; 
 Wed, 03 Feb 2021 11:00:33 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/31] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Wed,  3 Feb 2021 08:59:48 -1000
Message-Id: <20210203190010.759771-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pRGzRhLX8509

This is the only use of guest_addr_valid that does not begin
with a guest address, but a host address being transformed to
a guest address.

We will shortly adjust guest_addr_valid to handle guest memory
tags, and the host address should not be subjected to that.

Move h2g_valid adjacent to the other h2g macros.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5e8878ee9b..4e6ef3d542 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -77,13 +77,16 @@ typedef uint64_t abi_ptr;
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
 
+#define h2g_valid(x) \
+    (HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS || \
+     (uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
+
 #define h2g_nocheck(x) ({ \
     uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
-- 
2.25.1

