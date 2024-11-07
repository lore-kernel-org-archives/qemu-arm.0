Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4108009njc;
        Thu, 7 Nov 2024 02:28:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3jTqA30ii4Z5FTn/oQJiUAi7AhUP0tNIT7TMt30S/MwGjjnS1fy/uPjypL4MXAgBoCZmOHS3X4BbmTg==@linaro.org
X-Google-Smtp-Source: AGHT+IGy24/kEDqIkrlie3nEI7blcM3NyBBIw7Nz/wkR6I5YwXCdO99hR7STKNUfHlnQ6LKNtSDM
X-Received: by 2002:ac8:7d41:0:b0:461:18f2:49be with SMTP id d75a77b69052e-462b868747dmr309251311cf.21.1730975290739;
        Thu, 07 Nov 2024 02:28:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730975290; cv=none;
        d=google.com; s=arc-20240605;
        b=Yhuvt2yDjWrPL5yLDV0hMuP/RSH3/iZesbFacG0y0JBje2Cvd1KSOzZo84N0forAnR
         bVy1R5QbsWBa0WHyHxWNUW6XTKWOMGtY9JjMJ0VAAqtqnK0/sryR+pO4XgB6xD6NyAVl
         DFXvM9RIJoVrd4xfkTfIiXDOv8JuLFvKw4RvoVrHRlXx8jDERUBJS+lTeI4AiIO/ZCcd
         TQJTuWjWh7SzkWcZvlpExvcnDzZRQwWc7LmlWK/Wx6VSJntq616g1gON/23xom7zlr0K
         ILDwHw2g8GB2smYmuBW9dSlMi+LVRZh+WotTriECt3zTl05W0Ymd4l7KFDRe6eGuggxi
         3XVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wX89TnjD0GpGlaLexSSa5ZtdHMZ3CG5OaqI44rLpj68=;
        fh=FGkn5uymvOjMNsXQ1w5gUCe0xMXUpxbKqAVcg5ydvsk=;
        b=PWeiOTGs+UVK10uAHxcRr3BjSps6582lSTV/2qlPapldl1i/pyhmY08+bnbjluSejb
         tIcF9aLt8D/ajAb7lq3SOFd97X0nv2ZPROPcjObS2PycGtg8e0fIWzWHldel0vEApPV/
         Hai1JwDSYgbuGa6VDWrHYTKVG5/VNs9GPC8/o3SaBH9im3wMrBTEdWE8a89KF4AzSK/t
         J7ifyeNAiOdiEhWI4k8nHIlyGHKs6oT7xAb+oadUD6Jjtm06fRDo+/T+d2C/ydjDJx3o
         an/0hC0LsskoZPA4vAgZzt+I32gj82chKp0xK8cVJJ/9wgY7Y6uf2uEdUX4hqSzYaWfD
         FiTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3WSYVbD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40e92csi11801871cf.3.2024.11.07.02.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2024 02:28:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3WSYVbD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8zk8-0008G5-CL; Thu, 07 Nov 2024 05:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8zk7-0008Fk-1B
 for qemu-devel@nongnu.org; Thu, 07 Nov 2024 05:27:59 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8zk5-00031N-5y
 for qemu-devel@nongnu.org; Thu, 07 Nov 2024 05:27:58 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cefa22e9d5so861777a12.3
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2024 02:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730975275; x=1731580075; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wX89TnjD0GpGlaLexSSa5ZtdHMZ3CG5OaqI44rLpj68=;
 b=B3WSYVbDWJqg4k5J1ESIviAE75+z4hnGrL39vN1OuDjjBbV/ke1LS6CGyYdQLgbzcL
 RxxcEy+bjjWNBC7yCPZQDVPOfH4btjv8eJVXvJEZFk7gXJ38HDBQC8NxPprt27R7zxCd
 O2pXhXd2oqQPqc0/VwwDM0Pc95rvk6mI3jP06trTLOmUsZPEpqkNp4EwPidkINVYgQV3
 YOs6IL4VIh5SJ323Jf/kw/Oj9q34J4/oqhJ8FR7qbKpDEArUrmkZE2dwCjmG//bSilRR
 3OXX7/o4krGujOxAaagLi2nQGSnQM7kYTlTmztsjxASmv2bljT8aH1jGpRpfbgl8L4AJ
 3yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730975275; x=1731580075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wX89TnjD0GpGlaLexSSa5ZtdHMZ3CG5OaqI44rLpj68=;
 b=vAYC+PkQuq8Ui8DNTRPFw5hAC3hPlYS2lPQ3Le1+4SxtOc6Sagv4Y5G/nOaOzjx7Dn
 LJjQrCrtvH19M3KK+5oWxRLa1lMdfmuz7sCUFd+5Hz+Rgi3Qbw/W+RTLOPt119okSkr6
 1qDM6L+n3tZeIQEuPxFaHhSxUQ8+erDGyq5zkfFH19PbE2C/n7UJ6Qspn2IP6u80VyhJ
 AmZewLc0Tf45HoNsm6RyMO+81gnQ1MvRSJv22pU9KBlFDeEcihmzcxsO4pqR0XGBe+JZ
 PWNomPI3V9BcQyJ5XR+BraiZj+NVTnPKlenIcqzgnoh6a53Otw4HP4vmyV8gPwOEdBkj
 ST3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU36/d0DDYDTOGZho2eHcJI0bFI4GWIhgXQCmmb7rMy9gJhJWpJjXC8Nv13o3RXcDy6r0+YV2JLCkd1@nongnu.org
