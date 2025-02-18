Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp615802njb;
        Tue, 18 Feb 2025 03:20:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcv31BrKtx9muS12a6BVLXfxhYvObTyuqVUw8leuEFTR7G7X774df/rLQrxQyochVSfj/h0f/6DQ6ojA==@linaro.org
X-Received: by 2002:a05:600c:a384:b0:439:88bb:d000 with SMTP id 5b1f17b1804b1-43988bbd267mr37913895e9.25.1739877609987;
        Tue, 18 Feb 2025 03:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739877609; cv=none;
        d=google.com; s=arc-20240605;
        b=cKQaOg8+MUINYjg15YQzHlXmopUH7R8GOeoYWFYdmiGf9PK2nINquIhFTFk16cK053
         TF6uj6uTEMrchmAODIleaNSnG+7zK1VJdB4T4l64+HawYY1oOcnhfmd09s/n2ZkrP9C1
         0Pzmo/NmIL1p/M3Xi4B4eDR8YjJYdmXbxaZG+2aYgO86xYzFTmDb88m1tfD5WVdngoC4
         zLOosfrMprlKZ0z6a0evvdWOcwdvrSKZk2RYgtNMNX0/YfUchHpYaE+zI1tcQ+D0ebQ7
         yQaq/GM3MNt/zXWv6QgnCNJEtJqTZgnKHH53HrgILmTlAmM3yKBt3mhjTI32DpUlCin5
         fkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=b9/3DjAFxI/v4Ul4XBqPwJ9mqca8bUx0Fi7qKIYKz4c=;
        fh=UeZyCcJhbljJoAN8Ot8NGZtuSGpUIZ0OFG9hWGwWzIc=;
        b=DxhTzsxz46ilO4qZCKrpA0JcoyfkjCpySwWUmQNxOtn2/ajMgtENM/LG2SnUaBomPU
         Ohu/rmTID3824yUwRAX1WmaqEbaIUxh/3Keh1Be+H7YpckNSK3RrCEgNaRK4Hv7D5q9O
         S7IJFLdOtJWPrO/6wnBI6nseJ2D/xF3UfZwft+hAFk/yAl4559xQsqHZHlbfW2vgVvp5
         xSe2xeR3XEPj46Be5HdO1h4qSI77pdQW5Yz0qkSP/KSUj5qNLJoey4UHsbBNGh+XUDow
         8Qq6Sx/yQOurfCGiby/6q7qiHgShESGSk1O6ucyDMPwTtOIF/0LRd5374s2H98hhBVuX
         LgUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QnEfi6r2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439619146aesor49415235e9.9.2025.02.18.03.20.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2025 03:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QnEfi6r2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739877609; x=1740482409; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9/3DjAFxI/v4Ul4XBqPwJ9mqca8bUx0Fi7qKIYKz4c=;
        b=QnEfi6r26nyHZc1qmh6lOLpjWcNntqRoPvhLktsSUEoAEbtQNY0xZzYM4Z7RFXyA9F
         B/S/ykUadvA2bOnmgbdg4D5/volAPPcuyXMwehZox5VKEjWJUQgFwjfrCIZ+oWCYvZMZ
         8T1vO+G2ReCU5iEq/tdHCXfwUfwvhBLjpCK3rVy6tW3rHL7j10ClsQU92zKcKeL16qRP
         E4lIZQjXoS9v5ysjswAQwlpj0IxPRmxLC0DjEbkomKJiBxktu0d2E526A+Hv77Z5Fqlg
         /+e2JzPRTF3YiWzT/PmMisqfXHQn3izSwLe4XtH5V+aWJdSmUxhxiFF2wFrSjoRFjXfA
         A9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877609; x=1740482409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9/3DjAFxI/v4Ul4XBqPwJ9mqca8bUx0Fi7qKIYKz4c=;
        b=PKEcUezJhticCX2LE8KAuuIF3BIQWmv7zy2vHhH4n98Y5WWVEHZPtOCpssrFAqI3mT
         qCKxquho9iCVqp9Nk0uANzdY1WIO4yy+Wwvox2LxBQcH4P80f42ZTbp9UIkXEAYfxbei
         92F4bqV0Hhpa07jAuAflpZEK0bky9FCKmhdjs99JltJGHOAHb5sB4ZvVeVmfw8SquMyc
         Tdaof2FhhOdcIMGOjf4X8eUKgOJYwJmhcqUyQr4YSg5AW36HvLCvGg4gFjxReyUcbn+7
         cZ2qMAgejrhGDQeDqlEgw583vPR50oEpulSuzSn/LTegUz41gzmwjbHApxM8pBS0bBP+
         dkHg==
