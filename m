Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3794179njk;
        Wed, 29 Jan 2025 06:18:00 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWRu/ZRtWZZVFz451uTRssIr+rCRaIPHZsy7Va+SFjAB7MFZUVl8YqSet0Ki7ZdUA2XvBLU7W4fjTiOuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGf5c4Pwe4qwPCCQQBDU+UYNejUBhqtYvIowgO1Zyp/O3gJf9cVqBA30PL5hQ0tmp83OC+v
X-Received: by 2002:a17:907:7fa4:b0:aae:8843:9029 with SMTP id a640c23a62f3a-ab6cfdc6008mr351329166b.48.1738160280514;
        Wed, 29 Jan 2025 06:18:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738160280; cv=pass;
        d=google.com; s=arc-20240605;
        b=cOQzZNuCyOVFj96drgpVZM4ddWAWWMhz++3BF2CafkaKNbS4muePZbwcMZoOKRKz2n
         5hNvmEgqY/UiJBbtnB8tYXQ0jcbuH9YPcHNYHvIFCiuBpxeplUqR0t6QHpIooKjzK0dl
         GQ550SnXVIqym1uffhA52p+SPVutuBDSmxS6KIwk5cJklOVl+xHQ76ZDoHXomAcnxmtB
         Eu3HMMk73Z8XaVVa4j0hHDofsWUnl5qmhltJiIMIxGNVjSY23QYa/WgFZQS7cEC43Lgd
         qLx85hKgUi4wwt7yzHFtqz7HIz8wFIH5R+Q57vI0MT2ddFsywyhInjV/52wmfHIoipf2
         bu2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=chtwMj/HRjPGTAqiDPO5QGx7lgksbBXgnF4FSlMcayg=;
        fh=ogMNBhrnGtS64y6O7Kt33o/dRICASn7Jidwo7fzEIrw=;
        b=Pnv1qVvSrqRRC81zUUtG6QnmOJVmyXMXOeZXJZdQ5Fby/eg22MNhUCNlL/T6c8FXYv
         llYFATQNhml39AoE3RxlaMcmudSMSePmCDlWx5B6zc0K40R3B06TLFv6YG/0YUU8ID5h
         Jtm89G2/4cRIoq/Uy5doLaHJUNoQuTbL6koW+BS3WLUJCz9oapxUPWxYpxaetbWXjEt5
         MW/DYuloRmeYFFn+SufNdlTymAF0XPhuI7Urep+Fzgl2xYF+PhgBIBHz5QLEvpdp2cE8
         dsE6fu08adxSz7P9bHOSJSRz1yEzqGcCMEAOvYBcBRlmANWLpdLCImj/DUQUw1SwsEbw
         ufOg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IrNv1PU0;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492584-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492584-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-492584-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab67626dbd7si866480466b.499.2025.01.29.06.18.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:18:00 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492584-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IrNv1PU0;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492584-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492584-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B43FC188141A
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 14:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A6214A635;
	Wed, 29 Jan 2025 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IrNv1PU0"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B76613BAE4
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738160275; cv=none; b=Iw0XMlLzRgtGOdlv62oPcS2A5l2xHBnj1PkQBWmcJ6K6XwrzhLvFvPdaRpkUOByLbnk6Lge47eJTp/Eiwbhlmj1Qzo7ZMmjbZ5JzG1eE1fZRVi11OREIbsmXGTJ9gRYd9B8d0IlSVc++cJywzM2DoqBwGgpgNvFd6ptaRX7gVJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738160275; c=relaxed/simple;
	bh=K9z8bSq4Ud1P8qqXTb/EO6ScfZUKxS/dWukue4inS0c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=omo9oqPHueZtdDb0R6aBNUO08HXkGT6FiQeJTz0QpEGBl/4VSXMJuuqxkgKO1K4oLjjYqE7Ea8+waxI3FlitU+girUO7ygtYuxvYzQiRwmmUzEsoeU+lCl2ppk5wvjYONjFAIAliMAsVpSQU300pclVSfUJ7IgEbuDpcCaCpBQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IrNv1PU0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738160272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=chtwMj/HRjPGTAqiDPO5QGx7lgksbBXgnF4FSlMcayg=;
	b=IrNv1PU05goDGAw3nX5oIVk2xB9UFm4g7eUmCtgJLWyrvbFYgtfcrk6hb7pqsUFb1Xxgkz
	+HY3/jrSGDR2kfc9stzyLCrBQMTgh4oAUR1YdGemcRlBqz5JnPHNhSn68yj6/sPI3xRquw
	HZGkyiZoMEPx0XyEsTS1+NlHu7YogTs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-8Qobo4zxOxWq_BRXT6t1vQ-1; Wed, 29 Jan 2025 09:17:50 -0500
