Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp325096njb;
        Thu, 27 Feb 2025 08:03:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCdi5J6Jr1RmQWPtOjcwxdOYbKDONv2gStqLZtNoyJMcKblHMPB6oNTcEwo/KijsuHcOCTctG+Q/sJBA==@linaro.org
X-Google-Smtp-Source: AGHT+IH7m2sc9drGaOKJAk6HhlS04l8x1S29nszrBLmbYNwN9Cnm8/YAVHCjdeEIMSlAzHpQO5LI
X-Received: by 2002:ac8:7c41:0:b0:472:11ff:65fa with SMTP id d75a77b69052e-47377272cf3mr188799431cf.50.1740672228290;
        Thu, 27 Feb 2025 08:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672228; cv=none;
        d=google.com; s=arc-20240605;
        b=WyBdBVQLyghy+FUSIepXFcf0rDBGZ1K1nRtGisQffAkMzQdTK4bg3D9ZWwjjiW1TBC
         wajWIFEP+rjyFPAJO5o9vkxO6/8jQcs3ei9MqgdZ9Qho1l0SINofItSNHJCzE8QN+bPW
         /TVvY2Wwj6Qrxb8bO8Gj5eKq7hTUFHVRavjnNhD5FpBYmqg+B54yu3BL89D3Fhs7SKLz
         +VskGIr0M0sN/5jYIG7j2aUgDc93D5bht7YCFE7nVblpoBgZsNuOn2SkFVVbXsWo4xYS
         6ugJ7d1jasb0T1TLW/ody0ZL3LrMWuYdA+N4Uba7yCx+QZ+eFZMDzyPwGPjXtmbsMG2b
         6QZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1fbQoIRiDSwGgMkrGMzuayWFOcMCWHzmx0B4NGFMCWw=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=ibk7NlfpBqMkSfm+QxJTpcYmzfDL+G2QJw6bn9DxVHnFfTPKdRqn7AvBTu5udmIkze
         86zuADDxw5qwja0lrdcDEws1TItMxd08QHicpA1ECg1CvK0UBz0NKXEFAAeHo9XIxjSz
         EGnAPHvA0ZGtI0ZiK70gb/FPesc4QnOPuf7xU3E4s+8b94ph5imfZxAJTNg1FhNTIrzN
         Sdodae9mj3Vt3lSaddO4iaHaEQGxx84DKKu74e5YNxr3Ce9uzms+VEXT4JGbIaLTFMor
         PtRiFtqhVL/9eFQeKqq71evJYh3vrThtwUSRBGIrLqBpESyZohgI62+V0CR8SHYKOxHS
         VMfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=u64danzu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4746919e366si15238421cf.81.2025.02.27.08.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=u64danzu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tngK6-00077f-Kk; Thu, 27 Feb 2025 11:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJz-00070e-Qe; Thu, 27 Feb 2025 11:01:11 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJw-0007HA-8j; Thu, 27 Feb 2025 11:01:11 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 13A5E61F3C;
 Thu, 27 Feb 2025 16:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07947C4CEE9;
 Thu, 27 Feb 2025 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740672063;
 bh=5zJhfes57BAIUEr1wkVxprZJEF9UksszPvltIQNyQ7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u64danzuVXz/EHKksz7dnhZ96vCaejpVpcXohqXhy9nP6TFqP8ERAb5dwuFe+FBfh
 vPPTk1hTznXXfzGk8SaM8T2LqL7JSWJqVMvAlHz688siuaSsvpqnFQbGgf5dubh0RV
 KT1oG+x1nHFBKcIbnJ6FeXRzWhKTZRdt8hdR8Mf1mbQ6joX0ktRAapoKsR7CVecmIG
 1kuTbOh4cVfryHtT890K/9bIGIlZMCkCRmxqlgLxggORs1mydwVcSQRn/r6AZwHz08
 95HA299LGJqYV7+7+s4rC7McPkoHs+iFa1ZDIMLBPluxcHRtL0js9LkNWKtkIyDimJ
 PQwP1lgm9HXSA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJp-000000023bl-0hDb; Thu, 27 Feb 2025 17:01:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 16/19] acpi/generic_event_device.c: enable use_hest_addr
 for QEMU 10.x
Date: Thu, 27 Feb 2025 17:00:54 +0100
Message-ID: <797c0199ef713241db145baf3860d32e0eb1d03a.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: V9vHp2xDpZhh

Now that we have everything in place, enable using HEST GPA
instead of etc/hardware_errors GPA.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/generic_event_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index f029753ab709..9fe70b74bd42 100644
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
2.48.1

