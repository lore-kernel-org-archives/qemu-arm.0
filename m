Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1012503njg;
        Wed, 26 Feb 2025 08:15:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBcHhVZNEF86/XUQkwUbWVDPYaqpcuGpa2kvq/HwyJruJCswAuY1dzO6fHInjMEyCoUyoS
X-Received: by 2002:a05:6122:2683:b0:520:98ec:b25c with SMTP id 71dfb90a1353d-5224cbbaccdmr2306882e0c.1.1740586550280;
        Wed, 26 Feb 2025 08:15:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740586550; cv=none;
        d=google.com; s=arc-20240605;
        b=cv3bowmqYCKr/qliyvkV+shchHFhE9ktxGNyXutBNQUQ7UO56B+AysomsvVUdtKOVr
         mAk8buFBE+kTIIZFdpvl1v3d5wyxfMkbrJx6USH7HQqxQRjBYHA/1muOGEML1SoUhc1L
         DQJRaHGG5ACBBI6hfFu2iqjYb0zVcdNbHu0jHxStugBYvip1lXP5S3IIkG4q/CVWw2Yq
         u0yDDSRU3Hg2OYpWeXzqFeyH7HG/hStfBmv1L/7MlR7RJijo6B2rF43MTleOvgffq9SP
         YU6QnMmKD3mR6P3WSUYBohTu4YGw5taGFm3fljj+6hUaslSsSpsq7i7UUl8DoeD3URC9
         uMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=cgVCleQy6VV36R+FJeQRA3lc/wl+PQVefuez+MAXM3g=;
        fh=kMuyKEDVLpXx+n9GsiCpA1spgm27ONyskfB4MRxywKY=;
        b=ZZMljTCo/Ex3KA5KUiDRhuIGOsKmUFrLQ/5vQcJmnonu/VhT9oPUlEqyDZzZTtIX6X
         YJivW943e6rRbT8uARjVoE+i2xXi5QFK9Ws1Kkvz3YNU5t0Xf5B2/UD8Rc+KZiCMjw6V
         RCFNeC+AmgCWEv31AgfkBUXKnvTAhKeuNwBovetkzvMg8513b12lGzSO6Pv/+/U2t7F6
         OO4X3LPx+ngZFst5OZnvBd+bocZaKdRmoreV56tvV+xwDci1WTxmJjVMzLtC1m4zLcAl
         SKwOG60/RDHGyALngNOrKKLgiZIPqVfwbo1jkPPKgcctHlzPcOJvl3NBETJ/y6+0F+6/
         RvJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h5weErOw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5223e06dc6esi757322e0c.68.2025.02.26.08.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:15:50 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h5weErOw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740586549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cgVCleQy6VV36R+FJeQRA3lc/wl+PQVefuez+MAXM3g=;
	b=h5weErOwp0zBsiaoho2ElBZEKQymXlYdSWQDUwm+bkyG6P0fXiRDCCWaLM30kZG4fwQqqz
	02CpkB1dcnGk2CkYwjxNAedD9ztVQq+Nt9iyvEP5erfjnvn+dRaLuowYsTCg3rFnAJyYXo
	xswdtVzoCF6eoXh4GAQGxjoFuz071fc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-mXl_xjFbMtW2PIqu5_MeRQ-1; Wed, 26 Feb 2025 11:15:48 -0500
