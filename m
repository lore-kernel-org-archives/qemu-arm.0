Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1467204ejb;
        Thu, 25 Apr 2024 08:25:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWyBFIRpUaVhvjhaJve0vpP66VjMqM42hg2J4huUL6wNiFY1Cnh8t+FfVhIDOzvGanJJn1FzLu+WaYShvdG3WtK7+u+le4
X-Google-Smtp-Source: AGHT+IEBmFrplXw87fV5JQql4WUllCYAayjAoDNluZLuRR8ehWivTVjQsXu5RDr++JyRayeQTm+N
X-Received: by 2002:a05:620a:6216:b0:78f:95c:5de5 with SMTP id ou22-20020a05620a621600b0078f095c5de5mr6107482qkn.26.1714058731423;
        Thu, 25 Apr 2024 08:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714058731; cv=none;
        d=google.com; s=arc-20160816;
        b=fZ+UZ8N51DQ4fIBm2S+L4ZXzABYvyzfvi9UFKzewjQ3zQ9aJEUqCSfBjkSzq4q5Aji
         mpFK8KFJjKLq5WAUlW4C1CIUvbyCpNWD2+LAL+QX1krELtzBKr2jQePwSSa/GGcs5AQ1
         J2Vy1CzCujj5uYpes3mMUz7qDMjK961iswL2qQxOKjNALKQnjQzRxLTaayT8mcNDgJpl
         CAzbHC5XPcXZR2k35Hy14WFQpVP3regh4X2jfHntbDHmwXp2fbRWfjoGW0mxPn3Z3XFu
         m8NPIxNN/KAyFeQdI4LRa0GaymCN43k5b6ehzLgTHT7CytwI09D3sh/HhGEcM2wwYF5h
         6tAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=je4x5jiGT0B0ywcNHuMNctXjgVyiZbeVwC2Wv/LhaKE=;
        fh=btH3sN70RGCz1Q8zrXp8iBOkHwPBbqVi1WnZLUj8dco=;
        b=dRWF5GcLqpKsYwxlqJo9l2yLS/JXB22nu3fUsrTxS/ehPa5epuSWvNtmHdUayHPCEn
         58ACbZeCPT9lSdtCX1TgY3AZob4GdP9tw6GGdkQs1IxVzMI1wMdSDyFGA9XEYT+qNMfO
         GKpKjUy79nA068+n1ehygOu3zqTQwfCmr9w2D8yXnwjYorpdSgGOxddAj7o4OwzyGtqx
         1zaXwYKOUA4LPebL6eXvOs3nz/LzQk0WvZ5lkUGHHr5Xm29PCYLmdXD7RmzRUSUI0GGU
         V8MG9k8tfumNyiEpAfcv6+5Fpnc92F3MEtjdfCErUhjSY31e+X5bBClo6pMf5pzH5L8I
         9vQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GhXRnwtc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a37de05000000b0078f04a252e0si17162599qkj.230.2024.04.25.08.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 08:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GhXRnwtc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s00yF-0004YC-9O; Thu, 25 Apr 2024 11:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s00y7-0004Tc-K4
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 11:25:05 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s00y5-0006ha-Dg
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 11:25:03 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6ea2375d8d0so883088a34.0
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714058699; x=1714663499; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=je4x5jiGT0B0ywcNHuMNctXjgVyiZbeVwC2Wv/LhaKE=;
 b=GhXRnwtc/2yb54cJVtMX0dgebWpeadMlO2l+SbgTTuEgAvs8Ue1mbSUANk/f6h5DrD
 lbsy0ZdIbO+gBYLyhv7V5ch4CnfkjvP6UZ+LSkjVZsvBgu2XLrlm2QkbpOhS0gPSZyP7
 LdFOU9+l8VNMf3PqtcoyAouuQ3PGJ7jIgpuh72jKetXSxYaKXu1Hfu6TstxwATHysfQo
 1WKMS7BPEy0p+1/l9w81d+UE9iMEme6Q16eKnG+mdSLrKDZeJuBwHdl07SA732WvNJxS
 nz7vLZfJosF3XxjFmfr+USy27HNJpicXWEUyd/gH3deKTJrERAoQ1jtAH4GLOeS7t2yf
 fIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714058699; x=1714663499;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=je4x5jiGT0B0ywcNHuMNctXjgVyiZbeVwC2Wv/LhaKE=;
 b=U0ycd7fZRsC7CONkfcjCV2T/KbFHtVqtbIiiBOjAgS1jzT8kfSIZmPqmVX5HkCn1u3
 SSs9JXK4M2WNpi+pSBN8wl6l6EsbSmbnExwpQ8KPPPJjBYrente5+G/h+tUB/KEF4urc
 zUk5q3IV336iCaIssz5sn4b+yv3izpSOEmxUP4ZCsIulHM0ZmHmH5Md2x8FvfXOuStUI
 WAgVNRokZDSQtWS3EjglTzwr31L7GsswsuJ6yI3MGeoKDVkHEBjwhz+KN4u0O+JV0MLR
 SzaQCMLXoXAWsJYDtxUt9VbVvT8Lc3C1Vqlc6H3LyX6zlZC+SzmykBBoKwnyAg5Zvbiv
 1gkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1YGo8JUjTJr67kkNw4G+lV1hPBUMQA/kJPW0s1vJjwIuwloHtOJAkFJCtYBNVp8k+pf+FCY3LOaGE0jozshAinhX4
