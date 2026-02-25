Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7423FD45F9
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 22:02:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvMxD-0002GZ-DD; Wed, 25 Feb 2026 17:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMxB-0002Fo-Ow
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:01:57 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMx9-0007Ss-S3
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:01:57 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-82418b0178cso123748b3a.1
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 14:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772056914; x=1772661714; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q90MYK0j6Or+yqW4W61ZXArQ6MGz/bKSND9HLLDN7zc=;
 b=dVd1CtKtJWK4e0iaHoyRoSjDC9aUVpvwcd5O+c3xjdikxHKFO1vg0OY2PVqpv6T9U8
 xl+mJ/SbxZ/cB/dYq8bBoeQwJw6iZ5OhBPKsWj719u2brLA1D9/DOdTY4tjksLeTSOQK
 1gVoeE2QUqrbtfJYNDbElhhR6q/Tv2yqcJIDa0D8QKhkXSkYWjB503wHesL0Ddnv7ERx
 DXqerPkuKbRKz12QNhnw7J8Fysk78m7Pzavb4nSBLFPo5Ke99qIB9b3Gppz5sb01WIZd
 xUnkRrT5eVXVC3uBzsIadRfdRDF2R7npCf0vVWGh2s7jJty05BTXHIUw77DYAdSX64Q+
 dZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772056914; x=1772661714;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q90MYK0j6Or+yqW4W61ZXArQ6MGz/bKSND9HLLDN7zc=;
 b=MaVTDxawdKxO4TQieQdo302LJVwNZHrbjyTOFfvIzQ34vLSQGRcfAbWREt+O99hRez
 zjf/7guirXRnQFS+3XGWMoOCg52PDLizZmSVyk32k3/EUYijpkapOfI9QQKLuFR2HXup
 Id86F1MQ9W4DRuJaZqFi4eqnkTcosrAQW+WI1dNneD8TSfkUoXFyZ2ugFmhDBXmy865R
 X/94paJzu80yWqIqDQSX6c9FXUI+WYu4/yfZgGczEcNKoxoeK+04UXzSQs1XTj5XAv5Z
 k3szM/X+xIMnDLV6fnXYrR9lwCpnkX3tWsl0q9Z8r2gMBqw4ciJ3sOcOkc2oDxiBYSVZ
 h72Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEibEjpHmIu37qXoBwzjx7Miqyi2Rk2ODGI2n64ajV5wJ9Ir+5epLCoMCBbaRNh/gy+9rv+ViWsw==@nongnu.org
X-Gm-Message-State: AOJu0Yzs2d7JiIOCUz9tDjuwT977E3XLLpguPgzxpuVO5HpzSDLQ0WgC
 /RAktIZ82qxlUuvaKysENXcXgCM4wlLyq18pCvCYqFsDAzPYaJ8WUkMPGsMzct6v5cc=
X-Gm-Gg: ATEYQzzDqpKpQY+gHjgDRpO50oTu+wzIkHS2kDyFvAi+UyjnHUs7txcaWPYQYQJyHi1
 Ix9pb3hRp2w1Stx2CtuaYvEN/m36oriB4ueywBb0vls//83zr5SmcsZgaiMlWUHSY94Z6JSaeWc
 eomYxi57Td2uyGueY4beh6XeQdIg4j2an4JGCuw0T0ISwPyyyJ2DtVMnpRj4EaaK+Y2s56qpYKB
 nT/ak74VVLmieectKSf60EQueQ3vfaZ0/iHlCN/0t0D57XPBGCgcI4XQxfvNb0AcZMa8y7bjRoJ
 f6n45Fhr+SEPtCCFW5xQTs/eRJj4XurCFjjB67tbZitjjsBZUIRvNtG5FHXFsRvZSYEMuLsdRYo
 zyh/c8d/KYR1G/NFHkqKCKwCiUNioH9Ls6wonLx+OY5r/xJn981Nmm7KSWa5yAawGYNj7g54+rz
 kk8PnkP1yjfHDZ26OH3bycLasHL+qOHRqUqxF8S6UxsirauXsu6rooM0BlOKljdARDoCgG
X-Received: by 2002:a05:6a00:94ed:b0:827:27f7:b462 with SMTP id
 d2e1a72fcca58-8273bd23b88mr37526b3a.27.1772056913945; 
 Wed, 25 Feb 2026 14:01:53 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a029b13sm241337b3a.50.2026.02.25.14.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 14:01:53 -0800 (PST)
Message-ID: <34dab95b-e7e6-434f-9f40-5637602e5d16@linaro.org>
Date: Wed, 25 Feb 2026 14:01:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 25/31] hw/arm/smmuv3: Implement SMMU_S_INIT register
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101836.2996599-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101836.2996599-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42c.google.com
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

On 2/21/26 2:18 AM, Tao Tang wrote:
> Implement read/write handlers for the SMMU_S_INIT secure-only register.
> 
> Writing INV_ALL provides a mechanism for software to perform a global
> invalidation of ALL caches within the SMMU, including IOTLBs and
> configuration caches across all security states.
> 
> The MMIO dispatcher decodes the target register bank from the high bits
> of the offset and then switches on the 4KB page-local offset
> (offset & 0xfff), since registers that share the same function across
> banks use the same relative layout. S_INIT is a secure-only register and
> its A_S_INIT constant is currently defined as an absolute secure-window
> offset (0x803c), so it has no NS twin to reuse as a shared low-12-bit
> macro. As a one-off special case, the handler matches it via
> (A_S_INIT & 0xfff) to fit the relative-offset decode.
> 
> This feature is critical for secure hypervisors like Hafnium, which use
> it as a final step in their SMMU initialization sequence to ensure a
> clean cache state before enabling translations.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3.c     | 37 +++++++++++++++++++++++++++++++++++++
>   hw/arm/trace-events |  1 +
>   2 files changed, 38 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

