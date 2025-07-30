Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910FBC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:01:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDuZ-0001bl-Co; Wed, 30 Jul 2025 17:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDWU-0002tc-BB
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:35:38 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDWR-0005sc-KX
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:35:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-76b6422756fso314361b3a.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907734; x=1754512534; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XoZsf6gRdluiDWkEnu+z+RV/F7cALktBWlef/NsKBBQ=;
 b=YxF/OW9bRVFEZveCtp4iApa1XEXFBtOmRoveCnlRlxIHYUeMiMYf8+6TdtzSsEfqGH
 yumT2WUPE0gLRYHMppgd4T56AuQheAoJvXrmWRcnZjblQcS25yNHSd2fZBlBHSsnHQHh
 zRtuTAdFKOWw7w8tzV6/YGAmwvBSASMcVqTFfI7Zcm8d/mPUPZ15CgDZiqTvCx/4HWoV
 OlJurd6OEgUXdKUoVNzFlkSlo95VJiyU47Jx0rSMcbh58sCPhRhPPxM/hVQCmWWFrjDB
 lrYWYYuYeyI7sdMHPpQBC89bLvuv1nyzMJvtt0KhcPkLwEI1u3YjLMdxjyncP8kmQ8qW
 1Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907734; x=1754512534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XoZsf6gRdluiDWkEnu+z+RV/F7cALktBWlef/NsKBBQ=;
 b=Tb/gWNHd/b3GLKzf5So+WFhjqaAmw7m8RO76gz6zuTYSWxOWIJbzfnVPPEnZ5g472S
 xxne6bnJH9Rji+iM6hzOVB5KsZ0WSy350gAWyXu68GIToyYOpTLyrF174hxFY/34LUkR
 mwGRCEj5nAW0BwAkjgLM0H72fUpHFQZAq/UU+9qIm0r1VspSP/WRt7t3xbREfDIhpDDL
 5tHdNFxdoAXZmoeKBzflJxcw34hMjd19VufojAxHHpY9Fb9g3uoTe3pHvLroHeocks3v
 4xqXedJOu9XTYqSSEuvvMtK6P52s+rIc69GUz4Y+wcYta2eXthZUf0M7Qriu7WpgZxn1
 aBCg==
X-Gm-Message-State: AOJu0Yw80qbWbn5bgtZCMtBiQ3+f0X7xBcDuCPyCP5vLpC5xTwaMihdO
 xgmZD977CmkbsNPFR5M+y75MCVu1D9vkvkgmzByW1vbG3KiRLIaCqIY1k8pDl0JGD74=
X-Gm-Gg: ASbGncuBYqOSTscghFAToAxYPibdPZK04Av0IPsyDl5f74uSgF0m1mHD+XQqId2Es1U
 rCnFhc/0fV+8rZZDvsi9H8N2DQnAXEd8PYd7TGzj7u1A1S4QWrO80rGvk9Xqktz/J+pXcG2QjgL
 a4N0l4oiAXiwHUL3dLXnQxOYPRYbAP9QYj83ct56xxERPGUyJaqasgxeSyyiVehKjj9I72hkNbA
 ogKSPO9dB+Fn8MlvGH2jYFrVj36uLXvp0DBQpIe2/+zvjTuibMHitE5j+DdUhRZSH6kknduFNDJ
 tft3WAu5Uqr0QmoLzkymKyN8svlS9rUGoEz9p6bC1QBD5uPjqIZ2cWoVe+fO8MJX8K68dyG0E5l
 df+LNeLI27BinHYNkY3FjX3ZQ7EanR4tNifBx/4loQMrnkg==
X-Google-Smtp-Source: AGHT+IE/h0tbzIXXdbOzjFCkjfvzj3KrD8cJ9Xr4t1EU6lSabqvWd9Ar6EMuTJzTyIo4AYaEI3Xsxw==
X-Received: by 2002:a05:6a20:1590:b0:230:f847:6586 with SMTP id
 adf61e73a8af0-23dc0e92791mr7246151637.29.1753907733996; 
 Wed, 30 Jul 2025 13:35:33 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-769b53591d3sm5138677b3a.49.2025.07.30.13.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:35:33 -0700 (PDT)
Message-ID: <4ffc8b87-2548-4c59-974a-2ef966e05553@linaro.org>
Date: Wed, 30 Jul 2025 13:35:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/82] target/arm: Fill in HFG[RWI]TR_EL2 bits for Arm v9.5
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-8-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


