Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp8598541njk;
        Tue, 31 Dec 2024 10:01:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXWfsGMKNovMI/WLFhFcnsKH7j2cvdVcIl8AUkbcffxDN90uONpOQCn7G+GRWa8gOJeyNQVS77cMn3aA==@linaro.org
X-Received: by 2002:a5d:5e09:0:b0:37c:d23f:e464 with SMTP id ffacd0b85a97d-38a223f75bdmr36189469f8f.38.1735668066513;
        Tue, 31 Dec 2024 10:01:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735668066; cv=none;
        d=google.com; s=arc-20240605;
        b=jbPaxEUNxTyZPhx0W7Cahc3LAMETSl4C1VBvSy3gbg9mZWbHsAVCy80DqiPxVuDmFh
         DoNSVHNGxouflns6VmpdddUZv6VpKKXV6/yrxqkaWb4u4Ubu06xLFChDlym3J1+Nrg8w
         kxCiyooX08egW5L/MzU9vLpK5WZQ6oUUbgQQJkEI8HFASfWAxYgHZS+tMBPF9gi3O00J
         Jjvzo8u/cdFyMuOAzcNEhuQvilgo0ADekOHjAzt7lUI+IMNQtGIu5Di0Tz7sUH88CW6e
         tRqscRKSt8YLHCtpiw8IXenzL/SCSLVq6W68C3hzPxeERF6BwkJrhqkL8Wkx23RmgPtu
         ub6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CAy/h+byf5acdo41fAdmD5XWdSO7i9k/e2eErMWtT1Q=;
        fh=w0vHpFEhcy0LR3QeCqOsqpM/MgIsGzQG3YSeSUy+7KY=;
        b=eZzgZUnA59A8/rgHUSZ1hGmXwyTJHDsDDUllUCj7sX/i98viQ53BJKVHLjTakCpu4h
         QnyRBFlRCP3rysVofcy2Yi5eTndkCHXEsJWB0KsF1tTZW2f4n1ia6L8Ck+mCaQ44j65e
         etnogav5st9PfkoOFKUDq/B4j78pBq+7OhzDEitb3bOqEeaPX0vD++gZHqpjW+Xx4wxM
         YxoCZdjEEXkf9OdWn9Ui5/cG0cnah2CEDFG6Os0E5fA8PiGYmEJtAR2ZRO4CtQwGRCLq
         ovxfvmRnQe/IjJlluXFS7VExWilPfMAaJ6WWTRc36oI1dwRrWfJn3jdDoTqKyZVXjKT0
         urHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTd1Guss;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a1c8cc4a2sor8328621f8f.9.2024.12.31.10.01.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 31 Dec 2024 10:01:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTd1Guss;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735668066; x=1736272866; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CAy/h+byf5acdo41fAdmD5XWdSO7i9k/e2eErMWtT1Q=;
        b=lTd1GussEPhQKuNgkePnBnuWEt7Vi3V5xk1L1G8sEiVQFeZVTV6s1ZgsUO8grW9KJ0
         f8L2XYLLgsH2OFAt5CNIutmS7BcvHj7wCCxgSiOY+QsZ38Jzlo7gkn1iw0qEJ0nSUURS
         zyfvk4lobRuo1T20r7U550nb10E9Edfc3u3th0AMlnK1P3dlRkFQVUwieC7Sjm4ZDaH0
         r6/3hG1S6neETQzgohySREjtvbjsQoq/V67MHkAcSeE802PI3J9FHdiqzj6gp0iP5EnZ
         x2say4bEKW7IDlfLIb2UULnEJw4zDEBJgzrZBBKggTFVnAbBG+629ih1PtSMOsQLRIoI
         GbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735668066; x=1736272866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAy/h+byf5acdo41fAdmD5XWdSO7i9k/e2eErMWtT1Q=;
        b=VQXPFeDbfic8k+pVdjvjHjY+vhVGIsC0ZURgGs71Rj/yE8eLdYvAlB0sXZBtR2XWxM
         po3EK2z4ryDTQhXrBSJ/kXMb2vOV1B/HOw2R+X/uCLHwjER2A4aWZB/M/CVnguPqeR9F
         XrLPHjrJhoJPSnUfAiSmoCyUSHRXkiqqHiJg2ua3HeseiiVSPPWAAPwdOIZJt8mnkyFr
         44yINRRmhlKbfbJZFEm70oumvSwNPkwV0jNESEyRI95YjMewEDBu9213Gt1eb8zoMM9S
         WWYzdM2AgxMIa/lDZmwywtgd8gKq1JflgSdYEEuWdenp7Th9+BArpOLMGMgYhkW4/aq8
         U2rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcnFrRlm9bRop8wUt2qPXqlsXAijK8ZgdGcjzt+MIkdAdxVigQvVnx0SubBa1/6imO3udd+jdGSubLDQ==@linaro.org
