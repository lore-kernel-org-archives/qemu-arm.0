Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp353289lfo;
        Thu, 28 Jan 2021 08:14:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC4ZhB7nYOiwAKzUsECNmfqSwKd3vwkCdYP/7Bt/sYGOGWPg/5WS/cQlun0kDBiAT/Qlsh
X-Received: by 2002:a25:be13:: with SMTP id h19mr3506765ybk.53.1611850491327;
        Thu, 28 Jan 2021 08:14:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611850491; cv=none;
        d=google.com; s=arc-20160816;
        b=D27bSB6UmEJ9roQntixCJ+X7zH3MqpUf9L5I4keEXE4FnpZHVPnzpnCJW7pu1R1HPt
         3Kwb035y1ixwLIZEamLvq1zBe8iCvVbAoH3TOzrQ62sT6EFYLgAcjLxSSs5/m1AmbdSb
         B3YHAMhHf26KLUeFBwrHlaDe2Vh5+ZlWeNldEAesf8DtnYYrOI1Prt+J4O8irevA5X74
         JVHlkHHc+gABLlxeRxD0TeItYGsl6phUr2W5lpo9+TjdL2i6oXHDYYxSmb+2QcHoJxqC
         +/WqMPdHb8hP9v5TcRGqKNXGhjtU4Ww6GZ0hAKw9zcA3El/+0IhM5X8rVpLDtmqZrvfk
         nhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Vohs2+KlSVFNeHtYycpizObEwEjoJ1/fOO/41o5aITY=;
        b=GwU8UFzMs8F0U2KoyZtfEr58dLhgOASn8uYNdxIh3/udM7ZkgwgGv4dFdVR5fwfyKS
         VXHtX1x4dWG/8La74vl03Uw0Nhw+SCH1SbljbNYOekqUe6UUT0p7SfYrs3NTmF1GU44m
         fz+AF0suYBUk7Gp6oe5X8FsDCn94CsuRVrtoqSHLr+bJmQ0unkUL9bsBIlckXIPfG3pG
         LZQiUV9wAAupbm+hOrrQIpLlXgWALUy9uZegZ4oAl/5XBGxUrcr279yAOML6ZXO1+44I
         vjkIuQuJiazQvf0JeuNAvO8yKNf0Gm4r5wTvzNmigT8H3F3ZLQnjKWXdPl45AulPqMqg
         0gJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SYZGCtq2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si5765860ybe.95.2021.01.28.08.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 08:14:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SYZGCtq2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l59wY-0007Qn-MQ
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 11:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l59wE-0007Op-Vd
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 11:14:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l59wA-00017c-3j
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 11:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611850464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vohs2+KlSVFNeHtYycpizObEwEjoJ1/fOO/41o5aITY=;
 b=SYZGCtq2zkw8U8w7vL/i/Zs51M2bEdN8PvVfyUsE6wTCeIqd5DV2bz7YW9w9/eUX7sNB9Z
 wKAHw2lITEPLCRjy5K8klPMR70HQuoIO+/jk+Dl7qoDygloPkY6V8UyJ9XZy4DdEnfASAF
 woonTEbVuLjUTKWW2XXcRot+Xa8Y3T4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-C1s-QkaCOqKrmrVeHYgqzg-1; Thu, 28 Jan 2021 11:14:23 -0500
X-MC-Unique: C1s-QkaCOqKrmrVeHYgqzg-1
Received: by mail-ej1-f71.google.com with SMTP id k3so2393927ejr.16
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 08:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vohs2+KlSVFNeHtYycpizObEwEjoJ1/fOO/41o5aITY=;
 b=LEPZ76xOB6jbsn0KaGl1IBm+ktMQ/RCObyQiG5Msncxi88qJd7XMfbG3j+jA/0P/nf
 g0Fx2QTP3NWTuRjHPRRwkBbG2FjUgyA35/IhnN7CwqQ5+DU9XX5w5M4A8WaTLWH2r1NK
 SK3kfYQmjtjsK33KGUH6M+oZjWNaIGrZMLzCJIQjE/YkB+vNISo+N7Wb3HSMzpiDBTcg
 d1KUfFYDQHfsdzx4yVCBt9sw4YYWXH8dJR1L9LhBa/HHOO19WcbOckZSzX2ScjneOvzc
 ykmL0Z96UjZ8Y8tp98CNHw7hhtgPfsPz1CaPUquaiRtFannemZHjg1wcD4uEdDfckQd/
 xo9g==
X-Gm-Message-State: AOAM5312qAhhWfDTHNSyy46xP6IatM+ySjzF5Cn2DTasBcKwXuhRpiG1
 aQgfivaql0lVj0Vy0XlcJcAJn1ezvjMg1Xpn46A3sYIg3Efab2knSZ7b3GjOuHEAEm33YQSzyU3
 hhLBm49fbLqjx
X-Received: by 2002:a17:907:9801:: with SMTP id
 ji1mr105096ejc.420.1611850460860; 
 Thu, 28 Jan 2021 08:14:20 -0800 (PST)
X-Received: by 2002:a17:907:9801:: with SMTP id
 ji1mr105069ejc.420.1611850460550; 
 Thu, 28 Jan 2021 08:14:20 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id lz27sm2464220ejb.50.2021.01.28.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:14:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
Date: Thu, 28 Jan 2021 17:14:17 +0100
Message-Id: <20210128161417.3726358-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e3ulPVNb+bgG

Alexander reported an issue in gic_get_current_cpu() using the
fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
doing:

  $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=qtest -qtest stdio
  [I 1611849440.651452] OPENED
  [R +0.242498] readb 0xf03ff000
  hw/intc/arm_gic.c:63:29: runtime error: member access within null pointer of type 'CPUState' (aka 'struct CPUState')
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_gic.c:63:29 in
  AddressSanitizer:DEADLYSIGNAL
  =================================================================
  ==3719691==ERROR: AddressSanitizer: SEGV on unknown address 0x0000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
  ==3719691==The signal is caused by a READ memory access.
      #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
      #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
      #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
      #3 0x56187adc573b in memory_region_read_with_attrs_accessor softmmu/memory.c:464:9
      #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:552:18
      #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory.c:1426:16
      #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.c:1449:9
      #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:2822:23
      #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
      #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2875:18
      #10 0x56187aa88633 in address_space_read include/exec/memory.h:2489:18
      #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:13
      #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
      #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5

current_cpu is NULL because QTest accelerator does not use CPU.

Fix by skipping the check and returning the first CPU index when
QTest accelerator is used, similarly to commit c781a2cc423
("hw/i386/vmport: Allow QTest use without crashing").

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index af41e2fb448..c33b1c8c4bc 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "sysemu/kvm.h"
+#include "sysemu/qtest.h"
 
 /* #define DEBUG_GIC */
 
@@ -57,7 +58,7 @@ static const uint8_t gic_id_gicv2[] = {
 
 static inline int gic_get_current_cpu(GICState *s)
 {
-    if (s->num_cpu > 1) {
+    if (!qtest_enabled() && s->num_cpu > 1) {
         return current_cpu->cpu_index;
     }
     return 0;
-- 
2.26.2

