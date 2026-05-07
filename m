Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C3ECD37A7
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:46:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OJ-0000Dy-31; Thu, 07 May 2026 19:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OG-0000BP-RY
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:24 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OE-000109-Oa
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:24 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7de44ed7a11so1211221a34.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197461; x=1778802261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHaqfL3jimyccNFpxwTItrJ53CxfHkBqEkZT8Php2Dg=;
 b=Qb8laVCvTYG/Bh/JdQ8R0fLdpiLSmxB5cupyXvzF8dhkLNunfpgrXDleaVvbnIJWiY
 CL6MlWnZWU2cgDkuJy11+/Xmuimn3qNLXVcoGeVTJhG5uAsNt7Ivvit8XguoQESxYuoQ
 zWwCSqkV90DH6ORXq0M5uKiDEFHOIe/7Vc8Lw5ZbtDEElb2ITcB2qpkGNp8VcfHq+vYK
 I058zzZW//2aLHiY3fHxR2Yq23tkKjw3chMx7RgwjaglVow1b5JpQpWvbYtv3x+36dJ8
 PVqya97uq/J6vCAQ9p4AUPTP+NCtGzUjwfmeYpy+LpUG0XsoTR1b0y9vdaZtsnyuyu2y
 cyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197461; x=1778802261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DHaqfL3jimyccNFpxwTItrJ53CxfHkBqEkZT8Php2Dg=;
 b=g9HIVjBZ36SCKNLTmy48oZGqgJdonLlQ+nK8INkxNnFi+Bm1vyisFAFdOapry8fVjp
 Fx+Rt6hDj48VIX34UjCRGLreaUfuU5/M/bDNE+QkLi0YUOjq+yU3n0jqYLNNCv7UfSIt
 2isZ/sZd4bleV96FXg5aUwIPt7CE5nlVpOVbZOSGKISUpAI5nuoI1wS7rkbXVcyhS7aX
 xEUm00Bz+tgSQPO6tADwpI6MqPCBOOa/7XGgHtV7DHnnCSKil+THhe4F5JMxOJ0ekQ8Y
 wTocboJABU+gc1QYqJxlurYrJzDr1bDgc6FAIXW9YA+ExRUfVabjJ16o1qhuiJ/jeaU9
 Uwgw==
X-Gm-Message-State: AOJu0YyFC0G5ohQxckH0RzJ1nKCJPZEpFaCz+JOWZeP5h9ljaoQx5Kuj
 LTZ5/0dRVj56To+5LzyJ8Z5/s/u664d4TrN4yeTOO37Q9i0AtPZsaxYt02KcvMjAOGc=
X-Gm-Gg: AeBDiessQPm7GUIBBSUzUOy8TKvIMRaWeaC4CVeqUEQpunfOM+ll/KR484SBmKwThi6
 DaKy4XyDA1adQgmkXQRMo3hmLxGvAmAy+C14rsoyLF9IkKi6/bixLmfpxSBz11Eo34QMqYelK5Z
 CYSdt2HWRuYju3Of+VppJrFSKIhuVtCYUk5Ucp8IAlcZyhE/extHXPck1vw8zSr4rIZWccD5Fe6
 74IfHHln9Op9fHtYfZg7/N0/OUhgcDcJb2bDM1mlo68OCEfl4CSv1NLyJOrfcyug/0/FoyINtD2
 hoGu4W23Rn6ZNqLWsX+ovMf9ZQDokOv5zYmV/o7/D4o8jE2XnmaxIvmBKMeR4ZdHnpuTKtDYqja
 aIu8TCYuedw4bMJgd8TzfIERrbP3Z6J9vqOIDOTkxHzCb1nyd/ZZR7I9UpjyN4wdE3dUpe4xSPN
 hiQuk2sfANw9USR5Jctyi10wLJaoLVN3nz4sXzCKJnROBFsA==
X-Received: by 2002:a05:6830:210f:b0:7dc:c926:4f87 with SMTP id
 46e09a7af769-7e3666cef1amr439558a34.16.1778197461427; 
 Thu, 07 May 2026 16:44:21 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 06/60] target/arm: Update SCR bits for Arm ARM M.a.a
Date: Thu,  7 May 2026 18:43:19 -0500
Message-ID: <20260507234413.643512-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0b9755533b..aeba70e6fc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1795,6 +1795,17 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
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