X-MC-Unique: mXl_xjFbMtW2PIqu5_MeRQ-1
X-Mimecast-MFC-AGG-ID: mXl_xjFbMtW2PIqu5_MeRQ_1740586547
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4399c5ba9e4so38255765e9.3
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 08:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586547; x=1741191347;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgVCleQy6VV36R+FJeQRA3lc/wl+PQVefuez+MAXM3g=;
        b=rQyRb17/IzfBao1v+vl7lU64JsZ/AAIcDRfB1plGAWbOakESaZjCet+LAjKNUqXiXC
         9Wfj9vuFHlOuH5g4tw53JuecjXPRT9DkGWqkOFF9Mgg3+2IhSTuYO45hOuQZZfq98lCd
         5JtHNPq3Ea6SzqCp3QoQBxEiC78BU383bSw+W4+Dhgd1Yv3BYMuInUJT8ouQufpIUJiV
         IuAynmMmI59dKDEtxI9BVoZllV651b3GzctKJSUfel7aBVVbLX4BcOfFL8/lsxv46ni7
         Qr2Zjw1cowjR1A123FaerW0klgoFYUfqh8nmq0LqTS1roy/fQdPJXW1/rJ1h8SOOth2x
         nEAA==
X-Gm-Message-State: AOJu0YxoIKRSZLfUJuVGfG683anb6CcHGqZRPTnakA2k1UqfvHqMVlpp
	y8Gad6//ZK4jeqltQWlS/4zWFTv1A2TALBh6hln4JfITPyL12GdxEOgdImEzC+ZLZWsdDPLxU7O
	GXLGJtPczjJlwPj+YfQJQACNF4yBs9sUzqG+tMCnt7fwEktgEPFjNbCDELaNEkAluZFevo5z9/m
	Lz+A8dz3cPntMW1kl+Hn2OkA56u9DEEIju4g==
X-Gm-Gg: ASbGncsAjURtP7bn5FmFa3vko+XUm+ELYZocLUJB6eI+67KLvTge+8liE9PBYG+jIV0
	hNhzADpOIcpFIl0eMRsEgYPlAu+tIsjffqdKnj9PCp/7wSfhySywwtq0Y4vNjbkkaTrFeFU0+QE
	8Nd2ZixQTk+vjJcqxe2xkMzZ5Eii3IeFjyeplClfLzAMx5cWYyrFiil5HCSqvYA0ATvrT20hCpD
	dujSEZy6hfMvJVYuHFeedVIU5ISuchzje7TKo7fSq/AsDKD2KF1kyNCwDqiO+557ajb3vPA4vpR
	4XFWUON5TQ/0l1ezyCTNJlEVugRT57/8Df2VIqBKWm97ZCk=
X-Received: by 2002:a05:600c:3b8e:b0:439:99ab:6178 with SMTP id 5b1f17b1804b1-43ab0f2883dmr70599975e9.6.1740586547252;
        Wed, 26 Feb 2025 08:15:47 -0800 (PST)
X-Received: by 2002:a05:600c:3b8e:b0:439:99ab:6178 with SMTP id 5b1f17b1804b1-43ab0f2883dmr70599475e9.6.1740586546878;
        Wed, 26 Feb 2025 08:15:46 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba539445sm26580685e9.22.2025.02.26.08.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 08:15:46 -0800 (PST)
Message-ID: <cc8802a7-20fd-446d-ac15-e593333360b1@redhat.com>
Date: Wed, 26 Feb 2025 17:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/25] tests/vm: bump timeout for shutdown
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250226140343.3907080-11-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oDOcYP0NO2y5JVJ-M88xbBA3Y-VvOOJ_W2Y2ooxfmE0_1740586547
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wGox4v7nYDNE

On 26/02/2025 15.03, Alex Bennée wrote:
> On my fairly beefy machine the timeout was triggering leaving a
> corrupted disk image due to power being pulled before the disk had
> synced. Double the timeout to avoid this.

Triple the timeout?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/basevm.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 6d41ac7574..9e879e966a 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -83,7 +83,7 @@ class BaseVM(object):
>       # command to halt the guest, can be overridden by subclasses
>       poweroff = "poweroff"
>       # Time to wait for shutdown to finish.
> -    shutdown_timeout_default = 30
> +    shutdown_timeout_default = 90
>       # enable IPv6 networking
>       ipv6 = True
>       # This is the timeout on the wait for console bytes.

With the commit description fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>
