Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3054172ejc;
        Mon, 28 Aug 2023 07:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoq1ut9JwuE5roPn+Rq5WtXrZhi22rAwujb4Fq+m7ZkTuhUk8+52tVjHxaejQFs6e9e0bW
X-Received: by 2002:a05:622a:44c:b0:410:9626:f0bf with SMTP id o12-20020a05622a044c00b004109626f0bfmr25092974qtx.13.1693234591564;
        Mon, 28 Aug 2023 07:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693234591; cv=none;
        d=google.com; s=arc-20160816;
        b=rFXY+mdC0NgRD18DD2bFFaFoAuwzleIn3MiNkyyhCmsyTD9dI0jXuvvFozDURSGrlK
         Y2UpMGriWtokahgpHqPUyvh6PyYSdiuigESEITnKQcUXLHl4GB7rEQNoWpTOPNrMPMIl
         bQHnT41uxydSqzEmENTe5L2o3ToJ6IIQO2GR1Te4fSqdU0bP82UGYT7csloW9dAAwOKz
         AHZlPL+JAbAVCVZ2XJxytErqUh5Kwfsxw+cUatIMi6cxymSFhKnjYtvkrvWsg0lZqDAa
         tT3RvHkfkmwjVi7ntLCL5dV3j/ydB13IR7QmjdlfaxJVQQlEglziF9L5cwd/VPIsUgR3
         h01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L0c9RUkLqeb/dUA6rdk/b7YWrq3qs8i6j4y2xORygss=;
        fh=FxYtB1slzL/yn78+bieLaailXu9MIAo7Kb5vkjusizk=;
        b=ATqpPLD5YlMgc87GBKSeBn8FMGCyPe0eQlRuHJ4cprnKQkFeCM18ZgknE8gcSlhH+S
         WI6uNHgDA9j+8H+fw/ZqKcHgJp04C7w2KV09Gnt4PnfqqG2aoPEgVYdZ52eEeJOtfMOV
         34aXyM1qR5KdbW7sT1TU6VcyYO4p8mCqdT8k6rCUD95OfTIYsQjCp4iQnKOUosAWBjZA
         FArUwcW+upAhEXzicSLuX/PV1pRmunKD1oStgQv+3soE0lt+Bi/MCGYl2aVCYOS7W/fT
         B4xNFFit1KWP4+xMcybVcGtRLUVNsfRfOwu35QVSbKP6bWRShZCia9TmiUHUwPW6KFKr
         xQpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lMCqUxq3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ov15-20020a05620a628f00b0076d743132absi2733047qkn.353.2023.08.28.07.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lMCqUxq3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qadfC-0003Vd-DJ; Mon, 28 Aug 2023 10:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfB-0003Ub-6y
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadf9-0000hg-3c
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fea0640d7aso31472905e9.0
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234577; x=1693839377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0c9RUkLqeb/dUA6rdk/b7YWrq3qs8i6j4y2xORygss=;
 b=lMCqUxq3kCSkpFfLlHaGc43t/H8kjzJrNqZwgE8+i7pZkWKd3kZ6qy0MIKlsaTCpa7
 OZd840XQDIqp+YbIlyMK96SA3+Xs6c1VkYI9QAQOfLhuDkng2U0COkn3itO7AxYGkY4X
 5QeCCX2OKwa08nsl1O2CPfZmYZyqJ9eh3k/p8K1EFfout35o2I09Nh9iuMeQNumMrOrP
 7tyeLSDXjREbmxvF4BioxA5wP18FUatwWiz/Q2rR+12L9XkZYA5RZb3riKR6ahx3gSo+
 P+70K9Sub584uZBhO4dbH8smLwYTtfKGr82TYCsDFCbL/IwKvjNuFMPqEbs3UfpPrmGV
 Vq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234577; x=1693839377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0c9RUkLqeb/dUA6rdk/b7YWrq3qs8i6j4y2xORygss=;
 b=dIakIZ5OAWPTbz2kOwHDttr4V34nHGH9AkQoCgT5eW381nQ2CcYDFMpLrhTFcFddAb
 Rhdi5TrNx9k5X0Voed9SY2FXrKs8Pix961fi41ZB/C5Fh1WmLJ7j/6em6p8cNRMFxHgQ
 aeSDOLqOOKgTnjuEJc/KtDtdjBrew5HPGFD4KtqvWxTDSsmrfDnFfHTkUCn0nCRcoek6
 +tG3foo3aU7LnvNeePNX3JlV9bzcQBWCUm6VEKB6lnSXq8CSXgF0b+uPx0LSRw4ISFcu
 nRVtKOU2KeOH9d1IQWrBNSr/Fgkk19N1ZiL0a+xe7V+JCFZu6niD6ayTfs8tZubZMR8c
 Va/w==
X-Gm-Message-State: AOJu0YwWRtVbwNx42jZC76FlNnRAqMbb8ZQUwbXgTog7ZEBuv5SBfLuM
 JWjT15Kxxpjgq1dIzC6zB9GnDg==
X-Received: by 2002:a7b:c455:0:b0:401:c436:8999 with SMTP id
 l21-20020a7bc455000000b00401c4368999mr3828849wmi.30.1693234577802; 
 Mon, 28 Aug 2023 07:56:17 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a7bc4cc000000b003fed8e12d62sm11070682wmk.27.2023.08.28.07.56.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/8] target/translate: Restrict 'exec/cpu_ldst.h' to user
 emulation
Date: Mon, 28 Aug 2023 16:55:42 +0200
Message-ID: <20230828145545.81165-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jxfc553LjF1F

Only handle_sigsegv_accerr_write(), declared with user
emulation, requires "exec/cpu_ldst.h" (for the abi_ptr
typedef).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/exec-all.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d02517e95f..b2f5cd4c2a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -21,7 +21,7 @@
 #define EXEC_ALL_H
 
 #include "cpu.h"
-#ifdef CONFIG_TCG
+#if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
 #include "exec/translation-block.h"
-- 
2.41.0

