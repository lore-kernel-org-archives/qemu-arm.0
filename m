Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2681143njc;
        Thu, 12 Jun 2025 17:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoxpdLb3QGx1ixxKia+fWw8xT/Hp8/+PXD/Wl7Awj0oGgMWxNoJTLDec2y0ROsRagFFvHD+x5ScwA5iQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFqsS7EkX+jNIHU2sNm7yX8taIIvH987GZw5WLcBqDySD8Jqg+V7KExMNre8q+s28WcgCpT
X-Received: by 2002:a05:620a:240d:b0:7d3:8fa7:8885 with SMTP id af79cd13be357-7d3bc430bc1mr214214385a.22.1749773245493;
        Thu, 12 Jun 2025 17:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773245; cv=none;
        d=google.com; s=arc-20240605;
        b=b0Rj4y6JcKQvBlLpzob4M2LB5fh1gNnA2Q09D5obva9JBORJ9AxxwSPwBI2yOY2tPT
         4qg0BpuASpZwkVHJjrcrOJbRj/IYhdjSzIXDPrcvwLL56d+I4jUWHgG4NmzWOlGtkIaa
         A+v2O609JkAWs3RGyODfitJ6LG9O9BCUNO6BFhEyuzk+SXOQdgkjXCRhXdGhkR81o7fo
         9bPwAUI+kSCf0qaNowXn20i9NLGISdtmBIFqGhfduJyic2mmIr7CDAfccMi/AQPSWMA2
         +pawebSyQZJ/P+XkgfroDdbHKWyOiXVNgP7MiNPH3L8tdihCYeuD2qGrUql3QdkYh9vy
         /jSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=tPtGaQ6vCtmF19bKh+Rkwj9EooYkX69QK4ltOQGJ2bM=;
        fh=M2FPDjQN6hcmVpKqX1B7RP7FpPtd4CmFw6SFDYnhprI=;
        b=WHyVx/adgwlwc0+shu3BWLxlELAupKUa/6trcF+pspecycJzbbnGw5KOxfd943EqZv
         9j1IJ+XIwua3CMjFh1Yz05l1MahHsJ2GJLo3FwTclgOUHg0njQot0rWx+SPE43Pq1rzJ
         Xg84nkesLKWYEZcIsOragCRIErInEyf70Zl2T09nLBo+S0OrI0wKUmgFy/ZJSqXSPrf6
         Dj9eGl3wJG//HWaRydfk4LVjzWS5G9ozOyW5vG2qMh8Uh7kOF4g8NnNIqagTWxXtRuZ3
         lrPfRx6j2QktG48w3bBtDQtNabBa6YG34cE0AJ1KUoXUG5DoDVrc27BzUpRD3w8lVmnb
         EioQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=T+aiDF1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ea9ad5si185026185a.180.2025.06.12.17.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=T+aiDF1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPruD-0005p9-DF; Thu, 12 Jun 2025 20:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3A2tLaAcKCFA26436v0y66y3w.u648w4C-s94565y5C.69y@flex--komlodi.bounces.google.com>)
 id 1uPruA-0005nk-TF
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 20:04:23 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3A2tLaAcKCFA26436v0y66y3w.u648w4C-s94565y5C.69y@flex--komlodi.bounces.google.com>)
 id 1uPru9-0000XY-BP
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 20:04:22 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-b2f103f6074so945459a12.3
 for <qemu-arm@nongnu.org>; Thu, 12 Jun 2025 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773059; x=1750377859; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tPtGaQ6vCtmF19bKh+Rkwj9EooYkX69QK4ltOQGJ2bM=;
 b=T+aiDF1ZB6piAkEkrKh/EN6Bp1c4Irystph9bQoyMYnnQZo3SNBYcZ5fp3JdmKU7YO
 E3DVsCJEfqKnm+DWm2BpW9bZ6sImUSJgV0LLFqPQVf6tjcy4MOH/BrZsicxQmzMuSsAX
 rWCGFsMuK0PZnXVU492UGoq4+nKhp2OgeTvdSkzRerZVwPVvDJnHb+fi54ZGmEbSSC4s
 +jqVstX42ixn4bbfFob/9po7pkNaJNkn7LCxNyze4VuBxL/n+zpYoCpGxcy6dkNk7fcO
 tOL/pl/8AvbxKoGFZQKeogUFxftUUGMQK8aLLukunMa+YpE5VhmZ8Yhp7KIhUmTfIthi
 YwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773059; x=1750377859;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tPtGaQ6vCtmF19bKh+Rkwj9EooYkX69QK4ltOQGJ2bM=;
 b=Jgoy6KqggNT6sfKg/vz2jPvY4lBuJ15s7ImYKhUmslZN5ivGT8kWbmnxJBQmC5wsNi
 MBVYSXLN08B3N9ndTxTrABuk9bZkAOjgMmTFfPRKVGfXLJtJ2nu3/MU2X55giWKBipSm
 x/hfC8bpwI2eY2epuYawRBvAjA/mDBBWR6THXqYmTsxLUqAbaJEu9MTZr7lNlL05wbNg
 1L624WXjg0pBQvvBrXxtZPbshfS41706tC4SJ8d79fCoPVHWg/bWC9UUve3zca+/9x6x
 AfP9op95lK7st7Mbap8xIXqknKxdXre6ofRmvBeokiH7H18lCYMasURp4nPyVALQZ7B2
 QMRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULXL8n642zc2uW4ebNM6f2MdKa5IIkjCHYOg2aHASHIlOGfC6zoX5c4J3AyplRsMldha9mzzXfCQ==@nongnu.org
