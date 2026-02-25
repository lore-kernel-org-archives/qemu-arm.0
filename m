Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747DEFD45F8
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 22:00:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvMvr-0001KX-TM; Wed, 25 Feb 2026 17:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMvq-0001KC-68
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:00:34 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMvo-0007Md-1X
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:00:33 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-354c67da885so32986a91.3
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 14:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772056830; x=1772661630; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R5B8ceiYaLI28ldbsGCzPzRGI2FQe3b0udAblwV+v9k=;
 b=O4iDE5qXrhRAVDv1MGNiyd0l//dBYMz5jHAftdxA/GfhOPAcGWf/bi8Xx06nFII24+
 UDhzjNVbN8Dq1dMF8EcAFZJ5fLSiysAlhdD9LjqQRwHkb9c6IFXZNGUYzFhbtTySOhrF
 WD+07IRe0IANgorqmXmReyBoJ0AdXF/epGVaRiWscEpRR1qsGDdvOv/HMCpGeobSVQJm
 pux4TDH8YernAerDZH6/WRfdSupdrNi8wjXSqOAJn9bIo9RDV75L6SEfVUYk0Zp+AS28
 Hsu1S6x4KJBm++sW4bcnKTol8G9sGn8j3qjwjtKc7OkU80P2Za8MvpbPJomKnNKU65VJ
 19xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772056830; x=1772661630;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5B8ceiYaLI28ldbsGCzPzRGI2FQe3b0udAblwV+v9k=;
 b=VjXMJc3DWgNxlqDF3mkru2Y/JkWrEDG0wLcZNw5bzu3ngKuMpXD0vl2zEo3ETUFECI
 Ors307x+82ZgGppafbEYZT/6DNyJxC4Uh7JIlCYAK11urJlU48OSvIk1K00yJfDrkl2A
 zOigK9+WnwNQXBfbg0WQ/9ufYDlahLWmB2lbpxonfumlepbJDp0RHoFShCBb8/e7B0H+
 KgAtziyZH+n8O2vGc/tbZEdtAHyACwODAvLg1TYPzqGY3PbRQPMq1FVgoRNvjqaSflLF
 Y0suyACEf6Mc4QVJiZqFftW2lRF42UDhC4ypaUygVTotTx0lZw+HNfUQUXk0l3nNF5Ts
 RNOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyETiXONBjA7Nf3+0+2PsYuf8Aoc7CVmCSeOwoWxjT/1VsSYewduHlJEI0tRZ0zLB0i3YvCEjqUw==@nongnu.org
X-Gm-Message-State: AOJu0YwpyXEWRVqaXRWIvO4YmAb4Fod3VsZXnj3vfCcRWfmF/tKhXKte
 K9nNXT/GLrnFqThH8/VcNwheSyxOTiMsDjIYV/djcsfCu0W9S6oZileL2EpE7rpvjv4=
X-Gm-Gg: ATEYQzy8w6QCnVTOxYYcSWhBqo3QSeVrOIGTKwi+tIhCzHdVq++C4SeIcKS4ni6TcgK
 uKY3Rof2UdKy1RlSg9YWPv/A38YhdKDCHYzW605C7U15E1stfJp+dLP3oq1CqquM8ZyvYodcTqA
 UA4p0YwId2noGl+Cb/+jcbJf5CxQSSyNL9CLlnpULsPnzvheR5WKndGhrNrujTJY662FQ36YvsK
 H/8g4yoynyE/+HvQsopgw0dPhbUSTmjmFnpMDlRim+ujWnu+cofjCP3HMtHOHP6VtEBkTXA+riV
 7z4m2DKF8gV12NRMEN5poe4Y2Qau3Y+MKjrHWLIrgGWraf/gskFAmxC1mLs1jnvlA7R3O9UbVGV
 8j92oSAeMcyHUnzFpISMtE40ZxWwBsRuydw4ZXsq4TrL0x4SFPVjKk6idQ755bI/MksqxZ3EWCt
 ud94TBIhQlI6gEGvB9UsXQ9waiuForUwpsCrYgt8xVDgnAdey81LO9yPlEw9dzQrIwf1TJ
X-Received: by 2002:a17:90b:4d86:b0:356:2c7b:c013 with SMTP id
 98e67ed59e1d1-35928bff336mr1343945a91.29.1772056829569; 
 Wed, 25 Feb 2026 14:00:29 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359034bbfd4sm3743960a91.10.2026.02.25.14.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 14:00:29 -0800 (PST)
Message-ID: <72e11fe8-9c07-47c9-ab1c-b40e26a6379d@linaro.org>
Date: Wed, 25 Feb 2026 14:00:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 24/31] hw/arm/smmuv3: Determine register bank from MMIO
 offset
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
 <20260221101830.2996354-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101830.2996354-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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
> with the same function across different 3 security states
> (Non-secure, Secure, Realm) share the same relative offset. This avoids
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
> For future compatibility with Realm states, the logic in the
> else block corresponding to the secure offset check:
> 
>      if (offset >= SMMU_SECURE_REG_START) {
>          reg_sec_sid = SMMU_SEC_SID_S;
>      } else {
>          /* Future Realm handling */
>      }
> 
> will need to be expanded.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3.c | 57 +++++++++++++++++++++++++++++++++----------------
>   1 file changed, 39 insertions(+), 18 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

