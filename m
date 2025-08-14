Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A71CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXZK-0003nM-GM; Thu, 14 Aug 2025 09:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYc-0002TP-Ra
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:51 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYX-0004Pq-7q
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:50 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-32326e71c31so905323a91.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176382; x=1755781182; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+ER0bRwaWJSVZXuKMTaNBSXf4hbZ3aeU4lFfN33xP8=;
 b=mheFYxyBDRZLrY5TvamzybUb9rNG2GBM/BwFcgfEOSB6n9KISQY5yWuj0qq9mwBiB7
 O06qj9XcVDcl0o3b0DkBqN7Gkiz08QUZs/JXGmND7j/uzUe09woedkGRUTg1xKZAP4Kq
 GhAPOf2dwsz0sQ9trLCi9mlWoTsLBzdNsrFSG0ad6BTlYLcQ3IDzzH6ReqFJO8LXdavU
 AwJlvPKCtm28gCjT68h2yqNM5E49p4ZOvcTxf/I9NRZxrGg6T9r6wIUTqNJJkSFH4BzL
 c+zMy7rQH6vpJUSjiUARkFWJslU3GI2VAi4iFjgAlrtPPi2P4GbRVgmCSYwP9QgTxhBB
 5raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176382; x=1755781182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+ER0bRwaWJSVZXuKMTaNBSXf4hbZ3aeU4lFfN33xP8=;
 b=iY4n2kZSevHwPZuYsLRqj9BlhwQepOL7SFJlyYHPXO3bbbxprNRpSTjBw0piqt3YDy
 Okws0z+EsWWgOdwDYWWqPRLUsdxIpQ/exDpheSLVTpJW8tBNkac0lzsdrgFq1/5GZe/I
 vGNZIls3BM1SoetPIz4u+gBGawUMSvEW9YIDsoqXWaXklUkbb/9M+gikO0T7wpnkU2tF
 eNmfgfeWb+/l8EfXLuOolpOLq7FfRhPnlNxqA6ujLM9zzZlauFhNbe4rqmLrgDAUcRoB
 DX5UQjKrL1TPpbgPXQJmslwF5mVmGGkaqbJdF9oWQ8Gn60kxK+4/svdTMeOkhKqHb/Nh
 GafQ==
X-Gm-Message-State: AOJu0YxnLyR61g1cm4f3aUNywciTthyovCvbYVfQSatbmxL7C48g+64o
 f8yR0xchxA9OT2BAiIxH3+vH1FKExu0os77QJFj6oq7nc0ylv3o1LH44bQ/cyp3rJ3o=
X-Gm-Gg: ASbGncu3ZUl/Pt1b+T/DdHhB3vcILrwcal5uCFpj+cFvi79YIRWBNCtUltePpSAmJuC
 YIdFxRmp/PQTk4v3CfmNIkT9Oak2kHebQkhZhVOz1tHFqsiP9SLgGxej6mlhZPrPzXXxQPt07MR
 suy3DcLO29Qsxo1sOTYjjrLJIOeLT5tmwsUEC4DdtcdUhe9R25+2iwN9cMQaxIr7afMw8eHTEQu
 tmUX/Ibe0cucChhVb3UEGntLphXmeoyc0hO8pslaydxPRwdlPXOfQo8cbMvwbwZKAT9he5HR+Ld
 BizaM/V1SKyLLE8V9/RqCN7/yZK2/WrmGvCERdaRumn4UYqmk+AuH65zyninDclzpWI7GjAXBqq
 TlyAlQXXpBHQjKr/Wm6IkwAHxwo27nxrRsT+u42TNSLfNZlwuHnaiUD6ZSQ==
X-Google-Smtp-Source: AGHT+IF/5OGQwj2P8DxePsEitnkzCqjvCoXizhVH7dHkrv1QXC2y7F1jR7qp/b7jGKXt8vkKzwQ6Aw==
X-Received: by 2002:a17:90b:35d2:b0:321:b7ed:75f2 with SMTP id
 98e67ed59e1d1-32327accd91mr3983378a91.32.1755176382027; 
 Thu, 14 Aug 2025 05:59:42 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:59:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 31/85] include/hw/core/cpu: Widen MMUIdxMap
Date: Thu, 14 Aug 2025 22:56:58 +1000
Message-ID: <20250814125752.164107-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Widen MMUIdxMap to 32 bits.  Do not yet expand NB_MMU_MODES,
but widen the map type in preparation.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 accel/tcg/cputlb.c    | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 23eb849a9b..fc9a2291d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -201,7 +201,7 @@ struct CPUClass {
  * Fix the number of mmu modes to 16.
  */
 #define NB_MMU_MODES 16
-typedef uint16_t MMUIdxMap;
+typedef uint32_t MMUIdxMap;
 
 /* Use a fully associative victim tlb of 8 entries. */
 #define CPU_VTLB_SIZE 8
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2a6aa01c57..416aaa1040 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -89,9 +89,6 @@
  */
 QEMU_BUILD_BUG_ON(sizeof(vaddr) > sizeof(run_on_cpu_data));
 
-/* We currently can't handle more than 16 bits in the MMUIDX bitmask.
- */
-QEMU_BUILD_BUG_ON(NB_MMU_MODES > 16);
 #define ALL_MMUIDX_BITS ((1 << NB_MMU_MODES) - 1)
 
 static inline size_t tlb_n_entries(CPUTLBDescFast *fast)
-- 
2.43.0


