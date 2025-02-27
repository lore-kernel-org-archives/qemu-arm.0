Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp142607njb;
        Thu, 27 Feb 2025 03:07:29 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUhh8K1J4jH3l+x5BLwcwPb7eO5y1wprGfhqV8XZRMOFDjBhXiwB901paWKlFf5KTlAnp6fUlNpRDVC1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHivNwYz10BRBCeFx7XERDkW7z4OCfKqdpr0E/I0zRhP73It4fwrztePE/DpOWkRupj2Tbn
X-Received: by 2002:a05:6830:631c:b0:727:3664:ca26 with SMTP id 46e09a7af769-7289d058760mr7065730a34.0.1740654449782;
        Thu, 27 Feb 2025 03:07:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654449; cv=pass;
        d=google.com; s=arc-20240605;
        b=AkJvtdaH9+4iF8WAzJuaS9kuMzajYwpmA+ihdv6lCJi+AUYYOv60UCytDHFtIweWMp
         YTtYDum1YMG0WdT5BIdYbEV4c2XrK1Kapxju9snWy+LCm88Ii8r/FGF+BydKUmwQit1D
         bzchpVtrLZ6nSi33JiA97CnkuTYw2RcaxIDnT2md8Y1hjv6X0HtMk99GdmNgedTWgAAa
         cy5BeMgRwjmkr80DryNdJlmAw+ZtMRJl3AfaibfzUJ+xggIh1MkxutEUomjFIHcIYdsC
         ggZ1WbbIwrJeiceuf7MLHmmEudrfLae4vyMDX+evyadqo86iZtAKMQydyrpTyiQ+IwXc
         jI6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=JZqoN1LMCjj6qlpyqMLK3ftxdmEEgg3STsrxnFGdN+w=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=akfzR2EGTy9XPwwUFlZfcyvazwAziw1ngTvW391bqz6ukP+fNyxI7w35/YmgN6wPGe
         zoaLiqL/ilaTwLNNnzf366HwGyA8m8AVZdx4C9R51AXen/gGSyRpt6gp924788RjAUc8
         EE43sbPPUZHEAHT+26aVe+HeYkz9DS5BP8CChESWOCo/ZGhAU8OHGWP7F/RDUC33CA6A
         snRwN7Fy08isZLEjR990WqxqJKr935ij/4mvuDqmRKKVYmC5Ptn7ka7qjlJWgN3bPFoi
         YCgAKiFqDk8uHpbDpX/cyM0NpU8V06KS1Vk5oNB+5C0X/WSPqOnHYEEDjl8UxoIPQJEz
         reZg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oGiaiqWf;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536086-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536086-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536086-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 46e09a7af769-728afda4644si790229a34.179.2025.02.27.03.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:07:29 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536086-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oGiaiqWf;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536086-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536086-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE5423B3763
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C89B231A2B;
	Thu, 27 Feb 2025 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGiaiqWf"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F096922B8AD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654239; cv=none; b=cOdg4H/fWEMqebwr03z44mYzJdTRGjvI733EgUSC08jg4b705HZ+huVdnsGLFQ55bg7mv7F/Lm+cJzapRXtciwD976Deup+9DrALdfocnfXPuYJ4sEN4FNjw2fkLtGo0aS1WLkhrbYu153WL8FEO4zPlqGJrFbdcRw1hl4NJnuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654239; c=relaxed/simple;
	bh=1mLYffQoJbEBuNex4lmNSQVJEuoCQMeyOWMvd13jMno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oa5a3iCIUcOQf7KF6ifdrZChM/ZKDKZnLFlkHG87B2KK+vI9k/224L5y3Y5GsZYkayNjX8luO2CHKl0yuDXOCY1WGRFQXYcmCBZJjGrSrxpv2Pgglri4hk5DxpwFbHyX4PuBY1HMF6uqCJ19vUfpizGXe5eQvxY2WNMnEiyBRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGiaiqWf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B200C4CEFE;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=1mLYffQoJbEBuNex4lmNSQVJEuoCQMeyOWMvd13jMno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oGiaiqWfR/cINgq18nNdflEh94BrZ+gpLci8VNPnHj0ivFbCC/iQY7O03yqyoM/gs
	 GqZQuFciKrG+y1mVsfxlZB0nLS5vVYK4Ti4j82428NDnbcb+IhNhpt3f8hqMBkM2yE
	 PW7fhfePPyP8+ocg81S700HqXsAnO4onn1/lHPBYFnExn64sOcfsazX3oOJvqnz1l9
	 sLBxXXSRV7hUaV+EQmwFBb4l1eashTBsvnHe31LjtDHAB1ovtJ3xzGZXP0F4CvD3Cm
	 XC4Gt/1wStdX27umzXsXeZkUboPb9oDwUJzlGupg1c/gePhKuCE6c9Ak0SQ8Yeq49J
	 Fvqxcz3GeT6kw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mRq-2FL7;
	Thu, 27 Feb 2025 12:03:56 +0100
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
Subject: [PATCH v5 20/21] acpi/generic_event_device.c: enable use_hest_addr for QEMU 10.x
Date: Thu, 27 Feb 2025 12:03:50 +0100
Message-ID: <ee9354f49a895799d59eb5ce79b322fbee561e1c.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: WJ9A3Qts5NLW

Now that we have everything in place, enable using HEST GPA
instead of etc/hardware_errors GPA.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/generic_event_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 180eebbce1cd..f5e899155d34 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -331,7 +331,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
-    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, true),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
-- 
2.48.1

