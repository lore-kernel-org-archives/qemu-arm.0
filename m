Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1129792lfq;
        Wed, 23 Sep 2020 23:32:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt7gg020txTs9+351VXOJjyDEcDKYKvaX+kHj2kfOn4E71xI/Oku2QUOza3x5/p8dKAy6B
X-Received: by 2002:a25:6849:: with SMTP id d70mr4808351ybc.395.1600929167783;
        Wed, 23 Sep 2020 23:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600929167; cv=none;
        d=google.com; s=arc-20160816;
        b=HdxzUXlQLVOCf46t6rABCpBDftHEPSSuXWhLH4BgUFDa+us7TpJOxG5iiQJZtl5Hpb
         ARJQdi1ekidVyre7ijoLRc0Dc62f6Ixsz26nBnzdk9uuFNWWOlgdXczBhEaCh7YboNmF
         jrgdry/U1b/cR1NsGlr7PG67JJprt1zGf1Cwpl/w8/5h7Bm+QRGC4+ue33SvhlGeiq42
         rXuj2TXnQTv7724jKEQmfOxtyep2AXG+tD27ig+ByIy7fwGp1aAFFvC5tUpQ664BeB6u
         kXor4YYYYRYBUlcPek97phbcoIufiZ1Yj9hCGDHrZnX4ZdUCWwbStPKNeERCFdIpvJft
         g4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1mXW4YbhE8P8wqeut/V/y0A0w6VnjkPD/xM+kYr67uo=;
        b=XpdmK9dKjXfvSUcEGg4Pd+PjWfGhzEVqKEvguYl1kS5LSxuX7h9AEDni37P9kzjq+Q
         IFzfD/bwFgFO/wzqC0FZyItvjxmh20ShYNWeG6MCdZN0rE12hhqekD1A1AiDaveeC0mf
         S1VuiTpGbso6J+tp4OzxUgNdktxEdAgr/c9jUvspCIqajkD1zUcM8k0aWMZarQyM6hrW
         1zyAv2rSEFJpaO0O6qwMkehv/eHNJg/MGhDaaQOueFLc6EUvXKtKeOUP/uS+ysF/LN64
         lC9/FpDKFw2+wQO22B4fW/doRHGor5xO1FciZlbkUGr/WgdhlMQ2MNxQkMRRFxvGuwMQ
         /93Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7wrk8n1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u73si2382770ybi.266.2020.09.23.23.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 23:32:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7wrk8n1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLKoB-0005Q3-4E
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 02:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKje-0000Ko-IF
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 02:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjX-0001ii-13
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 02:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600928878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mXW4YbhE8P8wqeut/V/y0A0w6VnjkPD/xM+kYr67uo=;
 b=a7wrk8n1NMN01WfFLyZWifjuunMoZ/UDwqM2vYDNRcv+iLbMgHGQ592+8sVy2jNTxKgnRs
 LtSpkVg31Khy+Lc8kJ4ey7PEHK1kxCE6rgvOXH4B0RZ444HNXL0ra/4P6YLhi9TdCCnRXN
 BB+/MV9qbaNMMdpa7G0kxCeCqUX4E2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-nHoY7tMjMQyDgi0HBaz6fg-1; Thu, 24 Sep 2020 02:27:56 -0400
X-MC-Unique: nHoY7tMjMQyDgi0HBaz6fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FD04801AC5;
 Thu, 24 Sep 2020 06:27:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8DC60E1C;
 Thu, 24 Sep 2020 06:27:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A5EB31F09; Thu, 24 Sep 2020 08:27:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] acpi/gpex: no reason to use a method for _CRS
Date: Thu, 24 Sep 2020 08:27:33 +0200
Message-Id: <20200924062734.22978-11-kraxel@redhat.com>
In-Reply-To: <20200924062734.22978-1-kraxel@redhat.com>
References: <20200924062734.22978-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9U7NjoQTbZl6

... just to return something which is constant anyway.

-            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
-            {
-                Return (ResourceTemplate ()
-                {
-                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
[ ... ]

+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
[ ... ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 6fb951a0c19f..dbb350a837f8 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -57,7 +57,6 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(method, aml_return(aml_int(cfg->ecam.base)));
     aml_append(dev, method);
 
-    method = aml_method("_CRS", 0, AML_NOTSERIALIZED);
     Aml *rbuf = aml_resource_template();
     aml_append(rbuf,
         aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
@@ -89,8 +88,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                                     0x0000,
                                     cfg->mmio64.size));
     }
-    aml_append(method, aml_return(rbuf));
-    aml_append(dev, method);
+    aml_append(dev, aml_name_decl("_CRS", rbuf));
 
     /* Declare an _OSC (OS Control Handoff) method */
     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
-- 
2.27.0

