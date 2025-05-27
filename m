Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4891266njc;
        Tue, 27 May 2025 08:21:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9QlK0SVPoi5+K2IqKWBQv9OvSgcoxCXlM4gaFlt1sFLrY6DGxrlHZi0Sh0d7rDe9g2NHpsW/aRE44Jw==@linaro.org
X-Received: by 2002:a05:6000:3109:b0:3a3:621a:d3c8 with SMTP id ffacd0b85a97d-3a4e5ebb9b1mr1219087f8f.19.1748359297469;
        Tue, 27 May 2025 08:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748359297; cv=none;
        d=google.com; s=arc-20240605;
        b=EyKSaicS2j6XQfctu7o0MkcSqZwoyRwkF7I67Z7+AU4wSKybS9iPLxeUAxcgvJabNT
         cOnq9UbabaAlNRtzIUunQBRQo+xwFLIg8ajwt2IUNjC306p2U2oRVYpEobT9JqQRJGLM
         zMes6QJ+gwI6oRu8OK0hZYpgPMnTpgixj3jNjDsYl3talQ0yHHtlea+4mYO6mD8cOqrg
         5bM49e05TZFbMUoIzy8/FskA7hZcZLswqyUYdDfdNLdf0t4DBNsgbLmhkc7aF8JlMvvT
         WgSAFzEKO7703yOhJI+m892Eo7NXuP+AvJb7L4+87NtsIdBGkEFtf6ksLucHqjFf+qre
         6oCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DjHiHOQO6JIJa796okapzVVnNBoIzDrjt8TCX2d77YA=;
        fh=xto2kA0kauJlVAAWO48LMPIWtbfYsW5e3vNl8f5a/Tw=;
        b=MsWEY33QK+fgRYUZjLAfMnfcjjHUY7U7EAsLX6SA67fHtNXre5RvSzX/WkLyCx+RF1
         KFBzO3NsX/8TmP5bOxMNqLv7vKQ0lXBKZ59wVtFWm42pG1QF19cYoik0PNH5EUpXgu0y
         0F97YEK9Y5vVS1WUZ7C+hyoTPHyudLRt3V/EPXXyopgMz3J4sAflMB0gcbOZAfPjCxo5
         EtgKR1bs44oNbwJGnpzNZxvAYXGieUuugY0EuvnhuCkXS3qwjviikIBWP46AdUl+uS3I
         9N68MkUtDCkTV9nbPXP2d6ihKo/ZNzFsySyHR2SpSAPlkHKnzqk4cXEYcYvgUR/HIbX6
         4rUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rbSbMOWQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a4db4200d2sor1144509f8f.0.2025.05.27.08.21.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 08:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rbSbMOWQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748359297; x=1748964097; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjHiHOQO6JIJa796okapzVVnNBoIzDrjt8TCX2d77YA=;
        b=rbSbMOWQXfwqmBqM9dh2Y5EiQE2PhTrVQvJ0+5Ep+Q0Zhy2b+IdIU2ZBw24rY862Ii
         3Qz8/DrKUuANLZIuoRbItHj9/wRItzYkug/+7PBmK027jttT6g2fXxex6z44irws+Ufz
         CWiZlNDcfIBg7pLXQD8uIZ5PMq8xF3n9CSG7DP7RPkPQp+hU9lV56NEd8QxktDs1FK4Z
         DUCktIpfO7TTAwxtNaWZrvvKooSbQjwiuFP8HMTUT2LOhhTb2xH67z8NBaItkEry/VKc
         F+VD9N3Pem2u7t79d01pQrK8VxmPBWYGgbxFj5T9vYEVJm3ymxlz8TtyQf9n330X7N88
         V0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359297; x=1748964097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjHiHOQO6JIJa796okapzVVnNBoIzDrjt8TCX2d77YA=;
        b=X/IJ+NfY/LV1gD6cw9N9kyCgQTjJ5nsMiXQHArVd8DXT9MV7Rh0PTR57OfF2vbEt6Z
         vCWaOFCBarrn6N/Hwz0/cdQkvp9B/RMSeyAxAFm5g7eCcYjTxcIVloxlgUtaBvgLA+9/
         l/9d/D04AmBOdpaJKc28j7/Sh15nAxNqCzncJzSnmUMMHj+y/YlXQ9sdr8O+jz8vIN2z
         Eg4+rFS7iI0xwcU2hnYxbNQCv7xZlSgUZ8L3TyBtn8BcVmbECbAyriN3q1YK3WLROyoQ
         XYZxJsMYhtFXtOtkXjVcqcnFtHOvA0w8thmsMFKwFK8a7JCotiFLXEw8LZXkVM6BimOh
         sjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpVy6Os+2YbqmpzvcYQ+vz1MMIKpvGiJMVLaitJ/Ny6s3XcmuLTO8pLqtUFgzzTAhmBbZ65aSgMLP3qA==@linaro.org
