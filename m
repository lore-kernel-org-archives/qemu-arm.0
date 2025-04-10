Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8497839njd;
        Thu, 10 Apr 2025 08:53:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmVUDg3IRUE4z06jedMKPqt/6Mdmrv84w39AdhDaWrRwnmNbJiCy2fg7V1zS9/9jwe5ApO
X-Received: by 2002:a05:6902:2410:b0:e5e:1389:cb2f with SMTP id 3f1490d57ef6-e703e21a3e0mr5460514276.45.1744300418431;
        Thu, 10 Apr 2025 08:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744300418; cv=none;
        d=google.com; s=arc-20240605;
        b=gWR83vlALlFChtNCp+DAq8Wq/0LKfF0JXJZI6XktEl52XPq6RaPqPle4Q27OnEk/iB
         y6fC6VZZdueGTm68CRrS5Pa+kRQxWpp+K+BPoS4MKnfwJFjo944Vbn8EF1OCaDUN6N/i
         F2Fl/szPFENhC2d3Yjj0hKnDIV4E2e0amOHOY8RqorMaQpCLFMW1pJtvyHaC9Gjuitt9
         4V9DR6P0CJBjDptUWJlQkGEYnDMWcWFICcCSMtXx2tceIQVC15oZBBniyVrH0UxtGtEo
         hNC6FPgfx5PVy7Nz3fsX9oV1QbV6EE9P9IGOabl5lQYRQZoO/w7CNlYzYEtfj/JvMDGF
         p4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=SdA1HWLoO2kXNuLxZ0pYMZg0KJtTsj5uujt/ImDbGME=;
        fh=0LyyC3Lf7bfONIK9uHTS0OLml5VGpDElWezRaxQ6lDI=;
        b=eMCKIn96PyAsP2u0Ck3lgRGHvtFTpTDCgQwTeZdxGA2G5kifMQD9qrDt85e8G4KHr7
         UiWC6dh4ob+3rvG4XKSMKxWhx+5Z3PDUiufOmPokgzEDDBDRhEFnBdD4cf3u5zN7K8kU
         u0MwNYTErBgC/FZRHBagVCXvNCvP7XErDxN2F8YEHgyXSfP3loS+3xLqsyuQXYaT2mvb
         svUdPfxVMQcoW43awuHBqQ6iOpYa1Yrn6pupXxitN95YEifdGlHNtgpEB8bXl8sUonhU
         8P96cAjQYUbMuUGTSn1qdwBGhb2eUyX8wPJMTAy2i42sN2JR99k1mYQVs+RarreD1219
         9mIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QFQez6al;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e7032443db8si4235576276.98.2025.04.10.08.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QFQez6al;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744300418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SdA1HWLoO2kXNuLxZ0pYMZg0KJtTsj5uujt/ImDbGME=;
	b=QFQez6aloRj2nyg/2nYJQ6SkzvFlkrMqZuLCtzDYB2FsDi9BAynqXJAsBxXcuOZRmEwFPy
	71AnKySb7PMjVFWcZ0Q6aAnT6+2R8Ci/aR+FDt3F75f5qVpkbxUBgaJvk/b1BOK51/yeoc
	qqJxgFRDcama37MDrAXSaBvWW0EJ/yI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-ohfxxRuGNcWynk-_4vv-ig-1; Thu, 10 Apr 2025 11:53:36 -0400
X-MC-Unique: ohfxxRuGNcWynk-_4vv-ig-1
X-Mimecast-MFC-AGG-ID: ohfxxRuGNcWynk-_4vv-ig_1744300416
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac6ef2d1b7dso98023366b.0
        for <alex.bennee@linaro.org>; Thu, 10 Apr 2025 08:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300416; x=1744905216;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdA1HWLoO2kXNuLxZ0pYMZg0KJtTsj5uujt/ImDbGME=;
        b=cBQZJz8DUapyRl5H7Xhx3Yx1rXlixAFH2ijapRb7QPeGsHg+5VdR3RY3B8cgrRLzzG
         d8qQiX5l/Ph3dF1BNpl7rTa/pnv7l+FK3GfmwoD1ocDRDdUCb2YIVYrE5lftsfPdyZO/
         O66K85Cr1h92QKsn2+zbmVOcBuhtlwXMgk+9FpUIBL5GvS2hfGCPNFuqVnWaT93Ps4wa
         2TbDFTB1pSBCu8e2WiOmALHNFhLgL7GtE1/JVxIEQIuPuPk8SFRHnL7JIdktKnb1kz8n
         LeDKRkp7sNy1K2UR1UN/QcVvA4Nq99k9EuV5PLJGkDJE0hbRaJWGeiJz1jK/aFbmo0A/
         auGQ==
