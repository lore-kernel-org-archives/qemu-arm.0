Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1269214ejb;
        Thu, 25 Apr 2024 03:46:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUubpF9oQrZOZ/nYQz8L6AMGfOqgq/fiBcEyCUfqo8pEAOlV7j0YeM39FNoQv11wCt5LlvekT88MVZUnR3VuT4fP6pDgh7I
X-Google-Smtp-Source: AGHT+IFDFLkZACeMgjcARAaFBoyArc5ORWaVMpCuOSVihvNmAQKjs/APsOPubG2ycVebrmL+V+oO
X-Received: by 2002:a05:622a:188a:b0:434:cfe4:90fe with SMTP id v10-20020a05622a188a00b00434cfe490femr5765717qtc.38.1714041994760;
        Thu, 25 Apr 2024 03:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714041994; cv=none;
        d=google.com; s=arc-20160816;
        b=MAPTI8mlfE6YAR7eLIaW8hr1tCgQakZC3ZJns8/qShQEUTjN73sJCLGHqkVeQLNUZt
         AToAJSGhGCr6MAI5Mcax0xprlgN9TAInIZ/l1kkyXV1GANsk8RQcvpG1hGGdl/trItF7
         U+cBFvzeqojfMdw85FaWBprb4s8lazczgVLfk03trrk0ZP2pJ7TbN25IMtcPcM/0LsjT
         HTpLEYuWy8B53exkRCESP/B0SRr5nz+KhiksMSSA/Sui8OWdy2hYK685IT/UssGHo5pb
         T+DjrtMdQnhkq+pdR91NWbZrX6iSN2jNR/TzJoTlg8dg41ja3wKOI0EijpZhi93NtcCf
         QDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MQvojeQR8GDvv5LfZTwKARJFKYCu6zUt5V+bZDXmKU4=;
        fh=244a2NNKKqCWzdzK0jmW+Y8o1e+k+BwyrwR2k9Rnv+Q=;
        b=F9tmnDtvD4SQFOrkwHfbEidOjptzUoeG2RtRN35V6Yba8JJthknw7qk8gRfGtbRIxB
         xYQAmecIkMfWNS4EbLA7LsNbOoa1Z5VBwWxmlm+t1jeUwF60jQXQNS3Oqxob96Iecmqk
         fOHRWj5fhyrMN2KJi/4++/8YLoFLW1+FopodcHd+j40KUNMt3q8nKYy/5iNLNHJ2HUoS
         uPz25g5TMEw95uOpGBEcFAIGXTMUokv8SzAcW/McUHsT6jrL4HE5dblnXzKGenhx2ZRQ
         6boElMnn7O/GJ53DP0GOf2y8ECnovR0l/7ZCKv8raFcIc4cfTkePP/41q1cXrnTyAE0D
         UY3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1TWWoWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq15-20020a05622a5e0f00b0043981229ea5si12209635qtb.806.2024.04.25.03.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 03:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1TWWoWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwYg-0000JO-BK; Thu, 25 Apr 2024 06:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwYe-0008T5-FY
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 06:42:28 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwYb-0007do-Od
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 06:42:28 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2da08b06e0dso8380831fa.2
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 03:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714041744; x=1714646544; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MQvojeQR8GDvv5LfZTwKARJFKYCu6zUt5V+bZDXmKU4=;
 b=Q1TWWoWHsErHi8P/SoSP8OFuSdEgNsDaNrKYBpb70UFMQLEXbuh3QSS2LaIamG0BVe
 HI4RS7k+bjkytqnolvwt3PD4cynj3X2bm2wHc6szNqD4PD8zJB4mMlw2nZz0fuXzgz9J
 yz7LS/hyNqydt+CKtAxURyLwNdZRJLWXq9ON9FzoajGS5+an4q5eW5S2z687KFZb0zZw
 J02xPz9R0NdZjpR70Jt+3Od3Fbvf9OBGUZGmuBoqazqeVoldKkmf0CMbqJ2LsgkZhuoA
 kQ8t0eNy/AkBiRO/yXUtmNmRorfhtLkWrZDeuDMhApkUTGnY/4BUFVdkWR8rrPE0EEw7
 jqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714041744; x=1714646544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MQvojeQR8GDvv5LfZTwKARJFKYCu6zUt5V+bZDXmKU4=;
 b=tQK/b8cQJsgZBIzgGncggMM8irKYlLk8UMv66j7mw1jX6PW9bYqgnCcCK66312hXaS
 0ZDazIo2SS1IyK8Tx6jhxzAWtFfm0KspX2+Tjy82CPXuW6SdxHE3KSCP64Z6TFe5Hcih
 lSAERv2apfmQazV0qiCzSxkIf2FQhqkjUmpe3pcGmF64DRnI3U63ErT2++xzSc5PEIyv
 tQVvLwWr1gNGCz1BjMatssRY1MLg5GWqsUvUN7zlJfE5mT/H5XOPNQuNL09XhEeRVj8+
 eLbBTHbFwLGoQbSXWn8TMpGzaHtvdaWUcQr5nv2ziFGKxmQ8s4/INxWHATtMgFuqV4Ns
 onsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5gYLlLWw01rO8WnmuFaom+yGplTPUx3Oay8P84bvR3L5JeMtG7MWHcykvi6GashSpcdcZy2i3ksC2Luf/Ogtnwww9
