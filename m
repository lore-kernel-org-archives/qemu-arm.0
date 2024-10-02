Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp784879njl;
        Wed, 2 Oct 2024 05:38:32 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWSit1BwyVTMVUaanXXtstCOmFFIy7VdpqZpgm221diyQ17Ry/X1CQm9YVrpON8FTaTTC2U5BJEhiHPZA==@linaro.org
X-Google-Smtp-Source: AGHT+IHxZZMTK+IHDcyqvLaf54uD3X1V+LYJX0Yl5CSkYKwZSM/JYfmvKZMM0GEubl24bmLekVyr
X-Received: by 2002:a05:6000:2cb:b0:374:c658:706e with SMTP id ffacd0b85a97d-37cfba0a536mr3539843f8f.39.1727872712296;
        Wed, 02 Oct 2024 05:38:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727872712; cv=pass;
        d=google.com; s=arc-20240605;
        b=KahTB/HhveMwKVJNrzRzBG7NjwuCblWLUbYLCAOTe3f1ViCQu8/HQrzq0XEAx3m/Zd
         nVs9QVM+2+rljYP0jlBe2CutvwVizKJ7EBhVzQlxu8M46wnRA+c6Oj9oBmEIO2Vyqhr9
         hbm6TGDNUDV4sPliGfcYwNBG8o23fT2Muf7WGNFs3VnLSANgdzZY1trPQ29QLj93Qu5t
         9dcVbg1wZc+dyCoNHZNGlm4P68vMnaNf3zMjyUC1nO7NYpwUzfEsMc3GsyRts0VWVl/9
         FZP70YVCylzHQxTG9alhQT154TR/GKNIAcEbIU9ylGImFdPWGh9gAxsCJImFBMAuCz9y
         hwKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=nUycqu6EqSC60iYvDsl+Om1SzAibDAMectWvdn0BXWc=;
        fh=BnLz9xjv3Me9qTDmY+Xtx/NHOQHvZVQOEhhqjLRJWb0=;
        b=Fy9vKFppbV458Bv4muZWOH/AIixEeYBxg5pydWLMN2qM5cFqmg4uBHO24gGAguNQ9M
         LBCOFLRjetr0p2IDEJTFsXRkhQWoogeOaEjXW0JILLeSJL2iYbONy6JQHrVVbNjSdXT+
         e0zHIjW+/KyOV4FDuu4DHHDl/q354RK/xCbQqTyrx5U/rOazx7ZaQ7lfd5uENKDnzPyV
         yGCPgXXvK2QQ08FC3+yR8a4T1f4QuFXuTkM2FQ+s0juqx9MnDz75URRdi7SnCO2BwdHH
         lDDRJB+GmwAXPjGOo/ZlEeaQmgjNaXhM+JI4zycaH5ckTJj6anqMDszLdnfTALDsihPC
         6KBw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LAnkoG8r;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-347494-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-347494-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-347494-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a93c29e5bdcsi920065266b.567.2024.10.02.05.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 05:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-347494-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LAnkoG8r;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-347494-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-347494-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC75F1F231B6
	for <alex.bennee@linaro.org>; Wed,  2 Oct 2024 12:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB0B1CFECE;
	Wed,  2 Oct 2024 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LAnkoG8r"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA481CFEB7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Oct 2024 12:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727872706; cv=none; b=U0iJ7UcV6NP0NBEe/VvVOA3uxqwdE97f0ma9l26gWWHxMl5228tDZ6UlPCEiXp/AfufNKUpUbwUhzRIfTpMQhzkgCGu3otAToUbIqIY1LYVaAS/v1Y3OddE3uw7z6XY/bBr3sFfzMyeoyIQoIunb6Kf79EPBDpHOQbfH9lnJifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727872706; c=relaxed/simple;
	bh=g1UNvIVEcKZPqIH5c1rcorfzK9E6LCVo7yLwVn0J8pA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UupVItcvaJSXCpPexJyHAlb4ZOmGnNYPDdpkROUEA9NkkaL8zOuWAX9fh5YZYLPJoreO+yqEoUZWiyvheFpAnh5QuJ29ciAI0pPeqfo2qcid01LaNEoAuutv48YjcZUL9imDjk/gHz3KVOHOI0Wn2Rt24saU3tT0TtJJz3pxg1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LAnkoG8r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727872703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUycqu6EqSC60iYvDsl+Om1SzAibDAMectWvdn0BXWc=;
	b=LAnkoG8r7kvW3jgNtgyUFz8fUL+Cii1WyaPxb9WVhmIgAH+jDQCAQER4+2XaDUfcIk4vLh
	Huf7sA2XT4oe+jcRsj4XATPn4hOfLSwb+U8J43iNfhRl0eDSdEaTd2vYJxkplX4ZIxTFdt
	1ES06aWZ6lxfj/cpMBWMeFEYwzjEO90=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-BLgjER3YOJS2I-sN19Dvsw-1; Wed, 02 Oct 2024 08:38:22 -0400
