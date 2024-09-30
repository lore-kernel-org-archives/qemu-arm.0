Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1113184njc;
        Mon, 30 Sep 2024 02:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUofGX7aWwpIb6VXji9LC5pnq+2uOOUb+tRMNmO1uv9EALW+N3CnCYa3gcxHTavDSDGYlmIti8WjBQayg==@linaro.org
X-Google-Smtp-Source: AGHT+IFMT3Fqw9q3dxJZWPSUoqMWmLlI8Pt5TUpe/HmNNCWKhO/lUjzxkgq/Oz1YH3kly6TR71TL
X-Received: by 2002:a05:6102:38d1:b0:492:9c55:aec5 with SMTP id ada2fe7eead31-4a2d7f4fec5mr6674212137.15.1727688248309;
        Mon, 30 Sep 2024 02:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727688248; cv=none;
        d=google.com; s=arc-20240605;
        b=BxMEHuVDqIqeylayXhWO7OFYM/TcP/Mtpafo/Ho9PMIe1i18FCz7sslBYDo7Pi/JTM
         CAjTU1Bdl95Vn5LzN2J2CbaFAG3xNAS1B1/mI5BS6wrKxqk1IRIQBgdTFYIpiBxkLBz2
         V19ceOnjN6mXs+KAihurjnvGgAJLqMwVDhYE/voWoOC4jxV65rMswFPak12b7w3Unq2W
         KVHot3ozpfqTGHjrjuPY+WjiBO6CDsjgwlf7AQkja/RnU41jwxXwVYXCGZPbREusngjQ
         PmRtgzzO8f1/fDWGVX22QUVIKRVZpyR5ewk/ZsqHK8aPsYlSEH9VdmuxqrG1Yy12UAA5
         El+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=jc0druRkRoUrarXSRWyMdRP2eH8jvDqoj4jRAP9G5SY=;
        fh=IbnW1XK1m3iu0AT2v6QmlYzOD+fNi/U/6mVvV3fL9gk=;
        b=DxuYdpKK1PihQA6OTAPElklHqkw8VaVqainzsTZHSunHW2O61govATb2eE07Tde7G4
         abb1ihnsewro7J+h+O3xiD0GkJRrcdioPvcyycBOSBAfHmb29LqzF7CIgCmHVyL3zaIT
         mbsKXvj3Nv0QHSBFPSDL2Emm6Fj3csXD5weVUJeylAf6i5sJ8I7gMEZRSB4FYI1klj0w
         wFyZBj55xyDOUaT87jkBYY8wG3gzWCWpFA0NEmeYSFDm2NpIW+yxfRuwqmwGDgunG/f2
         6AwsOkgLilfdCVmR7gWbEve5AC8iQABgMu89WJCpNf9GGQrOkYJhMA8/sPFiW/7jIz/O
         yq6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jt9pqMpX;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b69c3dbsi83147516d6.422.2024.09.30.02.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jt9pqMpX;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727688248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jc0druRkRoUrarXSRWyMdRP2eH8jvDqoj4jRAP9G5SY=;
	b=Jt9pqMpXO/jv3YuqKjmh+PM/BzxWUEXVDFHgyYmTov/oS6sKI1h7Ym8Tj76GpX9OPRHqB0
	gkwrz2Z/Gj59HZDK5JgaRkw05Enk8nD6h1SSdEL/nA8J4f7v76fdXA49mDuj2SJW+oZJP8
	3ps6HWeANP0iXK2yWzsCCrxQmyq/MPU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-3M7ccg4AOpS12LQ-MI1R0Q-1; Mon, 30 Sep 2024 05:24:06 -0400
