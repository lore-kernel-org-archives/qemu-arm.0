Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp571893ejd;
        Tue, 16 Apr 2024 12:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUmGQ/qp7Ps3TiozSzpY3fQUdKTdzZF22l+sxSgBsiTpX7dry2UMwBsNvxCBwMMv2MVIjVTBNtu5oENltLz6JJ/RJVLlbEX
X-Google-Smtp-Source: AGHT+IGHFGG1cOF2dWfLw3BGOkhBmDj9Pz/mQWL7nsQO2JBzvKrqPXYzyUalX53EVLgJ2R/aA1it
X-Received: by 2002:a05:6122:2009:b0:4c7:7760:8f14 with SMTP id l9-20020a056122200900b004c777608f14mr2439208vkd.7.1713294041477;
        Tue, 16 Apr 2024 12:00:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294041; cv=pass;
        d=google.com; s=arc-20160816;
        b=UM5BsTwp5GcdnWbgB6+8daZ4lfbSPNcsFnEFl2VpdFp5fi+nmG6+/xWJ6ZcCfyg75I
         hvnUSFMtbZYAQPM14BtvoyYRrMY+UakY1uH+2JugoV0OPCfN9CpbHT5TngloY/LR0zZy
         gx2t4yqp8oXdj6HXR/fEewZ3fsFnMtCgCHx3CDXsOgfDfZXqwivo760O+BmenKLG7Srn
         CdPP0Jt/2WQ6/8adcBFpzA3hX7Jmk+2fRPfbECreSp9Cp8Gs25ZDj+jooZGxNocb6PAV
         lLo/SRkHPeD8l0l0W9coHc70OmTj7w+6gTLIKIs2afMf0pXHvCp4P9N50S5baW8KqpxO
         oeZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=cesSegXMr71Lpaal5FJBOqynS/3X0jmvbPzoIKbt5l0=;
        fh=j82+Iy2s3Nyn9u+GB6LH5KM71rSTmyq5M+H98GN6VCc=;
        b=QvkNbiNtw52jWt6jOwb1USylNz0wIHww3E2EbvQ1wrr29T7wHt+LibtFBcYPxX4iRk
         xa4W4c+A+dcgOBdKP1MkGNij10GiSzonV2JuAjYNUVVHZ2cyvfOKWYhUe/eI95nSxV10
         IbYOKJM1U/uDeNnzTOpUx++yTSPqZzRgslguJ29VH07SLPyIbjgeNCPtACNMksQofc8d
         3sUOtEn/rBNcZG0tQg8U8bU/JrF+RXDWpTLi8QO8S0Z8znJfk8CMFcnRe/lTl4Ih7U+0
         hlMOhMWxbAvCf45r0Uw+8Gn1y5ZCzcD3bsXe6dHIMulga9vnJ7eAcXfCczoWeBZq0ZRo
         trIw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHdz9AQO;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14855-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-14855-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14855-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id ay1-20020a056122180100b004d33b04d602si2226204vkb.166.2024.04.16.12.00.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14855-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHdz9AQO;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14855-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-14855-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19A4C1C20F80
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D5E137753;
	Tue, 16 Apr 2024 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHdz9AQO"
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4379213791B
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294038; cv=none; b=X5OZ2URc6ERpf3sikMCIYhPgfzTuC2/13FlLJ/oz9ahSRAPod3mwc0O3HfHEqDzMdkB8uYwlVjiKJmJHDcChA2lsRrt4N2izzdJFaUx+h6GliyjmZX6uvsiMa+Dph1fg7A3YAjdzHKIkg3nlayMIWqeqFzInUiT6vMIIjYDfGJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294038; c=relaxed/simple;
	bh=XArO7gBRA8/Ay1iZUJuYJWGokF4fTEXW8HFgkerMQVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jb6VvtMQZa3X/vIWiCQ6OzZpUZKQ02zBtQkF0u8tCZlkHjK2J54+1owv6mmSHS5QJYDkNFuOO3VmtnymECC7m41OrsXIIVerUHs4G3BICY273bnkJ+PRuILPUtkMO6ozwILKDnhwgXH76puyrEWITdSr3MOqqNJO/bUPXoSiLbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHdz9AQO; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so12142166b.1
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294022; x=1713898822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cesSegXMr71Lpaal5FJBOqynS/3X0jmvbPzoIKbt5l0=;
        b=cHdz9AQOfPLAgvq6AAVhIjTrdV5XLgpAeDcc+0jqvztyQmuHK9oGLecCUSib86Xij2
         +cTPf66JOIdpAlPKTk8bwP6V0ESatrvZYszdVBFfQyYOxWFq5ca3vLHNjIxwGZ+1Rnlw
         +9ekpwv6IBITl031IDXvE92nbO64WYoQQrmuamuQFXCnu5nb76cXx4ZpUdgJFVXNN/8D
         EAtCSKvKV0+gs/tZAjzjkiGaopZ8hEvchr3HQ/fO6L8QMoO4bKWM2UZ2iJsxD1YrI0gp
         oTlBf205NojJKPWPpwMx4kSpZPdV2NnupAfAbpDkZpEWy9l/GRWICEropSBw8WVo/S2K
         EaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294022; x=1713898822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cesSegXMr71Lpaal5FJBOqynS/3X0jmvbPzoIKbt5l0=;
        b=lGwCgDx7Tf4J61kX2OREWJRKgAin9E0LxH2DMKAmb4kqVYawqO+aiJcFFw//meXcIB
         r8BOKL5aB5YVIliR10uP6EbAFhhW+RJ4JAch+WA8IZuMkq/kSkLZmiu/UB8v5tVQhB8e
         2qRkhTDXvcmbSGC2j4IoYS/XzR4qZmuqrRGp+6Um5S4MEvOa84qjZXXWwltSLkNSiNET
         2jDULaNHYPf5PPWaYVWDGSLIMB2M/9mzeshM0GRBbvhPPfgvV1DnxY7b8olYIu4yFcjp
         gjqWA40phzZ4cp88qUj8ER7lNbyVGkBoGRpFz2Fv6bNs52R9CqgnuRE0ZaRXl4tuhmF9
         Gkgw==
