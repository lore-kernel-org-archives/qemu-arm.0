Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3521497lfq;
        Mon, 28 Sep 2020 03:48:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzS0fOZ8Pvclp2jvt1mQACnEiWVLBr3sJJOsRz60+BjRVwoY65U5Pl7+K+tKddRbzmo6B0q
X-Received: by 2002:a25:81cd:: with SMTP id n13mr1016718ybm.514.1601290129280;
        Mon, 28 Sep 2020 03:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601290129; cv=none;
        d=google.com; s=arc-20160816;
        b=ayusmbGuiS/CMenY7IQMijhnmHCduemheDbVlr31spu82OixSAc4UFEfrQujLNkGI/
         GXk+yzIBBBYT1HNy3I851pl5iwWX/IQduLbhGx+0M0PaD3Rt0qePsPLhsMGl7XI/j5dn
         n5BbUPjmYDXpCBNber1SRYMhS5R/qYR1E0omiL+Hh4vx056BDVngcBjqqzDdrUp9PSvH
         8kkTvoDITaTmjEe97olbFH5vPlblluwvGZR3K6dh9YeKFfvlukFqXtdS0BqBPkHkjh7u
         QRWDP5jqqTttAgcAVm9mPywFRNrOnxb3L14wwA9+tZPTyK5sCvbWP94uWUb+X3M7aX6/
         JDUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DzuHHKR6tmXSjEbMqJkV/4p/aqbq2kdpVntF34U3/qo=;
        b=U6k9ENsIc6q+e1IRdOGQZB80lKloh6idLRebTOlPv/gJsJEHLX91r0AsBDOGS5KqEt
         1djFV2YirWpNx00wdrlltWaMJMW1wtWdKKrHPqXGia7bMlLZPiRWAStMN9zKKmkFsOqI
         tj1/XONfYuJ2cAC+2Q2LfltBn3r/Zn07sCKAtWc+QdL6KylXTQAoyvLMsbQeZaDUUXzS
         RvOaezSbT2bOCiUr6Q4TtAAEsuhvPyWXaZWiPE1oCd9HtwC+mMBnjIORJGkKOf3R27Z8
         enkEGr+RIPtCdyn7QiAii9fHGRmJfNoYl6t5rG+Pdydy1JiY0GKKri5liQVfVBk9cr0f
         eyXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YJpVb0BW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si478696ybe.283.2020.09.28.03.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 03:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YJpVb0BW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMqi8-0006XJ-LF
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 06:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqcp-0007pS-9g
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 06:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqck-0006Hp-1c
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 06:43:18 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601289793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzuHHKR6tmXSjEbMqJkV/4p/aqbq2kdpVntF34U3/qo=;
 b=YJpVb0BWPfxCXwGQh4OrSW9+QAASTB7vFZdncypDGjz0xyCVBTgfXsti+GJVWVXfsRt7h7
 NUmqKfI/tRQ6Vxu/WUeR3zhHGy5M8VBBFPiyol69UECiHdUmbenvj4wzZATBdi417NDtjb
 /RcXUwOw5NB0W+tuUhuU5ebOl8FeNkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-9fh5eRzZPgmUg5OydNU0uQ-1; Mon, 28 Sep 2020 06:43:09 -0400
X-MC-Unique: 9fh5eRzZPgmUg5OydNU0uQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E27D1DDFE;
 Mon, 28 Sep 2020 10:43:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFDD81002C26;
 Mon, 28 Sep 2020 10:43:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C104140DD0; Mon, 28 Sep 2020 12:42:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/12] acpi/gpex: no reason to use a method for _CRS
Date: Mon, 28 Sep 2020 12:42:55 +0200
Message-Id: <20200928104256.9241-12-kraxel@redhat.com>
In-Reply-To: <20200928104256.9241-1-kraxel@redhat.com>
References: <20200928104256.9241-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qhoKUb+tvf66

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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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

