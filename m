Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1175601ejc;
        Sat, 28 Oct 2023 23:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLDMnNvHSVfQd9Rmnf7tYywO5AE2L4dRHwmvbVwnz76r030OwYIAAD3NKlsPxmsCYrVAHo
X-Received: by 2002:a05:6808:23d3:b0:3af:9848:1590 with SMTP id bq19-20020a05680823d300b003af98481590mr8211970oib.6.1698559552765;
        Sat, 28 Oct 2023 23:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698559552; cv=none;
        d=google.com; s=arc-20160816;
        b=rRpU36ik4/GHIQNke7k0S02zZlhTDl+cqee5SJcjbpqwAj8W/tHMGxShO64Ndf01fG
         yB7QgLJSlkbT4CE/wu6d9i3fcbaPc2MLJ4dEinAnTgOvcDPloyhJj66Raud46WrNX2y9
         eDE2gBxPM3/GNKcRIMhlpa2M41X27J5ISAwBft3SIR5Pr5Z9scIzHpF/ki7iz3chsiMD
         mVpPfc65V5pMU5mJS1mUPfSKrh+4gkDOqSgVu9E1L+OTynfwbufbVi1HvhsxfS9jkHUy
         0SQ/8LzeX9twulO7Uvi3YIq+DxUx7y/yCuE5bR4OkyITXe/3N8nCDLjzijnFw1E3XOIj
         s77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=xQzbh1AaLCWfByxDuo7US5vnREkM4rFiW0ACjFNXSwY=;
        fh=+3DJC+DkqnCskjlDp4GNeJa9suH0rB751aam4mFrL/M=;
        b=D6iB0a6pxWa7JE2PTORU76uaG5IwQveVFu+0KzLVULbCC85ld2RkCZpxt/GS2NN8Ax
         Qk2nDvsLHSHAjO5ZW5uXI74/fS39H00xdlZLtYTepCmJGPqK4ZQ2CZ/BguCrUiTPZHGK
         Zuh2lvKhkKB/hQXX+DWkaTLS9mIr7jOxn5wSlcz8R1Ft73jYT1eIPjbwJU9wz6xCNGGP
         IVHMO3ZBv8bSWeJK6T4tcLUAv1SOq0EYkmMH4KTPq0KbUID3xFPYiFv2Ow9W3m+/Gczd
         4fHy2I/iebEKN28NxHDIxzIVyONg6lrhU4V/O+qGiqRYN5aeZlB7hXXWb0WNotk9OWj7
         KXng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020ad45743000000b0066d1d01e982si3709450qvx.148.2023.10.28.23.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Oct 2023 23:05:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qwyuS-0002Fx-OM; Sun, 29 Oct 2023 02:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qwyuR-0002FL-Db; Sun, 29 Oct 2023 02:04:27 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qwyuO-0001oi-Gy; Sun, 29 Oct 2023 02:04:27 -0400
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1c5cd27b1acso30708715ad.2; 
 Sat, 28 Oct 2023 23:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698559463; x=1699164263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQzbh1AaLCWfByxDuo7US5vnREkM4rFiW0ACjFNXSwY=;
 b=oqtaUFbk9mc2PV94mWLdP8zJhgf1HNpQtf9m6ID542dVVrkM8+ccuAxpK1oqS2S4US
 /vWZQtSo3831eIcsbB9zzzo4cWg/y0xkCEbR4xRahuCs+8WDKQ0bWx+XQ0QyaE9oT930
 boz2icigngd85k1jCncyF8UQ/vadARy/5QivFhWiSFhP/TUOQov4tyTEuWMwwL3DNCHX
 N7UfvJ14t02yUXjqaJUCi6C+Mm8e3YzcocisUkwtvkg+6bjiXl6zaZH5dJH+evuZL3Wa
 F/jWmc5XGaH+NUU3v1u8+AF7nrRjzKhefBCv2qE7S7PMrYsmZ1ECjllPnKCckcPR4VOv
 Ba7Q==
X-Gm-Message-State: AOJu0YzBShTiKn02WBStUPU2Kyl3UUclISsvaPTsHsECwSQVLAosm+Oy
 RQpU2d6MGC9HTZb+UWDmbEdECpqCJodxZg==
X-Received: by 2002:a17:902:ea10:b0:1c7:2697:ec10 with SMTP id
 s16-20020a170902ea1000b001c72697ec10mr8912788plg.56.1698559462813; 
 Sat, 28 Oct 2023 23:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c02:6ead:344e:2b1:f5a5:58c6])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090341cc00b001b8943b37a5sm4019518ple.24.2023.10.28.23.04.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 28 Oct 2023 23:04:22 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH v3 07/14] hw/arm/virt: connect TPM to platform bus
Date: Sat, 28 Oct 2023 23:03:20 -0700
Message-ID: <20231029060404.71196-8-j@getutm.app>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029060404.71196-1-j@getutm.app>
References: <20231029060404.71196-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.179; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uQ0GJq5C1/VN

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 529f1c089c..f1a161b0ea 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2806,6 +2806,13 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         vms->virtio_iommu_bdf = pci_get_bdf(pdev);
         create_virtio_iommu_dt_bindings(vms);
     }
+
+#ifdef CONFIG_TPM
+    if (object_dynamic_cast(OBJECT(dev), TYPE_TPM_IF)) {
+        tpm_sysbus_plug(TPM_IF(dev), OBJECT(vms->platform_bus_dev),
+                        vms->memmap[VIRT_PLATFORM_BUS].base);
+    }
+#endif
 }
 
 static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
-- 
2.41.0

