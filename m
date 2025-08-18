Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E86CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 04:26:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unrRX-0000Hn-2z; Mon, 18 Aug 2025 00:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrGJ-0005pc-GK
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:27 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrGH-0002D4-U3
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:23 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-76e2eb9ae80so2696261b3a.3
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 21:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755490459; x=1756095259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0ZHX+tn8nkbaFtS2dHaq5l6wD0P0NOK8ivJm8HB/sE=;
 b=xFPfpr9FxLvXGAEf9XynyPbnTbYlqSJor1/JFgIXX1Ecom6WfN1I5s9LpTAxwF6X6l
 dBNcJk7a3uHE+6CsFQpeuQifwM9YHKekhRU1Pc6FFwUF51Ya2pfDepn0JG1Vqf6v+0GX
 9FiG1WcT+1ciOl9He7+r1c2umAt4CxqS0SV+1MNFKCmLnKIkudFil6G2fAXyQBmcz0z2
 d5WezPBGBFZrEdIvpFcDU6omaYHNrfLVqxsNtzcZY5VvHV9wMBBnNlqx/QNYSf2HYOCU
 FuXnLBOxDOCGKWnxFL+RVuo1CsWJ1kQT8KC9PQYZpFEb6IDF8SU8xd44VPs1lXaaJZA4
 GZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755490459; x=1756095259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0ZHX+tn8nkbaFtS2dHaq5l6wD0P0NOK8ivJm8HB/sE=;
 b=Sv3XACcMqQRlwb8Gi28a88wGZl4oYj5PNZviAnqZlNCu/VTjqQ1iwnDPcPcMMBqe4z
 P4oKEYO23htyzOPEoT97vneYr8xFYu10vl/Z7fDhAmsHByomPvhUpXPV9nLBFrRDUB/D
 LwygoJ206qO4Tf+ymSiTWXvQliKX1XtwD2eYAwJpLw17hjl+d58X3SCKeJzAoDrMdEz/
 iYjbfcBNNw3neL649YQ0Jj3Gfu65SI1tzV1RmNKiYo9eSpeHB16LYKkX97pI/V2FeSuU
 sqB2aBBSU7U/NuC4n2089UBHWxuGwLUcYB4wFJC5J4lVekVh/EwCDhWkWG0vIDPrFTic
 SE1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrp6YA6ClZ8cUh9XVNwMpi+y+52WK76bLhNuohfUPJxovcFCWp/u4zHw8JAktrOAfkKzfklD/6TA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/czuyJdyLMcKV1clNKhIInJhID5Y2BmHqDXm0pDjE/CN4Vian
 982C5JcqhLqcQ5R1A0ixR8xWwj3v4cGDgvwhz1tOcUgtRI0vIbFkdyEXjimzoDIHB5M=
X-Gm-Gg: ASbGncuymMiJhT0kRPbMAQE7YPaJLCjtXrdCydcv42CAhUMCFa3oqKVI10LWGq5jP6h
 2sO//RA4ctMlyFWFWmBSblbHTnDkY+xzcfTj2Lu67HPv08OzkNDpf8LMS8hYwalzAokiOzYMqud
 fbne+4Xrcl8Izea/7GDAg2TeMRY+y/tnwkhlJaj7hoyl6CMDtqaXL4Z6qEpltMDq5xPt7vahmmW
 3xgMDVLf5nnZAgvzWx7R+EtJlWo+EQRJTOD1+cY94x7PUxVKx6DiZsuEA2RE4ahI0S0OiESmaDN
 0Fu1//bcFPX5T502XcbfCrBX1ao/hfxNWGaZh1tr26mfCXLD5a7JIty3b3d0u8d4HJFQ8wgzShF
 9ENzsy1PRmDYamVMnFeH9E6YrdK2SYD2tl/DhcRJM9nTulkY=
X-Google-Smtp-Source: AGHT+IERiGlaVJB8ttAdKnv+Hzl8CWgSf3ujkjszyKmDUCM9q3ddRRHcoDfsPnv+mSwybBxlPSq4Sw==
X-Received: by 2002:a17:902:d512:b0:240:3ef:e17d with SMTP id
 d9443c01a7336-2446d8d3c4cmr149364015ad.40.1755490458937; 
 Sun, 17 Aug 2025 21:14:18 -0700 (PDT)
Received: from localhost.localdomain ([206.83.122.207])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232f8c8e4bsm5498344a91.2.2025.08.17.21.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 21:14:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org, philmd@linaro.org
Subject: [PATCH 4/7] target/arm/hvf: Add KVMID_TO_HVF, HVF_TO_KVMID
Date: Mon, 18 Aug 2025 14:13:51 +1000
Message-ID: <20250818041354.2393041-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818041354.2393041-1-richard.henderson@linaro.org>
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Conversion between KVM system registers ids and the HVF system
register ids is trivial.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index f0e4b75e6a..2577dc1c0c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -403,6 +403,26 @@ struct hvf_sreg_match {
     uint32_t cp_idx;
 };
 
+/*
+ * QEMU uses KVM system register ids in the migration format.
+ * Conveniently, HVF uses the same encoding of the op* and cr* parameters
+ * within the low 16 bits of the ids.  Thus conversion between the
+ * formats is trivial.
+ */
+
+#define KVMID_TO_HVF(KVM)  ((KVM) & 0xffff)
+#define HVF_TO_KVMID(HVF)  \
+    (CP_REG_ARM64 | CP_REG_SIZE_U64 | CP_REG_ARM64_SYSREG | (HVF))
+
+/* Verify this at compile-time. */
+
+#define DEF_SYSREG(HVF_ID, ...) \
+  QEMU_BUILD_BUG_ON(HVF_ID != KVMID_TO_HVF(KVMID_AA64_SYS_REG64(__VA_ARGS__)));
+
+#include "sysreg.c.inc"
+
+#undef DEF_SYSREG
+
 #define DEF_SYSREG(HVF_ID, crn, crm, op0, op1, op2) \
     { HVF_ID, HVF_SYSREG(crn, crm, op0, op1, op2) },
 
-- 
2.43.0


