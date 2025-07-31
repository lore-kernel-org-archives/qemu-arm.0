Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A174C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbM8-00006v-5s; Thu, 31 Jul 2025 18:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbFO-0004P3-2w
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:55:35 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbFM-0003kx-MM
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:55:33 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-748feca4a61so156488b3a.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753998931; x=1754603731; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VkwhlzMWv2xIDFjhPhSqjrikQhELMdOISOjf/yTpLzQ=;
 b=M431i3AyEk9adXFmbAXAYIOaFeC3IZ2a3aqPwtGexvYebvUCBnh9Zg7mnMtuQ1gNXW
 pfXR9eqvBgk88ZayvkK/zFL4Oustt9Nww5HqFfQhbVUP0OyE4Ra7vsn4hPItdD6xgToO
 Urdyz/XNraNz+W4Y0wCxP3SnSwrkTqVNf/EyNEzXvQSrxU+MpZav4lZsYs78buwzq7jJ
 eHeimW5eX/FK0NpcL1kH9horDP3BHadfZuzwAKivbzze434upCuyo2pIMXFIIflL7oft
 ZLUSP3I42N6giu6RvHe/IghnEgBAzSekmrafivpYQGIA6lIh7GUVF+Uh98+nu/JjRHv8
 98NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998931; x=1754603731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VkwhlzMWv2xIDFjhPhSqjrikQhELMdOISOjf/yTpLzQ=;
 b=OiG7B3eMuTgZQMd9U+p1IjD76ip3YG+2LsRLpszB9pYgU1yQpb96tSfr3X1PzCtFBR
 eKkpIUCKUH8GGpXYz8WZfOsQA28wL8mHTNNFY9A2G/V/CeOzENzCpNHQEYX1LckB7MuU
 7EoVAQvmfVj9frQbX4GANvwz0fnbAD/GECu0NlJc42usyazRgZikjF7i0TUO7G4qSDsj
 bkiGuIOdJcJYYCH+w/58WbN4gpof03btkRsg1PEp4w/Pe5n7P+C/8h01qOrKN2OY4QnF
 Hb8ODtPIzTYf7zmL8MeNFYFNqOIdP1CmkE1xtPh5WoTSxNghShEFwTtHjosdMWO94eCu
 NpSQ==
X-Gm-Message-State: AOJu0YxH9LWM0WY11X9vgt38ic/xhVKQ7QtnDvR+XRUDrF2cITbQvSar
 qYVM62Ph9fEXTeuvJXfaMvzGKIReeUJH3Vk7kKUsOhdhpyTA+svMUOgWGSQndBWJ5TQ=
X-Gm-Gg: ASbGnctlsY0nyZQeF0+c3hAa9hZNKJWNy3H2IN8E1PtVF0AIOy1CrDnfMKYP58yDDnf
 flTSFsJemNMnzmcdq3sv0xTSi/z8qyTYM0MzovmFCaEd/cISeT3BCbi4m9AOPhyn5oKftrYKXku
 Q+p/btahYK+Mryqf6u0ZBaIFbvs1h0uoHE+uVyNuFOSTh09iBFUobRFcdTmo6N3hlbJ0dbmMOK7
 8YqLKRWtUDta6Fmm9OszWPOrraNRKmnSm4jreKhgSjvlHC3iJgVF/55isdizV10CqpRHpffAGGo
 KYffNvHkXS4SL4PmQIYRK1KKAF818DHQYATKLC2cHQV2OyGX5fsGigxGp+iLCQcUvpHcyD4CRV0
 5njh+Vzw/ZpeykvY6Bs4RDnBp8/aqr3J/PZE=
X-Google-Smtp-Source: AGHT+IE8elHVyuSE1JoCLIccW7VssLdM4k0nnyL6qmQXKXtccvo2oQ+fQoLui7HdbD4wlxg57IW4kg==
X-Received: by 2002:a05:6a00:188d:b0:76b:ca98:fab4 with SMTP id
 d2e1a72fcca58-76bca98fd98mr4949892b3a.2.1753998931117; 
 Thu, 31 Jul 2025 14:55:31 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce8de34sm2501348b3a.30.2025.07.31.14.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:55:30 -0700 (PDT)
Message-ID: <d89b54e7-0217-4933-9ec6-18dedbf27b8f@linaro.org>
Date: Thu, 31 Jul 2025 14:55:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 74/82] linux-user/aarch64: Implement map_shadow_stack
 syscall
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-75-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-75-richard.henderson@linaro.org>
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


