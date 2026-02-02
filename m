Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B31D172CD
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 05:13:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmmFh-0004RU-0M; Mon, 02 Feb 2026 00:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vmmFf-0004RD-M9
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 00:13:31 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vmmFe-0006k7-9b
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 00:13:31 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-81ed3e6b8e3so2088360b3a.2
 for <qemu-arm@nongnu.org>; Sun, 01 Feb 2026 21:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770009208; x=1770614008; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/CP93sbgwSQKBkVmzDLhTvhoWlFzefumm9AtgO+euDo=;
 b=h0AzA9Mp1HQAj9tD878ezQTpmfAlPbesr+cEwjoTQnBzGueS2pfSUYkznRnTuO0LKb
 lC3jIFiIgnB3R9g1G0DiHp/Uim15VObVCC2vT73xNiGieS2VDrWTVLNCK2jquROjOAN5
 8TckG5nrlCg/4J2yihYtViYugamolgBlP/7prby6gntkqmtCd2GF2UCJFV54zi/2qhqf
 RDiKm8McFfaa0nwClainyvcjQGA4AvHD62P/x+TUoIjgmtAYg1/IAQeNHSrwZm44wf+9
 O6IIZ3SDVRU3KHr79OHI2mcIFJu+qxtlg+CdQRP0vfZGTimWF3GNMpZPVulK8f1IImHi
 SuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770009208; x=1770614008;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/CP93sbgwSQKBkVmzDLhTvhoWlFzefumm9AtgO+euDo=;
 b=mKaP7yFoVoOef9C0aJ89BCbwbULbbTWhZuYsvd24dbtm2FV8JVJG9pDUZuEqaYI5Ya
 hz/88qa2qQnTz9MKdoEhjDZicabF9zU2/Ax9m0RdUhNdyV2+IaIobsNzgWBDBZPt+uO5
 VIwme07ibh9VnA9m1PpD6BWcZ8HV3N+/bi8DrtK5DIj2CS91RJn8WQJzG31yf7T5pOM1
 EH86yxUD+XGf9bwEbmuBpVluM8mgf6oMLXtrGSYF9ak/enxH16Nxd68wtiF+lODlmTAv
 huSC/sYjDlw75ZWpLULgGVM6TLf7QrZUatKQlm63Wn7BC8NzJA7714+kE2+RAT3e24uo
 bX7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk9M0ePgw+ApGvlkLBQmyAtRqSlRBzBBa3NQ1FKGrW2B6K6PyfoqZ3UGY3BdeqDqoWI5lbu2W3TQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw5kt4hkqt0KMctHIuWMdQG+w83gbyY4Ph+Dco5vOQinlo3fjoU
 43dPnBQ2AVg5FMxLonpdQXUb6U2BAVZQr8j+Kx/tUSCN0qmS8YGKCtiBc3ZszUKLgFpIHVnQbEB
 dpqF978Y=
X-Gm-Gg: AZuq6aJWNnH88PtntOOeeUYm3KfMuUQQultCQ+PJcrIxhYoQF0kJWATiL6kHcSCDbZa
 RZN0hA2/dpQIBb7wqoTf/fbESeq8VcYbQGwSKsJZMKLVDMOKXQaw3ojGiL3d0KSXNbrNAp1Wyq7
 LjnPu7FEKdn2TULRYeYyxwxfD0l/AJZVb9tcsfRNs7l/4Ulw6mYhrMqCJip2adrs67Z0fqumbyG
 45r4va4blAac8ZeOnQo+bXDnZ8jKWXViUASsHj9f693mhwqmxJkdBjXkFApfimA0eiVSttJvhsl
 lXqQRCKJ6Of6KaVA54wWmg0pcab24DS7htaWn3VDDv/10OsQjY197YamJgVSwFWJrj3pNFoHFSW
 pwOPkUS3+3dOmkC8jBT0nhczdODPJFQZpM0SXtKb1hIw+4gKCGbD4Ocu6GRbd1kd0Wnj77S1YBW
 zdp6x96uqPF7k5h1fH9IL9d5niiBA16KePgJWcSc9gyOM9j6/rsGnSalFYQyjpW1ScDyoxn/epv
 8cbDVhz5iY3BJSHdvKez74cqXS2Smt2NUDOlfiq2g==
X-Received: by 2002:a05:6a00:4ac2:b0:823:b1f:893a with SMTP id
 d2e1a72fcca58-823ab755ccdmr7961796b3a.48.1770009207848; 
 Sun, 01 Feb 2026 21:13:27 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:e524:51ca:ff85:53b9?
 (bg30dj08q4s9ql12qb2z.ip6.superloop.au.
 [2401:d002:dc0f:2100:e524:51ca:ff85:53b9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c22459sm13941136b3a.48.2026.02.01.21.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 21:13:27 -0800 (PST)
Message-ID: <3f9d35c9-1982-49dd-9023-49b4f12036d1@linaro.org>
Date: Mon, 2 Feb 2026 15:13:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Deprecate '-cpu any'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, devel@lists.libvirt.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260129134849.36557-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260129134849.36557-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 1/29/26 23:48, Philippe Mathieu-Daudé wrote:
> Arm '-cpu any' is aliased to '-cpu max' since more than
> 5 years. Deprecate the former in preparation of removal.
> 
> Philippe Mathieu-Daudé (2):
>    target/arm: Remove dead code
>    target/arm: Deprecate '-cpu any' (remplaced by '-cpu max')
> 
>   docs/about/deprecated.rst | 8 ++++++++
>   target/arm/cpu.c          | 1 +
>   target/arm/tcg/cpu32.c    | 3 ---
>   3 files changed, 9 insertions(+), 3 deletions(-)
> 


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

