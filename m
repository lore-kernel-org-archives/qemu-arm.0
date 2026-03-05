Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5229CF3D337
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 17:13:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyCGA-00075T-8y; Thu, 05 Mar 2026 12:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyCG7-00070x-Am
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:13:11 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyCG4-0005Gy-Uh
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:13:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso69354805e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772730787; x=1773335587; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQJKnrKBr/qCTBG6h8cPSxvQwOqA7c4eTumxR9zdYnM=;
 b=Jjr3Uqu+OtYEMTAiW5OGlcPlLig2MFdL3YGBhvRngMt2iv75Y8SaJTgDIJ/iHhstBu
 9NcmWV+0DajLu0ZMLWqMtCUc3Myp+/mzvKZJDyvB8Vg1+7YY8rJ+G231ckDIXAWhXfK9
 kfnssevyi9B3ZD5Kbmd9JDsMhujxJXyH84/i+BLkUxawu6RCtzAHtXbImKTdeb4TC3MC
 VmqBdsyW6fUU1phVjexJrlG491lC0p/MHfMQQA2bdnXsA+zXj3XR0sl5hFam/kusenxt
 qjHNyIZNr9XvYks+NJ+6uF7hghi8moILcY40HbR73Yq1C4yGknEtHuZoVlFxOiSWQz2l
 dx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772730787; x=1773335587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQJKnrKBr/qCTBG6h8cPSxvQwOqA7c4eTumxR9zdYnM=;
 b=J1eMyjOGx3QVdUBSTV8XEoMOzS1m44+wJc+8bpYtZOV3ets78DxXFmxSWXPvNacUPX
 f9qGc98S3DRTtOJKFIfxF5rh+0K0nX+4EdjmdACYZoZ3DJpBHUx5fQRpz61iySXXCPFD
 8sGxWmveCPCSt3+gqUdy05/D6DuAsLJhAogZbk0eXPF6YVD+5ihOzNMTXGYo9fHYPbLI
 qN0Z3GlPaxzD/zTZIhO4eu+sodiHQG4hxAv5q54SyIuMxkINztE5iWVFobUbqs6oaAsO
 UQMECzr/g3uqdO9Z+kFAg7i5S4C9LyKKOooqXmUOkQGQ1xngQLpnGb0Fybr32jK8jBfD
 3aOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXHiTLVVM+yKd+5MU8eBVH6xeCPlxWg9kOzbOpUIV6u8RW0u2SuJ+CyF/BqVV1D86js6/vOn4v9A==@nongnu.org
X-Gm-Message-State: AOJu0YyVepFL5OXekqTLLE3mYNsbPMIXo7p4/S08uVkAgzn1cdFcetyc
 le6sEHn3HVNh4JmUYVwKFUUJvy+UtgCwLaUz9zqxZrJ4J/m4Gmy2NzsucopHtbmB4H8=
X-Gm-Gg: ATEYQzxAf7vGlWi/txgFOhgD0UbAqmzniPz5JvrSSIEBT5H1gZiQ4j8pfeSWvLNk6Nu
 Rs9SGHXQINJrdeXZTwhe8/0yB7fANWOFbnJopQibSGFnjU81Sxs5NaxQ/yXVLKa6xXHDJZVGTNq
 2gMp0pL8twKj9H2dy1QIiEFjomKKkMbL9BoeCXpm2+bvl5enrJcyBKUeXc2sgI0ymxrjYVkzxJS
 8LUPoK6VMRURF/Ve3TPjK+Jp/VS116GgTtPDjEZCrKz5Pg0x85d6NBi2bb1dckXXS9RLGiA2ghD
 ecSdZohPmz742vxDi1bpPcuu+OR2G7kZo46eNV/MV0CRFWfdjgFpACCFrepjXj5xv7o1TzXIArb
 tfyNmbZGpcF99w/QVKFjpgtY9/6Ftni3sxXcAx9pmIIrL3pBikNUcO9ROFt/zYj3/Q8deJa1fmw
 uwtxTBqrB3QsUKHM7WIkOjtEjfYwoYdTOo+HevDp0NwLQxGEuJh9eLkDbRIlRS48WzDw==
X-Received: by 2002:a05:600c:1989:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-485235aec61mr3432845e9.12.1772730787172; 
 Thu, 05 Mar 2026 09:13:07 -0800 (PST)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fafe4c9sm66473635e9.15.2026.03.05.09.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 09:13:06 -0800 (PST)
Message-ID: <4f425829-4a4b-4fad-93c4-4eee8584f594@linaro.org>
Date: Thu, 5 Mar 2026 18:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/12] hvf: enable nested virtualisation support
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-13-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-13-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

