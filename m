Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5235F1088E65
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 02:27:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w335w-0003lc-IB; Wed, 18 Mar 2026 22:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w335r-0003i4-Bu
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 22:26:39 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w335o-0002qT-MY
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 22:26:39 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-79a75818937so5607267b3.2
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 19:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773887189; x=1774491989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUjOedTJILydQY7f/OfkEk8wUHENkhFnJJVe3/bR9qI=;
 b=X7tUH0O6MNGJ/D9GNofqJeuPBXZLB+eclOoR5lO1i2lnmoLaPvH4OCfRTJNqhKxa+B
 hHVqQi0JJqriXilrNGy+KabXlcLYWfuVP8Dny1QhZYhF+Ly1W42vUYEGwIcstTOenPwE
 Q8iyPoY67RcPmjZVC2a9Fj/BkjU3Ii2f0IXDG8JWYaqkfCKTK5tGjFZ7xDIpIpZXXQD5
 CSaeovXrh9KP5+L2RWLaByvWmoGTQQ7gzj7E4osgUTmYY7fWCAC00uOdfasa9jBDHDVu
 iGQwblC52UDbkq78Vj07DXQp0UWSpMEMkI7Rxa1/17d20lWIvXLBgk7/sijXFz3dm5Sk
 xHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773887189; x=1774491989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OUjOedTJILydQY7f/OfkEk8wUHENkhFnJJVe3/bR9qI=;
 b=C+a4ORoiDlc0eiwV5yy6++x/I4IG820Ej5xRwSiTZG7jExA8UD3YFC29/IFmf7XRDV
 7PX3aMCPVwwJUvAHQUEOAuvtLsz0/mmfeNYSlreVkDs/mUw/w5OjYirWnYArZS4wwKLy
 8cFWJnEewye2G3b7om5M1P3EdYf+py5GrdbkdoZSjrQlbzxwIrL1W/WwimKGHVJUfyO3
 nh9M2i39s05ndlxaUeTzzYnQvqyRATGHipALn7ClyCslTN1hST9PJo/HU6ZSmC7iYWLw
 sA9RquQ3xFQPSkGWxaCBXhE2nPehs4kCfiJVQg24DYlSVIUqg93MOi1SSILt7YIqK3wS
 Sdqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8aXWrAWFH+80SHx10BFCj8WlwePDiZot248NfiyO1OzTG2LlAAnpOvs6HHcH6Q/bld371hUcrtQ==@nongnu.org
X-Gm-Message-State: AOJu0YzCOiguv5BJqNhKB6wQKC4P/P8bEUk5pbZbrsUJhVxhKAUOgIod
 CuwG4zmZeybgGrZRT9kthj6WMMBKMixKqQUZK4lA8nUe2udaxy4jby8Z8R6hJQ5/Wzs=
X-Gm-Gg: ATEYQzxjJV8ODGDZFf9m9eQaYBMfqIGYA9SZh23FkgEmuQfZuj2M5RgWpDexQ/qycxf
 t5BolXhomm7hDwDnU/49Cn6u9jzbPLN8GmSg735nEeEJHmBNN6Dl1OE7EmXy6SOArC0WOTkYpAO
 0zlh2M4pdr2JmxmN/5CP9dJV3QfOEHG/U27b9CM48eqoeelonUi/e8dFUNdVU282Goo7KDWQ9Cj
 5l5hTiOR5IpzW/9dV9k1JIe+nKihtW48fbELFG8NHuFdhMurHPWBcfx9GRfsApsAuNXUUIZzmtd
 NvSH9KYABYmTfxQaNKv+ejBk9gZqbnfdk3b5gzpTm3LDnncfgZj132Q/ji9K+aD8ge//sdzoskU
 /gE2G5T/qDjeBoqGcQDstfOMpPvHJ8nLbDXVEaxzLbqyzK8xQw3aCIo4EbB+L3vybdEZ4W2SMSC
 b/u8QrxCAPNHGFM56XkmpIRpt8gBhlYg==
X-Received: by 2002:a05:690c:c4f1:b0:796:6df5:485a with SMTP id
 00721157ae682-79a71ade093mr57741587b3.39.1773887189009; 
 Wed, 18 Mar 2026 19:26:29 -0700 (PDT)
Received: from gromero0.. ([177.146.137.168]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-79a7141eb65sm28159417b3.21.2026.03.18.19.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 19:26:28 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org, gustavo.romero@linaro.org
Subject: [RFC PATCH 1/7] target/arm: Flush TLB on MECID write
Date: Wed, 18 Mar 2026 23:23:29 -0300
Message-Id: <20260319022335.22523-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319022335.22523-1-gustavo.romero@linaro.org>
References: <20260319022335.22523-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=gustavo.romero@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Flush TLB on write to any MECID register. This allow us to take the slow
path and check if the MECID is the correct.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6bfab90981..ec25ec8444 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5125,6 +5125,8 @@ static CPAccessResult mecid_access(CPUARMState *env,
 static void mecid_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
+    tlb_flush(CPU(env_archcpu(env)));
+
     value = extract64(value, 0, MECID_WIDTH);
     raw_write(env, ri, value);
 }
-- 
2.34.1


