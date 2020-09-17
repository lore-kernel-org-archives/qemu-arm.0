Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp605456lfq;
        Thu, 17 Sep 2020 06:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3cvCjuGKzqxMMWSL5aMN/e3YtcApAkFdpRoLe4DBvyzXEuQBhSHGATtcKJATCfRqHcCOt
X-Received: by 2002:a25:27c1:: with SMTP id n184mr42290866ybn.319.1600351125885;
        Thu, 17 Sep 2020 06:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600351125; cv=none;
        d=google.com; s=arc-20160816;
        b=qNbab+pQUCXBrblTNtGBEeLD6RMc5Uea+V7QDNC/q7G5Iv3qX1SbGnQktxN5cS+3Xw
         YJ2KRh+aJXlSsnVaaW6/Mhv1sxT1R4uNEjUzfay762kaWgFDmszuPpdRFLqx7+E1Kbmk
         rCQBNKgqPxfQBYK1tf/Y4G9BE50yIfZjZQ/AoZ609Gdi0A2muZxpFyeVQDk9uIbmeyoX
         tOODQlByzRsht9t4rNSDVWjF6c1MHnRmTLOcjL6/t75fNExqwqiFebKuRE+ucs/43nHl
         0BBymqkNhTyngxVcOE/fggk8+InCmb/lLFOWUKuBqA0gimFTmP+jb8XRhX66E1bxJsRG
         ZTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JuG/z6BjYQ5l9a9uP7lC2JZPoe8P4OOJmc/JyMXmHiY=;
        b=DxIvMCFp6/8QNWbAA0SvH3aDgL+3EA+tbWK4FGiw0JU8+otQAKX2HFlSc7lWss6VtI
         QgX3+HP2iFAHQ1q/x1NtZXeR/m3/QkkNzZVTVnJ9C8pYSu87ZHsL9ruFvMpBz3raLoL8
         61ossYQtgkyj5wpZgRfuZu+t9pwRDy0xzTP8d2fEU1iwQ6Kp+IZCftU9BzBy6k7E3N5m
         nzMofz1osIi2h9L62poztK9DW/jwFDZb5JxQPOY0N1OSCqsjgxyOKSbbZFA9iXiJonNx
         dxlXEN8ey3OXvqWASbyMthn8yfczq48slBTQUaYILOhx+8cH0bRE5nt52zeMi74CLQIu
         bJ7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zyz4jnUL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j133si14291387ybj.75.2020.09.17.06.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 06:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zyz4jnUL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIuQv-0006DB-8W
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 09:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM5-0008Lp-8C
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:53:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM1-000835-8E
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600350820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JuG/z6BjYQ5l9a9uP7lC2JZPoe8P4OOJmc/JyMXmHiY=;
 b=Zyz4jnULKM5NehdBTOhFoaHjOMLlI7biGSonN6l5qV1RKvcxuhhA89qMoQurbEwMJUMtYB
 03GSumBqcv+5dh3TDEK/JoYQERCm0E/7/lE6kh6rTXkZ22qpdCcas39W2nW5+5rkRHZYTP
 gBiXqvZhFwMfiogEZuXr4tVHM28APnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-L_k4octtMzefUOCwrN18kQ-1; Thu, 17 Sep 2020 09:53:37 -0400
X-MC-Unique: L_k4octtMzefUOCwrN18kQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E4171074666;
 Thu, 17 Sep 2020 13:53:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02A9B19D6C;
 Thu, 17 Sep 2020 13:53:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A05E204A1; Thu, 17 Sep 2020 15:53:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] microvm/acpi: use GSI 16-23 for virtio
Date: Thu, 17 Sep 2020 15:53:12 +0200
Message-Id: <20200917135323.18022-11-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
References: <20200917135323.18022-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nAR0iXJGJNPE

With ACPI enabled and IO-APIC being properly declared in the ACPI tables
we can use interrupt lines 16-23 for virtio and avoid shared interrupts.

With acpi disabled we continue to use lines 5-12.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20200915120909.20838-11-kraxel@redhat.com
---
 hw/i386/microvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index e1b86da8a92e..ca0c9983f137 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -125,7 +125,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     kvmclock_create();
 
-    mms->virtio_irq_base = 5;
+    mms->virtio_irq_base = x86_machine_is_acpi_enabled(x86ms) ? 16 : 5;
     for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
         sysbus_create_simple("virtio-mmio",
                              VIRTIO_MMIO_BASE + i * 512,
-- 
2.27.0

