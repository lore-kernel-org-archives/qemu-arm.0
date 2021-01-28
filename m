Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp626168lfo;
        Thu, 28 Jan 2021 14:52:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUzSeP0ALvhMHHvqEIoT40vcauUqDAc0maKluYYzAscBTOBwod5SVaLXQ9fr3CCQsoeFG+
X-Received: by 2002:a25:cb83:: with SMTP id b125mr2096420ybg.192.1611874368871;
        Thu, 28 Jan 2021 14:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611874368; cv=none;
        d=google.com; s=arc-20160816;
        b=JxCjHyKNlzSCUL4gFe525Guh9wfOTe+157Z8mgY7dfg44MbdzmAeDAYUlDNVKz7k4l
         6X3ISn28wkA2fMPhWAwqpTiwDW34Ap5RqarQFOZgbb2/1OlCpAhfRvcy6oTG1E7iwdwX
         Tn8cepUjnlJrdcOmLi5ptEU+0Jl6PK5NhkEka3ebIoDqcCTNQ8YZGmRBypBsxy+geeeG
         wCh+pacD0BvqIrQdb0Gz0VQYFuKWR3He0mK1/boO2zx9ftathaXk97FOEGY+nsPmGgQD
         Ie9sEOftuDy+p4tA8MCJyNMhWaCaxs8iUC399ryBvD1b7cg2HDuBNW6dxz8yM62AJZ+b
         EDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
        b=Twj9sBCa5gtewjRaMHzQl/of5cmmyZTODiWd1pCctjKDH1XGRdX0LnES5KtuXILMUS
         saIkx/5kuX5yeuTOHOFCSWHVOmToS+Itnk+y49ccRcNI7BYED2rodsgNDFc64DigBuOs
         VQCIQ4y0cEfEl3nvfSynO634xpFpxzKX/s5hWzyiavPcuy2eTYQfWaytvHhBJ+ocw+uW
         zyzi9iqv1OU/r/pVc6Pr74eISOYEcfPk2oEzp8V/dpXThddVZ1h04An41Q2bZIsYAsGR
         /1bOBlqIZjvxwu0UmjeducTFsad9fIYNPNErnQo5+J7cttEUrkkgTQ8cepGPaBpwoTOh
         jtkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y+nqzgfU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si7235721yba.90.2021.01.28.14.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:52:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y+nqzgfU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5G9g-0007I4-71
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzF-0005Sb-Ql
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:01 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzC-00086r-6D
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:01 -0500
Received: by mail-pf1-x436.google.com with SMTP id 11so4972017pfu.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=y+nqzgfUpxP+MBupTlO6Fw47r3A/VRUS1Nz3V+loikx3SMBMSIQ5WtaxoIjvuLee3F
 Mc4qqSWpEegKlFbVWdE7hp7bw0f4QmUrvfWlMYYmR9VuJGt4iTREmBMNY4yGwExdp8UM
 JzDv1mBc/jMCW/oK7IEmd0h81kGOSTi3FhQpDSWgMNGoBbfnic/JvHOjZDnqb3XLgAIj
 /wg4QD61CZR5FgPb+7Ru48qaGUhtwLgz2qEqKRVNur8DMZHJ8wkWQ/tA6ggsNFZL2Oq5
 ZO8EGFPjdL2luPkW8cv8Q70HyTsFu1KDOQnb0FSe+jwvkuOiGnXgtf1NuJqgojrkGs2m
 NiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=Jv/XEP5vSSit0xRDMY1N75HfCM6bJTJlahgdNrCRYToJb5zE7H0rpyA1ttkeOa1AkT
 YAaYeeylVaR+5/y94XY4Wg7Yo3+bx3jifoGFFX8Zqb3VYTblVkCDhkgFu1PhTSM4whIf
 DHKXe2/UeGfiuqGNykta3AqV2YmWgVNIbdn5orWVn1Kpz4ukg5Msu0H4sQnhuJ3ifeYb
 qiijmxXT2S6FFYesJ+LqF49xdnWk++ljZtauU/NeDf/QZItwmIBcFYqB78vjdtXzyORh
 kSM5+en3C59klK0TVD2Ma0OURdPLHxBNEiybmgq5nlJuetABY8QH2clas+YmjHoQPLHD
 BxXQ==
X-Gm-Message-State: AOAM531aaRAnZ0yED3bhcHJT1EKCdWN7yg9YVK/k7LVhI/pUKwzAHGDk
 y2O2o8mgSy0+8LM7I3xnPsyMRSabA2QjbqBT
X-Received: by 2002:a63:9811:: with SMTP id q17mr1640543pgd.238.1611873716255; 
 Thu, 28 Jan 2021 14:41:56 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/23] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Thu, 28 Jan 2021 12:41:25 -1000
Message-Id: <20210128224141.638790-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: YxyhyS2xo7sh

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

