Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BB5C83F26
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:02:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDv7-00037B-Uf; Wed, 30 Jul 2025 17:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDd2-0007rk-Sb
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:42:26 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDcz-00008L-VM
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:42:24 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2405c0c431cso2283095ad.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908140; x=1754512940; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=go0CL4xkPoqpYmv+5T48I91u032jyfdQ/CW7yY5b8TY=;
 b=oOS5tCN32eLXQYeX+/5DpwBd0atSMvCOro/tVczxNVxZyRguoJjbNg81lUMCgLSDu3
 kq/WESfr7ykLUgBilKRGoaFbxGl19dBNTK80weCKeU+j+TspzHXFuP2CZdnoiL+O20Y+
 shg6gkHagJo5Oanfmfv+b6sC4awtb4k4mLpaX0SxakAdHdafBWl07nWQmak6lCDR3erh
 7Fv1+PzCNb93bl/GsYZDs04+vE+VLpk3fA92kfv+I4A54g7eDdthZQzAFfOCJlIpsJwz
 ue2zLOh2B+cxmL12KNfciQkzL+XDKvciSuCyHfZFob2v48yuchqjlAqK+ouXCkoAeFx+
 CY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908140; x=1754512940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=go0CL4xkPoqpYmv+5T48I91u032jyfdQ/CW7yY5b8TY=;
 b=KexFZIrzcYI8nfsUGwrpl6lNoz5recwDZvJVUpZ5s38H5+Ax+v18sKBOsaW5scoefh
 31L0tx87P53jsnSqlEIdJr9egkGCa46AX4o70Ce/R1kOJ4/QbooKa/LoATFz4JI8ptKx
 urF2FQpaDXb+Cm2AfFV1MGY67WQk/cere0QM/IC65LG9EecGvIqEg+yGsVa5nauBW+P6
 HcTlSio+sOiQE78pATraxii6GU2P9PG7Tu/IH0QzQGYWOILKKc2bG9c5yGrcvjtGto3I
 9fPI9i7lNkqpw3bf+MKYW2XXZA3JQC7lm+rg79QrNovWpf/MgJAHu5V5gmubp5pdqbMZ
 CYzA==
X-Gm-Message-State: AOJu0YxodFxG3qmKqHLTeIc3Cftd7FuzTfIx+kRhd1G5WZVsNhADMZZ7
 Yfz0DIvEvsjw1xwk5BP9YBvuk+4dhRxdB2MO2WGxX5jlxBBCRh7ClxqE1XfbrG6p9ME=
X-Gm-Gg: ASbGncsqnCWLkVVECUnQnyqOVh4dR9iueAE9gEMxLIaW2QnDJjK4St6EoAEUprL67W/
 5e557XoYMK6XzWDvnYbVpWbuYs4nWiC2pB3RY1dZeQ8v+R8HN0wThXvozvvMJ9vXfbJoEqY5Zps
 4jDQERn6O/cGTo4cRV3xAFH99VMM/PkU3KfkqiAur7HbciRhAkYyHyGWzYsIWC9uu8UyR7M/L+L
 x60ed8cKc6TP75qCWVjkD9KZhlzsrRAsEatRd51FS+YlBgHzYCokbmKuQNXGFlehNNM73l0mfHj
 KehbFfG2EVbk5WTf+LEDpLM1MGLiz+8LrCctIhIb6GMNtHoCoi4JNpC62qlk5IEhPsYIUueW3zZ
 iEY71OjoFCEKAXyzaP08pZJGnwm1F6gxnMtk=
X-Google-Smtp-Source: AGHT+IELl42hccrVCOeNwHTS5+IF9FmbDVP+Tb4hdkBipLa6LcdtL4Y1TSIb8pllvk8gTAY4GxZGbw==
X-Received: by 2002:a17:902:ce01:b0:240:a05:5b79 with SMTP id
 d9443c01a7336-24096b41452mr77644515ad.44.1753908140640; 
 Wed, 30 Jul 2025 13:42:20 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef595esm188265ad.13.2025.07.30.13.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:42:20 -0700 (PDT)
Message-ID: <6b9f8d50-2adf-4a4b-879b-79929c4ab8bd@linaro.org>
Date: Wed, 30 Jul 2025 13:42:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/82] target/arm: Force HPD for stage2 translations
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-14-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Stage2 translations do not have hierarchial permissions.
> Setting HPD means we can eliminate an extra check against
> regime_is_stage2.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c |  7 +++++--
>   target/arm/ptw.c    | 24 +++++++++++++-----------
>   2 files changed, 18 insertions(+), 13 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