X-MC-Unique: BLgjER3YOJS2I-sN19Dvsw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37cd4acb55aso3990542f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Oct 2024 05:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727872701; x=1728477501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUycqu6EqSC60iYvDsl+Om1SzAibDAMectWvdn0BXWc=;
        b=AsKVhqiBE4d9lHUcs5xg9S396lZi20unX0O4xrBn1e7CvAdreuMcNqrJKltqYnqCCW
         Lb54Vs3bBpX54bYZyF40voN35DYi9MrkonbRnOVWF5uvV0ukDoxVci8fsE0HzFDZL/Q8
         iu29Ykxx5HHm+xulm45oU0dUIPa09L/AwmtR3MP1ms4ebjGjO/Y2Gm4ZM5Wi2NJDMIlu
         LBZISDQMR0HF21LnIlnLbrX7saMdlCs6xc/n9eqskn9Kf8XEBcBnRRAb5FZmVFABgoLC
         +7ezj/cp2A4HaQnUb0Qbp+LDPAIliZYWISc/oew55FsKP5ItffeEwJPvFXY5AgProjTk
         JRiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8o3JAPE34NSIoVyD2dQ3A32SLBLelzFua9G71R6+LNnS8gaFbxUSAV7YoA6Ft/6dbVGBikK0g7ondd3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP6FPv7aIXerSlk+0kPV3aDjnFGfQRkNUKGznmraVH7l7ELJYo
	3Ic4CtiAh1NNSmhrA/IAAve/x98wmZriUCBgzy65h7yxhHS4LZGcaQnadKuX69kkDFMsd73pCNv
	xZPsdjeRqGV9yIeDXeSrlEUsSWLlPLgtMw3E1LnQnPzCPWZg5Z9WwSXYHWiiAmg==
X-Received: by 2002:a05:6000:c9:b0:37c:d2e3:1298 with SMTP id ffacd0b85a97d-37cfba19c9amr2701947f8f.55.1727872701312;
        Wed, 02 Oct 2024 05:38:21 -0700 (PDT)
X-Received: by 2002:a05:6000:c9:b0:37c:d2e3:1298 with SMTP id ffacd0b85a97d-37cfba19c9amr2701917f8f.55.1727872700825;
        Wed, 02 Oct 2024 05:38:20 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fbdfsm13859274f8f.79.2024.10.02.05.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 05:38:20 -0700 (PDT)
Date: Wed, 2 Oct 2024 14:38:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 14/15] acpi/ghes: better name the offset of the
 hardware error firmware
Message-ID: <20241002143819.281ea155@imammedo.users.ipa.redhat.com>
In-Reply-To: <b74975e46f321d5e7e4c3f566d1d8827c83f33e7.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
	<b74975e46f321d5e7e4c3f566d1d8827c83f33e7.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Z1iGyA+cCZhQ

On Tue,  1 Oct 2024 09:03:51 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The hardware error firmware is where HEST error structures are
> stored. Those can be GHESv2, but they can also be other types.
> 
> Better name the location of the hardware error.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com> 

> ---
>  hw/acpi/generic_event_device.c | 4 ++--
>  hw/acpi/ghes.c                 | 4 ++--
>  include/hw/acpi/ghes.h         | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 15b4c3ebbf24..d4dbfb45e181 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -346,7 +346,7 @@ static const VMStateDescription vmstate_ghes = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .fields = (const VMStateField[]) {
> -        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
> +        VMSTATE_UINT64(hw_error_le, AcpiGhesState),
>          VMSTATE_END_OF_LIST()
>      },
>  };
> @@ -354,7 +354,7 @@ static const VMStateDescription vmstate_ghes = {
>  static bool ghes_needed(void *opaque)
>  {
>      AcpiGedState *s = opaque;
> -    return s->ghes_state.ghes_addr_le;
> +    return s->ghes_state.hw_error_le;
>  }
>  
>  static const VMStateDescription vmstate_ghes_state = {
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 3d03506fdaf8..8b3292be07e7 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -379,7 +379,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>  
>      /* Create a read-write fw_cfg file for Address */
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
> -        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
> +        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
>      ags->present = true;
>  }
> @@ -430,7 +430,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    get_ghes_offsets(le64_to_cpu(ags->ghes_addr_le),
> +    get_ghes_offsets(le64_to_cpu(ags->hw_error_le),
>                       &cper_addr, &read_ack_register_addr);
>  
>      if (!cper_addr) {
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 051a9322141f..e47ffacbb5c9 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -58,7 +58,7 @@ enum AcpiGhesNotifyType {
>  };
>  
>  typedef struct AcpiGhesState {
> -    uint64_t ghes_addr_le;
> +    uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
>  } AcpiGhesState;
>  

