Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1806767njc;
        Sun, 13 Apr 2025 23:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUg5iZk9aCk9i7d/c72GRe2VbvyuYIYA0Qh8Aa7uhWCYVjMZ3ptYX4EdZVUxnMODHAuw7lMWM1EtL/6Mw==@linaro.org
X-Google-Smtp-Source: AGHT+IEVOhRjPi7sWX1xt5Z4FRl7i5T9Nh8XIf7z6SDOhBPZ6ZO49gvEYeKNrEJOpc8MxuLntYFL
X-Received: by 2002:a05:6902:2682:b0:e6d:dd31:fd47 with SMTP id 3f1490d57ef6-e704dfa554fmr18452642276.44.1744611356027;
        Sun, 13 Apr 2025 23:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744611356; cv=none;
        d=google.com; s=arc-20240605;
        b=k7HY5AL7mbmaegEOaQcP5YHuIZuF9nKXkARF/kzBFQYARt2ppsM3tRRj0+Et9sdu1R
         IMwcvtNhfUvqDvFgArbxmvCToFVSlWaTaSWoH5jyUTvLsNCYlAj/v4zYVwwIwkn4FayL
         v2wcAloBlJqiy/++7rw1+QQdaKnBMtVJTNHblMA5DaT3WRUJ1Ay6HsXvjfMtcGUdfdSn
         WcTM0sB22UIwg8Gn8K22AKcushLpHYdgtUqUXcQxaGdWJVZhlWzukcG7MBxXlRd12VYS
         mLPq1NQQAJbsy49jYmpquDlOIl9TNSSEWCN2nz9x17piE/1kx2RhZWfKq9iEZPM7C965
         Ziyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=KoZVABeMuBG04mKaj0AlbIJwHmxUGiX8mSj2q6nfKiQ=;
        fh=X82QDpttSzncrbAgI3iX+HgFgea/K+B8q8jjTVcFp4g=;
        b=OyAvf4gGSc9i6v40JzpXE0mzLZ2H2adILk3NJJq1GaHwByfJERvHoZWsciZubEWAI3
         0mNu1JG1+o8dElh1Nj4VtFuV0tKh55aRglN8AQRry74o9g8xMsGFrYmNDl3cf/J8s/Ow
         xvcJcsavYMsNOP7Lwz8opSKNMx04qtavgtTn/KImmRTaYBfaW2gWygnINgUPyoXG0s38
         VOeo/TfgSwjvWS1DiaShdS7NER8KMxpNkiwI+kWUk3e9LaHAG+oaWqJc272J1W2KWGBz
         fC21hh35/zUdOSOJgDMEg96l3ZWFI7xQ81JllllrZdE5RNTPbDKVa6qC/iMw0akWgEmB
         72pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BFVGMyTu;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e70327c108dsi13542361276.249.2025.04.13.23.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 23:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BFVGMyTu;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744611355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KoZVABeMuBG04mKaj0AlbIJwHmxUGiX8mSj2q6nfKiQ=;
	b=BFVGMyTucqR53EkkzRWbPORxplHxT4SaVGMFhZYkiKhg8OekCJxj59Q3eiAbTXcARzbK8H
	unvrtwdx3MBbxp5PccueoYX5Eky3V5tUXSrXd+ih3BxFOSge/+WPPhTRkCPwiCIl/vx/aD
	3ESfGSoWbSpQt5dQHJfis3eELYAWe5E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-SOnV6wvwPkOwQhR5TQMhNw-1; Mon, 14 Apr 2025 02:15:54 -0400
