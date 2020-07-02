Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1838042lfm;
        Thu, 2 Jul 2020 13:52:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLuRLIYDu6zk5+E6FfrJvVCFnl4EI08zsqFkGD/KkeI0/J4H7w7HRzQGPaUvyWmBpJcc8S
X-Received: by 2002:a25:75c6:: with SMTP id q189mr53368890ybc.501.1593723161499;
        Thu, 02 Jul 2020 13:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723161; cv=none;
        d=google.com; s=arc-20160816;
        b=bYyeLstIwIgBVYLHYMWipL4pXubng/YsIu/0ij9DTNIs3j0pSevTNjY5bS6Fgm2ZJZ
         +Sg8Wyofwn2zQDwoEvvGlrPSD79xyXX+so1wavmw/e3bPnUxbAgQh6xvQ2mXidaBoE4u
         pAq5lI9h4SVgaM05r00MYXGL9nbViI3abfDfw4GmJyWsT9IbEuI8+4QwY40YvgCxyCot
         dgV39OEmgOqoXRq30wjWNQ2BI/LO42mWPRtmOrTMVvTLbXdQD3lAc8c/OByydjQPdhYg
         xIxObF3vAsuiTqZ4GEUfRI9PLAOYRH3ZH1awYo+8PBLTazA7/ueaxy4G9N0Hci1aV/TQ
         OC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=xZdFqrgR1JarvVVCRgTMEg19qCkFtkK1L1XpMKaNaII=;
        b=C/lUQUDgPoJw1UtKzgFfQJVSCP9vOSXyxDjvq+lKL8oGBK6DWkp5RC4gEE51kIMIZV
         GR/ZL75IN2IEbS6uyZ/6BWHBWLQ56//EBzIjvm5lHzgzSSf9opUcwsD5YQb+9XnmA43r
         9Xt2aTZ3AQvFgyU4m7mbk4zl8kexNICxGS7xrl/n3QetBxx02xHivb59KdGDkBVhFDwy
         h/J0iLg9idCtTZi6O0YLXyh10ZVISDZJkKrCmtGZqBLsejmoB+Gyx1CAXvqT3EdSRbCO
         9Lj9MECp1Unz9Q84Ee8tocvqxKzXvjRwxAS/cCFtrKz7H5dv3U1w6tduXl/6ser4t8Mx
         uj4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YOSgIA5C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si8740786ybg.116.2020.07.02.13.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YOSgIA5C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6CG-0001j9-Oe
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr699-0004Q2-6z
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39249
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr693-0003Xx-Lp
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=xZdFqrgR1JarvVVCRgTMEg19qCkFtkK1L1XpMKaNaII=;
 b=YOSgIA5CeQWDWqDoQWQk23Lt9IFZ0NLIaTHhcF9w7GXm+B/r9aD1cS41eFB/OTS/QaeQWL
 33bdv8bUpXaOvLfAlBbwhVZ0ViHP7e20I9DNyfk4/bCu8UF63i8SrLy+MIpbT5k6NOOwMK
 7nbr65Bw4Pq6cFWJdbO9oRCA9ChYY8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-pX-5G8-8OBKPnYjH9Yr78A-1; Thu, 02 Jul 2020 16:49:19 -0400
X-MC-Unique: pX-5G8-8OBKPnYjH9Yr78A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DCAE800C64;
 Thu,  2 Jul 2020 20:49:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2E211A925;
 Thu,  2 Jul 2020 20:49:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A0C2931F09; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/21] tests/acpi: allow override blkdev
Date: Thu,  2 Jul 2020 22:48:57 +0200
Message-Id: <20200702204859.9876-20-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
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
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UCJjxGrvEwyw

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