X-Gm-Message-State: AOJu0YyejLOtSTxmVKZwQP18bTJKyxnLs9/ROvbGuIdfzMjRJdioD07r
 wWUW4+BLdxkcLaLTLuMVHCPsmzXbxfxBAksK3RMUks7NT3fqtRCxlMpywalaPXeCd6ATlcCQVGa
 faXzoH7LOfQ==
X-Received: from pgbdi9.prod.google.com ([2002:a05:6a02:c09:b0:b2c:3afe:6ece])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:914f:b0:1f3:41d5:65f6
 with SMTP id adf61e73a8af0-21faced23acmr1337373637.32.1749773059627; Thu, 12
 Jun 2025 17:04:19 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:03:57 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-6-komlodi@google.com>
Subject: [PATCH 05/19] hw/i3c/aspeed_i3c: Add more register fields
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3A2tLaAcKCFA26436v0y66y3w.u648w4C-s94565y5C.69y@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BUCpWpdHCzA3

Adds the rest of the Aspeed I3C controller register fields.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/aspeed_i3c.c | 54 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index cb0332828c..7a16dfec53 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -21,28 +21,58 @@
 /* I3C Controller Registers */
 REG32(I3C1_REG0, 0x10)
 REG32(I3C1_REG1, 0x14)
-    FIELD(I3C1_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C1_REG1, SA_EN,     15, 1)
+    FIELD(I3C1_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C1_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C1_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C1_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C1_REG1, SA,            8,  7)
+    FIELD(I3C1_REG1, SA_EN,         15, 1)
+    FIELD(I3C1_REG1, INST_ID,       16, 4)
 REG32(I3C2_REG0, 0x20)
 REG32(I3C2_REG1, 0x24)
-    FIELD(I3C2_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C2_REG1, SA_EN,     15, 1)
+    FIELD(I3C2_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C2_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C2_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C2_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C2_REG1, SA,            8,  7)
+    FIELD(I3C2_REG1, SA_EN,         15, 1)
+    FIELD(I3C2_REG1, INST_ID,       16, 4)
 REG32(I3C3_REG0, 0x30)
 REG32(I3C3_REG1, 0x34)
-    FIELD(I3C3_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C3_REG1, SA_EN,     15, 1)
+    FIELD(I3C3_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C3_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C3_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C3_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C3_REG1, SA,            8,  7)
+    FIELD(I3C3_REG1, SA_EN,         15, 1)
+    FIELD(I3C3_REG1, INST_ID,       16, 4)
 REG32(I3C4_REG0, 0x40)
 REG32(I3C4_REG1, 0x44)
-    FIELD(I3C4_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C4_REG1, SA_EN,     15, 1)
+    FIELD(I3C4_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C4_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C4_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C4_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C4_REG1, SA,            8,  7)
+    FIELD(I3C4_REG1, SA_EN,         15, 1)
+    FIELD(I3C4_REG1, INST_ID,       16, 4)
 REG32(I3C5_REG0, 0x50)
 REG32(I3C5_REG1, 0x54)
-    FIELD(I3C5_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C5_REG1, SA_EN,     15, 1)
+    FIELD(I3C5_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C5_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C5_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C5_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C5_REG1, SA,            8,  7)
+    FIELD(I3C5_REG1, SA_EN,         15, 1)
+    FIELD(I3C5_REG1, INST_ID,       16, 4)
 REG32(I3C6_REG0, 0x60)
 REG32(I3C6_REG1, 0x64)
-    FIELD(I3C6_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C6_REG1, SA_EN,     15, 1)
+    FIELD(I3C6_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C6_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C6_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C6_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C6_REG1, SA,            8,  7)
+    FIELD(I3C6_REG1, SA_EN,         15, 1)
+    FIELD(I3C6_REG1, INST_ID,       16, 4)
 
 static uint64_t aspeed_i3c_read(void *opaque, hwaddr addr, unsigned int size)
 {
-- 
2.50.0.rc1.591.g9c95f17f64-goog

