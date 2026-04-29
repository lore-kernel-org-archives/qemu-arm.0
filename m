Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784FEFF8875
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:45:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9uV-00012T-BW; Wed, 29 Apr 2026 14:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9uR-00011D-1W
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:45:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9uP-0002Px-HJ
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:45:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488ba840146so565885e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488315; x=1778093115; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=namiZWPt5U8QIOnR7As6vSDvJV25Jz465JkjNmRfknE=;
 b=Lg7pZVf2N5bkOBcPQTokxByHDaN8qYZZyegtIFiQitXqNlxrgfdja+JCN8SXEDMoE0
 430JhvffJMzfibH04rE/XNNEZ1qWET0qg01OgrTqWYQIKMW+/6h3kI4yroWVp5gmf17x
 VvEMuCTsEwPnYiIIilxe9XE+AWGcCYthdUz5ep1/y2gD/ZqzLwfBZO3iyIOFW2aHoNqL
 fW3Hqnx5gat4Qd+dRvEvOw2IWWUWfevgcXE5TINadRvZZqVNeME47bF88MSkeTvIjOqv
 BFAHAPzJnt1WFFim6lOSuitnoS4BmC2b9/y0k6TjU7L8hpslrmQmMrct7E0q6fE1YYp3
 q4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488315; x=1778093115;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=namiZWPt5U8QIOnR7As6vSDvJV25Jz465JkjNmRfknE=;
 b=ot+4AZxlLeTTv4435eIAkQQAnczslaUr7C5a+hoAdPzR8uwKjhbWMVwWUgkKxCNJEA
 3y63rWPNDchqOxwdvahT7CgDwH2/A6XwUsvPD3psZq/ohf5dshxGsxq9IYD3BbHWIg6U
 5Vpn6r5Ro+z6rhQMgFTleoAF5opyTAJRnLYNSMnqDR7Xs8nRbaVMfPJ8xuzGacOvbb79
 /293yXcNG4+LkGFSwMmD4cKgQDkKdSPWhlIixyuF2JGfQYxhrXJwobdvQZFylaDrPGnU
 Jq6IgwmCzcknMaCSvUigi+jUPwl9qfELF25uRvBt965njPsPanQsUvJfQ9rMYYOV2uFF
 b9fQ==
X-Gm-Message-State: AOJu0YwpvBN2ulz0hY0uxRze/6MzYVZuHDvGqLUYUKGeZMfaPWOS1ACz
 zWzQQT7IG/vaj++jrVQY5O2VGfVX0l4EwH8CCxcG96sGONoO5BNfLbh85sQAMaPtsiI=
X-Gm-Gg: AeBDietjmd+R+KVuVoyLlwOEiAmpmRqiyJK4oYBcQTZaLbmMA1fnGalqgknow+U1my7
 HpdS+JT7r93lH9GSBacgCa52+q5eSGHeyaowy0c5AtnXylM4JeIthcAoF+xTVNPzDiQh3RzZUOj
 eaIdYYsNohyGKBVak+Kqu5XM9gsM5YC6BpvlC7ukHTeaOG6zF5oYG8RkuDU/kEbaeTK3mocEgCU
 G3hB6LXryDloSVCrqmNOAYDZ66CVafPFwlIeUMKdd0ZMIW09KgG+hzb8ILz9v80YRKYveGcqxZ5
 7dkCknFcoGzW3SPklUzq2ejvDsFxeB3SHVPkSTsTZu+lJN12Emd2eHBK6ivYAc3RmQnRwPKQ50d
 CpfaoQBLktj6UxGICNwX67fb6vtHOezEtBaX2RYpnFz0LjnE3XzIa2xxpf2QFuF92ZObGgHlBbZ
 M1drs+ELdYDnXBGgTatbSsVlrN8WtKaBxdzle3DMYht5FUftXKS2jgRxMoi4QgtWPVdHoFbTY9+
 OgC
X-Received: by 2002:a05:600c:4341:b0:48a:53ea:1408 with SMTP id
 5b1f17b1804b1-48a77afcf0amr70770555e9.8.1777488315030; 
 Wed, 29 Apr 2026 11:45:15 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822be902sm10618165e9.6.2026.04.29.11.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:45:14 -0700 (PDT)
Message-ID: <bc9e5460-3c3e-434c-842b-9d05447b5125@linaro.org>
Date: Wed, 29 Apr 2026 20:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/84] fpu: Return struct from float16_unpack_canonical
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-39-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-39-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 94 +++++++++++++++++--------------------------------
>   1 file changed, 32 insertions(+), 62 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

