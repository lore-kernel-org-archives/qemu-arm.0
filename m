Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1273782lfp;
        Thu, 16 Sep 2021 09:19:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYi39H4kJrV7aJ2qsUmUxaSiCrZQ3emjvCgPhTKBY33b23V6VFgWjHPcsu9fuPKsYkPuYX
X-Received: by 2002:ae9:df07:: with SMTP id t7mr5772966qkf.95.1631809193151;
        Thu, 16 Sep 2021 09:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631809193; cv=none;
        d=google.com; s=arc-20160816;
        b=UXF8+qzYKWYvc60uTqc/XaGNhy0EEQp8kD8Swo3MwWhUDWmWQkfdiImUBKLIO344nr
         BBsBfc4ACL3RXdlLfr/KncGf2xdW32Ahsw8DluIeDuf2VYfvy1yx7U3TpfluyJZA/3mO
         KUH0Qc4vNEuSbmsoj/PNwkiPeDVRzYsMO1MKHMRSa48vkRjgsv5x0Ua+QT6FznWyvWaY
         FYUQ4qtyx5TqF+azgDwue06ZDJBgphRck2DrfwPw3rQjhgyzDaGuZN1WEiCvSBqdRtru
         bxhnhTfV5c8G5Kccrjbzq5cF4DHhCzY5vV/rfp72DWaLskrMVeUi6A+ZuIMyQddEjeKc
         LRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=r0G+FPaDI3cl/9kO42jkYg55z7fEdSYrLfuMRc4fEos=;
        b=hYlMogweJ/xEpzIBLWrAxw1n/MJaDoKcQUxxcz9WLOusVggOS2EivUTnQx3viGedoP
         0jjF/DGo781nsaXsrQvNm5yfwjYtav90/XF28wZd3xfjQJIVC6WkURf6vgc+HGcuFoPT
         GFGICF9RA9IdZjCRGBL4Zn3xpBz7xTlTyrJxVevEDm+96yF/jy6cOf4DsoAW3MrLW96l
         gR+oIDVvECc6fXIJhnBP3UqoDpzNBZ4PkS2XFtgYfOyHbEGMckkq17NPSYzLXvqFgw5d
         77/hlIRymPyjLvzpDeQ/z8ufUTlJgrg4p/XPslcNaHyGm5DT9eibe65+SgeqgO6iiutz
         4Yxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si2045348qtl.61.2021.09.16.09.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQu76-0007EP-K3
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtiH-0002wR-Ge; Thu, 16 Sep 2021 11:54:15 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51322 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtiD-00054W-1f; Thu, 16 Sep 2021 11:54:13 -0400
Received: from localhost.localdomain
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 23A70608068E;
 Thu, 16 Sep 2021 17:54:06 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v12 02/10] hvf: Add execute to dirty log permission bitmap
Date: Thu, 16 Sep 2021 17:53:56 +0200
Message-Id: <20210916155404.86958-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
References: <20210916155404.86958-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: 0lhzS1lFwEtS

Hvf's permission bitmap during and after dirty logging does not include
the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
instruction faults once dirty logging was enabled.

Add the bit to make it work properly.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

