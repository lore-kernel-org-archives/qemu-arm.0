Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E6BE6ADF9
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 22:35:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXoUa-0005GM-Om; Mon, 22 Dec 2025 17:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXoUK-00055b-IU
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 17:34:53 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXoUI-0005HX-Ut
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 17:34:48 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a0d5c365ceso56462545ad.3
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 14:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766442885; x=1767047685; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7RTF1j64IBY28hYosUDSLzGZDz5uyiAuxQNKN747RkI=;
 b=qFTMV5zvoW8pVRCTQP+nnWJePsRGPQxVJvgtDtRUom79ebGWDTDyaOTAmAIXf94Snq
 o81kH9zFQZa5BKLFIRvVtJlYHhqXTwL/ycOQJwvHRh0/7TZXqF1pJ4yEklD66t8bkSj/
 vwAkRHNYWRuY21c1eCZKA9S4asYaElYR00UR79fNM52lewUHa+oYTwSvporlCyarCSzA
 a+xvcAHvEeTKBZkVIvNk4HX9/noRmrI2AjhHsRxEBpEdjOjQZL9+hKU4DhwHtsWi5MqQ
 FFPFzEmoFfRyYD1XzkPV08Oifg+j/3FrdpLT3m/L1eH0GTCFFJjACyYrFBly9NxoiTB7
 V0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766442885; x=1767047685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7RTF1j64IBY28hYosUDSLzGZDz5uyiAuxQNKN747RkI=;
 b=vn8RHc4A6pbeZnsocN8OjZFKeNqik5AK7CmeQ/f5uK87FmXfWwW2UQPn7OvIBn5c/r
 DaQiliFsdFXy3mZq0snuso40WHBEyCEljS1LNdwbcDZBm21ekVW/98ydur/S/wBdO/jC
 x37E7f0yOx8pM9kg1j2CWyhg716VHsVa7NsyttcWwxuiiklsXYXxodjEZC2O8xm4TRbZ
 F99SJWuY1OC3+ldbvudcBvLCQG6Kpzc1OUsmyfs3beXzLL7bmA/uDt4vlQtGbTI715Iq
 Uj3mj7QwigWJC6yYcH/QXzdYRHYIGvmS6tlXv3xVM+2eh5iOJfcnGdDLC83llXk+2i9a
 w9AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsVO1VoDIp473aCsisThhCkg8SIifl8FmH3WhOrvXXkSAaQmU8Fetq91f96RAzsRYZEQHH5+cDvw==@nongnu.org
X-Gm-Message-State: AOJu0Ywxu/6ERiTCkXE2j8VG0A6+yuUU0WJA+C/ivp7tgIVDLqTq9qGE
 iLHB6wl7iR4M4UsiRv9ZCseN4RTCewIdWLBTma8o/tqVibanIaX6Wdy1B+vmwoLnpZE=
X-Gm-Gg: AY/fxX5VzGOxcNxX5F0QQsC2W0YOWuQpdZA6LLX1A4cxxCAWUfowheI14dNlcb078o8
 tia4Yyfu+TBDZv2ZTYrXSiqROmIw/rfScLOLpPeZWQkeIIYDmPCqnBq13c1adkFuO7GOu6nXjBX
 ZPjZBV9xL06vymXcwp61rG/PlluhIxU1fFRBR5WRzST8kn64efDNgi7Yd01dRM21ZuP3Z/ZbIbm
 PQXDezSMiQHRKl679Njynrk+zKhTtS3A5cH4IzA8UQg6XRJ3DNYqoc+3B3AtihNrV0AQrG+sst7
 ay2sutMDiug6Poi72L2u2UgEkzwlzIXyTH+QYXJoFCfT2SuM8sUVXzaWxKevXTxqWJeESjAuX9I
 a9oku5ni7nZSot5ex8bS4gD1d8WQbeX3bmnsll8hELwhtDIzdeg1aWHskCDWCKr/UJABRYlpOGq
 X67WK7jugl9TaA+mIaxfdKk/oAThv90lwsPAVP+wTNtYWew+MURuRVqHWm5uSfWlM7Xw==
X-Google-Smtp-Source: AGHT+IE0SCb+IBW8JWS0T7FeTw960usDG+R8f6idCjwQmV6vuuxQcQUJJnR1i3j3NMuRDVPkqqt04A==
X-Received: by 2002:a17:903:2290:b0:2a1:3cd9:a739 with SMTP id
 d9443c01a7336-2a2f2830ba1mr123582265ad.43.1766442885311; 
 Mon, 22 Dec 2025 14:34:45 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d5d86esm106215745ad.74.2025.12.22.14.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 14:34:45 -0800 (PST)
Message-ID: <97e673ca-fdbe-418f-899f-43435189f576@linaro.org>
Date: Mon, 22 Dec 2025 14:34:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v7 4/7] hw/arm/smmuv3-common: Add NSCFG bit definition for CD
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251222124517.3948679-1-tangtao1634@phytium.com.cn>
 <20251222124517.3948679-5-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251222124517.3948679-5-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

On 12/22/25 4:45 AM, Tao Tang wrote:
> Add NSCFG bit definition for CD structure. This allows proper
> configuration of non-secure access settings in CD.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   include/hw/arm/smmuv3-common.h | 5 +++++
>   1 file changed, 5 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


