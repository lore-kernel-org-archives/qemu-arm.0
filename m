Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2421950njc;
        Thu, 12 Jun 2025 08:19:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaYuCUlA0Jwfs5XEeayI2DvII8KDyZOSZEw9H/z+wN69zfjpUvjH3jRQlY5ZhO3QeikjFzcrlL9j85HA==@linaro.org
X-Google-Smtp-Source: AGHT+IEvEKkWxv8YLzZmZEUlu1hKvlZt44EynczrhlL4sSBSI5jTNWgfgD50wVch4+1MmV6Yd7cI
X-Received: by 2002:a05:620a:470c:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d3a884dc18mr1270833885a.25.1749741578357;
        Thu, 12 Jun 2025 08:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749741578; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbIhiJjR2y564L1f45cFnVFv4OZxk/DdBVNm6/V+AXsH2jGlVzEa2Yn+4EyNkztney
         ylndabO2ghr4uYWTEIhG6aRhZx3sF6amZYqjzQQH28QeH95oopNZCJIS1uAjJfRW7UF0
         HSo6LBCsk2de313GFDZbXtBRk9w1OmiaBfLWe28zbsQBBkjGqBxNoX/4fQkteyEsQIWg
         ILQvOCpuRfIXjTb1txVt7uU7OzvP6vinBJ83hRtTiv3T74qM4LGBX92Fdt//Vmkf1Ynf
         WMhgxTJRhStjfRM4NO5lRk5ET4p5V6gm83yxqftal6WgtFVqKmigP+0Kme+RZi49tdwo
         afcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gEvWbZM+OWcWhMtlGX8WtuVE4d5JOb4gyAoPZuS43bE=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=Kg9EohWf6++yuBsTsuSQJr9z+bKuyPA6gp2w/mgLAddqWr3yZ6cGjobzfljabJdwvH
         GBvAK9bJ/K13bZMt8Qo5IWahbTEZcVYfj/JoLpUMhhOQVVz+79ifOygnfXcXLcRptUUM
         dfXTFObIHsXdiGP56UcHi2RaLFnFir6g5FA2avOcQZAIB+LNXAtaxU7z+xDoZuN1NV7K
         tGzenSTK7OaP6JSso0ZPkg91V/CdHSFA33YbZ8k1r5l0LELv5C5MmtgAl/7tAKQe+th2
         xLxH1D1ob+3+C/HbaAGTWJnxZaRMyPMGrODITYdDDMq3T1BsitFDsm3sX31DpTgVRoP1
         iKKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=O0XzS4Ss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ece91csi92156985a.299.2025.06.12.08.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 08:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=O0XzS4Ss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPjgx-0003Qw-60; Thu, 12 Jun 2025 11:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgm-0002ur-O4; Thu, 12 Jun 2025 11:18:00 -0400
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgk-0006ic-Ej; Thu, 12 Jun 2025 11:18:00 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9800C4A7C3;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693B1C19421;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749741469;
 bh=XDJZhmjHPDXPg7og3rQDpluO+ZElZEtkFB7TOHBZ6B8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O0XzS4Ss2eW7Ykyf+R9NN1+Wd7takcs7fLioxh5YnuBURZSy6NpMjPzMXIevf/s7E
 82WxLzAtxGHbm0Vq5p0e7J7hGOUZipnFUVE4m+zaeVVhjTBVPhXV2I5bLkM3pfUUSe
 bt9LP4dUmbc0fUT9Blqf1Cz5VOakW427iRs5wgGo0rlvaxeyjBkK0rwzHNqB0TWqi2
 5TCa0/EsoaiKs2cgcQgBDAhBxSuinKqL3DmkREcfrsJLxk16X2VhptFzBWO+keFnGD
 VtWLv0uRpZA2QCF7AdlAaPldounV3XuvUncXSsBjW5Zs/hkuLLTmydIjMppuINM1jQ
 j7MuiSjP5BvxQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgZ-00000005EwE-2cjy; Thu, 12 Jun 2025 17:17:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Ani Sinha" <anisinha@redhat.com>, "Dongjiu Geng" <gengdongjiu1@gmail.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 "Yanan Wang" <wangyanan55@huawei.com>, "Zhao Liu" <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 (RESEND) 17/20] acpi/generic_event_device.c: enable
 use_hest_addr for QEMU 10.x
Date: Thu, 12 Jun 2025 17:17:41 +0200
Message-ID: <9431b499f5902343652fea59c8612740eb41884c.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c0a:e001:78e:0:1991:8:25;
 envelope-from=mchehab+huawei@kernel.org; helo=sea.source.kernel.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: G2LSET6WIcVl

Now that we have everything in place, enable using HEST GPA
instead of etc/hardware_errors GPA.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 620a1e0d6b01..e9b344ef3e15 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -332,7 +332,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
     DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
-                     ghes_state.use_hest_addr, false),
+                     ghes_state.use_hest_addr, true),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
-- 
2.49.0

