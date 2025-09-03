Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCE3CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:09:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkPl-0008Rb-Go; Wed, 03 Sep 2025 06:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkPj-0008Mk-CT
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:27 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkPg-0008Df-K2
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45b83ae1734so29374115e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894102; x=1757498902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcDycBA98iC96XL5mALM8orqALEyJbh9hu7aJGRuIUw=;
 b=coBGjxyijVy/G5ySeyO0UoxxhDrD9tbRH3qg8q9laj/sEAC3/iI3TwmPteyimw5KhA
 4tYh7Y2lhL/4WBtTFIr76FkqZGW5dGoZZkvmpubFmoCIi+iXs9TFko9yCm7urtDycusc
 9Ug1o/TOBZb5jUfmxzeikf1G036vBou6QTM9RVFOQN5XeDtTJYlip2ZCvOYsxjGJ7psO
 dgRHRvoJnlj9YFaC15vulwxedPbxzY5UREGSWsDvymbQ6kiR343E0RWWrPNYqQ+YwYvD
 Rqj07R9DlibnVyavnw2uK+wh7uRnDE8T3VD4fgiJQ2IlFvQjHSq6yBdRUDFB5k6x/0Hx
 PFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894102; x=1757498902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WcDycBA98iC96XL5mALM8orqALEyJbh9hu7aJGRuIUw=;
 b=kzpCxRv8ldnPIOZB65ebuTIpP0MV2tjNLs5ImmTPOd42pkDnk3dm5Biv8PX6j7Xvi1
 LQTS/sNA9Z1QCnz+GngvTD5YWBbjlGbYT2i8TU2yu9cqErJNLz+myejGSoPPRfqIysvp
 JVn+v4WsPKbyk/yCfViXy186k0dBqnaUr+uogvpgdQWjytZhzN4IMQD3mZ0lCV/O493I
 miqajz6Z1cGE0T4XswXd7V/44E2OmomHA+OcvQsCfjqC7i5kXGw3ELQnT4UEbyYi7e9C
 GEAjYYzFKNfzBiETKUehZxgR0CiGZoIw6nbOr5zjp0k7iXndfEn3/dBhTuC05V+H/Vkq
 qpYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXklXVzdE9gr30MriasA2CzjSJbJFxsUEGBSSsDglacJB23hwMH2EXpV/9TE9jjOGiQnJoK0XfgRg==@nongnu.org
X-Gm-Message-State: AOJu0YzKQUzZq+QmPABBf1TaOcqWKrGkXS+PzFJX+Ir2kaPvetabFVQo
 R6soiR2pSJ1c1vtujDRtQgiRCq2drUe3KAPbHnKs/wMHb6vC3ESG61euI7oIZfhfji0=
X-Gm-Gg: ASbGncsQpT9bhMPEglcjQR4ySHQkCRo3XJZB6DyJWoqleSlYUvBMbJg9daStx+PGPNS
 5Ly6Ooqg2PgXdow32SQc2ZLEnPBWx5ejqqHbFEZtWvpOHRGpjHmrLl8TnzWWFd7YioMJylwtA0S
 y7vguic6a9wHhJjvt4Dzh3zremy201VDnCi+HOYBPkd3UdSY4O/JIt0xGVeJadn0nmlUG7XxXiW
 Os07afY70DUH83bG1WwbBezc4MZUCTbXSpk34ditRSgR4bbZEMuJrDNRsDXcQ7kU1hk1si6aAfP
 BSdA0CStn8+YvLEvApGWuODkIpGuiqirMNWcMEfsW9OTMGHdQfYNehd5OxXDUUC1bqmEWobto+N
 WE8ABbns1OLixppfzvQ2AuRL0/FXob4pm+GRqVELXoUWOW4ypuYQTTFEb8Io22cPqQHGG5zIEmW
 xtf9ypHg==
X-Google-Smtp-Source: AGHT+IGhtpuKzPtrGO8wqDqzfI4uI4n77KDn1AGnJ9MQg6iG9Ouc2B1r0+XLR6JZlmcG04oDChLirg==
X-Received: by 2002:a05:600c:1f1a:b0:456:1560:7c5f with SMTP id
 5b1f17b1804b1-45b8554f88fmr108256385e9.14.1756894101036; 
 Wed, 03 Sep 2025 03:08:21 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b87abc740sm168190995e9.7.2025.09.03.03.08.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:08:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 06/24] target/arm/hvf: Mention flush_cpu_state() must run on
 vCPU thread
Date: Wed,  3 Sep 2025 12:06:42 +0200
Message-ID: <20250903100702.16726-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Since flush_cpu_state() calls hvf_arch_put_registers(),
which must run on a vCPU, it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 21002f419f5..58934953c4a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -814,6 +814,7 @@ int hvf_arch_put_registers(CPUState *cpu)
     return 0;
 }
 
+/* Must be called by the owning thread */
 static void flush_cpu_state(CPUState *cpu)
 {
     if (cpu->vcpu_dirty) {
-- 
2.51.0