X-Gm-Message-State: AOJu0YyTEK3HDsKbXcuBoY4GrMDHUbCVYtYFuQQ/zpKoTOdX4TmqCCXm
 Wl8ZwCRKaYq2r2ztE03x46IR7gt4KaWzrH3kjdOTcPbL4XEthrETpWCEmDCt5e2Gnwf01abh+qd
 M
X-Received: by 2002:a2e:9f42:0:b0:2d4:5321:9daf with SMTP id
 v2-20020a2e9f42000000b002d453219dafmr3420580ljk.44.1714041743833; 
 Thu, 25 Apr 2024 03:42:23 -0700 (PDT)
Received: from [192.168.113.175] ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c450d00b00417f700eaeasm27263118wmo.22.2024.04.25.03.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 03:42:23 -0700 (PDT)
Message-ID: <074c9cbb-939e-4fb1-87a9-235626bf3a94@linaro.org>
Date: Thu, 25 Apr 2024 12:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fix host-endianness bug
To: Alexandra Diupina <adiupina@astralinux.ru>,
 Alistair Francis <alistair@alistair23.me>
Cc: "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
References: <20240425100718.20184-1-adiupina@astralinux.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240425100718.20184-1-adiupina@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
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
X-TUID: /uMB6g0ZIZZT

Hi Alexandra,

On 25/4/24 12:07, Alexandra Diupina wrote:
> Add a function xlnx_dpdma_read_descriptor() that
> combines reading the descriptor from desc_addr
> by calling dma_memory_read() and swapping desc
> fields from guest memory order to host memory order.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d3c6369a96 ("introduce xlnx-dpdma")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
> v2:minor changes in xlnx_dpdma_read_descriptor()
>   hw/dma/xlnx_dpdma.c | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
> index dd66be5265..62a0952377 100644
> --- a/hw/dma/xlnx_dpdma.c
> +++ b/hw/dma/xlnx_dpdma.c
> @@ -614,6 +614,34 @@ static void xlnx_dpdma_register_types(void)
>       type_register_static(&xlnx_dpdma_info);
>   }
>   
> +static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s,
> +                                    uint64_t desc_addr, DPDMADescriptor *desc)
> +{
> +    if (dma_memory_read(&address_space_memory, desc_addr, &desc,
> +                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED))
> +        return MEMTX_ERROR;
> +
> +    /* Convert from LE into host endianness.  */
> +    desc->control = le32_to_cpu(desc->control);
> +    desc->descriptor_id = le32_to_cpu(desc->descriptor_id);
> +    desc->xfer_size = le32_to_cpu(desc->xfer_size);
> +    desc->line_size_stride = le32_to_cpu(desc->line_size_stride);
> +    desc->timestamp_lsb = le32_to_cpu(desc->timestamp_lsb);
> +    desc->timestamp_msb = le32_to_cpu(desc->timestamp_msb);
> +    desc->address_extension = le32_to_cpu(desc->address_extension);
> +    desc->next_descriptor = le32_to_cpu(desc->next_descriptor);
> +    desc->source_address = le32_to_cpu(desc->source_address);
> +    desc->address_extension_23 = le32_to_cpu(desc->address_extension_23);
> +    desc->address_extension_45 = le32_to_cpu(desc->address_extension_45);
> +    desc->source_address2 = le32_to_cpu(desc->source_address2);
> +    desc->source_address3 = le32_to_cpu(desc->source_address3);
> +    desc->source_address4 = le32_to_cpu(desc->source_address4);
> +    desc->source_address5 = le32_to_cpu(desc->source_address5);
> +    desc->crc = le32_to_cpu(desc->crc);
> +
> +    return MEMTX_OK;
> +}
> +
>   size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
>                                       bool one_desc)
>   {
> @@ -651,8 +679,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
>               desc_addr = xlnx_dpdma_descriptor_next_address(s, channel);
>           }
>   
> -        if (dma_memory_read(&address_space_memory, desc_addr, &desc,
> -                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
> +        if (xlnx_dpdma_read_descriptor(s, desc_addr, &desc)) {

Correct, but this is incomplete, because we have the same problem
on the write descriptor back path, few lines later in the
xlnx_dpdma_desc_update_enabled() block.

>               s->registers[DPDMA_EISR] |= ((1 << 1) << channel);
>               xlnx_dpdma_update_irq(s);
>               s->operation_finished[channel] = true;

