Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp6325ejr;
        Tue, 10 Oct 2023 02:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIQMPSWiQZ6J/5QxgbLmic3m4GVYZC/1Pk7oWM3SIYg66e6WI9K0XuqoeiAeyibBR84ANH
X-Received: by 2002:ad4:598f:0:b0:658:3af3:3d9a with SMTP id ek15-20020ad4598f000000b006583af33d9amr18909414qvb.1.1696931195062;
        Tue, 10 Oct 2023 02:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696931195; cv=none;
        d=google.com; s=arc-20160816;
        b=mbVHww/4qkntUG8Lt0ye8qGyeMLrry36C0a4ss4lZyfCwi1mIMS+oypUvj2avvt2nO
         87u5F1in9teF938Tx5EN0x9DjTFEvxB1d2rcImez/14foB/x1FLkhJsYC28qJe4lreLD
         6SLq5hx/1CMmkUA3V+x+Gn3w2F36ivoJcFJtYJs+SHw3Aw+G+AeGnE2o1rrXfaYVz0Yf
         pEmmANdpPGFpwkmKaT3lit9OEQbNWeTt+GIOH5zGFWq4pvZaIFo0xyT1f0+mNJ51MuPn
         n660P31TAV5JjpTh0wx5PDPmB86xsmyOWUBm3tSrl/2VjNv5XRhBXANLHbczvbhkQAxG
         QJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Wo4EO3b24+7/c1hPw2Stl1TkXZNmaThVkGRtUR1z80I=;
        fh=hyxXIb91MvxytttQZYdVhu4uFcxr7kYt6LcMz8vEYEs=;
        b=HC17T0Y1vJau9PRSGPKrORSEXJ+PDBDP65Rpn3vo1tMYoyZA5GJmdVYKoubphQjISe
         /CvBKLdQOxBOTLzizk0VyXXb99Xz5JIJBI6EFzSWWnROPP2XcpxqMcAtXAdaq4ZuTVN4
         HMCuMiOCF7jOL52Y5o1Jx9Q8cOFyn40OFxdp52dbo7o24L+CV2ltqL+5FukE/KNd6jHc
         mvFF4l07CUc9fgfhqkXR37ySm0YNdJ5bz1M6Py6VAORHjJ9Q7hW7aVONjRCGN3xI15C8
         372g3vcXzLt3LmiqJ6bQvWo7T6v+TE2/3ESMK/uhSrmWleN8s7nN0qLeMlSR92UP29Mo
         LAkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R7uveP14;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v4-20020a0c8e04000000b0064f36c0433asi7411649qvb.564.2023.10.10.02.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:46:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R7uveP14;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696931194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wo4EO3b24+7/c1hPw2Stl1TkXZNmaThVkGRtUR1z80I=;
	b=R7uveP14dxiai52T/qU2rXjVwiv9k7Eb2gyFOpxhEosaQ4hP6fSpooM4WiA6bcS/WQhfFR
	KdTIzltRFLCGPHhLoY4AAyy/RdpiHbGfHzA5v6BGurXRRfAD01frUe2hb1g0fJM+VqH4X2
	cj8DwRCtLtI+/2DmL95JKdBELGcfvtE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-VM6C5tzwMd6n69nFD6wqOw-1; Tue, 10 Oct 2023 05:46:28 -0400
