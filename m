Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0F7CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXem-0004Y4-UZ; Thu, 14 Aug 2025 09:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXeC-0003kZ-Ht
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:36 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXe1-0005dI-66
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:36 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-76e39ec6f30so240554b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176721; x=1755781521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=weyLI8Pwby6Pmklm5JI4NiuesSFjCf6M/0WIe/lgfK8=;
 b=Wdw4P+MYA8/9s5MtfbuS8MnTHDewYUxZy6IxjFEPLtVLpPGxWUpiEo9/9SupFjpWsZ
 +YGdE8+L8Jo55xe5XrYInSbJMD/m+WIpRZ6RbgIBgUE4pAANczNjx0tATu2vE/ZIm3Oj
 u9yMMq0Va9woDw4v5OriBkuO/vi53X7xrOoAS6GqbinRn1NTSwqhyrAj6HChKf8ND2hN
 FTjyrtCNiMoiR/lo1b8UXGlNonD3RJI17KgNVXcAuE/Nq/IRNwuSoJnHr2KdYfQB1dlE
 RSgHblDpw/rbpk2tPKSsFAESYsNjFH+OwcJbetHOkwXljfyDWERSpWCSuAQsDjSBM9d9
 7iDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176721; x=1755781521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=weyLI8Pwby6Pmklm5JI4NiuesSFjCf6M/0WIe/lgfK8=;
 b=lW6FBX9njnNU03X0Yx2gW4qJAbPJ6V6HhUk09raRkYg+Zy8Gr8nGQvYFcPXDe9SmBK
 3mikbLnNo7DlJoC+FF3YH1NGoI71WWHNve4pQW6n4soDjEEeu3SgCIh1t9dN0AiGhZig
 Gt+vnyJIif7sLf7lES8Rg0VQ11ihwAB6Wx9hh6muQ4JfH6LJ75UFhs6HXuUWpcbUfa4T
 FpDL6ua2poiO1iJNAgu1v6HJIG7NRsjjtROP7hZMFWv9Aj2f3sJOzbiHH1uoUonoLoG1
 D+Un1BO/faWB/y8QNFNEdUspasD0UCRl5L6APc/5c5dXd8NDSXSkDT64BzQABDoWZ/7o
 X5MA==
X-Gm-Message-State: AOJu0Yw/9S9dTUnwoG7YNJ+LulfOFff5AiQ+/upYm+IqMQIlhDn7ZCOZ
 jWuXuRdpp+9M8nzpa+x//Gz6fGQ8K3c40QkiUz6DnyGuMGz8gOqiRs8P5vB6byB+afw=
X-Gm-Gg: ASbGncsVrvPgSychsW2FWirLmpkSOgbHkXnzwBnYic25q2R/engDDg3nTnHdklqPJGn
 Jflm+m4FEVoOPooZhVsnyGChDAjT4D57pxPVWFQVBs+SPiLUlMNISU/e7zu9xybU+ezViIv4ulE
 zJoItLXThxVYugB6Rb4cFdhuEg1wRzdQS9cxEA9nCDPU5AI0MBPPvKhmXvC+FgyPO9Cjl6Lbt3E
 j0hIbVIYrhVziZ39A23zd9yjHaz1fWz3uczvTdKKeiAKu7SWfAMejgemoByY/u+mlajyQVedab8
 bFcNVGR1+ViN8N6IFF7ZoS4wDgc3muLshR8bgzXwhPcVF3QjlI5vi4txUDEhlNSVegJkWhCXslk
 xXqBiW9SWjUBRcJbsZRWYTZqTf6UDv0hJcpbk4WyGRBCj/GB5w4P6mOZ6ZA==
X-Google-Smtp-Source: AGHT+IFQGzlyyD2ip3r/5qhf3oOvDbAe338WXf7KKQBDABXnHFR6gOVYV0jiwmtEaD6ERJ11X58p8w==
X-Received: by 2002:a05:6a21:6d8e:b0:240:358f:3918 with SMTP id
 adf61e73a8af0-240bd371837mr4806608637.40.1755176720867; 
 Thu, 14 Aug 2025 06:05:20 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:05:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 79/85] linux-user/aarch64: Inject SIGSEGV for GCS faults
Date: Thu, 14 Aug 2025 22:57:46 +1000
Message-ID: <20250814125752.164107-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
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
 linux-user/aarch64/target_signal.h | 1 +
 linux-user/aarch64/cpu_loop.c      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 6f66a50bfd..e509ac1032 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -7,6 +7,7 @@
 
 #define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+#define TARGET_SEGV_CPERR   10  /* Control protection fault */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index da89dbb095..080aaf3369 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,11 @@ static void signal_for_exception(CPUARMState *env, vaddr addr)
         si_code = TARGET_ILL_ILLOPN;
         break;
 
+    case EC_GCS:
+        si_signo = TARGET_SIGSEGV;
+        si_code = TARGET_SEGV_CPERR;
+        break;
+
     case EC_MOP:
         /*
          * FIXME: The kernel fixes up wrong-option exceptions.
-- 
2.43.0


