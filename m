Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp457504njb;
        Thu, 5 Dec 2024 14:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVgc7KarNos3v2P9gHu9/WGUWwdS7jeXXTsGJYqNtpgzhYojpHQ0bZ2lhc/xnHaNm6bEeR0YXpc/E8riA==@linaro.org
X-Received: by 2002:a5d:588f:0:b0:385:d143:138b with SMTP id ffacd0b85a97d-3862b3db6f0mr507276f8f.51.1733436784960;
        Thu, 05 Dec 2024 14:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733436784; cv=none;
        d=google.com; s=arc-20240605;
        b=bK/yhiPo1wQte9FoSpOnh2mCwL+I9M1CbrAEZQwplYqYz3w+Et+Cs/CORwTLT98nem
         waKI3eYNYLnxq6Nm65EQ7OOU8LLy40+zaf9NNbj0Ni09UZIampTD0ChsPreKPH1oI9bZ
         hF8RytFAY+iTWjeTNGduk7F0k3Bp+gBteRNhS66H40tp6ytWne6eD5/F3vFssLJlHufY
         fcKaeg0jo7WJkGT34xsmo5SX9gWYATnxeCI1TGxfAAkn9bxU9zacGeTnclNHzPL4P8Lj
         4fubXFMJxeQ2h7A2RwpySkvxKAdjo3OU3fgm5H2twhdVI4cBoP0s2yKG3l5+i3qVe54g
         Z7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vHmmfy7MY/nxP0JFjq1JP8jgOvU9Pbqs9DUdVUT7J2k=;
        fh=G8h+Puv62IBWd7rIetP87v3Ha8E8t4SHNhPsgp5gFTo=;
        b=Qofc9g3w5AjJ/Rg2JFiK8XszMz8hT6LOXQHANCEuHwYHx3wHj4LK8XOIXFtbHxWrW4
         hwGrNQD5p3piMOTMNH0KKec+quWd58ZwIE+088/xaUWYnjDG6KVQDYaXj4uXf+qMXu+j
         19BRDJLkkCgv6P7hOXQehCEgNxTIk21ohKd7gjVW+rslWQ24cjGFQ/PJdKOZFvSihX3f
         84ifeBGq2ZOv8/sgT+2UbdARKq9KTEBTLVuYbRu0FWLRi73nd1uXcaIZNJE74/85B581
         jMEobA2W01SqkvW6cWfdJivqToQI7CbGhMAPnI1h3KTxMLtvMqqn8YoCBdpDAxO4DCFk
         unKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ydZ3S3lV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3862cd411efsor18747f8f.1.2024.12.05.14.13.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ydZ3S3lV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733436784; x=1734041584; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vHmmfy7MY/nxP0JFjq1JP8jgOvU9Pbqs9DUdVUT7J2k=;
        b=ydZ3S3lVL6RK+8b7tLfxJq8I8IZW50TXdDxH6dKeOL6gIolzAhPenxYJntYqpiZZuu
         Hs7yvG4RZ19K6Zv4uFZlDS8TAhn/JLxoO/XoWfEYUDs7sIASzq8GRL0k+tJWERgrI1G4
         QyVQVYefwE6bh0brGL6zkLefm+0gHnMJ7J4vC0+pfm87EbRFhbGIuRY9pOVzr5SZRONQ
         +RGMY/WwZzQf7lPSAdMWdwxQNI9H+tDnBR9C7MfiBaBS6kzBL+3Ok1r5lOwY93qGgrHL
         p+omoZoGaBiI8m+ER1ARt+U0Kiss4l5lgOvKMfgjPkE9CQ6dx2SElvlIUSqSGerMTaFL
         cmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733436784; x=1734041584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHmmfy7MY/nxP0JFjq1JP8jgOvU9Pbqs9DUdVUT7J2k=;
        b=I0HQ6Qm6frlcBlET57r3U78k+xsH4l4kQnJwDYvouYuM5QUTcBThke2ZteCdO7yG24
         KqB7rJ3HdkI88OZjgzWoKV5WE7EJU0uKz/VrIzygjvfCrlnwy4jrObxkjH/vTZjTHKhK
         I4AJzFtjnsh/sOVoIc9AhEVUO+MhNYMhyLsGJBy4y4bLh8mxa34n1R34efJFSjB4DRM6
         B6b8+i8Mi6EqBIa8nUqyJXwQ5Xa5H9o+xYPmoNLIZBxB19YjXb8fQTGv1Ij1vwNniizu
         eCEh4H2SpfFAeWczoQNk/aJJ7nqnMJ+WSaXKx38w9WLKn8HFQLugxhQCEZPBYYQdIR6Q
         0i6g==
