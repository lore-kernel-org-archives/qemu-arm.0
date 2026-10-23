Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A1B606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p5iMStj5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKCZi-0003uC-Eg; Fri, 23 Oct 2026 06:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCZg-0003tz-Rh
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:32:36 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCZb-00065l-5o
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:32:34 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8b0db268bd8so4834397b3.1
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 03:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792751549; cv=none;
 d=google.com; s=arc-20260327;
 b=X1VhACNKCeUL1NLaY9CZlXzU7jyJryrl6IS74ZI5za5GSPC8/GmqGlanoYgOPY3dxD
 bsYhC1NgW53IoWDTKohvkV6rv4e6AcuM1WZtPlhDRTtQVSoAiDblQy0E/SmeIXLn/AXg
 KA1NYBpx6dhoYJa0HdorL0j0nwTGePdCeCnrepQRRji8PAtNVSdJK/rcZhHsR2mbO3aC
 t/hgrqNDqXKJ7GqzlW07uluzTBHIFWXKoa9uj4PQtFUCF9o/n1zziEjHlhCGOUCWKwCp
 ypyw3/VXplPDP/XJK6waZFA+KkAhTw2y3IUHwYKq9J4oxpb8RcVxHMv73VDVEpqHi+Ha
 CY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8W3Lv9N1iX0Ekj08dfEj7pPVQwWfY1nt7HBD2uPeyi4=;
 fh=ZTeYyewDTxl61IHBYCKFU+tAB5Ns5Gh2aQBzhMJB5lE=;
 b=moXN9XABYezCYxT1YgC19dC/grZBrFKpvr7WuUJC8WTk0zdrs7iGSaxuKiyMI5MXZg
 plysrHG/xjfPbUk6k+cbDFFYAeV8FeHkLEFtvr4bMl32uvceAABKhD36B9Ltoja/mD75
 mDZGnbD6CCMpaIrUpq9G7FdGGp98QsLYmP7ZphrZbn4VvyCEJbDTkZ9nt8J+x079Zd7h
 NValmoPL9wwXJMoWvL8JmKvw+6A55g891pybexFGaSEXJMdwnahAqvTnCpCJzDvmcaQf
 +B9m8l733m9etF89/AswKYHMkDkdi1Huq6Y16MOl3ow4QLwDR4qcM4YeSzOoOpPUN2c0
 ZMtA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792751549; x=1793356349; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8W3Lv9N1iX0Ekj08dfEj7pPVQwWfY1nt7HBD2uPeyi4=;
 b=p5iMStj5qOkbqTycU3jp8UmqrVvmo7oT2CZEJHFhSIua43ytUzbImh8vqGHSmGteNJ
 zeaF7OEoGtBl0YN4aGGBm1CBc45lxr2/6QPhW3txofYbff4YvZLFK6Y9O+In2Z9rOxHk
 CYzfDeblDXlappk4grYOXWXCvRKsiD7Me3/t8uanuASeEfqZJdqTpnm96K6hR0qym4qE
 wx4hzwW7gpqAK06q7Ql4jJw4x1oyZayAqvwih5+9Io/XoVOng7SyV0Rip2a6PRGcp9x5
 KZGXzfZCElcuiaBjJK5siQ5DGcHPi+KqKhM6oD+naQ/ZKvw7yuYU6lDqwDu1rEoxGRwW
 JqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792751549; x=1793356349;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8W3Lv9N1iX0Ekj08dfEj7pPVQwWfY1nt7HBD2uPeyi4=;
 b=asXnEDnHSdeRDoQ9Tn3Ch5Ut2VzofRtlIxpFs1kBXW1pL8ILZnGlQwfcCqe3CtiBEu
 Ne0Vdjjhn4egATQnVYp7c7Xy5ElHl5YbaY4oGZpGYFjwvABnDmaqJ+6aRGfI3BFWMZzO
 wxSOGu6HmDFFsMrLdH00X6cDz4fZb0rkXDNS8bJfxmfXiEwDctv9N8tTlUp0GPQRz4sk
 voRD6fRcWWlBwmkqTasw9sLH/sdpS90ckInNcawsDKc+FL+3wL3rrlulRbTVthCHFtgc
 GKrhRkC12jBWc/RowyZd+j0x8rSH7yPpMvl7iW8Ww02eGksJR+xqwRN+IcokQsKsTYRz
 S4qg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwUn++fBrD++tL/w/EiY+cmCaNJBcdOks2qr3On175E31GIrEAuHimk6ti+3p91gK4Y1k1/TeDZ4A==@nongnu.org
X-Gm-Message-State: AFq9FYJk+e5Zgo4bAdlAsmeIATnwtnKSvkmL6ozCf5tUZJ7fYhQe36k/
 Z+nOi7p73xU8OT2oyjnk87G/W/ttcyJxK+tQj/UsoVumOKwlBLFgbzovBdP52sE3OYk3sR+oI8V
 pQBRIuFHSSEJZG0nraQyF8l7yfUCuw8tvMHSwOt7V5w==
