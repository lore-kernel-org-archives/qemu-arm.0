Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3918ECD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:50:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPl3l-0000S2-SP; Wed, 20 May 2026 13:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPl3i-0000RA-7S
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:50:18 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPl3f-0001mk-11
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:50:17 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ba4a1a0325so32721675ad.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779299412; x=1779904212; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kO+kPL+Mr9cV3hvxuG6WT/H5e2cjQXsc8xdWbBdTm5U=;
 b=MPoDULJ5co1yzcYzMlftSem125pP+yg+cE9J8B33c5rx/NhDSO1Fa7rbDS8zXdfaQn
 Wwp1K8tZvi8iVAYbJ1o9HRSRWlR7c2aIbj+Ud/l9FT/XL/bsVuSvGmZTMYUezut2BKsS
 zdoHBy/4E/L9Kry4dlpi6oL39DQbRndXrXpl9KzFPDNgtSgOGtgTC//hpxH5ul2jq4d1
 iE3hWx59BLA7RZQenXcAUdKp80dLPPhVRHsFtXqiqEwWCatSyhWZkMkKtUyqY5O+MiR6
 VBjP3UlaS6GELeWDKzpBBBhuryxShhtjk0u9XapZDbRuJaHxSNSmBhmIKoTKJZVsSkiw
 Labg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779299412; x=1779904212;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kO+kPL+Mr9cV3hvxuG6WT/H5e2cjQXsc8xdWbBdTm5U=;
 b=ojItWqrJLbRH0Yf6433Rap6D0vvkm2iqQym1KU9v7xJMEau/XwcvmGX6/OVBfDHZfy
 t6V5S4pLiC/8QPB1tjNDKtP25JTUWBIcqjp1hgtZLVtBa+b9M8mkI8nzyadWegxUJ0M/
 YUJBpLLcJRMqc3aoB7WmLq+jqhZdD9T5OrzMczpx27HK6b4n0rExdOZ/foVSMGANpARy
 EC9f755YTjYeSBxipAJPS5Uxt6BJ8W1FG5eMXPmTbhv/U8LNgxZjOLc80lNSJZSNJfzm
 14URF0xqXNSMGdjOYI7thEeJe2tlkg8Hxb1D/ts+knTkO89M6xFgTx2jXZhsH7xwqkBi
 CpyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8L38ThCaUyg+MNKeX08OOIMCiN2BUM1fL9izqFSsfWOq7CeMBJApJbAewik2q3dYB2mPVeMuIMdQ==@nongnu.org
X-Gm-Message-State: AOJu0YyOwrutUST4YUh4qtU/AqTBJVTvPKbHhG2/+8iOEB55J24DYXLf
 omCBD+rGx5QD/XgMxm/QqZxDVcRu/pD844gjDwUV5vRYIZrL4RQv/9qsnhlR+XXZNMM=
X-Gm-Gg: Acq92OEs413z7R8tix3WJnghpJusMlGEAaE0g/TowEyLZkuDgMnL+sFVFLFVLLDGqAM
 FqEGgegFHVR7QKfxA73PaXiHIBkuFavnSvM8IZWFciEvmExb/HwtwgAl8shv5Ov9Za1S0kBqkA0
 mGYawat1HkZQjZyOTutBz5vgtuvCB16NKWc/2/alJxwL2G5/trhtgh2VEJIaM5fn1bE8lWLQNyp
 DB51QAY8t/ABjHf9YWJ/9UbAli+U9jN8n2xV/hU/DlzYj2FIZTE0e2Kp1Qcp71QlmXrauS+uEiH
 xNLe4lTIp4EpMyWyn/PuGP6fjJtE9LPlDh/9ZKcXpou4D34gS1n6yTjgzfXxYVw3F+qfA+iSai/
 sBTzlP/sNTl4oDkTjBDffBnRD6pKRQd7lxHMCyTVa9uOEPxHroQ3iu5Ayy8RP590lErcTSSQQbm
 fW4hG7oQQv5C7qwsWNvXsSs5keHRSL617Ve6qNeu9Lj6PzHzsQlyd0NZuotg==
X-Received: by 2002:a17:903:1b4e:b0:2b0:c59f:3b58 with SMTP id
 d9443c01a7336-2bd7e7b58a8mr271332495ad.9.1779299412456; 
 Wed, 20 May 2026 10:50:12 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5cfe7270sm222602705ad.50.2026.05.20.10.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 10:50:12 -0700 (PDT)
Message-ID: <16e28558-04de-420b-aa7d-38333393c576@linaro.org>
Date: Wed, 20 May 2026 10:50:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/63] target/arm: Implement BFCVTN for SVE
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-31-richard.henderson@linaro.org>
 <CAFEAcA_9Gz1Nnb9-xbgjpySG0NkO9QaMudtUs=1Ef47gF15oTg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_9Gz1Nnb9-xbgjpySG0NkO9QaMudtUs=1Ef47gF15oTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 5/19/26 02:55, Peter Maydell wrote:
> So is the problem that we shouldn't be feeding in INT_MAX
> as a p->exp, or that the "round up" code should be
> checking that it isn't going to overflow with the exp++?
> Does the same thing apply to the "exp = INT32_MAX" in the
> exp_bias handling in parts_uncanon itself ?

Even worse, we should be supplying the exact maximum value because neither inexact nor 
overflow are signaled in FPConvertFP8 along the FPType_Infinity path.


r~

