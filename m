Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD82FCA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:52:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3c-0007WZ-F5; Tue, 13 Oct 2026 04:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3I-0006yL-S4
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY36-0007bb-IV
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a02667ccebso18653935e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880791; x=1792485591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hqqeZR9hh82Ok/85fIviXaUdYKynKCQ8FaCgEa2tPAY=;
 b=hfEgI4i84v2Q8MTSOgTZOxJ1qYYyZyulrQ0fL/fdQFbo0U8aPMsvT4QE8mzZeHju48
 sOJCKoQBqTWBKzX5JqTDzY4lfNIynUKcabN7NL0MoqCCWv4AWANdsfmSshQnzvpy+MiW
 r7lJE/L/XoabVobDI780VDsIdvWRNAfahfcA45wFJHz3lsIZPwaf7+LPFf2L+XCqefZE
 5OyaLXDpa3IzWhU4/2DlEk04tSXrCvKNQ32CuBAQBEMxNDd5fEfBTkQo2akvYpdiNODo
 syBSTkSBTGaLMuqt35Xxd2gtrPiJvAQr4kyf3NIEI1fcSbaeEwtsjc+NMQ/9QXLYS/pk
 2GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880791; x=1792485591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=hqqeZR9hh82Ok/85fIviXaUdYKynKCQ8FaCgEa2tPAY=;
 b=jL6Y12X+G8RFbFurEt3hcH8vfWMygBqIi8pWwGvMv9m7YDrN3xDPiVXOhHKVZrOpXE
 W+YEMqmUhrif23Djkw0R2gcwMTzMliwc3O/LqWlC9Q89Bzk5Vm6CQ6NptF+aKFIokCfQ
 0pPMxm3TVDAGZk2w3D2lWnG6pOb3dCFfcyYqHEMhhTzMibwaGO5qohnkExgTEgVQ8tXk
 Y7WwK8e1pSU6HIDldZThTVZnKIaJ/Dz0lGjz4QnVnn+WJJ3T1ROzMvZJcDCzOT8NxEHD
 PAqHJCHl5lZrxHqkRp1FHwp6k2fqZQSaOk4y1dX2VF4+WtbjM5PAgrsC9jnYaZwWnHI+
 SRgQ==
X-Gm-Message-State: AFq9FYLw0rr/h033LeN6RRs3nerrotgvjcgNblzhr/FjLy6rMt25xEPp
 N3KC87MV3IYeTdFZxBzMHyLB5VNwRhyNnPKBoKy4xCCh/d+KsPg9Ol+42zPxfslYsssBmpdXdAN
 resrghW8=
X-Gm-Gg: AYBFou2242GNRghUHX2golfb+KCPEFPhPYYuA0akAi+SvDPLmiaYAbHKOcQNyPt0v4g
 h/TIZqRzS06AAW0GhBFUF+groKRhk9y9J29swsBwd3tKvGNesA5c4ot1ffZJYePjth9xYF+k384
 UUxh3f6l1+RTsTJLPLhHPHGwRk7hcx7JRW/UrNS5grrtKdNyaFX0ejuToUUVKR/166zCU79RhHT
 LMUHeuQVBmH0iuZre/uhXeh84dMeTb5sAmBuPYUu/NAYAZ0lQ/U8/GTeXtXAgdyFaXWSyKY5jFa
 qt2K+aBwDdRFMwnYa3HbYa+s1y5Zxj/9Mm3xvFvxHkoX9SVze0L8XxE8ri9M+pe2JRU8esdAYwv
 w4utY7UwpI4Qh5eEMavxgwnhuHMzCXl7ITQIOlrVYHj0M+1Nr0V+vDi8POMIBXfPYKMXAEuZgRQ
 JchFZVHJIjBghtG7XqlOL5bjogd41bZsftITEXqwme64yIn/JmzMFWmOhQketo4wSpxlzXgSzMB
 UkMU+1DlMnWmqYNe4mNFkyEFifQlub+GGj5ECwTdMY2Z7WQpDdGB/dQtbDgpAKTKYAF5sWo9vsp
 +NHh
X-Received: by 2002:a05:600c:6388:b0:4a1:ac66:5ffe with SMTP id
 5b1f17b1804b1-4a1ac666396mr23882515e9.15.1791880791184; 
 Tue, 13 Oct 2026 01:39:51 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/86] hw/intc/arm_gicv5: Use correct type for value in
 lpi_cache_get_hppi()
Date: Tue, 13 Oct 2026 09:38:18 +0100
Message-ID: <20261013083933.1024405-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

lpi_cache_get_hppi() is a function we pass to g_hash_table_foreach()
to iterate over the LPI cache hashtable.  This hash table has keys
which are GINT_TO_POINTER(intid) and values which hold the L2 ISTE
value, allocated as "hashvalue = g_new(uint32_t, 1)".

The function is passed the key and value as type 'gpointer' and has
to cast them to the real types itself, but it incorrectly casts the
value pointer to a uint64_t*.  This works on little-endian hosts
(since we only read specific fields of the L2 ISTE using bitmasking),
but won't work on big-endian, and trips the clang sanitizer.

Fix the pointer type.

Cc: qemu-stable@nongnu.org
Fixes: a0562ada75e ("hw/intc/arm_gicv5: Calculate HPPI in the IRS")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index fd6456cd8aa..a362349e5ed 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -390,7 +390,7 @@ typedef struct GetHPPIUserData {
 static void lpi_cache_get_hppi(gpointer key, gpointer value, gpointer user_data)
 {
     uint64_t id = GPOINTER_TO_INT(key);
-    uint64_t l2_iste = *(uint64_t *)value;
+    uint64_t l2_iste = *(uint32_t *)value;
     uint32_t prio, iaffid;
     GetHPPIUserData *ud = user_data;
 
-- 
2.43.0


