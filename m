Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9DECA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:46:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNzn-0008UR-LP; Sat, 30 Aug 2025 12:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEUr-0008UK-F7
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:51:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEUq-0005j5-1Q
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:51:29 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b49cf1d4f6fso2014242a12.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756533087; x=1757137887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IYbDL7ZzrPeJgVCiHhUdegByQ1ip3ofl4M+Y1UUBtM=;
 b=tF+KtZJqZWblzeGDyvUXOKnygutZWk05JnYQees/vIXupNu0ax+LstJhkjinkRAD6e
 rb/izfa2Af1PfU4HqIiXlWjgXIlcWmdHqETeGyx8uFiGqS5YV3tnhGlIEVGvgKpIGLBf
 hzCT+CrkLgHxsD/6OLZJ6NRnqABn72fovoi9zttnvLGEebC3mKAZPXlz1xXsKK9bSKLR
 lKZjCA3HXkApN73Km/IxyiMbuVsZXp8qJbylsEOcLZRQKDSq8YzTLLbRTRzry29lW2dM
 O2OLeUSFbezEQt7UHuDLA8yidy/XmCNRl6nPySZ3KBwKL1HK09C0SY1ZelbQ2AqiibSh
 bKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756533087; x=1757137887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IYbDL7ZzrPeJgVCiHhUdegByQ1ip3ofl4M+Y1UUBtM=;
 b=v10X6w4z3JTlWj+Bjx7GWOuQ/wAzgR6nkcuJvwC9wPvKzsxLr0Bkuq7ZQV2JW6kSRk
 Eu6YBQnRaqRo+gLbGtkKWGs/qwfIfyHQiUs7mJKJjvElAENTKWuUR9W0Cjo874SpZnK8
 dO1cMIbzNhfA+nhL1P3aFS0v+sL+5GfYFDRpWxQfURMOzyNwhaqDQoSraJSKFyBXZNMt
 GwVLx2RWbA5BKWE3yj1ZLovVPYxXOnICOLk0Qc/0sGzhU2myZhCXMxDYWWE/j4W8TkiP
 x69sYFBt1sXqb/2Tpckcq29JIDYVMX2gaJrYS+jh+rWf3MLXvWYttVSnwcYlRuSYy9fU
 RnkQ==
X-Gm-Message-State: AOJu0YxlTWyJe7ryIRUJJxljC4o4MTnoZ33Sn+66HQJE/VOhN/e4cJLM
 FsT+7KgwFAuSfhq4CagnaZEavZWVws2/SmdmnlleUNVZsCIkex+Wq8NSC9fxMy18IHQ=
X-Gm-Gg: ASbGncubyuoDvEjDJ1qp2pCYEyzXcBLEWMwC6ee1qnshOEG28y5sskcImZk+KgA3xwV
 EHr3X0dQjMOyu1VZ0HvqZOSaeo7jqFxy51/0uaMtsZgnqkcAp+/uJOq56LBpqlE2CyxLbJcQ8z4
 CacRnk/0jS4c9zR9gtdKQuUBDU/EvF86BTks71zLqBwVWiWFO9wEG9J3k9Px0A0qU8pQ4yIDFhi
 NDltj2c22JhdPujnNy2fJ9OOW3fGwZX5FSfh/kWvk8xjlq9hxtvAQ+14KWlKW+3s2Hd03DtObj6
 c9sL3snvS/emdwGxdSSIbnYUe/JmxGf4PUIhzbpApV/70WG1ZeS3+oYFaSUwqJX20JMmtlHYY/P
 XGMNyIJeeq9iD6wzF4TlCqhgz25DWV9VOMiyz1yf2xtyQO63d9TRU78P+vS1m5ZzPD1B1Pq8=
X-Google-Smtp-Source: AGHT+IF33CZNJgSyEhFaeYSZPZ+iQhpvI/gDhdIyl4tLJ2EDGNHSi840laJeYx+eKHsrnnIftARhSw==
X-Received: by 2002:a05:6a20:1595:b0:243:af83:6c75 with SMTP id
 adf61e73a8af0-243d6f0293fmr1639383637.28.1756533086649; 
 Fri, 29 Aug 2025 22:51:26 -0700 (PDT)
Received: from stoup.. (122-150-204-64.dyn.ip.vocus.au. [122.150.204.64])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b7d10sm4198475b3a.33.2025.08.29.22.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:51:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 81/84] linux-user/aarch64: Enable GCS in HWCAP
Date: Sat, 30 Aug 2025 15:41:25 +1000
Message-ID: <20250830054128.448363-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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


