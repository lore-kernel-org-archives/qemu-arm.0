Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3207BCCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cEo-0002QA-Ou; Wed, 08 Oct 2025 18:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cDQ-0001O9-D5
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:01:01 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCZ-0007Rk-Cy
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:52 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-782a77b5ec7so259089b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 15:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960801; x=1760565601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IYbDL7ZzrPeJgVCiHhUdegByQ1ip3ofl4M+Y1UUBtM=;
 b=VeSQ9HqNqSBtzmOXLsriIwCZyQgSQDeEz7p+4wTdCWasloeVNRlHfp0rwGUsMvCdct
 C9RkAxpi8iLwYnp4r/GWYryzoKh5Fi9H8a3kabESHmkLQzLs8KWiMTLVZtiAwWerUO4r
 nz1VQeU93qpAofbixTuBiG+hMsX6yQTmjEQ6jPYYCJi5wtT7KAQRRm9fBfGR/pyCCb/V
 2iOZkHBHZbKnZTDnicK2MMVyXPrMPCfkvq4yBzKrZSf10j5znwVquqpwlq/LUl3JLRzA
 op+oWUfj6HQ7h9FYBflA02zvRSowkglSoR1alQhre+7GAZRbsJCDEIXgQ/2V2GdwEWg6
 piEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960801; x=1760565601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IYbDL7ZzrPeJgVCiHhUdegByQ1ip3ofl4M+Y1UUBtM=;
 b=s+qpx85j/QkNsZWRrJ9zwXDZWgGgP/ZWjMMk1KRZ2+SnSWBPZUr1PvUGNBgOpyQtfG
 Hvm9eR/KiQnl+K6ypTVc3VPCNiD3S1emGhDi0yJZ7bNuOgdFmZ+PyLoqGz/yQ6aAIKO+
 lP4x5wv5aXscytFN7wC/B18k97pWbKMvvMZxQOv6DJ+jmYKJD4q4w3dnFagsJahbBl8Z
 grcZu+ceN6XKREeSiT1rhgX/P5g5cFtGXfvG7JMHwbRfX3RIF256nnAi0mnCwIG9ZaGj
 tbDz74/idbLzQEJI8ck8U1a0xqhMokp/dQTq508SJE5W58dk3um7si+bOPRUsbO5ynBI
 edfg==
X-Gm-Message-State: AOJu0YwqE/rZ4QRe167VqY4lRPu3Dmyzw6fsqPo50mslWmsDX/Imnw3b
 Mt+ZmyCgCUQ1/DAkPRxybMMzB58v/86g2SnsLKxo6BxRnZixnmNCmg/w62AOxlImBSg=
X-Gm-Gg: ASbGnctvDEzHO2RGuU/wWmt0f7Y6kCETD13U81pHlyaYIh3AzoXgzb6M64GHgayPx2a
 KUxhLw8ZHbRMkZRrpl/FmXU021N9KjQevFgju5FaZf60cV5B7VLYt4yo2bwotOekLHsFoxGVbp+
 FIbNwoE8b/McduLXo3pSpdHpMT7s2Bu3Ylc+31lNWKgbvjyKlUNYNonwc3Vbbs135xxavYLcqeo
 a8P3i9eA10PpC+v4gw1kcK0YGIS90GDMvXZXb50cH2Qz6mDxdqJurbbhfX2il3oeZNcaXP53kPw
 LoWen6cDvDiHydtwOd72rpI7Qd0wnp0QrvoV2a9RvHvOkqOYAbBQQ7Kp124RNttdTfSeFeBMI9z
 QMdNe+N1xuop+Ox+OiqaiRDLyBNIccliV/nO7JramjJdCOttPeMSX2JB3
X-Google-Smtp-Source: AGHT+IGf/HYizIDf4VnHyN9VwXV+QrTakTxI9hy2ZTflQLcfFvpIA3aJAeY0y3aayfmSPQ5SAFZs9A==
X-Received: by 2002:a05:6a00:391a:b0:781:220c:d2c1 with SMTP id
 d2e1a72fcca58-79385709914mr6537245b3a.2.1759960801076; 
 Wed, 08 Oct 2025 15:00:01 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.15.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 15:00:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 70/73] linux-user/aarch64: Enable GCS in HWCAP
Date: Wed,  8 Oct 2025 14:56:10 -0700
Message-ID: <20251008215613.300150-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 linux-user/aarch64/elfload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 77d03b50e1..3af5a37776 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -169,6 +169,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
     GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
     GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
+    GET_FEATURE_ID(aa64_gcs, ARM_HWCAP_A64_GCS);
 
     return hwcaps;
 }
-- 
2.43.0


