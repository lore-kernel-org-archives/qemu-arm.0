Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B48ECA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:08:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ljG-0002hc-JB; Mon, 22 Sep 2025 14:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lgS-0006Ao-T5
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:49 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfU-00052A-O9
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:40 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-24456ce0b96so53017955ad.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567219; x=1759172019; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bac99cWBoODM0lZjzPV8FafpKsc60jTDKb6XVoHXo24=;
 b=vqIXAnFIGgsJzYwp0FPmg6D65V4fwWISqtAYJTUC6xXmEoaZJ4PmHWViX+qc/i5HEP
 gFf8SzDtI9wHjjJALE285WK6oVq9SD0yWzqoFNxdqF88Mfr2Yp/CZifXLTSkItX61Tve
 YUeiMT+hJ4wl4Lf+flMC0urpyK+tfD4KJZC0pABvNuj0u0SbmPR3cLLvJy6JHPyX5QTC
 vCfRNlz7r7PguoLPTa9Bq/ptEKsSlDoIK8hDiScHQ5tzeZy9GrLmBApzoqz0+vgDrQ0i
 kyI+y6za0ax7oHMwg3jhhOFZHWzcycJCi7icKEPVcM/TMVGZkpOfW7Uez8lk+iT3WPEP
 UAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567219; x=1759172019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bac99cWBoODM0lZjzPV8FafpKsc60jTDKb6XVoHXo24=;
 b=B4j5hus8aktMpcsyA1inm+x4aepSr12PQRUTCTCl509v2oAlvtJNpwcfOEdk28GOAI
 m+TzCQbAEBZej5oTmgKIHHyXoC8XGqN6MvDYovtCwGQo7VBUfKxBL7f2ifjmyqd3DEvd
 aca25M/jZOLEOjhsPiV027dBN6CDkz+r3pr6/P3dEdUgiSQ9VbQ0ALVhrR/1m8Hu958h
 SQr81YUEVa8qOUiUI7VUvZjQ5E4P0UPZy5QOJqGkAwJNtbHHDUEHMZJ9eKBMRjREyfJI
 oSZgRqpv9SoTY4MkjKtLIVwzXa/kcU/4BLwAXVTJcCFLx6g++Ecd+jeWaiKpbGPrr8s1
 z37Q==
X-Gm-Message-State: AOJu0Yyfy5thNTW/v4N+hgzimwPTEIjqLrwy3iMmLhJSAn/1HwqXABDn
 vMh/t8crQzAqUl0yXuuwFscosRlKk0GI3g768dAlonqDwSdMX73RCCM2ZPXUnkZqOCw=
X-Gm-Gg: ASbGnctHyv8eIYmmicAQzer8CrsTGtiSMR0Wrl6x5e3pSZsnBWmjPTf/jPai/psBszE
 Gd+a/OmWUmTu+oYLiQRQVDWDU4+CVZr9Q7praWnrItpiUMm561yotzCwoKy91q0ArkhEbrVwTNT
 3JYltSlIWdsVs6nVKYn3p0n58DIKGPRxO/xkKYL5qgNVwGYaUkMIQLxo89PfXoJwS3AdC3SD1rc
 4sqmemhYatYggUEo193bHff/r3kZALRN3RpjiMJbJKblEEua8sY+LcstAdCKKQf7/PFmqd6u4Va
 4bdHUra8VxvujodY1uRASBXpDUpb8xIkmSogRqeae2BnsGHcRoaBnsfBYTJxBrWLeS/UenvdBCp
 G/iso8teIlPbix4gYA2aPnyajA3Of
X-Google-Smtp-Source: AGHT+IHfLyg2uXsY34m+3iEe8uZlkCAerPVMhw7+qIV6BK8aSrGwu9MyjvtOp1PskSOEoOHRceQFEw==
X-Received: by 2002:a17:902:fc8f:b0:267:fa8d:29a6 with SMTP id
 d9443c01a7336-269b9cc7179mr167919305ad.25.1758567219026; 
 Mon, 22 Sep 2025 11:53:39 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 68/76] linux-user/aarch64: Release gcs stack on thread exit
Date: Mon, 22 Sep 2025 11:49:16 -0700
Message-ID: <20250922184924.2754205-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


