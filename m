Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF34CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:02:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXZI-0003h0-Cj; Thu, 14 Aug 2025 09:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYZ-0002QD-Cd
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:47 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYW-0004PF-Od
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:47 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-32326e5f058so732052a91.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176379; x=1755781179; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHDom8RqSvFBhHj/9Q/rXAoVV+sGpC/X8GRYrjCGKNI=;
 b=XLHYs7y9RNKJjUNF9jng37BF+QPVh+op4kRJy35/wj0MgAm73Ag0xOUJBTV41/7Nx5
 mSYbB21B8msg5RrSHyIiuJYpQ2uZHezUxJdPY32lKv9whmilGRVHncezbk4pBStAMLNp
 zv9AEubXDQrZaix2K1MmrAdVlB5dR1ZFJQ3mfg0HwYnglLmUjSbTeI08Tb4rwlE73B/1
 piaALfmRQjtefWYRgHLVBNCIcU+OMcGc0sS4tvduce6fiO4J7l1naVa51vGwJ+FCZlx5
 YlAW6jxY8gvkMpsjXvvQJ9m3MB0km7Y8T2WYRJvSRSfT/GKYSJ9AcsKgsO1Um2NeECen
 EI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176379; x=1755781179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHDom8RqSvFBhHj/9Q/rXAoVV+sGpC/X8GRYrjCGKNI=;
 b=I0XHcvEqIIQAhg1Ubzj8mkvzoQUL+xZTWkDq8VOkj+//pO8FZNdDac53pkR1eTQ6rc
 7+xCIQqlUJPf5iPwdcvMH8bufpyDfUkIJy77zE5iN9S2s06v+2ZAUeRisOaJ+3NB16fz
 dTLTcV8s1BOnYyZMAeaBkwvJBfU1wFpwKOL7/cKAT8nDJDYpd877P4lWfLPjIHbtxiWW
 lZQD3giS3b13juf1SKUgvedJKdjamE2602zgasVWWGRYCeNGbTNaN/XKhpgMH9Ju9jcD
 yb1HhjohJ097LTaJPlRXqCNgze3YTlU+vJXlDs+5waxyqaG7BKWiWUlSB/6BKEd8nsvf
 oiHw==
X-Gm-Message-State: AOJu0YyWHUVG3uuopVUGIVRaG5A1YHqgupc44Otfzb5haDnnRzounUJ4
 vqhL1nCwWFbHAg6oJrRqed+0h5PMbSjBiQhuU65EvMNO8PrHmdR/sGXF+ZfNc0TmCO2kA1ny9Qo
 9kRj/RcU=
X-Gm-Gg: ASbGncsh5GEBjryP0pooXj/+Rprvm4q7eU94dk2QApNtQMSs7EoAx3BFR/XvJvFSOid
 whONc+596foF0aGylZBXzo7ZHdT3pgN+gSf/XYS0P4amevNiiE19DP5z6cTn43jdo3mGczT7eIu
 Zr2M0Xf80pAcXnvBSlx3TFrsVp0z8s9LUjrzFChWnRzPMckOIbcoYvkreRjg7iPZLIsY2AmDNao
 qhJEhRXwdVyt4deGASEfNSG1MfLjhHyoa4gMG7bljWYI/a7Hf/fS2KPdSJGU1FQPL8CuZ/jnwQt
 /F5sWX1XXZcBXOX91FL54bSCkY+2QC5timIfE2+FXGCHThPravdG+BveUn1rtpz1m3u/E51mmh/
 sqGCFSd4RpsBeQz8of/Hk7OluQ4qjt9N3EqIQevXez6bhyaw=
X-Google-Smtp-Source: AGHT+IF1wmKY9MmDTwxHy7FIkgF2CAJJ2uVf4fo7it9i5WUI1Iv/muQj/UO7ebCQ2zagCFxL7cGg2Q==
X-Received: by 2002:a17:90b:1844:b0:31f:336a:f0db with SMTP id
 98e67ed59e1d1-32327aadbcbmr5085805a91.10.1755176378784; 
 Thu, 14 Aug 2025 05:59:38 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:59:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 30/85] include/exec/memopidx: Adjust for 32 mmu indexes
Date: Thu, 14 Aug 2025 22:56:57 +1000
Message-ID: <20250814125752.164107-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


