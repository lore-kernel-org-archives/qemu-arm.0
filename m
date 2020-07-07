Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp912869lfm;
        Tue, 7 Jul 2020 05:58:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpjWfEFBunj1JbvmKnE3HlmYrq6jFQexLMXpruf6DFoDMY+DJ+rcDTjC6hkWRLyWsgw/Qh
X-Received: by 2002:a25:aa4b:: with SMTP id s69mr19562502ybi.502.1594126736955;
        Tue, 07 Jul 2020 05:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594126736; cv=none;
        d=google.com; s=arc-20160816;
        b=bYv13GZs03r3wC0oavSDr7pZ0w/OwbxMXgKz4905GS0a5e5C7iAmsQf/EmoGgv7DVd
         M0LSI1RzRR4H8X6VMBM1kAE21DJ2vGjy7z5W7ErCLDjp3btEfN1Evnr0a5iUZkr2AHio
         H7jCwmENLTjqnkcxyJUvAJ/ceoH7CEVDIHak21n7BST0vCaWnl9RSbS1fYxJKYaUiA75
         fX/HtXe3pKTVLa4WCvm8vxqJ9YVhiNnpsmt5KwvIJ4R5s5no/hq0CIgQRr44td++mhVo
         iSNnYVMc0IyQTbtLm4qL6q/2lllOzBMUL9cBkCQHpcTprXVvJkDRm6wf+jU1XjJdRUD/
         Bp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=3qmo/QC1Uo41VjKsHy5G+USrNARFiKstgjsHC8RmoEs=;
        b=uKFaOSsHFar3QAgyTFPNzj1AYWBlOH0SsF322BtYf+1dfAMpCzyyVtQ4gNT4C+ns2d
         kCzCCI5fAyDa1vSjJAU6ZwKtXhSyql+KOAnEppO0qKAuNaTlzcp0sePKi/lA17g39d5p
         uUKJNJqZeQeysKD1/EuL2c8V+FQiuR6UDX7LGAmJf9rHxdOmWbJFlwmyiPXTzWwHpXAz
         NM3ZamMd7MQZTrpaecBA2Xi+YAtZ2dBszj+dud2KGaP53XwZvyqh2WES0NA+/Rf0WiPL
         hub/P5RoelidyYmSAbNkZ3ZIFGa7nFZsTu2ZEbUeu4IHm0z5BX/recZf1K7EAuM+Krqk
         T2Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zp6QHboo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si5870746ybj.312.2020.07.07.05.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 05:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zp6QHboo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsnBY-0006hA-Bk
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 08:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7V-0007uY-Kf
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:54:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29191
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7T-0004pI-Ah
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=3qmo/QC1Uo41VjKsHy5G+USrNARFiKstgjsHC8RmoEs=;
 b=Zp6QHbook+GDE+QYisOZhrj2AR4RtPF+jlB4MDPlWYZmJy5vfMWGzvcdpbu+B0Qx5he7s+
 ap72qMw/7stbThJzubHPvLJcn90b/fpmDB2vqYLWew28jprqSVlFkITwrbEitz5KEnCrFS
 wiTBVhDEkq9rinqlJyz9M3bSpiSoo8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-YymIm8aEMmOaUC2V4APPfg-1; Tue, 07 Jul 2020 08:54:41 -0400
X-MC-Unique: YymIm8aEMmOaUC2V4APPfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3B78DFFF1;
 Tue,  7 Jul 2020 12:54:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B80361100;
 Tue,  7 Jul 2020 12:54:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 376A631F52; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/20] microvm: make virtio irq base runtime configurable
Date: Tue,  7 Jul 2020 14:53:43 +0200
Message-Id: <20200707125356.32450-8-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 06:04:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: beNjv66vrytb

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
---
 include/hw/i386/microvm.h |  2 +-
 hw/i386/microvm.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index fd34b78e0d2a..03e735723726 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -27,7 +27,6 @@
 
 /* Platform virtio definitions */
 #define VIRTIO_MMIO_BASE      0xfeb00000
-#define VIRTIO_IRQ_BASE       5
 #define VIRTIO_NUM_TRANSPORTS 8
 #define VIRTIO_CMDLINE_MAXLEN 64
 
@@ -57,6 +56,7 @@ typedef struct {
     bool auto_kernel_cmdline;
 
     /* Machine state */
+    uint32_t virtio_irq_base;
     bool kernel_cmdline_fixed;
 } MicrovmMachineState;
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 1300c396947b..ab6ee6c67b1a 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -121,10 +121,11 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     kvmclock_create();
 
+    mms->virtio_irq_base = 5;
     for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
         sysbus_create_simple("virtio-mmio",
                              VIRTIO_MMIO_BASE + i * 512,
-                             x86ms->gsi[VIRTIO_IRQ_BASE + i]);
+                             x86ms->gsi[mms->virtio_irq_base + i]);
     }
 
     /* Optional and legacy devices */
@@ -227,7 +228,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     x86ms->ioapic_as = &address_space_memory;
 }
 
-static gchar *microvm_get_mmio_cmdline(gchar *name)
+static gchar *microvm_get_mmio_cmdline(gchar *name, uint32_t virtio_irq_base)
 {
     gchar *cmdline;
     gchar *separator;
@@ -247,7 +248,7 @@ static gchar *microvm_get_mmio_cmdline(gchar *name)
     ret = g_snprintf(cmdline, VIRTIO_CMDLINE_MAXLEN,
                      " virtio_mmio.device=512@0x%lx:%ld",
                      VIRTIO_MMIO_BASE + index * 512,
-                     VIRTIO_IRQ_BASE + index);
+                     virtio_irq_base + index);
     if (ret < 0 || ret >= VIRTIO_CMDLINE_MAXLEN) {
         g_free(cmdline);
         return NULL;
@@ -259,6 +260,7 @@ static gchar *microvm_get_mmio_cmdline(gchar *name)
 static void microvm_fix_kernel_cmdline(MachineState *machine)
 {
     X86MachineState *x86ms = X86_MACHINE(machine);
+    MicrovmMachineState *mms = MICROVM_MACHINE(machine);
     BusState *bus;
     BusChild *kid;
     char *cmdline;
@@ -282,7 +284,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
             BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
 
             if (!QTAILQ_EMPTY(&mmio_bus->children)) {
-                gchar *mmio_cmdline = microvm_get_mmio_cmdline(mmio_bus->name);
+                gchar *mmio_cmdline = microvm_get_mmio_cmdline
+                    (mmio_bus->name, mms->virtio_irq_base);
                 if (mmio_cmdline) {
                     char *newcmd = g_strjoin(NULL, cmdline, mmio_cmdline, NULL);
                     g_free(mmio_cmdline);
-- 
2.18.4

