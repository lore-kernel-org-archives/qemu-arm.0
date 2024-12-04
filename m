Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp503803njb;
        Wed, 4 Dec 2024 12:56:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHx8NdVHKfrX2DwsicWUGpcePF3NUflBYhjH/x2+5uhOYOtRabQTI7iZUSNOKG+XfFzCs8H2dx3HWL1A==@linaro.org
X-Google-Smtp-Source: AGHT+IEa/EA6h/t72wypnIbmw+hCVR7EtWMAjbuvkEMwvcesWZsM6vilC59a7yOo3CTlksZUMFjK
X-Received: by 2002:a05:622a:64d:b0:461:2536:f226 with SMTP id d75a77b69052e-4672796a5b8mr15818261cf.12.1733345785400;
        Wed, 04 Dec 2024 12:56:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733345785; cv=none;
        d=google.com; s=arc-20240605;
        b=NVwU2l9bTptO1dEP+EFFre1gM2gd7VQEjAMGbxfB1IgbL+J1wlhXY4M66JxTTurpv/
         JOk64bY5yw+K3VpLDWoMuK03rOielFNpIb9y3YbDYnfAYklLAzIbidEMnMBKutnHmE+S
         G3vYyDTOYVvY4gZ4Yuh85Vn4ZPMhzZzQ3nUnBDI/jV/0CeqFKGFXb5adOnethHdXGKGl
         Qauw/AKAILAXurzL6ut2CEhxbdP9VYx6xxs1rWh1mTblnnB8MwB7NH56XtQ0Gamswhp5
         c/UH/OOhiHnrvEgJyjIgSMlj6wfz1xbb4QeuWEARWGjNojkFP1hwlVDP36aKaQY/oQ6m
         nuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4dgzrMh++g/oTounPtmoGDAI8IhHPJPYGgHVhlbL82U=;
        fh=AOz4PCoY8FqTuiMy3i1jptISI/Y2ya1j9LUyz9UDi1k=;
        b=G2vj9HH0am8OzUMcjHy5wtBlml9ASA+SDjIOHjKzPFy9mopbTrjqtsqhbRqlQnt9OL
         5gtqVFILHTUrEqnD99/+/A92M+j5fE20SOylzriq6xadXs1H2TxisUihu3/yoOlJVnI3
         +Oz2ARQCW2z/4Jx7y7VOt7ikXQ5Ie3rXc4Yf36+wVDCuA8s3Ckc/ZdkXgDJRndlspk6i
         +mbvjzLr02BhsSqherJrQJbBOW4uydQTvse4RXxpzZpCmLqHQsBqCdhJwdpUL41N+pIK
         sqB0DjTzqyLv74pGp8pr4mst6LE1P2I2MbGau9gie6jGE4Mcdul6mGQjZLUt00epaMKM
         QFCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VqztozFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c425bac8si196784851cf.634.2024.12.04.12.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:56:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VqztozFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIwPu-0008K8-CU; Wed, 04 Dec 2024 15:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIwPs-0008Jv-Io
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:56:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIwPr-0006Q1-1M
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:56:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-434a852bb6eso2057515e9.3
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733345769; x=1733950569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4dgzrMh++g/oTounPtmoGDAI8IhHPJPYGgHVhlbL82U=;
 b=VqztozFrRBiyfaZRLN6CCfuQIDTD2iUO23fmPMLh75N/lwdGkM2CL1ezOmZwFjVt4Z
 bNukhs6vsJ+OKdZcKjeniH//ZKtJJLORHPhlivQibQM3c1hct+ACikoVVAEz3KdNaADY
 xw3QN95DZsoryD02HR2oLjczbaMPQm1uoc7mTN9fsa+kncA1TMSJVuibp70BA3V6e09q
 MrUrwfEF6J+De5MDCkadHB8N6fzXGSFofg7tmbFCOX57KgOCkrJ0/279CI7gEWJlHRkq
 bWaUht1p75LEbcnxh64SfcZrzIEiU+bUhC4ohSxyaBaozPT9bC97JtD/gc3b0rWMoAgf
 STvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733345769; x=1733950569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4dgzrMh++g/oTounPtmoGDAI8IhHPJPYGgHVhlbL82U=;
 b=WNR/Zts9BmvBLMHF5cedoXoMPPsSOpwEKX7KWxHDofWyUbMhFcluI6RiyeVM7BJHwu
 cvsOOke3GYqd48U6kBuMIXSz+pa9ZmdMz3E4LtdoQRBCI2NgCVjI088i0iXKdWS7blKy
 r5YWlKH6skkXgg77uCNYCSPfprFidhZF5YPyNjKuH//6TypWMJlJnZqYe7N3ra/Jei9A
 hOuVUIuYErvHhnpTbshpcCn0lOuQtYt0xnonanxlZspCwaUHseuRsbublkEJMwpF2w4f
 JzZbfWTYS3et7YRepJ+Fvi+pDhfGXk5OihAvnto8gmJJ8rKqLwcUUP/W4fvtGIjURKiy
 43vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpVcGcRrL7qmxTy6F1COMkH1sJoVu+r2g+QFT436ATER66UYoGj6jSbgORlXXjJBcUwFww74nHvg==@nongnu.org
