Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4683940lfp;
        Tue, 5 Oct 2021 01:56:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+JK5t26KN6IYRw8fzu7V/gFf5Fxxqhv7I2Fym+DCaPrQY/hr8ykN+1jdLlJpm5iZ2X3dg
X-Received: by 2002:a25:2cc6:: with SMTP id s189mr19562696ybs.82.1633424168498;
        Tue, 05 Oct 2021 01:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633424168; cv=none;
        d=google.com; s=arc-20160816;
        b=BLMJKtOEg79xiHct5qj5q8cUlQkcueXzzvQmMWhxedu4dxbit10tgt0INFEdfi13bk
         sTHfcspG6ybBP95+r3llCfqKWxX3Fj/euw+5x/lDYiKXEJrfyn18v0JNSOwmT/O2Qtas
         dQVY1euOnQprplvDzNT7p0fUOneH7Pmnwjcft3mFfJFVYH0dBLopVvcxHPnFniiRU5nM
         pNVamKCv4PuI5ChXr3ztDLnhYPwF4ihL+y7c5dWUKmzt+l9RqAgzi40we1FBnmSpoP2M
         optNFaPJ1fSWQLr51CDGQPPP3s21xTuWQTaG/5fOGVdAcLA0NURQZ4Q+h8Wz+IcUWXDS
         +o3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wFF9WCg6eW0t4jCJokyRdtkGwM3wwBPBTh6l2Ycdux4=;
        b=v1hQsNLdg+bGEmXc2Pxh23lkJT6zex5BYY4JEgKLSqvUFN7MOlD89searxes+aZuPj
         wJEyqPL9kCOkwPLkWuvXavQk3OO90Z8Ho4dFtXllSjQ35ZY6tflTp+py8aiR2eQXdsn/
         EzS5dI9kDZkIzChWsYmExA8SJsz1D1qvv3ymrXe520JQ+aKJgGvzfrv2I6B+hCkjNRPv
         8hiIeFjkagwYxI59DZk98sO6Ud17mUAoDpQ1PjsuiFbMcej05kArgRsS5AFhAoOl6XDH
         //ga3uQhw/VeZzKEScsWN5h3lEojKwKVdL2zYsQD+u/RYvAXe5nGrAOMzpaTqaVLom45
         fylw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QqjQLaY4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m204si20028066ybb.113.2021.10.05.01.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 01:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QqjQLaY4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXgF5-0001aT-T6
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 04:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgCa-0007gg-Uh
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgCZ-0007RW-Bf
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633424009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFF9WCg6eW0t4jCJokyRdtkGwM3wwBPBTh6l2Ycdux4=;
 b=QqjQLaY4JQ2ggqDJ7CJc/kGhi7V3jq5MeMQokds0Kl0/X2ye+Sg0bEMMs+SzYJ0uofn/tp
 FllXfw+kAYVDTRhSJxKdTfZH7fOedRW9KG8A7ww1z2cO4vQiHN4xXy7JFQLrPSTv5rPyqg
 nfGy9IlZ9r0gFuK4Hv+nzMMOnqxCInY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21--pgYKao-MjKl9aBW7g73AA-1; Tue, 05 Oct 2021 04:53:28 -0400
X-MC-Unique: -pgYKao-MjKl9aBW7g73AA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C4081006AA3;
 Tue,  5 Oct 2021 08:53:27 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7169F60843;
 Tue,  5 Oct 2021 08:53:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 shameerali.kolothum.thodi@huawei.com, ardb@kernel.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [RFC v2 1/2] hw/pci-host/gpex: Allow to generate preserve boot config
 DSM #5
Date: Tue,  5 Oct 2021 10:53:12 +0200
Message-Id: <20211005085313.493858-2-eric.auger@redhat.com>
In-Reply-To: <20211005085313.493858-1-eric.auger@redhat.com>
References: <20211005085313.493858-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MwUayNNe9CvX

Add a 'preserve_config' field in struct GPEXConfig and
if set generate the DSM #5 for preserving PCI boot configurations.
The DSM presence is needed to expose RMRs.

At the moment the DSM generation is not yet enabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/pci-host/gpex.h |  1 +
 hw/pci-host/gpex-acpi.c    | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index fcf8b63820..3f8f8ec38d 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -64,6 +64,7 @@ struct GPEXConfig {
     MemMapEntry pio;
     int         irq;
     PCIBus      *bus;
+    bool        preserve_config;
 };
 
 int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index e7e162a00a..7dab259379 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -164,6 +164,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                 aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
             }
 
+            if (cfg->preserve_config) {
+                method = aml_method("_DSM", 5, AML_SERIALIZED);
+                aml_append(method, aml_return(aml_int(0)));
+                aml_append(dev, method);
+            }
+
             acpi_dsdt_add_pci_route_table(dev, cfg->irq);
 
             /*
@@ -191,6 +197,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
+    if (cfg->preserve_config) {
+        method = aml_method("_DSM", 5, AML_SERIALIZED);
+        aml_append(method, aml_return(aml_int(0)));
+        aml_append(dev, method);
+    }
+
     acpi_dsdt_add_pci_route_table(dev, cfg->irq);
 
     method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
-- 
2.26.3

