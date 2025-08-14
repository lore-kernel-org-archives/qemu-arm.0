Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85100CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:23:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXi1-0002T3-5b; Thu, 14 Aug 2025 09:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhN-0000tx-Ei
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:54 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhC-0005xQ-Hb
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:52 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b4716f46a2eso583198a12.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176914; x=1755781714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVlQwNjtMgvAbm23dBCZDYeq1xNwwku3Aggvwl5C6uU=;
 b=NTTT/aZnd7i0YwAaOmJbwE7As6j8BXQIgcJJDezrZp26ZhoT0wIuflMzmfitnf8ZEU
 1zPXeWByQ0V3vD3ydZil4DTuDkL6VbFqHkU2zyMWguSuYYLcQYQ/pzXScpz1PMU53S81
 wnwhw4bKDbtQvrfJt3n0Nh8pvrSpWN0JYyd4FbwUKH2gLdO/RRXd7Uaf5gwPh1LWUgPB
 Kq9I3BLDbxiskT4/icM7PaS6K5KKs1+/GMI2481yAY/yWNZKR5XhaPqyp7DYE4Ay0/8o
 Y61O0SmK+dqjCeX6u+wG2z5JqfJotv98kEq10L3QE2/3BK75DpnOzlAAeVHKLRT0OtwS
 iDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176914; x=1755781714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVlQwNjtMgvAbm23dBCZDYeq1xNwwku3Aggvwl5C6uU=;
 b=gVsDMnobDXQ7I417Y/0CM482tI7zcP87aXiMGITH++SBXaQma1mKU7dGbIIAOde3IM
 3fCMPH1Q2EWzI4lE+1iYTFbZrN2Zdl1WlegIH6y1hcB9gwn7bfn8/WxSBVCkGdLfLvbA
 +hTe5d/aXfoqVBjL5uXhRYETbLUuxK+ERaz05WqMJQnWmC0PS1mwovQUuTm5nwsxgPfE
 /6T6ELInO2jilRMNATLvPhAK+KM2mE/z2BfOc7gca09nNHiFVDDrvZrkRevG1Zfan9g+
 sjMnWEzG4M2YLjJzA3sQc2MbQbZtZ/ex6icBePPIHIvYA3e7pBpXeN6ilW8rAh4DCvX8
 GmLA==
X-Gm-Message-State: AOJu0YzB+dOcWkCtpIVS1mUvX3ScNyZLUVC4/6UtIrKG3FGqLlnQiFWZ
 ALG6DGzC0/WA7+JQTqCavEmvhRkanEfI70AjCoaBJxQbcVhKxI+DTHgY1MO3q1ZFDIM=
X-Gm-Gg: ASbGncuGiq/tUWYdENQXoI7ijXloXwg7j1jWuJ10yWbwtZc8JOBL5Y2QNbyzGxeJ+oX
 LLcbLHN1GnLN34Wot6yvEKrOGfJ+MBPVPgEa6dPkY/BNGNhxWyDuz+rYEXEBBHhCQ1pe8Td5yIo
 n8yuMERpznGplZ+NU5Dpa+67xmLjH467mNhrv8zgs2ib27mrrdsbApypracB/g66DYOTSHWXX+7
 pIksbtwLj+9mh87pfeIVDlI8KAIWyfgQUtuYsvqVOmZ+ZwPdt9FpRvsN8zR1FuOXJxFNP544YHX
 ns+6kTg5uP8YLoQxjst13SfeuPvOjzTILLR02JNAtnwhT9sR2lZVRJVXT8dGNy5a8Ejspn7Q6xr
 F9Q1/cO240O9yZx3ezrcF1nJO2rvzIPn2XErzzTjDksu03KM=
X-Google-Smtp-Source: AGHT+IHCYUly2xq/OiPBQ3pX2EGmQuu77FfAvzsezay08YhbrR/4DnKVfu4eiWMoh5O8fJ/8uRmUxQ==
X-Received: by 2002:a17:903:22c4:b0:234:986c:66bf with SMTP id
 d9443c01a7336-244584c2da5mr43248005ad.11.1755176914428; 
 Thu, 14 Aug 2025 06:08:34 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24304c2943asm64438335ad.30.2025.08.14.06.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:08:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 82/85] linux-user/aarch64: Enable GCS in HWCAP
Date: Thu, 14 Aug 2025 22:57:49 +1000
Message-ID: <20250814125752.164107-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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


