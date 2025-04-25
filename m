Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4426530njd;
        Fri, 25 Apr 2025 07:53:08 -0700 (PDT)
X-Received: by 2002:a05:600c:a06:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-440a65d8e66mr20259145e9.11.1745592787882;
        Fri, 25 Apr 2025 07:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745592787; cv=none;
        d=google.com; s=arc-20240605;
        b=lTj4D5VA7K0DipOeeji4ev283VGtkTXdkVn1blMmVrxRmprDocmIyIOH3s8PgzBhj5
         QvN2PlF0l6ve9QITvaG5W2WuX+oItNq7yR5lv/M8HgSyW+kerkouPZ+dTu4KePG3rHBQ
         xjSuYPh+EWzztSFJkfJ2Dk1rblV5+XOm5GUP0sIFCDfbR1ayA79As8UtRUR0T0V1COqW
         zG2KBvm+93bS28fuNaXQddIP6JaW25ES0cscEW8sZAjcH5ijXjQQGy7YK2uGj9uyeUyj
         j1KyY5JcyP0KLeSs7ENH015o/tgKjRUyKsx3ZjiThOZLHWzpaDbwZ0DWgl7DFzy58XEx
         AfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dUNdomSLMAMAzzETVkOXhBvDhET6oTmnmbhrlDPxTkc=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=PEW31Z6Yg2xRyPs3WuRutJnMi8GTS7cylH45HehBH7Q3Mexg8gH/BHQOm5Uc+/GJE8
         SdhjLmLXJksKFs0podPvbCFXsmTXpVzH6jT/SYS8IeGR3PAmoKijc/B/BBD56ZVKdTni
         +3kSFk3etO/vLYoCKrqGYhf/nr0ldCk4s+T9KgM9L3Ergz16GZk94v1Y5spt3buKp9UK
         AFY59+k2wbsxTxjPIV2tz69lE+kHfNOSzB+X9krEXdAv9W6xJLOhG8vAvf0881kXCbUx
         DhXjKbVi99jzF57SL9Hxs1iU/KiwGLyhBabSt8XAUj0NuJ9hzvzpsx8dsKmeTj8kQlHK
         Rycw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jw/XwsgX";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4409c332aacsor16629855e9.10.2025.04.25.07.53.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Apr 2025 07:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jw/XwsgX";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745592787; x=1746197587; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUNdomSLMAMAzzETVkOXhBvDhET6oTmnmbhrlDPxTkc=;
        b=jw/XwsgX2ywumuCDB6Pw+lCtIAkDgG1gzZEfS+lmxQ2KYTOgLE+vI5HA4jG5ETzYtR
         vN/Vj6mtkOq5vYHzn9r1NUXxyle8By9/ShqY2a3cqRVBn79PQhSrLbpVOBkZUva+BgBZ
         HOcVIsdeTZUMJahVg2Dp8L6Tp5gA0oi4UbsgmVlYjEr2v+BxgHj6/b3OgkzLEb7cuEKY
         ciXmyJtqOXyf7Rjbilz++qr61reN3jTLt6QEcwoVQ3Vl3gGrmFmAQSSJDO9vU07LI8FY
         HHeAyeoNLH9Lkv7bncbVvMbgTOaqZ+9sVPOngoWio4CqK/UDiimGSMYjbycBuh+91H4+
         OO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592787; x=1746197587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUNdomSLMAMAzzETVkOXhBvDhET6oTmnmbhrlDPxTkc=;
        b=Xaz7c/E9nRP4d4kul9rUrQh7KeMkGRvJ5QwKdpEtr/32dXcxPZAzF1Bi+n2UiCjucu
         O+UB5aC+B36qr0kGCoLNVfb1TBkbYTjEloJ5IziztH/iyD+sUuND4G5TtxKKQNaD654m
         s2dusVJjejwEczeC84My0pa0rJdgIew28HfxxpgrATt2A30dnPHM3UKXeHtRyosoPm2/
         E3+CbpBqZlwPQdpdw7FxQN0RlLRoo7PlEfeFDam+nz4Y2CDjFdGj1DSweGOxlw9TIgGk
         GDVMy3czNIcPexiGkAoROY+w46OM7/Igxn5Nh8hnTt+zGQzKHURFPy/yEYnKZ+zXSbv9
         6DTw==
X-Gm-Message-State: AOJu0YwO9/Dugzc9tv3/m8L1YXsghrRAY50Ou3jn7o8CpnUW5Aqwtfty
	ZB6WCQeE5jRr7YDxyo8dbcgsHrLl9Jae3ZseSfz5tBTKCk2QR/4tsZDO98N0ub6Cng==
X-Gm-Gg: ASbGnctZ0scQzDx0+9x5uubdGZIIuUw5b0ADFfycEcYOQHSPHMdCVs1hyV1eWDM5KOR
	hkP2KeUDLv0hZIWQWeCakQ0jij5DYhew76VltBHqQbMbC78jjVM/qMt63nNugERc8ImdB53WBEa
	jA2CmDj5IVhmGf/eS8O6MlCwlOpWg0xIgVp1rrg959eaIAeak2bufbYMtfWpWNvKrlF3jUmPROk
	JaPO8fk59Wp71N9nv2sV5Da9CVziTmgDhZu8bnIS6PPp96/Q4joaX8wJvrT7F2A5nxYFRQ8R7lC
	SkIqpMHLCPsdomeMqkt2BcxRGlpI/lcujTp7UWxHhHer3f/2BZSeTnnuMFH8IC2xTBAid0V8rnj
	BfHqKgxhI
X-Google-Smtp-Source: AGHT+IFACxj+c2eF1ItU+T531+Ds66WdauIfs8lhn5+qYkE3vP3oZJahvoUyRmW2pxXeO8K7N7aPdg==
X-Received: by 2002:a05:600c:1547:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-440a65d8d6emr27324645e9.13.1745592787197;
        Fri, 25 Apr 2025 07:53:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5303c15sm27051805e9.11.2025.04.25.07.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:53:06 -0700 (PDT)
Message-ID: <5b7afc3e-d5d3-4485-96ab-a1b212644607@linaro.org>
Date: Fri, 25 Apr 2025 16:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/20] target/arm/helper.c: Fix type conflict of GLib
 function pointers
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <01b21c849b459660453eb905d12ff0da4c65f53c.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <01b21c849b459660453eb905d12ff0da4c65f53c.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: z6CYRzNCbxmw

Hi Kohei,

On 22/4/25 07:27, Kohei Tokunaga wrote:
> On Emscripten, function pointer casts can result in runtime failures due to
> strict function signature checks. This affects the use of g_list_sort and
> g_slist_sort, which internally perform function pointer casts that are not
> supported by Emscripten. To avoid these issues, g_list_sort_with_data and
> g_slist_sort_with_data should be used instead, as they do not rely on
> function pointer casting.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> V2:
> - Updated the commit message to explicitly explain that function pointer
>    casts are performed internally by GLib.
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bb445e30cd..05793a6c97 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -220,7 +220,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
>       }
>   }
>   
> -static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
> +static gint cpreg_key_compare(gconstpointer a, gconstpointer b, void *d)

Why not use a gpointer for @d like in other patches?

>   {
>       uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
>       uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
> @@ -244,7 +244,7 @@ void init_cpreg_list(ARMCPU *cpu)
>       int arraylen;
>   
>       keys = g_hash_table_get_keys(cpu->cp_regs);
> -    keys = g_list_sort(keys, cpreg_key_compare);
> +    keys = g_list_sort_with_data(keys, cpreg_key_compare, NULL);
>   
>       cpu->cpreg_array_len = 0;
>   
