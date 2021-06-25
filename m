Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1346321lfg;
        Fri, 25 Jun 2021 02:51:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz63RYTgHmzMJEeEYrB8+cVolLFxklX3pJe1nWHGgWn02bYpBTLRiTQgUSUgYwfZsVexKvZ
X-Received: by 2002:ac8:6791:: with SMTP id b17mr8886909qtp.118.1624614669211;
        Fri, 25 Jun 2021 02:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624614669; cv=none;
        d=google.com; s=arc-20160816;
        b=0ObqeXAncL6ZULPKXSZSutmDvvBReoydOigwgz7CJoO4WfbT4xt9r//8agyISgqASa
         6uF0Tb1V7B6f5OEz2IDLKDdA/abfjLV2beLs/gTU6kH4898RfguYcGOLHDLvbvPJlOc/
         xULYQExY8cUjzLePOZvyLG9z5O+o6SkkpxjniTqDH2FfQORI7jiF6CSKCFHIT30Z3e5O
         OFcRTy/mFqBjLM0TMIyup6V/TfNQ0gDjY8LEfAKp/cXt7ZYPrCjQGKbTKwNoGUknbwjQ
         qZazzpwFTU7L96GSJMasbKZmCasGgBu3NsJ2CarO2Yi15CC4GU4kgUE5tEweGK/nYn6c
         scFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w4ifF/najuF76LRWVsVWOLdU0QbOqm9xDPI8kEMS4dQ=;
        b=Cr/Z9WMEcEQwIkrLTDzB981QKWGs2Lff+IIuessT9zpnFvHsZZVBZSbpOti/QKIQN9
         wWhZEEW/IBjKhLvExniYBJ5/mA1FL5sd2i3g+0TuFrnD+hGYtxcRv3UwRPK97r4+xPTM
         sBw33uwIKF3/gXGMPrKlsYaI6c61zgKCRQKIYuiQxIMSeI9NuDUznP2/j+ATOISVv7of
         iIwgi9MxakT/cl9xk4pO+EqyYPiv54Muv1sliDr1jM/Iwfk517+DNVPWnnXNyjMNp51R
         ein4fCsCGK+H1yCpgpI4bQ1HYVpx1V07H9PYdtzQUmRM9ebWYkxCZN8Kv+AjAweJE+09
         jlLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TR1RZPRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si4741135qtj.210.2021.06.25.02.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 02:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TR1RZPRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwiUO-0004lt-Jo
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 05:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0J-0004CR-Of
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 05:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0G-0007RL-RK
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 05:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4ifF/najuF76LRWVsVWOLdU0QbOqm9xDPI8kEMS4dQ=;
 b=TR1RZPRKnOX4cyGQACRA/CcwazHwYImL4sIkDrr3HD0Yk8lHWwPZl3MG4YOJn0vjs0FoGP
 rXEnjz8MZhTZJK6Sc6+7XBLDTGrLOG4bYB5rXd1GvHrozUozVqaDppX/aYQ4ecGkhS8zhE
 gyH5kKuBjfdwtnXxncx8zN3e4tiTWQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-Bm7uLvUcPlSSRTHoa7779Q-1; Fri, 25 Jun 2021 05:19:58 -0400
X-MC-Unique: Bm7uLvUcPlSSRTHoa7779Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED2C802C89;
 Fri, 25 Jun 2021 09:19:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E458660CCC;
 Fri, 25 Jun 2021 09:19:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 48/53] acpi: arm/virt: build_spcr: fix invalid cast
Date: Fri, 25 Jun 2021 05:18:13 -0400
Message-Id: <20210625091818.1047980-50-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZDysx00Wxlj9

implicit cast to structure uint8_t member didn't raise error when
assigning value from incorrect enum, but when using build_append_gas()
(next patch) it will error out with (clang):
  implicit conversion from enumeration type 'AmlRegionSpace'
  to different enumeration type 'AmlAddressSpace'
fix cast error by using correct AML_AS_SYSTEM_MEMORY enum

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b88ea4b70a..a07540affb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -361,7 +361,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     spcr->interface_type = 0x3;    /* ARM PL011 UART */
 
-    spcr->base_address.space_id = AML_SYSTEM_MEMORY;
+    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
     spcr->base_address.bit_width = 8;
     spcr->base_address.bit_offset = 0;
     spcr->base_address.access_width = 1;
-- 
2.27.0