X-Gm-Message-State: AOJu0YzSG4fZf2Estcq17XdRD5qlDZUjXFHzC/rVdiSkm3sjLheMW5yf
 wfRLuSYcLfNG7M/Yo5E64NYxpXUiowvrVsEcPPmMa5F91cX23cDwgASiMSq0Krg=
X-Received: by 2002:a9d:4f06:0:b0:6ea:9ba:7fce with SMTP id
 d6-20020a9d4f06000000b006ea09ba7fcemr6796669otl.38.1714058699706; 
 Thu, 25 Apr 2024 08:24:59 -0700 (PDT)
Received: from ?IPV6:2607:fb91:1ae9:8637:9f94:1f67:75f4:ea2d?
 ([2607:fb91:1ae9:8637:9f94:1f67:75f4:ea2d])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a056830114900b006eb94216797sm2694229otq.58.2024.04.25.08.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 08:24:59 -0700 (PDT)
Message-ID: <56479506-9e30-4003-9153-db6ef19ecea0@linaro.org>
Date: Thu, 25 Apr 2024 08:24:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fix endianness bug
To: Alexandra Diupina <adiupina@astralinux.ru>,
 Alistair Francis <alistair@alistair23.me>
Cc: "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
References: <20240425134115.32057-1-adiupina@astralinux.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240425134115.32057-1-adiupina@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J3z4WYnUfvoq

On 4/25/24 06:41, Alexandra Diupina wrote:
> +static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s,
> +                                    uint64_t desc_addr, DPDMADescriptor *desc)
> +{
> +    if (dma_memory_read(&address_space_memory, desc_addr, &desc,
> +                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED))
> +        return MEMTX_ERROR;
> +

Missing { } for docs/devel/style.rst.

> +static void xlnx_dpdma_write_descriptor(uint64_t desc_addr,
> +                                                DPDMADescriptor *desc)
> +{
> +    /* Convert from host endianness into LE.  */
> +    desc->control = cpu_to_le32(desc->control);
> +    desc->descriptor_id = cpu_to_le32(desc->descriptor_id);
> +    desc->xfer_size = cpu_to_le32(desc->xfer_size);
> +    desc->line_size_stride = cpu_to_le32(desc->line_size_stride);
> +    desc->timestamp_lsb = cpu_to_le32(desc->timestamp_lsb);
> +    desc->timestamp_msb = cpu_to_le32(desc->timestamp_msb);
> +    desc->address_extension = cpu_to_le32(desc->address_extension);
> +    desc->next_descriptor = cpu_to_le32(desc->next_descriptor);
> +    desc->source_address = cpu_to_le32(desc->source_address);
> +    desc->address_extension_23 = cpu_to_le32(desc->address_extension_23);
> +    desc->address_extension_45 = cpu_to_le32(desc->address_extension_45);
> +    desc->source_address2 = cpu_to_le32(desc->source_address2);
> +    desc->source_address3 = cpu_to_le32(desc->source_address3);
> +    desc->source_address4 = cpu_to_le32(desc->source_address4);
> +    desc->source_address5 = cpu_to_le32(desc->source_address5);
> +    desc->crc = cpu_to_le32(desc->crc);

This is incorrect, rewriting in place, because after the call,

>          if (xlnx_dpdma_desc_completion_interrupt(&desc)) {

the memory block is still live, and the swap here has corrupted it.

> +
> +    dma_memory_write(&address_space_memory, desc_addr, &desc,

This is incorrect because desc is now a pointer so &desc is DPDMADescriptor **.

Do not reply to an existing thread to post a new patch.


r~
