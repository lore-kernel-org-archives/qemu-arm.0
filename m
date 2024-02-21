Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2174884ejb;
        Wed, 21 Feb 2024 13:21:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWO4RE0B9YoVRq5mloleBxsCLTGCNg0agNkDEMIM3Po/GK7JqMllvIPdAja9JPtyFs6PhLoVwNWilNAN8s9QCgdc+IDyerp
X-Google-Smtp-Source: AGHT+IFCidgeMA2J60AvPHTXte91YZUKUrExJhtvCU3WHGfCT8uP6OXduQxbylol7DVGviDOerf7
X-Received: by 2002:a05:622a:1c2:b0:42e:168f:310d with SMTP id t2-20020a05622a01c200b0042e168f310dmr9300089qtw.59.1708550480985;
        Wed, 21 Feb 2024 13:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550480; cv=none;
        d=google.com; s=arc-20160816;
        b=fgH8tN44FUT21EZmZ2NATXU5NJbCsHHot1IBeymLFk05OcCymsN1udJwW4a9jfrLfq
         aH+ETCKhLdPOYi31/OUCyv14jA8REKl/VqP2h8hkpXAjAL8WnzxBLMCW+I4Lhsc8RNrr
         2fmikJkqRbLC2AY3//xUWaUTD309Nli0uswY81Z9bl3soQz4OiY2K/8G47cKCPCgcDzy
         GrcQj0F+1VzxqP7ZrdODlGiGNeMRTyJr2GH2gNm8ZyFQ1xELfnLnq2dfvVF4MIep6Xoi
         tYDTBGHbbdHFt2kG1YOgYijf1RoV/Nw4YOSSh+mX0fkM42xWBgVRRV6llItLY253VI3y
         rS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fAdVq5rUcil5gs4UnSlEI8gmsHzEwxxSsfugjfa7R48=;
        fh=5cA6FzatP5fS6W/Tt18xlG6cH7utM3ZrQCPKoe4O9n0=;
        b=FIAbf9KZJRm6xISyF3wMmU/mLnoxXgWpWkhfb8w7MsaNKTpSnzySnBJxl30ioqT1m+
         pT3ubZxUJuT93u2Tnj7O1rriEI0gQE/juLkV9vydKwz7Jn5vqkS7tUWT3MsUUPCdPhsJ
         +B/uwn4K8/QdrdrLxUpA741JPUiVBA9/Nu3q8yV+LR2lPBkomz7xdzbtiVKk4l2PtoIw
         eLEoYrLZJDMZfhinevKGvn9Scugk/bPhTyjSdmsyUi8XsMszgiC1GlMAEixJhki5O8E/
         GeQ1tCZGPAEhs4LKs20k5btsDFCQN2oX+ED3d4RWBbp9lv0iw8v2a+pqPq9ijok6RP5A
         3QMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGEBAiIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020ac85f0f000000b0042c6bebc514si12608792qta.776.2024.02.21.13.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGEBAiIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcu0B-0004xF-Cm; Wed, 21 Feb 2024 16:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctzX-0001pw-2A
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:18:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctzU-0001Gw-W9
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:18:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41275971886so8640815e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550335; x=1709155135; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fAdVq5rUcil5gs4UnSlEI8gmsHzEwxxSsfugjfa7R48=;
 b=RGEBAiIsuiz5p+2U+o/EKQahdwdWlOmALej/ZeqRHMqk5+MnSIFdKcvPxU7+6xWAEO
 FJwgxNqjZlfF1A398qoYJJlPz9ppb4aj9vi2ODHmWxLo+OpPnLTt45bokIcKENP1h2n1
 JEX7SgfY0lHEhLvtrZH9oxBzf3xqShU65/ftyhSEOJbASsalkDhZjdVrS1FDzj5dBF2o
 TiqDz1Tk+Ev1XyN0dcXrPyfYy36Hfr8tqEaTpTKh9d2cdHYcSWzIvyWbFuOU3f2Oqqwi
 lXlcI8EUV7J3ZtzcFNzyhzzfKUj3qIi5BEDYn4z1YMgslw8gmMChLqwxC9sFSkkrMmCy
 iokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550335; x=1709155135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fAdVq5rUcil5gs4UnSlEI8gmsHzEwxxSsfugjfa7R48=;
 b=Z45oTsdkRh5iPzNTjMOPzzwVGVHXQ/AomUaPFOG4xT2VzN52/ytEYPARBEG4g9JvuG
 d8+TrNJMzrl5zY7mD0ZXkEgFWGCNzu4WFb9lZnDPtPJDrg0baH/orFo6a1A5E7/sHhTS
 3XpMEKYLH6fGkAZt+ceA2LmJZIIDFufoBVmZ/FIMl/y+mCVM821Hkn8jPCfTaxGhJtAO
 s8q/fY14/zWJiUQsdAOLQElAxfeB8oTTASyUdeNEmR57+oLB3noO/L6YmpwqjJyehwbg
 yYO6khIJAv6X4oXV+uiI+oiCOIsZH+eKqrfsZ4Vw3R6655G+CdS//xsIus8lM9WlMFZm
 7NAw==
