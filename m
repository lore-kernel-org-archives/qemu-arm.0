Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F1ECC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:43:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY34-0006pr-02; Tue, 13 Oct 2026 04:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY32-0006on-O8
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY31-0007Zm-7o
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a17baef589so22009515e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880786; x=1792485586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=CdqM6HYBiDR7dqKjxvWd0m8Z09BAdsUWKaoEl5skuzI=;
 b=kGH8ItLCqyxZgFSl6LC7SLiS0Dfr9SMYdt7TL3C2RNc1f9x7xJeD3pfNX454KSFa2t
 wsGtqW+Tzxd+ftFa3xN+0ZQuQEDix0hjk2eJiLIWSvLTXYnYf/1vJCIJLh293ush4k26
 kzILFDgtrhEimzP6rz1c23CecpIJzdGKPnwL3oZHLFSYLknkG/cKsmMSsfwXzJxeGRa9
 IwHFLwMvNMEbP+rwhy8X2vM9tDQPPC89oKztiFhCr6hWagLvKORErvNg0W53QNjJkxuJ
 iBhLJtnbV7MEsniehemJN1swRkvnfUu1u2C4GvuEyqAWUF51TOlJML058JFaiQd9NA5N
 WTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880786; x=1792485586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=CdqM6HYBiDR7dqKjxvWd0m8Z09BAdsUWKaoEl5skuzI=;
 b=Uq3fxQFhNRB4+b5G7pVBKdHfat65IAZ5xesORXMp3kRAC3eoCALEhCfxgy+8M0RLzd
 lF86kDcFaB6FLfbnBxpzS6k63aUEFFcLfsUI9MDnY9DnrKGPqOVlHKUTUJoW9d5eqwNr
 PthwXPkBa2YXeOpfzHFmlF1myC0ohNUhHbAMRIhWpkW6Tky0VIXcazJZg1h4DEpZJhJd
 n7k3oJECmY7Xt/Q0E5TK13JyNxgE1WdjsFLnrfYb3xJlik9jPlmhENiomkAxcyXZXNgT
 U6CZYEuZUtz9MX37RKX7Qw8Y8v7CuQsamV7X+rMCLhCVhI3j92x3T4ZVfKdo3xPCXIwY
 unhw==
X-Gm-Message-State: AFq9FYIHsBAsKXx2U480PZU4UFL9RxhgWUT+tNFq+BPKXKBBdcqnO3I4
 DmZtE45bIwKSteD3JQU3g43pVwWOgkSLy7d7PAM0+oQgUw37w3l6h5Tvkv3Bol/+byKfPh3NrvM
 7XB8fzoY=
X-Gm-Gg: AYBFou2qMqv3UmAFydx06qdxTj6TwlbRwfTaAzZN54J69csaKpd1cbq4hjRrVreAj7M
 pXQbxJDB35ntDVtx59TQCOGeB1HxXkzYuTHvJdRNMCQXwAi1wzwBNqkySeXK+Hfryl58ff3Zqps
 Eivku4ddW/svFZZSVdbCbcHAOq9loWrhudwmbMWhJnyKkORvHCRWyQYam2y3URLvoVIaoAXn23X
 81hHktESnTMl7Bo9i0AkEvfgD8yrtbfvNBsoKSDmv4BCW/CS0QN7BDRQXkcmAAjTKStB9be+w14
 h9MfgZC8qFRDWnPy9YzCvU/aBT8XLULBGB3Rvb9+diH2tlUKe9U7gkSX+qzUaPE+xyou3rChkzo
 qEghqs/S9A44mghs40cSOKjuJCWNV7GinzTgaen3bZmWLHBMslRXGwWwbZdCAfaWJY/iQVSdYf6
 kgZdF4b3DcnQV8oA90avddmpscohP/SdllKAGYtBK33DwzaiCtvPKLK8JTNN76E8ibHa8AI+pCK
 YAtAF2Du9d2ooVzoY7Bhxkxfev3XkM1sXBIoD3pcAWsIUQ8BQK7ND07/Uqhh4QFvy0nOQVf+h0U
 o4ND
X-Received: by 2002:a05:600c:4e89:b0:4a0:12d7:4c88 with SMTP id
 5b1f17b1804b1-4a18e4ac77amr257836635e9.30.1791880785675; 
 Tue, 13 Oct 2026 01:39:45 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/86] hw/intc/arm_gicv5: Free memory in finalize
Date: Tue, 13 Oct 2026 09:38:13 +0100
Message-ID: <20261013083933.1024405-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The GICv5 allocates memory and creates hashtables during realize and
as part of its operation.  Free those resources in finalize.

Since the GICv5 is created at QEMU startup and remains in existence
for the lifetime of the process, this isn't an in-practice leak,
only a theoretical one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c        | 11 +++++++++++
 hw/intc/arm_gicv5_common.c |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index ca5c3ca6e03..ecafb4838ab 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1971,6 +1971,17 @@ static void gicv5_init(Object *obj)
 
 static void gicv5_finalize(Object *obj)
 {
+    GICv5 *s = ARM_GICV5(obj);
+
+    for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
+        GHashTable *ht = s->phys_lpi_config[i].lpi_cache;
+
+        if (ht) {
+            g_hash_table_destroy(ht);
+        }
+
+        g_free(s->hppi[i]);
+    }
 }
 
 static void gicv5_class_init(ObjectClass *oc, const void *data)
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index b155486af65..cc67246686e 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -112,6 +112,9 @@ static void gicv5_common_init(Object *obj)
 
 static void gicv5_common_finalize(Object *obj)
 {
+    GICv5Common *cs = ARM_GICV5_COMMON(obj);
+
+    g_free(cs->spi);
 }
 
 static void gicv5_common_realize(DeviceState *dev, Error **errp)
-- 
2.43.0


