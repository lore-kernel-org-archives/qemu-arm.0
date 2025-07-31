Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF1CC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:56:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbGP-0007ay-4l; Thu, 31 Jul 2025 17:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhb7t-0006xk-0J
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:47:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhb7q-0002Mi-JV
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:47:48 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76bc5e68e26so1699036b3a.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753998460; x=1754603260; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7QBEXA5a6d96IwpWSjPCwyfgUMGeM5xQOxDD3K4XEFk=;
 b=Aqah3+1QDOQShyo5NPjqf01DCtpKKWFUe00xuRMzDR1Q/zsz9fqUdKvVSqmTIHYkZj
 VC96PGehxlmkp8yTC081wrAP9+nQUCqQ3aCq6vABjR0ce3Y+rAev1LadDogqC1UZ8Xbf
 sgiWKd0ct+ST1lopn4o71sQdAb4IQxo16UVxukWWG062DcY79H0777Z+JeB5oe/1U7hG
 lQQbXTkgxWOlI8XCBW7frtVTRSYx+UhJEUyao5ZUNufc2JNPS5DBI1EBt5aZPm/doZ/g
 bY8xpmPVNvtASrSuVK+7VRbOQx95MLOvRSJT1tXXuIwVRoYRg/ZJ56kmjNxq2Zs2ICo7
 edhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998460; x=1754603260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7QBEXA5a6d96IwpWSjPCwyfgUMGeM5xQOxDD3K4XEFk=;
 b=nAYOgpRvq98qLZ+prQviLHKhZfgTb3WVD11F/dbcXikjdBluyidXia5mNnG1k1itBW
 4cddcmlN777peRxs2rSzG7D4I0e9Ku9o2TSKkjr64hki9hXMV3ekvjFJOkVq3hrbuLOc
 DAlflWLLPPhNURbZ57cnq0Fn5w8F1ULh/F7SebOhqFv0LuQnEOFK12pEvJ950Q5vOY71
 XgpRB52jp+1uIZCJc1Syy5LBStsQNQvLSSz5WDA/nBW7A0aS1TBzCXOr7sFMYLqwhoP2
 NaVDWGDswCvC4v3aIYilrcpGYQZIP1Bsu1W1MV537XkPDzsWulX//+AwCK1tXAkLi/QT
 V6gg==
X-Gm-Message-State: AOJu0YxuF3xG/RQfjZUDa7v7jQPPKHO6RnIywyWebyI+JovbYCpovZnG
 HUOQvc6bMo6h4UsP+dGPcvL8PTJVG1quwJMF1bTHkcGs4/AeFb34q0GprHvJzS11DMo=
X-Gm-Gg: ASbGnctW0D8Q5Auc3mDY0LhhMQ4tK+FjBepqwXXfOUck2SBpbCop/SukRHjBchvgrFu
 2E+69V5/kEriDMa+f52gJ1xA/FDlf4gJ5eOkRZYp2hNh+K45jh1B7frFMwMeSQSmfH7S0Svtk1u
 iMn7ksUeNJRFVQkLo+AqMLWp7K5N9xALwUO8MK7sRdBoSTqcTqyH45WO6dcEfqYgnDP77YBq1RC
 12KPI4atpDqz4Kp0bho7pmBKrqy2VZK334SjLP8xNzj3YvqMh0ND5sCIHjZibiEnSzflSIvD/cy
 rhMaCOyPx/rwJTiBXTOzoUzdQw86Dc2M1AsrC9pbeV5H1MatOXKyW1fCrWeYjOtTNT0rJsr/REv
 1BwJsY10ApbLXo55ScBHIujAroVnVWEKh+yA=
X-Google-Smtp-Source: AGHT+IEPmoxSrNL4ddykhuqWpbHnvwIdm+H7mDqhN8oQPZG7MKmUAytMfhBHo5H6zcO4A4aNhhXfrw==
X-Received: by 2002:a05:6a00:368f:b0:76b:8b13:e06a with SMTP id
 d2e1a72fcca58-76b8b23273fmr7836914b3a.14.1753998460561; 
 Thu, 31 Jul 2025 14:47:40 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfecf3fsm2425467b3a.131.2025.07.31.14.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:47:40 -0700 (PDT)
Message-ID: <53dd9790-ee5f-435d-9a85-081173329561@linaro.org>
Date: Thu, 31 Jul 2025 14:47:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 66/82] target/arm: Load gcs record for RET
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-67-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-67-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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
>   target/arm/tcg/translate-a64.c | 32 +++++++++++++++++++++++++++++++-
>   1 file changed, 31 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


