Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp67691lft;
        Thu, 23 Jun 2022 22:40:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slm+JX7wjMKbigx+zZ8u8bvvTkxK9q6pqLf3gu1U8r3ZsAii0g8xrZl7Z7k0X9cQKg5oV0
X-Received: by 2002:a17:906:f198:b0:711:d5a1:6acf with SMTP id gs24-20020a170906f19800b00711d5a16acfmr11319692ejb.627.1656049257910;
        Thu, 23 Jun 2022 22:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656049257; cv=none;
        d=google.com; s=arc-20160816;
        b=Hve08eRBtgaBhYQWTGalt2zfCgIn6SkyknX2W8XonSmsoq022GxjlkZGdWuO0Uv/JS
         ignMSN91AN1guN0+23HYI1jvC1XE2hMa86K0SPyxb85BU45XOjC1s6cljcstU+KQX9TF
         84/ze/YRf5JsDWQ2FaIBsQq0GzvYpE1x8bnEkVwx7HAXKpvleX1JM+XuJaGYGaBP6umy
         KmO2xf/2tSnB0exayYB6BvylXY1n/J9k0tY8+rP2G4SB/ZKyqhLTDGTbyOIHlL8G6i3G
         ETk9Mo+b3UqvsvtWzurmT6JoZU1u4Gdy1gTWtIC+O6jsygkKGY5ZyTkMCvIlM+whmvFR
         ENpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NvZk4w/4NMxXzopQHF+1/MxkNYjHe8h3GsC16UgBLQU=;
        b=Pl8OvpB67T/m2wI/h542SvM5MZUp1iQaa9p1ppT/9BwG5ZNE0imdnMkIxRzdnWI6A1
         H2D7vBdDPkZcwYmCSlYPaMT7ibMyIGFqsjp4dTRrf1LIKKfjonCtBZuYB91Mop6dHMGL
         eWQlBjvsc9QOVmCaWXQVXAqTsmEQQLA7WZEP30w5aJIUL/gEiPCKkMoUhpBGKGDPbf/0
         IB8KDQgSKTND107d314WJBwJDdqfIuZPJZNwt9yer4BsMIHkubVtky/GPrVYZtWtJXOA
         rZ8gqGs1d+G1IrX4KXNyrFJw4NDuUHJuYfA45yPJXG40N/40RBN9UgRpzIqpiwox597P
         kl7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MAFbxkSR;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i27-20020a170906265b00b006feb8b6b37esi1161671ejc.907.2022.06.23.22.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2022 22:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MAFbxkSR;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656049256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NvZk4w/4NMxXzopQHF+1/MxkNYjHe8h3GsC16UgBLQU=;
	b=MAFbxkSRaFPCnVUv0TLISoaUkiEVAaLSw5jm1m0aM49DCYpfX3uxS+7KW80bV6EEIDI15/
	te7ljz56oTL/5GqX09XGQVfJCkKf4naOK8o9yHmUhM2OUaWyRLX5Hdnn8pOkOCTZ96LV1G
	WBWAe9GU4keVd4KvwetwU45cJAbKzsU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-qK18xbEHOAqRKpqkzRTfaQ-1; Fri, 24 Jun 2022 01:40:55 -0400
X-MC-Unique: qK18xbEHOAqRKpqkzRTfaQ-1
Received: by mail-wm1-f72.google.com with SMTP id r186-20020a1c44c3000000b003a02fa133ceso562018wma.2
        for <alex.bennee@linaro.org>; Thu, 23 Jun 2022 22:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NvZk4w/4NMxXzopQHF+1/MxkNYjHe8h3GsC16UgBLQU=;
        b=13/c2va68+gKa35fzFvnka1df9WDHckfofbna+HHc/DhtLPZjwq1CalaWnfA/lI8je
         Vzc4XhJuiGwpL44doNCGwZj3I5eiLOr/0sKSoWkOZUKoiOesqSLDlyiPiWyLI/UaGw90
         r/8CVLSRAbPzhFHcCCgWHrjWtOfOPEyc7Ro1glzNMHj+/7ieGL9bmuwtXEZujGCe13KU
         mfWt+6taO7UqKStsEBIGAAPRKyLb9g7W2LCK/FVHlO54xzNJuaOFfGaA/plsz/KYfhpL
         iAltGZveJkMmXjIPc5uqI43RfA9TgF+3iK6eNsKU2p8lRspDaoV9A/gdsxEJ8RSHbLjD
         lRow==
X-Gm-Message-State: AJIora8U4BTBCTZGp7321kidcRGqwvPRX2flqTqk11bCW2wQzUbVq50r
	EVIuB7hfskmSmwlQ05FdcbZ83ZhgyasH/BCnWnU7N4SYgQN+0TFXAbXK6MDpqvWQyAzX+C6nBBp
	aM1GpKi2jUZye8LMN
X-Received: by 2002:a5d:50d0:0:b0:21b:978f:e54 with SMTP id f16-20020a5d50d0000000b0021b978f0e54mr11467559wrt.612.1656049254730;
        Thu, 23 Jun 2022 22:40:54 -0700 (PDT)
X-Received: by 2002:a5d:50d0:0:b0:21b:978f:e54 with SMTP id f16-20020a5d50d0000000b0021b978f0e54mr11467547wrt.612.1656049254534;
        Thu, 23 Jun 2022 22:40:54 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-176-192.web.vodafone.de. [109.43.176.192])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d6305000000b0020ff877cfbdsm1225347wru.87.2022.06.23.22.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 22:40:54 -0700 (PDT)
Message-ID: <d2dc72e9-3393-f7c2-f79f-2021d47c44b9@redhat.com>
Date: Fri, 24 Jun 2022 07:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH] include/qemu/host-utils: Remove the *_overflow
 wrappers
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220623164051.506316-1-thuth@redhat.com>
 <CAFEAcA-k73D5fPfp5XnD2gtRO0pTXpAt_xTG51dGnzji+=NGqA@mail.gmail.com>
 <0a1ecd14-69a8-afc6-f74c-18d5abf2e4d0@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <0a1ecd14-69a8-afc6-f74c-18d5abf2e4d0@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DzEwGUjbNJ9S

On 23/06/2022 23.29, Richard Henderson wrote:
> On 6/23/22 12:30, Peter Maydell wrote:
>>> -static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
>>> -{
>>> -#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
>>> -    return __builtin_add_overflow(x, y, ret);
>>> -#else
>>> -    *ret = x + y;
>>> -    return ((*ret ^ x) & ~(x ^ y)) < 0;
>>> -#endif
>>> -}
>>
>> I think I'd prefer to keep the wrapper functions and just delete
>> the fallback ifdeffery, but I guess I don't feel really strongly
>> about it. Richard, do you have an opinion?
> 
> Likewise I don't feel strongly, but lean toward keeping the names.  I will 
> point out that without these names, one has to track down the type of each 
> argument to figure out what is, or is not, overflowing.

Yes, I checked the calling sites, and some do use different types indeed, 
but as far as I understood the __builtin_add_overflow(), it should be ok in 
our cases. Anyway, it's maybe less error prone to keep the wrapper with the 
fixed parameter types, so I'll send a v2 that just removes the #ifs instead.

  Thomas
