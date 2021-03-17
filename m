Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp227001lfg;
        Wed, 17 Mar 2021 02:30:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH5/eUrRujH9WJdmCSueBru5Wa0nwzQ5PmNXhux3GQIft7KdPQ1DIXctIzMNB8rM0/HaXK
X-Received: by 2002:a25:c689:: with SMTP id k131mr3200303ybf.515.1615973452228;
        Wed, 17 Mar 2021 02:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615973452; cv=none;
        d=google.com; s=arc-20160816;
        b=bXbFy2WRhdzs7M3FT/pNrYjbF4dV4BjWaSnOSnBr7EG7+M0YnDnbq7uNT4gE+GTssF
         nSQjPeRzdVmG3lrhKgkNk4HcQGXGeM7ZwVGH7pXXXtQyRStYXBsZ7SvZOyDrtKKTd2cO
         1DkEwCgaTdBFYAA19keBzuEWPndh6f+8/64Th5etZn3Ctpe5TkEOAhMu8EI6Aa/jdw4M
         gM78nbv70LCrzPOOl1oK/oAcDLnuwITxgNhK1uL3zzYT1spFcEMhBrstlIINyLHShojF
         lV6H0QPw/FoxPaT65o4jJqLiS1sXocdSSTb/Y+hdNf7XJ+Dokitf2Mb1+tDB/xa8xYb4
         64nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eS//NP/1GkUCHJv2GcftGE8oA/OfSV4PaKf375lLiF8=;
        b=BIBPv30a4e+D0XvvIOUeaJb1VT2Q7UhFY0OvuztkqRiimSstY2k2Jcc6qEUWjaPB+9
         cVQBE+fQBjRoz7pwNby4QLpPIAxlCtm7Lq8RyS4wCbr0WPxRKB7wJpL5e5US9fBx+KIB
         M4dybrUN1d4jRvTsbO20n2g80xSU9aZHPNlriqmxPgeZFqz17fviS8lihbTM42t2Ps6h
         vXNHHvsshhA16fqJ6p+JWSjCv8ahHcsD7l+EFJvpdzuXo83kWtIHJR0WNUGTKk9OjtrC
         N7Lo+yq9NmjW8sbSImieUh3oHAMRyJB4c6o0Qjvi4uO2q8BG9ophbeWszp3NamNJA+Sa
         oefQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I6feyUlg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si19996813ybk.386.2021.03.17.02.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 02:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I6feyUlg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMSVv-0003Qu-Iq
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 05:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSUA-0002AP-G7
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:29:02 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU8-0001Bp-1z
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:29:02 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso1001772pjb.4
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 02:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eS//NP/1GkUCHJv2GcftGE8oA/OfSV4PaKf375lLiF8=;
 b=I6feyUlgnb9c3fpRGeqLy5N01vjSOq/aoPvzhXFZtBz0dFGEO+a3/tAa3ca2LrnGF+
 AKJr+28703SXsOL28w/962+EvZpk3ISAZ2ETCrZEEzkgHRDQB9je9lQRFBvCdiFv6Oy7
 ukwIgo8wBF2zNwzQqD0wj7agX8/LMGbMSC0haKn9P6D1nhgPSE1KY0T7pMWQkjVFHagD
 wpnMchF8PlpRuDLWWkxpMjNZv3RJZOxibEHYNhWJjdP0bd4VlsaoozaYQ0vbwTMie9oq
 tKmioHcyIUGirBJJiTIrzzCg/jIzYob3TwBIhk5V8LMyxCgR8x/ooKOoThG7qOrJt8Pr
 Hysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eS//NP/1GkUCHJv2GcftGE8oA/OfSV4PaKf375lLiF8=;
 b=gyPA1zsrpWFOaotP3FdKnbs5WNQ2MBgCzxcCHZ0oTGOm0FOuOgSa4avm4/H2iPynRF
 3ApPCCmxeXFr0Q0u866W53uKUAwmFkTWTrJeciyJpIQBRDBOxrQvcv77OcU5N4XdyX/R
 bqLLufaxSR0077iYgV1E1LwpJfvlVCophEU4Uj8+1EYRQ2OyM7d39ekuAg7rDfdVyu45
 nrSZxVnZffzhxZJwxivOHvaxDSf1x/GqAJYvH4XUuY0MwjvX74O5l9/GjXpdPus6O/Sh
 teYTILJzsgllsd8aBO2LZb7HvIri4RlcKeUBk6WLCtUkfLDqYuk513nuFG5CtuF8SfCF
 PsoQ==
X-Gm-Message-State: AOAM532PdGFSYW7028thT7SrcGPAroaKGLybZKwVy1GZCMs2SkAL8aw3
 k1LhbNlCeUn04BPg/mMVM/jz
X-Received: by 2002:a17:90a:840a:: with SMTP id
 j10mr3475362pjn.97.1615973338789; 
 Wed, 17 Mar 2021 02:28:58 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:54 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 5/5] Enable the MTE support for KVM guest
Date: Wed, 17 Mar 2021 09:28:24 +0000
Message-Id: <5ed81ba84e44100798009cee95c3dc2d993602f0.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=haibo.xu@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zoS0yxkTCMV3

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 76658b93a3..36cfdb29e9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -79,6 +79,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "migration/misc.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -828,6 +829,21 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
+static int virt_precopy_notify(NotifierWithReturn *n, void *data)
+{
+    PrecopyNotifyData *pnd = data;
+
+    switch (pnd->reason) {
+    case PRECOPY_NOTIFY_SETUP:
+        precopy_enable_metadata_migration();
+        break;
+    default:
+        break;
+    }
+
+    return 0;
+}
+
 static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                              uint32_t phandle)
 {
@@ -1912,9 +1928,9 @@ static void machvirt_init(MachineState *machine)
     }
 
     if (vms->mte && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "MTE to the guest CPU");
-        exit(1);
+        /* connect migration precopy request */
+        vms->precopy_notifier.notify = virt_precopy_notify;
+        precopy_add_notifier(&vms->precopy_notifier);
     }
 
     create_fdt(vms);
-- 
2.17.1

