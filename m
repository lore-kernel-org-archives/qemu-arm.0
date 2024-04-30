Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3025939ejb;
        Tue, 30 Apr 2024 08:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXgfjZglBVMxDaRHkvrtq3tFlG9UWW8bmcIfmkU4pOeajs8CV9AHFp6mLhSS7OCghn2650ipHBsrUQHzaWkzAZNrPmmn5x
X-Google-Smtp-Source: AGHT+IHe/97Sy5PYwa+evc21YDtPSZuMxP+Yh5yaeNUpCAJMLuiwWAys4DQJEK/uOd9XMCfF1tHo
X-Received: by 2002:a05:600c:a41:b0:418:fe93:22d0 with SMTP id c1-20020a05600c0a4100b00418fe9322d0mr2446945wmq.11.1714489259883;
        Tue, 30 Apr 2024 08:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714489259; cv=none;
        d=google.com; s=arc-20160816;
        b=G8qwYupL6QP0QmPDQH8pTb6b3ZV3yatccsdIAU2XXkh8MREK5P2PVgNNZvf3hmIuE6
         hKAmPyq6FdcNt+Bg8yLQoLtUZ+I5qEDoFgtVt3Lyqc9Bl7C1g1TUiuN6sWqoGd+QiEA7
         1pHvBe2O6FAyaPvD4c43+CXru7YmepLSuLgMcm89MnfP7oP827mw1PEG7xXrz8qIUk0V
         kbN0Tv0aYdx9IKfK3umv4o2mndFHmx8vcSv9OSwhha2jTfxoe9xkZWdnulcuNME0+7G0
         mBAe79bihkpwPoM4efOt2EqsOFXGVpP+ewFOxCjr6J3X3b58ueOHTzr1UZG3uTni6QEZ
         NnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fSU+ZrS1MIu/d9KmXHLetBql6l0rJVSDX7Igp1Lyz4g=;
        fh=XAV7NTL+CcQs8rRG8v8mXmIGIKmr3oFy0lbTM3NVSuU=;
        b=O5bZEI4RDgaodyEfs4e5mV4Mxf5H5prn+qhDOxtyDev2rtl1wFMauf8Llc2W2bMyYE
         I74dzibZlbmYm4jh2qPZYDqr0mQwrZJsM5N70Zuj2K2jhrcHINpxMhaQdLEQ+5/fWZRj
         9ruvC3ED2yMqxVFG8TykmnO82UIh+NDsbe2sQGL5luGi/qsWs39ZUzzIULZ0/M+WOLNG
         vXwgUahOBTJf6HFORx/gUvMhMSdTbn+IWVcFe7uyHFe6vEPhO7GOQmoVvpV03fzuI86G
         RdohIRgupdixU7QCY/0OaCW9YbCIgikYdWtss+JJJi8DTCqUPaXy6F4ltrY3oyX3yRq6
         mqLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnvzeTwO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fk9-20020a05600c0cc900b0041bdf883ff7si4466728wmb.60.2024.04.30.08.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 08:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnvzeTwO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1oyS-00070I-SW; Tue, 30 Apr 2024 11:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1oyR-0006zx-C3
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 11:00:51 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1oyO-0007R4-V3
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 11:00:51 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-571ba432477so6234496a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714489247; x=1715094047; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fSU+ZrS1MIu/d9KmXHLetBql6l0rJVSDX7Igp1Lyz4g=;
 b=NnvzeTwO1R7baugqCPwVJMG3cbtRne1ANd3mzyTlMSV06M5WYw91lV1PVcDf1V6YZn
 zquro0MEaozBeqFF8hwbNuPI3e7YpgafpzFxrT2qeDlYhPgOpKYHT4NvZBgAKyGC1eCb
 RM8m86xL90ZwmD8CQ5Z1VC+gBXSEgBg53PFbhY/LTpprZeWuMepRreuX/APuC/hzUgHd
 1oBaeUISvAxcF3CV2vdOmuoFrHCPO/nDmX4do4dAp5i9vNpKozp+YIKNmEDZ/5u/9lQA
 JRodEeIr/cEbTw5ug2ETyrw37D0yQn2YgHKyNy/fy1M7fHB6mbxUgQ1mWWAg45jRTa+S
 imAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714489247; x=1715094047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fSU+ZrS1MIu/d9KmXHLetBql6l0rJVSDX7Igp1Lyz4g=;
 b=PoarHXqQo7dP8QbTZsHKNxeUSzq5o9YQjkbw4UdvCOCBIUV/niebT4QUD/weiocBNb
 92nwBejeqLilxE6vVIL+CIB1oJWgM0jsfP1eFr7stEeUNX01YIquFA4FNaKp5D7Sbe3h
 C+vmNg3lEo+PXT5TOVlZcvKizxxe3+QEkVHVQ1fbHGMoAwOLoDH9AK//TcjYOYfjVLbH
 WHelCa8z0Gv/Rz7YgJ8pXPasiZgqsJqGykbzG+0nThs5OmYoxqh/+pyAF/vMh53cfLbq
 sQQVc9HHe0RVmUqVXQFco/x3mdEfRhKtC0HXJxdFCiNmZ1WTkOHDpfNjVTMaIARnkMLD
 1SQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUfgtjYCQn5JkqtZsAwcV2fJ/oP7SMhV0RqII9LfPN7OpDmWi0betgNxnh7mQGAQjTHelSwUVxlU9IwycjBHbP//rV
X-Gm-Message-State: AOJu0Yz6EOnk+yKBtt4hylxj/oZ+DiJFe8MrvL1BMILruis4eJT3as/g
 oE9k+WhMDyJK1e4Tzc+nPEOxmcctHNdUHxnNF7dVybaByZ6LJv9q3sEHcoDg3DUPpaD4mN/80MI
 Qn9f5zuP0xz3VeHJd3XgzzAopTh6PEwKqwyj2Vw==
