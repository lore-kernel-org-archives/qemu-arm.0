Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74C3CDE001
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:42:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPjd-0002Xo-I6; Wed, 24 Jun 2026 11:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPjd-0002XY-11
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:41:53 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPjb-0007SB-JP
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:41:52 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-8456005a6c4so839915b3a.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782315710; x=1782920510; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/0/noeunPNKExcuuv73UsPWuQhRxVACnWNF4xhGWwYc=;
 b=XHXfHkGBUbmnI0nCaPypNgDcttu400wvJRA9pi13TE/6EVYBqkrLLkxkp1y+jhYVOi
 vh6Xw1tmgeQkl4c8eUZIKIBnytkd6/XwLIHt7+eCxa+am7goidnga91/A7M4YR4/tyx+
 wH5OnKuG7rrSbAueZ9Z28dNIWqRlpM5YpzXTBFnh/RmnuVB0wMFJ+lMfU/N3foZUh9Zo
 8R0X0vSLoo9LUa92fvrZKs/wG+EGkcOhqH2MRCR0cm3UFZi+0tYQS6M4Slg0SVqTOO4n
 cnecEa+Xui9/EB0wT154+hfBk7MVOwrkzxAfyiitvYEgQrDHmqU/3SCTrI4TvSx8NGlz
 iRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315710; x=1782920510;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/0/noeunPNKExcuuv73UsPWuQhRxVACnWNF4xhGWwYc=;
 b=J+sjsuVSivRkLGqeKBw5HdNzBfn+LC4mxsO4YLkvHlAl3eheZsrtl4gGftw0+tNpWo
 N0AsZY6r3DievJU5xa5Aj0gfvEA+zDoWQpptHLwxifpScSnYO5pdYocD9kxhkr/n6DVK
 qplshPLE4bfBPGr6fMIG1w4iILdgrmhrUGN54wYpSDIR+Iq8cAPDVXVG44X5mGNbKxJ7
 +fpX2MJk+MDN15vPoEFxd+ocOEQI/CK1J86IohfWBLCX3vBIJfVfBZCXx31lAWaS3cY4
 05C+6vIt8M8akAQjEw60CuzjV95AS53JEsxYFv0VdLh6bWQYWxPkw8j44HaK6vJsPHeD
 svfQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1nORCkUa5LLPYgIEb3dDHqZWXjozh+/8vzJzj9T1sOD3LHIjeBlbN2i3fTKifjS4iNuVrGtZYhg==@nongnu.org
X-Gm-Message-State: AOJu0YzhLIY3/lWgySD6uPQaMtJpoXmhI3AVZxKfUq5jDFQW3pAQ6/N8
 UUm0gMPEfn/GSs5WhYTvFaRvqheEqTL7wAktjt2f7wlFgczKiJ6XcDkY5Wmjota1dOY=
X-Gm-Gg: AfdE7ck3cjHk+unoeQZVTTdkvYE1+IpI/UHBSu0rpcwAXUwXkLio6Tzj5KXdc9i+6rb
 Q6XqmdoOfe9NWBOZI6P7AR20T9wqOoK5TcXPc1O31l9LxgBgO3GcUu4zI5vBNuEzn27Bo+0zL4K
 nSR+rwx9xBS3Yf1/GdLb3IwaodssespCF97hyG9GBPB8p3Ex17UoHi4aBT7RhvXgplgTU+yGx3Y
 3p+ybhPct1frv2SXP3Grxq8nwsNxuTWgz8XMCMUbfnEAjmAQlZCX1azqzfQcXWJnwBYxfBhFYku
 wvR3sSXs86jQZKrbJD9bU4H5mu3Z1FCzMi6Acg4ZjmZJSIU2tnEnhN2w6LfMSjg+2kIJhEvyoae
 ya4JWEtmpfT/i1s5FRnCfIznnoo6OHQ32JlGHbHE2gbYVHp71lOd8hT1rz8K1gihO4Hk3ora84B
 85yQ/cWVb9goa+psurRTxcouw494/UG2bxqrbuIJWhksbLfFdwmL1HHVOkng==
X-Received: by 2002:a05:6a00:2e26:b0:845:2ff5:b66d with SMTP id
 d2e1a72fcca58-845a2c58858mr5156153b3a.35.1782315709753; 
 Wed, 24 Jun 2026 08:41:49 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a40f54bfsm2411291b3a.46.2026.06.24.08.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:41:49 -0700 (PDT)
Message-ID: <48f20592-0df4-49e3-a2c5-2934d2f27d52@linaro.org>
Date: Wed, 24 Jun 2026 08:41:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] target/arm: gate check on scr_el3 behind
 ARM_FEATURE_EL3 check
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260624124527.1018912-1-alex.bennee@linaro.org>
 <20260624124527.1018912-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260624124527.1018912-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 6/24/26 05:45, Alex Bennée wrote:
> We shouldn't be reading SCR_EL3 unless ARM_FEATURE_EL3 is enabled, if
> it is then we check SCR_ECVEN allows tweaking the offset.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - don't bail early - if there is no EL3 we still honour CNTHCTL_EL2
> ---
>   target/arm/helper.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

