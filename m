Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp65228dlb;
        Tue, 1 Oct 2024 00:05:44 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV3mXk/2sEGkf/kMfoMkgxuxI2MefZKCLXw9JcQgZYM94R5iRO+rEG+gV45eKmMUG0RGzysVWJnXKI6lw==@linaro.org
X-Google-Smtp-Source: AGHT+IFTqkfRgBxyH9bktgRNLqE3X5vkHdsd97LGv97f3Qn1zJILicIU45kj0R603B1hnYK9LUCT
X-Received: by 2002:a17:907:1ca2:b0:a90:3498:93b2 with SMTP id a640c23a62f3a-a93c48e7facmr1847216966b.1.1727766344115;
        Tue, 01 Oct 2024 00:05:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766344; cv=pass;
        d=google.com; s=arc-20240605;
        b=NKnZ92dTbB7wVDdCZ/35fWs6mzS0DmGlymO83ezEThbrDqu9dSOOxATb5gHr0unyDj
         kN5ULNfqeIdzoDfqJq1SAq+KMITQzhwYzpEAkQVqaOP83umlLrqFxbYHVN21suRhDVtF
         a+mIDkZ1KhD+xkLM+cFD+bZ5bJ8LXwD0mlbAJ1B8YFFlFCIrZxSWQkrS9JFTLH9XBzzS
         CwJLmvOourYG2A5oIYPo3/fHqI6tCVuyfCpYrti7SKL/jp+yPWN79WYY4GVGwTWjg+CE
         D8SfMp1GkWz+GnSYkEI+MTWZcp0n2fPjPXDIVLFN/gKZO9NUP44i0orxRhYLZr8/Dm+d
         CZWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=OkHunMEwOrKhQe0CrhF0Ic7M8Seq3PBGd7IH09xf5j8=;
        fh=rzGDMRJFBBrjbOaW7dLpUOdm+9c++WP8RCbD+hTQXmk=;
        b=J1y6uc6+HKi7Rqal/mTMAV+MxkqycwUj7y9M3IMiV8Ap2Qhzxg3hB0Zi4y1OOcuL4c
         PKBHjf/q2euLMYhqo+mAMJl7Xe7Kyjv8GppIH9FxPooqlF+jpyzbERe/H8gOnaer9kqN
         SA05nh5Dci0MpmsOlVMy9eu3gZI5E50JM3djkXplqlcmpu5k3Zxx5JH1a5ye0Ic184nN
         9a6O8ccsJL0ABaqGIF8aWOMQHQCJEzVJfHuz/Z5NcBTE4wWrw1v84i2lidnUvks/p+Tc
         TdjcOZi9By3UhBk8jBrtDmhDtEzJP4Fct+D56c66JV24/06LzsjHJX3HysWVKWrjtWSk
         Th/w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EX1PUIHs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345362-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345362-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345362-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a93c29e6e32si693386166b.537.2024.10.01.00.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345362-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EX1PUIHs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345362-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345362-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A868C1F21AD5
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA131BE851;
	Tue,  1 Oct 2024 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EX1PUIHs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D41BD514
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766252; cv=none; b=NxgCnJjJGY2GtWtS5BZfUMUMWfqndhYrRG8g6ECkY0jIZPSYCENpt2Tzp0W5Ud08DPxb2+BmSgbAZSf+w1KKCFy2E3DGI2T7JmQNdi+GV4Li6e/9vAOVVxcVptjbBUK5R8cV+dk2BhEhF60pZfEBmFK6z8OLQy/S9HRHfMbIDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766252; c=relaxed/simple;
	bh=R6b9iFm+J5ePDJRMa4bxU4gGLlv0rrR7/FbDw9oeAsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcKuqwBMWRhkPGY1pf6p3VLZQ47a/Uf5mSzR/fl59JhIIjM8vgkJUjJ/anuw2KNyHYQ47gjVwtvwJb8oZLAohfEUMOz5DayJOCUmc+Ix1XYTHx8TT+4Irji1KeVjEw4GsWHqyD0RRgZE1CuuCMhZzffZF37Ocmx4BVIc0mfnc8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EX1PUIHs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D2AC4CED9;
	Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766252;
	bh=R6b9iFm+J5ePDJRMa4bxU4gGLlv0rrR7/FbDw9oeAsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EX1PUIHs8Wj7ai8ewOZd93EJpDrIdtKs5j34mVK7Q7mNpRDmvKfr6b1nPM4G6qdAv
	 9JzaHlHvP0awzimjl+ipvCRTV484tnCE5j3PwXjTMQ5fVDIQUnOX2rA1V37vQKwF+4
	 NCnhKu3QhClRRtzmcy0+QWMvNTj+on+UkJnMf2dbYv3WhUNn8TzjqX0Mqe/ZLeh6GH
	 0f7SXs58+2oLxI5oOG52IH+8Ydayi9JhFaH9sWmlv2JrxJBg47Nl6+l4tVRXhqO6Y1
	 vjL+UPq5++zj+haHVeQ3hmu7lORoiLr/bikWmD6ONV/38aKfKZVu724AthPeLKhsMj
	 KVSBYSRXGhcIA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V1G-3kar;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 14/15] acpi/ghes: better name the offset of the hardware error firmware
Date: Tue,  1 Oct 2024 09:03:51 +0200
Message-ID: <b74975e46f321d5e7e4c3f566d1d8827c83f33e7.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: 5E7hYqdeq2s5

The hardware error firmware is where HEST error structures are
stored. Those can be GHESv2, but they can also be other types.

Better name the location of the hardware error.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/generic_event_device.c | 4 ++--
 hw/acpi/ghes.c                 | 4 ++--
 include/hw/acpi/ghes.h         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 15b4c3ebbf24..d4dbfb45e181 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -346,7 +346,7 @@ static const VMStateDescription vmstate_ghes = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
+        VMSTATE_UINT64(hw_error_le, AcpiGhesState),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -354,7 +354,7 @@ static const VMStateDescription vmstate_ghes = {
 static bool ghes_needed(void *opaque)
 {
     AcpiGedState *s = opaque;
-    return s->ghes_state.ghes_addr_le;
+    return s->ghes_state.hw_error_le;
 }
 
 static const VMStateDescription vmstate_ghes_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 3d03506fdaf8..8b3292be07e7 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -379,7 +379,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
 
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
     ags->present = true;
 }
@@ -430,7 +430,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    get_ghes_offsets(le64_to_cpu(ags->ghes_addr_le),
+    get_ghes_offsets(le64_to_cpu(ags->hw_error_le),
                      &cper_addr, &read_ack_register_addr);
 
     if (!cper_addr) {
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 051a9322141f..e47ffacbb5c9 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -58,7 +58,7 @@ enum AcpiGhesNotifyType {
 };
 
 typedef struct AcpiGhesState {
-    uint64_t ghes_addr_le;
+    uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
-- 
2.46.0

