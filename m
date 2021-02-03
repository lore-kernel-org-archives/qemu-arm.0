Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp498104lfo;
        Wed, 3 Feb 2021 11:26:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoepXZRczdZQELpeTaT6s/GOvXihwkCDFAP6jWN/x4W+f8lVGrQ1mG/lpGahnrOYPJG2VY
X-Received: by 2002:a25:ea4f:: with SMTP id o15mr6571145ybe.44.1612380413239;
        Wed, 03 Feb 2021 11:26:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380413; cv=none;
        d=google.com; s=arc-20160816;
        b=Ctt1sj8IUmmow7t1ElAScPofqFxXAsaBhhi9Fpgqzp5CRUs8tvvNBxRxEtnokoKqDs
         IxC443Ai9gnevVFG8bd9koaEftlfb9BWtfDEX/Ua9Km7cD4IyyFrjedz5luahMujFkVi
         MWLvLZ3TQ2ghjVeNHK5OOg0TUTQbxIuqEZlHS/nQl5a1i9zUHJ/JLJTaBILBdXgPbhix
         tBd43J+FtjRpAUxoYy5g6wBZ1ktYqqMIpawapF4sXjTrgzJjg+ZxYZ6JmNvDkGXchuS1
         UIQ1pjgDS4biAiVmKq16BsNMzG0aLuMXjeTaV4oJplDPa7r/+qSG8D3OpWmqrWKgKBe0
         OcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
        b=CxZ4jL42KtWFKe4fUszH2YWRLcESQUmTwQVxDjaWQC4CtEZaH30OlLUjSKNtc+tDtC
         cFnR3jnoUJ7kLSKNzvN7YM6HqVbKGUiGFK4SOPm/RbXWIHldhbzn/lpVbPElSqn8Sr7/
         Q1Pu6N6E/PIP+BikVBsJXWCHXh+GEz6tXVpcfHZeTm1wjruqLm2/DtZsrxAECmzcWLeQ
         meKCEuKmU6Qe7S5v7sCdnw4a9UPYpXSQQSIheUCIW/azwWuNdn/tgHcWd+NjZh5liKG6
         3I6J9HJIl36BsUNZpT6JSy9k2iW3DBmOBX3jbSvzKFWQmE8ouXuvcaUI0miL4EXIbvr8
         BiDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bckRd6Jn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si2537685ybk.90.2021.02.03.11.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:26:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bckRd6Jn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Nng-0002Qr-KG
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOM-0007IE-Qx
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:42 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOB-0001YN-8H
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:42 -0500
Received: by mail-pj1-x1029.google.com with SMTP id g15so243475pjd.2
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=bckRd6Jntpm8j9phal4Wv/hlW8xv7NccfSHl2zp6pd4x/pB0UZBdENRTyqBRSI+ZXo
 9+3wKfrTrutDC35eRD62nfV0bGyELB2vmcgcqyAcsK0vUWolWqcGgTNI/zoEcLh7dWJb
 TaXih1jLxmjf6LAkUFZqPfbh5fdWwI90hfqp6XZL1qslkFI4eSKkySTKlUVW8d2tkmVy
 L4I4GY7dfcZ/7Frz7ZisKmEa+gmzBf6NEkxrqMQ+8lktZ1yBecPDWzleYgpTM1bX6Owq
 EmX2takP5qrW4WNksabmJmRbaF5LaCPv1ojQx0+g/TDYLiDZgoSdNH0n75Q3qY6fZ+lH
 wB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=jujGLkRy6bxTs/4YZ2NWhZjy4UXrziFO0BDSUFpKKEzh0ba7KlGkGFWLSXnBViTHXx
 T4bb/V5axiVxC6IQNjYQ52CFfv+TyFGdaGq06Z3BtTWaXkzmYQ6nDMjMunN+e3GzssGB
 zgJuF7IXUSpY/rY+xdK5HOHlRz42UGczeaG1zxGfjCPmcxksCSMwkAyrEj0cH3nsiu3D
 p19m1sBVTn+JgPYvncktBXeE4rddwsSET+OSIldHfo5WRjhznQDSkXjUT6qkR7SM4Eh+
 t3sFmopdaei1snIk38fRCy6BU5PU8ncu+sdBTi79JrmwwB/REDmV5zq5WfDmSaCj3Dws
 U74g==
X-Gm-Message-State: AOAM532jtIOynFM9/eNrKYBkIeZ6D4PzNH/8l4XwjCGXrSxnih/agFUH
 I5OBSvLO/t1tYuG31PlIDekjJA==
X-Received: by 2002:a17:90a:5209:: with SMTP id v9mr4553068pjh.8.1612378828804; 
 Wed, 03 Feb 2021 11:00:28 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/31] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Wed,  3 Feb 2021 08:59:46 -1000
Message-Id: <20210203190010.759771-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hoWLNX6sCzVh

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 441ba6a78b..9251337daf 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -488,8 +488,8 @@ extern unsigned long guest_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
@@ -501,9 +501,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
          !guest_addr_valid(addr + size - 1))) {
         return false;
     }
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ :
-                            (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1

