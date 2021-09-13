Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3607230lfb;
        Mon, 13 Sep 2021 05:11:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm3ni8hvFI4xRquE14d6Sd1RrMyt3kYRMbm0w9ugXmXbkzm3Wan4hWNEXonaRk3add71u1
X-Received: by 2002:a1f:23d0:: with SMTP id j199mr4083657vkj.21.1631535073319;
        Mon, 13 Sep 2021 05:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631535073; cv=none;
        d=google.com; s=arc-20160816;
        b=cRR+cPrmO1m+zg3kJgIPH/u1Y0G6VCf8mxogXNv6dM2XwNsvBbQPEAbBdrDf4NtFn4
         iJHkR8tKDDsV/ttSQJgeBOLd1QqcDqP6yhTfqvk79JrDMdi0k/yoKARzSd+6CaPnFjHf
         hy6azWHq8TfmUWJYlxjCDIkQBEoAXpZHZl6cGHPdZvw/WNl0tZsf4IWGDC0y5CiYzDHW
         MpSTRo8rJNAQPxeGReOkzJ2T9PilV5bbzEw8fCr6hnHGQCWvba4iFGYiZP7o05SzRUr7
         X/ECwfpOmBewsONYbKC2miQupubybMZUQjEnlMUflDov2YUQqXs+2LfRxO9DYRGBYEq6
         L8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+t1CGjgp3QfVsz3N2zyix9fewEwtrnT7VsaZyCx1kBY=;
        b=vPejabp8/oNs/1xQDfVH1vMXNIKXCbh2D5kqsDSuvXGOYmD1Vrl4lGMFqxN+GNw5rD
         z/nOu8miqcVTu3RcnV4MKSnlusKoGkRvyJOcShx9+3LG3+SEpW09Du6ku0QGBexVFrQI
         QKKpS2DzCbyr8fJcnbNeEdYcD6ejLrl8hOGKm9aryEd1rIPTmqk7Lrm1oCUhjyPver+I
         UMMkFaFhhrCDEKMXdffn9BQQJe+yvyKYYg9oOIHRvKSSlgRacodrsMG86x8FXBFIcu1+
         IMEKF5r3FlEEtN+BAzSkxgS4ekxOrxaDEjde9CZQ5wD5+5BLPYwMNtwIz08iBY50BDG8
         z8xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si294951vsg.43.2021.09.13.05.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 05:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPkno-0006J3-L2
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 08:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPklY-0002PO-BE; Mon, 13 Sep 2021 08:08:52 -0400
Received: from mail.csgraf.de ([85.25.223.15]:44032 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPklT-0004iP-AB; Mon, 13 Sep 2021 08:08:52 -0400
Received: from localhost.localdomain
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 910B16080594;
 Mon, 13 Sep 2021 14:08:44 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v10 02/10] hvf: Add execute to dirty log permission bitmap
Date: Mon, 13 Sep 2021 14:08:34 +0200
Message-Id: <20210913120842.62116-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210913120842.62116-1-agraf@csgraf.de>
References: <20210913120842.62116-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Y4EwuMfxcwx

Hvf's permission bitmap during and after dirty logging does not include
the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
instruction faults once dirty logging was enabled.

Add the bit to make it work properly.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d1691be989..71cc2fa70f 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -239,12 +239,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
     if (on) {
         slot->flags |= HVF_SLOT_LOG;
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ);
+                      HV_MEMORY_READ | HV_MEMORY_EXEC);
     /* stop tracking region*/
     } else {
         slot->flags &= ~HVF_SLOT_LOG;
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ | HV_MEMORY_WRITE);
+                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
     }
 }
 
-- 
2.30.1 (Apple Git-130)

