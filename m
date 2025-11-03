Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB07CCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrdF-0002JT-EZ; Mon, 03 Nov 2025 05:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrcs-000252-1z
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:17:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrcj-0003cC-Hn
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:17:23 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47114a40161so50047735e9.3
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762165031; x=1762769831; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xopSbsh+IkB5STrBQ4YQZEElngQLIdle4gTE7izg1DA=;
 b=kSJPsZmWQj56SC2/2VLpCEhtR8n91eqPIFQMdhq3B+gC3Ac3HahjeRpB9TG7a+OJA+
 Lt5T783lthKH966TIdruf74hJ7FwEsEUIZ67mYpbiIKbRVM/tHckObzEcd7WfBBHtd1m
 zjx/R0zGqHW7NLMzyYm1m0q8lIq8xz1m2vcVoEWOV64jxJ28loHuif6lrK4ansBPGIEB
 kGcFD0x3DStjYPHun3KYRQUb7/j7CHyTXSIbp2QcwPZBhnw8B5jEfMwl839bDLKYoaCv
 BEu634evxp8RyIMv7Q9vD4rMCSZdFPPhatpZ3Smy9Llk887NLlasEI5pgfEpq9UHucsb
 2JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165031; x=1762769831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xopSbsh+IkB5STrBQ4YQZEElngQLIdle4gTE7izg1DA=;
 b=gMpeKs+V5TUuShhZu7dn2E1CO+X9nFLbEWYAumWNz88MaN5/X5Oq6eO4l7xlHn6uEV
 b3XPX4xXMrLIuTJquVbiHwt/9R7LFU9yxZxwKDgY2wF38X/xvsDSMtokzO3pWv31kNSS
 LMKG3coAW3g/f9JOb80OxVaY7jMfsGG1MOF6218wtv77WU3d1+sRK45FNQKtsAIx2jtu
 qD5w65eF7SpiSykGHu4NPmhV7HGRP6mqyWpPjvSF4+Sv5IlrzjJhuE2s4kf9J/m9CNPB
 GrYbFdDqX3ImMQ3Cacwwz3jXYnMWBov7tvMlyLFILOPH0g6pyn2CTVSP5X+c1a7sgZ/9
 eXIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr0GEBdIMFZ0TzdUvOrlv+Nfu+q89jJG2WpnvP32FPq9xqHgPdl+jnel9+tZoGln0Wc7fEdZr/8Q==@nongnu.org
X-Gm-Message-State: AOJu0YwKLCDJ9EXMvf1eO3LCrYPSZv3y38ahwM2O6p3dBXdmxr92PYsP
 4lK+w9e4/KANewoSmuH8PlJFK32jyu5oT0KMyQKWo6XwaM7hHbbKYZzCwaa5eR5vEtM=
X-Gm-Gg: ASbGnctA+XgJ1PmMAFdDhzojkeVocbstLMs1MysoDAZjqggRwa3z59l8ZlElfYy8uoZ
 yjflU82BR/C/gwBvnKgtHTPf+xleXqYMKym78ke07uG5WKT10QhkPEhKHFM1wUi/QqTBbLZgyeg
 mw9kTLqNszbCLtHS1+2YyN3Ccc5ZWJcF1hlHs+DVW0unPSFno6BO3M19F2d5YIQEkFhIsBNwKg+
 KoZkMkU+WH7QRfQZ/nLj0VKIe2ZhnTUC7BB4ujZUY9hU1t/QXGceqR/f5VdjePqvHKDPA4JO3Y5
 LOCbuMjTBmwza2Gc8YDBV54LOaicOZwBOxjY6NdkqHWZy92mms9woSeNmsuyV2kk8mH5mESXiDE
 WjJ/Y/GcR7FDzDrRK5OsjIeFXi3R9JJthgZjRJchR5+o7HdmtcQA+tITTyqNbGtLQ84UZ5P3SUi
 lsxOHeaXS2gbtu1UyKHXrkGWbYMtN7X19VlRIhah4uw+TXvg1LaBFh/HiLZYs=
X-Google-Smtp-Source: AGHT+IHOAD4JCwIUvnVbMcEs4wnyd0qRniJ9uU4UOqtOI+jZFGq5+Vv1/tFufD9GINwceC9VyETFLg==
X-Received: by 2002:a05:600c:5197:b0:475:d8c8:6894 with SMTP id
 5b1f17b1804b1-477307e4264mr110071845e9.9.1762165031625; 
 Mon, 03 Nov 2025 02:17:11 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c374f84sm145657885e9.0.2025.11.03.02.17.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:17:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 15/23] accel: Introduce AccelOpsClass::cpu_target_realize()
 hook
Date: Mon,  3 Nov 2025 11:10:24 +0100
Message-ID: <20251103101034.59039-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Allow accelerators to set vCPU properties before its realization.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/accel-cpu-ops.h | 1 +
 accel/accel-common.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index 0674764914f..9c07a903ea0 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,6 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
+    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 850c5ab4b8e..eecb2a292af 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -106,6 +106,11 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+    if (acc->ops
+        && acc->ops->cpu_target_realize
+        && !acc->ops->cpu_target_realize(cpu, errp)) {
+        return false;
+    }
 
     return true;
 }
-- 
2.51.0


