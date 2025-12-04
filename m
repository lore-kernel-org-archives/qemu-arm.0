Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA39D206AA
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 14:22:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRADW-0003w4-8B; Thu, 04 Dec 2025 09:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vRADU-0003si-Fv
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 09:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vRADS-0002Ck-LJ
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 09:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764858112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SD5W4SkFB1q6NVAsWelACBEt4onCHvYn7wbJOAJI2Q=;
 b=cafkWI4CWIltzbLapPr5FtCeMl/3AHK6+S8o/0JqQycMwU2nfi4dYtsBPr/d9Of7PcTAX1
 XRLXJaavCXso8yMDMBosnOdpTP8bFa2R4rvHoWe1cpl7kglwqYIy89Fyq346IEW63HPa6R
 ctxPKDvhRNmTBO67/oUWtBmqIOkYwXs=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-OVd1onpsNfij_G_Ax1p2Dg-1; Thu, 04 Dec 2025 09:21:50 -0500
X-MC-Unique: OVd1onpsNfij_G_Ax1p2Dg-1
X-Mimecast-MFC-AGG-ID: OVd1onpsNfij_G_Ax1p2Dg_1764858110
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-640d2ff4acdso1165258d50.3
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 06:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764858110; x=1765462910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SD5W4SkFB1q6NVAsWelACBEt4onCHvYn7wbJOAJI2Q=;
 b=Cvnp8VUivtMvk1QHvgUHmPLEWrdnlKntdeDlp4gRJPnIXmCa+xCiko+qMltIGf7+t3
 bismt7U5zSf5RlL7HT7pPrwQr4B/EtJn7JZoioxdhksNfbypMbPpSJ/iKh+9yYQHUBvO
 3C/SfigVHhrafpEZHt91eAUJBieYe3tJBCqL8bGcIh/vZ9GHzmpBFpWfKxa2Eou85lJX
 ca/DFKGEELYzgQwy/Tx9KLhMu4a+jaLjalaRUkOqeTfgMaJrEiasSXMWOrN8aMe0rB6X
 gPU7nB/4GnNq2k3XN0hqTsD1QquAGw/Ip8zutXrVmQci36+6sThHq3E+nrW4Fb2pMBjG
 EeUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwZVGKBn1hJZQcO8LVnncNeP65cpBwG+FuOnKtI0gQErmAPW/DXUfqCVK6YoX7VVy3JScyue7WJQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy4ITifXMux/i2s50Zp9JMkCWT4HSwlK91Yu2jLHNIJtP6PnzNX
 538h+nQCQhbvCnwEk5J7LFaSifRqTFILExKKYwKqYC/skA2hIXZhquq4xfH1VdhWbKlDNou75lI
 2PL/SFw+5HmW3XDbEr20namYogABQZ6zy7Ye2FQ6A25rWSq6cyKAM5w==
X-Gm-Gg: ASbGncuzKaWragY+zh7GzwXfsKmqKD4DIA1UTZT/OZhAkm/QXADVkIs9hXqGAohyb6F
 H5HqHSQaFVHkVDT2uugwPJ65bB7XFy7Ov+50fQ3/eX6jEO+g3K/KvGP9dj+xEDAf0WAxajaiOLb
 mCnKHxcppYUK5oolSKE+cV15EkzybdU/ORzjXJoxX1yvFshMK8kGcr0YLHffK71IfdJWB85gzc7
 5QK18TiEVWg/blnAd1lHDek2xURbK6TJBdP5/fxt2t8J64kppZka8AtNBcfqdCOl8tXk84vkPYZ
 tVNqraXYAK1BLW/RiN3aPeBXjbdWO8ZD0cBmfsUFbBUw/R+92s4mgOXkCf0ShRMLsUvKwB0PZ6h
 LmkXWwOG/8cM87nvvJhy6/Ium2dGOacPQTzp9V6M8PzwWWKAlyXz/jUy7Dg==
