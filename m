Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EBACA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:14:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxI-0002Xl-Be; Sat, 30 Aug 2025 11:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMe-0006Bz-UK
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMd-0004Io-Ea
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-327f1fef76cso1211254a91.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532578; x=1757137378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHDom8RqSvFBhHj/9Q/rXAoVV+sGpC/X8GRYrjCGKNI=;
 b=Gwb+cN7v29ZIpDaMEiAxE7mvYw0kEP+sKHgQjl7s3WWptbv4Ok1n+CuC4/vVJmjY4l
 vG93ThrvnIFtoNARNTJLv0NjKadjjIRoYt3wpEvu91cu4VfBTUpehhFilkoH8SmAMl7U
 JKVwTL2jXoAlzRhtQF0vtT3cFW9rZ/0Fxj0LagZIwV7sHwdDa9MFyqwugf9T53+43dhG
 iCYIMw11wvgP/rPhvDGy9sfSNt2/I7wxAO7go349e5Pxhg4AVu0FDoCYBhxjLHDUQHWY
 tq4I+5DuXM4xXRxEnICyla6aLZTFGYFqac6JDb7pmXlxr+bl86C4JvH7UWFG1yEb78H9
 sd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532578; x=1757137378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHDom8RqSvFBhHj/9Q/rXAoVV+sGpC/X8GRYrjCGKNI=;
 b=TN9TY0XxVJQ6pdmwgQUd5qiiJP0ajcdqD48XhdJkjhk1bbcyWbi5mmaffOJ8LQnHeI
 TldwpqUrUeRG2e5XOhEg0KPwLvDyC8l+vjrteTxgxip/gGMUrCLYdE4CPX5XS4PTV+E9
 4d9BKiWQWwS1RL3uA39C8n83QKSUUIutfzOg28I83A3BSWpCLn/Z+xq9lpQ3GUVIM0yf
 wjMSzmus5+k3dWQPDylcZAmw/weBCrQxDbGPiSuwD3j7xxPXYHIlVDjnK0PrlWYKpPcd
 cusyetiPTo7nP3ypd1CnCJGq7GoiWV+oj9+65J9DPJb4S+xv57nmuZMz9ggewoEIhmIx
 QEdA==
X-Gm-Message-State: AOJu0YwwUA8+CTElvzS84AEUIMVQfrL+MtitB+XzrT2h+m+3VhHJ6wT5
 dMre7VTYMFzdiZaazPctKOt3C1muw90jLID4UUPOttl2Amxbnn6iihe9ClQWu6vKa06vXGj9QyK
 KWvA6B5U=
X-Gm-Gg: ASbGnctLMH/w1bncU2L8HCBL281YDZKqKABavOtJlnfqwCb2CxXj9JoeR7lL6OqXqQ4
 h8tSLi8+EsAUEJ1eS4NhXs83fCTuK7LO6xoeoMkCODs80vCy83jytiHvVXwzesKC3j7gUuiTbT8
 CeC/N8q1QbIkfq1Nmgh5q2pZbOGViW4oMOMhO0sDr7TapR2C4vXcSfLiIoFpgC95AT4EvtdZZhd
 fg6dyZZg0+RXtMl94SSoiitq7KR6zesisViDrlj5HfPXF7w7m1vPATYaDDm1qBEF5IGGejWoaSM
 N2kesKQ0F9MgzCaYN/DLyThOqd7aGlq3tDAFTnFUff5aoA6YWTLtmAXM65bGkPdqrFDAsWsfHab
 ZU1j2Odrhn8c+4sA8i7aOu8dI+gv0U1Hhz0NQenefJIwmAlvBGJsNMzDCLUBxaE7VBGm1uJ4=
X-Google-Smtp-Source: AGHT+IFRoMIMA/fa3Wp8hcRs4bRrRir2Nsz/n+9i9sQEJyNXT3pA2BDwk4dQjmWsBNvDGPoAysUQ6w==
X-Received: by 2002:a17:90b:4d0f:b0:327:ac8c:10af with SMTP id
 98e67ed59e1d1-32815704c28mr1499179a91.36.1756532578065; 
 Fri, 29 Aug 2025 22:42:58 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:42:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 30/84] include/exec/memopidx: Adjust for 32 mmu indexes
Date: Sat, 30 Aug 2025 15:40:34 +1000
Message-ID: <20250830054128.448363-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memopidx.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/memopidx.h b/include/exec/memopidx.h
index eb7f1591a3..66d9c58b3a 100644
--- a/include/exec/memopidx.h
+++ b/include/exec/memopidx.h
@@ -25,9 +25,10 @@ typedef uint32_t MemOpIdx;
 static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
 {
 #ifdef CONFIG_DEBUG_TCG
-    assert(idx <= 15);
+    assert(idx <= 31);
+    assert(clz32(op) >= 5);
 #endif
-    return (op << 4) | idx;
+    return (op << 5) | idx;
 }
 
 /**
@@ -38,7 +39,7 @@ static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
  */
 static inline MemOp get_memop(MemOpIdx oi)
 {
-    return oi >> 4;
+    return oi >> 5;
 }
 
 /**
@@ -49,7 +50,7 @@ static inline MemOp get_memop(MemOpIdx oi)
  */
 static inline unsigned get_mmuidx(MemOpIdx oi)
 {
-    return oi & 15;
+    return oi & 31;
 }
 
 #endif
-- 
2.43.0


