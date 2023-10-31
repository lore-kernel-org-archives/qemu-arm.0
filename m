Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp25827ejb;
        Mon, 30 Oct 2023 21:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVM+fO8dAaTK4kY2Xfz+TWUprSvlJJRMvYMgKOsqnA791bkhabjorBe/SHRG1sMMl7wEtL
X-Received: by 2002:a05:620a:22a8:b0:77a:61a:605c with SMTP id p8-20020a05620a22a800b0077a061a605cmr8253109qkh.20.1698724972084;
        Mon, 30 Oct 2023 21:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698724972; cv=none;
        d=google.com; s=arc-20160816;
        b=F34myxXuTvCn/zJ91CIxjwBXQdRSuajTWKfJdssJ/snYamXMYOd1jp5HHrNEpx98vA
         vBKueSuAfk/kRCELKqCNs8EHcRXeCq91CgcFOySoNFy5P+D02GDeUSJmZdiXjd42IxGk
         HR+8RNnFIWJydl49EE1HyJHl/6yUAGSqdI6Smemqu0Jwc1ftLBU7m3y9eNvpcqz/vWPY
         Qn3Q+GH7bPhQamSQigyKVlHekKy0Yw+10SFAeobyT2Y+vQJoqcYQfHlRWbJh6PQAF8Z3
         TsWl3WrwQGLUqXa17YFtjNcLW5FLOVb8y32JKw5MZR+zQlTGMnB/uvN7y3TWvtcjR/tT
         zaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=5MLsZ1r4XhrrLbocK2W7a6pjx8rz0UhGgNKUhHQkvE4=;
        fh=/6Z6G8Ct9GegS2ISYRgEVL2Mw6gwL7nfJicDEd0HDoY=;
        b=O4UOuLklJR2sEntYTc6mSMvbLJlZML79i//awLiGN26XZeAZWykRH3Mn6CP9cZmClW
         xo7QUIHsLgZL+ZUepQmXjUPH+VwT6VPXhAd27UL2YVtRI2YXtKVUJzlMaY032MrJWNZm
         AHnMAmWr1y+kIvhBeY3cLC2Tvp9W5JcM3nexdgK5gMThHjMPvDoM+tZTG+mBUGRPU14o
         XIHChdgQB3ogU1coi0csKxnnhzIBccLYSPNszGAOi8uk+/xJQef9MaqpYw4aEPnWf/R+
         63aEGS8s7ba9CVeFrzzuck07zqnRMb+feAWVZI67BQ6KFW3IxZfen+I7pyM4tjmgitaY
         Gu3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020a05620a294600b007743391acf0si372612qkp.324.2023.10.30.21.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 21:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxfw0-0001OY-3o; Tue, 31 Oct 2023 00:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qxfvn-0001LS-1D; Tue, 31 Oct 2023 00:00:46 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qxfvj-0005Fb-16; Tue, 31 Oct 2023 00:00:41 -0400
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5b92b670f2aso3963928a12.2; 
 Mon, 30 Oct 2023 21:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698724835; x=1699329635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MLsZ1r4XhrrLbocK2W7a6pjx8rz0UhGgNKUhHQkvE4=;
 b=QCEBr1gaeKmpDsrhG6hSKcEIjp5qdh1Lv/CRvt6MVYgtUyrbqSiGtQweFZK+Q57a1p
 O+D+C7wKLn51iLLNWD+alnruv82r+sHrHAOjvacX+iHAo8eZkdor2+iBpUOyjkLzgamH
 +Nq4xpWDSHZped0qyQBtG7nDFI0s+SLPQ4Lj3oLiX5m+pDjfhJUsnX+Mdqh1U1KV1kk0
 ZgkolmRb0+k4Tx/A7JKNnKTXpzOCJkZ6EHzvDX8tJu6kXRHiJ+E6e/SAu2jx4rE41lrf
 sqj4XW7GPBm8VMGw1nZsNhxSI9KcZmmbeSo8Z5Thgaa2oA0tyXfQdTZRt+qtELZhyYeY
 J/Bg==
X-Gm-Message-State: AOJu0YxNVsd1V0maK+WteHQ4Rxw2PGLR8vjrAuxF4G3hG5vGRpJXAabS
 pCKax9OSBO4Mlzx4sgEvIqKBl1bWthRqTQ==
X-Received: by 2002:a05:6300:8083:b0:16b:d137:dfb3 with SMTP id
 ap3-20020a056300808300b0016bd137dfb3mr15130337pzc.59.1698724835729; 
 Mon, 30 Oct 2023 21:00:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c02:7b37:49a8:6e6e:cee6:cee7])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a170902f54400b001bbfa86ca3bsm257975plf.78.2023.10.30.21.00.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 Oct 2023 21:00:35 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Stefan Berger <stefanb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH v4 07/14] hw/arm/virt: connect TPM to platform bus
Date: Mon, 30 Oct 2023 21:00:10 -0700
Message-ID: <20231031040021.65582-8-j@getutm.app>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031040021.65582-1-j@getutm.app>
References: <20231031040021.65582-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.181; envelope-from=osy86dev@gmail.com;
 helo=mail-pg1-f181.google.com
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
X-TUID: 2z0bg9oWpign

Signed-off-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
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

