Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47276D29C2D
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 14:10:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhpwp-00063N-06; Mon, 19 Jan 2026 09:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhpwm-00062E-TD
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 09:09:37 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhpwk-000758-GZ
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 09:09:36 -0500
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo35005415e9.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768831773; x=1769436573; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwKIh8LIEad7aH6Tqt5/QHLConUDcBI4y2gsj9RRJfA=;
 b=TuZILqF997+21e8wY+7NaeYDBOAIom7o1KwhqZMIvl9My6aQsne2Fm0FOSSeVzNGvm
 WsRpim479MV+LGWBeBZ2XFcVuchM6rJNDWluTX309dljUnQBGwcqxDdRWbVw7KjCiiwi
 f1cOX8muoBoAEmOhh6uB1PEmPBTpg+ZI21XxUxFUjHg0QaVVyca9s8IfM2F61rTSfDDM
 iEMMSsheKCeGcq9AzFVAGmrnEvJgluleyQ61IV7RPSBEZm2DG4VFRwYShBQX1YEFhKOB
 pnnPAk0LSWFSVBAN+sR19Ly6JV3conTyoI535WdHAcbDssqWtZn7Mqr8DZeoUv3+FXW+
 dN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768831773; x=1769436573;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IwKIh8LIEad7aH6Tqt5/QHLConUDcBI4y2gsj9RRJfA=;
 b=IRt76/BLgpFC+okLdfg7cVJaTdADyEuMIXP9spUeS7zxvNrFtX6PqeGeSchkfNoUWA
 YlPKGdwjSMYRXjYPTfAywC1FKALjsbC8Wc36z9nWUu9Mnc9SEv/AQahfscELoQ5tsZ/J
 WWI9s3Y+V2aLZedFoICLbmS6iQyud4mZyRIveyUqw85AWunsIwAPqufNC1tTyM4i9+WR
 6QtWZb7Ns0L7QhP9jypXRpqhDHPOyRPKV8XRSgYVm2VoUvfl6yr+se2FrtvyFkW9crDO
 ALkXGaujia/QdRGT/jQEh4qXypIy5VsdIZ4astAVmF+6IQjmcWNbRsQ7OL/x46/3pK78
 4rJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM6laTDCJzZAyaa0SIjKp0drDdUNXulBqrKAFjfBEU3Z4irheV4PbpLl2/QnXrZhYLXoecYhvFbQ==@nongnu.org
X-Gm-Message-State: AOJu0YzSBZoHY8i/Y0BQLXUktrV5tuhfoEAWnbTa6V9J0wkq865lz5dX
 MfA2LLp1+cg9BC7ibTxKU7NnWvKrgm2JP+uk1ChCjAqw7tb3vCmOQEcMyDevaKjCmhs=
X-Gm-Gg: AY/fxX6E0stC6qgJ/1i4ZriM0IvG5xLbADvxJ5zmAzPMRFfPfMI5kltaHd+NrV/F7XM
 tqg/6Gg+OotglflEp5qvLGvBdBxQW3RMybnvMm/gJUvXgs3R8tRJqwcu0c3pX2a2/FqZHVZdqXi
 Sdhustg/cy58VnWW6RAhMs7l+0FVygqS4yb6IYTi9LPB/+LEFtqCmNEbdK0Cv1ePJsLbt/xgRkr
 RARvaErjwoS2MrsbO4Qs8q2J5taPLCQ+ykMXI4aZJPWd3RVgb5PJRkLrTdS6HNfbYSS3TktPdpo
 OX6BPpy8SUHucuBFqQRwRf6sxnVGg2N66YGje8B2hWAl0OtYfzk2+NLhkbRhycNaKxKE1MzuSJe
 L3zKIbrd9pS8/a8b/lOPPiQsGidI3dNjkWXlBUfHZ2IQQiRTwBePLoFTG+2/uJ6EpYi4u81pWCQ
 UEAQBrQw+zp4ziwM+44PKsvSWqjdTDMNaQK77HXvH0JJRB+xDEgJBsXaVcm875hc9Z
X-Received: by 2002:a05:600c:310c:b0:47e:e20e:bbb2 with SMTP id
 5b1f17b1804b1-4801eaadcc0mr133159705e9.7.1768831772723; 
 Mon, 19 Jan 2026 06:09:32 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe47dddsm81031305e9.13.2026.01.19.06.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 06:09:32 -0800 (PST)
Message-ID: <82fd0099-8041-43c2-9c4e-94c9f0398fac@linaro.org>
Date: Mon, 19 Jan 2026 15:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 0/7] hw/misc: Introduce a generalized IOMMU test framework
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, eric.auger@redhat.com,
 Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <6d50c3fe-e235-48e8-b461-fe0689f12070@phytium.com.cn>
 <9fba7ded-d31d-4789-b83d-efcc96f5448e@linaro.org>
 <10e1b40c-2edd-400f-8c8e-e0f3ad4c6f75@redhat.com>
 <7881bfff-59f0-496f-967e-32a697ff11fb@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7881bfff-59f0-496f-967e-32a697ff11fb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x344.google.com
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

On 15/1/26 21:56, Pierrick Bouvier wrote:
> On 1/15/26 9:47 AM, Eric Auger wrote:
>> Hi Pierrick,
>>
>> On 1/15/26 12:39 AM, Pierrick Bouvier wrote:
>>> On 1/14/26 5:30 AM, Tao Tang wrote:
>>>>
>>>> A gentle ping on this series. Any further suggestions would be greatly
>>>> appreciated.
>>>>
>>>>
>>>> Link:
>>>>
>>>> https://lore.kernel.org/qemu-devel/20251224034647.2596434-1- 
>>>> tangtao1634@phytium.com.cn/
>>>>
>>>>
>>>>
>>>> Best regards,
>>>>
>>>> Tao
>>>>
>>> This version is in good shape and is ready to be merged.
>>> Eric, do you feel like merging it, or would you prefer someone else to
>>> pick it up?
>>
>> Peter generally sends the PRs for the vSMMU. Maybe this can also be
>> taken by qtests maintainers too.
>>
>> Thanks
>>
>> Eric
>>>
>>> Regards,
>>> Pierrick
>>>
>>
> 
> Ok, thanks.
> We really need to help Tao to get this in, as it's really useful and he 
> put a lot of effort into it, and waiting times between two reviews makes 
> it probably a bit complicated for him.

Since this series subject starts with 'hw/misc:' I'll queue it via
my hw-misc tree, thanks all!


