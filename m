Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp496462lfo;
        Wed, 3 Feb 2021 11:24:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwr4wAiPDgvvCEpHwaMyFw//1wVEI0pvk2h+5iVr5ODzzOq7UQQQevLoR9lLps5LTid///u
X-Received: by 2002:a25:b683:: with SMTP id s3mr6371724ybj.442.1612380245461;
        Wed, 03 Feb 2021 11:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380245; cv=none;
        d=google.com; s=arc-20160816;
        b=Yn0UxRCZ7aTZvacDoFzumJ/cUhwRVffjG9ADx+YCFz0WCMneR12KwpaHE9wTaiykNB
         OwZ3u7Ij26udYrhQiIIi2fyqDgc2Lfd2KedDXQvuL3DLZNVyVw3uItsLqwmTo5VZarL7
         VjLutp0uSqdhmG2R8sS/H1cVE4FXSI/+rb8R53an8Cd7v9Vwnb/ocprM5g/ALYUMI5/+
         821vYAKfWVAS0TNLM0nor2g6RcrmU5DDAjIrVuSNDYMglhFpJ7av5uK7mg5vm8QKDu+b
         z+nHGk7G+G57kJL1bWcAlCGU9uzhJpLG78aMUZZkTpN6p0vSwygQgGp8raQgYQm8jROK
         or6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Yq9neRE5uhExlneFuBSgGmaVVsCJdyYjAvE1n9KBmpg=;
        b=R4QpLQL00C+7RG6q21ow9LU9tOKflVGobebAheB1dCgu6Bmr/AGKvP7WfApksP1l+m
         +SeRqqfaAsT0YkiLPrlQvzLMgkkZCnIpT7SLQ7omllqGF5AVWRq0wHmD/pzoONG3W48P
         tHE47VpMgGVNPJ4XbICrdeBP9BnbtEq9ChgPpvurskwO7Gfc2u8H/3NI4VyZ2S0ibSOK
         +NW+f1lDKaqJPho9D2D2hUCTxVmFBBouvFxhBcezdHrp5RWamOsFVaFyhP//+7dUEOj7
         YjSYf/jMYQ8tvFK+7RI4nyNg48SrRb4RTV+jBarIQwphIlmfLo6dnd9juos96O+WDxSM
         KEng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lBxeyrV8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f203si3170919ybg.92.2021.02.03.11.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:24:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lBxeyrV8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Nky-0006y2-OR
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NON-0007Ix-B0
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:43 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOD-0001Yc-4r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:43 -0500
Received: by mail-pl1-x62e.google.com with SMTP id b17so379894plz.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yq9neRE5uhExlneFuBSgGmaVVsCJdyYjAvE1n9KBmpg=;
 b=lBxeyrV8U8jCYnP/Lm3TopyWot5KL0pnqKrNf2G2NQhkoOnp6OWBiW/5ZDqF9JVIj4
 qjvo2g5vd4w3qBewxNhKw+VIRFnCchJnNg2vpR9NDRSzghvJ4dySI2SZC2nwklaP4VRL
 sy7R2258B+ifesy1R5PHeGkZdnYSrXloqPzv13sv+eZD0lQJfnCUntjefdBsl6OdYoRM
 88YfUv1ylfyrY6PYmCz7Xl9oddDxs2BDWTmq63u0YTKJiqOBMcYdNlBi10Ihp5LNYtSY
 0yawN1Tsa8z87rebMjL+SPOJAVdC/ZOPZUSXC/bMnycDyATF5sDjFuWW6M45f0sDh3HS
 Y+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yq9neRE5uhExlneFuBSgGmaVVsCJdyYjAvE1n9KBmpg=;
 b=FhpdNA2sLwL0ooLrYPmUupS8c8Gt2wd+p1Z1+ETDPB/lR1I6v5J1wqhSp8qXi56qg2
 qC43EdtUGSb5awGviIVUkp6MqAVvuvR7f1xOcS9GI3CS+yzoNH+k75msgdMWGeSpCRtk
 LxiSzrPtVex3ilmI6PhcOmHvWfKec+XUeZMLAFnE3KxXmZlRj9mbJ7MyN/Q7UKGDse0d
 MHLPssyeJlHfT7WJhxe1A4CznBF2TrOmAU0pUQJWxLiIybZMGb8McFeu3JXzyTObgXb3
 0FSMmkSVJ8xFrbxJS3lIP9/1cW2UWD0JjPoiXd3RWSEsQMLarMurJnD8r/2LPdcWMKhy
 nBmQ==
X-Gm-Message-State: AOAM533OQyLuJo/xX3zhiFNJeHs6h3UHhcx9xRZ0Xxkl/3zyBlaax04I
 L0mRsjD5ajNjCq1lmFOqY5H4w+WP4TuGG2+T
X-Received: by 2002:a17:90a:65c4:: with SMTP id
 i4mr4333803pjs.132.1612378831130; 
 Wed, 03 Feb 2021 11:00:31 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/31] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Wed,  3 Feb 2021 08:59:47 -1000
Message-Id: <20210203190010.759771-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eS1BuOxupeAM

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Warner Losh <imp@bsdimp.com>
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

