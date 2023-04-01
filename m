Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1213456ejb;
        Sat, 1 Apr 2023 03:51:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set/q1vVu0K2NsbNIWFDC+p+4UcIlppjtBvh0o8iCHSkrIfcjCqjhsV459vZGeCxHDIYhpJST
X-Received: by 2002:ac8:5f0a:0:b0:3b9:bd05:bdf1 with SMTP id x10-20020ac85f0a000000b003b9bd05bdf1mr47421350qta.14.1680346266289;
        Sat, 01 Apr 2023 03:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680346266; cv=none;
        d=google.com; s=arc-20160816;
        b=SDHpck97+Wz1jvz1GYAYmM6Z+i7iZyMBieSCkkN2mPCnTOe4WsXqlVMa+w9M1hSA+6
         llOzQDEgbqYvBpq4f/8iEdqaV+AzgDVtAXpl8/sQSQFed8ArPRVcnEKrKSITjOPxqBRI
         5bwTSLzOxc7sYu7lwPA7XGbVgLrDEOdAG4bFDY8dq9YQNmpFzwmtzzRP0YgFwCgx5pGF
         js8+wrIwEdpg7eczS1h4kpykLg61Vz6xThnKnAryaTvAyMqcynQhWlwOQ2cQORwg1Hbq
         LK/+am/4/8RXY6r0wyXpeOT8QXJoxvK6A2tKNBDSElIW5AO4X5Lfde4Z2Mc4afGnEY2Y
         XqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=mHb+9pWVY/xkO23nYC8/HU3/EYklX+t3i/qHwcl5iIg=;
        b=ogdDSo+/5nu3ehbPXDK/i4Y4J0NB3TBnR0qMd++tau9o1ZQygasf7ZivhGzkCqKICx
         6KlNgQ2MoFws/qdy9UUxjl+hkVqDbLBc3wrSwshQdxMaLBcI0XowjomOEtF8tAxa63H8
         G05fGlLAeOwf2EAcpIYhyZc695lQgx7JWFJ9+XRm7+wbRepPw/PRa0430CEh8Ty3mw6k
         Z6zp90SqzCQnOQGfceZ6VOEZpK6SnomAwOBAViU6ClWAutGxuoz7vj5a0/5UvjSJl4ER
         3TpH2m3q1XdifbJDJsh6wv+6x74jCt8/puvMCQNdEwgvYFWNTEzhumssrya5wQQ+QhSx
         WvFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=oPqMPJ1b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10-20020a05622a03ca00b003e30f2d5c60si2926695qtx.417.2023.04.01.03.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Apr 2023 03:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=oPqMPJ1b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piYo9-0000k8-3b; Sat, 01 Apr 2023 06:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VwwoZAgKCjgmgimnUZUaiiafY.WigkYgo-XYpYfhihaho.ila@flex--smostafa.bounces.google.com>)
 id 1piYo7-0000jN-GV
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:03 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VwwoZAgKCjgmgimnUZUaiiafY.WigkYgo-XYpYfhihaho.ila@flex--smostafa.bounces.google.com>)
 id 1piYo5-0002vq-HH
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:03 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 o37-20020a05600c512500b003edd119ec9eso12273153wms.0
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346200;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mHb+9pWVY/xkO23nYC8/HU3/EYklX+t3i/qHwcl5iIg=;
 b=oPqMPJ1bqLhZya+luSV4YPOhiSITqTgRR7/T+FkctAyHbajWmgh1jShlt/LYl/HDUI
 lK79eEoi+rf2mPcJsJKEp/7TF2pbxd8v8BRj4SHCyrh6WefM+rlnuOodTKDmq1uLTkdm
 5BTM0K0xwZEg+hCLwYmVLCU5wVGpVO0sIQ2HUr15dWyDqZMuAZPZ+f/Xq1kBLIk/DzsV
 1C6f4rjJs/hqGjprHTy8YNoGywozpISyFlA4xAPP0he4l4EvkNrv7ONsqKGhZUxjuQJe
 AwDw3muxw0eFbte92L412QPPmPaEGPR+pJNuTR+vwqmPOacktx91EbgybR6OuLqYQG1P
 xX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346200;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mHb+9pWVY/xkO23nYC8/HU3/EYklX+t3i/qHwcl5iIg=;
 b=Yo0wqdDo2SNKEUTN/EISikXQfyHDMn2YV9PByCtH1qlrSr2sRE/ZBhvUAmVguAMmeI
 fMsUkLXqfHfIBoQh2QBYDp0pKOssruDVkSiqo6AeWKmj0zhFyLaZTqAzybLk42eHCrVW
 2SDKnxHNBqFb31pwXoa8Yh1EuqJ5nRksIfYIuUaz/e/SyKHGynvrypMg5eyCROwohegy
 0eAcilTS7mXhq/m2u4n3PunkTSQ66QAwBJ0fc0ivIjxlZqZ2NICqYeTntM3n62qfa0s2
 rSiqP6/Tnv7E4qrfs36u2n8q2QtPBbpe416KdJ79I+0Gw3AmKqH4p6z5yU7vEt76KRI/
 HseA==
X-Gm-Message-State: AAQBX9eghZOdzasVE+BIyiRbLPCfuJ75FpSatF2zxpU3pt53/3KOSTZF
 y9BCL8P04AWY2pHBVaxLE6sATweGSlapNFa0drsDsgkbzlaNWahX5k7xPL+ydqf1QcUKandl6ix
 3BTdh8OzDYgtYkLzUtQIEiNpUF1rK4SjE77RtiZmO1F/n25XcpK4FD29bi9nC0VEasg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:c8d8:0:b0:3ef:5da6:45e2 with SMTP id
 f24-20020a7bc8d8000000b003ef5da645e2mr2998961wml.3.1680346199881; Sat, 01 Apr
 2023 03:49:59 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:44 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-2-smostafa@google.com>
Subject: [RFC PATCH v3 01/10] hw/arm/smmuv3: Add missing fields for IDR0
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3VwwoZAgKCjgmgimnUZUaiiafY.WigkYgo-XYpYfhihaho.ila@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: dL1FDa05aEGX

In preparation for adding stage-2 support.
Add IDR0 fields related to stage-2.

VMID16: 16-bit VMID supported.
S2P: Stage-2 translation supported.

They are described in 6.3.1 SMMU_IDR0.

No functional change intended.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
Changes in V2:
- Collected Reviewed-by tags.
---
 hw/arm/smmuv3-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index e8f0ebf25e..183d5ac8dc 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -34,10 +34,12 @@ typedef enum SMMUTranslationStatus {
 /* MMIO Registers */
 
 REG32(IDR0,                0x0)
+    FIELD(IDR0, S2P,         0 , 1)
     FIELD(IDR0, S1P,         1 , 1)
     FIELD(IDR0, TTF,         2 , 2)
     FIELD(IDR0, COHACC,      4 , 1)
     FIELD(IDR0, ASID16,      12, 1)
+    FIELD(IDR0, VMID16,      18, 1)
     FIELD(IDR0, TTENDIAN,    21, 2)
     FIELD(IDR0, STALL_MODEL, 24, 2)
     FIELD(IDR0, TERM_MODEL,  26, 1)
-- 
2.40.0.348.gf938b09366-goog

