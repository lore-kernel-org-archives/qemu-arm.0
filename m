Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2115629ejc;
        Tue, 12 Mar 2024 15:34:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbvPFfkQmCMT2ndtGqbXWQnGnpPwkBrKgkgiTidN4lROP0JUC6RQIYKNyvDZMLYffTE2LdiIIkuEouwCVvOjmfsxoU+Z0R
X-Google-Smtp-Source: AGHT+IGFo7jDEPQrHydgipgROtnjL21KuZ74k0mdbs0XLeBoTNhqkTqMpkt1/d2k/oegyUzQ2G7a
X-Received: by 2002:a05:620a:123a:b0:788:3a14:fe0b with SMTP id v26-20020a05620a123a00b007883a14fe0bmr3324817qkj.16.1710282846442;
        Tue, 12 Mar 2024 15:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710282846; cv=none;
        d=google.com; s=arc-20160816;
        b=BtwMpIDOaYhv3lUjB6MVGIFarZKJ/eB7lBwgDzsdjmi/oJlF/v4UFPm2hQ90o6G0zt
         0saNkeheD1YY5QjhafVE+KqH+RRbwTgtxwpU3mT3Cl9CBONZWg0mj4b3DbUqwuS+vLRv
         5oi/J50AWDnL2zKPStbMg1ltWww1h9DT283Ho4wS/aj7PZVmzQPM8OnZ0qGckLb7a/TM
         xJBxoEtufsf8G0ftq5tsexl4JRqQwGJKtu4usTkJdbkSu3BOp87VUJUoEyoGJ2zqH86x
         dS3gbizjW0RTS/eI6fQonuHZCRQg7Y6jws568pzm/mcYo7+K4/fo/OX84UO77a29T740
         1tbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=MKkSDazDM8plKzOrprMyap3/frHtZRjZMB1Z0hTsQYk=;
        fh=8uBL2Re56wH98camTkbcq6548/ihvfOtPP7EZ7WKbA0=;
        b=zDt45HmKfBgEMkMA4XN2QvEXYLFduM2nMaC5j3R5PDM6n1bQffV0GW8iYYqGGloltU
         +QFBWBvYDDzhWHDHkWKErW5iRbYMdlv6qeBIL20DZDkDJBNG7MRPSEZhlwDVo1irS597
         IlV89L4cX+rBWrbLYVDKDjt+4LJhN/Eo/1aCHGM2OwEsg5BvcqK/YpDH1s9kuFk2SJnY
         +UcePlCM5xwoQ5H2zI9FrrtJApKks/xKBXsBW00GkUttT3PdPT1cPYwRsWNRDi+a4JI6
         bt2JUUCQhYFRnIUbycvQo3gYjdZDgHhpCT1BjSEsF+7xi3gqxfUPSOqoc5HHQAa65v9/
         E5Rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LU7uPF0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de26-20020a05620a371a00b007881ece7271si9193067qkb.781.2024.03.12.15.34.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 15:34:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LU7uPF0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkAdL-0005p5-GX; Tue, 12 Mar 2024 18:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rkAcV-0002uQ-NG
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 18:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rkAcI-0004d7-L9
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 18:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710282542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MKkSDazDM8plKzOrprMyap3/frHtZRjZMB1Z0hTsQYk=;
 b=LU7uPF0dUcGQ3pT/CsI/CPYNgrsmRmfcmHMbxd/+e6NuCpDZ9VuiK0ehRU0R/oTM8QIuy4
 hWDGPGEaTig4jdmOXRq3aGBbtCdOArydsFDMPK4BCQWRW3FcKWsMjlfJHJcxcbwMefRC4q
 SlPDyz4BIB3hfE0a8yn/bKBNzLAHPKA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-eyjMdxGSOOWU3nx7DEX76w-1; Tue, 12 Mar 2024 18:29:00 -0400
