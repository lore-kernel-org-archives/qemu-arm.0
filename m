Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4246146njd;
        Fri, 25 Apr 2025 02:36:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU2mHRyzeWx3vuiXHAOXA2OLrZZDduoS2oW67oflD/EdWK8LPe2ZDJj5AIPnXdqpJz8al0
X-Received: by 2002:a05:622a:10b:b0:476:a90b:986b with SMTP id d75a77b69052e-4801cf520d0mr22913931cf.28.1745573812382;
        Fri, 25 Apr 2025 02:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745573812; cv=none;
        d=google.com; s=arc-20240605;
        b=Dt1xuKCKVZp1rp2mBzbCXgDuxKw5YMi/mo7xCzee7y7WpRBSIUTRPgX3hp9uqQsEqE
         UC3wPfIYPWtxqVYhLo7avLUeMhSyh3jHXsVgamUWeUbXoQIKsVuODIc06YomF7pCuUif
         NFHBA1YZuM7Wwb3RonwxGptQ8MWR8UY8Zv2v+oG6Vcfb5DQZ9nWBSOWeGrE3leubdC5v
         TX7Hy0F6/MhiMp7KfRLlFs7mwKV4f+YJH/F18g+Ru9etpjYogFOKH0DKAvlDJJX1MeSc
         6DBFHG313iM2SW/sCMOHN1n8HI0Zg1rUH1PZL7CKa4MpgwUe0bjB5+SUiH5A2HzvVK47
         9rNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=FgYWcYeS7GIlMsw7ozKqZq9tL04pzUlDbu50KZn1Wh0=;
        fh=jC9dA94hH7p640mTMkvVU7I1jgLg3koZcLsyNxOpJAs=;
        b=gKS+pttq7vlOaH4K1rhOTkVwQIAEubpCnn6BImI2VRBQEXJP7k5bhflcISC8dmHdCZ
         SpGpVmodOBDs48a8cxJVYDiR5yqZfnhLSJn25NWhONeoJA6srLKbl+9U+IITbhOrm1sr
         KYUEr2UK3ojr50SfrC+E3Ck5PF9lpkSiRw+ei1x56gtsITzKU66e+BYzH4IwGEQC3QPp
         puYlj/Co9isS3dmn+DhD1brLe84gsiT2BrEjHrHLCmK2vD5cTibk5zsn4raz3joZau+K
         1mgOr81djoHfpOKaYR0FA5OFU9beL+rDJQ4YfAYNdpFJLFCYA0aIkoHUf+Gibvu/tpKQ
         gIKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=av5oZVNe;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1996832si36578851cf.299.2025.04.25.02.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=av5oZVNe;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745573812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FgYWcYeS7GIlMsw7ozKqZq9tL04pzUlDbu50KZn1Wh0=;
	b=av5oZVNeIsAVAo9RtHl6my4+OZwfYQQN4Qn8KZVig7EXAJB8Ajar4FK5gn9y5UdK1eZbeT
	8IDFRJSWAZcVvYEhDgp4i488zVFgEuUiSOv/MLSMYh12SMS73GaucaTTPzl0TGi+GJnIzu
	wibjoprUMjnnkyO0d64VfifXKK0rnQo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-5pdPcySPOceq_jBRWjpdTw-1; Fri, 25 Apr 2025 05:36:50 -0400
X-MC-Unique: 5pdPcySPOceq_jBRWjpdTw-1
X-Mimecast-MFC-AGG-ID: 5pdPcySPOceq_jBRWjpdTw_1745573809
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so12093875e9.3
        for <alex.bennee@linaro.org>; Fri, 25 Apr 2025 02:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573809; x=1746178609;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgYWcYeS7GIlMsw7ozKqZq9tL04pzUlDbu50KZn1Wh0=;
        b=hp0C5jKcwhYRczzhN5RrDs+/eYyTkxxNmTLZF1XCtax7ytSnbkq3fwEb5mh7o+Rcjn
         OmG8n4J3Biy2JZE0V4N52LlAHCcBLC/gQPJQiiQr13Sk7llFx7sniQheMAWa3jyE0AZs
         /za9Rj4r4UqaDRARrZr2br8AmHLNhOnec/B1YTxIzaTgJ82c8YpHZSw9ZdVbGpCcTU/A
         3oc4nMxUxHTtFF3qXI2P8JlCndaXsCDfIft7Voxs44jZD0ZDXjByguiPyElbU0tGsz6o
         SBRF8k39x9sQFxUtU+nXpwZFLkP6AccxXhEPzwLh/58aY0OAnPG0fWkvrAMr0Zk4QdOd
         JJ/Q==
