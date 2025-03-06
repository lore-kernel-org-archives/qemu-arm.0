Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1609594njm;
        Thu, 6 Mar 2025 08:41:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnjgPDDuYRr+D6Lm3PKJzNj4IULveH3yRtXqsjRIp7q2joiOT6MpCL9TZm352Y1+hYqZaTpwutPyJCNw==@linaro.org
X-Google-Smtp-Source: AGHT+IEHLc9q1Mlro4ANEcHs++bgDM9Q/UrcxFtdhvGHmCiBF5+0Rtq4FX5Rv1sCfSag1CJM+EIz
X-Received: by 2002:ac8:5852:0:b0:471:ea1a:da0 with SMTP id d75a77b69052e-4750b4e708fmr116337731cf.43.1741279301345;
        Thu, 06 Mar 2025 08:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741279301; cv=none;
        d=google.com; s=arc-20240605;
        b=DQRIPe/en+8Y/i3RruPcxjNmG4A2ceVrR32+ypivwGaqQWzLBUp94raioxoo80q3aL
         6j7Upn5AqF1wM55GZjMiKeViFlG33hcGibtBWrcpxFDz0TplpY4PocPrvG53WhkUlKHp
         1vfgRQzeU76tyTosYAirlNRVFVOIGY7uElDWKzNYbMOH6TlSp34pcbH4riMxTbKs5xHu
         GOyIKJv362wkjhu+zXEZAMomCeH3IvjHPxenuladPKiKizX5tk85mroQbxwVTOKWYt9Z
         lqtoKfL7nSglAYc8RU6aVqYRB04GF8kmVoy7dIVldRoZGS4QsrFm4oZzW85Z9uOT4JwL
         ce8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k5hIZtfWRRivBnmcIBAqfcb8VlTDxUApJC/AqX8qCP4=;
        fh=VshoAlqtqBhobhKzu0+imjKxUeQDsCkMxo3o1hV53cA=;
        b=gePM9ko8h6kDVVSS6Hs0SsZr2N8lfigxKsI51lXnWjtA3wxMPSpoYNNxtywc+txuPn
         7rWMdEjVpAN8oj0QKbhekXXW3463C3jFiXBq8Th9aSzkoNNcbXa8LMSp8KsGCPjCJHxg
         9uKvBLc4GOW45LA+pEAXmGDqtkPx1Brrb8VG9SQWMic5TGII3T8H1fNkWwr30r0m2VNK
         TvD99RnqjwSi+aVa+YASRcq93mIrWBLSDDAMlSh+cVl4NEBa93JJdLZR2encmcitR+nv
         WBGoS9knRwfjkwr+ivRKBAgycAnFHenQD1BojU5LvBPZQUPr+BkXCIrte3oQ9MHKr/J0
         i/6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aeCxaM4d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf9267si14404601cf.289.2025.03.06.08.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 08:41:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aeCxaM4d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqEGB-0006vu-BP; Thu, 06 Mar 2025 11:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFx-0006km-Se
 for qemu-devel@nongnu.org; Thu, 06 Mar 2025 11:39:36 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFv-0004Xx-Nh
 for qemu-devel@nongnu.org; Thu, 06 Mar 2025 11:39:33 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43bc4b1603fso6021235e9.0
 for <qemu-devel@nongnu.org>; Thu, 06 Mar 2025 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279170; x=1741883970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k5hIZtfWRRivBnmcIBAqfcb8VlTDxUApJC/AqX8qCP4=;
 b=aeCxaM4dCe5pBIWdJWX2aetAxBvkC+jC8SlF6DN9rPXudbQ2297KRZFHgv1WJgYByk
 BJc14/pnsoQgaFDZpqtJEHqXT8WE2OMYCsgEn5SQh5c3QyIrDUWu491Js8K8RDN7nCFH
 njt+nkDzMJU2lkKsPpQvFS/VpjLqefnDdHahbALRw6Np+2RxrKBtgczZCy577vUXl+SP
 gnUB8kQ04pNYFofrIWjK+tIAAgAuanATbC8I9j7RMhjp2ZnLOV7hIKez4uZtKvbaMANp
 562uhsoZ0tUHHbbhaPT7nucTXFNScrEUwCfN/RmS1cXQd+V1/H3JU8/LLrMrsiNReZIe
 uQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279170; x=1741883970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5hIZtfWRRivBnmcIBAqfcb8VlTDxUApJC/AqX8qCP4=;
 b=wFqc0p6CEHHh7vLi2Uc1IcQtoLfXHDPljpuAzYfhZt6wH/kGiTb7N8kI+1rYmb6pA6
 zFb7AQWNgud3qNgL35v7Jtkf5zvYl66Qb0pFCLrQKGBcWTXFGhzCKuCc5v2T5Og1jhs2
 woiseU4rNPKVh25/+VhEwKwie7FYg4Mu5NW6MT/anPjXV6D+U6vtcZ9i85x4Rsb17G9b
 YyW3mT7sz4Rbcxxif1zMWMhN7oeGJ+nQWNuhuS3PCMDHDZcuJ2TYKF9ntnTqv2x7QNtp
 dWvJiKXHDf24W46ftM+mZkjmuIPRFyiaqAx1ACW2KcSKbCKw3S/tS8TkEWxmOAZYxloM
 Erjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnFgE2FFYRceXla+VZ9yCKFcY03JD1HLN8G2rIXn0lBr+7bSo2knBH6EYJl29+GVDKC5OHT2KALc1h@nongnu.org