X-Forwarded-Encrypted: i=1; AJvYcCX+73Dng2N4hJeWIWtofPQfDohBbCjrpwYJ5jTh92jANnPIxK/QRkz6mAWl45ylYrZB8ajNP46I/ulmwpRYpwqQFeH5
X-Gm-Message-State: AOJu0YylfWbAE0xjX/NcA891zcsfERHKXro7xDyE3Am3PtZbmsH4kNpz
	GiAEcnqlEBLHgAqHApuYN9NIUA9oxItop/R4BlHc+oBGimbmVlRN4EkxuZv/Tlk=
X-Received: by 2002:a17:906:cec8:b0:a51:ee80:bae9 with SMTP id si8-20020a170906cec800b00a51ee80bae9mr3007893ejb.17.1713294022679;
        Tue, 16 Apr 2024 12:00:22 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id d3-20020a170906640300b00a4e379ac57fsm7099907ejm.30.2024.04.16.12.00.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:00:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v4 06/22] hw/acpi/ich9: Remove 'memory-hotplug-support' property
Date: Tue, 16 Apr 2024 20:59:22 +0200
Message-ID: <20240416185939.37984-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u8Z/OTPpEGSR

No external code sets the 'memory-hotplug-support'
property, remove it.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/acpi/ich9.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 573d032e8e..9b605af21a 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -351,21 +351,6 @@ static void ich9_pm_get_gpe0_blk(Object *obj, Visitor *v, const char *name,
     visit_type_uint32(v, name, &value, errp);
 }
 
-static bool ich9_pm_get_memory_hotplug_support(Object *obj, Error **errp)
-{
-    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
-
-    return s->pm.acpi_memory_hotplug.is_enabled;
-}
-
-static void ich9_pm_set_memory_hotplug_support(Object *obj, bool value,
-                                               Error **errp)
-{
-    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
-
-    s->pm.acpi_memory_hotplug.is_enabled = value;
-}
-
 static bool ich9_pm_get_cpu_hotplug_legacy(Object *obj, Error **errp)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
@@ -445,9 +430,6 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
                         NULL, NULL, pm);
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
                                    &gpe0_len, OBJ_PROP_FLAG_READ);
-    object_property_add_bool(obj, "memory-hotplug-support",
-                             ich9_pm_get_memory_hotplug_support,
-                             ich9_pm_set_memory_hotplug_support);
     object_property_add_bool(obj, "cpu-hotplug-legacy",
                              ich9_pm_get_cpu_hotplug_legacy,
                              ich9_pm_set_cpu_hotplug_legacy);
-- 
2.41.0

