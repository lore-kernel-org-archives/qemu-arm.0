Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8500712njd;
        Thu, 10 Apr 2025 08:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMXj0OkMR7biWjKddeh2srm0yj+pIqD+pY/6jppxfkASXNEIOHXCb2Iw+R5zbhSOLW8BpG
X-Received: by 2002:a05:620a:178d:b0:7c7:a604:d28e with SMTP id af79cd13be357-7c7a816d1fdmr410493185a.33.1744300732501;
        Thu, 10 Apr 2025 08:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744300732; cv=none;
        d=google.com; s=arc-20240605;
        b=dtj8WTaoH8TKElTFl/0Kzttbd7nO8MOg/eJz4zxvehbLzyX8yywmJ2QZKt4jk9W/ee
         oarVp7XD9/z6NENvAjh2RalzYfOgGCqr8ejcnlrJx/LrJAOMYFUM7kpxr2RIqfhanVyD
         7HIHQ/AGMgSCYxYn8088GScVlOaKrEBUy+iMUn8qTb8TBPuvbo4rK4ca9i0APqhUBc2U
         No3z5BWsX+dj+GE4E0CK6iEb4fkSx5RMGUXgxDVzzST3sBaAh6IHsnyOM4Y+u7fmeDzt
         /aTOabZP1sX9WOpakT/a9I6oBDu0UUAW+2jsLKwZEWvuJmN8pm0MWyhFMiDUQruzKmC8
         Z/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=y7YNPVvDGegBMftMugeCjfwZ2qjrwxZyvKO7qoUnSKE=;
        fh=0LyyC3Lf7bfONIK9uHTS0OLml5VGpDElWezRaxQ6lDI=;
        b=IEzMC0FEHBGcHg1Eoe6chuqFwOMSGsDMQBL59AAuqNn8EcEjYhroV1qKIFGzh1lXP+
         wHvDg81tmW3pc2dhqeu4uJ610hJBohCPOYr3AbsgPwh4K8W7MLjHgfO5PIfYxCUkavax
         xaICs5cWHBeE8j3TZvK+1RYcrnALm1ckDy/+Mbac7o16oX8Ds9G0znBVAdl5AL7MVogV
         TFlYAdzbK5r+KYC4SUs4NtC6hSFnoVMqbcPYmFXngqgEEeCSubKmvKc6LODbL2s0qSYA
         OJd/LWHiAV0qZ+9g6omVaGCjNBRYoAl0U3RwrnA+HJ3hRyDIlnSUfk15qTbuFXKft+sx
         zAPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dt0AcqNP;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a89f6745si120422285a.245.2025.04.10.08.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dt0AcqNP;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744300732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y7YNPVvDGegBMftMugeCjfwZ2qjrwxZyvKO7qoUnSKE=;
	b=dt0AcqNPGvBmgLrVt3iahkdA+VQW68dRet8/FnSS4iiA3EDDNQ/X6fiAoiG06z+YxfGx+D
	9phjcKZoCtY9onuKVI/6NTJwbTo2FMVrXnlA5R4nOyEb4w5FWS79T5vA4lOT+4nKA7RakS
	ooRvXJNk4qsqPATrCnRiq2c2APS7Xjs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-WL7w4wTDOvC9z7HWiVp0jw-1; Thu, 10 Apr 2025 11:58:51 -0400
X-MC-Unique: WL7w4wTDOvC9z7HWiVp0jw-1
X-Mimecast-MFC-AGG-ID: WL7w4wTDOvC9z7HWiVp0jw_1744300730
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e6c14c0a95so847415a12.0
        for <alex.bennee@linaro.org>; Thu, 10 Apr 2025 08:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300730; x=1744905530;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7YNPVvDGegBMftMugeCjfwZ2qjrwxZyvKO7qoUnSKE=;
        b=Qq0BAJCm+txUROSJJK/JSJwTCJLu9FrdnQdpQB4Rol8trTROx6eoRZpZ3rPxHA3P5k
         d57BSbap1uilNmQfOHuh/SHFUuI9ZI49ceiveOmknn6EiXOsnWzhCWq3Xod5nAF0affM
         ovLRp2i5rBc62BDQ74b2hYexQxo0EqU7jNxntzH+zGwbovOdnnT7ZnPDp81l2VpsyL7Y
         08vnBh6PUMPiqJ0kxWneH+3oaqBqDWAykVPQyU3FZYwAmkYLMV9VbD0riDTmaizjPBYw
         U74Dh0Puwa+sREVF5kpKnwWSnOR3tm+gXDOR4tPpR9rVPJQ2vtZJeeXZhv33bZu6b0BV
         tCdA==
X-Gm-Message-State: AOJu0Ywpt7sH8Sqj5DDDcckMBnG2ReHVgs8THSAZEccpO3moGHdenCRh
	0D2aw7PSSo59CoyCcLL8zgvRjq4UifrBsk/I8U2aGtKyLWgBE8FDsqI+4DsH8tcYybCPJT4E/jy
	GcBK1bJK3A6t1j/s/kJ/VsK8J2y3bWHIfQjBZ1/WGUeRhrQBLV3fpEA==
