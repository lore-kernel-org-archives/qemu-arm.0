Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1197633lfp;
        Fri, 24 Sep 2021 06:07:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY4qEqK8y8a1UkCk7MYexCv3p5tjJoDgwkCMRq7xY1DftNovHnQtwqQy3s8XhXbzv5hOt5
X-Received: by 2002:a67:7085:: with SMTP id l127mr9055712vsc.7.1632488869020;
        Fri, 24 Sep 2021 06:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632488869; cv=none;
        d=google.com; s=arc-20160816;
        b=Xf02UUTrj35/jXIkHJqHMnROVB1hPc/kdVC/cQGfoFXo334xmVcQC1iMg/yswgqOG1
         ntIxDhmnbR2urskbJrYwWtEdNmNg+H3/ZuveclVVVQUryx3xqN3FFc0ps+s36M851OaO
         //SiIIu2vc6izsq2rtEs750zCYgJE0Xq9weAbYtnoAEyH6AnJD/XpFoaxQMAgx/9Olja
         giF1Itz67UpwqelrfFdEFbUZNeJe8RlawgW1Yev8DedvHs3RUlb6v3ZAGotiomAzYua7
         6P3yp49cFkeHCaytCcpr85z77VzCB8+VYwEoznZsnoP/J4DGVQopD+gGNzWcHaVmUK8r
         akqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1IoI2xAqQS2KGQUxDmdozyAabRfYuJAoCG0mICKDwT8=;
        b=dt1Cq3HfD8LrNveCCWYTovcZEAW1maLfG0eWk7w7aORLFfl8xIuCIcQ/JYxvBR5GIF
         kDPkFBfCi1AJIb5cAOSNIqaXW1AzNDQW8OusfeUDrwxINxoyHN5bBDI5gxIarZziodUf
         Ta/oIeeRUlyveHt5gd8K349RnVdPAdFiQqjhzJlb9SZt9DS55YXZ/I7f1dT02ucjUiES
         j/7ubWozVFg9+27uzMi+Qw/TdOKYKGuxoJfH869CtRg7n6bK42SHXZM64CLUKa0pmOE0
         5eZ5L3SFCC8bxYkbOK0Dlhkn4oXdsI8XCgDvZ5ZpN1uF8nUy+s2vnL1wglAQX2d54auz
         0ByQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ko66hFoo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si6705886uab.124.2021.09.24.06.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Sep 2021 06:07:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ko66hFoo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTkvc-0000XO-F7
	for alex.bennee@linaro.org; Fri, 24 Sep 2021 09:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkLo-0007gw-NI
 for qemu-arm@nongnu.org; Fri, 24 Sep 2021 08:30:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkLj-0002FS-76
 for qemu-arm@nongnu.org; Fri, 24 Sep 2021 08:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IoI2xAqQS2KGQUxDmdozyAabRfYuJAoCG0mICKDwT8=;
 b=Ko66hFooMCtD1DpYCP3BmTO9Wxf0txDjU87TgFEppmxgQMuoUHGuZTYeOAZq7zV0hFN5RG
 wQOHPMOC1VihiN6olmhecHtVtERKCMdXkTPW5UcD5H4TsKRc+6uP/hDI59lBR9TUr89VYX
 hZCbLKJFZuWo+MSzXN86KEO58KsQQio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-GWDn7lxvMQSpwqX5W3Bn5Q-1; Fri, 24 Sep 2021 08:30:39 -0400
X-MC-Unique: GWDn7lxvMQSpwqX5W3Bn5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 468EF802936;
 Fri, 24 Sep 2021 12:30:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4AFB62465;
 Fri, 24 Sep 2021 12:30:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/35] acpi: arm/virt: build_spcr: fix invalid cast
Date: Fri, 24 Sep 2021 08:27:57 -0400
Message-Id: <20210924122802.1455362-31-imammedo@redhat.com>
In-Reply-To: <20210924122802.1455362-1-imammedo@redhat.com>
References: <20210924122802.1455362-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 mst@redhat.com, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 ani@anisinha.ca
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6L9NjtcYbjg

implicit cast to structure uint8_t member didn't raise error when
assigning value from incorrect enum, but when using build_append_gas()
(next patch) it will error out with (clang):
  implicit conversion from enumeration type 'AmlRegionSpace'
  to different enumeration type 'AmlAddressSpace'
fix cast error by using correct AML_AS_SYSTEM_MEMORY enum

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8c382915a9..7b8706b305 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -465,7 +465,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     spcr->interface_type = 0x3;    /* ARM PL011 UART */
 
-    spcr->base_address.space_id = AML_SYSTEM_MEMORY;
+    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
     spcr->base_address.bit_width = 8;
     spcr->base_address.bit_offset = 0;
     spcr->base_address.access_width = 1;
-- 
2.27.0

