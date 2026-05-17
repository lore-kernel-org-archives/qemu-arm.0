Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EDBCD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:34:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPe-0007zp-TA; Sat, 16 May 2026 20:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOa-00078w-3h
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:17 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOX-0004oo-6t
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:15 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-83d31ac4017so413834b3a.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977810; x=1779582610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYsxgOkKZmN/D6H7dyuNYSLIwdX/Ih93Qf3lIcR+ofE=;
 b=lBZ3vjlfosNKoyEmQHAg4WFVZQE4OYnW61cHy2fBCnMU2wvai4fNgeFi+Y+OjMvMyL
 unFN5dsirqSUMs2JIfNmUFTJ3vjUH+M8njAxrvH1UxT81x4MJK4ZEPmf8FQTDfX8jSLk
 sGArC0l4k7edIRjrPID9/BjIE7kaYe/QxF4HhfjLodsa3Lm0/nqYLKbXPmb20B/XrIIG
 qwlx9rXmEHqsjTqP9l3vbEj623yMfHp76Y5MtIKACy3w0xzTjpYUFjy/tdnZwbE5Bolx
 dgN+TlCK55UwfGkGSGmhl0WyBTce6JFyokVHslIeOJRPndLj4AWPa8UFv6SFcOooVtiT
 RvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977810; x=1779582610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HYsxgOkKZmN/D6H7dyuNYSLIwdX/Ih93Qf3lIcR+ofE=;
 b=Z+h0w9MZ9vu1HcmL3dr7wo3xutc3FaopJRmaefuQn1ycpZO4VofzDh1g7/FrrqYLzo
 97OvjEYIheA2hyTa0+eSH0AaGyTwYMXBfDnqT2qAcZgnPzu6uWZsv+W5zTPwCnhT1RLV
 6bWqV0bT7Sf7uY6IWfXewIRMSYaVzDDJRFRiQXphcqdtG2t3CCHuTLldeq/nMnLkhZ2r
 nT7ddqRdQLszHeiWJLZEHyHxD8isvcfvH7Buy9vYyTadpaSKVEtsOyiKmvOORFwQ7hTI
 JuZ4vBxj2fu6ypQ0qdiicgK/r4WGTj5PDUWtUChBerzwpQGZyJBl3+jAW4v6i3E5nR0G
 Gg0w==
X-Gm-Message-State: AOJu0YwF1dwzAhDEM2sT/0WAnemVt7jjwmBbl5LfUVOT3AoboLBwfe3S
 nFnSv+qBetnam5IHXOVwNf1HmoRftGzzf+O1DiFr0awfOZ5AdyPuz/5GOIGq3Xznf3Og6pi13PT
 fTINs
X-Gm-Gg: Acq92OG3BCuCDkfLH8VV1Cyv3stH4323ux4AC2JLVoK15xfdNXZUd4p9L/af1gc4HiY
 tVBP//Naaz6whgnqNrB0PZVkIj2aVfrazNF5w4Qini7by3F04n8iwOqHzeZHz5jbbG3SEl2IbLW
 gWY5up/auCTZfNKMwX0oOMWuFP/alQtb23XDK1c518ejDsqBXLRkIKo+BKhz7XRUxeaQ1oQtrX8
 zE3v/tbOoGbHdzhD52yC5h6CIlSbr0TgCrsdvUf8R0ILSwPTko4mZeGf2BfAOGQ2/wCz8TmO+wY
 zkUaR7y6RJaoiNpU2A2/A2ohY/HsyNDrYyMkPJHQhF4SrkrDrFinvMv+tLTEMT6g28KOTZZHzsh
 pzlaXEXVPARYy0WBbOT7g12xEB2V/9vGe4iO4JjTVSHOtMTF3US8zQvZL4CFg6edj64LtjMCbuI
 0VUYDb+YJWKYVXIFiWVI6fOPdmWSLX4g1CgEolORU=
X-Received: by 2002:a05:6a00:2394:b0:82f:74dc:5f48 with SMTP id
 d2e1a72fcca58-83f33c5488bmr9867314b3a.2.1778977809933; 
 Sat, 16 May 2026 17:30:09 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 07/63] target/arm: Update SCR bits for Arm ARM M.a.a
Date: Sat, 16 May 2026 17:29:06 -0700
Message-ID: <20260517003002.321430-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 15a13b9292..0a11dd9002 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1820,6 +1820,17 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_AIEN              (1ULL << 46)
 #define SCR_GPF               (1ULL << 48)
 #define SCR_MECEN             (1ULL << 49)
+#define SCR_ENFPM             (1ULL << 50)
+#define SCR_TMEA              (1ULL << 51)
+#define SCR_TWERR             (1ULL << 52)
+#define SCR_PFAREN            (1ULL << 53)
+#define SCR_SRMASKEN          (1ULL << 54)
+#define SCR_ENIDCP128         (1ULL << 55)
+#define SCR_DSE               (1ULL << 57)
+#define SCR_ENDSE             (1ULL << 58)
+#define SCR_FGTEN2            (1ULL << 59)
+#define SCR_HDBSSEN           (1ULL << 60)
+#define SCR_HACEBSEN          (1ULL << 61)
 #define SCR_NSE               (1ULL << 62)
 
 /* GCSCR_ELx fields */
-- 
2.43.0


