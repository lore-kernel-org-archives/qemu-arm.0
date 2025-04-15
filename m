Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2818453njc;
        Tue, 15 Apr 2025 10:24:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrUF/JQnBFmOG2CxJqmEA7Qwyf5miT3qkqfAIS83Jk38qNB0CzvDvPYCT2V2ssYzz3WNcOm1tbf647vg==@linaro.org
X-Google-Smtp-Source: AGHT+IEdkJuxZzmgO0yXS2iEO4DhJWP52weaTUCOfYe411GVKO1SEyt2CM/WKPqec8sdgsYBxyNA
X-Received: by 2002:ac8:7f0a:0:b0:471:cdae:ac44 with SMTP id d75a77b69052e-47ad3af047cmr1976211cf.47.1744737870791;
        Tue, 15 Apr 2025 10:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744737870; cv=none;
        d=google.com; s=arc-20240605;
        b=cmabbAUiSmGkc0sO0hrNMe0ujYtFhtHMCOHNbUWKxUtIQQcePnybg16f0Yqsa6J/9g
         7nBel1hsK0jEZ/96fufTQa54PjCXfFZHYO/Uno+Gt/HFiipIL011BgNhXc9uONUx4cyP
         B1GRfnQE3P7G4IwyKIV4FUl+whrWjVY4H5h9dPSJuA136W3JiUiWdFKhz9BrrAnoT49z
         a4b5xd3NYRW21LaGIQ+/6ZLKvlRA/HY7Q1nZzLUBT2Qwc4+mhV+sSlUAq3j3o36lttOJ
         JIwShbW1Bs213Hb4iBYMR6HO3Vk8wYtv1xuSYLfaitKpvXBurESubpOS/KhKJ6VyKzj3
         kATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Nbot2wM/CbjkQnVa9b2IWQsKjCHYPI93P9Z4ISNUVXc=;
        fh=5dDhRaRbX3tP9Vsj4H76VAlPUgnYVMxhznpdbMeD+Rc=;
        b=CUElfvnCqkZT4sSoAHifCIVcye3ArnUL/0lGlgyPT9Pq47uL9+zzJollP7ZF1nygtA
         T5Us1HIeAyEZW2w0wx8/OC/Fv8PrszxIkZns8tG0KCEqhdlLK4AJ/1ixbxZ0etQDdG2r
         bwUP1nzYP3U/v/htu/EFFSPvP1ViebUw/r32k8UOV229NCYsnxlzn/EheK3hWRK3P5bX
         beYd0NdhuBPq/qp2hqcMnvwbGwFrFz8SsENkJzflwfnP6QDRE/MzljVwul1I4DuiSdgU
         WXA7jh7BQSqBK4IcW/ENcY8iwZCkOILyEwgk+lL5u7fK2xpKqndUOAUKy5IqSgmRfZ7I
         1nZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qao/BCMK";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796ea67677si122292761cf.0.2025.04.15.10.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 10:24:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qao/BCMK";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u4jzv-0000BH-2A; Tue, 15 Apr 2025 13:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4jzt-0000Ab-28
 for qemu-devel@nongnu.org; Tue, 15 Apr 2025 13:22:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4jzr-0006uL-7q
 for qemu-devel@nongnu.org; Tue, 15 Apr 2025 13:22:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3440070f8f.3
 for <qemu-devel@nongnu.org>; Tue, 15 Apr 2025 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744737773; x=1745342573; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nbot2wM/CbjkQnVa9b2IWQsKjCHYPI93P9Z4ISNUVXc=;
 b=qao/BCMKJSmx1ahPLuD/cGtxbGQXcWIc+1YpPps1aXqLLiRK248Z5xI87F1RDaeNLI
 p20J4PxkuOaPNjk+Y1ROKcwd7hqZvKRzgAIawe8NymyoyyxFIckmVllSsp85uXRCkbt/
 s6bA+iVLyLDB/AwdzAVa5pWaV+an4hosB2XQPcLTQtuhbNTcvQcNnvj7/Lq83Rtpm1yM
 Dj3HTMzf29igmbFDC5769c2wGXnhiq//ejIwabQMhu+ivOzF6iG2o2bzqAib02QSc3ar
 LlD9ZHI6iRDOUvbqQWd8j9DOgmhjosL5vGrMv8wunIeC0Wt+Amf81UEj5DNIUZ0qWTUn
 iRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744737773; x=1745342573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nbot2wM/CbjkQnVa9b2IWQsKjCHYPI93P9Z4ISNUVXc=;
 b=TEGZENUaoMbul9UsTNbrFTf4Kh4rL7LAsJwlC3bsdziOewkch3x5rq+O4WtbWf2DUs
 1UMPB3bn5mkwe5Sgz+iv0fAQLo7K0STMgRF460KEZGTwVGVKGHfV1xMqgU18Th2zJ3Mp
 2J4Wng8tP6CwK6DmImU/44izB+iUIwPUyVq+yZlwPlucG5HUFovFKgXRqOlryax0E4nh
 fB3W66hlmBckQr/lKRkqAretR/WWfZighy0DCx70uHvU4Bczh6g8iB6h7I3gidjyz+an
 jqlhTdccRNx2CZLTq4nlAn5PSzevDOody1fVt5Kjzu2bfoxkPQyz3BpCeove7izXO0Ex
 jBVw==
