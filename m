Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E965DC87FD2
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:06:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLtM-0006sd-HP; Sat, 02 Aug 2025 19:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoc-00060Z-Fo
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:39:03 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoZ-0006Sc-G1
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:39:00 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-741ad8d0c15so191311a34.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177938; x=1754782738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bac99cWBoODM0lZjzPV8FafpKsc60jTDKb6XVoHXo24=;
 b=bFIi8dMk6OPSVq6xjeSi6zKmtZ+Wh9uUsmbiZ/woS4hYBrv7pnDhGfGqRU638FnLED
 bYORC45c1tgvByKKXA15UZkNwLTsNkR5iGLJTSFCF68q7kxsoH7gIZI9bRjjni4Dqnjd
 QDZi3hWiDuIEyjDfRmI1tG/zCIJ0aZlMVuY1YYUmtfrYh76ze0Zy8Q/GCsk1ijom27KV
 Z5ntaYVWuWa/3EycP0Wl+T2Qsha9fPPsQWysWd367Xq/eX4BLUa+Lxpadr/EZfMARgWu
 e7HKO2teqccoypnXugimTnL46gyInkUlBVzeZ8IRs9J/v28xVI69IIJWOluZizGkq+su
 cPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177938; x=1754782738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bac99cWBoODM0lZjzPV8FafpKsc60jTDKb6XVoHXo24=;
 b=pUN67QHAhk+wzfbu40GMMlIT3Y9qvoDROH6GsKvkOhO2pWBhXwb/AIgPtwPU4uu2OS
 7rlvw+ZJKqYDVNtGwaFENt4ozwctVYKi7T5dwGiPIjru0CbsyG44EntmDh8obTQMPDU6
 8vMLL1HIHvHKj+CFULhZhvaP+nvsnOB3sOIo1ZfAqhc1+0sBs+b4hxefjDFDLZNpMLBe
 NaSO6bTQJJ7zFcknXhd4hkm/NDXw68u4OmWFLPdyjUCtrs0tJHKzdXEZd4pCHaGRzdf/
 9ZEAOBfYO8yL+oMaUxFE+X/tCx7FmZSXZ7RltbNSiXk/I3AwCxxib4Hrlp09saTj8e4c
 Fbtg==
X-Gm-Message-State: AOJu0Yxqax+t1iaGqjE7sKP3wQgjshBigaedUbF0m4clPbKrPnoyy/OC
 7zn/gNcJYtGsqDnwfIrHrewZAaALysverPHfqguFnIP4WeHqWBgCp9lPYTK0uPuXEAg=
X-Gm-Gg: ASbGncsz/eK0pFmUeO+9VPhq+GSKWzAEP9Xs5AIHkQnoQ7fOEBnZV2qNl1xPeiFqkTz
 gndX+kklRu7MKUNFAlg21i1TC9tfF8w6Z8huTZwbpD6mFokvPhMmgKfXhRpq4VhwFppS2s2vG1g
 E7vNbNNWVWHO8q5KkFEBB5CEedN5GnPV/6JHCEp2VQwRYngPLXUwl+COgyVBM1v+sH9CMbu2DNM
 2d69V76Wg27goReyBr/tBjV081L1ivbY+LyTg9kMwpyivuwLZ5mKlyyEW5mHvi493p3atDJn+c/
 4j2sHncTW9mI4C2MpjJHLN3pEClEbHUVCJyRohWyqXzL+6YEobW1ZrWj7Bg8cZj7rgDLFuebKPP
 pNr1GvUSoytHr8Kr9lFJA4MWda3JLkoWIaH1jI9G35jDkIo3M00Ex
X-Google-Smtp-Source: AGHT+IFd12Afo8QLFxyH/ZRsIH+89fl14VFvq+w7cMHvbMzfQ9zIJGF7ErYF9J5a6uxYhzuZOijjdQ==
X-Received: by 2002:a05:6830:448c:b0:741:afb2:7ad0 with SMTP id
 46e09a7af769-741afb27de7mr357618a34.17.1754177938449; 
 Sat, 02 Aug 2025 16:38:58 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:38:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 76/85] linux-user/aarch64: Release gcs stack on thread exit
Date: Sun,  3 Aug 2025 09:29:44 +1000
Message-ID: <20250802232953.413294-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 91210775ed..dfe114ceb3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9309,6 +9309,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                              FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
             }
 
+#ifdef TARGET_AARCH64
+            if (ts->gcs_base) {
+                target_munmap(ts->gcs_base, ts->gcs_size);
+            }
+#endif
+
             object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             /*
-- 
2.43.0


