Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp541853lfg;
        Wed, 10 Mar 2021 05:54:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFgncwtSDnDfnsML5b7gb77qhImXNf17PrHiQr8etU5NcGJy+QsRqb0XYj3ixobZbk7Kbw
X-Received: by 2002:a37:8743:: with SMTP id j64mr2520159qkd.299.1615384470261;
        Wed, 10 Mar 2021 05:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615384470; cv=none;
        d=google.com; s=arc-20160816;
        b=sM+tQgTxuRG8DuERBmrPX5z3h3pmhpv7taNEAzzPYw0aTW8429hHANBolmLkRDR5kV
         koY1FTtWk617eIIugPHwMoyn0zwJ4vd3/zdbvfNz56cGSP/M9QO7KlFqq8EU6E+8ZG5f
         RLhrs/YaVImuGUDJliOgQ6Fa6aFPXayUDA5lNNRsWYDhDyJGJ/RLdsV1n7/7BnpfuJgx
         aqVXNoqPZdm80d0f2NOkTXpz9HqzZ67HgAa3OjdzHd3rxbBKwCzak43jaO1KY9kaB5xT
         uOVnSN5ndveFrel7wUdkTdbFzW30afSCRklaTY9KUUqrfbNZ0SztV5g62rhGyM7IonUY
         KTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=whWKpVu8xA+DzrGadbo1O+7eDzqdpgVKg8TpF66ONXc=;
        b=r2Ve3w2ujbuaBqJtX6gSakJmnwS8RQ22DyQ/7LUpNWs9MfoCKbIbHJ9hvcPwrtpLaP
         jDnL0Rf29cuPM06UMhdUV7R3U3C9uKJToyqzGy7TJ3HFo0k4jJwX3Dv7PlFxiN2eH/2D
         x8jsPJv97UmsTnbC3dMhk9+D7Grt+FPMf6PCQ+Yq0mK46yHtdjphNOSjP5AYlz2lfwEX
         t3BFFt/4FzkDZDPm1Mv+svLoiOQu4gndsUWOArsP8cDaMWbAd1L859qg7/KJQJAVLPBu
         /svRt4hgC1SZYPx/1yjABUQwK4qUo3fEcuMEel9/EDx+tqlveN+r3lPk1qy0N8iYqYcy
         EYqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EkH0cw4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si564251qtn.35.2021.03.10.05.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 05:54:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EkH0cw4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJzID-0002ao-Ib
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 08:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJzGN-0001Is-Eo
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 08:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJzGL-00044q-T5
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 08:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615384353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=whWKpVu8xA+DzrGadbo1O+7eDzqdpgVKg8TpF66ONXc=;
 b=EkH0cw4dKqV6eO/ZEjxBcOIed/oDmIl5sEtgWpPveVovG6LfIrNDCCvJT8MTrn9vwmxmJE
 K6vjCNNtVJ2Qd5NVFOKqw3Y/VLEmpwp5GZkuTUsJvLSSIuj5+iwb3tQqTUKoyFY9R/xIQx
 tKjg5CXqMJunH7kV1+Ei/RAB3R83VeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-abI9GVubNPKLIklaFFgguA-1; Wed, 10 Mar 2021 08:52:31 -0500
X-MC-Unique: abI9GVubNPKLIklaFFgguA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5399A57;
 Wed, 10 Mar 2021 13:52:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4762F60C13;
 Wed, 10 Mar 2021 13:52:25 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] accel: kvm: Fix kvm_type invocation
Date: Wed, 10 Mar 2021 14:52:17 +0100
Message-Id: <20210310135218.255205-2-drjones@redhat.com>
In-Reply-To: <20210310135218.255205-1-drjones@redhat.com>
References: <20210310135218.255205-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, maz@kernel.org, eric.auger@redhat.com,
 peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CkNnhcXe9xeb

Prior to commit f2ce39b4f067 a MachineClass kvm_type method
only needed to be registered to ensure it would be executed.
With commit f2ce39b4f067 a kvm-type machine property must also
be specified. hw/arm/virt relies on the kvm_type method to pass
its selected IPA limit to KVM, but this is not exposed as a
machine property. Restore the previous functionality of invoking
kvm_type when it's present.

Fixes: f2ce39b4f067 ("vl: make qemu_get_machine_opts static")
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 accel/kvm/kvm-all.c | 2 ++
 include/hw/boards.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f88a52393fe0..37b0a1861e72 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2068,6 +2068,8 @@ static int kvm_init(MachineState *ms)
                                                             "kvm-type",
                                                             &error_abort);
         type = mc->kvm_type(ms, kvm_type);
+    } else if (mc->kvm_type) {
+        type = mc->kvm_type(ms, NULL);
     }
 
     do {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a46dfe5d1a6a..327949967609 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -128,6 +128,7 @@ typedef struct {
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities.
+ *    kvm-type may be NULL if it is not needed.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @smp_parse:
-- 
2.26.2

