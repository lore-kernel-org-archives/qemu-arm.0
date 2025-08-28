Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D68ACA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:24:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usO58-0002qy-Is; Sat, 30 Aug 2025 12:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkEJ-0004M8-MF
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:32:23 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkEG-00087G-QX
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 17:32:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b7c01a708so4112665e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756416734; x=1757021534; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/dNzAE06fiYRsxFXdP0nWLTdBPhF/t/Du0Zyr0GctJ8=;
 b=YnThAwZIsQtv9AgwZLBc8QxVFThG2aOVVCowqheluxDf68WmL4Woe/pugapbgmUvBX
 6BhgZQ/oF2BqiXIO2djcyB4/lwHjRCkn1uYK+6UQZ2FEk8nPp+eRCJMXsRXEgymdmDTX
 aUaSiO/1AXtZ2lo6U0r6iEr6g2/7y99V0NW5Nc9Gmbs3k/TYcz8RcprHBFfCWp1i8pub
 8HEe6N+VEzrFcSbjXULwO6zWpSANOd9AqSU7WvgS3wEKjFa9gcEtgycXaO4EgtAV6PCX
 XJ25IFcj01rF8FAhUC3hDzDz7l7Ww7m5t2eFTArLtWupYXbaZ+iyVssDr6xSp86WYsU1
 Qd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756416734; x=1757021534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/dNzAE06fiYRsxFXdP0nWLTdBPhF/t/Du0Zyr0GctJ8=;
 b=J+eispFB6MpV5q+D5Ro+hyoOqeAZZ/eU30CQiiIN+nedHBSDp6pvSMM63stKGID+Rc
 /R4tCAPwfL0mcNrdpfqZcnF5r8XJ0nhJUg8By4Cjl2Bbb9QwYlzjGXZd7JyMRAJAP9xZ
 3XY6fwB0TS4bd668Mu25IfVA2w21CTNXoDmJixoO03J0nHU8OsINRi5HpUfTOwZFlZdi
 pCGp4I8UMHnZBneUlNU+CfvbUUlw5OcDjsEiBmyPjIfkSgMnRV0sKKkU9iMNBgbFPfc8
 wWcFxILdA5vf9Ftd6RAylmDF6E4fz+zs+pwzn41jqtaeFxPdJdGsSNMwkg5ACMU31M4d
 oQlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd8zLd6bXT5ehpEvfmpqbkKmNHpYbgvZKFeTjyAOMqhfNOrCTcERkM4b8lrhqr1G7J/gWIw7Pk8Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy41dvECvzzG+/nlSdLvrkuN3WniDNN0Fm/3UybQztDBSq1xlC0
 PGsB9t4D7GMWYdjXoqK6vc8xp1DeIC/qrTnzhzZoBl+9qdHFyYM76oCHZtBKuWZ1EUE=
X-Gm-Gg: ASbGncsfQzcgZSQdBP7BxuDLqxLvX1xkrZSDXzrhjh3g9k4gB7BQxZP8I2WdgZIIHhD
 gXzpCVvmd9EfMrQEgrR8mN+Zqp8dFIuvIq8lpy11hCXybym98/imYvCdysSbH99h6YkqJ9cqZXR
 OIiDCX1F+g9MoM35SiOsg/EhkzAzDOjze2mNRMn44dbduTbpqB/iIs/NM9mHo4/f9Nk6YzdreW4
 Ttl8dDMaY+BJ64D6Q8WMZ+ovnaP775wrPWtxJPBJHJdHLmQtXKtABHDXD9eunF8VWMdW6Mffgja
 fcdw70buhjD1cn6Ps0UZ9xdhcyAkdr9xATZCTDTqh7pEIqN5lzMJq/6qO4TOjjdTIFhYXuoZ2MQ
 KO8iKAGrsXrn1PMSW9vMQNP5mg39GdxHGkd9qmrueK9XmCvtKtOZ+nwc+SnCubzb1U313Yq4BF5
 tv
X-Google-Smtp-Source: AGHT+IGa2OnwqIfeh4CKrY3jPPfmNJJrOUcCSIf/kiOJXZZKhZjyyIm5dZAJojxx8yKZYOgfJwwlgQ==
X-Received: by 2002:a05:600c:4e90:b0:458:a559:a693 with SMTP id
 5b1f17b1804b1-45b517b957emr235780905e9.18.1756416734222; 
 Thu, 28 Aug 2025 14:32:14 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f3098c7sm89822345e9.15.2025.08.28.14.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 14:32:13 -0700 (PDT)
Message-ID: <80e866f2-7c97-49cd-b0e2-d28f2f1aed0b@linaro.org>
Date: Thu, 28 Aug 2025 23:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] target/arm: Drop ARM_FEATURE_XSCALE handling
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250828140422.3271703-1-peter.maydell@linaro.org>
 <20250828140422.3271703-5-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250828140422.3271703-5-peter.maydell@linaro.org>
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

On 28/8/25 16:04, Peter Maydell wrote:
> We have now removed all the CPU types which had the Intel XScale
> extensions indicated via ARM_FEATURE_XSCALE, so this feature bit
> is never set. Remove all the code that can only be reached when
> using this flag.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h           |  3 ---
>   target/arm/cpu.c           | 13 ---------
>   target/arm/helper.c        | 54 --------------------------------------
>   target/arm/ptw.c           |  7 +++--
>   target/arm/tcg/op_helper.c |  6 -----
>   5 files changed, 3 insertions(+), 80 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


