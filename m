Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFA8D1D461
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:37:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr6I-0007WH-HA; Thu, 08 Jan 2026 09:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5y-00073a-Ej
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5v-0000jS-AB
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso20128855e9.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882874; x=1768487674; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6tH0CF/GJKELoBmGqjsJGSOS1a50aHiTGJ/qCRa94o=;
 b=HS4Qf1jSb82GjuDAbydiaDt/Eq83vsu8awTfomJ+OQlCi5rZ4LJO5j4enPSPWw1NGe
 LoYslHzbFB8ymK5PDtr4jTT1NtotBfSCKaeKCgscWJCiaBm+ZcngXPW52j9w7+6X0tbA
 OVI+wDDJNxFdsWqhEvkQjv99ew0h4psNfVy6TfuLvIA9Wclst9gNFKMF8P781IXVUqMQ
 9P0VK20EmFroxRNesi4s/3FBteuw+f8db1HkOE9C4q3I5DJvMga2tr2xBINGSFDnJg4s
 Dhlninp/BZwvgo9gqhR5I9tdSbD510fzE091ytZALInU9KXEBuBKDntjibtrBIRQrtvA
 qDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882874; x=1768487674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M6tH0CF/GJKELoBmGqjsJGSOS1a50aHiTGJ/qCRa94o=;
 b=dOrNPUg5LQptN6hHVIOcJDOFN6YqwJ11bcTI5PpaywhJpGsZpnoss/mjPZhfYOqiH6
 SN0R6r7a67ggpZjazIMVVTMiYGuEu6cnSLeF98BsNlavM68IY5b9p4csF74lGg4MTZwj
 W8owEFS6h0zcCJWtIcxKqb371zLdFCtWl/sKIvkdgFtSF24/hgBdxulhFJt217TOLuHq
 lF7G8f7bcOzgPWCkd6dkk69JjjUrbx14GMP5DR0mrxzXxs9Re0PJeQoO+IEdSlbZlLP2
 +U4cnkkiXUqFrkVgIdeJdYHwJC7x3U611fLR8lNpYP7rgFqD17zUQQ/KIE5zoGOL3kWS
 7AUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFwSuXLuip1NtpaQ/6j+2eoGXUFReXUmSKxCJhryNdl2s72MqoUFewJCttZ/kmQmkMfdnN7hodJw==@nongnu.org
X-Gm-Message-State: AOJu0Yzy5ytXx+ZbyUGBwXOpsm0lV7j8OObzUUPSk0A+EKEHYMGJ2TW8
 e7MWmSs/OHlkRPOZtOm6PVKR+XZ9PzYJO1WfZvY0Aemhr2hSA9w3lDXQ/8MT0BpEJAPsRREKYoi
 K44L8
X-Gm-Gg: AY/fxX5YNRxEb38GYCdCspv7hWtpJO6UegXCM5BuO13ZJV3fDpg5XMDupPdCUnSUlLd
 pRE/zMV2Ctro7bsv1CmGTgzO5JuDdW27sceHSTEfxsD34SrvwuJ/Q26w64iTTVIdglZ+y+fyGpE
 R61J3kaP+8tv4Xw44qM0hvibMD2chzr4PQy3x38dIN8NpLFf+5T0iNuM0YeJk6GqhxSQ0L7E02u
 TW3pF7pz/uS+ZnceSSkRcgabvPr91Dye3U9/th0Bo8/PG82KENB7iXpfVFVbDNlJ8LBPhtwhlxY
 Dl5Lyh9a+1IT3YXHYQIkk29LK/KPGqYGr1HSNctH7TzAv7LqoWsH60V90dgXdxvVvJ2tFtzwes4
 4e/BlOZ0cK/GjAhnhcwjdjGcFVWBC4xLE5JGwOqdskuC21A2Qo+V3yawU6wfAbGLk+g0wk8JC6P
 t2k2dEzPOJZQk=
X-Google-Smtp-Source: AGHT+IFQ2b7jHgSZCCtLDyudNjBkpAYBfcgv7i5tpvjUUC07gUibqxAEQZnVr+TfhdHtcSVluMmqnQ==
X-Received: by 2002:a05:600c:1392:b0:477:6d96:b3c8 with SMTP id
 5b1f17b1804b1-47d84b34673mr79074405e9.23.1767882873727; 
 Thu, 08 Jan 2026 06:34:33 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16d2sm17391256f8f.13.2026.01.08.06.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E9D995FADF;
 Thu, 08 Jan 2026 14:34:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 12/12] include/hw: expand cpu_reset function docs
Date: Thu,  8 Jan 2026 14:34:23 +0000
Message-ID: <20260108143423.1378674-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Add a hint to the developer that this should only be called from a
reset chain.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f6f17df9e64..9f938e00492 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -811,6 +811,9 @@ void cpu_list_remove(CPUState *cpu);
 /**
  * cpu_reset:
  * @cpu: The CPU whose state is to be reset.
+ *
+ * You should refrain from calling this during CPU realization and
+ * make sure this is called from the reset logic instead.
  */
 void cpu_reset(CPUState *cpu);
 
-- 
2.47.3


