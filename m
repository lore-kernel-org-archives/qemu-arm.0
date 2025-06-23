Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2401185dyb;
        Mon, 23 Jun 2025 01:19:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp7IiZLg0os7BLoxbwjjZAxPtdlMVnLH0Req4SJp4e7e7Dd8cXhAsFEFf9XE+w27gpDXmJDVuQnik68w==@linaro.org
X-Google-Smtp-Source: AGHT+IEH4tYo4/zN+f3H1Z4UXscYdHTupb547pIryTY16mYjauGkHIhPIneFBXcpXA6ghFciVvwv
X-Received: by 2002:a17:903:4b2b:b0:234:e0c3:8406 with SMTP id d9443c01a7336-237d9775527mr187785275ad.1.1750666777042;
        Mon, 23 Jun 2025 01:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750666777; cv=none;
        d=google.com; s=arc-20240605;
        b=NxjGF7ldT4UrKUg66pYutr6fbavNnOojDI7A0ly2asg1FjFTluJl1T27kOpOA0VDfA
         KOruBO13biHnnKJbvwRh680bJzKhVkUo1idQNcCUNZnz++HFrYZdLNJQifwnMrQFnIGi
         2DJXL4zAv/59udNXos13lufgfsFLNwRIsGriSKu5x39WD/8Dp+QRZKjxw0ZoE98B1Zsu
         hvFjmMKdq/uHQYAV9ggPAKxCc10lLgQj3OH8Hk2f2EM4eQfbazJ0P29jlesqYxEh6i7l
         ZuhbntHrWjD19Dc4hWzPZnREjP20uWRCwTzv2Idc0Vqc1GvmeekA4L0Rm1OHd6UGpECx
         6Zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=8XX5DDD8hC5pLsDuzu/Mi8zN3wXHrIluVW5N+ZopIaA=;
        fh=0NGpcfOHw7kwcdF5EZ3Z8i7mmyyz9msYJmIaBmNmv0o=;
        b=B41kw2e1hcfb/eSFgIw1xwUArm7q+IefmNTpDaJlVadx5+YHeSIcVXy5Qjjv7a6hb3
         ozSQ0FrD+/8lrmGSJHpSCMkNZn+kSj2pLQGLkDpTsvtydy93k0/aq6ybNvcJ2xwst+Ik
         1TVEoXYwVNqA6ftjUql8HF8pPBap+Q3yMyII0Kp/hqTj1fqYyI+HjP6f8ikuswvL9RkC
         of7Z6sZ2yy7BgFAb+MXeORtlSUF12mUdGznD0OEKRbGIiIHKKRHR9RPf5UHNwQlZJx5S
         3c1ugNqa9XKREGIucubGqbgrwS+IDRNwkSRQl5q2gAViB2e5I4qP+h+y7/q2Caqqq9E5
         Hoyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="N45P/d9H";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-237d86b7a2bsi96534255ad.427.2025.06.23.01.19.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:19:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="N45P/d9H";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8XX5DDD8hC5pLsDuzu/Mi8zN3wXHrIluVW5N+ZopIaA=;
	b=N45P/d9Ha58RGN6GkPWCtjWlTEnsw509pykuKIxeaHCRxFmbmvhfHlHY8qxPThliyvU1Ue
	CtOn/ZgO27BQ42PBI1bbSD1o2LLlGJXyCT/l09oq21xYTOtUIu+tqEPHCSCgO+NUg1rIQj
	4jw2pIrm8fGGwcs1bplj04CPBUU+3hA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-cNnrEegUP-WRIUpEvESVaQ-1; Mon, 23 Jun 2025 04:19:34 -0400
X-MC-Unique: cNnrEegUP-WRIUpEvESVaQ-1
X-Mimecast-MFC-AGG-ID: cNnrEegUP-WRIUpEvESVaQ_1750666773
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so2422445f8f.1
        for <alex.bennee@linaro.org>; Mon, 23 Jun 2025 01:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666773; x=1751271573;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XX5DDD8hC5pLsDuzu/Mi8zN3wXHrIluVW5N+ZopIaA=;
        b=hCx0EESpxVyhgxPmNPz43lCYdoUCHK50bzSfRC0FN8ieiI4qMEfjw4XSj68dnOhtMM
         x6YcytDyc+f6FgMPyd76mrlkXL171fa3PyXs9R1J8Z2xFdAhpMC0EDXj05hymnyBxsCZ
         ybZaKpdb1eBZ1TF2fd7TILzI/1g3NRvGgshjI+75573xU/tYt2cXU5ymourEgJS0xBpy
         wOzExbmR/tEacUR9utte7PlJB+AW2rHOgFHEWwj9WliDU9Q/GpK8hUJ5+WOb8TefZDj/
         gKBy+GzudO4e25U2OlJDpCVEx2vVbKecW4cC4jfeFX5c4wMBWWWfWxJ6ykkexAUgl37n
         xINA==