X-Forwarded-Encrypted: i=1; AJvYcCWzHcEBkd9wa6e7oxOqXFX9WemLXlgfOk/lFvSgwx75cHS86aaj2+DEBnMW3oTUr3r8iKJXe1oKkwebtA==@linaro.org
X-Gm-Message-State: AOJu0Yzju0jVnacKTRuiV63OWkxOJUgH6M0ktwwsDBD/oBzxIYtxQAZ0
	1EyjUhv23CrJGVSLbLGWdN9VOUSalro7CcEG2Te/7XeuVRvsUu39cf/Nx9p57/tEUA==
X-Gm-Gg: ASbGnctIXgAmp71aW7uUplw2CkYo44pgnpxEi7EfEBkLyudloEb4Tm8/ndwAVPjy9OC
	FFNRBn9Yl2xQUi1hQCcqz5XdbQxyimolRj9WAAY96OhGNob4RE8wXZ/LsMcP5EMaNjK8pCYnTWC
	QIFbJ0Q+v2+5obt75Rbf3PyHiTMPjgXmFH3Ol3tkad/SmRN1MJy4irzZS+ugk1Ktn5K2OA44Czw
	CotWDnAkTRi3w/TFPXo6wZXkno6ZKh3L5IdK3J8fLbHuOIN+U9xCEeFKEgM7dB7w2i1zbH6OoLv
	YUnpcEuyMgaWiIVc3j7ywwgj7fwABzW68lvSpWHmFc3H5NctuA4or+/5+04=
X-Google-Smtp-Source: AGHT+IGQ2Y/CQJvytuSzQ8bn6E1HTuNsvy6h2hib1hr/tIxCj4phhTrfkdFlTDkp4pKM2tI2/ftZfA==
X-Received: by 2002:a05:600c:1c24:b0:439:6304:e28a with SMTP id 5b1f17b1804b1-4396e5b56e7mr147751645e9.0.1739877609433;
        Tue, 18 Feb 2025 03:20:09 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25913f5asm14935008f8f.52.2025.02.18.03.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 03:20:08 -0800 (PST)
Message-ID: <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Date: Tue, 18 Feb 2025 12:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
To: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250208205725.568631-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UjKAbBUVrG1S

Hi,

Adding Xen community.

On 8/2/25 21:57, Richard Henderson wrote:
> Require a 64-bit host binary to spawn a 64-bit guest.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 1af8aeb194..911955cfa8 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -304,9 +304,14 @@ else
>   endif
>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>   
> -if cpu in ['x86', 'x86_64']
> +if cpu == 'x86'
> +  xen_targets = ['i386-softmmu']
> +elif cpu == 'x86_64'
>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
> -elif cpu in ['arm', 'aarch64']
> +elif cpu == 'arm'
> +  # i386 emulator provides xenpv machine type for multiple architectures
> +  xen_targets = ['i386-softmmu']

Is actually someone *testing* this config? I'm having hard time building
it, so am very suspicious about how it runs, and start to wonder if I'm
not just wasting my time (as could be our CI).

> +elif cpu == 'aarch64'
>     # i386 emulator provides xenpv machine type for multiple architectures
>     xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
>   else

Regards,

Phil.
