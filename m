Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E83BFD45F1
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 21:32:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvMUv-0000i9-37; Wed, 25 Feb 2026 16:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMUt-0000gj-3Q
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 16:32:43 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMUr-00039G-JC
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 16:32:42 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-824a3509a12so97085b3a.2
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 13:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772055159; x=1772659959; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wbcxzDz+oEDrtE3wvXoStGeTJtAyY0GinIODRTtbASY=;
 b=x6cxw8aTwCutJJhAyUZDN/2opLBMRzNxkmyW3kOA+WAWakcOufLDriRli1Hb4hVHe4
 oq4JdiAYDKnhd6weqwHB1AeU/p64GVcMS6Y5eInzJeWoRDXAby3vAL96qOjF1TnEq+el
 zUtZPzvcUBjq1YHWfBZnKuxlIFdb5zLVTuluMaujIYZ4oQN6f3QPEH4O3BXErGjm/B6Z
 NhlpX3TV+964EWp7+KV0wpLUZCKMojCQAZRPvp4nI1zc/hvNi9snj6lM+YQgYqs7qgOv
 QjUKEOzNQuDkBYHwZHDkaQXWoaFr+affUDy939/SYXx+zslt67/CYCFqektwEOTvhYSY
 hBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772055159; x=1772659959;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wbcxzDz+oEDrtE3wvXoStGeTJtAyY0GinIODRTtbASY=;
 b=IGPQoubBXSbMAWXbpBuBArRKEVAQ3k+Xx+gGMp5gr5J+GPnFQDhgoMDBfSguF40QYA
 vjR5EQm8JeuBD1BDfhVw5jQ0eMGrhzuTpd0KMBqrj7z7rPIVCrZembTGfswY02AWObJ9
 /XETks21r/3GW+/zuhNWl00k3zQrhvwFcc7gr56W4BlaZA1glkgxm9VKIkg7PagM5xOZ
 4kFr2OtIFfLZg0hDnspj1WMWKVojTy4ZIKHpV2BkXPXAf9w7A/fmFrN2A0meYh3vOx2K
 49FI75bTBinx2aYg3LO+Uh05TVkrm54yH7AFLuEkBC8bogfExiOnfdP4h+a2kQWZnRBg
 eTEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9tY0hHcuavYtcRLUcKBcPUH1hlRQqh/en2uKr6PutSHOrZoMvWZ0AWQXnAkQ02Nurp9VRBuj3lQ==@nongnu.org
X-Gm-Message-State: AOJu0YxY9jb4icZTSJy00ylCxtifIO1JYTbePs33cVQ1SC2Wy2HCp5A+
 4QLbbxVq3Ww89PmOWQE86AvtUSi+FcFeEZwjFcrBCpp2WkswfVSuK4GVh/I2x/Umgjo=
X-Gm-Gg: ATEYQzx0ZnnbeRwn6sJMnEsxuC+Zwx03yObQhuiRXO8Xd/PXVXgjW0z6qjB2zqQWmFN
 djxUj1UDvWe9KDD5n+IT6EW+tf25URMkUBCJJ0lOgDkUCq6ducIcxwfFnIVj3NEv9KYvhZb6mDS
 Ly0SJ9dp/Ux33CaU3vZC52IPMIWLo1jkyfG25ZjGrtLN3g6LQbqF5PptgfFYweLIY/Pnwp4Mum8
 0NRsu/AGkgyhLJVXpPQFw3BM1Dkb/AnsznE8C7xhnPxJ7lRuR46Lzq7mbb3hPM68p2CtBOiQhM8
 I3gn0kT1VEaoFnyHoImnMUtH1zQclLvXqavWwQm84NQv7X8MvHBlXfYtbM+plzHzge6ZSaDeT6D
 8RWiLIkxza+eOB5xPx+szQtPE5poMSxhvOlDeqBRedw5V7dDPdIzE9JMfnok4IfbnN57SaVriYW
 Sp8mNmHJsa+2/KrSRof5XdZA3aMxbsBJMsWfvEFZLR2KvHBDJF8lREJhib0svTdkSmOOy7
X-Received: by 2002:a05:6a00:4f90:b0:81f:3c34:fa83 with SMTP id
 d2e1a72fcca58-826daaa6eb8mr17475558b3a.57.1772055159247; 
 Wed, 25 Feb 2026 13:32:39 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739d87e78sm217480b3a.17.2026.02.25.13.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 13:32:38 -0800 (PST)
Message-ID: <7ab216f3-a453-425e-8cc9-db728cd0c0cb@linaro.org>
Date: Wed, 25 Feb 2026 13:32:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 16/31] hw/arm/smmuv3: Plumb SEC_SID through IOMMU
 notifier path
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
 <20260221101706.2994213-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101706.2994213-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
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

On 2/21/26 2:17 AM, Tao Tang wrote:
> Extend IOMMU notifier functions to be SEC_SID-aware, ensuring that
> invalidation notifications are dispatched to the correct security-aware
> address space.
> 
> This ensures IOMMU notifier events (e.g., to VFIO) are correctly routed
> to the appropriate security world's address space, maintaining isolation
> between secure and non-secure DMA operations.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