X-MC-Unique: SOnV6wvwPkOwQhR5TQMhNw-1
X-Mimecast-MFC-AGG-ID: SOnV6wvwPkOwQhR5TQMhNw_1744611353
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e5cc488f27so3031284a12.3
        for <alex.bennee@linaro.org>; Sun, 13 Apr 2025 23:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744611353; x=1745216153;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoZVABeMuBG04mKaj0AlbIJwHmxUGiX8mSj2q6nfKiQ=;
        b=Iypr/NNV5+zS4FkXiaun9P2BIBwQSgBlj/Jpb43Sfab0yWMMC5EW8XIU8V35p7SBkY
         TzVBlCJDRtQFxj1takrr6ZTFDwjIL1LY1111eyYsq1OtglQQ7oswEoL5NAPHXKAPS+JL
         Vxw0Exd68ryqppbIRKsCEK+wPf+3Xa3VzOel7QOdeD9VUoeVZqt51FayOANN+C+u8FE/
         kLm8Lxbz/Gip5iou5R2N53FEL7eCUkzV1VgVk9u78yBWiox8rvRxPzTjzFdJxGlQzyTm
         6EwJ6YplaGjLEZVjAd36SDNOufk1b52GoPwSzfqFal8QBS98aTzMbJhQLvgSplqb2n6o
         yUSg==
X-Forwarded-Encrypted: i=1; AJvYcCXiW0VmDRECsugY7xFYF3A3AGVAwt8NdGRnh2L/CUNdQVG9BLvt12kjqX2jzEaheMw/usk83v7O0vzjfw==@linaro.org
X-Gm-Message-State: AOJu0YwvrNJt367mpwQYzW8jlYNIvlVBiX3Sznk0efpDHa8kyc+YMv5F
	xfsWx+0/V+S70+UTchLy5qFpuR8UXwvGwk8/pOByx2/9m0xJC1MepFRbWpUvEDrOCElv0RoPwSM
	cfxCphepP0slZv/8bWDB4Pz/pwN1Gol3oUv99DzTWGV1IkPFHSBgytGUGIfx+FC6d
X-Gm-Gg: ASbGnct2e01ZgC/QdECVTAonmzfwJY+fFVECgh+kfrjgAsQ2U4ScVzRkYNTldlRXKpv
	7EbfxIUw4Oa2NZsG2P6RyhTZXne9pKzecbpWtfSpM6HflkbIWV+3HtP1UVaCJbPFhFNZlczdxkL
	XVZzQZoSiJEyKfKSmAGHMDFrcFlMblS6NzxZIcL+N9B+c1fFYG0gwjaNULIVsPdaP7+ny8pTMsI
	7WlWMibhstlzLEmGWpsqtmyR2Nl+GmwLuFMur4cPwVbRAAXZuuPOySGXxi1Dv3myVuVnsqJYdTL
	hR5bOWTanmKVZbDYBPPHfvpyEhKPNesPt1ffMfOM16g=
X-Received: by 2002:a17:907:3f1d:b0:aca:b45a:7c86 with SMTP id a640c23a62f3a-acad344567amr1061793366b.1.1744611352833;
        Sun, 13 Apr 2025 23:15:52 -0700 (PDT)
X-Received: by 2002:a17:907:3f1d:b0:aca:b45a:7c86 with SMTP id a640c23a62f3a-acad344567amr1061790666b.1.1744611352295;
        Sun, 13 Apr 2025 23:15:52 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-221.web.vodafone.de. [109.42.49.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c00c53sm846788766b.75.2025.04.13.23.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 23:15:51 -0700 (PDT)
Message-ID: <095590ec-a705-400f-bf05-2e5bfde34e32@redhat.com>
Date: Mon, 14 Apr 2025 08:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] tests/functional: Generic method to check required
 devices availability
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>
References: <20250219142412.77536-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250219142412.77536-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 45FgghKxR6d4BWFlDlIN-32hjxAMlvF6XfPo2IllNvc_1744611353
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DgDdczdi4o58

On 19/02/2025 15.24, Philippe Mathieu-Daudé wrote:
> Not all binaries contain the same set of devices. Since some
> tests depend on specific devices, we need to check their
> availability in the binary.
> 
> QemuSystemTest::require_device() allows for system tests to
> explicitly check for a particular device. Add a similar
> check_required_devices() method which check all devices
> requested on the command line. If a device is missing, the
> test is skipped.
> 
> Example running test_aarch64_virt.py on macOS:
> 
>    ok 1 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_with_gpu # SKIP no support for device virtio-gpu-gl-pci
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Just an idea to see if we can avoid manual require_device() calls.
> However not having a device in binary might also be a bug, so RFC...

I'm also a little bit torn by this question ... let's keep it explicit for 
now, but if the require_device() calls get too annoying one day, we can 
reconsider.

  Thomas
