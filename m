Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp675149lfq;
        Fri, 15 Jan 2021 14:51:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1P9efPxmJnvV7r1w47RstyireiFtPYbqfpgpDJAsb5L8qN9W51+iFEZhNSsEspzVbyjSk
X-Received: by 2002:a25:d98e:: with SMTP id q136mr22482368ybg.280.1610751092469;
        Fri, 15 Jan 2021 14:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610751092; cv=none;
        d=google.com; s=arc-20160816;
        b=rYiW/G6EMDOX4nzd7hmZpMof1UyrFt+QBVeVWMMwzWoUXm4oNy25ettJJxrZ29B6WJ
         K4/D1FB2ZyfPk8FI0+eebWRZeHh5t1WLYm+j8GDcKXnYVte+AflMsBlFkFm350/bLHME
         X5Lb5pdPH2jtF0VnDHU6bqGfud63/dDVnx2tIQpCe6VgFFK+1/+dm0PR6e9YBpiwwQlM
         Hz10rcBiJBGGmKsNl2vbEn0CVV1x0ilrwB+2mlT8w6xxlQhLi6xU2FHxsMZwwjL196/d
         SJVocGC31+PyFL1KLUvOAeD8IztnnrJpNYKkOBzSmKh702MRz1pHt7e+bzUc2UasrEp5
         6CtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qD60vJJte7K6bQArBY0DduIczHDfCgP2vdEmcn/7+GI=;
        b=Ha/G1SJtPURxepQFvh4BlI4nU1eFoZ6n07XbTvQsrob3/gVBtZ6LZJHxSyZ5GL8WpO
         7pmQ8FNgFod9NCRbgYO/VRpZbDtvrRMQEUhkPjhz2yz62cG7upCJsfbCZ884TfkG/vDX
         BJwceZPQKxt2D0FQlO55nZw76NuwBUDFzbgQdvaOHcXcSsa8G9vl69ECJ7FidDoHLgZb
         P5j13rVVh9U1IZTVWXjLK1luAmS5cL9JWhx5KtyCgOckFGlYGL3EFlWUp0/+pFugun3t
         RlSrRCdBAuICn5RxUTjOvhWp+woHasDFRiFlaQEFJePSXRCVpgCQobdL1k6P1oSzi0PF
         LjOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YwlZV9wY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s64si9138612yba.294.2021.01.15.14.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:51:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YwlZV9wY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0XwJ-0008Gw-Sh
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs7-0003Y4-Q8
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:14 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs0-0005EM-2P
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:11 -0500
Received: by mail-pj1-x1034.google.com with SMTP id md11so5895681pjb.0
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qD60vJJte7K6bQArBY0DduIczHDfCgP2vdEmcn/7+GI=;
 b=YwlZV9wYAP5Rt/Z+Xt+EGN2PHf3ePFuoh8BcVKwFszB6IR8/OymngxewUfx0X8pjZ8
 QQvfRKPY3qi3o3MQH6vejNAIvBoa+ZaC8E7cCs/k77dMnDp7eR6Ww6V2vtMrtxDEowlo
 o+dw87Dx3tAv1XLvTtH/HBSCoDy2z64DrCPajZ7tf2ZPX3OGUE3/lukbVPDX+uQ8uGrq
 f22EJjUFiSRXNyh+O9PraGYGWI5ffY76jdBR1rm8eF5//l+vlAla7h9LLzpXRmKILq1q
 x1KXup0FOSq++Kl0tlOogZNFskRAZ2a0imbe2c+/mRIhAUb4J6wUH2fWsXh3DLZI+G+q
 LTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qD60vJJte7K6bQArBY0DduIczHDfCgP2vdEmcn/7+GI=;
 b=cLz6Dvnf9tk2voosk5q5ns9tFenoPbEXrAQzWLk2oGlpoTHy8gcSy6323zKrX5D+PM
 dE6/WOrVsxZAeBxijV/yNPf4SwQVHIuagQAGQEEdYn3t1zR0mxzhBsEnU1LWv3zidTUy
 zbi9Sd7Wa01huqg2h+Vk6Z9APj5E32LKKrJwgH3so35mOgfJURCt1CFY91p28tY8yaPE
 5MuijeS67zM1kI5rmo5wIHjgYTQ8zas1gzCoZ41ogwvLm8h5f3McKpdASINDMlfS1+f9
 vxItyDO8wRwQaBTeNdVLsN9YvpopWkPZ6WODQxfDLsTobw7/QbNwKWbIpKUWMSqipJ65
 CEyw==
X-Gm-Message-State: AOAM532vIEDU03YxKFiv7pVQZHHx1jLIM3Z8TovelP/wrxpBE8ZiEviV
 M3etRlrwFhjo/av7uDeCuA6bxQ==
X-Received: by 2002:a17:902:7086:b029:dc:8d:feab with SMTP id
 z6-20020a1709027086b02900dc008dfeabmr14921287plk.22.1610750820068; 
 Fri, 15 Jan 2021 14:47:00 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/21] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Fri, 15 Jan 2021 12:46:31 -1000
Message-Id: <20210115224645.1196742-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: 42X8lJk9GPXl

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index a0f670832e..329a6de669 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -486,8 +486,8 @@ extern unsigned long guest_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
@@ -499,9 +499,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
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