X-Gm-Message-State: AOJu0YyYMa+fw2A8VOpyItIc7BxFReBj5honEQK72q03ETtiUpTB2FPv
 DPDMvCtOfhjoIByF0DlXr21sdIo8i+2udcMpYl/SOcidvoAdggVkdWgIYeBy4qk=
X-Received: by 2002:a05:6402:3202:b0:5c4:14fe:971e with SMTP id
 4fb4d7f45d1cf-5cbbf920567mr30670560a12.23.1730975275173; 
 Thu, 07 Nov 2024 02:27:55 -0800 (PST)
Received: from [172.16.23.118] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03c7d957sm609806a12.87.2024.11.07.02.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 02:27:54 -0800 (PST)
Message-ID: <fe69adc2-0ebb-4be0-93a2-9a45d87c36d3@linaro.org>
Date: Thu, 7 Nov 2024 10:27:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] hw/char/xilinx_uartlite: Make device endianness
 configurable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
 <20241107012223.94337-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241107012223.94337-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Zpx/7VrbUf4Q

On 11/7/24 01:22, Philippe Mathieu-Daudé wrote:
> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
> Add the "little-endian" property to select the device
> endianness, defaulting to little endian.
> Set the proper endianness on the single machine using the
> device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/char/xilinx_uartlite.c                | 44 ++++++++++++++++--------
>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
>   2 files changed, 31 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static const MemoryRegionOps uart_ops[2] = {
> +    {
> +        .read = uart_read,
> +        .write = uart_write,
> +        .endianness = DEVICE_BIG_ENDIAN,
> +        .impl = {
> +            .min_access_size = 4,
> +            .max_access_size = 4,
> +        },
> +        .valid = {
> +            .min_access_size = 1,
> +            .max_access_size = 4,
> +        },
> +    }, {
> +        .read = uart_read,
> +        .write = uart_write,
> +        .endianness = DEVICE_LITTLE_ENDIAN,
> +        .impl = {
> +            .min_access_size = 4,
> +            .max_access_size = 4,
> +        },
> +        .valid = {
> +            .min_access_size = 1,
> +            .max_access_size = 4,
> +        },
>       }
>   };

Having looked at several of these now, it occurs to me that you can avoid repetition:

static const MemoryRegionOps uart_ops[2] = {
     [0 ... 1] = {
         .read = uart_read,
         etc,
     },
     [0].endianness = DEVICE_BIG_ENDIAN,
     [1].endianness = DEVICE_LITTLE_ENDIAN,
};


r~
