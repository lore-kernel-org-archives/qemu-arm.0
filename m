Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5744555lfq;
        Wed, 30 Sep 2020 10:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysjF4Jy+pji4REbtdncfyqQNN8WrrgkVkHNmNMXRbyPi5wFjljDrtb+tzyI4eQ73n56pNm
X-Received: by 2002:a25:dc92:: with SMTP id y140mr5202553ybe.113.1601488565402;
        Wed, 30 Sep 2020 10:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601488565; cv=none;
        d=google.com; s=arc-20160816;
        b=zUfKOCinENimL3ZGk5T+pyQU1/Fy0a0KZGyOvCl9yj5pj8iSH7aci0hHVhTwEaJIKc
         Yu8OTHazJAtjMxaLGCgMRwftW+kofO7tzweF76fQc+TULSTZaKaeuOzyIolGljylWnoN
         V/QvM8yoC1L6/rVAwYLJbBfQm9MvvPWMptZlkknGB5MyW7sZlPEAg3DR8Cukf2yiVZ+Z
         FVpaCKszwiH2s6X6m5JK2idynSDz1QdEE4wXmSmF8CQeWfuxk7iafrhRr9XhYHzEekmL
         azAkssuk+99rMYklFzeDdaXEsWMEPMt3toziVufva4zh1ZVSfYLzvrgJsbT2fSTr/nVS
         6Zhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aVlgghQWOtGdrS3DFQka7ncCz1zWWLT4V5AG7CyK/vg=;
        b=K6RH5adeEALi9rCiKdNcoC/bDBxIc/POMa0DRVUcpFAYfvJMWFGjzntgpHKVVrOIBC
         enc/jbhTEBg/Zt/EA6DEUd8MaDY4SCIFS0KuGqPEEiy6VZ0lprk4bwdeA0Ir0R7bbk+n
         48k50D6o8kGe0z2vErKRjoaa8z1ubz2IXeIC7OnDDbFF5695Cd+D23xdQeDlNxeVJN8t
         RF89s3kxxpngk6TYcWre4QzIj7tFHamTFXF5oaCMiiQM0iORNIyG/SLYS03jnD5nKIjT
         jgCHDO1nr24Nlr9+adospyUdx8I1yTpZ4zZ5/4CfFPtFLVtOpoq8+CM5o0WQuoXsDROC
         litA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HECxVnCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129si2127468ybh.40.2020.09.30.10.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 10:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HECxVnCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNgKh-0005zd-Lm
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 13:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEH-0005Jz-Dk
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEB-0004jh-LO
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:25 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVlgghQWOtGdrS3DFQka7ncCz1zWWLT4V5AG7CyK/vg=;
 b=HECxVnCJX4fA1g8IWSsZZ8NoifaCXKFUeYd3+uOuygLThLmhg2s7JHYN0YBx1FHMVBo2Yx
 Iy/woiksd+8k1h5wBskY45s8iFZ3EBoxIsC3T99Ga46XmGwVZe1DjDL7jWmEtjo9mHGH6z
 l86toxM2V/TDCpd1C1QdPvz6FCD924M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-xziw3H5eP16ELNvLQKM3VA-1; Wed, 30 Sep 2020 13:49:11 -0400
X-MC-Unique: xziw3H5eP16ELNvLQKM3VA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1555C101FFA4;
 Wed, 30 Sep 2020 17:49:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BACA55C1D0;
 Wed, 30 Sep 2020 17:49:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7B02C40825; Wed, 30 Sep 2020 19:48:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] acpi/gpex: no reason to use a method for _CRS
Date: Wed, 30 Sep 2020 19:48:54 +0200
Message-Id: <20200930174856.11296-12-kraxel@redhat.com>
In-Reply-To: <20200930174856.11296-1-kraxel@redhat.com>
References: <20200930174856.11296-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
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
X-TUID: WYXa87YZYuCr

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
Message-id: 20200928104256.9241-12-kraxel@redhat.com
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

