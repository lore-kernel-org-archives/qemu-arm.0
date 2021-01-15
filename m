Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp677278lfq;
        Fri, 15 Jan 2021 14:54:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtTVkZDzsqgtGtwaSfhYvx2GgErbiQnxN3oTRAzhD2TV7gyD1VkUMtAcgPFoAQiT1pYJZw
X-Received: by 2002:a25:640a:: with SMTP id y10mr5701715ybb.343.1610751298451;
        Fri, 15 Jan 2021 14:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610751298; cv=none;
        d=google.com; s=arc-20160816;
        b=AQwq2q1R5GFDJfKQkCPfR7dlRinDr0aZQ98pUK2rnYi759BbXvxAex1P4U7eW/cY6/
         nAS/f92m5N9/uisKAmb7TcmAbcjA62hWnzZixsmZ1u472WGfJNLg4AuGaoC3eS5Bs9ou
         U/sVG6ORA5OnEk2/wuEFPmoODJwnOfX1nfFrVNjJ0j58Mgp2rpf3DDmvN26pF9lAgevT
         8O4oTmymPqJ5Ds95BFNmh2E05fkYq+Z3hNb8+u3uJHN1fkIflS0xluVs71U1FmFPNnbh
         M1J1OPNaAvDkuGbGMRk4xE3T8HEnGNRJfHPLMAZaMcDYLvgQtFZ16ZQJCgcu4wqP3A8i
         Ax7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cekQQRp0i5HZWYUW7TcRhFHir1r8zA6FY8NgWmITL0g=;
        b=Fojtgs4ecIsr5W9+xVUcKmPF3/dXPFXli1KN05k7B7eudNv6Oh1G69oO/0be5iM2eF
         bmC2HiZmwHgLCxabv9XJUp/eAf1gPG2fRUe6EifsOSzv8ZpEnZHE7mfUmGT2e26Bdknc
         FQO8pxDPYTkRUYz/tDpiemxiF04HtmkTXKlKp6P0VV/BzAPrI0u3IQ4DtHqt+lwbpvQw
         GfgSAIcExJfyntF82dTg8Yo9aiUBwF6T51vOhnK0hhDYmN0W9sQXAJl7nfRrrLXD9q/f
         ogFvW4VfPMFKdaNhS8XAqZEEYnZLeXVAUgyzorIUQghOmL53q4M56Hzpoq7zJH45GiRH
         GkTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jWLwcRYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h131si8135839ybh.239.2021.01.15.14.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jWLwcRYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0Xzd-0003S6-Qj
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsE-0003ak-Fr
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:18 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs0-0005FN-2f
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:18 -0500
Received: by mail-pg1-x535.google.com with SMTP id n10so6917583pgl.10
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cekQQRp0i5HZWYUW7TcRhFHir1r8zA6FY8NgWmITL0g=;
 b=jWLwcRYiTngZ/Nzz67lB7NXK3iTuCNdax0+JWEbw4ZbC3U3xoWG/MaR5AOW2OwF0BB
 wbAETgmrWBV8aZ6tqMm8j8Qjl0gIutGuAvU2+sBOBKrlcakQLADxK+jSwxefH69a4c/t
 vB7HG3edLYHC4TEXrRmyyME2Kkt/IfiVl1hIXRS/A+up3JLGmngS9I+mSFqrfqn3fYV7
 4e7IPFPTegFAa6LcAiFwrONaKLXfNy5JjXM4CxrwYLyzaeFLhuLMv8Fc80XLtLju9U+V
 uNTczzPWKSv6Tc6jEDOE8LfeuqfZB6DF1xQWt4ZWCw9HNZdI/16zg20pL486EHWK4A0j
 JoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cekQQRp0i5HZWYUW7TcRhFHir1r8zA6FY8NgWmITL0g=;
 b=tNFVkQr3b4UlKwWCORqvVPCTZ5gxSPkMqnSW76qlevqxHMn3lHW/40fSDe5K55p4L5
 CxJGiA0NilZsPnoGdILc73MvSKY7x9A9j67vWxcXhicz2GMv87gaYclLf028gOpr+DvW
 8Ckkb4X3qfG570RqGDwypxMsRmnSp0CUeO5HDfrolA36c0b6cuFK5Wa9dkE4zmXMd9UH
 acfVEjahUslMCnN+iNP5RVWQ7l/h9MATi9Rnt9y6K4uc1h0Pvt+jc0h0WlFcCsGi22KW
 cQgLzcZPZTFpmzYv6DChhjmLfkymk/bqxTrZ+vhO7F+mt2bRAqeiYMxHaW0+66mDRS5p
 0wzQ==
X-Gm-Message-State: AOAM531+aygItOI97o/qC92A7W4QMxaA9tlbt2BXF5QWMv+3C0cEIMVd
 3pp1ns4Dcx357Tza43SdeHNmHA==
X-Received: by 2002:a63:6305:: with SMTP id x5mr14466820pgb.216.1610750821621; 
 Fri, 15 Jan 2021 14:47:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/21] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Fri, 15 Jan 2021 12:46:32 -1000
Message-Id: <20210115224645.1196742-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
X-TUID: omiHxo9deN0U

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index f8bb1e5459..4076adabd0 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -218,13 +218,12 @@ extern unsigned long x86_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access. */
-- 
2.25.1