X-Gm-Message-State: AOJu0YzDqZWNlZ62M5nHgGAiWcUxWyXeQOKrjAkcdTLSinaNgwcqnRmG
 fDav7Z6pFRReB9Yw0AUOLCvWZYUd3fbrz+Baut9UD5Q9xWTboONR6OPq2ouGUPQ3M5nzARlgeKO
 S
X-Gm-Gg: ASbGncuFgYq5wIogxiSQW1+6e5vwd21E+rwYOTgLYqRHriuXgqYDsV+wGQ0XPvkrWn2
 YCMCz2E+3oxPQxnTjMLCsUH8KQRSWo1dJxvObQ4m7OIJJzwKCLC7JY9jUij4wADtOPFxj0PnGDr
 kU4hzpvwBSIcoWwk5YTYFZ5lW688xWFxPKcYgu5cBU9z+buN3AV/vzTeMYESmXuLYsElGtou7Va
 scuUPdcMzlvc7lKnLFVCd9zBk4psI/ZApQKe0U44dA+kxJ/xdMvlxSdeZ3y8FNFqMR3tutMFUyI
 VlmWIr3By4XOMsHpN+zWxORRuaAizlwjuxFrKX3mOlkebl5utFP3SPfRR5lXSlXB1TvW7T3l0Aa
 jKa8rQlNhgXtYifnVoupK
X-Received: by 2002:a05:6000:381:b0:39c:12ce:1052 with SMTP id
 ffacd0b85a97d-39ee272a0cemr262324f8f.7.1744737772634; 
 Tue, 15 Apr 2025 10:22:52 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445454sm14808715f8f.83.2025.04.15.10.22.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Apr 2025 10:22:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 1/3] target/arm: Replace target_ulong -> hwaddr in
 ARMMMUFaultInfo
Date: Tue, 15 Apr 2025 19:22:44 +0200
Message-ID: <20250415172246.79470-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250415172246.79470-1-philmd@linaro.org>
References: <20250415172246.79470-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YyxFfGEti0rl

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 28585c07555..175fb792375 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -25,6 +25,7 @@
 #ifndef TARGET_ARM_INTERNALS_H
 #define TARGET_ARM_INTERNALS_H
 
+#include "exec/hwaddr.h"
 #include "exec/breakpoint.h"
 #include "hw/registerfields.h"
 #include "tcg/tcg-gvec-desc.h"
@@ -724,8 +725,8 @@ typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 struct ARMMMUFaultInfo {
     ARMFaultType type;
     ARMGPCF gpcf;
-    target_ulong s2addr;
-    target_ulong paddr;
+    hwaddr s2addr;
+    hwaddr paddr;
     ARMSecuritySpace paddr_space;
     int level;
     int domain;
-- 
2.47.1