X-Gm-Message-State: AOJu0YyuMDhuGQenY9rJjIJvknLEz/Ix4iTGAPR0F7+yCmUluuVcQ55A
 nnDoz4qKQbEIsA8PmeEF2YSQWnQD/vJUE3wOxYyTARZh8NCILHrySj2K90/3P3g=
X-Gm-Gg: ASbGnctY2cjlms0tY1U3yp9qBGHZZ+KCiQx/o24r6+Go9iW7VuOZoJzPra/vTLdlBgO
 DyVqkI20XCM0vOgUUYOx+sxmMLPwIABp3KZ9a5yeSxzSNVNG5ZblTvDiORWLeTqfgJ0msxESW66
 RFGzN0yNzP6pFkrClD6inNqUaHfdGruBRhNQdonjI6bPpE5F2ASLe8uPd6J96JsSBBQBD08TEYP
 artR+r/oxZia8++LKopksP/5FkqhWgDm3iumzAyqcDSQmRIOa1UgXlmh10UXE82GdNFRg6sfujg
 tCcF4tvtKzCc+/Er/1wdT+u9cdLxAdoZAPbcL1uLHLmY4ekNhoA=
X-Received: by 2002:a05:600c:4ece:b0:43b:c390:b77f with SMTP id
 5b1f17b1804b1-43c5cb68e08mr1457075e9.26.1741279170193; 
 Thu, 06 Mar 2025 08:39:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd94913fsm23999905e9.37.2025.03.06.08.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:39:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/10] linux-user/aarch64: Remove unused get/put_user macros
Date: Thu,  6 Mar 2025 16:39:17 +0000
Message-ID: <20250306163925.2940297-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306163925.2940297-1-peter.maydell@linaro.org>
References: <20250306163925.2940297-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: xhsctIWqF2MR

At the top of linux-user/aarch64/cpu_loop.c we define a set of
macros for reading and writing data and code words, but we never
use these macros. Delete them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 48 -----------------------------------
 1 file changed, 48 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index c5d8a483a3f..fea43cefa6b 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -27,54 +27,6 @@
 #include "target/arm/syndrome.h"
 #include "target/arm/cpu-features.h"
 
-#define get_user_code_u32(x, gaddr, env)                \
-    ({ abi_long __r = get_user_u32((x), (gaddr));       \
-        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
-            (x) = bswap32(x);                           \
-        }                                               \
-        __r;                                            \
-    })
-
-#define get_user_code_u16(x, gaddr, env)                \
-    ({ abi_long __r = get_user_u16((x), (gaddr));       \
-        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
-            (x) = bswap16(x);                           \
-        }                                               \
-        __r;                                            \
-    })
-
-#define get_user_data_u32(x, gaddr, env)                \
-    ({ abi_long __r = get_user_u32((x), (gaddr));       \
-        if (!__r && arm_cpu_bswap_data(env)) {          \
-            (x) = bswap32(x);                           \
-        }                                               \
-        __r;                                            \
-    })
-
-#define get_user_data_u16(x, gaddr, env)                \
-    ({ abi_long __r = get_user_u16((x), (gaddr));       \
-        if (!__r && arm_cpu_bswap_data(env)) {          \
-            (x) = bswap16(x);                           \
-        }                                               \
-        __r;                                            \
-    })
-
-#define put_user_data_u32(x, gaddr, env)                \
-    ({ typeof(x) __x = (x);                             \
-        if (arm_cpu_bswap_data(env)) {                  \
-            __x = bswap32(__x);                         \
-        }                                               \
-        put_user_u32(__x, (gaddr));                     \
-    })
-
-#define put_user_data_u16(x, gaddr, env)                \
-    ({ typeof(x) __x = (x);                             \
-        if (arm_cpu_bswap_data(env)) {                  \
-            __x = bswap16(__x);                         \
-        }                                               \
-        put_user_u16(__x, (gaddr));                     \
-    })
-
 /* AArch64 main loop */
 void cpu_loop(CPUARMState *env)
 {
-- 
2.43.0