X-Gm-Gg: AYBFou0C5hXhqrL0tx1hFxxXUrZO+y0oNw8cjw5xsKC5Eb91Ut18F6fjsnrGLu0yEgJ
 OES71a6TJSsP2zN4M5OjQhNfwj4zn8IO0kKdTZrfM/ZdDmIO7Y9jhsQGeFBhvX9vB76NjuEsvTF
 Zy4y75Zuz/KNaipaRM3ukeR1twSy1Ty/z2ycqvm1RikMiw/rpcuoIkVYkn9xLUwPOtrnYKMDFp5
 UKuVdMkr0eVNdsfv92B8JaXF2d1SxWCB+WnUl4ni20eT+zNK/HYyuDyEtttRYUnnCz005j72k0n
 ujRwvjVP8qYc5bCiSAhvh5M+zf48elbd9AcypKI1B1ES1UwCpMclQ7jyAnhl+wJxoD9IxdcM6sC
 yTiEPoWxrKQvWg0+oxlAOEN0zQDqsEQ//MXsmpTpjjSYSeDVFtwr1nTK6Bu+rUmHz1u3ORjdEKC
 wFLAyNa3EadC3VGwMBLby2
X-Received: by 2002:a05:690c:11:b0:8b0:c9bb:1c9c with SMTP id
 00721157ae682-8b157c8d6f5mr13969977b3.2.1792751549180; Fri, 23 Oct 2026
 03:32:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
 <20261018133603.64323-14-marcelomanzo@gmail.com>
In-Reply-To: <20261018133603.64323-14-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 11:32:16 +0100
X-Gm-Features: AclHuK-vaSKsRMxW72PiZKoa6OzFfPPVncEymgVUVLDpHCBRxYCEtYh72kc7VkY
Message-ID: <CAFEAcA9t7ZSHFbE=uJyDdycJj+1ocXw4B3fduFf4ZDhWCmQ8gA@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] hw/net/bcm2838_genet: implement GENET RX path
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 at 14:36, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Implement the receive DMA ring handling: qemu_can_receive()/
> receive() callbacks for the NIC's netdev peer, copying incoming
> frame data into descriptor buffers on the active RX ring,
> classifying broadcast/multicast, and raising the RXDMA_MBDONE
> interrupt as descriptors complete.

> +static ssize_t bcm2838_genet_rdma(BCM2838GenetState *s, uint32_t ring_idx,
> +                                  const void *buf, size_t size)
> +{
> +    const size_t desc_word_size =
> +        sizeof(BCM2838GenetRdmaDesc) / sizeof(uint32_t);
> +
> +    ssize_t len = 0;
> +    BCM2838GenetRegsRdma *rdma = &s->regs.rdma;
> +    BCM2838GenetRdmaRing *ring = &rdma->rings[ring_idx];
> +    hwaddr write_index =
> +        bcm2838_genet_make_u64(ring->write_ptr_hi, ring->write_ptr)
> +        / desc_word_size;
> +    BCM2838GenetRdmaDesc *desc;
> +
> +    const hwaddr start_index =
> +        bcm2838_genet_make_u64(ring->start_addr_hi, ring->start_addr)
> +        / desc_word_size;
> +    const hwaddr end_index =
> +        bcm2838_genet_make_u64(ring->end_addr_hi, ring->end_addr)
> +        / desc_word_size;
> +
> +    if (!bcm2838_genet_rdma_ring_active(s, ring_idx)) {
> +        return -1;
> +    }
> +
> +    if (write_index >= BCM2838_GENET_DMA_DESC_CNT) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid RX descriptor index %" PRIu64
> +                      " (exceeds %u)\n", __func__, (uint64_t)write_index,
> +                      BCM2838_GENET_DMA_DESC_CNT - 1);
> +        return -1;
> +    }
> +    desc = &rdma->descs[write_index];
> +
> +    desc->length_status = FIELD_DP32(desc->length_status,
> +                                     GENET_RDMA_LENGTH_STATUS, SOP, 1);
> +
> +    while (len < size) {
> +        size_t l = size - len;
> +        size_t buf_size = MIN(ring->ring_buf_size & 0xffff,
> +                              sizeof(s->rx_packet));
> +        uint8_t *dma_buf = s->rx_packet;
> +        hwaddr dma_buf_addr =
> +            bcm2838_genet_make_u64(desc->address_hi, desc->address_lo);
> +        MemTxResult mem_tx_result = MEMTX_OK;
> +        uint8_t *frame_buf = dma_buf + sizeof(BCM2838GenetXmitStatus) + 2;
> +
> +        bool crc_fwd = FIELD_EX32(s->regs.umac.cmd, GENET_UMAC_CMD, CRC_FWD);
> +        size_t buflength;
> +        uint32_t prod_index;
> +
> +        if (l > ring->ring_buf_size) {
> +            l = ring->ring_buf_size;
> +        }
> +
> +        memcpy(frame_buf, buf + len, l);

The pointer and length manipulation going on here leaves me
unsure whether we can guarantee that this memcpy() doesn't
overrun rx_packet[].

The rest of this looks fine.

-- PMM