X-MC-Unique: VM6C5tzwMd6n69nFD6wqOw-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-d9a3a98b34dso1594852276.3
        for <alex.bennee@linaro.org>; Tue, 10 Oct 2023 02:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696931188; x=1697535988;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wo4EO3b24+7/c1hPw2Stl1TkXZNmaThVkGRtUR1z80I=;
        b=ZiQiDFgGWcyQuKLpQyExIJWZq0YnnXnF9ogx3ARCWUcrquR0G8CkPNjdE1bRS79mld
         Izf6V7KD+HTI7AK5CreCgSG68KajC91sqVE568baOZEc/Z6LQnF2HcFSA7sCz98kI9Ut
         v49dbA9pWVmdBjWGeK0+RmitEb6gZ5G/9y6UAA2sfwqUnL8kAVT7Xk6rntY+wdSZ08t3
         yl53h9ThLEKGZmf0fU9+rO7hBwux/3Oiywbuvo7SDSJaH8heMHgInjY6lMaBZiCdEsZB
         BE1GXixOwL+fmBc9WnLhqFCanC4Be1+bzyNUYkLWdSdIhEw3uTAXg8qRKew97wuxPy3X
         oHJg==
X-Gm-Message-State: AOJu0YxR6RJpTzVDIW+EbY2/dTsKSeEecGwa4Gpihnytq3kTMxPfKYgY
	lA4aEIlp/oggK0qq5vim+SrqpmKP7vzo3/gUCEmymf6FzBaGQGMA4CO58Z2UKZaxgo5+7jH18de
	xESGu/pG8xP2Dq8Xs
X-Received: by 2002:a25:5541:0:b0:d91:12e7:30f1 with SMTP id j62-20020a255541000000b00d9112e730f1mr14757798ybb.53.1696931188151;
        Tue, 10 Oct 2023 02:46:28 -0700 (PDT)
X-Received: by 2002:a25:5541:0:b0:d91:12e7:30f1 with SMTP id j62-20020a255541000000b00d9112e730f1mr14757789ybb.53.1696931187892;
        Tue, 10 Oct 2023 02:46:27 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de. [109.43.176.176])
        by smtp.gmail.com with ESMTPSA id er19-20020a056214191300b0066cf31eef11sm390345qvb.132.2023.10.10.02.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:46:27 -0700 (PDT)
Message-ID: <e108d282-5eec-4430-1a10-8cf3170bb18c@redhat.com>
Date: Tue, 10 Oct 2023 11:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] tests/libqtest: Introduce qtest_get_arch_bits()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20231010074952.79165-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +e0x2EOoMVMu

On 10/10/2023 09.49, Philippe Mathieu-Daudé wrote:
> Add a method to return the architecture bits (currently 8/32/64).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/libqtest.h |  8 ++++++++
>   tests/qtest/libqtest.c | 21 +++++++++++++++++++++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index e53e350e3a..1e1b42241d 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -654,6 +654,14 @@ bool qtest_big_endian(QTestState *s);
>    */
>   const char *qtest_get_arch(void);
>   
> +/**
> + * qtest_get_arch_bits:
> + *
> + * Returns: The architecture bits (a.k.a. word size) for the QEMU executable
> + * under test.
> + */
> +unsigned qtest_get_arch_bits(void);
> +
>   /**
>    * qtest_has_accel:
>    * @accel_name: Accelerator name to check for.
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index b1eba71ffe..a643a6309c 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -925,6 +925,27 @@ const char *qtest_get_arch(void)
>       return end + 1;
>   }
>   
> +unsigned qtest_get_arch_bits(void)
> +{
> +    static const char *const arch64[] = {
> +        "aarch64", "hppa", "x86_64", "loongarch64", "mips64",
> +        "mips64el", "ppc64", "riscv64", "s390x", "sparc64",
> +    };
> +    const char *arch = qtest_get_arch();
> +
> +    if (!strcmp(arch, "avr")) {

Just a matter of taste, but I prefer g_str_equal(), that's easier to read.

> +        return 8;
> +    }
> +
> +    for (unsigned i = 0; i < ARRAY_SIZE(arch64); i++) {
> +        if (!strcmp(arch, arch64[i])) {
> +            return 64;
> +        }
> +    }
> +
> +    return 32;
> +}

Since this function might get called multiple times, would it make sense to 
cache the value? I.e.:

   static const unsigned bits;

   if (!bits) {
       ... do all the magic to find out the right bits ...
   }

   return bits;

?

  Thomas
