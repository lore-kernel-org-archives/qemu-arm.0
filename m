Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD56C87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:18:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEBX-0005up-Ps; Wed, 30 Jul 2025 17:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEBK-0005Fo-6t
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:17:53 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEBI-0000Dh-5A
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:17:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7698e914cd2so324147b3a.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753910267; x=1754515067; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X6nSnhJyJ3CVhUs7Ht1tMdScyHTH04DLX3Gqrj2lXhw=;
 b=jV+C3ApF926Db5QqOK+wgfZXQnmSMDD1MRf8D1NSuLCtYuPD+iY2Gc4N8c+eLs66/n
 REQ1MJEew/ir//ZoB2xnEBFe6tkppadQD2Gr5V9vixUrQlfFU2p2HlKSTdSJQxx1w4VH
 EvQzf7mj+1QihqIHkkHoe60eSjqg1we4ogTumgg/zqzrOMWzgnJol7lFBWubJkp4mWTH
 dFf9ds6+m8IUmrrymD18IxFH5k9OQiwTxLzseVFfMKHRa5HdJGRTfV6XCdCOQJFKVMBE
 k0kydSvQTWbnsgB3xM0SdiMfqbe+RlXcDMzoZgaRj+huyw1kcgG++RMg2NN1QWd0EYAC
 0/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910267; x=1754515067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X6nSnhJyJ3CVhUs7Ht1tMdScyHTH04DLX3Gqrj2lXhw=;
 b=mGnBio7ahgienfxfUxsy578kMupXuJs/GIbadRnVscpMQPudwM+4CoQKiBmF2ZJ5JX
 gAs1i/l/Q9n2GfH6zPFl3H4CjZ4dgDYaVRnYWkEkvx/5UopZ34IGK9OUTlQ3T7hRt772
 lTXOZdDVchWJeA7MdCJvU02EZeixqvYtiw7rJmoaTTqL/XpcUQ8Ji4jBkppbdbICacle
 qjVqQmHc6IWQCbgq0joa2ItVF+EJsqZUHzVjqcV8rynfwz30X5LvZJbEjUu9GkhbO5d8
 4V1XTABZNXQ5wFeGcYKQKAxh5EmDGeIgfNKFqH34y6Y9pisLs4LuR7xfPFDBAz7+4Vlh
 Bkmg==
X-Gm-Message-State: AOJu0YyU0gpesr5QzGaNOb9nWinOh+SD5bzlIjBm7XX9Bpv9UrgZIVcY
 6fgXf7hJ3aJqkZCHk196zIXyOrrhoNSfDy6wbhdFFJsLJSht/ikhI/IpFHpnqqwIS8I=
X-Gm-Gg: ASbGncu1LTJU1FiphIhfs5TKC4ezCXhS/PCPqWiapUuFsZTgxLkk6CFdQa+Hjr1kd4n
 aXn4/1RAmg6tmDZAG7ailmpy4wRR2XKCDjFFUWKdyTW/zf6SVvofmhX6lyUl9ngPiYEqiJLCT98
 ol4Co+lOAKd6UlRSifhhOkQOTvVFBBJLcZRWC3XzWsc+1pO3VEgPO4PThXO82AiOvUVJPcElczU
 2T/EOt8INrjlkcExJNCwtnBvF6bU40hvz1IFzRb1b+qHu6xHTg9GDMlql52JVe4RmQ+UvrY4TfA
 cVIRBDcJw8u96wunDjJxrpw5ZnMX8miIaGya+bQigIzBQ0Ic6AswK1zgTddyKRHS/ADghEWWKmw
 t8uJ0NqXm6OGSK8McdlHL23iNRaPfn8Sanfw=
X-Google-Smtp-Source: AGHT+IHrDduPK7mphicoZ+OXSYYzLXcaPr076cUKhnrMx1ifxdy7woKZHnvWb8k2pgnvSnngx/I40A==
X-Received: by 2002:a05:6a20:9189:b0:232:1f25:7965 with SMTP id
 adf61e73a8af0-23dc0d59445mr7563139637.5.1753910266628; 
 Wed, 30 Jul 2025 14:17:46 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640adfbf87sm11484446b3a.71.2025.07.30.14.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:17:46 -0700 (PDT)
Message-ID: <d03541b7-a9e5-4366-a6db-71122bae2e2e@linaro.org>
Date: Wed, 30 Jul 2025 14:17:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/82] target/arm: Convert regime_is_pan from switch to
 table
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-36-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       | 13 -------------
>   target/arm/mmuidx-internal.h |  8 ++++++++
>   target/arm/mmuidx.c          |  9 +++++----
>   3 files changed, 13 insertions(+), 17 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


