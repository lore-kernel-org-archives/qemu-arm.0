Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C34C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:07:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwN6-0002Me-BM; Sun, 27 Jul 2025 04:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwM0-00069W-5c
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:32 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLy-00049x-Ig
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:31 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2400f746440so1189665ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603409; x=1754208209; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOJZIZJj/tIs5sXQuR3l8mzb1hhaa8gRwgUU6Thg5os=;
 b=ngAtlPtsJncqr06iep+oPXpQHy7aKiXvkQ+7gqQqUXhIYA1GP65VoM64zJozqMtkba
 7FRBPzeL6nIvrxtum47SwdYTn/GELQ9gdcZd7fHo4LE3lABak/rgGdUfbdbkKkBL1s9B
 KzOzP/cnfaRE8leH/Cn98HIz7nGpSi24S874J3W6l4SNXZoL4EJ/Br/2PdzwnaBsXpI9
 MnSKbPqtVHn7dkQYlHfflsHTO+x65UfW8536X0rEheFlto/SwYXNozK01fd/yrUXqOYV
 WTcsKyOG7ZTnfK1qJRqiXvFuVPvqOx3Oad2jmwt3Ar1WTlTgfFeFCYYpjd4OZt6+7fsn
 svPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603409; x=1754208209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aOJZIZJj/tIs5sXQuR3l8mzb1hhaa8gRwgUU6Thg5os=;
 b=D001T70hUferx1sv0Vq/Cn+4eCgqZuR6tWWNhTUlN1bJdXFkI8nPVLIgb8IAjwPtH1
 2iNJQsvK8lGs7S8v/vaD2mjpAKRDzIJSDnUtjaFTTgq+D4WRMYaBh1AGKWGeDyBxqcet
 cRKNpdMd2j39DY+Epsq+kJ4JDxz9CzuTl4ZUFwg8svFKTXx6zOuQnePwV3l8/fB28OZP
 BrX84qMlBIzd4VMOdZFrAT4qIzsOlZtakW9qOmW08v2M6SvdI/C4kwyaOciYf0QBCYuo
 7tgY2O+C3xkD78DbVSdnisg/YklveF4iQuNkd2J+YU9qk+EG6WpEP8t+VhWp2+u5aqrg
 stsQ==
X-Gm-Message-State: AOJu0YzsyG6RA3B+G7fl3bxgbHpRYVU3SwbxAbZEs+Y5ywWzxAUwUWP7
 eFtRtnZIbrwIAE53dQ3wnUJdD9kssvvSiFPnXKKhjYI6iUpHUZfaKRKJ4KN7L1mVrEw=
X-Gm-Gg: ASbGncvZFXXbDz71groCMyjQ7WGoxsJnvI6UOFwzRLMJejOaMFTGAj6HhNTuRuj8IPv
 6if2pejyobHo13AG24P7XgLOjQ5Ill+0I1dLZ5fQL3d8nonOYUyxwPTw6rtWm/h2sm+bzeMYAgQ
 kD7rzcCFusaNh2jTd1BPCorOOZiCQlTy+sqdAV70w9O1zjzZUHO9oJOB6bFvG/bOFEsYP0IDWYQ
 QVrTfLVuga8rbzAjh614tCHraI2SIB03PvNNcjtQ5JgK5VjjDOD9Etgm0l/wyhTsBOwntfDnaVG
 ILShPsmnBOeeruSdenW55sWmSBhduAkAoSD/INzqLP+V2PXoPtqV2g0YBNAjdN6v666ba/GHjAu
 U6Wusf7O+GeHoot9W1qirq5LxjIoAEZhfC8cjKfxZRRmaghq1nwCG5wQYoPkmc+XBRmWm5XBOFr
 UMXVGwqdZlEw==
X-Google-Smtp-Source: AGHT+IE38hch7fbzFLmFmhk0gVXu4FVu04ds4WO/+HboMxMk6/MfAwsZjKFErX691bsc8n/IpFVfGw==
X-Received: by 2002:a17:903:2ac3:b0:235:15f3:ef16 with SMTP id
 d9443c01a7336-23fb2ffc4a3mr110180555ad.13.1753603409284; 
 Sun, 27 Jul 2025 01:03:29 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 27/82] include/exec/memopidx: Adjust for 32 mmu indexes
Date: Sat, 26 Jul 2025 22:01:59 -1000
Message-ID: <20250727080254.83840-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


