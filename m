Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE293CCF9E3
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 16:16:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIUYp-0004YJ-UH; Mon, 10 Nov 2025 11:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1vIUYi-0004MB-Uj
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 11:16:03 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1vIUYg-0005tg-QK
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 11:16:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4777707a7c2so13161765e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 08:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762791357; x=1763396157; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aaPNn73pbEdflHGM8HmHoemHacg8sp31WzN6ccaG+uA=;
 b=LzQxCAgRq1Bqx/1Cu9VCzixJNnmNQhntc/rKm6XPYto3dobZzKVOgOtJzC0qU75tgU
 09KPn1BTr3nnVU10IauzGPB7rFnnMnLiX2zt7fQrbw4Y6zB91itzXgB4vBn1sgUHje2T
 qNJM3aj/4/WcmVSJzIZ0SmquHSyKF26JKChpGXwJcyCeR90CqgSTSzYm6EMjzCifaYeB
 aHeu8xMjPHXzzYQgtL4wrT9oOAckfK73ypq0v69hJXsBzwIb508kjMO5UdnMiWnhq8XW
 lm7fIBUuGdZkVNLPPaen9GNFmuDe3VQ3KmHc3NlmQRKEGBOdG8w+rbqYUoMfwHnX+kmN
 qmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762791357; x=1763396157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaPNn73pbEdflHGM8HmHoemHacg8sp31WzN6ccaG+uA=;
 b=ZYZAOrV/ZqYk8pxfC0Inoo8n+2vhS00fIbLAjSSfwb+5dSimba9xF/a7JgavrfdR4B
 +zsv7AELM2XsytAUPV5ixQtKSxpJC7cAdXmvSRhSn4y0LdFqyBGM1eRSbfu/pP4LHTBM
 xE9ufPK2P2tvD4xf+ydwIKvkjSyNKG5DMHX/wqHoi8aTyiMV+YuIMRZIyr2A3/nm8Lg3
 BQzBd28vnaydI1DlUuWZ6XQLlmMDd5t3GW+DN45HFI4sqQ2ERPsyh4T1zt8CsH5xPWcU
 DhXnE1NQG4Sih+CKZXFpe2Wfk3UMaKUj9GO3J4kPWBn8AfHWm2YR7jup6yUthOjpVROX
 YJGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKea+OvSGzK8NmpixTM23GoBxRwYiBzlNom7quVhvLbkZpABoapUb30k7T7QxDZszkvDDW32D8Iw==@nongnu.org
X-Gm-Message-State: AOJu0Yzo1P7tH9MQsC8SNinfZFLJwp/fF7e08E7hDuJDjcYH2MBhZNOZ
 PUSfNdz39fkybp1zugJuU+ys0zpsdTSBw5l5Ej20wOEwZ7nIB5remEuD
X-Gm-Gg: ASbGncuMIdUehLhD32qVD49hQaKk/aKtea1hXY+oSXOMJb33KNl8bm5rOscVQ4+cl3H
 6Dl250aZ86uxTM2vUA5FCBK8Rrg0PPyoJKrHuWI5cNaknyxt4CjaBtKzYNkQDea5oyRx+KlLXOV
 fwWLt6KuN/TjkYI6TUChyOvlI8qR8xcHn/rrX5RUJfMxlqvaW/+IRj/rJWpHoLlq7g4V/XDDBdL
 Arvhvnu4/ZUiEoolsOOqLfZvSyOBT2KCHGeeeAhkpV/V7byXK2e8joJEiBMJZbD2J6sDkOjQGc0
 FyEU/3sDzIJ7pEjSQ1BU+ObyBCbAmODJpkqaFO04aLkq/Ks00NcC1ka8G7dJVjPylSi5ocqs2wZ
 I1L/8B64rgHaH/MKRw/8ht2NsbjS2SWLiwT/KdgVXA42Hnh/CZNe0/NDC7P2fl2Vv3fHO9t68pc
 WbJyVvarJbLn723Y0=
X-Google-Smtp-Source: AGHT+IF6dlFM0/AOIsZHI+3HuQ4dwrjp2zU391gk+VRpTe9Zgbfsd9jAxiQul6j3FN2LZIPuSQK50w==
X-Received: by 2002:a05:600c:3b8e:b0:477:25c0:798c with SMTP id
 5b1f17b1804b1-47772e04759mr84466235e9.20.1762791356736; 
 Mon, 10 Nov 2025 08:15:56 -0800 (PST)
Received: from osama.. ([156.223.120.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b35ad7c16sm10175670f8f.15.2025.11.10.08.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:15:56 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] target/arm/cpu64: remove duplicate include
Date: Mon, 10 Nov 2025 18:15:52 +0200
Message-ID: <20251110161552.700333-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=osama.abdelkader@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

cpregs.h is included twice.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 target/arm/cpu64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f81cfd0113..ae84d8e420 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -34,7 +34,6 @@
 #include "hw/qdev-properties.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "cpregs.h"
 
 /* convert between <register>_IDX and SYS_<register> */
 #define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
-- 
2.43.0


