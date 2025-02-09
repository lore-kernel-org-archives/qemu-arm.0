Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1190960njb;
        Sat, 8 Feb 2025 19:33:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9WE4IgCtPV81Vk7nOFM8Nc44Yg/ymlIW3FwOegahOPFEa8MQagt31ev+ADpRdJujMJWfec0bd2TOazQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFYRynnjsVN5SLHk8C9AilMuAU3CA1NcDEgpzafaJt7wDrVN03ZS/hgJr8yJG3i4UIAFwzl
X-Received: by 2002:ad4:5f89:0:b0:6e4:3c52:d671 with SMTP id 6a1803df08f44-6e4455eda4cmr128969106d6.14.1739071999422;
        Sat, 08 Feb 2025 19:33:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739071999; cv=none;
        d=google.com; s=arc-20240605;
        b=b5eXMAcPkWnPT9yhjtTEfP9uxLgy7ggLVjvnZCl/ESMUdulObEbai70j0vPBmNaUw+
         yiFGdfCe3Mmta3axunfyXXrr3kUlZoSsChWVopKQRAFDVBmzhtdQqrOD2B7xdQVAbh+q
         rSpe7O+zYoYaLnGTK505T91fPf0EQdJtMpS+bq1GyvFMKDDLbLvnSYZ+A3STUMhJ1568
         BKmrkqN4FEAlDN5NwtR8SBCy7MWChSw9Z+kpGnbAM5p1/er8N8P8ZxpG9UJ9Y+auQikI
         T0Q8B2XyIo5/+5C4YoD3hw86T1X1Zh6s539+r8j4jBPx6JFX86jtiRQmoVKFgsHHrEGR
         eC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=k7OEQ0C/IMpfB7/RyoJKPupat+6wP+NvcWA+UarJ2BQ=;
        fh=EuvJD2zlpv5CVcDs9U/QVEHc6+jnnUNPE2R6NV2hhig=;
        b=ALWa0R5ambHU8m3EFeZmBbH4dOIwJnEE7pmtzECiGbIVpZqGdL/GMrER2/DKjOqply
         cdzHHFTSUd1oKfBvnqB63+xRGZeU4PaLc7XjFRo46KmaVz5z+XXebM+lcpJjDFYFrsQL
         yPLL8p4r5Yggd1wuPyFU4Hbe3KbdYYBduhSF+G3OioEZvk5ocO2BqWIPwEMyzZdSj/a1
         vXe2Dbp9x0AJiM0nmwRq7cCP1HLJszeyTnXV2DVpsLKo0utIe6wT7FkE8y0aF3VG/8fy
         SZ3RflUF/5Hc8hpnLOC1rusXeqQX7v1yxObOtHsuPkSl3TxFI4kOXlPyhFU5r5tWZZsD
         ymuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=getutm.app
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e44cb479e1si38568026d6.350.2025.02.08.19.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2025 19:33:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=getutm.app
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgy42-0005rB-4Y; Sat, 08 Feb 2025 22:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1tgy3t-0005pT-7j; Sat, 08 Feb 2025 22:32:49 -0500
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1tgy3r-0001QN-0N; Sat, 08 Feb 2025 22:32:48 -0500
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fa40c0bab2so2016040a91.0; 
 Sat, 08 Feb 2025 19:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071964; x=1739676764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7OEQ0C/IMpfB7/RyoJKPupat+6wP+NvcWA+UarJ2BQ=;
 b=Kj2WFS4FrT1P2lnXkUMfo+DvrtnWUcUWGLsvynPNWTPwT2xGE+XIX2MQQxziYC/HXP
 Rd+1Y7puFU+kpuqW+FBKruBhIMPZTjPG4lPA9V+aXzy9ZTteI8rqEbPvnJ14TnqsIWhy
 pMm5hGLvYXkzQTkf0MNgaHnzMn+fr9g3Lai7O92OCq9p3EaqfgFUWoYk/jZ7fnsn6Vgl
 LGLsK8hLX6TDh0yoB5ycwBKOkQH7ydLcfWArir794FbxmpqCqZFLIQaZZLfFJa+rdEim
 UvJTimGyyWOzlBpEqKTdtl3s4p3kqFz00H+6YlG5+igkggp5KlNrs+O/rXqt7VIr0jIp
 tefA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIZfcbEuiqWmQPVNPxpmRPT3aUJmaXcF9VF6hN9vsZrivJunUxMYfA5yRJQuePY/DHIeGcob4mlw==@nongnu.org
X-Gm-Message-State: AOJu0YwlDcSXnx4oQ0HstgCWDdahkUyWnUo6T06sQAx2GB3J0jSeBxUT
 Hz/rB04uQgT7MkOYhY/6mc+gDn6j5NR/lVSx09DAhm69MF56FP8L6iCKeenh
X-Gm-Gg: ASbGncsl40KoSg9Zd0H/bgL7F5Tt5Csoxs7GOlb0EzEvHomjc5p7yoWtfAtSp9k4tNx
 nL3O0O10cEYteDxCvK3YhDHgDwbcXLNid8iIgZd/Nq892n8odQQGw7yoReZ+KeT/TURevl5lqS2
 5edrAFmihsbelCkL+d7AcONkenPaL9VN5sFdfgiVokA8t03RhnM/zfqHrt5jVxdRPBYUZTD4kix
 /L+0ck4A8F6UDlmSHrRXdqpuoUFiDg81rV68sj1WbbqAgqyyBijJyj4bpMzeP8ocpdlpCByLwuh
 LTwq4dNpzUE6EOpa7OzykSl3gdoorWj4P3PaCEZy2DKWDz4=
X-Received: by 2002:a05:6a20:6f07:b0:1db:e0d7:675c with SMTP id
 adf61e73a8af0-1ee03a42a1bmr18354010637.13.1739071964399; 
 Sat, 08 Feb 2025 19:32:44 -0800 (PST)
Received: from localhost.localdomain
 ([2607:fb90:9e97:4903:dc10:4530:8a3f:fdb6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ad5453e2366sm1333610a12.47.2025.02.08.19.32.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Feb 2025 19:32:44 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH RFC 4/4] hw/arm/virt: enable VGA
Date: Sat,  8 Feb 2025 19:32:33 -0800
Message-ID: <20250209033233.53853-5-j@getutm.app>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20250209033233.53853-1-j@getutm.app>
References: <20250209033233.53853-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.46; envelope-from=osy86dev@gmail.com;
 helo=mail-pj1-f46.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.07, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EEefOmS23RPO

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 256013ca80..6818c54787 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -11,6 +11,7 @@ config ARM_VIRT
     imply TPM_TIS_I2C
     imply NVDIMM
     imply IOMMUFD
+    imply VIRTIO_VGA
     select ARM_GIC
     select ACPI
     select ARM_SMMUV3
-- 
2.41.0

