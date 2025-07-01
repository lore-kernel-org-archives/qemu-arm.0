Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3253564dye;
        Tue, 1 Jul 2025 08:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVZNIr2wulcOrzpXLMiyvZmy2S3oW7+eoHAZ9LS9fPnKMTAlOtG4lAcR6jYZXV+nYMWsAgnSCEZjMp6A==@linaro.org
X-Google-Smtp-Source: AGHT+IHpZdaPO8lJgp22w4aRFoDRJcfg4VmEGr8GyrxM4bm4JYTx79HFcU6IojA78IKfa2G6gZnx
X-Received: by 2002:a05:622a:248:b0:4a4:3e89:d5bb with SMTP id d75a77b69052e-4a7fcb1764dmr279622761cf.49.1751385011120;
        Tue, 01 Jul 2025 08:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751385011; cv=none;
        d=google.com; s=arc-20240605;
        b=QnKsutJ5Bhuv3GZXgsJKSH6uX/KjncaGDEumDxUYHf6UN7ykyh8+p9cPU9IbsrXvXc
         Gz/YEd5F/uEmG7gKuCO1sRzXFOfGwq7Aqai8CIZiyaJyFb8/WJ4lKdgx1zSRPyPJ6a2x
         kWKULG9zEaYP/X1BritRYfR6z/CD1iJbRiNxt2dJkY0D4fKj8d2Z/ZmSHviq/42RPyvR
         KbVpA3BhakLaO8/ZMaH0m94XJFNbKBHzO07Cmd3FNBSidTtNhLJmZtSqxOVPTm0U5S0F
         EERGKPKmAN4N0Uf0xgiXKtTEtvll52smTqF2ctH3X853Bz4mAoG0nDxTpwuF+lsYZTnF
         S20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=P/uTjjueacCrk9iWxrSPigoGAnsDBOasrqX6cOjFTgQ=;
        fh=4qYPCGul8gRc84hEItYJdG4qeJqdSHDEL0D2BuaOFZE=;
        b=JYHcXNy2vmAANgmYp/nh8e20aVsQD8ZmHrUKuH9XUtw8rY2Dp7W8ZtgpI85elxUcCd
         kTpqrOm37ajDJwgHlX7+Rarupivp59xQlmDSnW4E+gvDP9e3qrzB4ppawcRXfoUQudY3
         uz2+JlHM+D/WbbzMVF1xnbCeMojRzeHzDey01bPe7UNpxXAaeycS++Gw389u9TbCKEbP
         SAXUOtviYHdYgqIyxv6u9LluBqXC8TnUetlwiltuYHrIXD/hC+/x2gsjUwmukIjN453u
         LMqzi+nAxTVukJeEE06X+Wq8HkrmELLKNqtIzwAL9R+pCG/ThWWikuigr6e+OpZfAua/
         VFgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="b/nn/olF";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a82e0e864esi23505161cf.378.2025.07.01.08.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="b/nn/olF";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751385010;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/uTjjueacCrk9iWxrSPigoGAnsDBOasrqX6cOjFTgQ=;
	b=b/nn/olFUrtYXTmDEyu1gdrfOtKW7+BtAOCbZ9EgcOdo2JwXwXnvW4fdLiugzcnoQTuEKt
	+hVvsn5YZv5GF2CiacByGm4tBOtc82/aD7bbpoLVwI8MeZQnOCJ09ESMFflblkmJ6dsAwC
	BLwJCJWkNCnXsh+F3s2crBPt66fAgsI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-rMLiYoLlOiGG_xPIMCgvAg-1; Tue, 01 Jul 2025 11:50:09 -0400
X-MC-Unique: rMLiYoLlOiGG_xPIMCgvAg-1
X-Mimecast-MFC-AGG-ID: rMLiYoLlOiGG_xPIMCgvAg_1751385008
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d290d542so37462515e9.1
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 08:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385008; x=1751989808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/uTjjueacCrk9iWxrSPigoGAnsDBOasrqX6cOjFTgQ=;
        b=o/aS0awl50G+kpOGQB2xh/omQP7A2NcNoYvW0pRoKuOXkCE7OnhzyGPDV6Uh79SyOs
         1OR1Sxs1hpnQ0TI5Acr/d4hL6t/jtx6KrGlDpx9CCULYKVaa2u+PUnVVP6ydB7rv+Sl9
         Dh+ALVkTXHsmoT1EC2G6cAJ1PuCmNcDUCnPr037K5X5nu4Apsx+5I2bCuc6scbwxF6M/
         hdO7FjKhH8JhI01b17CPujTgHdgDqGrRgYLTFjuhz2SEbmpCr3E2zyeeRvwMHzAUlcNB
         l85UwKGMrRt9puwSphThDMqGRf3v6UglfWvj48nB+SuSXKZvLQEbqnFtmqprKy6ADzGK
         YS8g==