X-MC-Unique: 8Qobo4zxOxWq_BRXT6t1vQ-1
X-Mimecast-MFC-AGG-ID: 8Qobo4zxOxWq_BRXT6t1vQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-386333ea577so2567522f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 06:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738160268; x=1738765068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chtwMj/HRjPGTAqiDPO5QGx7lgksbBXgnF4FSlMcayg=;
        b=l+rnpTIR/MfRpkxpAlu5dTlVDQjDnAomoQk4jz3cdH668+d3Uf9im+vdJsU2YPfMNI
         9b7ICK9J+WmfDkZGYqt/YJcuquqGnvpJf/xaXAH8bTC9HI3db5HI96tTghC5ucx8UJr3
         xpUGpmb+CrrO8mGwW88aAhAVBlr7mqDuFM2BJrfxLp2jJk6h2t1pO/ZDJN9IF5Bcc1q6
         g31gNbNk423VNN95Igfis+nSfEwZfc5evwXYX2KFaC5aCeNAAPHzXg8AtDiNNjtNSjnZ
         Co5Q4x13SDRfBiluWlfkdOzyklWj5krb7HTEZX5Pvuv+Z7aWf9mrt33okli10tq11D7i
         SH9w==
X-Forwarded-Encrypted: i=1; AJvYcCWxC2Nya1b94xW/u8ouBErHjzpdvv3DJcuOcuqnQELkh+50Ym0OkZjF/CWCCeAnKElw3T1rjac4Z615DIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnPBk8igRFTawdX/DWZrce54/jmUPSQnhspPFoQ3zJRjKCDuu
	auSF7t4+IzYxIS86Ck0qTowknD7aXqkL9noPoAA0elYvA1NnNZwjD8ox7ACcPUGFLrUvoMUEh0a
	k+sfJ9S9qLcoEx6UtE2ErOsQmg7suwnLOR0oluSIkLC+1mZ2DiUbUaxEaLhddug==
X-Gm-Gg: ASbGncvzBWiHuKEihm9vUwQNQIbgHtLGC3UgR8vr/H5JbHvnaaJfrVdgW7MRUiXfpxD
	tvq7jc1nnYMEMNK5pQIC2jxF8caH9X6+xK8uIfM+R9Kq/wqiye2iGM9CcSMd8pfKwQYlXV847re
	pwFhYLZSsOV7ICHKGXXkRcFLOFwNoRVlKuSat2zxWFA+Gnsyd4rEorQnBmsFXj3YzFBWoj7HYTz
	xgNkxbUXdOmwkze5OV9DsgNg2DSIm0VsSX6+2Ed6+k5xmpzRDq3TBPDYl479UGX7A0oGGctVzOX
	DhJuaw4phLRJo4YvHL4Jn7ZiKA1AISzTQSZD4AEja/muW/9Qy4gM
X-Received: by 2002:a5d:64a6:0:b0:38a:87cc:fbee with SMTP id ffacd0b85a97d-38c5195e09emr2697581f8f.14.1738160268641;
        Wed, 29 Jan 2025 06:17:48 -0800 (PST)
X-Received: by 2002:a5d:64a6:0:b0:38a:87cc:fbee with SMTP id ffacd0b85a97d-38c5195e09emr2697554f8f.14.1738160268299;
        Wed, 29 Jan 2025 06:17:48 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc11ae6sm25124565e9.6.2025.01.29.06.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:17:47 -0800 (PST)
Date: Wed, 29 Jan 2025 15:17:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/13] acpi/generic_event_device: Update GHES
 migration to cover hest addr
Message-ID: <20250129151747.4b8a7691@imammedo.users.ipa.redhat.com>
In-Reply-To: <e0a95da158091e77642eaad9cdbbd7377d257980.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<e0a95da158091e77642eaad9cdbbd7377d257980.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: YgpRfn9yt4jT

On Wed, 29 Jan 2025 09:04:11 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The GHES migration logic at GED should now support HEST table
                           ^^
typo?? Should've it been 'as'?


> location too.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/generic_event_device.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index c85d97ca3776..5346cae573b7 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -386,6 +386,34 @@ static const VMStateDescription vmstate_ghes_state = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_hest = {
> +    .name = "acpi-hest",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT64(hest_addr_le, AcpiGhesState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static bool hest_needed(void *opaque)
> +{
> +    AcpiGedState *s = opaque;
> +    return s->ghes_state.hest_addr_le;
> +}
> +
> +static const VMStateDescription vmstate_hest_state = {
> +    .name = "acpi-ged/hest",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = hest_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
> +                       vmstate_hest, AcpiGhesState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_acpi_ged = {
>      .name = "acpi-ged",
>      .version_id = 1,
> @@ -398,6 +426,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>          &vmstate_memhp_state,
>          &vmstate_cpuhp_state,
>          &vmstate_ghes_state,
> +        &vmstate_hest_state,
>          NULL
>      }
>  };

