Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526DFCD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:56:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWxsh-0005mx-TT; Tue, 09 Jun 2026 10:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wWxsd-0005lt-Dz
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:56:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wWxsb-0006fr-Pa
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:56:39 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2c0b9328c4aso39403155ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781016996; x=1781621796; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FTyRYlHDF4A+tpM5ZrsdMAFRIGvC7esWplDHNbgqS20=;
 b=I8uWqwlsbNB2C1k2QFxI00/G/tnq9tBJpL0Gj53jraa25kKZFALu+isQFB5AT7DwSE
 xXgiLP/5L45aPCx11CClVtEhYtXfUG2RY+7KvNiKED8gVBvAqoP8Dk0fZJoSNkIfouC9
 5nlT77S3jqOTw4BzeYQ4Ni5yHo6Ps2MLMZu6RzkUY4Sxu9l9cVfsNZVT4i/CftuWpDMW
 FD9KEMiH7E8JCyhTk2DNd9bhES66oKcKLX8cl19vqMn7P9Q0gx/8DpPGKmbSdroZryn9
 yGgiz3s/Ul8YprTJ/v6uhpuGKdIbFN+GyCa852jRrDtAs+qhodklSp//dC8QQbeKgSKk
 LA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781016996; x=1781621796;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FTyRYlHDF4A+tpM5ZrsdMAFRIGvC7esWplDHNbgqS20=;
 b=sNTm1rRHtH3F+d9+Oe2gVv38BKwvBIVEL7lXzoUU3hrKAu7WMJHP9RagP2JDYf8eaM
 8sD/0F+h0M35Hj0FcsrLzJUN2rdvU0UXDMGJ160jlqrRXBcsmgfJUgXeblrksyM8d6eA
 Drx0JTVzktDw+t0uytWQ67hrpvZEdRw7sxNUYKdqJkk7xA6t6RMiqj8xudqiYi3TfvL/
 J4sCkgrIHev7L0NUAhQCRX2oxaPsMa5ty2/Vn3apc3tu1+z8R7hXTeficY4mr4uWBxz7
 J1poH3q+145+5ZjsPf9u+iP/GsDnYT1cGVV/tdYvue2vrXVQYpKzqyI6T0jU3TiV2RVh
 piHw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LC3Xg2CHh2pE8cRqUCudWAccLtCxNekp7KIkD9obhQ5HJfRC8dW5HmdUqVRUTA7hJXk6Oel21ug==@nongnu.org
X-Gm-Message-State: AOJu0YyOBoELYG5cd+6vJ8Dsd9BRNQe9zJc5i/asU2FYNvqvyliBsAIC
 rzkgAxqykBVnlRZZGYOf9my9Neo3JlIY/jvmzEtlgaBFAF8lihVNLlhfNVJOfxpE2Is=
X-Gm-Gg: Acq92OH3oo7tb1f4e/BrlLt44AJYytt/gARU9Gdaai70Kw81vEh5QayfVEsdGz0rQRx
 SYKmBCKw5T4buXaPWdqnQ/X7qogDLrxZWGTF5iA3gHmHtiIu/miRqwJSmJ3Y7wKbBFaqg+dZ+Da
 nA1GaUdMUCzknCWaH1TYwHXj1kTArhUYlqbs1jRfko3pUzwZHtDYFkDPUWeuTGCxGtJZgbBN8FW
 NZIQ/+X/hIe69G5ddRYKC7PSbfNHpSRnVomYcmv049f+Ekv80s2twib5kwoRwHIebsB5xsq4BMK
 /rSPcvHIU7TgoMXzN5C5FAE6TOBUA+MGeyzE9cadRNQiyCZJtxU5CpOL1DYtOUsavkJU0q15n/f
 v7zH7uY6siRV+8HmNYLIZHGFl2ghjjYISMSHwkeSHIL8jcQGbAOjGFQpzs3Ttwyi1P0pChAlnOK
 mRZjr6736eGqLcj1WWU+nkkIAItFeA7UsE1SaBgS+waFwjiSQ=
X-Received: by 2002:a17:902:da88:b0:2c1:ef9:450e with SMTP id
 d9443c01a7336-2c2a1c86746mr42961455ad.27.1781016996300; 
 Tue, 09 Jun 2026 07:56:36 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16609e2e2sm211005955ad.49.2026.06.09.07.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 07:56:35 -0700 (PDT)
Message-ID: <0906ae00-b2f6-4530-b90f-5ff7f9b15ad5@linaro.org>
Date: Tue, 9 Jun 2026 07:56:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/45] target/arm: Implement BFCVTN for SVE
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-15-richard.henderson@linaro.org>
 <CAFEAcA-RzkAX4k2xqN3pwfSUZ3LDmCa0Or9bKo-Rpwbk1aXQNg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-RzkAX4k2xqN3pwfSUZ3LDmCa0Or9bKo-Rpwbk1aXQNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 6/9/26 01:52, Peter Maydell wrote:
> On Wed, 3 Jun 2026 at 04:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
>> index c47e79637e..eccb5b191c 100644
>> --- a/target/arm/tcg/translate-sve.c
>> +++ b/target/arm/tcg/translate-sve.c
>> @@ -4100,6 +4100,9 @@ TRANS_FEAT_STREAMING_IF(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
>>   TRANS_FEAT_STREAMING_IF(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
>>                           do_f8cvt, a, gen_helper_sve2_bfcvt, true, true)
>>
>> +TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
>> +           a, gen_helper_sve2_bfcvtn_bh, false, false)
> 
> The pseudocode has
> 
> if IsFeatureImplemented(FEAT_SME2) then CheckSVEEnabled(); else
> CheckNonStreamingSVEEnabled(); end;
> 
> so shouldn't this be TRANS_FEAT_STREAMING_IF(..., aa64_sme2, ...) ?

Yep.

r~