X-Gm-Gg: ASbGnctwNKiYv/pqqGxgoMoVpFL8gptn7621wZQekgfU6bN+4UFIb732dG/SLc56g3A
	SQ6DJTLwBwUvmMcfkFNAyPk5fsyl1haYs0vJBEus1XT0IqiJILYx5JE2GPZpCUZHiZVuIFvZwxE
	8KO35BuQZDXByItOZ0f7mcDUkK1+xokRhXCPWG8qqgrrcaYVuJtpbl1NveiTajxKR1k29PN2FLD
	9xnqU+nTI/bjXccitrXzTH0/m5VW/cEE7fOVgZHjyX+I5PtBLf40//JX0++J+kgjpK0/2muTg9Y
	IzQjJHxo4xQe+cC301cWcuDcUqyKs5H1YUsgP+yKotqknZ1MWA==
X-Received: by 2002:a05:6402:35c9:b0:5ed:c188:8e7e with SMTP id 4fb4d7f45d1cf-5f32930f5eemr2740171a12.27.1744300729806;
        Thu, 10 Apr 2025 08:58:49 -0700 (PDT)
X-Received: by 2002:a05:6402:35c9:b0:5ed:c188:8e7e with SMTP id 4fb4d7f45d1cf-5f32930f5eemr2740156a12.27.1744300729357;
        Thu, 10 Apr 2025 08:58:49 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.213.163] (93-33-70-196.ip43.fastwebnet.it. [93.33.70.196])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbd3d9e1sm2461618a12.76.2025.04.10.08.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:58:48 -0700 (PDT)
Message-ID: <65a63820-e59d-47d4-883a-4affe40f9b38@redhat.com>
Date: Thu, 10 Apr 2025 17:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] various: Fix type conflict of GLib function
 pointers
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
 <2be81d2f86704662c9fa33ceb46077804e34ac77.1744032780.git.ktokunaga.mail@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <2be81d2f86704662c9fa33ceb46077804e34ac77.1744032780.git.ktokunaga.mail@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I-Tv22HNXOGra0IeeGXaTWr3D5Q_9Z3oEMlgnufvISU_1744300730
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: x1pOAwP6261w

On 4/7/25 16:45, Kohei Tokunaga wrote:
> On emscripten, function pointer casts can cause function call failure.
> This commit fixes the function definition to match to the type of the
> function call.
> 
> - qtest_set_command_cb passed to g_once should match to GThreadFunc

Sending an alternative patch that doesn't use GOnce, this code runs in 
the main thread.

> - object_class_cmp and cpreg_key_compare are passed to g_list_sort as
>    GCopmareFunc but GLib cast them to GCompareDataFunc.

Please use g_list_sort_with_data instead, and poison 
g_slist_sort/g_list_sort in include/glib-compat.h, with a comment 
explaining that it's done this way because of Emscripten.

Paolo

> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   hw/riscv/riscv_hart.c | 9 ++++++++-
>   qom/object.c          | 5 +++--
>   target/arm/helper.c   | 4 ++--
>   3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index a55d156668..e37317dcbd 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -102,10 +102,17 @@ static bool csr_qtest_callback(CharBackend *chr, gchar **words)
>       return false;
>   }
>   
> +static gpointer g_qtest_set_command_cb(
> +    bool (*pc_cb)(CharBackend *chr, gchar **words))
> +{
> +    qtest_set_command_cb(pc_cb);
> +    return NULL;
> +}
> +
>   static void riscv_cpu_register_csr_qtest_callback(void)
>   {
>       static GOnce once;
> -    g_once(&once, (GThreadFunc)qtest_set_command_cb, csr_qtest_callback);
> +    g_once(&once, (GThreadFunc)g_qtest_set_command_cb, csr_qtest_callback);
>   }
>   #endif
>   
> diff --git a/qom/object.c b/qom/object.c
> index 01618d06bd..19698aae4c 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1191,7 +1191,8 @@ GSList *object_class_get_list(const char *implements_type,
>       return list;
>   }
>   
> -static gint object_class_cmp(gconstpointer a, gconstpointer b)
> +static gint object_class_cmp(gconstpointer a, gconstpointer b,
> +                             gpointer user_data)
>   {
>       return strcasecmp(object_class_get_name((ObjectClass *)a),
>                         object_class_get_name((ObjectClass *)b));
> @@ -1201,7 +1202,7 @@ GSList *object_class_get_list_sorted(const char *implements_type,
>                                        bool include_abstract)
>   {
>       return g_slist_sort(object_class_get_list(implements_type, include_abstract),
> -                        object_class_cmp);
> +                        (GCompareFunc)object_class_cmp);
>   }
>   
>   Object *object_ref(void *objptr)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bb445e30cd..68f81fadfc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -220,7 +220,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
>       }
>   }
>   
> -static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
> +static gint cpreg_key_compare(gconstpointer a, gconstpointer b, void *d)
>   {
>       uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
>       uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
> @@ -244,7 +244,7 @@ void init_cpreg_list(ARMCPU *cpu)
>       int arraylen;
>   
>       keys = g_hash_table_get_keys(cpu->cp_regs);
> -    keys = g_list_sort(keys, cpreg_key_compare);
> +    keys = g_list_sort(keys, (GCompareFunc)cpreg_key_compare);
>   
>       cpu->cpreg_array_len = 0;
>   
