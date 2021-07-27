Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp4168695lfc;
        Tue, 27 Jul 2021 16:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMdt00H4jOeBO5T5sPcI7ZrgpWha8HDrKZlVFXm3xspj5mEIddg+q59LS6l3Y/n3/c8VsO
X-Received: by 2002:a05:6e02:ecd:: with SMTP id i13mr19536746ilk.182.1627429987732;
        Tue, 27 Jul 2021 16:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627429987; cv=none;
        d=google.com; s=arc-20160816;
        b=r+Kdbfi+MQagZtoMjhXYuQZD9OkPbolcjFPKLal68dp9GoyChYHePC904O3b46bpDl
         RQ6FMhLftk+LqBkcZF4Z9FZKNnszmr0fgWW/DTszStGULCVgMk+Saqq9peocbOiE2Wey
         bixJeMEwdyfcs04FgIb+PpdKsIKUZ55h72auXHpATeZVouDMgobdQ8ziugrwKP7tQMoy
         xBZ8BhN1kIadNlv2WUOB4JzFhQTYRmX2U6AiT1nTD00HZgNVCiguB+HKXPQYVaGvdcsj
         i4IGG6sXqaqzhF6/BRKFZW2mGmn1WQdEFJ0u/jFHllYhMOl7i/Pw6YIDeOi3A856bMLT
         aTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from;
        bh=vw8NgPXChClATKPbp7IoNu6djc6GIqsc38pYPb7AHBk=;
        b=kAzd2DugAtuLT7effqDaM4nbsHi6UyZ7T4FQjw8/CBcclULDmroJ0cts/w2u7FEY7I
         Wdu6+1yPlLlGfgZDlAyQ0F1tJrVpiD9/zpetius09fMBjtIV0fBGiPGZla0Cj5cO0JO1
         LxWFbwuOtlx3LQTE1lwJ1fzVjAWibMuNALs8UwjPKezetGO3QwLS38Ml2yDQM2DdHo6T
         fht+LkvcA2w6Hqe4I6LopfvSGc7qU/7hX8SCJ/791IXL3KFKlMivXsuvrMIhIQP2raws
         zoao4MrHOb/4uO5GYRCAHh7FkdbJtAjWa+fVKDGhdO2gEyVaYUBSyNLFK5yma65EFuje
         +WMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id a9si5223530ilr.103.2021.07.27.16.53.07;
        Tue, 27 Jul 2021 16:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232837AbhG0XxH (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 27 Jul 2021 19:53:07 -0400
Received: from h2.fbrelay.privateemail.com ([131.153.2.43]:48920 "EHLO
        h2.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232786AbhG0XxG (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 27 Jul 2021 19:53:06 -0400
Received: from MTA-07-3.privateemail.com (mta-07-1.privateemail.com [198.54.122.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 9BCA5800AA
        for <kvm@vger.kernel.org>; Tue, 27 Jul 2021 19:53:05 -0400 (EDT)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
        by mta-07.privateemail.com (Postfix) with ESMTP id 3EC15180022F;
        Tue, 27 Jul 2021 19:53:04 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.235])
        by mta-07.privateemail.com (Postfix) with ESMTPA id 75B38180021B;
        Tue, 27 Jul 2021 19:53:03 -0400 (EDT)
From:   Hamza Mahfooz <someguy@effective-light.com>
To:     qemu-devel@nongnu.org
Cc:     Hamza Mahfooz <someguy@effective-light.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org
Subject: [PATCH] target/arm: kvm: use RCU_READ_LOCK_GUARD() in kvm_arch_fixup_msi_route()
Date:   Tue, 27 Jul 2021 19:52:01 -0400
Message-Id: <20210727235201.11491-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: vqH6+vB46cbT

As per commit 5626f8c6d468 ("rcu: Add automatically released rcu_read_lock
variants"), RCU_READ_LOCK_GUARD() should be used instead of
rcu_read_{un}lock().

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 target/arm/kvm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..5d55de1a49 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -998,7 +998,6 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     hwaddr xlat, len, doorbell_gpa;
     MemoryRegionSection mrs;
     MemoryRegion *mr;
-    int ret = 1;
 
     if (as == &address_space_memory) {
         return 0;
@@ -1006,15 +1005,19 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     /* MSI doorbell address is translated by an IOMMU */
 
-    rcu_read_lock();
+    RCU_READ_LOCK_GUARD();
+
     mr = address_space_translate(as, address, &xlat, &len, true,
                                  MEMTXATTRS_UNSPECIFIED);
+
     if (!mr) {
-        goto unlock;
+        return 1;
     }
+
     mrs = memory_region_find(mr, xlat, 1);
+
     if (!mrs.mr) {
-        goto unlock;
+        return 1;
     }
 
     doorbell_gpa = mrs.offset_within_address_space;
@@ -1025,11 +1028,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
 
-    ret = 0;
-
-unlock:
-    rcu_read_unlock();
-    return ret;
+    return 0;
 }
 
 int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
-- 
2.32.0
