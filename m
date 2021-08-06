Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp654602lff;
        Fri, 6 Aug 2021 14:13:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE0ORDue9oaML1zohlpG6QZXIzuceACX8X1qI5d+K756yevr/Z8jbPC4HrORXy0ajEfSQ/
X-Received: by 2002:a92:511:: with SMTP id q17mr29161ile.210.1628284407458;
        Fri, 06 Aug 2021 14:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628284407; cv=none;
        d=google.com; s=arc-20160816;
        b=V1UK+1wABy+Jk9tUo6VJwexsFMclUAVqCbr6CBFaznIzCbD4lHKziV0ZDFAT/pL7b4
         zgnndl3I//0u6lhRcxHzspuDOCeQ1tLeTMFQNeQErgnaB6ESm7gsOVMCTbQfdchOWRAE
         SaFEwWTV0xE9rnYmv9rWDuR5b5LBkvJE0bAWJTxVRBYkzR16/xMiNMLJC6CasC/SfGO6
         iWhNhvTOSSkHS6Oes/hp+oVn7l/EazCVox+94jCw4ZBwlbGwS4TAX1WGrv2pQjnTaxCm
         0WOwYAuDIAOr9Y0PPfjBwB4YqixGG0BHaXknxF7bQ96QJ6k+oaILqe7Om1u/TLb8upyn
         LRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=u8xKfaOtV5YirFJnawF8BSMsjQ2Cw5AAkSNjpNee/go=;
        b=Fc/lt/2qi57NQ9cwwNwCqW5ZbNgDYUIkfFavW5hmOnKFX+zOgDD2ItrT96z3PWRzrM
         PVC9Dl/zPME7j2/YzHY77aYlsdltujhqBHd5+O51uENwOovNt/0ZcSOp08IzinLyaO3B
         11HJuaBwtZiDMgQbMilUoi4hH485UQvpsKGRh9Juq75duOzfsvPYPOcYry+m3fho3YaT
         CXVcgJtxNrCHciIiknVfabWmfFRxX5vuJsCFm18w+QSGEDqT0ehbCmO+SVGJrlV3gTKP
         NPN3Ng3iN0XzFaK0FCNTmRgT+ozdIsHsJOk71WMu3xe5sJlnCUEW5P0OGZiiveWEb6Vv
         r3cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W19i9PN6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si10824141ilf.126.2021.08.06.14.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 14:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W19i9PN6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mC79i-0001iW-MG
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 17:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC78E-0007SF-Ss
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC78D-0003p8-4G
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8xKfaOtV5YirFJnawF8BSMsjQ2Cw5AAkSNjpNee/go=;
 b=W19i9PN6SVyohrk2mcV7bEOSEBiw335GBUQANeLREasMLgvMo1m2bw751C+ltBJZEayY06
 sIqCT4YPBV7sSC5AMPB1AGoLniPa6r2nCyCqxcOF9c1geHhk1u81sPWCzV6YcrzjLhtJ9i
 Ra2BAc+P/SVUCYO4S0PDP7VL4kRhq2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-KmFyneedNCSGqwvltEhAJA-1; Fri, 06 Aug 2021 17:11:51 -0400
X-MC-Unique: KmFyneedNCSGqwvltEhAJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADA4760C5;
 Fri,  6 Aug 2021 21:11:49 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F70A5C1A3;
 Fri,  6 Aug 2021 21:11:46 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 04/12] [automated] Add struct names to typedefs used
 by QOM types
Date: Fri,  6 Aug 2021 17:11:19 -0400
Message-Id: <20210806211127.646908-5-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Vijai Kumar K <vijai@behindbytes.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R2IDIq/zXqzg

Anonymous structs on QOM typedefs make the code harder to convert
to OBJECT_DEFINE* macros, as the macros expect the struct name to
exist.

Use a codeconverter rule to automatically add names to the
structs used in QOM typedefs.

Generated using:

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=AddNamesToTypedefs $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Vijai Kumar K <vijai@behindbytes.com>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
---
 include/hw/adc/npcm7xx_adc.h            | 2 +-
 include/hw/char/shakti_uart.h           | 2 +-
 include/hw/tricore/tricore_testdevice.h | 2 +-
 chardev/char-parallel.c                 | 4 ++--
 hw/m68k/mcf5206.c                       | 2 +-
 hw/misc/sbsa_ec.c                       | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
index 7d8442107ae..8e5a1897b4b 100644
--- a/include/hw/adc/npcm7xx_adc.h
+++ b/include/hw/adc/npcm7xx_adc.h
@@ -42,7 +42,7 @@
  * @iref: The internal reference voltage, initialized at launch time.
  * @rv: The calibrated output values of 0.5V and 1.5V for the ADC.
  */
-typedef struct {
+typedef struct NPCM7xxADCState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
index 526c408233f..25f7cbcaa55 100644
--- a/include/hw/char/shakti_uart.h
+++ b/include/hw/char/shakti_uart.h
@@ -51,7 +51,7 @@
 #define SHAKTI_UART(obj) \
     OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART)
 
-typedef struct {
+typedef struct ShaktiUartState {
     /* <private> */
     SysBusDevice parent_obj;
 
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index 2c56c51bcb8..e93c883872d 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -26,7 +26,7 @@
 #define TRICORE_TESTDEVICE(obj) \
     OBJECT_CHECK(TriCoreTestDeviceState, (obj), TYPE_TRICORE_TESTDEVICE)
 
-typedef struct {
+typedef struct TriCoreTestDeviceState {
     /* <private> */
     SysBusDevice parent_obj;
 
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index 05e7efbd6ca..acf9fb8afa0 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -49,7 +49,7 @@
 
 #if defined(__linux__)
 
-typedef struct {
+typedef struct ParallelChardev {
     Chardev parent;
     int fd;
     int mode;
@@ -177,7 +177,7 @@ static void qemu_chr_open_pp_fd(Chardev *chr,
 
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
 
-typedef struct {
+typedef struct ParallelChardev {
     Chardev parent;
     int fd;
 } ParallelChardev;
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 6d93d761a5e..72a815dbbd0 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -160,7 +160,7 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
 
 /* System Integration Module.  */
 
-typedef struct {
+typedef struct m5206_mbar_state {
     SysBusDevice parent_obj;
 
     M68kCPU *cpu;
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 83020fe9ac9..9e3c40a23dc 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -16,7 +16,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/runstate.h"
 
-typedef struct {
+typedef struct SECUREECState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
 } SECUREECState;
-- 
2.31.1