X-MC-Unique: 3M7ccg4AOpS12LQ-MI1R0Q-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37cd91210e3so1588113f8f.0
        for <alex.bennee@linaro.org>; Mon, 30 Sep 2024 02:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727688245; x=1728293045;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jc0druRkRoUrarXSRWyMdRP2eH8jvDqoj4jRAP9G5SY=;
        b=FDqcVuLgdJuVVhh7dtnlevSOF9NtujQeXYPL0CmsP0EPFYmBUsvS4UduduZkxDKwzu
         2yyNLYiU7zfS2U/3fxPJra+ypYDIRXKNkC6Dri+MI7NGJKqaxG7O9Uj0Rtaj9Cg/5AZL
         AcUhI/u44u4y0WPxY5tlcZC58JWro8WaNkjKFy3xwVmgsQ0tFeeH6Z+3TsW/PwMx5wsk
         fxrLPNzNsTHWgGiohxQyX5p9k5j56z09Yp3T1IXuZST/WrL7xgQL+XwBSbugzTk3TURv
         RNqsKoYQB/KFv+NQiTt8vnYHTAc5VrCJaCLnhIBYf/i18RXAl/O+MKiwE37pP+8Xb2YF
         8kDg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Qek5oNvBWSJWmH1xONCX+vjYL6z32UL5uGYx0jx+PZBQIUAic2uknOmPozOoIH8QOQeRQd9LYb0wwA==@linaro.org
X-Gm-Message-State: AOJu0YzW/kUVVnjzc2zzWtSlmKFtGCPb4OBqBs1VYbYHCNbtai70yCcM
	JlfMd+EeK1dndVmbGqh3W/1ayGwqNrDBWUeSoXRD3LQLCAp0khTTgC9QLIxKw7MaFg2z8hS/XYj
	yii84mVN5RcB826rH5j7xEino1jN6QIfAaEPMoFPqa1Vbjl/nNa35+g==
X-Received: by 2002:adf:eed2:0:b0:37c:cd38:e7bd with SMTP id ffacd0b85a97d-37cd5a998e4mr7050004f8f.29.1727688245661;
        Mon, 30 Sep 2024 02:24:05 -0700 (PDT)
X-Received: by 2002:adf:eed2:0:b0:37c:cd38:e7bd with SMTP id ffacd0b85a97d-37cd5a998e4mr7049979f8f.29.1727688245294;
        Mon, 30 Sep 2024 02:24:05 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.81] ([151.95.43.71])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42f57e2fb5bsm96246265e9.39.2024.09.30.02.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 02:24:04 -0700 (PDT)
Message-ID: <e9462238-17fb-4269-bc4a-955d6b8cf4a3@redhat.com>
Date: Mon, 30 Sep 2024 11:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/9] rust: add crate to expose bindings and interfaces
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Junjie Mao <junjie.mao@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
References: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
 <20240910-rust-pl011-v10-7-85a89ee33c40@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240910-rust-pl011-v10-7-85a89ee33c40@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: yFj2tdE1z8I6

On 9/10/24 14:35, Manos Pitsidianakis wrote:
> +unsafe impl GlobalAlloc for QemuAllocator {
> +    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
> +        if matches!(Self::DEFAULT_ALIGNMENT_BYTES, Some(default) if default.checked_rem(layout.align()) == Some(0))
> +        {
> +            g_malloc0(layout.size().try_into().unwrap()).cast::<u8>()
> +        } else {
> +            #[cfg(HAVE_GLIB_WITH_ALIGNED_ALLOC)]
> +            {
> +                g_aligned_alloc0(
> +                    layout.size().try_into().unwrap(),
> +                    1,
> +                    (8 * layout.align()).try_into().unwrap(),
> +                )
> +                .cast::<u8>()
> +            }
> +            #[cfg(not(HAVE_GLIB_WITH_ALIGNED_ALLOC))]
> +            {
> +                qemu_memalign(8 * layout.align(), layout.size()).cast::<u8>()
> +            }

The "8 *" is not needed in either case.

To be honest I'd simply drop the allocator code since you have to respin 
(see Junjie's answer).  The DEFAULT_ALIGNMENT_BYTES trick is nice but 
I'm afraid it can be a source of hard-to-debug bugs.

Anyhow, I'll leave the choice to you as long as it's disabled by 
default, and I think with v11 everything should be ready.

Paolo
