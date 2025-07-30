Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E09C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:34:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhERB-0006dc-Sp; Wed, 30 Jul 2025 17:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEQz-0006TS-B4
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:34:04 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEQx-00049F-R2
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:34:01 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-76a3374b143so379361b3a.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753911238; x=1754516038; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mMHx34O4NsGw9UH79Et5gZ4bJQMTwO/qHQ9U7UMQRWk=;
 b=s7W74Dx2LK9PsMg+x2GbGNwJknxqEkNOeuSMVSlE6Z0uxzjuzLiajIKvSEATEVqgz0
 6sfUU8sqWtcidnIdMJ2gATWr9yTSTT4HkI8Wipss0HRct2OcOyMFjlxWIfbG3/p4/fEy
 EKqkAkZQOlcDf5tV6GXapxZywH3ecOMvxr6+LFoArNFdHJf/ZcirApWqTDbnpIwy7sHw
 /gxwSY0v7owdtdxLk5ujir451cRr2mT4ZybPOqTeEM85QxN0fXUZBA969eimP6dz4u8o
 dYanBdmHZw4LcVbniDnmqnQZqTx6dS+MSwhgNOl0iroWJLGf1ZAcKnRYRnm1+BI23M2O
 pmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753911238; x=1754516038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mMHx34O4NsGw9UH79Et5gZ4bJQMTwO/qHQ9U7UMQRWk=;
 b=cf7fXELNfaX0z2zR/ojDJspRa/aSyt3IW35YjWCmg0ShinIuemU7Ds2uWQx0Q9Rtgk
 utmUxOzyrjKsCuH7xX/Ek9a+GHAuf0NZVCVJL9kXWoeZKsBZJ1gJIBpvW1XpVT4oi+LF
 7zWXJ90fsrG29uOTPGqQ3TltU0pmEPYWSBWZePoR7vnVbkrppo3HHKeyf5vyGZ38Mv60
 o/czHBpcEEs8l2q3n5HZILqDjkmxesyZ5Nj11xttJznhAnn43zpElHEf65O2RtcGkizf
 HUJS0lGIQ/oQp9PIyE30WFNLARSpkfKQDacAwlPDYGniH9JkXO+eRM/bsiUjI9ZRFrmi
 F+BA==
X-Gm-Message-State: AOJu0YzHBPZAtloOhB032SlVuVZyu3ofx6wWIbsRwsZYBYcUtFAT5GOa
 LiWVjHECG67nuDqp9b4EukGhf62eRsuHSwMKw/o5OJf3UTMRfdYPgdf+sM7liZvsEyKvA+vpzAs
 WFmlR
X-Gm-Gg: ASbGnctAoDbtDLAxz+Y4fzX3S7SKBRvOj6y13By6c0lITVDTMFhblBmnGg9BJ52x1ec
 0YTYZtoNInwpawizpiKVSXOUbhCJK9NaRNyZIHlPSoa+DS6pbu/sydk8KmzGYBhhD5oD0QWid/F
 HOTfj1ub8KtFF38GZKmg6afbRC8BnvUPQw0jaKNLacm8OeByo0sZIDKqlEkxFW1Nbq6bZ2V/ZCW
 fOGUvAI1EEf8ailf+PbtPU2++9F2Qr0mIqDacQhk6EJLxbxTDRNoGuit8b55xb1J94Tw/Z5z+Vh
 OFd27pPDOmw+25NRuEQUIavMhvNsYnIdSgvtoPegAV6FkqRGzWcqWxv+fxKxmqGe8CuneNBczu6
 VGvusMknh+kimYqBziHYm9f1osH92fcgj69yVx/6++gLQDQ==
X-Google-Smtp-Source: AGHT+IG+q4m1W4ROGBqq6QPWhh6uQgEw59VufiFJrMfBCpHDx2Q3qKO8ju3Bg7B8wndk9w6MNttY0w==
X-Received: by 2002:a05:6a21:3299:b0:21a:b78b:e916 with SMTP id
 adf61e73a8af0-23dc0e99a32mr8229520637.27.1753911238263; 
 Wed, 30 Jul 2025 14:33:58 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bb1133fsm10892a12.56.2025.07.30.14.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:33:57 -0700 (PDT)
Message-ID: <656b2c0d-bc87-41d4-bdef-38ce27d43e13@linaro.org>
Date: Wed, 30 Jul 2025 14:33:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 41/82] target/arm: Introduce regime_to_gcs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-42-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-42-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Add a lookup from any a64 mmu index to the gcs mmu index
> within the same translation regime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/mmuidx-internal.h | 10 ++++++++++
>   target/arm/mmuidx.c          | 24 +++++++++++++-----------
>   2 files changed, 23 insertions(+), 11 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


