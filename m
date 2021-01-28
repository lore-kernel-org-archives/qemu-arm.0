Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp626153lfo;
        Thu, 28 Jan 2021 14:52:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJnE3I0B2kwR9tTVUlGNDec7DaGO9KMQsiCMM37HBftWsivXYaBkqKmA8LkOKCCN50BlK1
X-Received: by 2002:a25:d3c3:: with SMTP id e186mr2036885ybf.349.1611874366865;
        Thu, 28 Jan 2021 14:52:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611874366; cv=none;
        d=google.com; s=arc-20160816;
        b=EQC3dCaWlNA0r6ApynE19WQ0SiHLwwVfprCbl62SK+W7RhinA9kM7SRVzxRmgL9geS
         hQKbwNNTrkmfaVAk27P1apqK/Wg689wTvrypgCdTEs4fOaqxhXHmq0UZQvlkL+/JW/5R
         uakj4WSgOrXtgrD0PAjD7/fsLzfoZEakrj4C8Aa+VJvW3QQw++l5JNPiZktXCURqnIVM
         MVHlgZvbA3osCsAz0qJ6XV/es7diJ6bXQlumRa1qaNyoVIexijEJDGWvmjDRS2kTIJxk
         3u0U61BfyUd8r+3BHzQH88cysUqMHKg6pgygbq41kslQrIDPh4+KYnhxLHd4tnpJBu6M
         vu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cekQQRp0i5HZWYUW7TcRhFHir1r8zA6FY8NgWmITL0g=;
        b=Y+shNivG06X9h2KtzVDPcHoDU4HvTP7DYxV3da+XmSaySJ32TRaGxr2C93kLI3VM/m
         d+Pj1NBCXK4rCWqEvBECY+ZkyvnP4XvIeY2oLMcT7Q58AokkOooJeE4lRdo4D1dDmfwT
         l7eh0Hs9+COQE8BKkfaqaLMSqj2HS+sYhbYHQ1e9kQRKRu4ITKB6DMl7K2GfGTUi06FE
         h9/4Z4xoNHj2u/7Ka+FyxhxUdpWZaU84Iz/WpmIVQBWgXwHftsf9tAM5o3WnYwgJumTA
         7Qquc/kJy45a2pwcmbJXnm+E7gx5NeXq+7S/D7wm7hszgiWiGFW6huiTGMep6aEN0E0W
         bLIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P45dcWV3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si6891540ybm.309.2021.01.28.14.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:52:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P45dcWV3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5G9e-0007EP-8V
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzS-0005ZD-7k
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:14 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzD-00087M-6Y
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:13 -0500
Received: by mail-pf1-x432.google.com with SMTP id w18so4959444pfu.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cekQQRp0i5HZWYUW7TcRhFHir1r8zA6FY8NgWmITL0g=;
 b=P45dcWV36QBYWLPKsh85Wgp3WQ8mod5/LU6UhnVpxZXpLF7P+s96jP2oHihUmevjtd
 XDYoUccTDJNYUpp/YOO5UERIsz0Ef1HE0+o1LhZiDkrDkjawz2cv4VEPwgs/4zAr9R+G
 ZvJj3cU3PV039ApCXLD4lao1A2bUseGuCC6lPMBh7Qmi2GF2pq3ZZ2RJtHONPbv0u1Yk
 0eRbDgL9KG1bVKeOaEUQcLCpR1Y/zk3bc9JotsKAahf42KqVZIEnwv+EVf8tDG6K47rq
 NmlLuKObcGatEP00RL1XYZY6qmzV9ddBy289Nkgh4ZTGcQplPlpaLbbTKI4oSRJb0tL6
 CSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cekQQRp0i5HZWYUW7TcRhFHir1r8zA6FY8NgWmITL0g=;
 b=MCyfOe0pOMthTjjHvkXdbW2ltsnwgGPnRT1xQ7IPil56j8ABJMG2UlnxeIS4dGYxRI
 tuK+2RGVhs2T+N+KosCbMTmVGFE64pdgbVMAZAKyUV3RPreEnqyr4KOlqOoq2dAmJqEa
 NJIQnkbDRjQFp7b9oPX0Xmj+iQZRg+eLOCqHOEcDbnhQAJx+daJ1Ht7LblungVk//vQE
 KdiMIdQZ7I5Yd0sJgD8nxNc7xxZRZnLW32NGyN80weWIlNIekKiXWHaZs01dLxgWIJRJ
 s2t2ucp00d42EvD1CtXB+l9sILj6AFSompKTqIBAUQvjOgf+g6dZdkCdmZMKG8yCv1SU
 +k6Q==
X-Gm-Message-State: AOAM531UT9fegMO0z+rCWxoPGLJM/TIgmavuvb4SbZZLBO0AJekbiwy9
 iYiIcEys+3Ou245C4raw6aHA+/s9uIrGM0rS
X-Received: by 2002:a63:fd10:: with SMTP id d16mr1500415pgh.333.1611873718039; 
 Thu, 28 Jan 2021 14:41:58 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/23] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Thu, 28 Jan 2021 12:41:26 -1000
Message-Id: <20210128224141.638790-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ywqYj0xvs47

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

