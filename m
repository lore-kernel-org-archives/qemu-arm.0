Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BE2F433CD
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Apr 2026 21:57:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wD8DS-0002Iq-Ox; Wed, 15 Apr 2026 17:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8DN-0002HC-Qw
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:56:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8DL-0002j8-E9
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:56:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so252155e9.0
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776290162; x=1776894962; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YcATVaIISTbgVGscn8e0nT489EMZwoo2OUk1DH7jcY=;
 b=ULCXDeA47qpjtuY9x+BL6qRbuLadcmM9f+Im7pKFIfCq4bTwqwiJE1+rGCOwQWHNDM
 oyp1KZC88kNC/74O/IUSJoeYIxwCtwjV/JN+s/PcS9mlF4yWbTlxN3ReesObdMbHSZiE
 W7/sDzIUBpJJdsi9vZFlMTMiL9YoFJQBo6kQtYf+7Wq/SQTymMZ8i9/yAmUvS9cCjbE5
 HZGNCYTpWSW9TBRGvj4CCkQeRZfjiP2AcVXlS01smhb/3h5f2KoHUvXOy0ZLtQ6A7ods
 Z8tfhayFxQjpBdPZOGV71R4KqEODdPi/1LR2nbx2LEqZhoKBAjm89H/VvqlOitcImVev
 bXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776290162; x=1776894962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3YcATVaIISTbgVGscn8e0nT489EMZwoo2OUk1DH7jcY=;
 b=WThWgc79gQxSo2U2lPtla+ZeTBivRvK1H3U8ZKzMMyiJbhTwFG6A1UPtIjPQ1KWEs6
 GTrUfOknKmalngiMwIQmgzaQC2FC9PD999kW/49gVdRiHBaL4EKdEpi1RhNUR8edjV62
 ReR5ZHZebVkjPYDJ2LtcHTHn1KV0BM9/SPui2EDHaPqcRrs8PZiXYBuC2ybvlquoMJzQ
 Ya+75t/9BE7YW3LmJ/zy2kccTaW3aPxtnQCgWsim2sxzgb+8mPOqkSxMJ0ebEZujLEPx
 1Ys6g6UCl8hn+xyDZ6B3w5yryoXMMsMqI0zGPhQjbtOVvN1N2RhVDj3sX8Kop37Q6Kjw
 YPZA==
X-Gm-Message-State: AOJu0Yw2ssvMzRrzEk6gvj3426BdccjirW/BlcFl0ocAL5LPuoJenG5E
 SQxO4bOGBtx4M2wqfz47gIxbnySaobzBeP/h+yu53Rn6tGBQ5b6NL01hBH6Y7ss4SF0=
X-Gm-Gg: AeBDiet1u338nUli7L+6ZkYsRsqILZ4uJDx+3Hx0lidLKh0NS3wWmpsZWxkbxWrZRX4
 s0uEon9OHfjC228bvwubYti5gCiIIvbuw8UsApVVRRJcc/4+4ViYPJDXKfj0RJ4X3gKKDe0qq+6
 pWAWC7TIBR9fHX6ePfcVSzSlGEXVFKBfG0XYwZknHkNDcyusHJe0xezmBrYj2KDSYKGIYQuchfx
 HbjTLVCs9+JGGNXkJlle7gdJpHtO8KeQ2APEAvHpmaImNZdGbbrBlAkuMwSiO5hHRJBLpv3An0q
 YSg2/IjSCC2TUa1VrCSGuX46ZYw44I4M78nO1LwucZ4v2kskl33WWn+KskmEjz7BVBU8mR5h8Ag
 8/VlYuaiMHNNu90RAHblzTBv79+c+gp/sxNd4HQCJBDeijyLYOsY2Ofdn9wj225GCKl0nOFpbfy
 8uM9C9fYuIvh1Mu6bqNz3oN5s7A33RgdXNN+8PX68ySeDOKZ0P4C2xCp7iyQR4obyXXIzjqS4f
X-Received: by 2002:a05:600c:c090:b0:485:fbd2:f72 with SMTP id
 5b1f17b1804b1-488f45cc70amr10941795e9.1.1776290161823; 
 Wed, 15 Apr 2026 14:56:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5818e51sm1034545e9.5.2026.04.15.14.56.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Apr 2026 14:56:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH 3/8] cocci: Do not initialize variable used by
 QSIMPLEQ_FOREACH macro
Date: Wed, 15 Apr 2026 23:55:34 +0200
Message-ID: <20260415215539.92629-4-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415215539.92629-1-philmd@linaro.org>
References: <20260415215539.92629-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

The QSIMPLEQ_FOREACH() macro, defined in "qemu/queue.h",
always assigns its iterator variable when entering the
loop. Remove the pointless and possibly misleading
assignment.

Mechanical patch using the following coccinelle spatch:

  @@
  type T;
  identifier e;
  iterator FOREACH_MACRO =~ ".*_FOREACH.*";
  statement S;
  @@
  -    T *e = ...;
  +    T *e;
       ... when != e
       FOREACH_MACRO(e, ...) S

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/blkdebug.c               | 2 +-
 migration/block-dirty-bitmap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 8a4a8cb85ea..fdc96d1f45d 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -591,7 +591,7 @@ static int coroutine_fn rule_check(BlockDriverState *bs, uint64_t offset,
                                    uint64_t bytes, BlkdebugIOType iotype)
 {
     BDRVBlkdebugState *s = bs->opaque;
-    BlkdebugRule *rule = NULL;
+    BlkdebugRule *rule;
     int error;
     bool immediately;
 
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index a061aad8177..87009c45182 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -1216,7 +1216,7 @@ fail:
 static int dirty_bitmap_save_setup(QEMUFile *f, void *opaque, Error **errp)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
-    SaveBitmapState *dbms = NULL;
+    SaveBitmapState *dbms;
 
     if (init_dirty_bitmap_migration(s, errp) < 0) {
         return -1;
-- 
2.53.0