X-Gm-Message-State: AOJu0Yy9ldj5mEesficcXvdn+Uyu6nLA226s53DakzlhSD80jPUBCKXa
	CThOx6esEVwKC4vIlz9Z4D+31ZK4+FcAeK+6PGzneabop5ua5NZCzbqdxQGH40BqDA==
X-Gm-Gg: ASbGnctRbMX5EJ/Pp6hfIAq5Z/BG9/iby0sWuQM0jQ27cHPdiFUtlNzbyO3muAN3xRj
	Q51Oz6B6GZH9ZhtDJ4F9UNc9487fzJb7J1CZXjTWDcjHXESZ/e6/DvyL61RRLsTaqprfLQnBZ/Z
	YsYPD0E1jJHCUjebmLqHBlt0w/w0qZBt6mUS34LxP3A468dkWqJD847M6bhPXoRODK7YLWhHwxA
	0FsmLTRyMONSpnppJk6nSjiq2XfSvg461v4sosGLP6ZJ5qiaUyvto2AadrXAe+hffFxBmF+exJc
	Az61SQvZKlJQbgzSnpEpuQao
X-Google-Smtp-Source: AGHT+IFHex1vWyr7zaxqtjFYSOMXkGF/7fWPg4LRktsZayQpxgIrW49CXjmefvGk8X6/MMvOOpHWPA==
X-Received: by 2002:a05:6000:18a3:b0:386:8ff:d20b with SMTP id ffacd0b85a97d-38a221f2f2dmr31832561f8f.27.1735668065751;
        Tue, 31 Dec 2024 10:01:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e3d9sm32744377f8f.67.2024.12.31.10.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 10:01:05 -0800 (PST)
Message-ID: <0a4d5893-d54a-4b4f-91ad-0fe35f195294@linaro.org>
Date: Tue, 31 Dec 2024 19:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] hw/misc/ivshmem-flat: Add ivshmem-flat device
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 armbru@redhat.com
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
 <20241216141818.111255-2-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241216141818.111255-2-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FmJ6htNG12UT

On 16/12/24 15:18, Gustavo Romero wrote:
> Add a new device, ivshmem-flat, which is similar to the ivshmem PCI but
> does not require a PCI bus. It's meant to be used on machines like those
> with Cortex-M MCUs, which usually lack a PCI/PCIe bus, e.g. lm3s6965evb
> and mps2-an385.
> 
> The device currently only supports the sysbus bus.
> 
> The new device, just like the ivshmem PCI device, supports both peer
> notification via hardware interrupts and shared memory.
> 
> The device shared memory size can be set using the 'shmem-size' option
> and it defaults to 4 MiB, which is the default size of shmem allocated
> by the ivshmem server.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1134
> Message-ID: <20231127052024.435743-2-gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   docs/system/devices/ivshmem-flat.rst |  33 ++
>   hw/misc/Kconfig                      |   5 +
>   hw/misc/ivshmem-flat.c               | 463 +++++++++++++++++++++++++++
>   hw/misc/meson.build                  |   2 +
>   hw/misc/trace-events                 |  16 +
>   include/hw/misc/ivshmem-flat.h       |  85 +++++
>   6 files changed, 604 insertions(+)
>   create mode 100644 docs/system/devices/ivshmem-flat.rst
>   create mode 100644 hw/misc/ivshmem-flat.c
>   create mode 100644 include/hw/misc/ivshmem-flat.h

Missing MAINTAINERS entry. Please fix as a follow-up patch.
