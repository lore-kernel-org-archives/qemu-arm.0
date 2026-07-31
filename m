Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0642C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 00:06:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpakT-0001cy-O6; Thu, 30 Jul 2026 20:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakR-0001a1-HP
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpakN-0001Ik-0Q
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 20:05:08 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-848761b5897so322773b3a.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 17:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785456306; x=1786061106; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6IlgMhpUv/jFrsAS48m1RtDHWgLnKH1jFwV+WI6Uaug=;
 b=seoXBSJJQTzS+Yr2Tg0+XNpLUSr8a8HTX8kodp0ed/69oFfEfBMKDcOsoP1lmaP5k2
 +GgyqpsjhDB7zqjIoU/UWUteN3c/9HY0nSgLlOCAwmhUOAFPDvPburfBhKHjjJu/ZV+N
 utQlXhqN2g84Mly9wCaeFnvqW70bm4REDjVh/4Snpds1LOQWLPg5mzmnM6SQq0rFRiKD
 M5D5//dMPJtc4o1V86AdWpgKu/mYHDquQEyiolimrijJMBzdt0lUwkpRFMBr0d7AZH6K
 ZNgr9/hbzpgvRL6rPh+dgN0uJcOifk/TKq+a0eF1Qsa94XUP/JpDgsMkWZ+A0HQBWoiX
 Kisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785456306; x=1786061106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6IlgMhpUv/jFrsAS48m1RtDHWgLnKH1jFwV+WI6Uaug=;
 b=qzK5yDFPXL9gfC/Ajy0VMuwR9s/r/6jQnXhwv4ZtmKkpvQRTbzQ/3aLaYzTrQI4sqE
 km4ASNmhoZa3OlsTLrd5DtVlpqE7USoWmKoyo54oLwIjqtO8ONx//iHbJF8SULuPVxy8
 Wp4bwpJwn5Z5JNNmpp+4Cy/YPASyyExjkuwC8aPqtsIM+SMU9vBf3/uOMoB8wywMMDfR
 zuwo9ESdm+PHfyZRjk5BZDJiexhhaz4HLDZcvLUFYbYWSlXl0sLNNJgJv1l/TiM+GFl+
 UFrK+DVuvwI7YqrrbrSKgN1+7rPbX+F7UZ44WtaTgI3FrUrbVGUH3YZwKrGJuX8OSA1v
 OYwA==
X-Forwarded-Encrypted: i=1;
 AHgh+RovQJkUaED6CRTrhPwxWYDANy5F4n9856Vo5ouB5I3dDCkrLPBFLVX/Vm8CCtQYeiF6O8EuLKWQzg==@nongnu.org
X-Gm-Message-State: AOJu0YwkpdnFGdHwM+DYmQ6BJyUFDgY91X1HOm9o4F25zlfsi+WiecwL
 tHFGmRPy6aeTyiAg65tIRH7SUUKK9li7DCE/mpWe3HxFtOY1joLJ2V35sJn/7776pxU=
X-Gm-Gg: AR+sD13tlqLs9EDHSlJ0MSAhFoyYYlvrTW/wl4ueLHBmLzFhsS9B9cPTck/Px9vM1lM
 VFNWBX6dDLTvE8l9vyoaeAUHwh6GndqE1CVAd6+ASfzRh0m395TMaePvul66zZC3q7VebpjEjtM
 +PjOzqYWuwe10rsSfZDtaHXxg4Fd9/fqvI2phBO10caD7mAYy7j+nHkHOSdCB2ZMiwNkCWyIGJM
 9WZZcWUGjDkc/+ccfkU2IIdAXG1197lSf8uTZTFS28ZEQN9Hs9F2ZVj8/SIWS96CYp8hPSLiQKk
 pYtk5c1k2eXSmLbXIhrGxcrEnniG9aDVjcnRcUUQbNRm95sv/7wupZgbBvKrsMSnQ3m/T/i5GkC
 pb805WEzWYukqdks1mUlJ2J6+QBAWsv8HoTbQNS9YbKo+YmZjzsWqDJWsWC6lykClE0f1GpGqvz
 fzGZ0Il4yBE8qm8KAPkclCfT/NF8JU8H1aqb1aYQgRTjYrrh6zQasqGi5q1p8oa51AJaG8MYUae
 /0FTpmJUzxeOLR8pN8i
X-Received: by 2002:a05:6a21:7014:b0:3c4:1c9f:d90 with SMTP id
 adf61e73a8af0-3c9007f13ccmr3932778637.39.1785456305502; 
 Thu, 30 Jul 2026 17:05:05 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb7a999ddsm2656460a12.4.2026.07.30.17.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 17:05:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
Subject: [PATCH 01/11] tcg: Fix opcode dump for bswap
Date: Thu, 30 Jul 2026 17:04:53 -0700
Message-ID: <20260731000503.170446-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731000503.170446-1-richard.henderson@linaro.org>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

We use an array of char for bswap_flag_name, so some
entries in the array are non-null but empty.  Check that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1e77f2365a..e023ee8b9a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2951,7 +2951,7 @@ void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
                     if (flags < ARRAY_SIZE(bswap_flag_name)) {
                         name = bswap_flag_name[flags];
                     }
-                    if (name) {
+                    if (name && name[0]) {
                         col += ne_fprintf(f, ",%s", name);
                     } else {
                         col += ne_fprintf(f, ",$0x%" TCG_PRIlx, flags);
-- 
2.43.0


