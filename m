Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130C2CAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:05:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Mvz-0003uy-QG; Mon, 29 Sep 2025 19:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mvx-0003s5-B0
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:05:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mvs-0007hW-PE
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:05:29 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-33082c95fd0so5326033a91.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759187122; x=1759791922; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QpidpxXj3OIxk9jGKqLchCwj9QBtutOgzvxa4+ikdk0=;
 b=C/zLEylQhHm0MTGd5Im6lzYBbaKvxqZrAcY/aMczjrR3KRQk0Ud4XidXG17RLSGisX
 +sT36lvZ8tm9kdGbML2GIr2zq/kD7Le9wh02pZ/ToTxawIjorZGaYCB9HM49OxI+aPQi
 spUSuDxxIJBP+SOeuCEoejhNbqOG0iyI9INBZVUv0joIEwXXWjLkK9ehb2nvTJpNkR/v
 zy+NEgvmDZMOntgaqzHewAolZgd+aSt9OfPlR4H7bg9d0F57A1ADI2wDBioR3qK8wx8N
 Tn+ZMtGFwrl/nKRqPgEi+01NBxvSfMObwjfQn5kumt8FxPZYPwdKjh33GRXcx3K9lbiI
 sCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759187122; x=1759791922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QpidpxXj3OIxk9jGKqLchCwj9QBtutOgzvxa4+ikdk0=;
 b=RUnLWr8mUDvG/b5QYc7FpHbeb+tNmFhjWfk2ZN5d5qyYIh3hSL7w4zMmEGya0mTMF5
 4Y5BGVBu9KW30XLle1NDOEHWIEQW6en55l9LpG4XKNY7ViZ3Wk5VtMtqTNLNWPdaGxwP
 M46Tbn4cA0pKfkt+9bFvUZGXRPoweyMQrNbgH/He5t8D/pKSXI3cnFvsC4gm+/KH8BZN
 uJMBo8I+jvVej8ZYneSvkidZBSDqVEQRTBx6jVa/jL9/BfZ24M1AZUqqO0YXuNrLO4yw
 S4l2DmxvbMUiRhctCHV8m47sKRJHNfTU89+XA80y3ZbMVcB1g2iP7t9MKlu+TAJpDyYW
 tfXg==
X-Gm-Message-State: AOJu0YyI/FjE8ed8C1nrm5DpoUAwcGISyXjiqKfC4ieA4DPcMslQh1TH
 xG00GJL1Q95Ceq6C1SqDeztNwjE3YORgFnE+uhN9fPHeRAqt67NgxdM/IsPwMGAzw9k=
X-Gm-Gg: ASbGncuIbrcW0eWEEUrwiHYJUB1xyQL5xpNpqlm81LIfjN2QiN9CBvgDRkgz3sEklee
 7Kh8dex7fxPw6EGxvg4xmNOuolIz0YVaAhaZ0qo/aUrx/IhcZMdWYalbynMDMp+WoK3xF4BtTds
 3KG/+I+73rsgRJK/GgOT0BSvS3ac4wrFQFLhW1zhxX1lMM88QEfwHLFEe8v8vWPzdf+7LvMhv2M
 PRB43mMEu2TUXw5QM+LReAHgUpCxSaPklHFEQJw0yDU8H1QsK7NaQZDfFftCLCGKPNXm/Ou9wnb
 wK3IeQyiWm4o1OLNiBlEX+agzn1NI7Lb94L2WSPoeLwc3OVQNyevrkSNyWlWtk1COehRoUI32hk
 y9H24Y6rnWKwFbTCtB5GOSVmCBteS+9xXn+gE/KQJtQqbKudrTP/KbNmC4tXLMx7u8T1ypLYSRg
 BZPwN7
X-Google-Smtp-Source: AGHT+IGq7n5yrZ+kWh/s4f9jtmPnV34eVVh2QQrsBFuE4N7tViy9uXl/jU1UG8ejWVw6L4XW5nQbDQ==
X-Received: by 2002:a17:90b:3b90:b0:330:3fb8:3885 with SMTP id
 98e67ed59e1d1-3342a2c2a9fmr17485183a91.18.1759187121770; 
 Mon, 29 Sep 2025 16:05:21 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be14601sm18205192a91.14.2025.09.29.16.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:05:21 -0700 (PDT)
Message-ID: <e7865901-ecb3-48e4-83b4-479c537af9c6@linaro.org>
Date: Mon, 29 Sep 2025 16:05:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] target/arm: Enable FEAT_RME_GPC2 for -cpu max with
 x-rme
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-11-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1033.google.com
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/cpu64.c        | 3 ++-
>   docs/system/arm/emulation.rst | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


