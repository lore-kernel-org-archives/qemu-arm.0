Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A842CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyAA-0007tG-T4; Mon, 20 Oct 2025 18:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy9w-0007iO-PC
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy9t-0006mU-7K
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so3651998f8f.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998515; x=1761603315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3tbfCKWZubrwcw3IFxSwsDjRtMvhIESY0jvezMdbaU=;
 b=q3tppfVTExApIizgE8DLzboidJ0qwQ+vfzyDjbtbC5k+pNny8PmmkY1O7h3NUkWNSx
 sJXywnS7BXjFpBvNIVzmUVkjQBsRkNKovI/KoGnLHLSenbmZjTnV5RKRlcLfGKcWI1pO
 VoLo8PMK24tWdmXrO6gpOSzK0bAzUmfGspEMygMDCqjk7/T+Jfpwo2KFdlHGV+ourLMT
 ummwPM1lHhxqzAFek+T5Pz6BPzuu9+E7vaz7i6ui06GvJwlqYTPGULaSynNCssDB/lPx
 XYX4A/yNAhICSSk9oN6SaNR/lYrAH0khEthNOc2/pLx0IwRwI2uoquRCHbbMWcMNy/MK
 gFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998515; x=1761603315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3tbfCKWZubrwcw3IFxSwsDjRtMvhIESY0jvezMdbaU=;
 b=cSVHVb1hEfndgSb01h2SuW0QlbeEf3U5p1doEpaw9+IEA9bh3I4LFu33kuqRfNtb2L
 aWXF//0jGIQ3kAfc6DhXQBs2iUvio2dgovA8ocTZqM7UGSPoQLmbEm0B2AYxBgG3RldE
 i4pAPHp2LRKaiyaeayJZrlJuKxcuGZ2Cl0yU3O6cJVE2hoAUaVfhPV34UgXy5q0j/N1D
 gBbQncs0y+uR02ozVJ+ac/1oA/VodYLmYxqPKmnHv+Vru8fJSQsdFVBxd9JdMjmRuevj
 eBCaLfT5cIAs8WkY0vaDcrKAc/icE/IHB+oUE8y03xWXiAVJXb75mULJmqUl7S+O/qYF
 221A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ/N0QFgKwId1r21b2fVMCL3sDVI6lx9m8hq0QEimuvhj+yFXOSynIr66dKSz2MGbd2lHEM2ViXw==@nongnu.org
X-Gm-Message-State: AOJu0YxbNmqBMdMkSHFS/5IeAb7eWn3EYZw9L0x4AWMVrd7mapKjCgXb
 //GMkWhCcHG/5dAg4BeorlXe24Jp2rfOHDppBFuMGVRwPeEfS5SQMOFXSjnDSjZ8alY=
X-Gm-Gg: ASbGncuZeTJoqNGozK4MsAGAH5vFxEJk1RyLZz8qIGgSk7q3wwsh5yj+eAkZ6QjASFR
 c1l+sKOri6KFLXgaxvLNuVQpmqkNcB47cTTcRlj76C7xCCq4Xh4qhTwZqwYsoiU21HT9lzgkz/0
 3H5f3CKiz+UYhrJYe9o3SVQHOLVEHrlLoHHEKESMScWGdW2mjyU3uwSzR29iyi98si3uxbuddFq
 ktL1BjKGvm8T6acLcpugM9t+xy69oK7cdaH/43aWuSZOX8qU7l1jRN+3W7iGFMaPzuhtYYWhFnz
 y5JC5UQ+5LISU3JUyBTZvcIzU6g1ghwtJbhyNCS5edYXveII2VONo+VLrOW/207ey0MahAw/WHL
 ymhxEAOLQj1IeEPgDiEOut0B1La0YjChwNqwNj4rQ7A6B359LDfF2NyImOlDp/y83pu5thgN04M
 IdR+KwyREPE2Uo32XHyoMQGPS2dtB0JOZnLXuw3UCW8z8rps/Fkg==
X-Google-Smtp-Source: AGHT+IELRuCwlidv6Q/BlcxSZo6p8VXX9a2kyVtBerqCKc26xeUQUjvA4avM27vV23MWNOExWIAOkw==
X-Received: by 2002:a5d:5f82:0:b0:3fa:5925:4b07 with SMTP id
 ffacd0b85a97d-42704d74f9fmr8879587f8f.18.1760998515313; 
 Mon, 20 Oct 2025 15:15:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c56sm17459246f8f.18.2025.10.20.15.15.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:15:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 17/30] qemu/target_info: Add target_arm() helper
Date: Tue, 21 Oct 2025 00:14:55 +0200
Message-ID: <20251020221508.67413-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Add a helper to distinct whether the binary is targetting
ARM (32-bit only) or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/target-info.h | 7 +++++++
 target-info.c              | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index abcf25db6fa..984fba3f42d 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -50,4 +50,11 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_arm:
+ *
+ * Returns whether the target architecture is ARM (32-bit, not Aarch64).
+ */
+bool target_arm(void);
+
 #endif
diff --git a/target-info.c b/target-info.c
index 3110ab32f75..40716bf4051 100644
--- a/target-info.c
+++ b/target-info.c
@@ -52,3 +52,8 @@ bool target_big_endian(void)
 {
     return target_endian_mode() == ENDIAN_MODE_BIG;
 }
+
+bool target_arm(void)
+{
+    return target_arch() == SYS_EMU_TARGET_ARM;
+}
-- 
2.51.0


