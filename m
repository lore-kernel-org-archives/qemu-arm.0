Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2330888ejo;
        Mon, 8 Jan 2024 06:59:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKuu8rf3Uy42fG6/S4T7ZZVwu3+JIpAoAPazwGmrXThn302BaMQL9kIV+VZT2g5k2dkUJ2
X-Received: by 2002:a0d:ef83:0:b0:5e7:ebc6:984 with SMTP id y125-20020a0def83000000b005e7ebc60984mr2471241ywe.84.1704725956286;
        Mon, 08 Jan 2024 06:59:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704725956; cv=none;
        d=google.com; s=arc-20160816;
        b=dyGwCEAUw/Zh4Bz9zW/OI9eLLXxe93/yj2Y3IZbK6Gqw4qivT+dZmn33RPUhfIytWe
         Fx2jMAT+BlUL0eO0D//AddiAQp/KI2rCTW8H+u+cKLX5j24Ros7+L7yWhA3YnpMFtZD3
         J081Y8WUc/4qXM4epTyLTuGZ8UVsCd95Az51EJXiET4PMaGabGpCetCsyiwvwunbR1fy
         MWS1lQpiIgCK1mXG6Z8sYhaSdTNS5rcqpOYh4HrswkSiWx+bryK6N8LL0QWo6df8UT+r
         56DbbbYNxJmAkZ3VEJqNPMjGcvYk4NWb1715nkNgSh520LCdObdVJIyUWf/1ce1H6/uk
         Eu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c7iYMBVhBsrYnsJcY2FLpqUui1X0DuZ9loQO9NDMOOY=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=gu1X0yDMRPAvka1WgiI2/hnpGPcckL0WxL/pg2xp4rkOuM9i5BhZe9tZkc25Qec3BN
         onh/bHj7edVHkEVgqF3EvVnqXadBupVwHhxfhJAmGzha9iWDw81Qv0QVmJe1CHz1Ayov
         XoWAF7mDjgM3Qtfsp8D/G2LEfdvB2WinnUe5NQEWOn/Eooe5eG4Puqp8NT+OBEkWUqPC
         shfWglcQkwGStQ1W2ib2cDP42qK54oP+k9BQx1zl7/tjbLmQGi+BEcDb6iMWo364S2Gt
         WDFPVwVJakAfgsgpM4Khotokwa2AqNSnrZ/cTV3Gvl34gtwpkrccwfD9CXTOIR2NdbFK
         rq9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ld/8AJEW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a0c8e8c000000b0067f86979518si34305qvb.573.2024.01.08.06.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 06:59:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ld/8AJEW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMr5o-00054j-Ar; Mon, 08 Jan 2024 09:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rMr5h-00054E-UA
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 09:59:03 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rMr5g-0001yj-2D
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 09:59:01 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so3381804a12.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 06:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704725937; x=1705330737; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c7iYMBVhBsrYnsJcY2FLpqUui1X0DuZ9loQO9NDMOOY=;
 b=Ld/8AJEW0iu14ebwL5kJhSqG3kiRX/Rx0f6LdYpYvKSsYdTk/lt//TZu9bV8oKKBVu
 hkULHwVsKIOE73kN0Wyd4970ruXhexjlgAFx8SsgY26ZLqsXlN065t58WLZ8k0oPd+ns
 O5DIGP1z+3jDb/1EwdgMVNUtwHoXaiNjexjbV30rCRU1FpiQRYTLU2ng6oEsxWo8D1D/
 lUSpqrYDmK9PZ8DM9bqx8dAa5c+YOUYt3krHGnO68BpnNlCJqLrsx2zGXk98AXr5g53J
 4TblPvs8/4hQ7PZl4oERJLre3h6C7XldzqwViqZWzIw94GlMmJ7CObSg1fc+Z1u2Yy4+
 xlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704725937; x=1705330737;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7iYMBVhBsrYnsJcY2FLpqUui1X0DuZ9loQO9NDMOOY=;
 b=uY7H5B87Paz8LJaXzA5ifRI1mdmeChy0+SKN027SnbzWxX6TOgvA115tCil3KDvGje
 S4Q/0ntIaOi2w1KXdOKGBKcdjUp9i6EajPrV6ani7rdBhCk+PTQ1PPJZ9RWrjMr92Th0
 oNw1ojViycXbUnI9VxaEF3GdbvFIuD/LXgY11GTsoHJ4bYridIHgWrIy9eq1j0VJ2Zuw
 gBIJoIfZgrbhguZtOklbSUunuhTJLzAHvy2v1DTN0fQdk4A98BfeipsMHpyov1YpPAF6
 Boyll8jtVYOMe0CIIXlkZ8yHDaItsWwtb3ySwfdOKwxRtclEqlxWNQ79zAxod6O0U9vb
 //9w==
X-Gm-Message-State: AOJu0YyVc/hKzq5ZPFPhHbQoPwRYxeKWamelRzFYIh7HhvcD9b/lyqvj
 zP5iUFGucLf3eS8OwbDB2Mqlwv/e9Sr+6cPNpJo7Dhy7z0HG/pifB9wJhVnS
X-Received: by 2002:a50:9ea2:0:b0:556:e101:535 with SMTP id
 a31-20020a509ea2000000b00556e1010535mr4281619edf.37.1704725937481; Mon, 08
 Jan 2024 06:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20231219213255.604535-1-nabihestefan@google.com>
 <20231219213255.604535-8-nabihestefan@google.com>
In-Reply-To: <20231219213255.604535-8-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2024 14:58:46 +0000
Message-ID: <CAFEAcA82Bgh8qQ7sxdMTHTfdMO97qTdbdB4xCcGLnKXgoATGMg@mail.gmail.com>
Subject: Re: [PATCH v9 07/10] include/hw/net: General GMAC Implementation
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9xdGf/4CGOXY

