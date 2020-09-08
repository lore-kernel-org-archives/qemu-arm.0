Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp550266lfq;
        Tue, 8 Sep 2020 05:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbagisNqbnJSm4C6+52RnUFDN5Nh8RRUL/mS1VhAvDTSrcUrAhG3g2y+YQ9niptACUgCbB
X-Received: by 2002:a25:3258:: with SMTP id y85mr11188466yby.473.1599567411335;
        Tue, 08 Sep 2020 05:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567411; cv=none;
        d=google.com; s=arc-20160816;
        b=O/6ACNtjKH95SHzTgfWjrhpvaiMVqHoenn4bcxECFNyvJI8JOoEmbgZwIbgre8KxYp
         QzosLVOOkyWersORjHTnxuwV8b74pG4FwTZBKFeY1yyLphBEdcFjF1jjDKuZDV3U7B27
         et/C97oV2kTnus+evDN3EAGOKekGlqkg5ALSXpmQBzsKTpygRx4/s9IRbkf+05uMZQe4
         vh2AUfN4vkFQED29WD865dd/6dYVnriV5TVCftE0G8ZtZNiVi9pygt3Cd4WAGVNiPk3A
         CrhElp3WSLRGXlOM7IlmyGyyNxJFGr9yVXMvZSnFmZKPn8qCxeqdOPsZw8JG45NXPuuq
         NULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=D0CLt/3qbQGa3OLGHSm59bu9R9OdOsddLi5YJZ1paKU=;
        b=oDyMqLio4p20W67DHpG4mUI2jRWIeyChj0R808Syi7csS0VV8tkF+yDO3XKi7VZxZg
         roi9tWxrtQUuyELfYNtsca4iUWieBoDttqckF/V8SvouqhpzoLrdmyNvgG96GF7GvbKZ
         ordcSPOZRKIaYdqN14p+jI/B2UfEKL5/cDeyRwX9yh6xkphVOBt0AMm8ljAR68bnJNVa
         kts3zf/BuhzHGm8k6QmupyKkqYUpgHQ4b0mdr6xeGvZ+Rk0XDfthxIDk5UGFcZXIwGAw
         JBEfbIPJKS97WuNptqC5ithX21C+vjQNnJ7s7kVuSUqNxm/b20wH63ntLRJxpryfZ7/9
         xrmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cSLsTHnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s88si18847213ybi.379.2020.09.08.05.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cSLsTHnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcYM-0000Vx-IQ
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcTI-000189-2l
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38558
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSy-0005fY-RE
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0CLt/3qbQGa3OLGHSm59bu9R9OdOsddLi5YJZ1paKU=;
 b=cSLsTHnO6mDHmTeufh0u54a2xtcKke8PLjGjepRpXOzGL6IMkFg07zyPQw1JA4w1sdJ4hH
 vuQkEvJoNLsorIRmEAd8CgB0eovoqdQ3VKWty7jOCE8oFdNqGDRAeBi0lkVM7JVOOGtCZQ
 j4ovBLhzCBges1opYnGnxMe/qSHkIrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-vFH4WfHFOqO8Gf3_a2MDeQ-1; Tue, 08 Sep 2020 08:11:04 -0400
X-MC-Unique: vFH4WfHFOqO8Gf3_a2MDeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C36802B77;
 Tue,  8 Sep 2020 12:11:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C35605D9E2;
 Tue,  8 Sep 2020 12:11:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BD141204AD; Tue,  8 Sep 2020 14:10:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/21] microvm: make virtio irq base runtime configurable
Date: Tue,  8 Sep 2020 14:10:36 +0200
Message-Id: <20200908121050.1162-8-kraxel@redhat.com>
In-Reply-To: <20200908121050.1162-1-kraxel@redhat.com>
References: <20200908121050.1162-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: z+tB2Z44hY52

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
index b1dc7e49c159..e4501f2cdfbd 100644
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
2.27.0