X-Received: by 2002:a05:690e:4010:b0:641:eeca:193a with SMTP id
 956f58d0204a3-64436f8c8f5mr4679687d50.3.1764858110247; 
 Thu, 04 Dec 2025 06:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTSNO6a89PgLBgZiM9M15aT6b/fUKMLUenYhfhJ4YSAT9/71RNh356zungi03JGJwBn1qlKQ==
X-Received: by 2002:a05:690e:4010:b0:641:eeca:193a with SMTP id
 956f58d0204a3-64436f8c8f5mr4679656d50.3.1764858109646; 
 Thu, 04 Dec 2025 06:21:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e?
 ([2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78c1b4adbefsm5886107b3.2.2025.12.04.06.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 06:21:49 -0800 (PST)
Message-ID: <83975c51-b49a-4300-af76-f2289c8bcdec@redhat.com>
Date: Thu, 4 Dec 2025 15:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 15/21] hw/arm/smmuv3: Determine register bank from MMIO
 offset
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20251012150701.4127034-1-tangtao1634@phytium.com.cn>
 <20251012151331.4130048-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251012151331.4130048-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L7ZUAic5DS6O8vHth84O0-d56hIpNLIusaFPUMIFrlo_1764858110
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/12/25 5:13 PM, Tao Tang wrote:
> Modify the main MMIO handlers (smmu_write_mmio, smmu_read_mmio)
> to determine the security state of the target register based on its
> memory-mapped offset.
>
> By checking if the offset is within the secure register space (>=
> SMMU_SECURE_REG_START), the handlers can deduce the register's
> SEC_SID (reg_sec_sid). This SID is then passed down to the register
> access helper functions (smmu_writel, smmu_readl, etc.).
>
> Inside these helpers, the switch statement now operates on a masked,
> relative offset:
>
>     uint32_t reg_offset = offset & 0xfff;
>     switch (reg_offset) {
>         ...
>     }
>
> This design leverages a key feature of the SMMU specification: registers
> with the same function across different security states
> (Non-secure, Realm, Root) share the same relative offset. This avoids
> significant code duplication. The reg_sec_sid passed from the MMIO
> handler determines which security bank to operate on, while the masked
> offset identifies the specific register within that bank.
>
> It is important to distinguish between the security state of the
> register itself and the security state of the access. A
> higher-privilege security state is permitted to access registers
> belonging to a lower-privilege state, but the reverse is not allowed.
> This patch lays the groundwork for enforcing such rules.
>
> For future compatibility with Realm and Root states, the logic in the
> else block corresponding to the secure offset check:
>
> if (offset >= SMMU_SECURE_REG_START) {
>     reg_sec_sid = SMMU_SEC_SID_S;
> } else {
>     /* Future Realm/Root handling */
> }
>
> will need to be expanded. This will be necessary to differentiate
> between the Root Control Page and Realm Register Pages, especially since
> the Root Control Page is IMPLEMENTATION DEFINED.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 61 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f161dd3eff..100caeeb35 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1675,12 +1675,13 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>  }
>  
>  static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
> -                               uint64_t data, MemTxAttrs attrs)
> +                                uint64_t data, MemTxAttrs attrs,
> +                                SMMUSecSID reg_sec_sid)
>  {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
> +    uint32_t reg_offset = offset & 0xfff;
>  
> -    switch (offset) {
> +    switch (reg_offset) {
>      case A_GERROR_IRQ_CFG0:
>          if (!smmu_gerror_irq_cfg_writable(s, reg_sec_sid)) {
>              /* SMMU_(*_)_IRQ_CTRL.GERROR_IRQEN == 1: IGNORED this write */
> @@ -1745,12 +1746,13 @@ static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>  }
>  
>  static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
> -                               uint64_t data, MemTxAttrs attrs)
> +                               uint64_t data, MemTxAttrs attrs,
> +                               SMMUSecSID reg_sec_sid)
>  {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
> +    uint32_t reg_offset = offset & 0xfff;
>  
> -    switch (offset) {
> +    switch (reg_offset) {
>      case A_CR0:
>          bank->cr[0] = data;
>          bank->cr0ack = data & ~SMMU_CR0_RESERVED;
> @@ -1985,12 +1987,33 @@ static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
>      /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>      offset &= ~0x10000;
>  
> +    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
> +    /*
> +     * The security state of the access (MemTxAttrs attrs) may differ from the
> +     * security state to which the register belongs. Future support will include
> +     * Realm and Root security states.
> +     *
> +     * The SMMU architecture specifies that Realm, Root, and Non-secure
> +     * registers share the same offset layout within the last 4 hexadecimal
> +     * digits (16 bits) of the address. Only Secure state registers are
> +     * mapped to a higher address space, starting from
> +     * SMMU_SECURE_REG_START (0x8000).
> +     *
> +     * Therefore, we can directly use the offset to distinguish Secure
> +     * registers. When Realm and Root support is needed in the future, we
> +     * only need to enhance the 'else' block of the corresponding 'if'
> +     * statement to handle those specific security states.
I wouldn't add that many references to the Realm and Root support in the
very code. Maybe move that in the commit desc.
> +     */
> +    if (offset >= SMMU_SECURE_REG_START) {
> +        reg_sec_sid = SMMU_SEC_SID_S;
> +    }
> +
>      switch (size) {
>      case 8:
> -        r = smmu_writell(s, offset, data, attrs);
> +        r = smmu_writell(s, offset, data, attrs, reg_sec_sid);
>          break;
>      case 4:
> -        r = smmu_writel(s, offset, data, attrs);
> +        r = smmu_writel(s, offset, data, attrs, reg_sec_sid);
>          break;
>      default:
>          r = MEMTX_ERROR;
> @@ -2002,12 +2025,13 @@ static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
>  }
>  
>  static MemTxResult smmu_readll(SMMUv3State *s, hwaddr offset,
> -                               uint64_t *data, MemTxAttrs attrs)
> +                               uint64_t *data, MemTxAttrs attrs,
> +                               SMMUSecSID reg_sec_sid)
>  {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
> +    uint32_t reg_offset = offset & 0xfff;
>  
> -    switch (offset) {
> +    switch (reg_offset) {
>      case A_GERROR_IRQ_CFG0:
>          /* SMMU_(*_)GERROR_IRQ_CFG0 BOTH check SMMU_IDR0.MSI */
>          if (!smmu_msi_supported(s, reg_sec_sid)) {
> @@ -2036,12 +2060,13 @@ static MemTxResult smmu_readll(SMMUv3State *s, hwaddr offset,
>  }
>  
>  static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
> -                              uint64_t *data, MemTxAttrs attrs)
> +                              uint64_t *data, MemTxAttrs attrs,
> +                              SMMUSecSID reg_sec_sid)
>  {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
> +    uint32_t reg_offset = offset & 0xfff;
>  
> -    switch (offset) {
> +    switch (reg_offset) {
>      case A_IDREGS ... A_IDREGS + 0x2f:
>          *data = smmuv3_idreg(offset - A_IDREGS);
>          return MEMTX_OK;
> @@ -2165,13 +2190,17 @@ static MemTxResult smmu_read_mmio(void *opaque, hwaddr offset, uint64_t *data,
>  
>      /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>      offset &= ~0x10000;
> +    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
declaration should be at the beginning of the function, ie before the
offset setting
> +    if (offset >= SMMU_SECURE_REG_START) {
> +        reg_sec_sid = SMMU_SEC_SID_S;
> +    }
>  
>      switch (size) {
>      case 8:
> -        r = smmu_readll(s, offset, data, attrs);
> +        r = smmu_readll(s, offset, data, attrs, reg_sec_sid);
>          break;
>      case 4:
> -        r = smmu_readl(s, offset, data, attrs);
> +        r = smmu_readl(s, offset, data, attrs, reg_sec_sid);
>          break;
>      default:
>          r = MEMTX_ERROR;
Thanks

Eric


