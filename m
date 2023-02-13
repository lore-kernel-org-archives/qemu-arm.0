Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4000137ejb;
        Sun, 12 Feb 2023 16:41:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+dsJxSinDIEHnCjAe52FI/fEblukh0985L4vPSkN0Wo1rHaqZUv1etM+H7eF/6xTzpr2tv
X-Received: by 2002:a05:6214:501c:b0:537:ab77:fbd3 with SMTP id jo28-20020a056214501c00b00537ab77fbd3mr44300591qvb.1.1676248909068;
        Sun, 12 Feb 2023 16:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676248909; cv=none;
        d=google.com; s=arc-20160816;
        b=oXLOuft6p8+9s0iC3vRlcfg9KiQXrUbw415JgpC7N4/veS9BZ3XE0/ecB6DybzwRWT
         bupHeCqp9fM0Q8pB07lccSJGkBCQ4sXhhA3Kiv3nKSDC+8CxAjAwucyjdx+X3E8/4Gfi
         Y46KmU26OAxPjK2B7c9xsoS6jHCI617DAlsI73gk9e4kzMAwdKtu8nzExkh4ELBJL128
         vsVhkpvAcKAA9Sqdp0p24z20K/5uzVyMNrr4DitvFxPA9ma5mYQSDlERbjgWZNMyTpJx
         kJaJvXpwkukUK6zJDWWMcr0a6VH/A26jlHqrQmTnrhDPVaPDmbrEc2D88pCubsQj8SNl
         A85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VKpM+6NBturz3mBK8d57bZzYCXZBtlFKRBvyFv5Nw28=;
        b=h5PVv6ibDwlPxhYZ3kZNMG/PpDmQcIG4YsYAUdMIiuUr5OlPBIjG504hjXBPRG/+fL
         U06kIDcnaBiU7lMaEgI8dwMGGR1eVgSDG8a9g7PF2MbpviwmUGHUWuOuE7qLrpQiMt8u
         mO8JQzRBja72OOJX3oxkyvh7Ch7EESbDSb8T7w5swIu9s950K0yXVaGKEII/C8Kurala
         5tL2+KSyab0r8T1nKo6v7xcQr5LOvqR+kHkOJewIrDQm2QbsfT3vFPlzV/dpaV8w/ObX
         Mlc+dZvjiW6CaiEpM/YUKAUn4Va+xmlQmT/r0sdjbkCMYNCG6WliLu3Rv+0Zbg1kivmE
         lz+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AzLHIpKB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a05620a248100b0071f40a59fedsi9468153qkn.653.2023.02.12.16.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 16:41:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AzLHIpKB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRMtR-0000Bc-94; Sun, 12 Feb 2023 19:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMtN-00009E-3N
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMtL-0003Fw-2Z
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676248813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKpM+6NBturz3mBK8d57bZzYCXZBtlFKRBvyFv5Nw28=;
 b=AzLHIpKBPP/1KSQw4ACbSiRdm499zBxCM/QpOzwG7aW6q/7sMcRZ2YalhL4ODZJj/lr9Zk
 c9LNNNyOQzx3Qz2cGeL94jLmQSsVoP4VeCZA4mC27UG3jAdW9VKBBYWLAeOC/WTTppv14+
 Sqp6LBLn5gMMvdqNQjdWQb5+evB+amM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-FE-LEGpsOaulc1EX85IlHw-1; Sun, 12 Feb 2023 19:40:06 -0500
X-MC-Unique: FE-LEGpsOaulc1EX85IlHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD96B3801F4E;
 Mon, 13 Feb 2023 00:40:05 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-114.bne.redhat.com [10.64.54.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22FE24051E44;
 Mon, 13 Feb 2023 00:39:59 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v1 3/6] kvm: Synchronize the backup bitmap in the last stage
Date: Mon, 13 Feb 2023 08:39:22 +0800
Message-Id: <20230213003925.40158-4-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-1-gshan@redhat.com>
References: <20230213003925.40158-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TlBjX7ekDio/

In the last stage of live migration or memory slot removal, the
backup bitmap needs to be synchronized when it has been enabled.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c      | 11 +++++++++++
 include/sysemu/kvm_int.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 01a6a026af..b5e12de522 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1352,6 +1352,10 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                  */
                 if (kvm_state->kvm_dirty_ring_size) {
                     kvm_dirty_ring_reap_locked(kvm_state, NULL);
+                    if (kvm_state->kvm_dirty_ring_with_bitmap) {
+                        kvm_slot_sync_dirty_pages(mem);
+                        kvm_slot_get_dirty_log(kvm_state, mem);
+                    }
                 } else {
                     kvm_slot_get_dirty_log(kvm_state, mem);
                 }
@@ -1573,6 +1577,12 @@ static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
         mem = &kml->slots[i];
         if (mem->memory_size && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
             kvm_slot_sync_dirty_pages(mem);
+
+            if (s->kvm_dirty_ring_with_bitmap && last_stage &&
+                kvm_slot_get_dirty_log(s, mem)) {
+                kvm_slot_sync_dirty_pages(mem);
+            }
+
             /*
              * This is not needed by KVM_GET_DIRTY_LOG because the
              * ioctl will unconditionally overwrite the whole region.
@@ -3701,6 +3711,7 @@ static void kvm_accel_instance_init(Object *obj)
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
     /* KVM dirty ring is by default off */
     s->kvm_dirty_ring_size = 0;
+    s->kvm_dirty_ring_with_bitmap = false;
     s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
     s->notify_window = 0;
 }
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 60b520a13e..fdd5b1bde0 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -115,6 +115,7 @@ struct KVMState
     } *as;
     uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
     uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
+    bool kvm_dirty_ring_with_bitmap;
     struct KVMDirtyRingReaper reaper;
     NotifyVmexitOption notify_vmexit;
     uint32_t notify_window;
-- 
2.23.0

