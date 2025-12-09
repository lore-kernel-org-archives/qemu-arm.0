Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79892D3B7ED
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 07:04:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSrlq-0003w9-Va; Tue, 09 Dec 2025 02:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSrlq-0003vz-Do
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 02:04:26 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSrln-00085N-Mc
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 02:04:26 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so45226665e9.1
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 23:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765263858; x=1765868658; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NlEcoy5+5oc6M380clZhLFLgHuuIPuJq9Y784u5sO88=;
 b=WHbuZ6oW9Eq5DXadkMrsTfCV4obFlBgdkxmCf8uQ8iIVMRNev/zquBGnpnXaWvMjt5
 wqhwu0OxdA3JiC34dGVli6IGvXL+J7ai+yiX20MtuiAf4fcTkitzn71Mwod0rEfLcCHI
 GyjivUzpDRwf9IyMzPqJp7D++0eL1iEFjzASgWAIE13XS+RuGYYUU+c0R4xvVJ21uAtc
 P2h9o/PK4WKLBgvBNE/ihWFPwFWtyMXXCGUjJf3Doh9YnMsuL2IHORkvXdaKJNvrZMdd
 iaJpl7eD8zgRWDHdizaMhlFGVZhpts5DCFEje08Q2TTBWAXk4ULrLxceA9uhCGmvKBlH
 SsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765263858; x=1765868658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NlEcoy5+5oc6M380clZhLFLgHuuIPuJq9Y784u5sO88=;
 b=V8lbMHNhRdXHV0v1Yocy9XizoasjpDU+d0dWhJ9tXmRIEYjpk6qbpOJ5/es5m62TXW
 tvpImnSiHCNc0akUlRpczG8qtmSSMY7GHMA5rPGsGJ7hHPLE3G6BHIbJSASE1hUVOHEH
 TOLF7ygujLFWreOzH6h8El26lzPvJk3pGfBsOYw96dJnPOsV7b8mSeDh5luZLfpS28Yi
 grbK9pTHWZDuMOnRF0yda+lQ0DkvIZPZj0se5aS+HoCQYqHBgUT6S78oxdSlPRwvRNtW
 CD5saz0DibogctM8WIWuXn4Q4lDAsAw5FxSfRvZC693kAieE/WuCPmSWPDFpFYRikO+o
 YFlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH/FgYXvICj+a2wQSiUtd/+CAzqcqJCnbq6jM08HCItZbC7GaYEEzsLJ+3bVkA2JM61XuNXZu0Cg==@nongnu.org
X-Gm-Message-State: AOJu0YxcVF/8hm2m7rwSBD6V0WBQw/FpeBZ0uzxuBHUVwSL9Lfha/gUL
 U83YDSMCMe+xAqBE/2eO9YVRqCHKygM3IUvK2bv4gqVvokJokHl7qvcygjX1ouHvMKI=
X-Gm-Gg: ASbGncvKz2u35cCm7opBv9VJMpxNXtuKbUvw08HjQ1U+3wJ4MMPVgu0965m0mk1iwLV
 IJ6brBhemA7laFA8/1sx6SWjxns679x6GpQWq860t8c+HrH4Wzhev8eLasrSdkZpv2claYY+Ghk
 Q9qucWG7p0Q07xwkbkgZHH7MF2SG5XJihUliJbbw5fTM8wD/RNm32cZHOngvxPW4oCW3mTeV1nb
 zy26tbTzd+72YFfshYi1SYUwLSjbedOaRfRUXpZswbHBdjOoWu+iRxvtAGhvOMKipahfcUQYaMv
 VsidPUXGBADlWHxW0xQETVLSOkBmjCkmSZGLHprmDFWzfDP8n/WryHKQy44PHTIZJKPWSTrcRVQ
 7l3SF9/yKARluWjcTwr84FC10GerhMUBV1jm109NExAvuqZPq5KicADG85GVc+TLFfuQAVJpZlT
 OCESZ+6ZTZ59QFSpRJ8u9lg3etslRBjDjpE/xxw8Zfkue4uhICV7mNKQ==
X-Google-Smtp-Source: AGHT+IGgHKIRaFgA3uLnqdatnFReEJg64vFXOTEyGRoLMdYgwFxOvEvX3N2ncAdjYCbtKidjzUBPbA==
X-Received: by 2002:a05:6000:2dc2:b0:42b:36f4:cd24 with SMTP id
 ffacd0b85a97d-42f89f0bf85mr10662388f8f.24.1765263858163; 
 Mon, 08 Dec 2025 23:04:18 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d3319ccsm29287964f8f.34.2025.12.08.23.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:04:17 -0800 (PST)
Message-ID: <74e2fe5b-3b62-4032-a11b-74a5b13bccc9@linaro.org>
Date: Tue, 9 Dec 2025 08:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: ensure PSCI register updates are flushed
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
References: <20251205151115.2035930-1-alex.bennee@linaro.org>
 <20251205151115.2035930-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251205151115.2035930-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 5/12/25 16:11, Alex Bennée wrote:
> When we handle a host call we report state back to the caller via
> registers. Set vcpu_dirty to indicate QEMU is currently the reference
> and hoist the flush_cpu_state() and make the call unconditional.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3228
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