X-Received: by 2002:a50:d55a:0:b0:56a:ae8a:acc0 with SMTP id
 f26-20020a50d55a000000b0056aae8aacc0mr32234edj.21.1714489246764; Tue, 30 Apr
 2024 08:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240428181156.24071-1-adiupina@astralinux.ru>
In-Reply-To: <20240428181156.24071-1-adiupina@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2024 16:00:35 +0100
Message-ID: <CAFEAcA9TBh8CnvW16hEu5sgLOd4VyKt8JGj0jGRTMw_6iTvP2g@mail.gmail.com>
Subject: Re: [PATCH v4] fix endianness bug
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Alistair Francis <alistair@alistair23.me>, "Konrad,
 Frederic" <Frederic.Konrad@amd.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EUW/7iI6JVE1

On Sun, 28 Apr 2024 at 19:12, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>
> Add xlnx_dpdma_read_descriptor() and
> xlnx_dpdma_write_descriptor() functions.
> xlnx_dpdma_read_descriptor() combines reading a
> descriptor from desc_addr by calling dma_memory_read()
> and swapping the desc fields from guest memory order
> to host memory order. xlnx_dpdma_write_descriptor()
> performs similar actions when writing a descriptor.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d3c6369a96 ("introduce xlnx-dpdma")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
> v4: remove rewriting desc in place
> v3: add xlnx_dpdma_write_descriptor()
> v2: minor changes in xlnx_dpdma_read_descriptor()
>  hw/dma/xlnx_dpdma.c | 63 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 59 insertions(+), 4 deletions(-)
>
> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
> index 1f5cd64ed1..e9133e9dcb 100644
> --- a/hw/dma/xlnx_dpdma.c
> +++ b/hw/dma/xlnx_dpdma.c
> @@ -614,6 +614,63 @@ static void xlnx_dpdma_register_types(void)
>      type_register_static(&xlnx_dpdma_info);
>  }
>
> +static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s,
> +                                    uint64_t desc_addr, DPDMADescriptor *desc)
> +{
> +    if (dma_memory_read(&address_space_memory, desc_addr, &desc,
> +                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
> +        return MEMTX_ERROR;

You should return the return value you got from dma_memory_read() here.

> +    }
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
> +static void xlnx_dpdma_write_descriptor(uint64_t desc_addr,
> +                                                DPDMADescriptor *desc)
> +{
> +    DPDMADescriptor* tmp_desc = (DPDMADescriptor *)malloc(sizeof(DPDMADescriptor));
> +    memcpy(tmp_desc, desc, sizeof(desc));

The descriptor structure is not very big, we don't need to malloc it.
So we can do:

       DPDMADescriptor tmp_desc = *desc;

(adjusting the code below to match).

> +
> +    /* Convert from host endianness into LE.  */
> +    tmp_desc->control = cpu_to_le32(tmp_desc->control);
> +    tmp_desc->descriptor_id = cpu_to_le32(tmp_desc->descriptor_id);
> +    tmp_desc->xfer_size = cpu_to_le32(tmp_desc->xfer_size);
> +    tmp_desc->line_size_stride = cpu_to_le32(tmp_desc->line_size_stride);
> +    tmp_desc->timestamp_lsb = cpu_to_le32(tmp_desc->timestamp_lsb);
> +    tmp_desc->timestamp_msb = cpu_to_le32(tmp_desc->timestamp_msb);
> +    tmp_desc->address_extension = cpu_to_le32(tmp_desc->address_extension);
> +    tmp_desc->next_descriptor = cpu_to_le32(tmp_desc->next_descriptor);
> +    tmp_desc->source_address = cpu_to_le32(tmp_desc->source_address);
> +    tmp_desc->address_extension_23 = cpu_to_le32(tmp_desc->address_extension_23);
> +    tmp_desc->address_extension_45 = cpu_to_le32(tmp_desc->address_extension_45);
> +    tmp_desc->source_address2 = cpu_to_le32(tmp_desc->source_address2);
> +    tmp_desc->source_address3 = cpu_to_le32(tmp_desc->source_address3);
> +    tmp_desc->source_address4 = cpu_to_le32(tmp_desc->source_address4);
> +    tmp_desc->source_address5 = cpu_to_le32(tmp_desc->source_address5);
> +    tmp_desc->crc = cpu_to_le32(tmp_desc->crc);
> +
> +    dma_memory_write(&address_space_memory, desc_addr, tmp_desc,
> +                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);

I know we don't check the return value at the callsite, but we might
as well do "return dma_memory_write(...)" here.

> +}
> +
>  size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
>                                      bool one_desc)
>  {
> @@ -651,8 +708,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
>              desc_addr = xlnx_dpdma_descriptor_next_address(s, channel);
>          }
>
> -        if (dma_memory_read(&address_space_memory, desc_addr, &desc,
> -                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
> +        if (xlnx_dpdma_read_descriptor(s, desc_addr, &desc)) {
>              s->registers[DPDMA_EISR] |= ((1 << 1) << channel);
>              xlnx_dpdma_update_irq(s);
>              s->operation_finished[channel] = true;
> @@ -755,8 +811,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, uint8_t channel,
>              /* The descriptor need to be updated when it's completed. */
>              DPRINTF("update the descriptor with the done flag set.\n");
>              xlnx_dpdma_desc_set_done(&desc);
> -            dma_memory_write(&address_space_memory, desc_addr, &desc,
> -                             sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED);
> +            xlnx_dpdma_write_descriptor(desc_addr, &desc);
>          }
>
>          if (xlnx_dpdma_desc_completion_interrupt(&desc)) {
> --
> 2.30.2

thanks
-- PMM
