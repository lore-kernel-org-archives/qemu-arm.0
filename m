Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991D606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 10:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXFRVN1+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKCBq-0006pA-9L; Fri, 23 Oct 2026 06:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCBm-0006oV-5d
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:07:55 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKCBk-0002a2-05
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 06:07:53 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8b0d126f631so6379577b3.2
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 03:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792750069; cv=none;
 d=google.com; s=arc-20260327;
 b=sT3TKKWo+mK4LoLltg3j80OAzalX9bxAT3VFZjUhWVP0rhhKQSnpa+JQQEB5OzuL3z
 GaZalbcDr3YgZQuleJpuXBSKTD82vMHcb/HXVxSX0e5tCUqg1ePqNKF3euMTkDeG7j9l
 9Yerdziv4bo+nae6QOjfSvRt5BNtPVBWENgkrEoyNAqmHs2mBpGnijRxMUJReGl6+8a7
 jEmnVmrSLfsPiGYb5Ttq0Zf/j4PnVAXyZ6AMZW7x/dOtgBEqGcUMjSt9aYy4ay+Echz5
 u4Ghe6vtOjPjoafb9unuUp4sX8V8natKvRGBSMXYL/hllAmzEgOlfQ/165qPbZwe0qQQ
 f4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eOq1pkkwksdTejfeGNzf9oIofIO9DU1Ho0yL/pATfEY=;
 fh=iY9uSYMowkLcQR7Gjfilq3STM1Qc7KeButGEJ87LNOU=;
 b=kfMVmAQQeA1sswdTjKUTaX2h2rGmjBteZbekfMy1na6o5kI/Z4zNSsk8j44MXddB9Z
 8NqjX7apmLGXv5ZM3nHNvwOcoZp31IMnEPGsoE3M4Yd1c+NhgZbdoBD5XIorZuNYjaJz
 MqWS4xXQIx01qIFtTE1PaJlwjBca2DW3SIhkm7aglHI1J8DyniZVOA1udUd8iba3v1hU
 cD/FXAhNgru5OTAxuQ8N72pnkWlJetLTX/F7ba+RnJOWsvQgre5/8PWA1wCCr5hFwz2C
 fFn0+tU+6GYzkGoSZSHLwvQV7PZogGCXfZOrXIqjgaBtf5TL188Kt6TP5LqMBkKRUqIP
 ncbQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792750069; x=1793354869; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eOq1pkkwksdTejfeGNzf9oIofIO9DU1Ho0yL/pATfEY=;
 b=eXFRVN1+AWsdVw37nERT2LlNusDnl757KsJ7z/JesVdkroJR08JyJIwJJBD8SmC2kU
 4lNqtXDDXoRWrJz1TMwp7MEPNzYEqnmZwvNWtHDa3WUACeMgYSFVGxs2OhYDL9dGpgIG
 fuiiAmPsZT1O8h7/ElfIMo3lydI945Yi+h16nF2Z8A6Yyu2BxrAJCeeCg1vXQnzLP2hC
 fzO6sVj6hkIMXc6S9YUFjknKSj3NAIeEW5mWndDM0CskLKWX7KcM/0rV22VUX4Pt0cei
 fqHGDVK6qtgGxB43kdJwYR4tRnQP18iqL+3YcMYJ8Ji7RpmdkOWC/pikp7Ay5yNgLcnu
 fbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792750069; x=1793354869;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eOq1pkkwksdTejfeGNzf9oIofIO9DU1Ho0yL/pATfEY=;
 b=kXtu2TWhdc3A7sX25LqDP0c0OnFZ2+a+Tjt2varFjU7bXgYlh+8rdDng//jjgX8DXB
 0lpg/IbHolMwCfqqXIOAloSbN0370lkCnOpD1gajbB/m2bjz9oPkj5pRYurfl/t7nn5a
 DdcI1w+uSkmNyFzW/XISZB/aVtIOHYO7z7KTHh5z9A77BZh10k44NjlyzEu5uoivzrvd
 PEDk97hN+KTM4Cc1IFAU1r675SEdU63/QTjvxdBe+Yrf5weY9rHVfJ52wiObFVcUQpmO
 GRhQ/QBO4N2vbYUT5A9hiLYn6ma2Z4OMn0YGUYG7NITS1QTI9amfqXQBYjOsrR09+3Xz
 FFJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx36umDtXo8hs23QEfDT7Nm5+0SuCllQAwQoMW/SwlcNOghXdCK0hgrJGCX10rkTPgdeEh/lEejCw==@nongnu.org
X-Gm-Message-State: AFq9FYJXuVzS1Yr9mvHUX555uOZjpS06py3utiOkWNzRsnm5GpnZgLMj
 an75A4Ljif8WLVOxFCigVXcr+GL/RMtNeZahhGB6RDUUIzzL8itJzCdNdWWQrKZEF2VWVqUInBm
 Qj0RI2GSJO0mT7qQV7Y2ifDm+JKhxY+f6eLM6+OdcHg==
