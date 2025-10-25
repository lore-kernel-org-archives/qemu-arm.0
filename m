Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DC5CCF9E3
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Oct 2025 17:32:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCi7b-0005X6-JJ; Sat, 25 Oct 2025 13:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCi7S-0005NV-Ks
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:32:02 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCi7Q-0005Qq-Ua
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:31:58 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b626a4cd9d6so667982366b.3
 for <qemu-arm@nongnu.org>; Sat, 25 Oct 2025 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761413514; x=1762018314; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SnNEDvqzwQAaRExV1eHmCSbDMziZ/dxiS8SEx50zXh0=;
 b=hM8hgmaUfyw4Z0uq+E3gLc+1NG5g6Hb1PK12/hgbO26tlfVAihT/nAE6d6d5cSDpdP
 EpJNnfdkN8fLruov+ZMOzIbT0VNG+wF1r8lyMuweQAh+LfbLfOoSxO2Mz5QcaXnO0MQk
 M+cO6Z/bU5LVX7AsqyMmUDfXnaiX9gNXxRpsxM5qeDtZVwxzYCYt1eZJWCoEQiRYtPMJ
 oRUe1ycfkC7vNmtyK5aje7MAwAfadwii6ZECLJdfCheL53fRNxexs/ixpSf3Z0dp2XRl
 UqVpbhWCz03tnqiY2lWW0vOexEfLdopxCViMUkRLF2WBCV60/uGAKaiwlZK0TmocehLo
 K5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761413514; x=1762018314;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SnNEDvqzwQAaRExV1eHmCSbDMziZ/dxiS8SEx50zXh0=;
 b=nXYYi5GsNHnm+DvHYx+GvzZ3g/5fUXirDH5KkalDJ8sSdsRl3Qxj+fT6ko00dOpIJE
 KT8BaM5Ig9oxxv0fzyh0Fjivwhigogt//4BfAjz2cFiwu02ngiQQBkNMUxK4Tk9y8gkE
 Nc7fIWuqukDQttgk8L+HGyXaM3EB7rlaLl4Jfkx/Xuhr8tM3YkSCgYY0kQzlM8rBb8xk
 lC7JCjqCQSj16oh3g4Urya4AaHas/UHFJJZGYTiB/fopLlP0eEHYKV1mYaPXK3QsAZIB
 jeMqnVdVbSXrZq7T57ecqTwTjHkTlePLdGzOa0d0aepNl2GCSaxNVR08qUNQx7nPGYEi
 48gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDStdKLyT/Kl1YmeYvcGwhP6FvlPZXJm5v5z+9eR2WpIwWlnm8iuPJMsaNVbG2yHLhYjzwt8WM1w==@nongnu.org
X-Gm-Message-State: AOJu0YytdBDNPWccfZM1n8iORxRSGbcols21Eu6qwoo6pj99vc3j8FhC
 jbiCVqMWCnkDlgyKOfbX/Ov7dpCnbV3tVFbP22ctNNaKvmHr2nkjS4eA6+0Q+Pzcw78=
X-Gm-Gg: ASbGncs/J5LbNCF+G5cO6h6Ky/vkIeopJ2+VsBmpV3kgyWJ/j2LCDADqQyCB3oV/Wic
 dHQ/OxBuWTCMj6jX3+Nl5c1v5zVoFYG1IditJqCzs0gvSteT9YvDVpa2fxPa/5iWMtR1vQWY86X
 w/5W7sL2VlzusqLuMMPN1+PtrreSXvwqXmMvMDiAM2cDP/OYz1yz4J0kU5wp2UDCBcGo7D+9L7d
 ecARy1v0lsW7B4ViBHXr9SHkcMhZ4QV9cpKCTQcWK08Au0Dsxw3CHgt8T4HKrN76hkjjkRz/0k3
 GIRjsZ55BmNVTO0PeuXiPq7ruQgFzeKDUwVsz1B5fhQo1+zEgk9NS33WGwtfhEE8JyPbWjbYMGH
 qaiPcRmOBGCMaSOqSWl9dUxmU8MJxVm8lxnJAchoGpMPpU8Sr+WptHvM0BnDMYraeU72Yr6B//V
 w07haOpXNehTN4Wz1/sAvYW2ttOOpWkkAXZiv3ymozcB182q9irQybCSvB4AoocyI=
X-Google-Smtp-Source: AGHT+IEd/wUd85s3pln0qSJ+GVeHoSMOF7ppka+nk+iaRjFnEgCDhTGz56rYxyLUKfoQ9lSrjpZRgA==
X-Received: by 2002:a17:906:4a91:b0:b6d:8d8d:3010 with SMTP id
 a640c23a62f3a-b6d8d8d4d87mr138011666b.56.1761413514021; 
 Sat, 25 Oct 2025 10:31:54 -0700 (PDT)
Received: from [10.240.88.227] (ip-037-024-071-028.um08.pools.vodafone-ip.de.
 [37.24.71.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85308c8dsm253799166b.0.2025.10.25.10.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 10:31:53 -0700 (PDT)
Message-ID: <568103a7-e184-4c08-8aae-a44a634beb43@linaro.org>
Date: Sat, 25 Oct 2025 19:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/58] accel/hvf: Trace prefetch abort
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023115311.6944-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023115311.6944-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
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

On 10/23/25 13:52, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c        | 11 +++++++++++
>   target/arm/hvf/trace-events |  1 +
>   2 files changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

