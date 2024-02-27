Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2544206ejf;
        Tue, 27 Feb 2024 00:43:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUa3eSQSzg3r7Ma4Ok5AUodbAeM0D0hZ0Wr/C2J31NfN0bxNmrRwAwiamDZnzZTsK7s3pIwy2qPAUDGY1g/D0yoTMGrLcEk
X-Google-Smtp-Source: AGHT+IFp7AmTH8TIO2tgy6qwSI6AAXg2gm7ZMJzabFN85fIUNHcvqoW/3C+O2z2Ao94nNmEp0PHv
X-Received: by 2002:a05:620a:1987:b0:787:bb6b:f024 with SMTP id bm7-20020a05620a198700b00787bb6bf024mr2013296qkb.60.1709023437421;
        Tue, 27 Feb 2024 00:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023437; cv=none;
        d=google.com; s=arc-20160816;
        b=JsLe7+TQOSaSexhfDGHvero6d+w+4tT6lMmFKdJL50RnGTlQz1uJSNd0+2hNELDxTr
         Pr0SsqZqyr4ZLFDxRsaQxIEJDyILaX39E2VfIE5VwvomedCQqhl9XfsKTezK3V4jVklj
         Hv62WFNOeQcYN/TXLaF2GJ0nuk5Agz8LB36ZIXHdql5LSgiSSVWcfEkYngJPeZ3DnP22
         uEvw4QR+o/fH3deFyTVtvoVCl5cX2JtRPN9IOfnWC7DgHW33xCUYg89KW7sIhv1dHvOB
         LUbpu0Z7sxhbTBkCK6SpXxSzIU9bPSMcsPk8bfJ7eS+ewKZ5DUrA5oL/JCOa5Tb2EUKB
         WY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q16/BH7ujul6MroAh0WIw+sirhkolVXk4q/90kZo96k=;
        fh=RXKdgIG8eRfqlhOnbC/+7L3N6BxAEFVGsHRrGYnPkOU=;
        b=x7sDnr0jptAfWyToexmVdm/ehNJV/1bLpUrx0w9vKPQV4nzCT+GpG0aBtJJ6GfXbLF
         0tmqpxujbK35K8HTqNM8Ow137f1AnJdr3JXiPuOMbwPzq9up2Gug5q06ntVIr1sK6p3E
         IfVSnchHeWoEIChhzBcOSi5wgxgfChi1W0LurpDI/xCY0uXHoGWizvBxNPuJWJO7gDVv
         JwvHuuoZfCEmbkLqvttVva29I2WZ6tNptBL+G+n7RD7EhLX77KwknFbJStZb9GGodGhe
         7nvaWImDp8BLBW19ETJ/zV7MyAr6CAkwnpTBBcd87CbwK/sPHstcF4Tn33O3e/dfqOtI
         W/pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTWu26fH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020a05620a21ce00b00787b34a1448si6609565qka.158.2024.02.27.00.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:43:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTWu26fH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret2F-0000Vm-Nz; Tue, 27 Feb 2024 03:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret1u-0007rl-8K
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:41:41 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret1q-00087i-6b
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:41:37 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512d19e2cb8so5964319e87.0
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023291; x=1709628091; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q16/BH7ujul6MroAh0WIw+sirhkolVXk4q/90kZo96k=;
 b=KTWu26fHP0wTOJh9MM66SSaXjjfeNYcssJKm9OSWZHqNZAil6Qb0M/dehxehj8c7aw
 58kKBDpE2WlaB0//H9n+slMzDotrqJz3xJCRlJheSXvhU0TqfLrfsA64/FQBdcZiCC3Z
 VtQIII2+EsKFnQL8Xa9otpAG4xevwNyHbLDwBV7wccmZEARUbC9SHIduRBJeUCtpGKbG
 AoEYMg6DGVnHKD2NtKv6CelvvMCz0eAGXTg6YbcA2FjKfBm3fKfaowQtGiSON3sP9Ukx
 XTEdoajbemzwaBkF8bztuHcBE5P7nZ5bY0E2euu9DOYffvndwOxcx4vAKPmfyLS9ziZ1
 VHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023291; x=1709628091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q16/BH7ujul6MroAh0WIw+sirhkolVXk4q/90kZo96k=;
 b=ncOrJMqZBJdJgKfCCsT7CDSchSBfRXp1LhHnfh7NWE8yOZTyyDnZhAcfWupmqin10e
 sYqEUaqi8U3CIcsgUeI7Yir6oUIF3E5aLVWt1dS0QiNJ/3guoEdoBVa5Rw08yyieksV3
 TZbi5ssTFnnVKHFTdxQLKKztzf7cCm8BUCm/+ySOQb49ADRU3zZdD6tT+IAF7xjuSo+k
 2hXuvUw1LvS/ZmWj9eN3P9FYDcQFbPzhH2IuMo2EzzKFDLh5KTdlM3zxA9S73NkVo9el
 TtXhg21di2EC6z/WgVWIWmtcNKK+mzBPqj9Ycp4OJG6uCFyFQWOed6ohd1i/rht2ciru
 RkbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGqIWZsCE5h89AwI0iltTm6EiHKDGw4rgiOcrt/Q/j4Ne9KJgR2Rg9ilZYPIlsZV5YdtArNWt0ti4dbt4dOYhCVbU9
X-Gm-Message-State: AOJu0YwSAgU9DVAROeUTvAPQG87zIV8zmauQTVT8mKR/b9DxwmqmF92W
 p6i5Z0r+bCHPBp7UFliqUnZfH/4DeBRv7yl0KTZV7oEOPHa8CNieWWHz3RnCdz8=
X-Received: by 2002:ac2:424a:0:b0:512:8ac0:1f76 with SMTP id
 m10-20020ac2424a000000b005128ac01f76mr4813228lfl.66.1709023291132; 
 Tue, 27 Feb 2024 00:41:31 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 c18-20020ac24152000000b00512ab050435sm1121123lfi.100.2024.02.27.00.41.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:41:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PULL 16/30] hw/ppc/pseries: do not require CONFIG_USB
Date: Tue, 27 Feb 2024 09:39:32 +0100
Message-ID: <20240227083948.5427-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U2WyawywDMkT

From: Paolo Bonzini <pbonzini@redhat.com>

With --without-default-devices it is possible to build a binary that
does not include any USB host controller and therefore that does not
include the code guarded by CONFIG_USB.  While the simpler creation
functions such as usb_create_simple can be inlined, this is not true
of usb_bus_find().  Remove it, replacing it with a search of the single
USB bus on the machine.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240223124406.234509-8-pbonzini@redhat.com>
[PMD: Fixed style]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr.c | 4 +++-
 hw/ppc/Kconfig | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d1c6d70d8d..55263f0815 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3024,8 +3024,10 @@ static void spapr_machine_init(MachineState *machine)
         }
 
         if (has_vga) {
-            USBBus *usb_bus = usb_bus_find(-1);
+            USBBus *usb_bus;
 
+            usb_bus = USB_BUS(object_resolve_type_unambiguous(TYPE_USB_BUS,
+                                                              &error_abort));
             usb_create_simple(usb_bus, "usb-kbd");
             usb_create_simple(usb_bus, "usb-mouse");
         }
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index c5aeb6b3f2..b664d0eb37 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -1,5 +1,6 @@
 config PSERIES
     bool
+    imply USB_OHCI_PCI
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VIRTIO_VGA
-- 
2.41.0