X-Gm-Message-State: AOJu0YzKvprV3HluNs3rM/SsXNcwUXOH/yAxotq3tBhZW38F4ovHu+Hq
	PlEj23vR+3gpwhLHsFleCdtHWoZrXR5829wXOAbnPewcj4VdzfNt/b16sXbuqWtrlZreDkbE4FX
	E1DJF15tY2D322ClHPTPkvUO0Z3O4JFvUs6fsdH7WsL1RrVdr0HpFJA==
X-Gm-Gg: ASbGncujUffrZK9HnoVEzZArQOOeGLfCUxlJ/o3LX+FA2oiGQHkbX9J6l5/dWyPkR0T
	v3vb6i/7Kgu4fZfmVX28DJq2wMNkmYarS/nEUXgI2Fo57omuVwIyM2GRSWFVCLSPoSxugO7gKVs
	5qjg8/3rLFrAjMFfvungSSWXIA5gJAflR1Vcld7BAwth60B3yfgCXCtTp95Jfa4jUkZzfmOu3AW
	IYuCTVTeJeQatiqZY0ACYR6AuexYElkZ7HHwWkhrjM9ZDcOkIuyGDh2d9JM+LSN1bZkFXW3HIAT
	JXzuA+ElOET5kXdwYfUCmq1dron2fG8Z0j7ITy1YMawi3jYsvQ==
X-Received: by 2002:a17:906:9fc5:b0:ac6:e42b:7556 with SMTP id a640c23a62f3a-acac0056156mr260830466b.11.1744300415611;
        Thu, 10 Apr 2025 08:53:35 -0700 (PDT)
X-Received: by 2002:a17:906:9fc5:b0:ac6:e42b:7556 with SMTP id a640c23a62f3a-acac0056156mr260828166b.11.1744300415150;
        Thu, 10 Apr 2025 08:53:35 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.213.163] (93-33-70-196.ip43.fastwebnet.it. [93.33.70.196])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acaa1cb4104sm297000366b.99.2025.04.10.08.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:53:34 -0700 (PDT)
Message-ID: <5cc73887-1073-49d3-8267-0e84483bfc2b@redhat.com>
Date: Thu, 10 Apr 2025 17:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] various: Define macros for dependencies on
 emscripten
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <5f2a8fa2d7116b1d65b79fbb3a95244096fb7308.1744032780.git.ktokunaga.mail@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <5f2a8fa2d7116b1d65b79fbb3a95244096fb7308.1744032780.git.ktokunaga.mail@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PKU8bUF78CvCt5ajPfem1ZhwFSdL7eRWZJrhQ2GVHn8_1744300416
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: KAgCVbuVc6jE

On 4/7/25 16:45, Kohei Tokunaga wrote:
> +#ifdef EMSCRIPTEN
> +/*
> + * emscripten exposes copy_file_range declaration but doesn't provide the
> + * implementation in the final link. Define the stub here but avoid type
> + * conflict with the emscripten's header.
> + */
> +ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
> +                             off_t *out_off, size_t len, unsigned int flags)
> +{
> +    errno = ENOSYS;
> +    return -1;
> +}

Please add a file stubs/emscripten.c with this function, and add it to 
the build in stubs/meson.build.

> +#ifdef EMSCRIPTEN
> +            error_report("initgroups unsupported");
> +            exit(1);

I think it's best to add a new function os-wasm.c in addition to 
os-posix.c and os-win32.c, and disable all the functionality of 
-run-with and -daemonize in vl.c via

-#if defined(CONFIG_POSIX)
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)

(there are a couple occurrences).

Thanks,

Paolo
