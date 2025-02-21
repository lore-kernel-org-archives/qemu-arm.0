Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp328060njc;
        Fri, 21 Feb 2025 06:36:52 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWm6zaPFBxQc6/o0Cp8BgpnJVoEQXgliK31Xdfcd9ERW1/ynoYUfu/U2dcFRYSH4OGeYPJM/sMlWbwL1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEHQS8ZllDLW/7KprrdSuD99ZY8AvZKzR5EAZyte3VeOhr4WDFLKj71BGBQxYD6sISmENJs
X-Received: by 2002:a05:6214:dca:b0:6e6:6c39:cb71 with SMTP id 6a1803df08f44-6e6ae9c9e75mr48070266d6.45.1740148612225;
        Fri, 21 Feb 2025 06:36:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740148612; cv=pass;
        d=google.com; s=arc-20240605;
        b=ENS2XlKhnQDRzW/FwsFFIgi7hapOVMz1MPoLpIgd3VjQEsI6ZhJt6WCvelnZxF+YmO
         muame/44+TTjjABk23lhTV1B4lly/TysG0mlkVew/31X+xoMmIs8SszYjWX5QS1BaeR3
         gkxLOpMxJ/YbGbi7tLhalZ3KYG1OcRv8lSf20HfA6wgiSTREGlRQfHtzQRgkxSMKuBQs
         zKDJf69xcpYhfp3H3IkwC4of+md2l7hoqQRyxvaX37+81J+v/L34juHd5gakzQcyi8J8
         4SF8ysDA+0G00Vn9zSsJYhPe5Bj0YXkLDPRfVW359I1Jc+Gb8VdpP7DpCBjVxOwD9P1t
         uORw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=suKDqr8iP2bfgTwKgM43SphGAz8Hd6m/7/O6Vx6n7PU=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=OjmZAPHuwISGUcWPmy6WnVdudzEMD8S3uMMmXIa3yswNU6F24IQlV0CMbElAhy86Ye
         oMGQ3EzHciqWq/cn9WzfX5RqmByQ5O8Vhei5T5EwJgXgTSPsdsbAxXmmVlcJXdO4Euk0
         sBvAKWw3vQLRrh0sBUQcuVp7RFUq2VEFJD0Z2EcwOTyXZLTIft2qYzVFa4nST8tGlby0
         cfQVG2s4qsV7wqZ0nUer59eRMWSTq/aXLhIB82ft2Vf7XvAWS8WbT6bB8yvLoQCvJdcm
         EJIAFomeOyesuTW5heMjbEOvJWCGAkVjT8eLib8O2qMvDQC8DuEjaGJEaeg7J1YuFSyX
         sIKQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=k3aSV6eQ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525924-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525924-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-525924-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d7347ebsi167019226d6.76.2025.02.21.06.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-525924-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=k3aSV6eQ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525924-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525924-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4426F17AEC1
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 14:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BB72135DE;
	Fri, 21 Feb 2025 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3aSV6eQ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7163321018F
	for <linux-kernel@vger.kernel.org>; Fri, 21 Feb 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148536; cv=none; b=KRsUK5sAVRGpKarosXh+C3GNJC1k3EBSZwXz/8+fTcqccVXkFCq9Zul8EP77/GXw6RzxEGfvyjs165wdSfipCJFLM0uzd2sNUjll7uoMSajjyy7ah1sw+xbb2QLXm0XKJOrt2rcAkwFhp/htQoGyxPEtTbhc2jA3jIRmuYQsfeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148536; c=relaxed/simple;
	bh=WNgUSU0OrqFnvTXh8PzzTv6ghTQeysRMH1deXYrrJ9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=li2l5zVOto0NQ4EMSgcHVq0g0IGKQob0yBYcnM5HbCf+iBwCTvUbn9AXX1cHRynelpeiVBhfVCvalbZ10d3qqIAD7wcWGbIipxrglIO2REaUkgV/WHbN2/q9dpck8B0iVm4i2hyfDo4v/yYoLhPLd9xmwfd9hPVElqIvkjEE8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3aSV6eQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9942BC4AF0B;
	Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740148535;
	bh=WNgUSU0OrqFnvTXh8PzzTv6ghTQeysRMH1deXYrrJ9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k3aSV6eQBcdel1uaTYsqdAzZg53CxDtf/ggXqNM2fCOrOFXs9IxheY9kYUwgoUktW
	 5vSQAB3kD2Yuzib4dJVN8GC2ZruGrS6SDXOF20SEkV6/YHQwGVtS4XrcjtFYym3VQ5
	 YTkQe5vnXFUKi2uP5VWTSdkgQxwT2FqkasFOHKXQ7ODUuLMTnoWuiKNlgovVjzCbwF
	 A0t8CpsI/9/lkPtm9oSQj6Myp4veIA/vsMZLPllUlQQ+KfLMPb+Yyc4z6EwR8fmLHU
	 YfJzQphtNLlZErAIiVqjgaaGMWb7lG2/kvbYsrwHiH8lbYVDO2kyUfdXJTkl8Iigqu
	 FWPgRX0qX34WQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tlU7m-00000002jDz-39BU;
	Fri, 21 Feb 2025 15:35:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/14] acpi/generic_event_device: Update GHES migration to cover hest addr
Date: Fri, 21 Feb 2025 15:35:16 +0100
Message-ID: <f771a4766ed29483f0be0e68741ca07b010ad5ce.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: LMLg2U0/7Wva

The GHES migration logic should now support HEST table location too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index c85d97ca3776..5346cae573b7 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -386,6 +386,34 @@ static const VMStateDescription vmstate_ghes_state = {
     }
 };
 
+static const VMStateDescription vmstate_hest = {
+    .name = "acpi-hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(hest_addr_le, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static bool hest_needed(void *opaque)
+{
+    AcpiGedState *s = opaque;
+    return s->ghes_state.hest_addr_le;
+}
+
+static const VMStateDescription vmstate_hest_state = {
+    .name = "acpi-ged/hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = hest_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
+                       vmstate_hest, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
@@ -398,6 +426,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_hest_state,
         NULL
     }
 };
-- 
2.48.1

