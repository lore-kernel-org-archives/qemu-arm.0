Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4620327njc;
        Mon, 26 May 2025 23:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9mWHK16RXVP+fFpA/8pu8VsiiuxmeLYQV/YdcQsvUOvD+8vqv9TqLvFAjRsHTExyyAyL0Wagb1wjq4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHPXyBSlHW8Mqlmk9Omh/ge2WR9PNQ5UemTlIkApAwq89a1N/RTctDYadEh5Anhk/ENfA6I
X-Received: by 2002:a05:6214:5197:b0:6fa:aaf1:7abb with SMTP id 6a1803df08f44-6faaaf17d48mr88363216d6.40.1748327291529;
        Mon, 26 May 2025 23:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748327291; cv=none;
        d=google.com; s=arc-20240605;
        b=R6giotUIKYuSD03TRX/jigPYMM0Pa5YG9HhaDnRoONeD2dlCOUYKkLF9EEwzdgbRvy
         g2J7NUD9xdAsP7piouivZGVWl/QijwG9K9i6WYMmdUbmyVqEuNrZdOAgEl9bB0xmWbHb
         aK7PQ7NdlCAN98+KfNsY0W3w8ijC3nti3HAXxwZ+ufh2Y95c19lHng/rifEG+wv4hb38
         JQG4QXWjayD5ENYwFoeeLFsHSZKU9GzUYB/YK2xzbnnoZ8hlVUFRRmw9tCCd2NgJMxVt
         szSwzQ2h+xnj8rS4CMmljVrdMcRbXXSlRg+QVBdtSOC6J2Gz8YXlENU2yu/OYGgX0QD5
         pa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7biXynXJooGp+5MWmEyJRwOvi5dscqnql4xqKIvELt4=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=TifP6VLNMYb61k9sC8DtPDkKsY5EAqo+rdMid8GjvZX8KEbNmm+VMoP8LZOwS+Ik9C
         RfR9h6RjXxigQfPnitXoAeKXqclc9lraNLLTR/dR1cjuDgvn1zLc0PsUpSJfnyAyPsVD
         gNrH/FhJ4d3oawtJcNZ9bpyXVph4yLwUCbLc4BteGqL6UA5Ncux9j2UuOUfzj64HptBL
         9aNKDs7D26F2rvpo5osSkUSv4d1nEPCfbI7U91JDOHsbQNXyZRNRSrEvoZrI6UZoZof5
         yB/e+qNnIrZP17NJfiokAwdsJAGcXnapnAomhLgUidwk6ko2TBt5qBGBvqgigjiPKJtZ
         izsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SsfprkJH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faa5b5c487si52648566d6.6.2025.05.26.23.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 23:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SsfprkJH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uJnlI-0008V5-6p; Tue, 27 May 2025 02:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnl9-0008U1-GB
 for qemu-devel@nongnu.org; Tue, 27 May 2025 02:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnl5-0005m9-O0
 for qemu-devel@nongnu.org; Tue, 27 May 2025 02:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748327151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7biXynXJooGp+5MWmEyJRwOvi5dscqnql4xqKIvELt4=;
 b=SsfprkJHSxokm32j86K9TjaieMKKzc0hOxf24++EYyGJo4vgQFJ5d2QnmNO7eLRCAKbkwR
 7T+BEWU0L72N8FhaIBLXXLO+a+9xty+1ZYJSLv0f1V94IMiVAkSJtxihnxbeR+1Z3T9bLm
 L0RDtxIyq2RqZXHeXRYDs79mleo1gtU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-3Ug3cMD1MDu5Q9fBBjFkCA-1; Tue,
 27 May 2025 02:25:48 -0400
X-MC-Unique: 3Ug3cMD1MDu5Q9fBBjFkCA-1
X-Mimecast-MFC-AGG-ID: 3Ug3cMD1MDu5Q9fBBjFkCA_1748327146
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 415C91800447; Tue, 27 May 2025 06:25:46 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BCD07195608D; Tue, 27 May 2025 06:25:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [PATCH v5 1/5] linux-headers: Update against kvm/next
Date: Tue, 27 May 2025 08:24:33 +0200
Message-ID: <20250527062534.1186004-2-eric.auger@redhat.com>
In-Reply-To: <20250527062534.1186004-1-eric.auger@redhat.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zJ60LgNjTWDV

This is a linux header update against kvm/next (e9f17038d814)

especially targeted to get nested virt enablement.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/standard-headers/linux/virtio_pci.h | 1 +
 linux-headers/asm-arm64/kvm.h               | 9 +++++----
 linux-headers/linux/kvm.h                   | 3 +++
 linux-headers/linux/vhost.h                 | 4 ++--
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/standard-headers/linux/virtio_pci.h b/include/standard-headers/linux/virtio_pci.h
index 91fec6f502..09e964e6ee 100644
--- a/include/standard-headers/linux/virtio_pci.h
+++ b/include/standard-headers/linux/virtio_pci.h
@@ -246,6 +246,7 @@ struct virtio_pci_cfg_cap {
 #define VIRTIO_ADMIN_CMD_LIST_USE	0x1
 
 /* Admin command group type. */
+#define VIRTIO_ADMIN_GROUP_TYPE_SELF	0x0
 #define VIRTIO_ADMIN_GROUP_TYPE_SRIOV	0x1
 
 /* Transitional device admin command. */
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 4e6aff08df..f4d9baafa1 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -419,10 +419,11 @@ enum {
 
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
-#define   KVM_ARM_VCPU_PMU_V3_IRQ	0
-#define   KVM_ARM_VCPU_PMU_V3_INIT	1
-#define   KVM_ARM_VCPU_PMU_V3_FILTER	2
-#define   KVM_ARM_VCPU_PMU_V3_SET_PMU	3
+#define   KVM_ARM_VCPU_PMU_V3_IRQ		0
+#define   KVM_ARM_VCPU_PMU_V3_INIT		1
+#define   KVM_ARM_VCPU_PMU_V3_FILTER		2
+#define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
+#define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
 #define KVM_ARM_VCPU_TIMER_CTRL		1
 #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 99cc82a275..e50334fc52 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -923,6 +923,9 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
+#define KVM_CAP_ARM_EL2 240
+#define KVM_CAP_ARM_EL2_E2H0 241
+#define KVM_CAP_RISCV_MP_STATE_RESET 242
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index b95dd84eef..d4b3e2ae13 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -28,10 +28,10 @@
 
 /* Set current process as the (exclusive) owner of this file descriptor.  This
  * must be called before any other vhost command.  Further calls to
- * VHOST_OWNER_SET fail until VHOST_OWNER_RESET is called. */
+ * VHOST_SET_OWNER fail until VHOST_RESET_OWNER is called. */
 #define VHOST_SET_OWNER _IO(VHOST_VIRTIO, 0x01)
 /* Give up ownership, and reset the device to default values.
- * Allows subsequent call to VHOST_OWNER_SET to succeed. */
+ * Allows subsequent call to VHOST_SET_OWNER to succeed. */
 #define VHOST_RESET_OWNER _IO(VHOST_VIRTIO, 0x02)
 
 /* Set up/modify memory layout */
-- 
2.49.0

