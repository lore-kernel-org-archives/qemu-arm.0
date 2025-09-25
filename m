Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0D5CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:36:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1kED-0006m1-VO; Thu, 25 Sep 2025 07:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kDb-0006XN-QL
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:33:02 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kDS-0008Lg-O4
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:32:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46cf7bbfda8so5075495e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758799962; x=1759404762; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AQhGemiT7rzFiqxwNgf8H9AOjHBDfYHRmwKIi2uDYEY=;
 b=IRDLP/rYK7bxwdxgfqc130J7Pp+yF3FcQj61YCRyBMnopKx9WQ6jj5BnFtf3oaClmT
 m8H64nImp19l2/ECiZmULVmEsPkKc2cpWROAWl33lk4/5fIYcInWXhm4JVTLwLD0bitW
 SQXwFkIWCCDvfcF/83hh7c5w82ttaxgN5Dhj8ROZyPQPf/UVOzy12Iv7hOmuKwbOD+5S
 7w+SYb2rjaPkuSr5wEieX1DD5wU37RNK2wodE1xfmsB6NujJWWpIbWYeyCUJoOJ69Won
 U5KTBO7Qn1kTH7EHR+nImkxfC0rVzGm8/nRRiX7DI+VtaxU8I/M8mCIhUQ8+rDnABKb9
 4hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758799962; x=1759404762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AQhGemiT7rzFiqxwNgf8H9AOjHBDfYHRmwKIi2uDYEY=;
 b=HmSaDJ4MaQsjTHnXZbYi6PgOkBdG28DXZwC9WWHmZ4QcvKnmPODhnESqU3jNhj+t+v
 GYbzbwZ1h2mLGRI3Cr8sysbjL89ArTQ0aU5p6Dv0OxNsgia8yRIJkr4fkXx+9aG5PXa7
 LADqnS6j3+JjC0FhinwmNDAZzGM/sfsMaG0HS+ptlReVOeu3ZIPXoURcDNv64iZ//Yy7
 aHSDXvQ24lFwQIia6p9eE4p+M/xqkdTmHzPtWmS7qoayejdoszEE/RBBrIYFySy+IEXb
 MB9AmqgYn4cbqIzvgKrVorCn/OGJI1ADbW+UBHRBIafljVh91LtVmMNe++gb8UcmM0V/
 2SYg==
X-Gm-Message-State: AOJu0Yw//UhkTWgfO+iXbrrmkCANB6jkqmjLu3QWn+Tf254NIKjwP19/
 q68ww58JR0K1q2rxNyBARNvgeSq3CsuWDYWVlhb72EIrHC3fPFQlPJemSM/UlvKb1Xk=
X-Gm-Gg: ASbGnctTmMEcgp1zd5d9hCGBGzWMWkWigafN+9cbd6ioygB6UWfOl/GpKsYSAzS8DOx
 X+GddgIsq1BGAwRKFMUvNZVucRVQUymyxyydR0dBEE43xUlckZ718x2iS9g96B44TUwkUaIdG7j
 yoSjipHEGO/2P69ZxXtOFihVl+um81F+0sHvy3OH9bK2TB2W1VKCgkQBXwM8/5D7Xs/I71cvnMA
 HQsnrB3dt4cgWxn5iuBde4vspgxiJ9eupEsYlXeheIaF7ZMu65uumiDsQRvkgp8NnWeQTQCJ2Rv
 ayGajTBxCmW6RT+5Ib3JRp+jWzGRuXnX+iqnT3ZuNuUTJ4QWPmCHK1Tzt5+skMebLH7OItIDRv1
 NoOxaPngkG2TSlEWZA6zs+KMDUVH5kdTIm9pO8+6wcNh/YsT1lcWL1UR4zoWWHubcvTErlom+/I
 G6
X-Google-Smtp-Source: AGHT+IGVVPYHm2pJpEBZSDsZSM8VjLwYveaVvCgmF0y+O2Si43HoiPvK/Oud8JI6f3rW5ESAuQRv5g==
X-Received: by 2002:a05:600c:1716:b0:46e:1cc6:25f7 with SMTP id
 5b1f17b1804b1-46e329b4039mr23757765e9.9.1758799962145; 
 Thu, 25 Sep 2025 04:32:42 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33bede2csm29802305e9.17.2025.09.25.04.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:32:41 -0700 (PDT)
Message-ID: <7927824b-384e-4673-8080-4d5f833e2cd5@linaro.org>
Date: Thu, 25 Sep 2025 13:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 35/36] target/arm: Rename some cpreg to their aarch64
 names
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 16/9/25 16:22, Richard Henderson wrote:
> Rename those registers which will have FOO_EL12 aliases.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

