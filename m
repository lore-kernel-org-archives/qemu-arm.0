Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7062CCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 23:31:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8oUR-00047N-9r; Tue, 14 Oct 2025 19:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v8oUO-00046f-0r
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 19:31:33 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v8oUK-0007gR-Lh
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 19:31:31 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2897522a1dfso55128545ad.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 16:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760484684; x=1761089484; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HnKUD3n9vw1G9Q/rxN/vupm8RY+B/OmYQan9xNkHD0M=;
 b=FIE7FYhxDZ0nFt9S6uy8Sliqn7dHjIAUi88BlkiKOfY9XM606t/qwbooUHvlGTrbEg
 pMuLw0YFp1oirQ4i7vgTLZ0VNC9UZw5t/UxoVqyURfuVdIx5jf8Km6VqHT+e2U4WxXzP
 cWYYJUJXEKkHV/62HoHnqRlOBcUfoyePiNLzAi/fxaBGDDrpmjzTfXvoT0lY/UwxpoFG
 AkCAs23NElI7LvWspt/av4pyEB9MWAqbpynPfOyhYAcaiPRCIk+h9DcyDUB/uo/8B8qI
 HQyQRMjP7CJPA2RMzE/n6nSz9gJsYz5Nb3V4+EXWdQkKMnSUREBFBwekkegZvxlRYxao
 uzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760484684; x=1761089484;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HnKUD3n9vw1G9Q/rxN/vupm8RY+B/OmYQan9xNkHD0M=;
 b=UZUAQPsJTCy3+P5fmRcsSbo2H2JrycT8S0jltxfWvv8UthqEiiqlFkc/5OrFDuFheG
 IP1Z145asYhu9QX9oWUflPu/NxGXXL3qfnD8eOByhAPd5Pz4Ze0UXOBwZR38rb1El5s9
 uVVVvIBe49Z6oSC9uTRdp796xEvF+8y+NisiIvz1H8du+61YA9XGnpXjyVg9xK/GfflV
 T2sfjovDoyXXnpRmZb0qQQ+avgpED7va0kmFq1Hz28oGqgb6UisrumXP7KLMQzG8ETVl
 lNUP5DpjdJ5uR/Wow3tHzNvHDHF7Zgsp6f2x3lINXFjMu2TgQ4j5YTpUS5q9CCz7zs3A
 AQTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0rKylc21ecKG1Xfi1WUWvjIaatt7TOw8m7x43Vu/NtYy0684Vy7oEWax4HW7v5OJlyb6358vPag==@nongnu.org
X-Gm-Message-State: AOJu0YwejlJohLQBcCHkEnj2/No0BvncFJdNQWcvUkQQAf62DlD+FYM2
 jg/MfSJIzgCZGHCEUgr2DfXpxXf8IkF3gl0dbglF3C7zUBpvcaN8F3QGH5NSzJhU2Lo=
X-Gm-Gg: ASbGnct9SxJFF9/4m6IXNBxy6BWbxAul1x6yqjITp/i1wgZq5BRYQDCdIJzewGlqeNx
 8U06fQPi0DsKaGs9ZtAJptourvoexn3sB4jBCxPShWwubi4Yl8l1zdbQPWfq8OQ2vNkhxEDTQxe
 M45xtXUDqCf4pHtMw9qTkA836Ud9VvGhra5pv1tUe6/e+ZICuPRHgfIVuAsICUk+XiC/7Ip8EaN
 r5Dd6Td4DTdQ9UHcDh7zRhcd0BnnZj7eWJclWAHAQSdjE7BTL5uFQuugDccJrtrto4t7Rscbx54
 XWUW3FkR8BrVtvMOCTI8PhIcvyIbuXEprvmtRA8UX+x18pc3UHGrzuxy2uZcmRtU9GCmA1y45Iw
 y2glJcVg3lr1DLQe26QXhoTYWeblb4KDdvTEd7cykd0Dkqx7JevkYgBYBrA==
X-Google-Smtp-Source: AGHT+IENRw56I5AMXjWONVXTWuySOaeUvIhrmlbiya6MNslenHitZ9NNpEA9YbPZim14L1WZIrTc5A==
X-Received: by 2002:a17:903:3c68:b0:246:80b1:8c87 with SMTP id
 d9443c01a7336-290272dfb4fmr324684095ad.43.1760484683769; 
 Tue, 14 Oct 2025 16:31:23 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f4ae6csm175937235ad.108.2025.10.14.16.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 16:31:23 -0700 (PDT)
Message-ID: <b6193e52-b0b9-4b89-8014-c0436a509920@linaro.org>
Date: Tue, 14 Oct 2025 16:31:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 15/21] hw/arm/smmuv3: Determine register bank from MMIO
 offset
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20251012150701.4127034-1-tangtao1634@phytium.com.cn>
 <20251012151331.4130048-1-tangtao1634@phytium.com.cn>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251012151331.4130048-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Tao,

On 10/12/25 8:13 AM, Tao Tang wrote:
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
>      uint32_t reg_offset = offset & 0xfff;
>      switch (reg_offset) {
>          ...
>      }
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
>      reg_sec_sid = SMMU_SEC_SID_S;
> } else {
>      /* Future Realm/Root handling */
> }
> 
> will need to be expanded. This will be necessary to differentiate
> between the Root Control Page and Realm Register Pages, especially since
> the Root Control Page is IMPLEMENTATION DEFINED.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3.c | 61 ++++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f161dd3eff..100caeeb35 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1675,12 +1675,13 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>   }
>   
>   static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
> -                               uint64_t data, MemTxAttrs attrs)
> +                                uint64_t data, MemTxAttrs attrs,
> +                                SMMUSecSID reg_sec_sid)
>   {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>       SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
> +    uint32_t reg_offset = offset & 0xfff;
>   
> -    switch (offset) {
> +    switch (reg_offset) {
>       case A_GERROR_IRQ_CFG0:
>           if (!smmu_gerror_irq_cfg_writable(s, reg_sec_sid)) {
>               /* SMMU_(*_)_IRQ_CTRL.GERROR_IRQEN == 1: IGNORED this write */
> @@ -1745,12 +1746,13 @@ static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>   }
>   
>   static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
> -                               uint64_t data, MemTxAttrs attrs)
> +                               uint64_t data, MemTxAttrs attrs,
> +                               SMMUSecSID reg_sec_sid)
>   {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>       SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
> +    uint32_t reg_offset = offset & 0xfff;
>   
> -    switch (offset) {
> +    switch (reg_offset) {
>       case A_CR0:
>           bank->cr[0] = data;
>           bank->cr0ack = data & ~SMMU_CR0_RESERVED;
> @@ -1985,12 +1987,33 @@ static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
>       /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>       offset &= ~0x10000;
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

This is not exact, as Root registers have their own subset and offsets. 
Thus, they will need a specific bank and adapted read/write functions to 
deal with that.

It's not a big deal, but better to edit the comment.

...