X-Gm-Message-State: AOJu0YwC5I8orl2m0tTyZqwCZ5pscJgfqewuwLjv4fZ6O80CT0ge8K/U
	3tJvZYIS1JIc9Sf/Akz0vpqAC4WWc8MIwdkxwIkpbtTa/o0UoyMBXBwGfnIGganCcX+yNwNaOHc
	KJNDp0V6MCm2ydGkzZHv2XuiYwnXZVVo05aDP5/ktGFDmmF5MTKmS7w==
X-Gm-Gg: ASbGncuaUefxW02b/jjp9JFzY7IsW2WhO9CO/0mHY+1+UriV9P3S9IHg5YYzxAZwHcS
	wj5sSl2uQaCrwSNeKJeM1Vd1M1uY9fAiX08RFJ/pLnBrHPHPcdwQro5aQk5NtfDoMNzj+gHO4uW
	D3v4Q0Ir9/NjmXhSk9L74qkC++fROIH61Pgj/Gz8YMsyy9q6xCTPxDYzFjfmcg3N2GzUPkj0hCu
	qwrIrm7JbxQo8VD90KBwcRinYqJTaNbgFk8rWb/lGrnhhvvBZWTIaciFkC7bXR/IOnkSF6KKhSe
	lxPGKLjW78Vl2PH64z+UtkB58yFU7zskUZLjLfX98LJEmQ==
X-Received: by 2002:a05:600c:3b92:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-440a65ba302mr11423165e9.1.1745573808759;
        Fri, 25 Apr 2025 02:36:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3b92:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-440a65ba302mr11422925e9.1.1745573808443;
        Fri, 25 Apr 2025 02:36:48 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-43-178-177.web.vodafone.de. [109.43.178.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53044besm18764945e9.14.2025.04.25.02.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:36:48 -0700 (PDT)
Message-ID: <06c52d58-1b12-4036-b243-91be7a1b841f@redhat.com>
Date: Fri, 25 Apr 2025 11:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/20] include/glib-compat.h: Poison g_list_sort and
 g_slist_sort
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
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
 <edc1b2ac9a26dc5bbf9a3897e842fbb36c69ea87.1745295397.git.ktokunaga.mail@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <edc1b2ac9a26dc5bbf9a3897e842fbb36c69ea87.1745295397.git.ktokunaga.mail@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BvEyV08ZZNwgeQiXEXPRfSpSvM53C_4-9ywNGmP9x1M_1745573809
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xb7h7dUA8xaG

On 22/04/2025 07.27, Kohei Tokunaga wrote:
> On Emscripten, function pointer casts can result in runtime failures due to
> strict function signature checks. This affects the use of g_list_sort and
> g_slist_sort, which internally perform function pointer casts that are not
> supported by Emscripten. To avoid these issues, g_list_sort_with_data and
> g_slist_sort_with_data should be used instead, as they do not rely on
> function pointer casting.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   include/glib-compat.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> V2:
> - Fixed typo in the comment: s/insted/instead/
> - Updated the commit message to explicitly explain that function pointer
>    casts are performed internally by GLib.
> 
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 86be439ba0..53f8ea38d3 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -36,6 +36,12 @@
>   #include <pwd.h>
>   #endif
>   
> +/* These functions perform function pointer casts which can cause function call

Cosmetic nit: Multiline comments in QEMU should start with "/*" on their own 
line.

> + * failure on Emscripten. Use g_slist_sort_with_data and g_list_sort_with_data
> + * instead of these functions.
> + */
> +#pragma GCC poison g_slist_sort g_list_sort
> +
>   /*
>    * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above, allowing
>    * use of functions from newer GLib via this compat header needs a little

With the nit fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>