On Tue, 19 Dec 2023 at 21:33, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
> Implemented Classes and Masks for GMAC Descriptors
>  - Implemeted classes for GMAC Receive and Transmit Descriptors
>  - Implemented Masks for said descriptors
>
> - General GMAC Register handling
> - GMAC IRQ Handling
>

This commit message doesn't match the changes in the patch:
it claims it's adding a lot more than it actually does.


> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  hw/net/npcm_gmac.c  | 40 ++++++++++++++++++++++++++++++++++++++++
>  hw/net/trace-events |  8 ++++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
> index 98b3c33c94..44c4ffaff4 100644
> --- a/hw/net/npcm_gmac.c
> +++ b/hw/net/npcm_gmac.c
> @@ -149,6 +149,46 @@ static bool gmac_can_receive(NetClientState *nc)
>      return true;
>  }
>
> +/*
> + * Function that updates the GMAC IRQ
> + * It find the logical OR of the enabled bits for NIS (if enabled)
> + * It find the logical OR of the enabled bits for AIS (if enabled)
> + */
> +static void gmac_update_irq(NPCMGMACState *gmac)
> +{
> +    /*
> +     * Check if the normal interrupts summary is enabled
> +     * if so, add the bits for the summary that are enabled
> +     */
> +    if (gmac->regs[R_NPCM_DMA_INTR_ENA] & gmac->regs[R_NPCM_DMA_STATUS] &
> +        (NPCM_DMA_INTR_ENAB_NIE_BITS)) {
> +        gmac->regs[R_NPCM_DMA_STATUS] |=  NPCM_DMA_STATUS_NIS;
> +    }
> +    /*
> +     * Check if the abnormal interrupts summary is enabled
> +     * if so, add the bits for the summary that are enabled
> +     */
> +    if (gmac->regs[R_NPCM_DMA_INTR_ENA] & gmac->regs[R_NPCM_DMA_STATUS] &
> +        (NPCM_DMA_INTR_ENAB_AIE_BITS)) {
> +        gmac->regs[R_NPCM_DMA_STATUS] |=  NPCM_DMA_STATUS_AIS;
> +    }
> +
> +    /* Get the logical OR of both normal and abnormal interrupts */
> +    int level = !!((gmac->regs[R_NPCM_DMA_STATUS] &
> +                    gmac->regs[R_NPCM_DMA_INTR_ENA] &
> +                    NPCM_DMA_STATUS_NIS) |
> +                   (gmac->regs[R_NPCM_DMA_STATUS] &
> +                   gmac->regs[R_NPCM_DMA_INTR_ENA] &
> +                   NPCM_DMA_STATUS_AIS));
> +
> +    /* Set the IRQ */
> +    trace_npcm_gmac_update_irq(DEVICE(gmac)->canonical_path,
> +                               gmac->regs[R_NPCM_DMA_STATUS],
> +                               gmac->regs[R_NPCM_DMA_INTR_ENA],
> +                               level);
> +    qemu_set_irq(gmac->irq, level);
> +}
> +
>  static ssize_t gmac_receive(NetClientState *nc, const uint8_t *buf, size_t len)
>  {
>      /* Placeholder. Function will be filled in following patches */
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 33514548b8..78efa2ec2c 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -473,6 +473,14 @@ npcm_gmac_reg_write(const char *name, uint64_t offset, uint32_t value) "%s: offs
>  npcm_gmac_mdio_access(const char *name, uint8_t is_write, uint8_t pa, uint8_t gr, uint16_t val) "%s: is_write: %" PRIu8 " pa: %" PRIu8 " gr: %" PRIu8 " val: 0x%04" PRIx16
>  npcm_gmac_reset(const char *name, uint16_t value) "%s: phy_regs[0][1]: 0x%04" PRIx16
>  npcm_gmac_set_link(bool active) "Set link: active=%u"
> +npcm_gmac_update_irq(const char *name, uint32_t status, uint32_t intr_en, int level) "%s: Status Reg: 0x%04" PRIX32 " Interrupt Enable Reg: 0x%04" PRIX32 " IRQ Set: %d"
> +npcm_gmac_packet_desc_read(const char* name, uint32_t desc_addr) "%s: attempting to read descriptor @0x%04" PRIX32
> +npcm_gmac_packet_receive(const char* name, uint32_t len) "%s: RX packet length: 0x%04" PRIX32
> +npcm_gmac_packet_receiving_buffer(const char* name, uint32_t buf_len, uint32_t rx_buf_addr) "%s: Receiving into Buffer size: 0x%04" PRIX32 " at address 0x%04" PRIX32
> +npcm_gmac_packet_received(const char* name, uint32_t len) "%s: Reception finished, packet left: 0x%04" PRIX32
> +npcm_gmac_packet_sent(const char* name, uint16_t len) "%s: TX packet sent!, length: 0x%04" PRIX16
> +npcm_gmac_debug_desc_data(const char* name, void* addr, uint32_t des0, uint32_t des1, uint32_t des2, uint32_t des3)"%s: Address: %p Descriptor 0: 0x%04" PRIX32 " Descriptor 1: 0x%04" PRIX32 "Descriptor 2: 0x%04" PRIX32 " Descriptor 3: 0x%04" PRIX32
> +npcm_gmac_packet_tx_desc_data(const char* name, uint32_t tdes0, uint32_t tdes1) "%s: Tdes0: 0x%04" PRIX32 " Tdes1: 0x%04" PRIX32

Most of these trace events don't correspond to the code change
in the patch; they should be added in the same patch which adds
the call to the trace event.

thanks
-- PMM