X-Gm-Message-State: AOJu0Yx+sO64J9ukkkH/zMbACS78UZ7hxNBV+LFDPSo7EIr/742/p8/W
 A0kIGjA05XSdFi29r5JY7KFYMzOmgul+rwzeNW6hOquznvh4IAHKl7oBxTUwrLs=
X-Gm-Gg: ASbGncvRmhiskJY44RHUxsyipKJK/TF6Q/ZoIK6bDEFWF/AQGlZpwRIiMRw2d8bLCAz
 cM8pIpLcSxmvkHQrsUIST0nw+QCmBInvzlS6b2B5N5xS/z7RkzXKIh3MOxPZjyGlvUmk0ClpSXn
 Syfjqsnajb9fbIB2ahj01a/ko40ZSCjD7RS9SHD+R/wr5O/q5wtCrZXrOssxZs6u7HkJj4ud7vu
 LmLODspXKyjkh+OLUmtqj9gLjYcqbqh+0yNBhNP820IHFvzYRfp3qTayzFG+3s8ettMsDpbBg1H
 WyIwovtL5qr8AK/fKLGn82lkkwYk2w==
X-Received: by 2002:a05:600c:5121:b0:434:a386:6cf with SMTP id
 5b1f17b1804b1-434d09b17c8mr69076335e9.2.1733345769180; 
 Wed, 04 Dec 2024 12:56:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527395csm36081685e9.17.2024.12.04.12.56.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:56:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Subject: [PATCH v2] hw/arm/sbsa-ref: Require at least 2 GiB of RAM when RME
 feature enabled
Date: Wed,  4 Dec 2024 21:56:07 +0100
Message-ID: <20241204205607.62592-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: URNkG2aSBPZo

We are working on adding RME support to SBSA Reference Platform.
When RME is enabled then RMM (Realm Managment Monitor) takes 1072MB of
memory for own use. Which ends with firmware panic on 1GB machine.

Report an error so users directly start with more RAM in this case:

  $ qemu-system-aarch64 -M sbsa-ref -m 1G -cpu max,x-rme=on
  qemu-system-aarch64: sbsa-ref: RME feature requires at least 2GB of RAM

Reported-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Suggested-by: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v1: https://lore.kernel.org/qemu-devel/20241126084928.252067-1-marcin.juszkiewicz@linaro.org/
---
 hw/arm/sbsa-ref.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e3195d54497..66751d0806c 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -51,6 +51,7 @@
 #include "qapi/qmp/qlist.h"
 #include "qom/object.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/cpu-features.h"
 #include "target/arm/gtimer.h"
 
 #define RAMLIMIT_GB 8192
@@ -795,6 +796,12 @@ static void sbsa_ref_init(MachineState *machine)
         object_unref(cpuobj);
     }
 
+    if (cpu_isar_feature(aa64_rme, ARM_CPU(qemu_get_cpu(0)))
+            && machine->ram_size < 2 * GiB) {
+        error_report("sbsa-ref: RME feature requires at least 2GB of RAM");
+        exit(1);
+    }
+
     memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base,
                                 machine->ram);
 
-- 
2.45.2

