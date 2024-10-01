Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp117580njl;
        Tue, 1 Oct 2024 04:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXIpQzw/KVuDcYtpLXOPM44xjlTlVGU+dRo2eY68ajYgOul+LhxF6bBooZOXfd3FLoJC5M+uSscExExhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFjngN9PSKrES6RjcYr+hbW3HNv9+H4Ee2RpLR99VS880G3RSO6lYxtVC7v4ZOnBZxBAxBy
X-Received: by 2002:a05:620a:460e:b0:7a9:af5b:6921 with SMTP id af79cd13be357-7ae378301ecmr2558187585a.21.1727783002662;
        Tue, 01 Oct 2024 04:43:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727783002; cv=pass;
        d=google.com; s=arc-20240605;
        b=D6IsSVMki4yHzjcPlyVrrxCN4eON124uM0FBiWWNAZ3slGQjgxptZqxaGPwL0YujTV
         4ghn37e01iU+T33L5KJTZvMDEYiGvXr0gv3Bm6JBRwQxfo4joTxUSJWmChLhFuwvo3Jo
         aTNiGRNfEPCQmrdiep/MqkV9V4/3fstmqXhTV3/kXepoysNQWe2uCpTB2LzfHLKVJxCA
         KUl8lzIFIuiafIA5DvH4BFsIifXmDbJuUAnP3hkGTyCVVOI2C5rtFgs1P8CjX+YSH2sz
         HzhuJR4OEGgESULa2DDD2bEE+alyjh40uSPLZmqfeY9xwDdI+voHgCgKPIaYDwACYsA9
         0YxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=V+RHSnFjlVo50eCYAFANAK850lZ/XM8NAwKMjSN8SLY=;
        fh=xxPSr9kpkEU164eLNm+WXK5r/lnMd8iKQzURS9akT/4=;
        b=VZ6Kq6YxWBzY4+uFYnWzdeVtBZgfrJl7YdZKErcsuic49XzWfouYcjkstWvQturl31
         30JErR8rG2BmCUq8JAuI04lOrNVUH1aVe3QAqSj0e/SWabMNu4i/6XSjJL3a634SUzFS
         aNKRD9AsuTZXx4/TXNpzujHIdGLLqhx1JlIBYta76ziNVDf7mIU/30ux5uS6+JoXGA3j
         1si2MiniIW9A4HgNHLS9pWpxPUuedjp16czWRP4Npo1wJwPtxnKL7bcodY2axboRp2jt
         W4QZQTb1f22o/esitEICLpKf8/p2vrSWKFwBsXwDOWEM3OOY3wKSopllTT3o1/CL1haI
         G6zA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=l9HB2I3s;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345811-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345811-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345811-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7ae3789e832si1037584085a.700.2024.10.01.04.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345811-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=l9HB2I3s;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345811-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345811-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1601C233AC
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 11:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325FA1BFE17;
	Tue,  1 Oct 2024 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9HB2I3s"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5E1BF804
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782997; cv=none; b=OgQ9j4iGyfktPZK1FElVnoxs3/IPF0AQCEnA6JjsdAUjnMovgS1pNrzwivMCZCZ9pCLq0aZ8T7gYrJShG/+hCrZlcsDouH1YKK3z/aO3IYAAlO9XV3eE9GRMaV+ktgiwEciBjlkSbZ1E/Xkm4chSUSLvOzZcfllDoSozy5Zz3eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782997; c=relaxed/simple;
	bh=WMzyqBucezOMnHHpXmRsw3gT5aZdm3L5sQnhRw37Wa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=higqeMlmWdaOgDyWHPN9cKIFr6N3wijmTh01Wip1jbR3WzAtVs16+0Pvg15Nrwe6n3f5fl87p3pZVGLySLqQpScrfFiN7u5p/vnjgKtKt+qbwSi6CQG+NevPi/BId4UBq6Wr9FS2zfrnvCui6Dlj/3W0v7rb4fxfIEobFlJ5ppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9HB2I3s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91463C4AF0C;
	Tue,  1 Oct 2024 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782996;
	bh=WMzyqBucezOMnHHpXmRsw3gT5aZdm3L5sQnhRw37Wa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l9HB2I3sX7gMOBxj8YsketMDNA2hnt0ErMnaMT1PMwbPckXgZ7gWjvJ79Lhw9GhnO
	 eKy5e7XczvQoy5g+0XeBX42hJ2JvsgqUmEhOcsUnYHxgPmfFyLkt7RLBpdtRoWQsyL
	 89CnC6h2LftQHKRCQJtoJSJDCaVQJ3FPmbR7u0+wxHw55xRQQdiAI75NtQLyOdCseW
	 vGAI1sQ6ruEDUhK/1AHRF8Q/BFyb+zCB6u5sVEwgBf2OXzZyUvM+U5SKQH1mX4lI4Z
	 dclhZLX8Ti8io5JKhAX6zy23Q+mp+Iaw6wXpu1JqEKgt66NyRyBTzf/aSZ14t+mU7H
	 MP/HhCKke95Jg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1svbHd-0000000Add4-3WEp;
	Tue, 01 Oct 2024 13:43:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH RFC 4/5] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Tue,  1 Oct 2024 13:42:49 +0200
Message-ID: <176693e011a411db92be9e912bfc4a9da0e664b7.1727782588.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727782588.git.mchehab+huawei@kernel.org>
References: <cover.1727782588.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: gkkgiqp3ca+6

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 9.2 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/generic_event_device.c | 1 +
 hw/acpi/ghes.c                 | 2 +-
 hw/core/machine.c              | 4 +++-
 include/hw/acpi/ghes.h         | 1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 49ca1fb8e84a..c4677c9ae6b4 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.hest_lookup, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 313a6e453af6..86bad865168c 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -513,7 +513,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    if (!ags->hest_addr_le) {
+    if (!ags->hest_lookup) {
         get_ghes_offsets(le64_to_cpu(ags->hw_error_le),
                          &cper_addr, &read_ack_register_addr);
     } else {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index adaba17ebac1..b58afe48aa71 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,7 +34,9 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "audio/audio.h"
 
-GlobalProperty hw_compat_9_1[] = {};
+GlobalProperty hw_compat_9_1[] = {
+    {"x-has-hest-addr", "false"},
+};
 const size_t hw_compat_9_1_len = G_N_ELEMENTS(hw_compat_9_1);
 
 GlobalProperty hw_compat_9_0[] = {
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index a07c30ef13b7..040d6ee366b2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -61,6 +61,7 @@ typedef struct AcpiGhesState {
     uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
+    bool hest_lookup; /* True if HEST address is present */
 } AcpiGhesState;
 
 /*
-- 
2.46.1