X-Forwarded-Encrypted: i=1; AJvYcCWFLbj4FfmMgAIhlXXIGq/PFre4iD221xBwZ8CHos9CgdBGO4+F4Kck7dWHAnV02kyFmODN7NHnLXvnzQ==@linaro.org
X-Gm-Message-State: AOJu0YxJ2VYoatBbscseObggqfIpvtR4vMGADhh8cyqrWkOk64vE6Zvj
	CwEdxwmx1+sVSZVMc6NeHx5eH2IGYrDNqYc3fUWSB1FcpH2S+jP2WMuciUE+IkEG04ab7Mw3CpG
	Y830OejTPZdeg+bOxs2pQ6OcF8cdNj09fSQPB6/yoN554u9acJWuo7ctdIw==
X-Gm-Gg: ASbGnctGGVoPx0e8fuHkfGgGCiiWilc7cW0Bxr31U8WXIHQkGiAibGbZCkUSLm84Sqr
	wHZopc522UQBbDlgx3/qiTKuPJx0EKDoyyCfgU54Mxwsr+c0ksmewiT8LgG7uGolLokxiw9jqRr
	POS2DC+2SiZ9onxnofoSR5tesOqFREvMbRdF1jpQVSufPNkas1JJbmpDnOFfE2kazmfKq5RkIVz
	Dg97marpDh+9RMcWuYI3qoxessEieI7M7PNxM1ZH6To2AWwAS8k1piiiZDVxAUjYFgwtSMpV5ph
	hneirPTqYIuMhdy2/LqIrnH+zGeN7xliM+96zEh81x7jrv+lCFbPJNohaFYlK2o=
X-Received: by 2002:a05:6000:178f:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a6d1331ef9mr10090469f8f.53.1750666773240;
        Mon, 23 Jun 2025 01:19:33 -0700 (PDT)
X-Received: by 2002:a05:6000:178f:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a6d1331ef9mr10090434f8f.53.1750666772820;
        Mon, 23 Jun 2025 01:19:32 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ltea-047-064-114-166.pools.arcor-ip.net. [47.64.114.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d902sm8609481f8f.43.2025.06.23.01.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:19:32 -0700 (PDT)
Message-ID: <3896c4a8-8b25-45e0-978c-1539648ab4cc@redhat.com>
Date: Mon, 23 Jun 2025 10:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] tests/functional: Require TCG to run Aarch64
 imx8mp-evk test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, John Snow <jsnow@redhat.com>
References: <20250620130709.31073-1-philmd@linaro.org>
 <20250620130709.31073-25-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250620130709.31073-25-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WiU_VHJTzwUKgaYAs9jIXGIbFCeho6AKPUYFot9WUMM_1750666773
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: F7vF8b30KJlQ

On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
> The imx8mp-evk machine is only built when TCG is available.

The rationale here sounds wrong. If the machine is only built with TCG, then 
the set_machine() should be good enough to check whether it's available.
So I'd rather say:

"The imx8mp-evk machine can only run with the TCG accelerator".

With that update:
Reviewed-by: Thomas Huth <thuth@redhat.com>


> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/test_aarch64_imx8mp_evk.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/functional/test_aarch64_imx8mp_evk.py b/tests/functional/test_aarch64_imx8mp_evk.py
> index 638bf9e1310..99ddcdef835 100755
> --- a/tests/functional/test_aarch64_imx8mp_evk.py
> +++ b/tests/functional/test_aarch64_imx8mp_evk.py
> @@ -49,6 +49,7 @@ def setUp(self):
>                        self.DTB_OFFSET, self.DTB_SIZE)
>   
>       def test_aarch64_imx8mp_evk_usdhc(self):
> +        self.require_accelerator("tcg")
>           self.set_machine('imx8mp-evk')
>           self.vm.set_console(console_index=1)
>           self.vm.add_args('-m', '2G',
