Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp395048lfp;
        Wed, 15 Sep 2021 11:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJVwHzQvMwOcLN40w9etbV2ZzGxI4S+qH/paxS/AOFjWN4M3m7dYc7i7qIA1oG/+qXS7eB
X-Received: by 2002:a05:6102:3a0c:: with SMTP id b12mr1246062vsu.4.1631729890796;
        Wed, 15 Sep 2021 11:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631729890; cv=none;
        d=google.com; s=arc-20160816;
        b=DnJpUOPcwjnzV+BmxWUf3BRaSS+Z6IrprrMdOlQgsJaFu3CuGXnRuFBAzgquPbNyN2
         x7wrFAym+bU+ngyNXHLBm4pFVucDXsllx+gnQRw6csUnrUquPzpfBEdPFINj0mLjefaK
         n9ZG56OUXaRS7dcMIW0aNNKU4o5Ge/JI1jOdpPbQN2lXLt0CWjFeiMEi9Oitjstnid9Z
         BjxNqJK+e8JxJAlIKJexjQdiCvmOdCV+uTSPr02UtF2IOIfwxOWtuownq0tpKzpghLSf
         24hj0kb63Bs9PtuhKWnoeSl1233QabfGZNQu1MzF2zWTFyQEhVFnKzGok9DdOmjqIQuq
         68Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+t1CGjgp3QfVsz3N2zyix9fewEwtrnT7VsaZyCx1kBY=;
        b=cxPWtUVvbIfZpxyBMibhRmIjhAa+Z53tSFghM6QPf/1qHMinJhtcWJ3Who8iiDLA6Z
         xQSztexvVkzFFk97kopQNu8LscUHkoy0+GRHEdftCp0zw5yqMxVS725jxodljkkTyKWV
         qphIVulQu6qfdi+FC9a4/ieFa6WcGOanTDIBfBCrTWgisN7+kyScJY3QCxmPGpAdxDZA
         d0AYJVlgbQZhMQWU6ZwfErRiq1q+duyOqqHix8QNOzVECaLIMpztrl+dqY2WpXhcun/K
         fBCdRA2W5hbhgFl1X6hep3Oo60ENpkcQFVqezR6f2DMQcVYZlMJ8gsqGxpubLRrzkDGu
         pPag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si109847uax.130.2021.09.15.11.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 11:18:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQZU2-0006lf-3C
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 14:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQZN2-0006P8-N7; Wed, 15 Sep 2021 14:10:56 -0400
Received: from mail.csgraf.de ([85.25.223.15]:50672 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQZN1-0003OJ-4q; Wed, 15 Sep 2021 14:10:56 -0400
Received: from localhost.localdomain
 (dynamic-095-117-089-091.95.117.pool.telefonica.de [95.117.89.91])
 by csgraf.de (Postfix) with ESMTPSA id 59DD160805FF;
 Wed, 15 Sep 2021 20:10:52 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v11 02/10] hvf: Add execute to dirty log permission bitmap
Date: Wed, 15 Sep 2021 20:10:41 +0200
Message-Id: <20210915181049.27597-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210915181049.27597-1-agraf@csgraf.de>
References: <20210915181049.27597-1-agraf@csgraf.de>
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
X-TUID: qolh5nZuKi4J

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

