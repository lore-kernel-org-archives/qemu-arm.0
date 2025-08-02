Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5DEC87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:05:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLx1-0004A3-C5; Sat, 02 Aug 2025 19:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLs1-0004V5-1U
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:42:38 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLrz-0006sa-LE
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:42:32 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e8e014c1d19so1659115276.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754178150; x=1754782950; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVlQwNjtMgvAbm23dBCZDYeq1xNwwku3Aggvwl5C6uU=;
 b=ukx/UYgqmTymtJCnoJ6CvQi7G98zgUZKUz6C1DlXgr/x/u9JiEMZTsRk2uUbRT65UH
 80Shw2xIiDCzqmJS6hOGd9oHHjEj3+IsoFWqcmeFqb8wKT1FWbPgikUDyxFHPbKM7Eo5
 UF/jMDjW9EfQmNUvHb9pSHsj+7Sham8EiA5jl03lArgLHxKdERKguVlhimkVyr06dPm9
 5kzlIENZ1+uGWhtTt3eYyT1HLZ4CRxC8dBK3q7JDUh/WbHfGwodchblrzW47psniV5qo
 wXCzrsEgprk18u43PO1G3r6C4amLeXUia0paNmM5bDV1iMIIXxDXHu5dMDniQOBZQsUf
 FaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754178150; x=1754782950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVlQwNjtMgvAbm23dBCZDYeq1xNwwku3Aggvwl5C6uU=;
 b=dc4mHkJiOjzPoxEiFzltXI8H6jANluYct7oGR101/ABL46bXNZ4m3zCxo9LU0qzfhl
 xCGLy+0EUr3idhY59t3EXqmzJ2NHlMl2zb1MBNJby0nqab0V2R1ZIpWNNR2vJ5mwLg9u
 yiL6F8GaA1vtcXvpC7+Jf7l6n3BHj6NcmO45gdWk7PY9dPppjw0SlZIxsBWpS5uW+X89
 FHhcj7bNHTl++N085B5tfhQClhLU1GP/u40D7Kxd+XyV/f2yfc5K8HXU+O/lZMQ1x1iM
 jBd9vYPeQYQ6lf9ovTUdidMqMaO54Iunu4fkOeoyFZRPGeLV4dpMY/Oy7yNMA6mFbkVm
 0Oug==
X-Gm-Message-State: AOJu0YxIk4Zal7bRsAIblYPdu7Uot5HjhIxP5WM3/WEYV2GQrDOGguxl
 o/YoO4/uaHYRLZrpbnp8yxzH28Uf5AmYnxtKtpcYsilHG/km1y0yveto64w2N6U4Y40oxXjRqW+
 d4oSBUyo=
X-Gm-Gg: ASbGncvOWa8/XOu+3VoGbigG9uno2ifmsfyLIF52rG14cwKJoWVt5P08tfqWK/5IDWy
 +UYmAbHb2pSk0FyK+shLD45wbckhTrWdfaQjAXj1Et87cnikXprQCn2JT6Vq9MZKgVcXZPJsv8m
 uL1GxZ62eqzo1bUHHaY9CST+inoTsCs3jDY5wt19B6uJpTr68ODn/WUDLNImbTNOm/67Pa1IMxF
 QRDF7ddit3sze31vwMvL/vUz7facCe9ZEciZSBNPb175a/+5uAfyVnosAAKh+ZeciqPhYVNsbIz
 xEBAY/j36NggWlGyF9fu+fC9fWPSvnsV3N6N5wztP+anw7/XqJI1fumuv88Aqr4ffBUaXr8ErT4
 RCUgpK1oaiQLEgGoR1PUVkMZ4OTpCQVw3SVU34zJQUzYaTqMlySh2
X-Google-Smtp-Source: AGHT+IF5iQbg12HR9p2AMt8U1Te7fBcbAkW3+9V7bHxGML+WczUYQ8QtzRGrLfRZvZDoKQdtTJblNw==
X-Received: by 2002:a05:690c:17:b0:71a:1f26:5d1a with SMTP id
 00721157ae682-71b7ed84355mr49527207b3.11.1754178150515; 
 Sat, 02 Aug 2025 16:42:30 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a423f38sm18461527b3.40.2025.08.02.16.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:42:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 82/85] linux-user/aarch64: Enable GCS in HWCAP
Date: Sun,  3 Aug 2025 09:29:50 +1000
Message-ID: <20250802232953.413294-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb33.google.com
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
 linux-user/elfload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d87d1a16e0..e71dcdec1b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -877,6 +877,7 @@ abi_ulong get_elf_hwcap(void)
     GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
     GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
     GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
+    GET_FEATURE_ID(aa64_gcs, ARM_HWCAP_A64_GCS);
 
     return hwcaps;
 }
-- 
2.43.0


