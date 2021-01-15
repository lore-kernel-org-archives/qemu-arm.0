Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp676474lfq;
        Fri, 15 Jan 2021 14:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDSfWRhrGWP4JxNLzliHQXrHxL9y/d/yq/bj63FATetJpcCiEKPxrjz4gdcV6O5PmOopyl
X-Received: by 2002:a25:2610:: with SMTP id m16mr21262594ybm.389.1610751219035;
        Fri, 15 Jan 2021 14:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610751219; cv=none;
        d=google.com; s=arc-20160816;
        b=OfDS7aQR29LA1NoEzjLFmsDX9ksJrWLTv90RQRcSY/D+dQ0nL4CyIXtvcgjHcRgns2
         V6x1WwWwfQ2r9tfu56mCi/ECPbILM6YbSn3ZctEeKhWe7jFYc3LyrggcDdy5dOZWDUy3
         rE6kbUBpV/FcIW7sw7gcpJbQYP67nlYbBHsb2myIxHQUzA7CzSa/ATnl6m86vEM9soQ0
         BAAig1f/5mGaHTK7O18LZjwkqAJDpXz0PwuBkHxlpB7Q3mL4tBNkgKgAV8NUKYdx7Ys1
         yZPBRhOfyPrIOsA1gjnCiR65GmnK4sV8MaWM6fM/xWWZLwsZnCS1BMihEpGdTIeEONdK
         fdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rr4uhte3iLsKjX8Cbli6gBSl01cB/KM2FqNYctfYPe4=;
        b=MGOaIInSaxYSf4XO5k7HAe3IpPsWEIv60oKRPbxXi+FyBBa7Q+s20wtUtjTloFUxbk
         cI/URHlQ6I0+NNoulpvB9hJgWO4/uys856DxXV/FjUCc3j1qbewt9zPaLXzK/ZlmdMxQ
         gEEEx7g640ULq487BkEw4lJGFbqha9+7BtU9/TxVlaYYU8zfS1TjTueHf4Dmg23qdWvN
         WxJn8vL9rqIuVC7ijAh6C6Id85g+3JRJ71i2IIr6VXnTkxT714Ae+tWGTmhx9vF3Y6Eo
         a+822xI8J1cxpyzDyRrjw4ZV09eO3ma6C0nv8CvWjWLScpUa3rugvaQARXTEqngDNCxC
         tBCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZwiPCxB+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l131si2015004ybl.76.2021.01.15.14.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:53:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZwiPCxB+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0XyM-0001Rw-ES
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsC-0003ZK-0F
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:17 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrw-0005EB-FJ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:14 -0500
Received: by mail-pg1-x534.google.com with SMTP id g15so6927498pgu.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rr4uhte3iLsKjX8Cbli6gBSl01cB/KM2FqNYctfYPe4=;
 b=ZwiPCxB+pgxqBSVhiKyzXLXxQL2ZxeJzOVekdmh0Png2yTdh5LHtbGJfe4xgh5KT5j
 MONKrUNjyAZIo/Q1APKbecM5C3a2XWQ9n1SkdQYEIAjD3by8a1EfLqIC78kqEvzPy2Iw
 X/eFDlBpD3YCYzZa19NwkpOOx/Y3yf+HWoCgmgKo2BTMP+Trc3cJb3vfouNGqfVOHF2Y
 J5j3S2NZgFFGIVUnvR5Mzy56uZgnFXNcA5fWhPpPP37Eb9xSnyHYOAKi9+o1+1smjgD0
 z6HBA6xwvzedCCq9CzuCJnhO++Kf0zAKKG6opn1QJNchgzU6sBesjQK/wu7znGiPrZRK
 7YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rr4uhte3iLsKjX8Cbli6gBSl01cB/KM2FqNYctfYPe4=;
 b=fvocsuirMti1xAdwBkMBLcM61BeENGLSNeVZOIOjcOsSiWEtEqyYxO8jYhUEbwu78l
 E2qFSku8qxDAAXgugjDS2CCOYmdJW+tztxMSHQOng6Zw87ihn6qxMVw6JBK395Ha5g0V
 jBtvDNVRizfendt1Mja/Y/mo6HTrCSXtYUYa7mSRWhu3T9EKUaHAdm1UYDCRYePHrTy1
 XJvnbveKvMT7iK5aez8mzB/dLEAw+Bzfc5EENWyo3qmv2Dw+hAQ1YMESt9pdDR5m+K2Z
 sr9qaiQLFHfk/VZHIdsKl7V/5i7japDm43ka539/3EgfZCXMhCCHsaDU5DXIe1YNLHv8
 D3PA==
X-Gm-Message-State: AOAM5336ioucxHpnVxox26ZmbXxl2jI609vOkfLjBaF3loccH5vSy4dp
 +4JsawQIcSguPqef4av2lBYl0+PJ2wleX7OD
X-Received: by 2002:aa7:9706:0:b029:19d:a2c6:aeb with SMTP id
 a6-20020aa797060000b029019da2c60aebmr14865467pfg.36.1610750818505; 
 Fri, 15 Jan 2021 14:46:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/21] linux-user: Check for overflow in access_ok
Date: Fri, 15 Jan 2021 12:46:30 -1000
Message-Id: <20210115224645.1196742-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1cNUkzt3ehtl

Verify that addr + size - 1 does not wrap around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 534753ca12..a0f670832e 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -489,12 +489,19 @@ extern unsigned long guest_stack_size;
 #define VERIFY_READ 0
 #define VERIFY_WRITE 1 /* implies read access */
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return guest_addr_valid(addr) &&
-           (size == 0 || guest_addr_valid(addr + size - 1)) &&
-           page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    if (!guest_addr_valid(addr)) {
+        return false;
+    }
+    if (size != 0 &&
+        (addr + size - 1 < addr ||
+         !guest_addr_valid(addr + size - 1))) {
+        return false;
+    }
+    return page_check_range((target_ulong)addr, size,
+                            (type == VERIFY_READ) ? PAGE_READ :
+                            (PAGE_READ | PAGE_WRITE)) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1

