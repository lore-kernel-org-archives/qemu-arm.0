Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D9DC83F26
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDvB-0003Mv-LU; Wed, 30 Jul 2025 17:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDZk-0005o7-FE
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:39:01 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDZb-0007WT-Gr
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:38:59 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-747e41d5469so247379b3a.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907930; x=1754512730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ifr2/N9JDfuAYJkj5xeTJ1eEcAUBRgJgoDwBo3ISkeE=;
 b=JvrZukI8QYQivyNonp9Nt1UmrMDa4GEXz/BcRxBt6WMWOGqnbu8mMUSskiBOeKr1pZ
 m4httvvQtX24xxT7hraetJiB3vXT4mR7KbDZeD9HEdCkXb6W7m5VspBcwf//JrVldFjt
 MBU6xIvOH4v0+/IgywbuQPOZBQ1Dx2ShMBaYo3e2X91hj/675osBb4OKtnvMBwGWfZV2
 aKTIhePinjUQTfIoRwmWfGAc6/8rC2isuW4AAEzim/IXe/ZYFE6pTcPe7B6db8N3Syky
 wnpgpNJPDWqra8wOC1Be2usg7YL7dWjkiQSK0qLdpQTWq51N4Q5smvSLZgvZH6vMXpZ8
 k4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907930; x=1754512730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ifr2/N9JDfuAYJkj5xeTJ1eEcAUBRgJgoDwBo3ISkeE=;
 b=AheR5780iMqbnWxuXTAw7RZX0cz4qu7GhROl2DsCvcKVdw7jqZJbCTC7n/kwFWW/h8
 WCDx8Ay1zCpFPhLtcvnNpWhUPLFTxT5TdiiqGeloFaXb8TU2R8mLOXGBfx9K6QMAb/5h
 kh+TMebEQmCFSgHvAkBMm4QClEkxBpOeINjVtrNR0ohgILaUDQ4ru/S9GMCy4G+FIqrS
 +V8qHyWOaN7PghOiKYk2HK+bk9S40SEAVCX82wjICRkHjtPvdlrIP5QcKMPYZTFjjzPM
 jzkkPP9oTx4M4FO6xJBnhdl65qzHXbXCjkd7qsUbn9v1meYUaqGL7jDZKmjrWoH0/5zm
 YI+g==
X-Gm-Message-State: AOJu0YyfTa2xw8g/NZE/uEHnIAf+v5CvIzziJSls+Fo4Hs98cc/j3iuz
 y0eCvlseHdGgW3d+3f2fxiQv8GSKgQ6MLJB1hZ5K+KxHHNCs3Dzzg30bNq9qmXlQ5s0=
X-Gm-Gg: ASbGncvUXFBphMs7vWvx9mklIUNNj8Jxj8c2QHqvshGmYYAOc59Pq44XPr+S03Ee6Fc
 nbCl4GmQ/GM9qDoA+ZRc04uOs7RKzFcU3feErv5X1vv2Y3GmSDRKpq9bMlJDVqGYMIT6D1/To78
 Egi5WWLY6zfkiHHzMEjILGjtsucemqvKoDtKtcNCxt0500kbIaFXZxukPr2peN3lN5Zy18dCeYt
 fzwDKAe6ZvSS/BJwKL+B8kFrDib0pbFdFfLrpIDsMdmh/V2BQcFZ7MOVTe23o3pIaeBxY5FbfBh
 jR9DJkxJrMZeBvPEKlEdbYitc2iFKUEYOY2q4imJwR35k4RKzcJd0diJz7pD5rqZ1v7LuFDOmpm
 1OMjRYGP80t01iFz4QxXd3rdw+chFMCcQa3I=
X-Google-Smtp-Source: AGHT+IGMXtRiN+GNULZFB3RamOLlpQuOqyJCvEyNLLevY9IoMW6ve7aeCssXCcnt9JzDrtFZA7FpDw==
X-Received: by 2002:a05:6a21:9998:b0:220:4750:1fb1 with SMTP id
 adf61e73a8af0-23dc0d0444emr8171511637.4.1753907929657; 
 Wed, 30 Jul 2025 13:38:49 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f58bec0sm10020075a12.17.2025.07.30.13.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:38:49 -0700 (PDT)
Message-ID: <e49e1598-e86d-494f-b07a-bc0f3b8f2c32@linaro.org>
Date: Wed, 30 Jul 2025 13:38:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/82] target/arm: Add isar feature test for FEAT_S1PIE,
 FEAT_S2PIE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-11-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-features.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


