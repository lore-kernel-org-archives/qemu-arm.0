Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp918756lfm;
        Tue, 7 Jul 2020 06:04:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlz1E4WNV1yzTXJ49VeRCfa+qTzgkXcLvpP/NDOjfqn9WDNS8WyR0q98S6QRNZurXUaku7
X-Received: by 2002:a25:77d2:: with SMTP id s201mr67876383ybc.21.1594127077642;
        Tue, 07 Jul 2020 06:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594127077; cv=none;
        d=google.com; s=arc-20160816;
        b=Ews7RJ+BgGCOZCqAq4oD4p47utS95gZnvUd8BpCP4gUQIwXM9J8iQb21zeSZ7XTHsk
         lVvFzNwR1TKlfjAkNQYk+RJS9qlGXU19RfNjfk+5IEXucdi14R1A7WI10ELwcSyaojTr
         F8j0bC227iIehxaBly3E5S3zcLqKNB/uYgPcH38u7WScLvXcAiWe+x9vHpd42RLzN0dm
         8S1qtKTpzIPB8g9F+YJb+/TFSL8NboMarhES8bjWtFCFNv30w0u1fHsv8hgF31ZIP+77
         6H+gIgc1T+WJiqW3RJLsogURDMGUQ6glKYKOrAiToDhC1vQpMLwFt3DIUeY/YqUB01IO
         P/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=xZdFqrgR1JarvVVCRgTMEg19qCkFtkK1L1XpMKaNaII=;
        b=QzECBwFTbaoggbsjlzUs6bLG8AEim48IQxYxNMPQtspdpSV15SCG6+gPDoP081q0Gs
         2FAd6RHSjitaYBTGSVMl1+JjLsEuMB82S30LSYkMtkFnjf9U51K/GCcXaXMwZSy/eWAd
         GUT5YgOkHfK50s8O6RhVpgYi9jLZOujHnw6qzZ4oqbHbOa7GsAFkQvIB+pZhA9hjFbZ3
         Mf51N2vUCKa+3D1rWC6JZ9SEzvjGB6G03n4Pot8n84jnLKzMWXKAcP+5iak5unkrYbYT
         3XvbVqyr+iHRXCHjEMRVNMlgPASW/kyy1KrWHoizbWMIOcXLJHC6qq8r81aM6ojdX5xz
         vilA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AtTt0ejp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y125si4073120yba.353.2020.07.07.06.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 06:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AtTt0ejp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsnH2-000675-UY
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 09:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7q-0008Nm-NR
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:55:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39016
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7n-0004uF-8B
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=xZdFqrgR1JarvVVCRgTMEg19qCkFtkK1L1XpMKaNaII=;
 b=AtTt0ejpeFCfYWVO/CarYnTqkl4F99QKCZMFOSA7yDkA2KJGvhq3WZHEpYmoQRkmLMl8ja
 xLKVeCKEKIXNgDgbG3zDZIHbHxsF1aTlWkuQ9vQuAGGaECKCO0hvRxWNtaQUJIetaZVKuu
 aOXzjbKSpNV0OkqJB29IwwWCGCYDw6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-38uoFztIMkqEJ6DxqUAjsg-1; Tue, 07 Jul 2020 08:55:01 -0400
X-MC-Unique: 38uoFztIMkqEJ6DxqUAjsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5626A106B24B;
 Tue,  7 Jul 2020 12:54:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2DE32E037;
 Tue,  7 Jul 2020 12:54:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8D0331F9C; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/20] tests/acpi: allow override blkdev
Date: Tue,  7 Jul 2020 14:53:54 +0200
Message-Id: <20200707125356.32450-19-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:31:00
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
X-TUID: MyLf7SbQ/TTO

microvm needs virtio-blk instead of ide.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c315156858f4..24b715dce780 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -72,6 +72,7 @@ typedef struct {
     const char *variant;
     const char *uefi_fl1;
     const char *uefi_fl2;
+    const char *blkdev;
     const char *cd;
     const uint64_t ram_start;
     const uint64_t scan_len;
@@ -635,9 +636,10 @@ static void test_acpi_one(const char *params, test_data *data)
         args = g_strdup_printf("-machine %s,kernel-irqchip=off %s -accel tcg "
             "-net none -display none %s "
             "-drive id=hd0,if=none,file=%s,format=raw "
-            "-device ide-hd,drive=hd0 ",
+            "-device %s,drive=hd0 ",
              data->machine, data->tcg_only ? "" : "-accel kvm",
-             params ? params : "", disk);
+             params ? params : "", disk,
+             data->blkdev ?: "ide-hd");
     }
 
     data->qts = qtest_init(args);
-- 
2.18.4

