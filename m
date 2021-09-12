Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3181398lfb;
        Sun, 12 Sep 2021 16:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjjExngRbD8m9LdNEcBQL/C9PbcW5wtcQduwuVXjYJlAKwrV+3cJzRPVJVCbB6VCf/B6OD
X-Received: by 2002:a05:6e02:20cd:: with SMTP id 13mr5970005ilq.156.1631488098268;
        Sun, 12 Sep 2021 16:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631488098; cv=none;
        d=google.com; s=arc-20160816;
        b=UgTtfmzqZHRBGlNh7XFSnpsOa8V+q0gNJ+uQb3SoblyO5aC9vncsliBLVl7xfe9Xdh
         2HLbVUbx28PaPdFhG5BoRLXLdzPVoOjXecPrcGvHkigg0nwfRRG5aBOH10JpZP5PjiD3
         xN1qoYKabmbeIceDv+81Rqy9QdKf9BBlAA3owxDvkiohqW2GJU4mL9qM98d0M3SJOTf+
         WbyL9mnHLfSlwqjeBLcAO1ymCKfTTbYsh3W3QxLshiBSZC3JSNrShtoMC53raoftWkYJ
         25DeyIygCrMc7QR8+6YHkJd0du44qXNEx3bs0Svw5sU+0vv1/Eo5MMOkBYtjxVPMTBj/
         n2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+t1CGjgp3QfVsz3N2zyix9fewEwtrnT7VsaZyCx1kBY=;
        b=hV5zwQ7KA2SLPHtl68v37G11mSh305+qQ98t1QLm43GQWrxXJHkERW5r/BXBTfs0tC
         tzNyKajCuGQ2hCgITcybX4WHgcVswKU/7a8smhPIZ/mR3EPBuPBrEjVXYTU+MDV3YGHq
         BzacQyV+yowyBSeTr8Nr3RfUEHCqSaPOPuDH77hab96KiDVF1DILkrTfUKd2VbamZTtB
         APHZeMu+9hWxrTlIgtMX72+KHdGOC7JsHyobR9JUlBw12z7PR6z1V4GpZEQf/ZSe/Ieb
         9p9aGtOLczb3okadGKHmA2Uwl9lbDVNPuF2RuIA/fSiQVrLCH72mIvauq4u8CZ7PrWvT
         ghXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si4992004ilr.109.2021.09.12.16.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 16:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPYa9-0002E9-IC
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 19:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPYZx-0002Bz-7F; Sun, 12 Sep 2021 19:08:05 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43500 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPYZt-0003ES-Va; Sun, 12 Sep 2021 19:08:05 -0400
Received: from localhost.localdomain
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id 9809560805EC;
 Mon, 13 Sep 2021 01:07:59 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v9 02/11] hvf: Add execute to dirty log permission bitmap
Date: Mon, 13 Sep 2021 01:07:48 +0200
Message-Id: <20210912230757.41096-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210912230757.41096-1-agraf@csgraf.de>
References: <20210912230757.41096-1-agraf@csgraf.de>
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
X-TUID: 4Z/zFC0lQY8A

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

