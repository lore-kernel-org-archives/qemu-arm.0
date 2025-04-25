Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4245068njd;
        Fri, 25 Apr 2025 02:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUdY0uK0Da2q2EkAJdId4fOeKDWEChSuv6MoLzQ0Pp7KP4BEjThozxQcvNL4y1AN8u3XCG
X-Received: by 2002:a05:6214:529c:b0:6e0:f451:2e22 with SMTP id 6a1803df08f44-6f4cba6325dmr30073956d6.38.1745573643270;
        Fri, 25 Apr 2025 02:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745573643; cv=none;
        d=google.com; s=arc-20240605;
        b=DvScXHcY5XqsfW/05Cub0wqH+DLAzZORHNb6bpAIikBjlSvzyEvtk40TNB9aslz1E8
         IRyGcmgGnO6PMMEyP2VqbjUFcaEDzUgSHuK+NcjCw877HHCu1cDLagsMcSgF3ufzgpoc
         ePXDcxiwAndWkZiDxOjvFKi+Xpz07uKCHtmYf8npsKfe9bdfSoimats9aW8Z3kGkgXFc
         c6UlcQiEWUZXyldfnIxNxcgA6GsaVQp76iiv9d4PSogiAVljcgGFso/vEJao3W8MtpjN
         aHLmuXE7DkgdHaOZBc8c5GCyAnQKj19y2bOeb57ud4xySvM+nsmy5ibeVItE6GRHHPob
         +FJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=D6PGsnlK5Vh+UCAaUICO19znxR7i/Mlszp8yylYbsvA=;
        fh=jC9dA94hH7p640mTMkvVU7I1jgLg3koZcLsyNxOpJAs=;
        b=XiVbGnlwM0R0TtB6qyysweF9H7z7HkbH6ZZWPv5GnQ7EXRphXUuLjJsrOrE7IEsYQh
         6FmpoMveGkGR3zqKrPEQTZOaISDVL3YfY7P6+wKZ0Zd54/5zU7+lE4EHhTroPQFz8ZAk
         vMz9Zeo6O4ZmVKnaaXFXSUSJRuail8dp0A83568rVRMHmJuDPnVXIL7rhwh1VOVC3N9g
         VzkzPa39uXTNATb+qG/S9apMSR5HZnZnZ27z8P2KgpI2jJbgbFqlwHqji8SO7ylA9jDd
         DxomOlm6qPFJG9eAxkLWMIUW6ZkM8ZwSj17wAu2pFLyCMzjtXWIDaqZs3WXXkqEyWs/h
         eQIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxHd+ZsY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0b22188si34452606d6.502.2025.04.25.02.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxHd+ZsY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745573642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D6PGsnlK5Vh+UCAaUICO19znxR7i/Mlszp8yylYbsvA=;
	b=OxHd+ZsYwSoySLLmUkiLwIh/LVlXJefd9FHSSjcMtA3IWJb2qIdAd1P69QIeBdvAQYjeZ7
	+nV+VoWmKq4yx/xsv2tWVPoU7zunEpS6hGg7pninE/wWrMZUGwiRPxo2XvXUnq7llfz1tu
	7tRJNk9b3CC4zikAy7BsyxJ5b3jXZNA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-3bL66zu5O--VACmRABxTvA-1; Fri, 25 Apr 2025 05:33:59 -0400
X-MC-Unique: 3bL66zu5O--VACmRABxTvA-1
X-Mimecast-MFC-AGG-ID: 3bL66zu5O--VACmRABxTvA_1745573637
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so9481085e9.3
        for <alex.bennee@linaro.org>; Fri, 25 Apr 2025 02:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573637; x=1746178437;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6PGsnlK5Vh+UCAaUICO19znxR7i/Mlszp8yylYbsvA=;
        b=JolypDY3mMr4flrVjq08OPCfJNc7/9M65p0jaKHOhwor3OUw/oLFohgh8ECDFP7chG
         okKPZeDBon0If01hmYK/3nUriH3oflvJRv482VeZlah4+jKhMXwFR3UORVtjJFSS8XIT
         XrDmcAiScNKwDJjRusPFuQnlEv49420K2NvPSJgYVJjsYGa1tRdzGfXOERVZnF06PsFW
         +Z8amKLqkV0mS/1Lk1ptZJHSCZYlgx7HvHchlM0eO58cPLQxJVZBIEo62EmBiIBDYCn+
         EmWnKSmV0YCoH7mc9LbMtPzDOzAdn+/v0Z4e3e+q0zCdfAequsWyYxdFUztQ1eVicAM5
         EOzA==
X-Gm-Message-State: AOJu0Yw24HE2c1DP++PvO8RpUo0h9CbEH9Boh6AtpB7o+ajraU8f9Ix6
	qZKu37PPizPihL39yaqsaLdq5TfKlo0wmxn2zgZ8sUjlrZVtxO+qcqnFAF4sVFm6MMnB6C3NEs1
	8bf6R19lwQLdl+qs7NUa3mmf/RzxiVya8ImSQ27fjvC90GL/hYT6WaA==
X-Gm-Gg: ASbGncvYAxkRGNF3ZZUjZXLp+UW5BO2GZfN/hSOAU7FYAGRLKJ5qO34ik6yncddjEhz
	1CTqwILdtpuGKT9HxPGb8rA2mVEhYAelQouZytBEQRgkQp//H7NQM+4czjGxQKTdG+jkFen7h3g
	AQA3JGNYhHfo33j6neQ6lMTAocKAVqJBuntY1iO4UWVMEf/sLIQ1M+3LRDo7i9yGLnnuMm+Yj5c
	tUbkaZJW3llbew9A3lV91Ai0E36m/4BqtLh4U/JXEOgsulerAuP4pzLJwTDagV9wo+1vaO6oAKC
	9KkQ3bZs2dQVXMSUK9Iz3A/3ruKQq/ZDNknZuTYSI9zfYQ==
X-Received: by 2002:a05:600c:190b:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-440a65ba213mr13003715e9.5.1745573637286;
        Fri, 25 Apr 2025 02:33:57 -0700 (PDT)
X-Received: by 2002:a05:600c:190b:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-440a65ba213mr13003255e9.5.1745573636866;
        Fri, 25 Apr 2025 02:33:56 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-43-178-177.web.vodafone.de. [109.43.178.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm57894065e9.2.2025.04.25.02.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:33:56 -0700 (PDT)
Message-ID: <f7e1ca0d-b368-4cf6-b964-111722789b90@redhat.com>
Date: Fri, 25 Apr 2025 11:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/20] target/s390x: Fix type conflict of GLib function
 pointers
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
 <1e55b633d50567e8b145c98f626af5ecd93001f9.1745295397.git.ktokunaga.mail@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <1e55b633d50567e8b145c98f626af5ecd93001f9.1745295397.git.ktokunaga.mail@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7R_ATRSReQDiqYZG_LtDy7dXz0Cy11WTX4_Bzyh_xZ0_1745573637
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: tn26UmUzWyhU

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
>   target/s390x/cpu_models.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
