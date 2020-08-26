Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp644207lfc;
        Wed, 26 Aug 2020 03:57:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSGJK1+h2GBM85PuqCgESHZTWresQl16xvj5Zj3mg6otzziK1TEKOMmFwe49kmygthv4lE
X-Received: by 2002:a5b:58f:: with SMTP id l15mr18921574ybp.215.1598439473314;
        Wed, 26 Aug 2020 03:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598439473; cv=none;
        d=google.com; s=arc-20160816;
        b=vD8X5iC7A7GTCAFNTVoPb3AeyUxCT4+so39XTRqGalsNlIWUsoYTecuhR5vkQj208C
         +kaOxkOENm0E8EJSXmVRGxuO0UszbmNR0gMNxEav/O8ltCglWlEHE/CkMSgfyXpsPCLR
         fskGiK0xcn27CHT5+YnIaAumWGC2q3QNruxWDj+X4UhJXfdwtae3NeLbL/6pZWkQLleI
         MkBhxbkan8emBmZu72PzP1Aa06FunA8fZmNR00ozm/mhldxAQlN3GLUUY0W/T66YVXx7
         flVr9E0WOidh+qA6Bu5P/5kReQdZJb9H6ASfC+zHvbVoHrUtbbETmgI6gSOdQrftpbAu
         6GHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f7gcGwGKvQs66zPNjI3Utr4hWVSraR8+eNzLSiL1B7A=;
        b=yuwbupFPJGah3XiFsEETjFoBPbKC2qtms0OtFO9cpq620AWaOWaiU3xhqsAUkt71IL
         KjImxj1fBKXQcf8/5EZzre4W0BrEgununk4fwS1LcTlK2vCrdVikolGulwuQLmKNVals
         xg/37XghWq+Dcn/2bEKBDFrXYMpuNtQkVe7BYtgKy65WEealcNOS3oZUo44vBqbA2DDR
         YaEgzXYoN24dCIqD+k+Ai5niBrQmqlZbOKt6Oin3o+F1v2U9BHMvg+g7J98Lnh5VZ9NP
         neBE+e7bknp9BBponkvGzj8gLIVplLw3eI03NPlFIC4FpkXnY+aaj5r9oLSwx/Pfrpnk
         qrzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="VhOEWAm/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b186si1842245yba.455.2020.08.26.03.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 03:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="VhOEWAm/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAt7o-0006XQ-Mh
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 06:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3P-00061E-Iq
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:53:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23310
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3H-0001Wz-Io
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598439190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7gcGwGKvQs66zPNjI3Utr4hWVSraR8+eNzLSiL1B7A=;
 b=VhOEWAm/9vU4+kWou2Rtz7wEnB5fQG7QeJmqqj4KNu4sxX3MmIk1Wu9HeMPBd5EYNdOdyo
 rtnd5AMZ4qqJfzPxNY3WMnIGMnt3odzI+D4fRyDpBd6aG5gyUh7Fxh3c5+kbxkZauyHVSm
 wP/5v+CiWAVGwQfmxCD0n1OuGu93xEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-TWpG742bPhmfJSsmIrYQKA-1; Wed, 26 Aug 2020 06:53:07 -0400
X-MC-Unique: TWpG742bPhmfJSsmIrYQKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A113807330;
 Wed, 26 Aug 2020 10:53:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA44E5D9E4;
 Wed, 26 Aug 2020 10:53:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8B18531F38; Wed, 26 Aug 2020 12:52:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/20] microvm/acpi: use GSI 16-23 for virtio
Date: Wed, 26 Aug 2020 12:52:44 +0200
Message-Id: <20200826105254.28496-11-kraxel@redhat.com>
In-Reply-To: <20200826105254.28496-1-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:16:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U90y6TacWr+0

With ACPI enabled and IO-APIC being properly declared in the ACPI tables
we can use interrupt lines 16-23 for virtio and avoid shared interrupts.

With acpi disabled we continue to use lines 5-12.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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

