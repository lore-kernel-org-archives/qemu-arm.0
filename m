Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589C0C87FCC
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 20:27:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhZsN-0007j9-Md; Thu, 31 Jul 2025 16:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhYQ6-00015I-2n
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:54:26 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhYQ4-0007yT-04
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:54:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-236377f00a1so11822145ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 11:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753988062; x=1754592862; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I/nTx0c11XoOaBKrEg6Ec/ust6P1Sij7FdQJOma9cTI=;
 b=Pims3vZmh0rch9cDawOXZb7WL/CJVJNk9mKXcPLs1Ng/XeORhj/F/qnV8LeKoWzZqA
 kWPEbVZlYwpBWS88PMlVmX/pj0Y22xMRRfDy/j7KaUbduyThaIg1yFm5ja16BdfimQU5
 EuscB5UQaM69dV72IJxlP2xEYUb/pLNGzCNkR7HffB3wxy5QGzzYgDY/TH4DVbJMr9d5
 ghZIiL0rrpA1Nv4ygatwAlBJqqc56SpUUr943mI2MWNfIw1GXrq085A4UNE8QBzNHxPx
 5XagIKZ3vwtyA8rVIkmlKIaOLEXmwzqgdX+sxQZJPYtMnGgamONrGRCP+wgKtmGQrSkH
 r7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753988062; x=1754592862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I/nTx0c11XoOaBKrEg6Ec/ust6P1Sij7FdQJOma9cTI=;
 b=qaBEX2JzGKklZRjrqBrvpY1AwmTjN7Vz0cNrU1ilkIWPZ/+gKvIhqjK45YRktkisHy
 AjdGxAUz+oLlCh9ZFksyuVDUSSxdazhiW2o6OCIYfPJzh/f0C4uakw+Xwm3gmvl97UJ0
 7KrGhxxVhdfBz/ehYHzXXl6HJO9Jfej+/duX0ml2WCoqnPzNUjvHhswKypSg9h2qOg6z
 PsifM/0lEQtldloF+aXOuauxhAd4SsUUx/Qo2WG5ux3s01RmZ3iZuypotS4+56V35t8g
 EpDmxYbHaH1AZ8ugC8wIHLLTsdSNm0lnSqCOLTNavdgJuZSIIltyL6qNT8oxdPvGM0MZ
 XNqQ==
X-Gm-Message-State: AOJu0YxUjdemx8nTeIIm6b8NJagaXFFSrT4wnpuZK6RwxSQ7ZRH/Svqx
 g7u+7ujc5hFtuYJ1GWxGpCfU7Cb6k3h0pfj7NVcDrNeRbVJHRN7RFg+LtmWDZgAllrc=
X-Gm-Gg: ASbGncsECVjm0yOyKMZuK++ltNgNxd6hluqrVFOERJ5JXt6JyQDdNSVwoAorudEWvfa
 df/Wk7p0N98CZr0fQkZzAqYukqSGalDpbDnZZ5lrVXaR6GOU944MaxM976PYkA2rburPsIngFEY
 1LQykJ2XBDFu2lLY6JFXPZme5RWQoOSxId5FLklwRGJOO5ieBKN1WRNdTP5Leb9u635driytK2h
 pyAmQhdanmUeaMKgPRSYUhs2T9dbjqLyAI5GNlVH4XaZjx/rQiwNMWWeUk83PGjgtjTcLFgqyPc
 jTbWIBo4TXOgHbPm3vpFXD7nAvLm1BIixy8uS6Y+M6XbUGaDQdTViTPxL7c/MSJ7priagJ3H9eO
 2bivLZwzBnmq6hDK/WcRkhJqpxQJtj4o7a4k=
X-Google-Smtp-Source: AGHT+IHgka58hgE1c1LGTqzw0I/1dMHDGOdUgeJehDYlF5KLRSXUCYqb46re16YxlFpsfhkCoJv0pA==
X-Received: by 2002:a17:902:e848:b0:234:9656:7db9 with SMTP id
 d9443c01a7336-24096b03cf4mr126295225ad.32.1753988061743; 
 Thu, 31 Jul 2025 11:54:21 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976faesm24013995ad.90.2025.07.31.11.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 11:54:21 -0700 (PDT)
Message-ID: <ae475477-9c21-45e3-936b-962e805eb4ef@linaro.org>
Date: Thu, 31 Jul 2025 11:54:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 45/82] target/arm: Add GCS enable and trap levels to
 DisasContext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-46-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Pipe GCSEnabled, GCSReturnValueCheckEnabled, and CheckGCSSTREnabled
> through hflags to the translator.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h               |  3 +++
>   target/arm/tcg/translate.h     |  6 ++++++
>   target/arm/tcg/hflags.c        | 38 ++++++++++++++++++++++++++++++++++
>   target/arm/tcg/translate-a64.c |  3 +++
>   4 files changed, 50 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


