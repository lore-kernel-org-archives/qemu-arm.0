Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1828866lfm;
        Wed, 19 May 2021 13:25:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVVl7KWP2HrldVF2evus9NZb3AlBaFDt44riZ2iTxtikBN7aC6ZqHdC3OnIAg2LaxFInd+
X-Received: by 2002:a6b:d615:: with SMTP id w21mr1460921ioa.74.1621455930101;
        Wed, 19 May 2021 13:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621455930; cv=none;
        d=google.com; s=arc-20160816;
        b=bgqFdBmc/SPE+BCnPWttua/GgcBmAz8Goqbh717SjOCCkvUslzpEhMugmEdJPI4IKD
         bqhSmrk2p00+GL353oO+JuRVojGTV33cGshikkmwi1ru/K6MHfFDb9+R/YDsJRMINjFd
         o0tpEmsgtsjSFmXY4iQ7vpF39yAP/5LtKq0qsngTnF1+aqWUgIqDtdOHPjEvMfvqFGA1
         q5eFXIx9FZmer9ckdM2xGR9tv7iSbEHrL9BtdWzW5wqdyNcsrzhTeDJn54bJvTIIsXnW
         FhhtriVd1471h9zi6AK5lrWVV0yX6y1AidnHkGGGd0PEdhW1H9b9u9W6aOd9hHuXfr4X
         4ocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=b8xR6b1TLxWZchZF3CnbdIFxuGe4SMi0PceqZeZvdhI=;
        b=qT+O/OHlw46+ZENLA8GNZBm/Bi9bbow2Iw4kF1Z5C5DyjaIfZ/S1UlOmOQ9mFJVgf3
         cyQ8uKOJ6Pi+vfIDqSuCYzVzZMgoU/PIgjAGU8ap8OmNz1ytXQBH+HlTCtlrURLoQAkc
         BOMjm/cp8+10FncqEvSixLK0Aarxuj+0diXwS07NDKvhm5d9/yLCRJm3xE8qnqHGmNHB
         3krxxG9DBzSb2cuhmBOhSjiiZe1BG3naYTAa7vUOdT04U3FWtld7grFtY9gECO5ei9Qg
         ZR//izLiTkuBYFP3lU5pGnADjgQbSyJKvS4vRjepc62/ib6uB5lOdC+CB0l0TaYi0eFp
         +QHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si391049jan.4.2021.05.19.13.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSkz-00005Q-DA
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSj0-0004lX-Pd; Wed, 19 May 2021 16:23:28 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48270 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSil-0003IC-FN; Wed, 19 May 2021 16:23:25 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id DBB67608062F;
 Wed, 19 May 2021 22:22:58 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 06/19] hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
Date: Wed, 19 May 2021 22:22:40 +0200
Message-Id: <20210519202253.76782-7-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210519202253.76782-1-agraf@csgraf.de>
References: <20210519202253.76782-1-agraf@csgraf.de>
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/QDYubDldsj

The ARM version of Hypervisor.framework no longer defines these two
types, so let's just revert to standard ones.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 5bec7b4d6d..7370fcfba0 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -109,7 +109,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     macslot->present = 1;
     macslot->gpa_start = slot->start;
     macslot->size = slot->size;
-    ret = hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->size, flags);
+    ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
     assert_hvf_ok(ret);
     return 0;
 }
@@ -253,12 +253,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
     /* protect region against writes; begin tracking it */
     if (on) {
         slot->flags |= HVF_SLOT_LOG;
-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
+        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ);
     /* stop tracking region*/
     } else {
         slot->flags &= ~HVF_SLOT_LOG;
-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
+        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ | HV_MEMORY_WRITE);
     }
 }
-- 
2.30.1 (Apple Git-130)

