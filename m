Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp526760lfb;
        Fri, 7 Jan 2022 18:09:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4HDzlqdFUTb0aYf2wG9j7+eXCrIl3JH96NR9S/PMpvWImPAZfbyaYkF3oxYOM0eshI04r
X-Received: by 2002:a25:44c3:: with SMTP id r186mr92393791yba.130.1641607791109;
        Fri, 07 Jan 2022 18:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641607791; cv=none;
        d=google.com; s=arc-20160816;
        b=0pcWIqUeYrJKvqqzDKl1SMkN5SIGqhjBH7fTpGhgLIYAff0XKp7kiumsog8xcnuPM8
         WLeO7YMgjIaag80H3jVTsSdqhqP1NHuxAnMkLqpqV3NcQl3/EAUc4wBkAot34ofUkzea
         E112CG8kwnAUPVw1WT3qwLU2Ez6URuGHDSVIVbCX5hJEpp5uylwb1RHFvZqL2rDtTJi8
         S6kygLoG8s/6GUCK+oE4nPdAhPiUzglcxWtBiSPpj+lqEjhVjpY1byMmbxWbNlbJi0Um
         gPT0YtA8eMmM8sfE2j1K009SSHVosrkkXiAn645bXamoUebZaH41e4s4eiGAdqvBXnwm
         D8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=HOsqJqrBMIM1qexMOBxqQCQ/OVZSIyFbpDvHp5LI3u0=;
        b=MsWECgaFnfTo48lM7bwJ9jzWY+6/YaW6NgXQzKy5BNzCBuMKhP6jHPOVvaS8CNsQli
         KokWB5ueExp7GqiPowc5hqBRBjQbAHapGyjxpZIqNwQSF4Gb+a/jAyAhwE3Dfy5z7Eaa
         UJW80YM/VAL+C9IjivXK9TGT35nulEHNzkERYj9peHuzbFJ0ktCDLa3L+9ZKYE9tMozj
         iiVHEMbhXCtBb5A4+8N/iLf3p9ivX9Nv6rOyZus75P6EBzP+ChhUf96TjcVNTmdU9Gn8
         rWX1QlOHdpXJ1eE5LcksZtDRhK2WI1SLiulsyG9WCEk9CzqVfVuzYr3QzzDwX6X8/rFO
         6U7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VVPVTuqL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si314752ybk.381.2022.01.07.18.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 18:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VVPVTuqL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n61Az-0000jP-Dr
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 21:09:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bs-0006yG-9j
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 20:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bq-0002vc-HE
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 20:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HOsqJqrBMIM1qexMOBxqQCQ/OVZSIyFbpDvHp5LI3u0=;
 b=VVPVTuqLywlOkiePibtEa4qrmw0SxBOJMUGwccNc9Gt558JndFpblIvyt5lr1o0JFTcOQt
 RZR6YewCzE8HSlcTSM/UKC3vn/Y9bc4Bx2hFEXfX+/q5+jBBXmWE5ib7CpvM8j7BO9tjiR
 sKW4EMjKP/4T6CBHdaX+ltveQXnpfLU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-F_gX7deeNGOIROnDbq93GA-1; Fri, 07 Jan 2022 20:06:37 -0500
X-MC-Unique: F_gX7deeNGOIROnDbq93GA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m15-20020a7bce0f000000b003473d477618so3097008wmc.8
 for <qemu-arm@nongnu.org>; Fri, 07 Jan 2022 17:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HOsqJqrBMIM1qexMOBxqQCQ/OVZSIyFbpDvHp5LI3u0=;
 b=UL4cWVuUaRU5phQ9hTvgTKV4H2J3qTT2ypI9t9fQqX7MdUrafKvugg/qMOP2eCWwpy
 udV6GCCN7ayFgc7oz6vOPN6Kw6hkJrEnSX3Lg2hXnOnmrzbPzsLZjhgdCHCM35GhxEnO
 B6s2CB51A3NqnPRMlUSo/1yOC0Z9u/y/6g7qVUR5e2VWxBXSpmp8g0dFljqUl3u/syhJ
 nWnNQoAydsq4uexuE9WDkpZLmSaIcO5osKRdZmoGzAwgkdv/zOfjXA8zrykE1E8kQqUu
 yMUAjtfzCmSRPCfCBJ7exZFmslobnNcRC9O/dCSMQCTEinx2ZZbGabqOyl2LAEEYlOAk
 r8bQ==
X-Gm-Message-State: AOAM530XREREewDJDgoq3tFQ+tUMFIcOScN0gzsVD4ZrPlAN60pvb1wm
 7DznUnHMguhFXxfEr0oKxU2vWvY0VHSpObPp15E0FSAWWrG2Sm5dW/WMQI+VhMrjRfxPwOpIv5Z
 m4WeUcOA6h9dr
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr55671490wry.453.1641603995920; 
 Fri, 07 Jan 2022 17:06:35 -0800 (PST)
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr55671480wry.453.1641603995785; 
 Fri, 07 Jan 2022 17:06:35 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id n12sm246231wrf.29.2022.01.07.17.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:35 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 54/55] acpi: tpm: Add missing device identification objects
Message-ID: <20220108003423.15830-55-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n70T0UyIVof0

From: Stefan Berger <stefanb@linux.ibm.com>

Add missing TPM device identification objects _STR and _UID. They will
appear as files 'description' and 'uid' under Linux sysfs.

Following inspection of sysfs entries for hardware TPMs we chose
uid '1'.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/708
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-id: 20211223022310.575496-3-stefanb@linux.ibm.com
Message-Id: <20220104175806.872996-3-stefanb@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 1 +
 hw/i386/acpi-build.c     | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d0f4867fdf..f2514ce77c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 
     Aml *dev = aml_device("TPM0");
     aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
 
     Aml *crs = aml_resource_template();
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0234fe7588..ce823e8fcb 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                     dev = aml_device("TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_string("MSFT0101")));
+                    aml_append(dev,
+                               aml_name_decl("_STR",
+                                             aml_string("TPM 2.0 Device")));
                 } else {
                     dev = aml_device("ISA.TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_eisaid("PNP0C31")));
                 }
+                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
 
                 aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
                 crs = aml_resource_template();
@@ -1844,12 +1848,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (TPM_IS_CRB(tpm)) {
         dev = aml_device("TPM");
         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+        aml_append(dev, aml_name_decl("_STR",
+                                      aml_string("TPM 2.0 Device")));
         crs = aml_resource_template();
         aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
                                            TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
         aml_append(dev, aml_name_decl("_CRS", crs));
 
         aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
 
         tpm_build_ppi_acpi(tpm, dev);
 
-- 
MST

