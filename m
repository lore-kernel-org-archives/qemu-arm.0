Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705C7CCD19A
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 01:42:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKoF9-00034v-6I; Sun, 16 Nov 2025 20:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEd-0002XB-FB
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:53 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEY-0005xf-QB
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:47 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4ed6882991aso34602081cf.1
 for <qemu-arm@nongnu.org>; Sun, 16 Nov 2025 17:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763343645; x=1763948445; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YZPS9rJuRYJQhQMaUWtzxXr08fJQQ2IjJz7xMKY7qDM=;
 b=b8LRRln4EUZiUykSgQf7JKoUC0a60cbBfkvTbrRvQpQfgowfICEy5L4pILe5xpF1lV
 Hua4hqz3tbmPlaFJ47KIM20dEd62KVOwK93/l2HNXMJf+YzRVq/pZugF5KixzrCcnGZg
 hY+l6WiVlm6rLKSmUpz29Dg3aG2mw3XotEqp9T0ZToTEnWTvSo07BopJ0KS+BJIrj4pL
 3EW06xNP2V3zy375ZJwvL8Wr6x4GKnDU/56A3QYMEn20NIpvS3Y2HBspvR5nLJazctia
 56MfqEhwhyI02H5MTuasN6Vm+YtzInpx0y8yaG+FYE7sH/uR6kha7WfEC5ejIsdtYUrx
 if6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763343645; x=1763948445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YZPS9rJuRYJQhQMaUWtzxXr08fJQQ2IjJz7xMKY7qDM=;
 b=XqUVXpUNEYpIJBluPiu98ab9PYPZZVVBMsIM65XeG/MEazIVxjCjID/W8luYYS4INh
 tUbArTZTMGC8aANdzlE1FzJy38HWQRDfgJSFAGBfb0E+mysh+kAo2uYQiwJ6q/TZGy6n
 qxKOnO1rfBnLJ4fJn3VVW3ZOflUuX85oLNb+XdgXFsZlqOXf3ykzGh0c6jEfWyaJx3iu
 gueK7gRdmJia2J1kdZfbIpwXjBQbaIgZQsLWvNabKwzpxtGx+SMcdrjYbVAUwtixPtJP
 UBtQiaLsBA+Bd8a1rUgGvfWDtu0pqWXDVoK27QYDt7iBhAFlDLnSMKY46fBIz//MbepN
 LcGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDBFnmNEc24x9j4cuaMEm/JPLlp0cRdftOSNrEOTc/b/9ivPKm5Qug/VEbSduZ3LmZA9SvdGIk8g==@nongnu.org
X-Gm-Message-State: AOJu0YwGlY+TArOIvEvZx8xazCMqm5Nbwur+DljqOENe6ZnfoflrrhRn
 NLToEDp9V8pHv7krcT0MStw/A7lJlnwxx0ysNeYJtfTlE8mpySxG6kMKTgQrejNV
X-Gm-Gg: ASbGncujgMXuuX50udxZBECx42EJMatzpfD9GSuMACe4x5rlTkdbHE3ZsRKbNNCMgLh
 krGVxkU1y4n+d/1UlnkEfqIlek8bux3/8hz7tpjT7WEMsRM7xPgtB9exvvEueQibM6Mi/kdATHV
 CK6OrqD9mVbaDh//NbU/htBkyJIdOmcZBvaSadU4/Vxc/DVmhLu+qoCACFZwqXQlUUaZ3BBzZ98
 +8CRGtBkH7GPVo35SThbT2DUQC9Nw01MSt+i1N0GoJXpu4Dpwp4FRTlQW3mtNjk7Nesw+gHhZIj
 kD0wKUTcFIQrJDcjA6euYh6TFp+Yw+zVJMI25BEcTD3Ff8U3QgfRA20iDVlHs6AvyjE+hfVUB/0
 fnO4m3qTLiZGPm2jVy4HEQycruYtb8cavC9fiHsQqroU1nxHZbwWoHaH6WZxSRB01XQbuZY29LQ
 sL+EZHQWbhWBFN85UNjvY=
X-Google-Smtp-Source: AGHT+IHgvieHxSRUO9TsHKNvJgshRAHk/5Gv34QSSGE6MsBMKM1XUkjD3wkxJ7wnGGvD6rkSbLrljg==
X-Received: by 2002:ac8:5996:0:b0:4ed:2715:6130 with SMTP id
 d75a77b69052e-4edf216e10cmr143023481cf.36.1763343645435; 
 Sun, 16 Nov 2025 17:40:45 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee1c21ea34sm18246551cf.30.2025.11.16.17.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 17:40:44 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Sun, 16 Nov 2025 20:40:21 -0500
Subject: [PATCH RFC v2 04/10] target/arm: add FEAT_MTE_STORE_ONLY logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-feat-mte4-v2-4-9a7122b7fa76@gmail.com>
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
In-Reply-To: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763343639; l=1520;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=68ZM+10B9YHoYASDZcGdBy4XhZSBVkzEJDAZb1ZURqE=;
 b=wC980mUNguhEfrIR5Nq6/5CttN9iRGDU71qsPwjgXzgFeylMIbfREmburYaJ/twikPUTvdsb6
 ShAT0Y1fbGWCJNRkdc2aY45uYXLfHK1h5D7T3C5IycYmjf0IwtGBCQM
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This feature automatically succeeds tag checks on load instructions when
the appropriate SCTLR_TCSO register for the current exception level is
set. Find information on this feature in the "Tag Checking" section of
the ARM ARM, Memory Tagging Extension chapter.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/tcg/mte_helper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index bb48fe359b..f9fd6fd408 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -865,8 +865,30 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     return 0;
 }
 
+static bool mte_store_only_active(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    if (el) {
+        if (SCTLR_TCSO & env->cp15.sctlr_el[el]) {
+            return true;
+        }
+    } else {
+        if ((HCR_E2H & env->cp15.hcr_el2) &&
+            (SCTLR_TCSO0 & env->cp15.sctlr_el[2])) {
+            return true;
+        } else if (SCTLR_TCSO0 & env->cp15.sctlr_el[1]) {
+            return true;
+        }
+    }
+    return false;
+}
+
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
 {
+    if (!FIELD_EX32(desc, MTEDESC, WRITE) && mte_store_only_active(env)) {
+        return useronly_clean_ptr(ptr);
+    }
+
     uint64_t fault;
     int ret = mte_probe_int(env, desc, ptr, ra, &fault);
 

-- 
2.51.2