X-Forwarded-Encrypted: i=1; AJvYcCXoQX/6vF/qWDeZ2uA0yi6UuJpOYVoT2pF67IG76B28bpRb46bPWdr+hD6akKLOa21xjUwRQCbTR26ocQ==@linaro.org
X-Gm-Message-State: AOJu0Yxj6uh62Q8BaCmsJO+yymalrT+CHgzYkmYCciEGLqYrM7+1pSj5
	gLUKNK7dLAvYyqgRWPnDQ0BeZ4cDxPYRuBVouzhJ5jMAIbpMss7Zd20FCTMFt5zI4fdXLUgmq8J
	CHMZt/7gQsKJG77rjM/eS7EF7cSPf/9mPM1oouWwG9YcO0eEWUHzt7KpOBw==
X-Gm-Gg: ASbGncudOVhRLIJJYnqpKj1fZvwKyixbN0KDPFU3GiIPYtyQ+foTGd6wy8qGME8U+v0
	tZ8UsCAIxMQh4omAJZ7a8Jz/fieahO2JUIx0eWWsUfLlJ9Xygljv5mOJEllZVioISY1HWAzdaDn
	i7aAegPOi3ZjClPWa8fiHG6tU++RhL23cm34mUjGWMSI+60XzBHDFvR+CmfWRuV4kcYtnRpheR5
	VLN4y5Tqcfjm5dbdAxC8v5mqzm1JqFytrH5NTjHIHGolh39lf7sC12qSSzNSSzOiFKvTW+lnahb
	UeTJFN75D6GTsX3DP+J/5imhM6ft2noxb8R1yJ0YlYx4gBxtgY5WidMRK2vSTb5Lq+FRow==
X-Received: by 2002:a05:600c:5491:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-4538ee85900mr166291355e9.21.1751385008180;
        Tue, 01 Jul 2025 08:50:08 -0700 (PDT)
X-Received: by 2002:a05:600c:5491:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-4538ee85900mr166290895e9.21.1751385007628;
        Tue, 01 Jul 2025 08:50:07 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a40766csm171425715e9.32.2025.07.01.08.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:50:07 -0700 (PDT)
Message-ID: <93f59259-c720-4c54-8829-fb13cdb8abdb@redhat.com>
Date: Tue, 1 Jul 2025 17:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH qemu v16 1/5] hw/cxl-host: Add an index field to
 CXLFixedMemoryWindow
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Fan Ni <fan.ni@samsung.com>, Peter Maydell <peter.maydell@linaro.org>,
 mst@redhat.com, Zhijian Li <lizhijian@fujitsu.com>,
 Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: linuxarm@huawei.com, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
 <20250625161926.549812-2-Jonathan.Cameron@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250625161926.549812-2-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ue3EpwT5AerHkGObcZONOlQt8izWNLfPMQlc0_zTfbM_1751385008
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 8ErQc79uCebZ



On 6/25/25 6:19 PM, Jonathan Cameron via wrote:
> To enable these to be found in a fixed order, that order needs to be known.
> This will later be used to sort a list of these structures so that address
> map and ACPI table entries are predictable.
>
> Tested-by: Li Zhijian <lizhijian@fujitsu.com>
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
> Reviewed-by: Fan Ni <fan.ni@samsung.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>
> ---
> v16: Tested tag
> ---
>  include/hw/cxl/cxl.h | 1 +
>  hw/cxl/cxl-host.c    | 9 ++++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> index 75e47b6864..b2bcce7ed6 100644
> --- a/include/hw/cxl/cxl.h
> +++ b/include/hw/cxl/cxl.h
> @@ -27,6 +27,7 @@
>  typedef struct PXBCXLDev PXBCXLDev;
>  
>  typedef struct CXLFixedWindow {
> +    int index;
>      uint64_t size;
>      char **targets;
>      PXBCXLDev *target_hbs[16];
> diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> index e010163174..b7aa429ddf 100644
> --- a/hw/cxl/cxl-host.c
> +++ b/hw/cxl/cxl-host.c
> @@ -24,13 +24,15 @@
>  
>  static void cxl_fixed_memory_window_config(CXLState *cxl_state,
>                                             CXLFixedMemoryWindowOptions *object,
> -                                           Error **errp)
> +                                           int index, Error **errp)
>  {
>      ERRP_GUARD();
>      g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
>      strList *target;
>      int i;
>  
> +    fw->index = index;
> +
>      for (target = object->targets; target; target = target->next) {
>          fw->num_targets++;
>      }
> @@ -325,14 +327,15 @@ static void machine_set_cfmw(Object *obj, Visitor *v, const char *name,
>      CXLState *state = opaque;
>      CXLFixedMemoryWindowOptionsList *cfmw_list = NULL;
>      CXLFixedMemoryWindowOptionsList *it;
> +    int index;
>  
>      visit_type_CXLFixedMemoryWindowOptionsList(v, name, &cfmw_list, errp);
>      if (!cfmw_list) {
>          return;
>      }
>  
> -    for (it = cfmw_list; it; it = it->next) {
> -        cxl_fixed_memory_window_config(state, it->value, errp);
> +    for (it = cfmw_list, index = 0; it; it = it->next, index++) {
> +        cxl_fixed_memory_window_config(state, it->value, index, errp);
>      }
>      state->cfmw_list = cfmw_list;
>  }
