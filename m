Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp526082njb;
        Fri, 31 Jan 2025 08:14:04 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVpCzKMr5klClsQJ8NH9+nTG830oq18fXgTCLm576OlYvtzmlQMJ0rLPkO3QudsI3T0+NR/IpfZVva09Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGSTqS3GI0AO3CbP2fp9QuyVcGMeIKSjG4IAvZSRy1+YfgBR/JQVK/6GWRZ95N/TwjtRWjk
X-Received: by 2002:a05:6214:506:b0:6e2:43d1:5fe5 with SMTP id 6a1803df08f44-6e243d16526mr143992366d6.34.1738340044449;
        Fri, 31 Jan 2025 08:14:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738340044; cv=pass;
        d=google.com; s=arc-20240605;
        b=dA6U4s9Y9XRcjGs6KIIR6d1OJeftGdbLEP9dO0U0f4Z5Cce7lZtX3dajsRs/fw6in1
         i2qsslGM/23tYgKvZ8mUEjN9kvoAzxHsB67A83GF2poVz4Pf8ajNiSarL3kz+u71FKPL
         whzEWa3TROEkk7xPbtUFm9oAWAzS/OA7neDIOcih677uhH1uLStq7n01XzbsilS6xzJ/
         J2AF0rV0GcVI79fyBYcgwxEGigidH/hr0u8U+z6HEtVc4TJNljt7TOWMIX8Hs1OofTSn
         eW5kQPf+SMeJ+2QlJ5VaO7H0U/aRajMwT5fqvXWlarwq4sj3DX9Dn85z+55K/juwm7UJ
         fflw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mbb0CbTx8SINIaFK2ZNY8dW4+brhQIys5eaiC4Zk3KQ=;
        fh=+IIZYibM3VqPU5vc5LSAgrCj2PY9BY2dnDrMb9YCvSE=;
        b=UoexNj3Y8FREHMLeKhwL0i+cQBsyqsVMucbPVkMl6shzXmpZrK6KtfT2KLy0AX+FMc
         bVcFbEk2CyBSt/ysv8dH33j2fKxejqrLhohjTLpZ8v8fPJ0BVYE8tN0RwEt/poaA0Q5e
         RAnfGT7mN7TFgxjXiSqq80aIE6YPY0fwGpb9f5GqP/Xihzvlo16XygLRXQAPvYm5Piaf
         pKZxdA7yf/KBiWebMku6+NjDis48KoGjEzUqY415aPN1waPbI6LXl5UtzQ/B0l4iAxBC
         86fQh9UdbUU7wg6gLiJsgiZZnXpp3g7zU702gTy92NHNBoOdVDa/5joqW4q24xM4mdF9
         zlmA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OjKzNgUA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494704-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494704-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-494704-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1e06fesi39203791cf.539.2025.01.31.08.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:14:04 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-494704-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OjKzNgUA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494704-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494704-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DE44163302
	for <alex.bennee@linaro.org>; Fri, 31 Jan 2025 16:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70441E47A6;
	Fri, 31 Jan 2025 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjKzNgUA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CB31C75F2
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340040; cv=none; b=P12Nngi7PmIb+FJdmzg4hVeqXe62aQAxQrxhpUVp3zUgh9jIYaP3CsimGsM/Jd4xEkjFebLZPnR5WaY7eJVTqS1rYSoyMlzWiAU0dR+tRcsHIkcU07MZtqIVNegyao/u71p1rASGk1RUTYWw0exjgu6eqpjkEEE1NAz87aQoivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340040; c=relaxed/simple;
	bh=4jipEBrnBk0sRaw7d+8DvwEvKyP+4wnYazk96RKoz1E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0FzmNqflXe7JgD1z88ef/gr0q7CQ6tgQ7XCAYyWUBVrJKsnB6tn6QR6uBNXuKER47DN5Nc5lGQ/r33/76LM+v5ktThdsHZDEN/a7XSkxC9aQe4clXPBl2a0Dfl3jGlaAN6EIsf3wRfSaLnutSowOkC09I226eBVxS9Bntq35+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjKzNgUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8DAC4CEDF;
	Fri, 31 Jan 2025 16:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738340039;
	bh=4jipEBrnBk0sRaw7d+8DvwEvKyP+4wnYazk96RKoz1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OjKzNgUAesKydg1HFCVNNmt70nfppJDyKSgAWVIljHZqVeNSAYrEYDqX3mIgYSUMZ
	 i5XB3O14Hoc1FFmX5/v6kVeh4J6b1er95H1N3H8nFA+H/dxdALv2iKS1cD3s+q2Ktu
	 uiA/ksCcAyffHL5472uXkb7iRDkPmsMAOeRAOipuCBhIhEC7UvefRbpAxwYQc0Utm/
	 o5rebXPnjMMVV1eEBUc0eHplgbkVvjlgWKU9UlYBAFvTpnkK1aVNJ/4UGfHy6fiw8k
	 CHJQ7/d1e+e8sNIfKMFVbO33lEAeSYj0Ae9XvYV4jvW23NdS6MXtcw44OspMcVRl9y
	 CsajEfYHQ8exg==
Date: Fri, 31 Jan 2025 17:13:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] acpi/ghes: add a firmware file with HEST
 address
Message-ID: <20250131171354.36fc5844@foz.lan>
In-Reply-To: <20250129162328.17680ee7@imammedo.users.ipa.redhat.com>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<294577300217e4f7a606f3cb17382fd108c8c021.1738137123.git.mchehab+huawei@kernel.org>
	<20250129162328.17680ee7@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: lelTbRJuHosv

Em Wed, 29 Jan 2025 16:23:28 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> > +
> > +    /*
> > +     * Tell firmware to write into GPA the address of HEST via fw_cfg,
> > +     * once initialized.
> > +     */
> > +    bios_linker_loader_write_pointer(linker,
> > +                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> > +                                     sizeof(uint64_t),
> > +                                     ACPI_BUILD_TABLE_FILE, hest_offset);  
> 
> it's not safe to add this without compat logic, as it changes size of linker
> table and possibly layout.
> 
> I'd suggest to  partially combine this with use_hest_addr patch.
> One way to do it cleanly would be to move part introducing
> use_hest_addr here and set it to false to start with,
> and flip default to true one all hest_addr_le code in place.
> see related comment 6/13 

Ok. It also means I need to temporarily get ags there, e. g.:


+    AcpiGedState *acpi_ged_state;
+    AcpiGhesState *ags = NULL;
+
+    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+    if (acpi_ged_state) {
+        ags = &acpi_ged_state->ghes_state;
+    }
...
+    if (ags->use_hest_addr) {
+        bios_linker_loader_write_pointer(linker,
+                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                         sizeof(uint64_t),
+                                         ACPI_BUILD_TABLE_FILE, hest_offset);
+    }


The part which gets ags will be dropped on this patch:

	ad2dc8716d1f acpi/generic_event_device: add logic to detect if HEST addr is available

which will set use_hest_addr to false, until we have everything in
place.

Thanks,
Mauro