X-Gm-Message-State: AOJu0YxgNTWOV9NCqnSeSwrRnSjWuTiyk607qZ3xSz8DhewP7AOgFnHq
 iOar6sGoX1JOlMKm10+Cigna4EHCtub2WylR0+HNm21m3Ux62U4CvKYGuY7jmVJgX0AwewdBxTO
 Y/hE=
X-Received: by 2002:a05:600c:46ce:b0:40e:f693:94f6 with SMTP id
 q14-20020a05600c46ce00b0040ef69394f6mr14433886wmo.35.1708550335180; 
 Wed, 21 Feb 2024 13:18:55 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c44c900b00411e3cc0e0asm18723489wmo.44.2024.02.21.13.18.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:18:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 20/25] hw/ide: Move IDE DMA related definitions to a separate
 header ide-dma.h
Date: Wed, 21 Feb 2024 22:16:20 +0100
Message-ID: <20240221211626.48190-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: bZSEpb99FXv8

From: Thomas Huth <thuth@redhat.com>

These definitions are required outside of the hw/ide/ code, too,
so lets's move them from internal.h to a new header called ide-dma.h.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240220085505.30255-4-thuth@redhat.com>
[PMD: Use IDEDMAOps typedef in struct IDEDMA]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ide/ide-dma.h  | 37 +++++++++++++++++++++++++++++++++++++
 include/hw/ide/internal.h | 29 +----------------------------
 2 files changed, 38 insertions(+), 28 deletions(-)
 create mode 100644 include/hw/ide/ide-dma.h

diff --git a/include/hw/ide/ide-dma.h b/include/hw/ide/ide-dma.h
new file mode 100644
index 0000000000..d0b19ac9c5
--- /dev/null
+++ b/include/hw/ide/ide-dma.h
@@ -0,0 +1,37 @@
+#ifndef HW_IDE_DMA_H
+#define HW_IDE_DMA_H
+
+#include "block/aio.h"
+#include "qemu/iov.h"
+
+typedef struct IDEState IDEState;
+typedef struct IDEDMAOps IDEDMAOps;
+typedef struct IDEDMA IDEDMA;
+
+typedef void DMAStartFunc(const IDEDMA *, IDEState *, BlockCompletionFunc *);
+typedef void DMAVoidFunc(const IDEDMA *);
+typedef int DMAIntFunc(const IDEDMA *, bool);
+typedef int32_t DMAInt32Func(const IDEDMA *, int32_t len);
+typedef void DMAu32Func(const IDEDMA *, uint32_t);
+typedef void DMAStopFunc(const IDEDMA *, bool);
+
+struct IDEDMAOps {
+    DMAStartFunc *start_dma;
+    DMAVoidFunc *pio_transfer;
+    DMAInt32Func *prepare_buf;
+    DMAu32Func *commit_buf;
+    DMAIntFunc *rw_buf;
+    DMAVoidFunc *restart;
+    DMAVoidFunc *restart_dma;
+    DMAStopFunc *set_inactive;
+    DMAVoidFunc *cmd_done;
+    DMAVoidFunc *reset;
+};
+
+struct IDEDMA {
+    const IDEDMAOps *ops;
+    QEMUIOVector qiov;
+    BlockAIOCB *aiocb;
+};
+
+#endif
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 3bdcc75597..a3a6702eec 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -11,6 +11,7 @@
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
 #include "exec/ioport.h"
+#include "hw/ide/ide-dma.h"
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
@@ -18,8 +19,6 @@
 
 typedef struct IDEDevice IDEDevice;
 typedef struct IDEState IDEState;
-typedef struct IDEDMA IDEDMA;
-typedef struct IDEDMAOps IDEDMAOps;
 
 #define TYPE_IDE_BUS "IDE"
 OBJECT_DECLARE_SIMPLE_TYPE(IDEBus, IDE_BUS)
@@ -332,13 +331,6 @@ typedef enum { IDE_HD, IDE_CD, IDE_CFATA } IDEDriveKind;
 
 typedef void EndTransferFunc(IDEState *);
 
-typedef void DMAStartFunc(const IDEDMA *, IDEState *, BlockCompletionFunc *);
-typedef void DMAVoidFunc(const IDEDMA *);
-typedef int DMAIntFunc(const IDEDMA *, bool);
-typedef int32_t DMAInt32Func(const IDEDMA *, int32_t len);
-typedef void DMAu32Func(const IDEDMA *, uint32_t);
-typedef void DMAStopFunc(const IDEDMA *, bool);
-
 struct unreported_events {
     bool eject_request;
     bool new_media;
@@ -460,25 +452,6 @@ struct IDEState {
     int ncq_queues;
 };
 
-struct IDEDMAOps {
-    DMAStartFunc *start_dma;
-    DMAVoidFunc *pio_transfer;
-    DMAInt32Func *prepare_buf;
-    DMAu32Func *commit_buf;
-    DMAIntFunc *rw_buf;
-    DMAVoidFunc *restart;
-    DMAVoidFunc *restart_dma;
-    DMAStopFunc *set_inactive;
-    DMAVoidFunc *cmd_done;
-    DMAVoidFunc *reset;
-};
-
-struct IDEDMA {
-    const struct IDEDMAOps *ops;
-    QEMUIOVector qiov;
-    BlockAIOCB *aiocb;
-};
-
 struct IDEBus {
     BusState qbus;
     IDEDevice *master;
-- 
2.41.0

