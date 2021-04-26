Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4121601lfb;
        Mon, 26 Apr 2021 12:38:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzmusue/dAjvHRC+LZ+9E3Wqe779Uomc64F8U9oRDaYiW8kp+Hrf6OwhaI9qc5XqJc3hN4
X-Received: by 2002:a6b:3bcd:: with SMTP id i196mr16018989ioa.121.1619465901703;
        Mon, 26 Apr 2021 12:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619465901; cv=none;
        d=google.com; s=arc-20160816;
        b=tsoKPU9yGSzM3YItsYXeRyNvJAcC7mCQEyMhLzNh12kXSNV06JkTn2avNZU8G+Ahll
         wJJ9MJCQGOzf0cA2dJ3FZp/WKh1+rtmJ9V18x3TKOqUy53SIUXWCKeahbWRSQh4YN/3t
         84ngThmBWBfkLkJlU5B/ZWl7es42zk/xi207aU+EaE+6IV8Tk+NxLvXsJFZgYqtZZPZO
         3S3/ZkfWrs7BSedi9PjyJdMg3eIg6TfEqIIVFyzmyAvfvkkQ8uI/BCBMvk7bHb3F0YJH
         bq2x7U1SeamfBg4whfvsaZgiNRecIS10HEFzk5idD1kQl2qRulu/vBL0UMJsn8fBq0/E
         f70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x+XKpQxMkw2M8DAIFtIrFWfOxS/FuauQxHxUVGxBmbM=;
        b=iJR+HJW/EAmpZj/5gjJoWqmvBbY1H7xsW2juTy/gjxv5ir8MI1GOUHrEYKTkKTVA7T
         LyXZtS1032px4o3cjxCGl6ItN5B4QwrP/AQ3iyLl98UyMMKy8GrGFWPqkGaSnkaGNLSu
         VmZYeuO55jsS3z4xkqsQ1fdfAwHPVUqeKj8twt/jIdoMQ6ozmTGWc08OQ6KTP+K3XqjZ
         pPT6rofP/Vn+qZ92HgMu2iBfGQcEZLTBnkd9GaxpBJtgaKlovcNfiMebC9v/VfPijvo4
         ooi1NPsa0zCOCWlhryr0WciQCWnF7AMrNaD/tVijfGiQTtXqbXtW32NeNuWq8xVEMwmf
         3Jbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MzR7HIy6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h31si887805jav.49.2021.04.26.12.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 12:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MzR7HIy6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lb73l-0001xv-2M
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 15:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71J-0000JE-BM
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71F-00006I-85
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+XKpQxMkw2M8DAIFtIrFWfOxS/FuauQxHxUVGxBmbM=;
 b=MzR7HIy654G6I3drM2byH5eosQIumtfshm4IoGnpuu60htNsc3ElLI5MAwaQpBNDbe+Kxm
 jPfV9ecxqVVtcToDUbvY3ekPaEQ/QTXdsdjSfEv4c9BVGmlmBvZqi0L96xcnYJx4gSccMR
 cjFMEla2pMlE63cyTTmbo6pxJq4alnY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-mcuyYCp5NummqqDm83wx0w-1; Mon, 26 Apr 2021 15:35:42 -0400
X-MC-Unique: mcuyYCp5NummqqDm83wx0w-1
Received: by mail-wr1-f71.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso16052246wrf.11
 for <qemu-arm@nongnu.org>; Mon, 26 Apr 2021 12:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+XKpQxMkw2M8DAIFtIrFWfOxS/FuauQxHxUVGxBmbM=;
 b=FFxTxBzffPECZLaKBh8+ePYpYSh0dBivw7mjlfIkt+7P9PLBL1oeVL+hedGw9GxBAv
 ic+ucyjUEOB1qlLqhBu1ofyLHSFGKYnFA/fBkxPbZS6wn5snikh0dcN7e7Q/I80a9IMm
 mxuJsoQX/xdLEhVEcDHlhsXrZlZBoKtwsde6gMyQq59LRhAT3F8KIjK6VXm640omWIQw
 MdQB2G0hlPHhp1N23Mnb93wbKULWH/V6uCE4gjxDLFJSTb1rfl1z+TV1yMB+evpMne00
 8Cnps7u5SZXspfB0U5OOkmXDjhqB16O/rxoUV/lGg8ya9PWlG1YU5W1WSIElqR0IyNoL
 4egA==
X-Gm-Message-State: AOAM530+5l7bLFPVNb+OOL6JbVRhMJVo0RsRE/UTskzysZ0Qp3PXzeqZ
 AkinUm1KCs/UCNyQQGpMu2m/sZxcjm+yy8Lf/QuSX51mnDUzJtlTqVJfreN6ly54vGlfPOvjQEs
 k8vZ1Dzr58VqM
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr24807474wrj.328.1619465741716; 
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr24807460wrj.328.1619465741557; 
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t14sm1292776wrz.55.2021.04.26.12.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] hw/acpi/vmgenid: Make ACPI_VMGENID depends on FW_CFG
 Kconfig
Date: Mon, 26 Apr 2021 21:35:17 +0200
Message-Id: <20210426193520.4115528-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IxM4S5oV8M5B

The TYPE_VMGENID device depends on fw_cfg:

  $ git grep \ fw_cfg hw/acpi/vmgenid.c
  hw/acpi/vmgenid.c:128:    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE, guid->data,
  hw/acpi/vmgenid.c:131:    fw_cfg_add_file_callback(s, VMGENID_ADDR_FW_CFG_FILE, NULL, NULL, NULL,

Add the proper Kconfig dependency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/acpi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1932f66af8d..b9dc932d2a7 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -40,5 +40,6 @@ config ACPI_VMGENID
     bool
     default y
     depends on PC
+    select FW_CFG
 
 config ACPI_HW_REDUCED
-- 
2.26.3

