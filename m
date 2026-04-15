Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5ECF433CC
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Apr 2026 21:57:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wD8Dh-0002Rr-TG; Wed, 15 Apr 2026 17:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8Dd-0002OR-Ru
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:56:23 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8DZ-0002mV-BV
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:56:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so96978415e9.2
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776290176; x=1776894976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J61p27Quk4EZorcOVqxk0jX5dP0dgc/X3RVLAwpYOiA=;
 b=kpInVKQGAMeTNalefhpPzZAscPAh/ks+gblWUXCFG1YP97XLsf2INUBFOVR5sgEXCA
 c+HxmMNDNasWdtHAC7eK92y23t5H7UHjQeRaJYGczoxL8qvnHNcXS1CSuJ0LB/4l2txO
 zcYG0X30Q4v6mUXvlK+bsR5CJ6nc4YI28fvgcsuosgaxV7hC8Kwpg8uZD96WpG1/w2P7
 01P/6Jql6Zil/MurgeQYn7g9nvkqbzzJQD6d6Gt1oOh6Bowqoi+eP5q3UmkAdwFOxfBR
 ekscZO70tDNooZi9fhbCyjZwSPKwawIJ9TSYSms8HOJImT5i55vhr3zxblEnV8AKHTEq
 r98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776290176; x=1776894976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J61p27Quk4EZorcOVqxk0jX5dP0dgc/X3RVLAwpYOiA=;
 b=HwG1hJc09Bo1QhZCKrGA9/FV6c6C3R9cPJbvRTfGsJdG+1/Ca/AG1wmAF5DcEpc+fx
 NEW/COqgHJOzCrSe1uL9wQAvyTDPwVQNxXDVC4Tiz+i7GNd5YXCc2BbVgUJW4VqQDg7+
 lB2fR9VZ5fFubTcPAp56DqOE0i8luzjA2v42dxzP6BebdBMY+dduj2CopeW4uFqrZZWP
 OoIzN6HBfvAbKJ/j4MfSgV+9P1A4gXM4DmtuSrWyMlqHRWBvWGWAQXpP/5i5ZdLOLhhG
 a6L9yz0GqB6pL6r2XWEhkZO2DSdG+KcRy+dXJl9cfwv7PjRylQ2E+SMcxQRSH/pboKHL
 vmlA==
X-Gm-Message-State: AOJu0Yx27/IPKpRajaAT4jMqfDn2QLHkEydDFPcfcDlw84HobMo+5jNW
 lIGa2GkT6Wdf7l81lcdYqG4OL1pkGhAwBoKYWVdoQQ43neDnTYSP8/uEczG1VwX+ogiU5DUvwLH
 bGD6PDW4=
X-Gm-Gg: AeBDievRi6tSO/CPUk90IHMBdj7ufkm1OGt34+qdo/yeJfU4hdeH9B7H49sTMayqJVS
 xh682Sn3y5VMj9jFyPqIftptijMT6g7PVkpW+tMv5a/4acKwb8Of/ek88Ka9vBOxhfuNkP0EqGc
 7dde+xvn27ev53PGaT26OtXz+k9BvWyrQZXUK2f/rx6xRZggP1fG+05ysq2QcqRz7wJz5C4kGK7
 +/cmz9FFrP71dlGXKAjj+fenLG+z2YJiHaSMUvxxM4FieiQBQIVV3p1Zrm0d6bkU++X2wlxXfs7
 TJIGEmGMylFEaq8cobdZVk6k5GLtHangqcBpq2FeBoJ8EMjhdO11nWoZoxpOu6K90mRmF1ylqZM
 7eOiCXge9x7l8Qrv19FbSpdK2B2r0W29A5KUcYAMKAZWug51RnwK35L0LE8JeAsnDlJ16gU3VqV
 /dJ4o+hp4ysdPB8Cge0Khp9Gj1LLKi1gP5bmGjEqwrflrxrVkzxXUwjeO+P51HSe/iZOttJTFI
X-Received: by 2002:a05:600c:a105:b0:486:d76c:fa57 with SMTP id
 5b1f17b1804b1-488d685b75emr226950265e9.17.1776290175874; 
 Wed, 15 Apr 2026 14:56:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5818da1sm651695e9.6.2026.04.15.14.56.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Apr 2026 14:56:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH 5/8] cocci: Do not initialize variable used by
 RAMBLOCK_FOREACH* macro
Date: Wed, 15 Apr 2026 23:55:36 +0200
Message-ID: <20260415215539.92629-6-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415215539.92629-1-philmd@linaro.org>
References: <20260415215539.92629-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

The RAMBLOCK_FOREACH_MIGRATABLE() macro, defined in
migration/ram.h, ends up calling QLIST_FOREACH_RCU()
which always assigns its iterator variable when entering
the loop. Remove the pointless and possibly misleading
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
 migration/dirtyrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 58f04670629..b360f49efea 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -485,7 +485,7 @@ static bool record_ramblock_hash_info(struct RamblockDirtyInfo **block_dinfo,
 {
     struct RamblockDirtyInfo *info = NULL;
     struct RamblockDirtyInfo *dinfo = NULL;
-    RAMBlock *block = NULL;
+    RAMBlock *block;
     int total_count = 0;
     int index = 0;
     bool ret = false;
@@ -568,7 +568,7 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
                                   int block_count)
 {
     struct RamblockDirtyInfo *block_dinfo = NULL;
-    RAMBlock *block = NULL;
+    RAMBlock *block;
 
     RAMBLOCK_FOREACH_MIGRATABLE(block) {
         if (skip_sample_ramblock(block)) {
-- 
2.53.0


