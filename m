Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDAECCD1AB
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Oct 2025 18:55:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBdzU-0007Ys-Tz; Wed, 22 Oct 2025 14:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBdzT-0007Yb-Dp
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 14:55:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBdzR-0005Fl-LG
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 14:55:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso6736032f8f.0
 for <qemu-arm@nongnu.org>; Wed, 22 Oct 2025 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761159315; x=1761764115; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QGkHgFHWO0U4DFQBXgyqF0iZP7bVTfnDWioQ3Y6m0Ac=;
 b=bgucnWy7AKa+hRE7YhD8DjzDPhAH0v3G6wsaPo9W1JV2vd94Idu3Bh9+mCOlixHbvb
 LXwWGDva49+iZqnR4tj1OkbrsgAVFRAOMBIJNF/Z5NwTXbUPF5FcvKOPNGDfedelFTW+
 rGAif/QSqXvaE7aaI2FeQanYsjz41yBTfXAFCjHnRpwm0P34jWm0Pn/IXKgBOVdyu3cb
 qwzBsrr9xXOThzGA/OELWowv9S+q8vqLmhnqnmuc4rW9XjoXHxcPzS0hY26XKweL9lV7
 n884rqVuVTPO91IFpOw2cVty+A+6DlOThiaGxtg/nH3w2GONCLfwntVcpuRfKAb3Cfq4
 xhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761159315; x=1761764115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QGkHgFHWO0U4DFQBXgyqF0iZP7bVTfnDWioQ3Y6m0Ac=;
 b=BShsqddfNi8wu1oO9dmnFV69I5Qe/R5wpIfxbxThOLmEhBVrKrvXmSiis1hMT0e2q0
 ba5B6LclhA1XXB19Uu49GAjOllbFhNM1LC6lgfTENs0JOyvZ3wysaIqHkEx6v907EIhV
 Le72WKJ2aXAefXYe6OsZpwqMafpFJaCbpQzw1R2/3jgVclOG2T6iWp+uGAvDokYv83U9
 DNd6aS82uvwc+UyrR/RPl5y8oLGAoRLANtb0ZB10gIQ9CqVtS68lMlsu0avVFmGbtCPY
 xQ4IC9w781sHPIISN6ythiv0qvEFd1CRFuWXuLv+4aoV5ZW5N9zVOcdA2xw3KUW+YCMs
 Oo8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCIBiUq4iRvQMsXm0ppU40FbYMaYd0NzP8WoBCgh8Cbagrz1qzHK/X1o9/txPKEfZUJe2xumqWyw==@nongnu.org
X-Gm-Message-State: AOJu0Yx3qCnmxbdmtacg++kaUXGU1mccXl3r6FLWYqwB0SUgPEnZMWdx
 DA+tjC4KTgto3Jkc5BkutsCaCMDLXVEIbEc60fZASB9Mwp6Tols93HTjWUf9kHL4R5U=
X-Gm-Gg: ASbGncsJO7qgZHrkujYjrqizz4k3pmU7X+c/yvpiKOJKTKxPN/AoNRBQSdcZxxAljRn
 3Tba/PFwf8whVP3Lv94e7RaCXtJa1T/+YWbNvUFXeCKbm+5JLkGMdLbSyFBzierb7D8gqXLrqu4
 saN0wH3BoUlO2Uis5oglGwU2cG6DUKJVmZoznoCsOkeN6oFJhfkb5bl0EEkogj1KOy20ZradRQC
 nXE6HZJvCQY4+tfDzjdcFYaPx4QU74NOSuZFq+Juf+6IwxgUmvpvfdqwvsLzxMvMuhS2B49ezdt
 ST30DrQ5kUvZC/PdgKAMhCRzDjVKtnLyZgBfr5fKeVVdlslOVhMsbXevq5VYr6WtZIcCTmqkP7a
 WJVXkjkqacUL81ZsoQBaZEhCmj78mY7mmrEuixWQIPotXAPtCpVJ/673yqcxO+om+gySkSsRfhN
 KBXmW7PvOKji7tI0XMF40PMMCmT/zWZKGVEzLQd2yvxkc=
X-Google-Smtp-Source: AGHT+IFYXDlLQ7YP0z8og7q6VrFv/s7meAZcL3aZjFzVSsJLj81XC/yv3vsS1AASm9CKvPhjtxR4XQ==
X-Received: by 2002:a05:6000:1a8e:b0:427:60d:c505 with SMTP id
 ffacd0b85a97d-427060dc6eamr14277953f8f.15.1761159314792; 
 Wed, 22 Oct 2025 11:55:14 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a0f88sm25419514f8f.7.2025.10.22.11.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 11:55:14 -0700 (PDT)
Message-ID: <5930e266-cd3a-4ce9-94dc-2849d5c7c18d@linaro.org>
Date: Wed, 22 Oct 2025 20:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/24] whpx: copy over memory management logic from hvf
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Eduardo Habkost <eduardo@habkost.net>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20251016165520.62532-1-mohamed@unpredictable.fr>
 <20251016165520.62532-14-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251016165520.62532-14-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 16/10/25 18:55, Mohamed Mediouni wrote:
> This allows edk2 to work, although u-boot is still not functional.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   accel/whpx/whpx-common.c | 201 ++++++++++++++++++++++++++++-----------
>   1 file changed, 147 insertions(+), 54 deletions(-)

Is migration working with this code? AFAICT it isn't with HVF.

