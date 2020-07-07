Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp925038lfm;
        Tue, 7 Jul 2020 06:11:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhAbU9rCLD9iQSFsMep/Wfk1Oi5IBIxde8Q1F4K4wDcJz8vlOH/iLv88yTlYcPP5C/i7pM
X-Received: by 2002:a25:41d3:: with SMTP id o202mr2041739yba.236.1594127466426;
        Tue, 07 Jul 2020 06:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594127466; cv=none;
        d=google.com; s=arc-20160816;
        b=VIGpDhZT36zMH/aUIXvRAdyplsiFDXm7/0Ce9BH2lelUexScWh/HJg5QqPMDISWObg
         AKn5k8yC0eSyPhYF327GCOeK17pJH9salbKQsqJ2dCqEuFlWFxht10LsYlI7KHJS3IDF
         lt6uiolXnTiBqesu3OAFttJTVCa0x+g8Q/LzoOb6pM2hj6Y1tPjXs/lIG9u1pL7ltHth
         PsNeVkrG6VG8AfvA0T+3VfMfLquXiiD2HgP6b6ygUR1fKk2C+2goWgia2FCOPPlLiFwB
         qe8vnoNCskKwl3ynxDo6kR0KZdqLkUtAqvuoZm+O/NMPJkCyWPInCgAOEbAJy/YoCWPk
         Pfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=jEDeQL+0eY+fxl25+8ob2qVPKP/uEkYpHD39mrbj0FQ=;
        b=K6YNRfO04/F9JLjh7NMNCLsfFg64KOgIdjftgKD4/Y6NaRBnVuWnittXMsT133NJqY
         QYLqD1uta7xo3ufzVM+4fVrbqyGHKCh3Q/raTxunedb1NM+ZzPk07XnWgg3Em/LbqqDG
         wPLwZnLoeeOD5RnEqEbOXu6q9Lit7p+taG5KoDvxB+E7+WnjEQjlGfSCFQZg+diqsHGL
         7p4U3qp1OjKZjgEuHOCTF+jyN/MRliOvLH+KGDt/EikdSPkgNga3J8jFcRELcAHdkmrv
         kuNTJP2WaI1Mg6301J79GAaaMxi9wVVyJ3txQpePMy+VLWWzYpL7O4VFD9ysmppcdqkp
         roeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FJLjJpHu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m67si8616406ybb.296.2020.07.07.06.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 06:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FJLjJpHu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsnNJ-0005Nu-RA
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 09:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7k-0008FZ-Ql
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:55:01 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56185
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7i-0004t4-Qo
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=jEDeQL+0eY+fxl25+8ob2qVPKP/uEkYpHD39mrbj0FQ=;
 b=FJLjJpHu+fiU+SujaXT/lNsh13ABiUbOM926u8HYL3qXn7JBy1DlQMCOMPkqSrDTvqUIU8
 LzZ+3TZ8+JR+4o8Hz1fULjIy/q9QAynKek/+hqg4gfgxnnQ55jN4J72MEIdZrwS8842Gbw
 Hd9IHjLhQQvTXFpj9eSTR5b1JXKa6IA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-cfGlCA8-M02isXM8poGT0A-1; Tue, 07 Jul 2020 08:54:56 -0400
X-MC-Unique: cfGlCA8-M02isXM8poGT0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DA5F19324A5;
 Tue,  7 Jul 2020 12:54:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 720D17846C;
 Tue,  7 Jul 2020 12:54:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B0CB31F62; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/20] microvm/acpi: use GSI 16-23 for virtio
Date: Tue,  7 Jul 2020 14:53:46 +0200
Message-Id: <20200707125356.32450-11-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8hbmYW6aGs73

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
index 75eca7306b11..1bcd57a6fd80 100644
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
2.18.4

