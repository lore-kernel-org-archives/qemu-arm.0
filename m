Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7782BC83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 16:47:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubMKo-0007lk-TN; Mon, 14 Jul 2025 12:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubLO4-0001lT-Lq
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 11:46:40 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubLO2-00068o-2x
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 11:46:39 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-742c3d06de3so4870235b3a.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752507996; x=1753112796; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+IDvBEmV+Lzihs6gqqtoeHh/iFwCnyYUNSldXE8MxgI=;
 b=bw/8tKaUFlBPW9jRhBLMlZPsqmXkFdonfKdHfg6QFSosFVRxqu3KZ5C6jlpk6TyYor
 tn6bZc9q0wVU9NRahJwxzb5GBDj53gYwxJ0vvI4jv4wXGuEN8aw3yqgaWOsBKkBCU9jD
 ZoVY8Y06IN9V2gpzArIvy7+EcjFLEd4IdoIQlvdSamtj4ttYGiihQ6/jSvUEo7YGsX2w
 GEX+yqAQec+UBOTs7rQh1WC4oENRImgnAMpUqqsaEyRmsTQ6mYe8kd4frzAknLks4S/i
 fr58rqgIiV7AkCS9HbVzD6drrTAjGXy3uBNIDoqf+SngG9MdJ+bfV2w8WXSuGt91Pir6
 Mslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752507996; x=1753112796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+IDvBEmV+Lzihs6gqqtoeHh/iFwCnyYUNSldXE8MxgI=;
 b=E/DYMWbHXMprDXd/N6Daay91NExzO1FSZi2xbTPD7r6+K9vhAXLXXADDz1pTKSYFwZ
 VOBIAHjtSXgMj6OUCKY0d9hSEH44utUWW0uVVuJRKBQz3y/wkjRmJEIOFLPA/UXY4ofq
 QaEgJ/OWHtY8pr9xNNdWoofWQu38ySDWGKL1x5rC8j7vhsreQaSqiDTuOI/OdbrbbMb0
 jUs4j0OHB1j4aZSjk5RFBjWL3LEgSPqmKZKQk4LY0LLowkIlXra2DC1cYlgn1fFHBvgW
 FOerNtbxGgvaOHQeL3wC1rEUA+FeeOKX5zY0J12L40iGVcHrnobXxtz7okdNe/xESlFL
 WbyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkbacLQqB/L07fbwsp3VWYSCrB1zo1flRlYjrW2W0CBfh5hLvGBRol1x0c/jmrCMgffFpeddSkBg==@nongnu.org
X-Gm-Message-State: AOJu0YzbXWIN18h7MhpqC0CR34+XEh/K1CVX62qv4UjJGYNWQcBj0s5t
 MO5x698URPlNM0gWlrtVoFledMP2/8VkxPAqz1rSN5t+/60YIfw37sIo5sS0Zs/B3vTI+XSANzg
 VQeg9
X-Gm-Gg: ASbGncvAkoh32p0luQpBiGCRcQnTRe9HV2UxbKxOAvAaIE+WOA1ynGtvpYUYm+StFGU
 s1GENPIgfL7turLtFhNw+x++Yqw4g/DcT0JRbqD5WD9H/MDUEehq/njd8r6aexaRND8xQ0iWAGn
 BX96VOxft2Aaqo9DYyYTOdyPSTZF62J1ZWfUK5DWLZ+qKKXZfb0gWGoJVCR3BFE21KGXBVTn8l6
 stYLV6fbxvutJBFpoYET8ORgx7dXV0ZZ1NUj3chH9BYB/DYNgv3D70jJqlhEfLwScovBGFGMUBI
 pLjwakSNQJRv9IAJOc+95ZQzaa7FDjMWq+b4CuF1q4e8d7nD/5CbkgBE5ZqIrzSpKCPR2d2uDgJ
 Iqi49VzYHm+9Lmoj67ihEh6fsnL8M9sYL+RttYU1GiKcsXw==
X-Google-Smtp-Source: AGHT+IGg8P/it84LX/wj/a8NB7leTLCQbehdmwijsf3a1Vwrhji4eSM4vSncTNX7gSMgk22Cy3IPCg==
X-Received: by 2002:a05:6a00:2352:b0:740:9e87:9625 with SMTP id
 d2e1a72fcca58-74ee04ade9cmr21578864b3a.4.1752507995641; 
 Mon, 14 Jul 2025 08:46:35 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4cb57sm10995934b3a.136.2025.07.14.08.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 08:46:35 -0700 (PDT)
Message-ID: <eabfd320-5efd-4a0a-807e-10aca82ca27b@linaro.org>
Date: Mon, 14 Jul 2025 08:46:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] target/arm: Add FEAT_TCR2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20250711140828.1714666-1-gustavo.romero@linaro.org>
 <20250711140828.1714666-5-gustavo.romero@linaro.org>
 <21bfbfaa-f0df-413d-bad6-b69688ac381a@linaro.org>
 <65e20340-e164-4424-bc60-52d78b9a17b8@linaro.org>
 <f18a652e-b64c-4a33-bd60-63dfa93ffdbd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f18a652e-b64c-4a33-bd60-63dfa93ffdbd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42c.google.com
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

On 7/14/25 5:58 AM, Richard Henderson wrote:
> On 7/14/25 00:21, Pierrick Bouvier wrote:
>> On 7/13/25 2:59 PM, Richard Henderson wrote:
>>> On 7/11/25 08:08, Gustavo Romero wrote:
>>>> Add FEAT_TCR2, which introduces the TCR2_EL1 and TCR2_EL2 registers.
>>>> These registers are extensions of the TCR_ELx registers and provide
>>>> top-level control of the EL10 and EL20 translation regimes.
>>>>
>>>> Since the bits in these registers depend on other CPU features, and only
>>>> FEAT_MEC is supported at the moment, the FEAT_TCR2 only implements the
>>>> AMEC bits for now.
>>>>
>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> This causes a regression in tests/functional/test_aarch64_device_passthrough.py, by
>>> continually trapping on an access to TCR2_EL1 while the HCRX_EL2 enable bit is not set.
>>>
>>> Unlike the similar SCTRL2 failure, it's not 100% clear to me how the guest and nested
>>> guest kernels are related.  But it is clear that the outer kernel does not does not
>>> support TCR2_EL1 (and also doesn't manipulate ID_AA64MMFR3_EL1 to hide FEAT_TCR2), but the
>>> nested guest kernel does support TCR2_EL1.
>>>
>>
>> The same kernel is used for host and guest.
>> Maybe it's related to kvm support?
> 
> Oops, no, the patch fails to enable HCRX_TCR2EN in hcrx_write or SCR_TCR2EN in scr_write.
> The same is true for the previous patch with HCRX_SCTLR2EN and SCR_SCTLR2EN.
> 

Thanks for the investigation. Indeed, building TF-A with 
ENABLE_FEAT_TCR2 and ENABLE_FEAT_SCTRL2 didn't change anything.

It's possible that it's still needed to update test images though, so 
I'll try when Gustavo will post v8.

Thanks,
Pierrick

> 
> r~


