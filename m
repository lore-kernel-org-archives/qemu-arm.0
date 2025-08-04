Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67985C87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:01:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj0Ql-0006yi-Dd; Mon, 04 Aug 2025 15:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uizFi-0003HC-VC
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 13:45:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uizFg-00078u-S9
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 13:45:38 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b34a6d0c9a3so4539504a12.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754329533; x=1754934333; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QULKk5VRg6vYTt6QR41gbigymrUk/XulFP8x2GxxytU=;
 b=EBVx4TDCeyPvOzna+38Pa0NFftdahe3PopCQnxwMoXR2nPM7gXHqK2GhCyKp6lQI3T
 yz01/KxOwixop4KPe0JU9F+ZS3X9NINoEmBoG82iMlOYIxrLCMQ42kvyMEAASJmjldFc
 klzriPDfiU4AR+Ne5JvFVwnc0Zk2uTYXflrped9J6Z0TleTAvX/Ka06glAkVaqNLUewQ
 GGO8xBuhit3PhFp6Vei8BynoufsBbuouveJFvXYsi2F1efxu4KRxFd1eA5pIS0kWLsbq
 O8j3Y6DAZ2QCMVHa4BVDqPAT2JnP7GUSAYPOk+aslVj+wDTufEvkYdU2vtijt1uk5+Mc
 o7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754329533; x=1754934333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QULKk5VRg6vYTt6QR41gbigymrUk/XulFP8x2GxxytU=;
 b=eVPxGdXTuRR3rG/SdwIKx/ZQP8BTJtAa+rBZ5OJ/AcZKfOarwwEkFDPfQ8vwPdwFUW
 HlEKRHTMyr4RTV3FRzI+hV1iUmhbNSQXq9ooDfV3S+st5LoJbAA3uX/2yNGX7GJlKlEJ
 j+qFUXRT4ccVSrd7q/dm7lCZpUjRakIfhg/fo7yg8BGoOoeq1jsPmZhF1M8Xt+obYndN
 XnLIi385gNqdHQUaAiLMKAmtY6Ka64QKpEZLRG3aqC4deWW0kbdKKgucmu2OATJHyTWF
 1zMSQ14ux4OfQ8xUZUeYk3IplfLg3qzFQHbAUU3VL2Mdjc8MvZbHAqAZRbMyfyK6LOTq
 RVEg==
X-Gm-Message-State: AOJu0YzNdVVF62GXixJNZbC90O61jTjyNT3VtToMbiZhh0Yj860Tdz1R
 EB1y2XtWFlyHIfm+/4RHHOIABQjlI6FOsTm6wiilA4QIn6o89A3+RFakJJ3ZmBcfPHy4+VbAnoR
 HSQaT
X-Gm-Gg: ASbGncuPWzbmezUvhwXhVdG4s+sUbcQUKzhVjZqPSYGLXiMw3aAgopbAjc+LmjxgGU7
 8CJDhBvLQoF01uX/HuTahp0NpIb5ddxfI+Ft+DMhU3i9tOZ0Ia+GL3IBUNFxMzRZu8SCWpoG0nn
 Ji/4oruh/2ExxclhjGP7jC5f+BMaok1MFWkTbVNTDM/eEEVCTZELg4hcqo+2leg7mI1mPeIxac8
 OdWtHf/40IMAD8M4JGY/R0MgYQcQynO1mFjj4naTj4GsYVWvG23qj9x/GdDftqhEUxrqMwzM7j1
 M0TXmW2kyDDZOcXsjWtDNBjLYmHWYEB6htzl9RFQO8utM9HnZyXHRrKxLb4bWOp4Qadt3iDBQHk
 /WbKLFLyyOU7sBwzz3VZf0avVbl5Jz2F8aO4=
X-Google-Smtp-Source: AGHT+IEcsjx3vy6mOGfSElPa84rxzX0M8DU56PbwvGi/iNOJPbGOsWy3SWYLXmEOTNll0dPbm4zPyw==
X-Received: by 2002:a17:902:f612:b0:240:92f9:7b85 with SMTP id
 d9443c01a7336-24246e5fb31mr124019635ad.0.1754329533106; 
 Mon, 04 Aug 2025 10:45:33 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bac16c9sm9499161a12.36.2025.08.04.10.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 10:45:32 -0700 (PDT)
Message-ID: <c69d2467-01fa-45d0-8d12-5dbbf2d4e793@linaro.org>
Date: Mon, 4 Aug 2025 10:45:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/85] target/arm: Convert arm_mmu_idx_to_el from
 switch to table
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-34-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250802232953.413294-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52d.google.com
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

On 8/2/25 4:29 PM, Richard Henderson wrote:
> In an effort to keep all ARMMMUIdx data in one place, begin construction
> of an info table describing all of the properties of the mmu_idx.  Begin
> with the access EL.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       |  3 +--
>   target/arm/mmuidx-internal.h | 29 +++++++++++++++++++++++++
>   target/arm/helper.c          | 27 ------------------------
>   target/arm/mmuidx.c          | 41 ++++++++++++++++++++++++++++++++++++
>   target/arm/meson.build       |  7 +++++-
>   5 files changed, 77 insertions(+), 30 deletions(-)
>   create mode 100644 target/arm/mmuidx-internal.h
>   create mode 100644 target/arm/mmuidx.c

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


