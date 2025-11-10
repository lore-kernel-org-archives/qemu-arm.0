Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E257CCF9E3
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 14:43:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIT7M-000258-6F; Mon, 10 Nov 2025 09:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vIT7G-00022B-UG
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:43:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vIT7F-0006hp-D0
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:43:34 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso32780355e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 06:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762785811; x=1763390611; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QPr2NEyRm/b4vCmIP+fZhzUhpRy6iXchiVIoeiYVqMQ=;
 b=dpCIcmA+1safeePzrcfmfMBGq7LKpottgdRRB/7fC8aoTU2pQMVUuOzmgAoinpnjN8
 Hh/tyzAdiYr6X0mMYN+LsvRsaYV2/6zfkd8foRtOpCBERmPXEf9QFyiBhTleeseQKlZm
 oqnaX2+PSEGXtefAY/s6biOlGI86h9wl4YV123qm8FkselzvZCB5aWfipMMGQ9+Kus/+
 mE6PZdrxFRcPR8oTbU6up3ibr7yv0tdMciBE21EyG5q508PSMHFeLgePIbWbVvyVUBG7
 Jx94+v+ThgSxAko1RSja8A47Xpvjk4qEgfDOHoczRSIV1AHwyY4T93HQZsecmhfk6mC3
 pPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762785811; x=1763390611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QPr2NEyRm/b4vCmIP+fZhzUhpRy6iXchiVIoeiYVqMQ=;
 b=C68Qua3oWn8ngCp4Z+w4Mqzipn7pIlj8dJ/HnbzRQeZLlTesT6squSxBIV+h1NDjyX
 NbHSGO3AO4hXJ+J532ZHIoXDAw2/ttOMpz6URu2sYaMxCHKR1xE1Dz/v6f3KV28fk+Ng
 iCVFMY2Xv/87LJe9V3TCpC2MuXH6f4W/IiBOVtEqO6wNUJ+KUCj3apj+Zx1oizo4eCtx
 DJEWzmFnLMDWjTUOasXjRdHSOZNgjUja4jAqaeWINX9+cdUHlFlO073kmLVO6JY6BUv3
 rl1uHcuhsttB3I6apJGgRWvqT+nPWhBaoC/eXkhUJBT38LSSvqcpkh9BOKGW8OB3GlSz
 vq9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXUycT32i7dDLG9H+U6xiRoKWr/2vbbDyK+GJ4LHVB2o49OlfsEaCQfYkw1sHtZml9ixAuVCddkg==@nongnu.org
X-Gm-Message-State: AOJu0YwIkN2SCqffuDiWNUgSZPJAGWXYm5mWNm2zcJnoI6kFlq8PerIm
 v6vL2sHbyHnV/bofI1CHg0MIev9YjgnkNsdAIBdrGYZ+msdZe8dofARmtD74PCLCB1ETg3+QS5U
 THMx7ujW+EQ==
X-Gm-Gg: ASbGncvIXZvydPEXo6yyhIZf4sTdTE62mR7KNhWNGtnvy5wrctaIKLVwteyVZQHPZlA
 Yq98KPH778WaXkc4Q/nieKzmN+CYVtUTEBAfzxI7AjqvgSiAfR9dmQAza0gRQyE+GZgpNsDzxxT
 6wohjswZD3Ccfi69TA6B72kcX57ArjUBtI0Mg+ekEgl9Az+s2cZr2Q9nGz3E7114GSagsWKmyw/
 LSr5YX9Hx4Gr7O7/zqtTMTaxrAlnGF08r8FAwUvukiZoOWWag1H86fBEcyZrImGkd7sRjHba6/g
 nTGp0LnXY8JDdRDHqDGVMKfaOQdCBwRtK7ghp7XQyQmlTkbXZt7RsKR599+9ZjtI0vi+ltbzulq
 wKzupC4ZhVzEdFGaFei5jN1m9bGvPL5UJo7/3Pa1GwydyLAFsjVW8ko8GG/5PPwdQJrSsDAe6e6
 5YbkzMBof5dFwlCumI5sD1xUDFNOJ4ZW26fMxTnGW1MQ6oY8tor45Oz9GA/omfHGfMkaI8YTUJ8
 5M5
X-Google-Smtp-Source: AGHT+IHH/Ml3/g+eSk3FrN+wcawEDyEGhZPiLk1BPMx3lYfoN0DSofUbu0ERV0ISKx4kTvBurfqb5w==
X-Received: by 2002:a05:600c:470d:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-47773229845mr88178805e9.4.1762785811194; 
 Mon, 10 Nov 2025 06:43:31 -0800 (PST)
Received: from [192.168.68.117] (anancy-654-1-85-43.w90-26.abo.wanadoo.fr.
 [90.26.70.43]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce210a7sm331270375e9.12.2025.11.10.06.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 06:43:30 -0800 (PST)
Message-ID: <aebd41cc-470d-46b3-85a2-1d8a1c62621d@linaro.org>
Date: Mon, 10 Nov 2025 15:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] acpi/ghes: Extend acpi_ghes_memory_errors() to
 support multiple CPERs
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-5-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251105114453.2164073-5-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/11/25 12:44, Gavin Shan wrote:
> In the situation where host and guest has 64KiB and 4KiB page sizes,
> one problematic host page affects 16 guest pages. we need to send 16
> consective errors in this specific case.
> 
> Extend acpi_ghes_memory_errors() to support multiple CPERs after the
> hunk of code to generate the GHES error status is pulled out from
> ghes_gen_err_data_uncorrectable_recoverable(). The status field of
> generic error status block is also updated accordingly if multiple
> error data entries are contained in the generic error status block.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/acpi/ghes-stub.c    |  2 +-
>   hw/acpi/ghes.c         | 60 +++++++++++++++++++++++-------------------
>   include/hw/acpi/ghes.h |  2 +-
>   target/arm/kvm.c       |  4 ++-
>   4 files changed, 38 insertions(+), 30 deletions(-)


>   int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> -                            uint64_t physical_address)
> +                            uint64_t *addresses, uint32_t num_of_addresses)
>   {
>       /* Memory Error Section Type */
>       const uint8_t guid[] =
>             UUID_LE(0xA5BC1114, 0x6F64, 0x4EDE, 0xB8, 0x63, 0x3E, 0x83, \
>                     0xED, 0x7C, 0x83, 0xB1);
> +    /*
> +     * invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
> +     * Table 17-13 Generic Error Data Entry
> +     */
> +    QemuUUID fru_id = {};
>       Error *errp = NULL;
>       int data_length;
>       GArray *block;
> +    uint32_t block_status, i;
>   
>       block = g_array_new(false, true /* clear */, 1);
>   
> -    data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
> +    data_length = num_of_addresses *
> +                  (ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH);

Should we check num_of_addresses is in range?


