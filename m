Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8CAFD45F8
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 22:08:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvN30-0005WN-51; Wed, 25 Feb 2026 17:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvN2y-0005Uw-Qw
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:07:56 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvN2v-0000Wy-QR
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 17:07:56 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so752895ad.1
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 14:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772057272; x=1772662072; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=wXU0zE+15gSNKLFft01LXDI8U348u1g3Zoknf2Iw9jc=;
 b=BCCau0aOZnBLRJD4bmAFX9VUR7OXpFF0kW8TUm2jCyHvoLhCn3ufcxSAN12TsZelKs
 lNvWrT5Zi7fNs9YuhRaO52FCUv4IopfcK89RWOxYL/EQJcHnA5wIXBHsHh65/QnnkJlJ
 uTOlabw0eu9tSEAKl3s6QrUqpJyDnORhYnJvfOkWoFO6SgH+YgFqG8r6S7EuOPrP3pv6
 xg3Lw06PaQCRkgDaQCFOap6NJmjV9a+zDYdEdMXBgWAi3sdvx6gukTgs4UvQ8MpXHoq3
 pnrdHWKA67MlsRESoFGXK/4+aQam9/UIRqwbSD/CBSbxYGNKVpnGkO6pAA2m+IKYlUgF
 OZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772057272; x=1772662072;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXU0zE+15gSNKLFft01LXDI8U348u1g3Zoknf2Iw9jc=;
 b=IRTOUZeEA7ZZ6E3yCYd23wCMz9YF9b6GrRvyepcHIyiQr+2TFWSz3/gcctdd5rJ6ym
 kg9G91Qkrf9YE1hz2Z+CcW1YAkooN873szexomxubyP0KYoh9rTOzd1XxQ7qKlAgloEU
 dTub2ff1zk7WZ3uF9Zkuh8VYkdGs8skx0Cqmi18XydezhEfyo6BL57VrMYAOJ5n08T+M
 WujmVr9URAPaDvhl6mNaKw3rEQV/Qx4puNFkY6DkawLpm22cgxav6xUOjHIhJ4CO2EF8
 8CDo9xGRd6rtSa/2RsTKOG4KIKudMb4izQ2BMjSxAMJxBqfCSDLuEoHq0zNfzWX03tb5
 S85A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9RHG1RK3NlJfxQC0PfiOKc9VzBRpxliFHy9jZCuZXBoXDWRV0ViDyRnN/0itl6QMIylALOmBiJw==@nongnu.org
X-Gm-Message-State: AOJu0Ywsc02a8h0qKReAT4BpZrv8zI6cVMCVjEYVEH8eG5gDvCgQsLCX
 rL2Plz86E8vH8tkQuSli95JV5/0VXsWn9sTyXGeU1Ql4bo3+Rzuh/+GQhZzm1SK6VW4=
X-Gm-Gg: ATEYQzyrgtQBnJW8oXuBI6dMKvmI/KykNapuhfXTa9KrfXs7NfcXMcAKusJW3NqX5JW
 sC9HeHo7Q5+AcC6F6D0c+HdKK8B5NwOrLm9DMK1dAuPy7jvOV22rfxzjvjmRJzC5+WjsTEb6A+e
 CDqKtrOexnT8W/Brsc8w9Sqhcp/PMTg0B3ULGOqkltpwKeb4ZDMd1nw/xCfrBEHj4Wswf6+nfQz
 3ZmfOcdLS8GA69HhnqkeQCAE9Np5tywY4rfaTwfpQSK7DPDcl8nUFfNaNA21NI3HbUpHF894qIk
 /KMWuhkw5VC083nJdeJM2KDN5XJrBvPdh5x2MfV23O8pJEPUeO6kgzV0082uwHLqJqXNUVTLMSC
 UQLOcoPqgCrIc2zGzy9S2gxmJk5clFqZNE9ttcexlzvv6AaQQgm3ES4mFyjslv535DMMohPZeD5
 wN59E/aYDYlntMbU8ggsu4tmDLOqyDQyZ1wr//udTz3BXMCK846am/NiZgi479wI4kJWvl
X-Received: by 2002:a17:902:cf4a:b0:2ad:bd4c:9d with SMTP id
 d9443c01a7336-2adbd4c04damr59934025ad.3.1772057272207; 
 Wed, 25 Feb 2026 14:07:52 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b148bsm2792955ad.10.2026.02.25.14.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 14:07:51 -0800 (PST)
Message-ID: <abfeb596-459a-466a-9c25-a613a899b623@linaro.org>
Date: Wed, 25 Feb 2026 14:07:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 31/31] [NOT-MERGE] hw/arm/smmuv3: temporarily enable SEL2
 bit and sone other features
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101933.2998060-1-tangtao1634@phytium.com.cn>
 <36f2aa40-1b01-4cb8-8546-06d9e770b30b@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <36f2aa40-1b01-4cb8-8546-06d9e770b30b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

On 2/25/26 1:31 PM, Pierrick Bouvier wrote:
> On 2/21/26 2:19 AM, Tao Tang wrote:
>> Temporarily:
>> - enable S_IDR1.SEL2,
>> - change AIDR to 0x2 to indicate SMMUv3.2,
>> - use smaller SID size and Cmd/Evt queue size.
>>
>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>> ---
>>    hw/arm/smmuv3.c                | 3 ++-
>>    include/hw/arm/smmuv3-common.h | 6 +++---
>>    2 files changed, 5 insertions(+), 4 deletions(-)
>>
> 
> I have been able to boot hafnium with:
> - instructions at
> https://hnusdr.github.io/2025/08/09/Test-Secure-SMMU-with-Hafnium-ENG/
> - the current patch
> - qemu-system-aarch64 -global arm-smmuv3.secure-impl=on ...
> 
> In case someone else wants to reproduce this easily:
> 
> ```
> git clone https://github.com/p-b-o/qemu-linux-stack
> cd qemu-linux-stack
> git checkout optee-secure-smmu
> ./build.sh # only requires podman and qemu-user-static
> ./run.sh /path/to/qemu-system-aarch64
> ```
> 
> Tested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

If we could have a device access directly from optee, it could be used 
to exercise secure translation as well.
However, I'm not really sure it's how optee is supposed to be used, and 
it has very limited hardware support and abstractions.

