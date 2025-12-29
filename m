Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96FCE92FCA
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:55:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHSi-0006vZ-LG; Mon, 29 Dec 2025 12:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHSP-0006cW-DJ
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:55:06 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHSJ-0004oY-JY
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:54:58 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7aab7623f42so10262839b3a.2
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767030894; x=1767635694; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GYQJIN3N003Jiaq44UoCSPHrWkIZlb0Npd6wbYqgtTA=;
 b=qnQujXAf/GoFUI9FmYyCOPuKHGSz1PHXDsqWEF/hzRW72vs4X+IHUmiGToPAFYnXQm
 RUPZV+L1UcbzwV1NQsAO91m7Ogt3bviCf8vC4nZxKtPBO79BuDs2BGcHTWPWOyj7WU4r
 o41PKUL3AKUyJRhmLcv2Z9bjkB1Xzy/66vETEWdY+Lni2XQ6d2o4gpbjyJ+bNBcGS4io
 ajvZX21JlruxtYQeGNpGgj5/bgJL0fgS/E81wJwDypKwGNSvkM1HWLOK9B+T6lI0X5uS
 bNb40NasvppprIXdF62KxBCfeJ+rlJ1K04H4rVF+chmP9yTISxVTEQGHDR9Kz7x0ToZG
 A/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767030894; x=1767635694;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GYQJIN3N003Jiaq44UoCSPHrWkIZlb0Npd6wbYqgtTA=;
 b=tB7cblZ1U6Pg00HUC66whBaUNF4KAeRF5YVpkVuvhTrsXrqb320OYfjm5z1FhIbTQd
 ZvqJURWXmvzHz0O91jmObq8nbv/lFGmJfSTj4eu4a2p+S+9zpNRNUJt19+s6JpITKOuY
 BkkJie13+MLPz56BgZZsFceunAw+fZQeX8gNaWVqvtRgMWlG0p8mHuDv2bZWqsrFcVKi
 McZsQKRnYj/yR+xXVE3aYvgsJJbvCWuT6JKHGPyaDFfpBwgn/mwlWi8BcamH/pdwm+92
 r0yyGinfAvb9/7/4a2XBISi1K3BheYwXjwWLF0ncLHOG1fx2rsmOZtQx9DNY0j63lzsM
 v7kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFijTi3jz3aiTJlNyzuW3iD/dgiAugNRe1IN8mvdRhEeEqGUS0EeKyd0BLMSjPLtvSVMb651CGLg==@nongnu.org
X-Gm-Message-State: AOJu0Yxdk4Gq8K07ULLHNVPvWVYzcSrjZtHjcrlAKLZ95uwF1I5I9KJi
 6nl69NFXq1+sDvd6+J/PHTBXND7GkHc3tfAaYNdqABWIo35egXvZUD+4XQaNEnAaFl8=
X-Gm-Gg: AY/fxX6SGhOIN5lzH+0YKx3iPRQ73Vc3SJBaD8t3oGW83YIQr/SWHchgvxkjdw9EWfG
 DmpZf1qzZbbvDa7WuQnivnhlTEMGHHaMEkXmx8R+Q9SDNtcYdUPDcxxv74KIm6Br7BWifeSrhcU
 5aENqdWEefvBeT4jdRncMPHQ7LA2yZ0kNTL7qBwff1axMl9CtxOdaJYMriYdxxnnCEUDOkQSFhj
 +zEE74r4w88P08gYv6gWlA7I3wbWsDbISvYRncQinqcwtjIv95EYQmMuVKVStjN+X7TI9zn4/Cu
 WMYywj+Q7JRuxwEJy2qMBUt9m9O1GV2cusjxljWPJ/7AyP73t8IB/JrmmL3NPfuBQZr6N2SdqXd
 JMt+JR9MKyp6YGwz8pm85kO/ynUzCanYSxvg3KNEVdzMj4f9g+Yu3wL6wx7tbf0i8rFSJ48i9RU
 4CGBMZIqKvXKlB/4AED0Zgxr16ZzZIFKEqTj+SKWKvOQVRRkuT0E243TM5
X-Google-Smtp-Source: AGHT+IEKZHs2pS6BNNt1GybjHDp4orkhKQ29/lQ8hAEBaQVijQHH0IVExd1f+l7lYmSNDJ+IQ3yGIw==
X-Received: by 2002:a05:6a00:7613:b0:7ff:acc3:2f40 with SMTP id
 d2e1a72fcca58-7ffacc33e69mr22056701b3a.26.1767030894257; 
 Mon, 29 Dec 2025 09:54:54 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7aa328basm30231550b3a.11.2025.12.29.09.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:54:53 -0800 (PST)
Message-ID: <a56f5bd7-92e1-48ec-9579-4b67dedb65b9@linaro.org>
Date: Mon, 29 Dec 2025 09:54:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 17/28] whpx: change memory management logic
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>
References: <20251228235422.30383-1-mohamed@unpredictable.fr>
 <20251228235422.30383-18-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-18-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 12/28/25 3:54 PM, Mohamed Mediouni wrote:
> This allows edk2 to work on Arm, although u-boot is still not functional.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/whpx/whpx-common.c | 97 +++++++++++++++-------------------------
>   1 file changed, 36 insertions(+), 61 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


