Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C420ACAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:25:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWaf-00062v-5V; Tue, 16 Sep 2025 10:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWa0-0005i8-6r
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:22:48 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWZu-0008HQ-GM
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:22:45 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b4c3d8bd21eso3587822a12.2
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032560; x=1758637360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ggwb1PQpRrrkLOGCaS9ng6BrXdIGDe+gz4mi5GKaHg4=;
 b=Qz5dtjqmycIzu1IkGeg7iLsNqD+MbZgs9cK5MzNp/+YbxQmXDwWC75vyfBcOHLa0Rj
 iLphL0UqWMzbfm3o9XKFAFB90u7D3jm9IC2I+jpmGhZA1OLGZtC81aSdJh8rxBgqwBnY
 8VvtuMOVhqnmZmM+6ig8Ljx8j0bYFzuQ08XN8YujTBmY3qkG3CLmLnOYeBqoZ77rriBZ
 L41DLHIb7Y9hmvXkiz+E+qdq2Dzq116Nv7qqF9v/0ilESyXbvkZOCR63ffEmNn+rJQ0J
 uQ0Wgv44hAOhkKlK120bH1Q+ZEF2n9QmfBcQU7ATYjED8kPsx1El644SRjwzYeFK2nOm
 2K7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032560; x=1758637360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ggwb1PQpRrrkLOGCaS9ng6BrXdIGDe+gz4mi5GKaHg4=;
 b=MFcdaKdnL14B1ELT3C5IfKOa9SDHWpd0dmJnII6h82eGCYlaZyiu5Q1x7TflAKuI13
 zup2bsuDAoz3TZi5vIPIxaLYUjhOdRQQ5Wvcw9zfe1p+rtmPB+I2ws3lqKhIfvOg6QPg
 /rmKZNlsxzPZDHj9S2ESeG6W013fF5BbMqW4F1V7zOrlkSl64GSfxSDn3kOWyenqk5jg
 7FSmM0nJtm/foWcqCPe8EpEHi9/B/JA/Oo26zcRjZKiKVlvLOu3b+JQocwx897/cfi8Y
 y/4lj7RuWQ1XtURyNsCYjYsTlOCwq9w8REwLqazftWlKljFrrmnUgbcUSTCL4h4JLMBi
 tH5Q==
X-Gm-Message-State: AOJu0YzVk0ciId24BPHu6ISzs0K4gv+18SkxvAOSxOBJ6PaYBiDQ5y4m
 KBYChyql/TCcMU9Jqv2wM7cjrwR6hzPJhFQGrLegOD0ItK/ipzgeXdGQArpobwcT4IE=
X-Gm-Gg: ASbGncsUIb3qpJLm0aBvPYcqoqdnB2RJVWT1mPI6K/0hIeA8n4X7Z2oL7piN0GDhpOo
 7O2Tqm4uMIM5Q7fGQtZNb75ncHcKPDeEh6lMrRJVAt0akG4bbK1UO8rF1ht3RIVr5OT1SYcY3r7
 5pdTIdTYTr5K2LQi6uqYh+dV5UOGaskGb8Ts4DJwXmJlhER25uAVjLNeMn18vLlHtA9yl2mSFBn
 ybNycIRHCwHNrGbf+Upm9Y5aJkUL3fSiz/xKBFfmKRbJ2d6zwGU9OGPkntdQDbfOPhTCfkPTEoY
 QqC/R2x3R3bwE66dQrowgNNZQCc+Co6r5v9HoEJFV9UH1AXsntT8c9gcB15AcQ09TBgTb97TfN+
 S4A2opG1UAE7ETqRUF91p/tYdGE2j
X-Google-Smtp-Source: AGHT+IE3CN+8SXPUqhiTrptq+LUoQb03jckSSvZOGZe49jHkgbp5Mfw/0e7ESoBQA2ho9ljZ3tPuCg==
X-Received: by 2002:a17:903:37c4:b0:248:811e:f86c with SMTP id
 d9443c01a7336-25d26663209mr182399855ad.34.1758032560232; 
 Tue, 16 Sep 2025 07:22:40 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 01/36] target/arm: Introduce KVMID_AA64_SYS_REG64
Date: Tue, 16 Sep 2025 07:22:02 -0700
Message-ID: <20250916142238.664316-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Allow us to create kvm ids directly, rather than going
through ENCODE_AA64_CP_REG + cpreg_to_kvm_id.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm-consts.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index c44d23dbe7..fdb305eea1 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -180,4 +180,15 @@ MISMATCH_CHECK(CP_REG_ARM64_SYSREG_OP2_SHIFT, KVM_REG_ARM64_SYSREG_OP2_SHIFT);
 
 #undef MISMATCH_CHECK
 
+#define KVMID_AA64_SYS_REG_(op0, op1, crn, crm, op2)    \
+    (CP_REG_AA64_MASK | CP_REG_ARM64_SYSREG |           \
+     ((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
+     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
+     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
+     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
+     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
+
+#define KVMID_AA64_SYS_REG64(op0, op1, crn, crm, op2)   \
+    (KVMID_AA64_SYS_REG_(op0, op1, crn, crm, op2) | CP_REG_SIZE_U64)
+
 #endif
-- 
2.43.0


