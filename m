Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6130380lfg;
        Thu, 4 Mar 2021 02:57:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytWbjVx+WDjV4zSpmJ+1QzyflxMEjSsm3bm4DnlQkEMHP5Dm79AsmV5k/iwzcmGB0HhBWg
X-Received: by 2002:a25:240f:: with SMTP id k15mr5040910ybk.363.1614855436133;
        Thu, 04 Mar 2021 02:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614855436; cv=none;
        d=google.com; s=arc-20160816;
        b=RM+pfVo2bOnPEFeiW0cE34CLOvveKTuflv9Wwq+FQzBLIMdJPQr6fdGsmoocQ2asD8
         g7/LZsHMpnd2Lvn6jQ/smj54BqUYwJ0mcvmkWZCGMIpJRTkkL0SWPlSqPrGod/B3LOkp
         Zk5oTKHxtiuNPtBftK7xZkOJ8X/Wiq0IoFBrS0NzdcQ/t1WsSaSJ49ouExdTrQQLQsD7
         t7nuim2p2djmJlNQ587p9cCldwxobFcD84ytJzl5ECoF1eLNiUw3lpBMY7OY6kj2EkSj
         LED/2lb7f6f9MyEV0bheFh2Sx34purnJrDlGx6IF91GzfbOREHrJUQictKcc9IjuP/hk
         tcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sqi2lxbUVwBulxgeeARPptYG3Lh25t/5QdRWIosS4zA=;
        b=u/oWqJyEfGOlV+02WvEYdFzZZBpmNIhM/QHuuwK1CaAk1olr+HC5MWk8FHY9LDCbCs
         lOzgyvp9URH0bkchwoUeBb9apjyrqs0xviJ3wktPvyVvUCblKnrxlV7EqSx+1v6jnmzu
         wGYUJaRDV2qP7Y7FQ12xAVbube4xcycFMOElUoTH6mJ8MfSeTq7afVlC0S2AmNh/0Yvd
         3FeYuwjkLd5DZLOSF5ZkiwSjOuo/k4wS2W7QFzHDcHiktCE6N6EHCSBFG3p0ZTJPe4fr
         la/5Mlrt/PR6mGxWnTPCeBQU+StTpOX/p9tBOKlkruXn8T+HRouvcD+mICPu2EeWKzuR
         ujVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="C/xfN4yN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si27195205ybg.408.2021.03.04.02.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 02:57:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="C/xfN4yN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHlfP-0001pr-Cc
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 05:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleP-0000r0-Qm
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 05:56:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleO-00030d-7D
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 05:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqi2lxbUVwBulxgeeARPptYG3Lh25t/5QdRWIosS4zA=;
 b=C/xfN4yNT6BVKPngNDvH8kXAXu2a8rfccklXsPWD2YM8Yd7V3aGEU29zuFMEUJpoOgpMPj
 1P3ngmED2JfKIbqiEZUdBIWlLuqpUeQgQYCbEEtXbokZhwmFUEV2hm6FrakrmebYFk0FGA
 N63rGTDNkMQqDZNqkauqnDODpJ6dvaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-i6SSeGgtNP6m_fQbYubRQw-1; Thu, 04 Mar 2021 05:56:10 -0500
X-MC-Unique: i6SSeGgtNP6m_fQbYubRQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AACEC10059C0;
 Thu,  4 Mar 2021 10:56:08 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 584A8629DA;
 Thu,  4 Mar 2021 10:56:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] microvm: Don't open-code "etc/table-loader"
Date: Thu,  4 Mar 2021 11:55:52 +0100
Message-Id: <20210304105554.121674-3-david@redhat.com>
In-Reply-To: <20210304105554.121674-1-david@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vqVwRqcifJDZ

Let's just reuse ACPI_BUILD_LOADER_FILE.

Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/acpi-microvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 01f1945ac1..502aac0ba2 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -255,7 +255,7 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
                       ACPI_BUILD_TABLE_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.linker->cmd_blob,
-                      "etc/table-loader", ACPI_BUILD_LOADER_MAX_SIZE);
+                      ACPI_BUILD_LOADER_FILE, ACPI_BUILD_LOADER_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.rsdp,
                       ACPI_BUILD_RSDP_FILE, 0);
-- 
2.29.2