X-Gm-Message-State: AOJu0YzqPA+idcdnNE8jMbnLk9QabvvIz/h1QsUqL/ETbG/i3GBbqkI0
	MewzF//nwb4oTfW11HF+/MHbVy1QXeq1l/ZoW3KRyw2tqI/yJ0XgjMI3AAXhV+B2FaVpHg==
X-Gm-Gg: ASbGnctXOJQmp/pIB3mV5FRR+lF1vF6/VtE9YZWq/cbRC+lHB8RMP2cb9pyupv2Vpzu
	bss0IlOS46U8NtKhXTVRF11kcrDVxlo5bEAfl6rUYC51rQWCBowewqnSTM1U+xkBByi4NnBbf8a
	XUaDGxCY1qSx5wGJfTpf6XiImUoTzqITpUwtMSaWO/EdOyCs6OJHfy+Xx5rexWm150IfPYncAYI
	44b275tsoTyF7zF432ZQSb4WLEUkrS5HWA5fYGCJD+f7ePwOuif9+pHNV23TOta8KW5FfdciiKq
	gtoDb8+PNk9qYiVPNc+sTI+ZrhcG4s88YogKHNfNqUddfXPDBsFzuYybQua/3EgXHQ6OJ776i38
	R8+Qa0PzIpbHXSGgcKJnIfO44
X-Google-Smtp-Source: AGHT+IElDK0J0n2yRQ5HB79NN8pg4YJ5E2nr//72TnfMYHApQlBkraltrMwwN+h/2UmQafNlULxjUA==
X-Received: by 2002:a05:6000:290b:b0:3a4:df8c:dd3 with SMTP id ffacd0b85a97d-3a4e5e9e458mr1072697f8f.21.1748359296676;
        Tue, 27 May 2025 08:21:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c9cd023csm11704586f8f.10.2025.05.27.08.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:21:36 -0700 (PDT)
Message-ID: <04a1bb03-5823-4c6e-9f0a-10882b96a6b4@linaro.org>
Date: Tue, 27 May 2025 17:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/25] hw/arm/virt: Let virt support pci hotplug/unplug
 GED event
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-23-eric.auger@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250527074224.1197793-23-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: LXBf1X8eDY+j

Hi Eric,

On 27/5/25 09:40, Eric Auger wrote:
> Set up the IO registers used to communicate between QEMU
> and ACPI.
> 
> Move the create_pcie() call after the creation of the acpi
> ged device since hotplug callbacks will soon be called on gpex
> realize and will require the acpi pcihp state to be initialized.
> 
> The hacky thing is the root bus has not yet been created on
> acpi_pcihp_init() call so it is set later after the gpex realize.
> 
> How to fix this chicken & egg issue?

FYI I have this question tagged since v1, I will try to look at it in
some days...

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - use ACPI_PCIHP_REGION_NAME
> ---
>   include/hw/arm/virt.h    |  1 +
>   hw/arm/virt-acpi-build.c |  1 +
>   hw/arm/virt.c            | 42 +++++++++++++++++++++++++++++++++++-----
>   3 files changed, 39 insertions(+), 5 deletions(-)
