Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp972665lfc;
        Wed, 26 Aug 2020 11:10:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu4t4z2RDDwde0I8vc5Eq1RRD6+ZuAaLEUQK6LnqCUYB4M/upF9k0URzu8f1f0abyOEgn+
X-Received: by 2002:ab0:108:: with SMTP id 8mr9917215uak.25.1598465426149;
        Wed, 26 Aug 2020 11:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598465426; cv=none;
        d=google.com; s=arc-20160816;
        b=Lx72fd01cB8c1F+yNgQt69TOzWhSt7K+EQeWDv9w01YfMZYS8fXXux/cB7U8Eb7Z/b
         Asfz0VxT8gyPHtEXMqARuEMlhrKtM5N7NfAmJ4PKJIYs+h8FqJT7mpRkKBbjChJG4b74
         U/KGYciGH4uvT+50WsfHjzSrI7CeWLCH2GB2PU12BVJKcjAvO5IsdMoTuBXdmyyW6fO4
         FS5VGkCK3w2q4Ec9amECx5+Zajn1x0nO3ujQKZdNx4zD5S0PFePhmFMFfeBz3zbxupoG
         rRhe/w/LtQrqUVZt/fZnU9c2BthJZxIdmvzGp3m1ULYVLfWbcg+eloTB8hee1vd+peiq
         HrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PiApvT1sTiwwUhR3nn4DVseSe1rzlHNor0YuHEpkx1A=;
        b=YCHq+uXw6raZ9Ra5sc29hsp33wISZ1dgg0vqVZQoZDrfglGoi/Q4G77FQIgXcsIo7d
         TRR1r+UHGPatdTqpuWvwEYqbX9Tl8SkCieZFNTA8CQRqyJ2zie9Oy81QWzQNZuGeNn0p
         G/afKUi/2Uu8bGm5If0DWDAGGaOTyM78gVWUXBMeHHhIKVPYFz6cV0JDCJ4KLMusbkyv
         a+PaiEbqAj567KhjCbhWWe/N3ZhGki0DzENnj29+Fe1dySuOhU5rOYb26R5ePHPn+jKH
         OcCW2ku8mCQVxMcHNAz+pBSIDDC80ZU2ndZOCN3op9gMArZ/ylrgo9vWZ10XDgQq9NhY
         yFIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UsphT6Pc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si565576vsi.45.2020.08.26.11.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 11:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UsphT6Pc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAzsP-0003cg-9i
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 14:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAzsH-0003c2-Jd
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 14:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAzsF-0005HG-3W
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 14:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598465414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PiApvT1sTiwwUhR3nn4DVseSe1rzlHNor0YuHEpkx1A=;
 b=UsphT6Pclaj0ybo7g7RP3k1vFNIp0TUBAKqVj0BOrF3f7jUKHicDwN7PxHbQgPV3q0jnUK
 1o0fDFhTodPVeeyCs3cpUdxDc4Uigb/FvUUVXCA9n1iZrr3UwsdknPVkW7QViTybxFTlAf
 EoCxi5qfHM9Wc2qHf2XWOQsfdi7GjJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-wWgFRKcxNuaxoPWIhxloQQ-1; Wed, 26 Aug 2020 14:10:09 -0400
X-MC-Unique: wWgFRKcxNuaxoPWIhxloQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 659C210ABDDC;
 Wed, 26 Aug 2020 18:10:08 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25C535C1DA;
 Wed, 26 Aug 2020 18:10:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] armsse: Define ARMSSEClass correctly
Date: Wed, 26 Aug 2020 14:10:06 -0400
Message-Id: <20200826181006.4097163-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A/ICD6278pjd

TYPE_ARM_SSE is a TYPE_SYS_BUS_DEVICE subclass, but
ARMSSEClass::parent_class is declared as DeviceClass.

It never caused any problems by pure luck:

We were not setting class_size for TYPE_ARM_SSE, so class_size of
TYPE_SYS_BUS_DEVICE was being used (sizeof(SysBusDeviceClass)).
This made the system allocate enough memory for TYPE_ARM_SSE
devices even though ARMSSEClass was too small for a sysbus
device.

Additionally, the ARMSSEClass::info field ended up at the same
offset as SysBusDeviceClass::explicit_ofw_unit_address.  This
would make sysbus_get_fw_dev_path() crash for the device.
Luckily, sysbus_get_fw_dev_path() never gets called for
TYPE_ARM_SSE devices, because qdev_get_fw_dev_path() is only used
by the boot device code, and TYPE_ARM_SSE devices don't appear at
the fw_boot_order list.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/arm/armsse.h | 2 +-
 hw/arm/armsse.c         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 84080c2299..b10173beab 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -220,7 +220,7 @@ typedef struct ARMSSE {
 typedef struct ARMSSEInfo ARMSSEInfo;
 
 typedef struct ARMSSEClass {
-    DeviceClass parent_class;
+    SysBusDeviceClass parent_class;
     const ARMSSEInfo *info;
 } ARMSSEClass;
 
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index dcbff9bd8f..6381bbd94d 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -1160,6 +1160,7 @@ static const TypeInfo armsse_info = {
     .name = TYPE_ARMSSE,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ARMSSE),
+    .class_size = sizeof(ARMSSEClass),
     .instance_init = armsse_init,
     .abstract = true,
     .interfaces = (InterfaceInfo[]) {
-- 
2.26.2

