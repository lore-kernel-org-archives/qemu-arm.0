Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3113837lfq;
        Tue, 15 Sep 2020 05:14:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhz9IpRWouFau5f3ZjvdANxeYb49SnGToSNjDsUl70WuYfSabKTo2/ymTpewent23BOEcH
X-Received: by 2002:a25:743:: with SMTP id 64mr26391943ybh.134.1600172080222;
        Tue, 15 Sep 2020 05:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600172080; cv=none;
        d=google.com; s=arc-20160816;
        b=qzdRe0S1dNpwxxky4VJNd2uPiP4T9Pq4hRaTQjR7npaREP/+oslRxCQvpX6URm/bzG
         Z33ZPwOxffNw+7SsrJIUr1J4GMk9qr6t23ckaMg20+aHRRx3ToVzfDy5FUuFh7hwkJgW
         FDcAnA3wLOqH1gBVgn9/3Ij0zrrDD54v6GkQvZFkvw3CBwhD6cQuPOmPm6GrIvXgZYnf
         BScbn5HPuYiUWBaVhVdDFO+ABW6uxrGIsxL1BLj3WUdLu3snAZGxmGrarUjCeyFHQsmG
         +IxOmcRS8EP7AoMJlux6jFvQjx1KeD88sFbWwoWiNxpdk7zfpyAoKIU5uONzu0sQlkrq
         HK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l8Ud8iozTU5Im+G80wvGvhC9Rn5W0PW1auciivrLPfY=;
        b=MNarIT2aoPkeuQBkgvOV63SrPrs5K4W22ak4VWmZCB8h5Gxw7cTWBvXOi08UDm0VUd
         z1NjAy6+lHI8IRqpCsM2cWWnH3ZP9LKWC4cxd3lupnoSEv1AeRXLtq7u3YyvlBbqlnKQ
         OJwdvAyjsRoSzmozjAD4MFX7rJOUOjS91MXf51PnAW8HVanPEPA3ISCLtYY2bXUPa13o
         Pg+DJGwtSQDoO/E2hBp/uvi6KKAGtVfvFiNXyJfHgloLqmAf7NpVdLejxfawIUxk23q1
         v3+SaDxNSmwmkzMJibMLqYyWT6f/7TI0hMmDp7jcpnElkV1B6M427ubc4e7w0YMKsQMv
         Latg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zx6gZFJB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si12921212ybn.376.2020.09.15.05.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zx6gZFJB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9r5-0000nS-Jr
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nM-0004su-UE
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:10:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51658
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nI-0007iU-Kg
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8Ud8iozTU5Im+G80wvGvhC9Rn5W0PW1auciivrLPfY=;
 b=Zx6gZFJBLALHJ/f5NZBPPl+bBIywFvRlieduOFvLOCKZlP6KKsGoW4TDh5xXEnsPP1m8kg
 CZUGHfTeP3rkuSKFUx/97r+0iPC6xDUKlMXQXXPr9HLFvvMgPD1oG/58FV/aC9y+pVYAwO
 0O1InTU3Z73W/d6Kj4x2A6tkcsvVy7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-BvPwM7fgPxW897GTd-PIWQ-1; Tue, 15 Sep 2020 08:09:33 -0400
X-MC-Unique: BvPwM7fgPxW897GTd-PIWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F4031009459;
 Tue, 15 Sep 2020 12:09:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D4065FC16;
 Tue, 15 Sep 2020 12:09:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 123C040845; Tue, 15 Sep 2020 14:09:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 13/21] x86: constify x86_machine_is_*_enabled
Date: Tue, 15 Sep 2020 14:09:01 +0200
Message-Id: <20200915120909.20838-14-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:29:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A6uqBBkii25u

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/i386/x86.h | 4 ++--
 hw/i386/x86.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 1a188a7deabb..25c904638c11 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -100,8 +100,8 @@ void x86_load_linux(X86MachineState *x86ms,
                     bool pvh_enabled,
                     bool linuxboot_dma_enabled);
 
-bool x86_machine_is_smm_enabled(X86MachineState *x86ms);
-bool x86_machine_is_acpi_enabled(X86MachineState *x86ms);
+bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
+bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
 
 /* Global System Interrupts */
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index c1954db152eb..e2a5005f389c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -821,7 +821,7 @@ void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
                                 bios);
 }
 
-bool x86_machine_is_smm_enabled(X86MachineState *x86ms)
+bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
 {
     bool smm_available = false;
 
@@ -863,7 +863,7 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
 }
 
-bool x86_machine_is_acpi_enabled(X86MachineState *x86ms)
+bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
 {
     if (x86ms->acpi == ON_OFF_AUTO_OFF) {
         return false;
-- 
2.27.0