X-MC-Unique: eyjMdxGSOOWU3nx7DEX76w-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2d449d68bc3so18037711fa.3
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 15:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710282538; x=1710887338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKkSDazDM8plKzOrprMyap3/frHtZRjZMB1Z0hTsQYk=;
 b=rwqezJyCoAUlrPIUucxeP/+J6OcfDFX3ng+JmwhnGtXD5+G1kw/IIPvhNYiQTDCsYG
 X4Astq2MZYtdZflLIgeqdRdMaIPs5nPP0K5POVQgxidzfypTS2VcCWt267KZvr8Lm9oO
 IVHrrZRK+WdDldNBCYHnhDGuSEUrslAQoawggLhNFBCfGiEWw5S51mwYkVzDK5ZGBlOq
 tHWhqthfVAopKqA18TE776WxRRkcnY5tv6DyWIYk9vknEQbL/D/VGKJ7pRIKb/Z91d7v
 Nc4y4whEwxtJO3X6rXDfDlWNj8dItWJHgs+iKgFXGDI8vpYFpVI2Q0IbWAqPcIOps1v1
 l5oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaCZtK32sXO9xr2Ai4tvJA8nOmhWRs7in4qPdIEHPGPA4dygFQG8eVWHzImu4Y0+o6e7sVCcihl5hDQoRzVxN4kBKe
X-Gm-Message-State: AOJu0YzRn96HhG8uQ/WaqJVLeUVpfTSybR40YXyrwAO8bzcX9POosDHg
 L79+loORaYgi2wOosbct8WcGNoCitEsokWxafwsVfyXxwL48ArgAbTfOgBbiZMpyYXDEPCcvbra
 oYZ9eY6bQ0Ec5YQT4BHoQZmKUZlptTkuYIVcR4kGsgDXFyDux4oUDOWoVYvEx
X-Received: by 2002:a2e:720b:0:b0:2d4:49d1:38e with SMTP id
 n11-20020a2e720b000000b002d449d1038emr3547941ljc.28.1710282538425; 
 Tue, 12 Mar 2024 15:28:58 -0700 (PDT)
X-Received: by 2002:a2e:720b:0:b0:2d4:49d1:38e with SMTP id
 n11-20020a2e720b000000b002d449d1038emr3547935ljc.28.1710282537949; 
 Tue, 12 Mar 2024 15:28:57 -0700 (PDT)
Received: from redhat.com ([2.52.134.16]) by smtp.gmail.com with ESMTPSA id
 d34-20020a056402402200b005687e7b0cd2sm388946eda.40.2024.03.12.15.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 15:28:57 -0700 (PDT)
Date: Tue, 12 Mar 2024 18:28:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Zhenzhong Duan <Zhenzhong.duan@intel.com>, qemu-arm@nongnu.org
Subject: [PULL 63/68] hw/arm/virt: Set virtio-iommu aw-bits default value to 48
Message-ID: <62d776002c990d5b6fd4a2b6809ab2956c6e1ff0.1710282274.git.mst@redhat.com>
References: <cover.1710282274.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1710282274.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nuxvYZZpfvCo

From: Eric Auger <eric.auger@redhat.com>

On ARM we set 48b as a default (matching SMMUv3 SMMU_IDR5.VAX == 0).

hw_compat_8_2 is used to handle the compatibility for machine types
before 9.0 (default was 64 bits).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <Zhenzhong.duan@intel.com>
Message-Id: <20240307134445.92296-9-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0af1943697..e5cd935232 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -85,11 +85,28 @@
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
 
+static GlobalProperty arm_virt_compat[] = {
+    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
+};
+static const size_t arm_virt_compat_len = G_N_ELEMENTS(arm_virt_compat);
+
+/*
+ * This cannot be called from the virt_machine_class_init() because
+ * TYPE_VIRT_MACHINE is abstract and mc->compat_props g_ptr_array_new()
+ * only is called on virt non abstract class init.
+ */
+static void arm_virt_compat_set(MachineClass *mc)
+{
+    compat_props_add(mc->compat_props, arm_virt_compat,
+                     arm_virt_compat_len);
+}
+
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
                                                     void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
+        arm_virt_compat_set(mc); \
         virt_machine_##major##_##minor##_options(mc); \
         mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
         if (latest) { \
-- 
MST