X-Gm-Gg: AYBFou06hbbH/eL8uJLRg+KKaNJl6rJ0WN0YX1HwQsfW0AAuRkp2jy4RIVMvpg/Igxe
 bH2Php8D611xbS4zJthZiZULkpxSdBVLvIY8MjJ6KXaIE3pPaiqmBr3/qhe98LQPKnH3YoQtB1M
 ASH6d52pFTtmW2pcZdepuThpnqXNMnNnJxcIeYNHwdJBZgvQBAZIUiQ/rnhdbF2mkJeHAxV4EVC
 I5kECAz67V1oIs6NZEWhed7sC5d9oYRd4KdsID3dA6a+ej7OPFdax7O6NAA8dhTdzVEsZX/TZth
 vBoiuVrPBQxEgc3ngWg/aa+vwBJ6ExFFResLqkbpaWM9zYIuo+FjCxMMm4fp/H/EZmSfe5ztQzA
 Sk/xGF675z49Wf8+pOHafKXT3iWIS9yAa7iKW3TW6zW7PJSQUw1xKaJlWp6vhrZ7xmYHJV7QnT8
 7lx7YBs/wSIWzSV/OizgRfXS5PgC2A0EsWG8MEnNgYnA==
X-Received: by 2002:a05:690c:d87:b0:8b1:46a1:2893 with SMTP id
 00721157ae682-8b157ba30famr15713037b3.6.1792750069276; Fri, 23 Oct 2026
 03:07:49 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
 <20261018133603.64323-11-marcelomanzo@gmail.com>
In-Reply-To: <20261018133603.64323-11-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 11:07:37 +0100
X-Gm-Features: AclHuK_JgnPFrSO1ORdYazVwxzVgDw9tiN9AhF1TuB1Oh8OZtBAjv7TpCOLSJRY
Message-ID: <CAFEAcA9AZjSqUHFdSTsUuZ4bHwZH2DkbewmU0LP4zG96onHxAQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/17] hw/net/bcm2838_genet: implement GENET register
 ops
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 at 14:36, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Replace the stub MMIO read/write handlers with real dispatch over
> the register offsets from the previous patches: SYS revision
> control, INTRL0/1 status/mask registers, UMAC command/MAC-address/
> MDIO-command registers, and TDMA/RDMA ring configuration, wired up
> to the NIC's realize()/reset() and qdev NIC properties
> (DEFINE_NIC_PROPERTIES) so the device gets a MAC address and peer
> netdev from the command line.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo:
> adapted to the current Property/class_init/Resettable APIs.
>
> While carrying this forward, make these changes to the original code:
>
>  - Access registers as a host-order uint32_t at their byte offset
>    instead of memcpy()ing an arbitrary number of bytes in and out of
>    the register block, which gives the wrong result on big-endian hosts
>    for anything that is not a uint32_t. The HFB filter array becomes a
>    uint32_t array too, so that every register in the block is one.
>  - Do not call qemu_macaddr_default_if_unset() when the guest
>    programs a MAC address: it is for realize() to pick a default when
>    the user gave none. Only update the NIC info string.
>  - Accept an access that ends exactly at the end of the register block.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>



>  static void bcm2838_genet_write(void *opaque, hwaddr offset, uint64_t value,
> -                                unsigned size) {
> -    qemu_log_mask(
> -        LOG_GUEST_ERROR,
> -        "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
> -        __func__, size, offset);
> +                                unsigned size)
> +{
> +    BCM2838GenetState *s = opaque;
> +    MACAddr *mac = &s->nic_conf.macaddr;
> +    NetClientState *ncs = qemu_get_queue(s->nic);
> +
> +    trace_bcm2838_genet_write(size, offset, value);
> +
> +    if (offset + size <= sizeof(s->regs)) {

Better to flip this around to make the "bad offset/size" be an
early-return, so that we have
    if (out of range) {
       log guest error;
       return;
    }

    normal case code;

It saves a level of indent and I think is also easier to read.



> +/*
> + * Every field of BCM2838GenetRegs is a uint32_t and the MMIO ops only allow
> + * naturally aligned 4-byte accesses, so a register can be accessed as a
> + * host-order uint32_t at its byte offset; the memory API takes care of the
> + * guest/host byte order difference.
> + */
> +static inline uint32_t *bcm2838_genet_reg(BCM2838GenetState *s, hwaddr offset)
> +{
> +    QEMU_BUILD_BUG_ON(sizeof(BCM2838GenetRegs) % sizeof(uint32_t) != 0);

We should assert that offset is a multiple of 4 as well, I think.

> +
> +    return (uint32_t *)((uint8_t *)&s->regs + offset);
> +}

Other than those two minor things,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