X-Forwarded-Encrypted: i=1; AJvYcCWhh5AWCwM7XoenDAoD2WY3nS3KyUJDqw3refsqEX2qV5segOhzBFx86CyCaAaAKAQkM9CeyEYfY0nReg==@linaro.org
X-Gm-Message-State: AOJu0Yxhv8lQkKHKwxnDKfDbMxqB3AXM3VjJCG+nDhMBoaYZ2PnDj2vV
	+ZUo2xzlLJw9VvoU83oC0TfNjJHupguJGezjFtYJOnMqVq/nSsV0A8DtP3L5f/FYQQ==
X-Gm-Gg: ASbGncuvXic0QCKI8Cc9eicKHiwwwq61VvYhmrAM42RupkhtYEWDyR/PYEI3skBFUr5
	Kf/HWFGZBoAAbI9iL95yA3W+nBFA36iybKUhRQIj51AbnYxYXAXJ+WOnrKgJT8ZSDoF2x8XEpi7
	hGeujm0vY8toqFsbptfvEYqZlQV3ZjCZWfFdNrA3OL1p8CIh7jrz7S3jyz6oY82CTp9H2gtfbEf
	9DplQp8/aHWmsH8HWYKPV5ATT/qBVF8YYb0n1c9K4JBl57wsQuQ9khe2Q4tPBsfv4WEPtLF5ueA
	vuoxNB0F7v6QY/cANg==
X-Google-Smtp-Source: AGHT+IFeIKnQ8ZbnWENTbu03WGnI/TH668TtvXlQuDf/jS8X++X0fypC63/il0OHLvviE1J7v3bDIQ==
X-Received: by 2002:a5d:5f8c:0:b0:385:fd24:3317 with SMTP id ffacd0b85a97d-3862b33cfbemr538072f8f.1.1733436784368;
        Thu, 05 Dec 2024 14:13:04 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862c611242sm191319f8f.36.2024.12.05.14.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 14:13:03 -0800 (PST)
Message-ID: <9823e0e8-3d91-46db-969d-42344cefa301@linaro.org>
Date: Thu, 5 Dec 2024 23:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 23/26] hw/tpm: Add TPM event log
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-25-jean-philippe@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241125195626.856992-25-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Hz/pa903m0Xf

On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> Provide a library allowing the VMM to create an event log that describes
> what is loaded into memory. During remote attestation in confidential
> computing this helps an independent verifier reconstruct the initial
> measurements of a VM, which contain the initial state of memory and
> CPUs.
> 
> We provide some definitions and structures described by the Trusted
> Computing Group (TCG) in "TCG PC Client Platform Firmware Profile
> Specification" Level 00 Version 1.06 Revision 52 [1]. This is the same
> format used by UEFI, and UEFI could reuse this log after finding it in
> DT or ACPI tables, but can also copy its content into a new one.
> 
> [1] https://trustedcomputinggroup.org/resource/pc-client-specific-platform-firmware-profile-specification/
> 
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2->v3: New
> ---
>   qapi/tpm.json            |  14 ++
>   include/hw/tpm/tpm_log.h |  89 +++++++++++
>   hw/tpm/tpm_log.c         | 325 +++++++++++++++++++++++++++++++++++++++
>   hw/tpm/Kconfig           |   4 +
>   hw/tpm/meson.build       |   1 +
>   5 files changed, 433 insertions(+)
>   create mode 100644 include/hw/tpm/tpm_log.h
>   create mode 100644 hw/tpm/tpm_log.c


> +/*
> + * Defined in: TCG PC Client Platform Firmware Profile Specification
> + * Version 1.06 revision 52
> + */
> +#define TCG_EV_NO_ACTION                        0x00000003
> +#define TCG_EV_EVENT_TAG                        0x00000006
> +#define TCG_EV_POST_CODE2                       0x00000013
> +#define TCG_EV_EFI_PLATFORM_FIRMWARE_BLOB2      0x8000000A
> +
> +struct UefiPlatformFirmwareBlob2Head {
> +        uint8_t blob_description_size;
> +        uint8_t blob_description[];
> +} __attribute__((packed));

We use QEMU_PACKED.
