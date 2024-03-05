Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp29448ejb;
        Tue, 5 Mar 2024 10:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAgL098DfNtXeCIBr/WwS35KcuYy9e2SpKdaZBIgsXHFhS7NBcevchvI3+qqi+47qThLTgqVoEsg9f4jXAdBe4z76YKHcm
X-Google-Smtp-Source: AGHT+IE6q8Pfam420Rc06ODtTPdWOY6Ja8lnM87Uvz0zmYBhmzQT5xoBkfjSGXWAY1MC9yHwWdQx
X-Received: by 2002:a05:6358:712:b0:17b:5a95:9902 with SMTP id e18-20020a056358071200b0017b5a959902mr2936956rwj.2.1709662141460;
        Tue, 05 Mar 2024 10:09:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709662141; cv=none;
        d=google.com; s=arc-20160816;
        b=02oNVUwJQNvuysWdmh41nsdpMSX05PujqCFtIfsF6ZxNIC37xAG0HS5qNEIzuO36/P
         FjJ0NS7OABBFBmzrTZMWmW8zoKEi6Tb51DYjwDSEgVECwnXnrClRJpkSBMiTOX84FdCB
         4o/Yw6xyMM+S1cR9a946KU3Fu9wCtmEx6hVFoaNfnNigURqEnylr7GK3YW83Gxq+F5FR
         I04PxOUIIJTyBSj2btyTX+0la5OfmWZulq44XxwM8wBisjneexw9GjnFEUPv5vFQuBXE
         LQws8rLmqubF/WZ7Ved94oHn+ur1ZE6lCtbafP7Q8c4qtUmRDBsXqiWnTBKN+3suwCww
         27dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uaYMvUYAW68FZKxiZnuqrn5CwWP/VqklI1W2luIlxrA=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=Ww/d0tEUGptHoe5YlJ4wFGcexfurfC4QTt5Aym1OmbqjXwLAEXeNuCmVdH81QdjEP2
         mGN8o2n8r6WkbYAmnAdIUZBHB5sGUuRxYTneTXTlt5JLmxn6I1DU2Cqp/MXZuH4k2NQ7
         mxZ3FTXIS2qcfA/1MdSZHSGVPJWnrzAF+uRW9AbTyNqCGpwedcOLxgjyJfNLNBwhVmmj
         nFGkRn5GqVKh4naZ4DqqwBSCbZqwhqaIpVCxDB17KqSTg7d0rJxZJNnD5kfiwXyveqpt
         SJyFAm2fj4EfhSx0uFKhpR7skx3Ewius3B4PBBQqhDyu8OED1y8fRmR3w15SW4utqmSj
         Wrzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PxF/CGqP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs2-20020a056214226200b00690491cea01si12343208qvb.222.2024.03.05.10.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 10:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PxF/CGqP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhZD9-0002D6-0G; Tue, 05 Mar 2024 13:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZD7-00029x-7m
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 13:08:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZD5-0000AU-IX
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 13:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709662094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaYMvUYAW68FZKxiZnuqrn5CwWP/VqklI1W2luIlxrA=;
 b=PxF/CGqP1e1SAPUumQme/ajLdE7abWObV3rZDJ1MPhljQEIwz7l98iUGiT2RtSBT+i3FSM
 CNu+rLVikcVCo1S1jR5OwNZsJOt+eLjLWeLvljYP4mzTBXFOITNb/G0YJHU1Qy5e1cNWHb
 PoMDlha4hteYu9hDa2t1y7FSfY40Od8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-96-LPZp8DnaNmmeoLsodz_5MA-1; Tue,
 05 Mar 2024 13:08:11 -0500
X-MC-Unique: LPZp8DnaNmmeoLsodz_5MA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D775838000A2;
 Tue,  5 Mar 2024 18:08:10 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EF7AC041F0;
 Tue,  5 Mar 2024 18:08:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v6 8/9] hw/arm/virt: Set virtio-iommu aw-bits default value to
 48
Date: Tue,  5 Mar 2024 19:06:26 +0100
Message-ID: <20240305180734.48515-9-eric.auger@redhat.com>
In-Reply-To: <20240305180734.48515-1-eric.auger@redhat.com>
References: <20240305180734.48515-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UeaV8uR+HI3s

On ARM we set 48b as a default (matching SMMUv3 SMMU_IDR5.VAX == 0).

hw_compat_8_2 is used to handle the compatibility for machine types
before 9.0 (default was 64 bits).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0af1943697..dcfb25369b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -85,11 +85,28 @@
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
 
+GlobalProperty arm_virt_compat[] = {
+    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
+};
+const size_t arm_virt_compat_len = G_N_ELEMENTS(arm_virt_compat);
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
2.41.0

