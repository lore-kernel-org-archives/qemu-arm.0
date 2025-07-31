Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20544C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:34:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhauK-0001Zu-UY; Thu, 31 Jul 2025 17:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaY5-0002ZE-A7
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:10:49 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaY3-0004st-CL
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:10:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso13494895ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753996246; x=1754601046; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bb7D9Lxegq02kvTykJdq3EA4Q6S0rk+CHbkli87raZ4=;
 b=fHs9kL6vJOG67kiBLkJOa+dgDRoiIPkQ4VfBqlKoOTTTlddSAFclyz1ppf3bJSCcaN
 iwieKXZfGNHxSxeB4/Q7AhsnXVLhbLjsgPJw2gijOPn8izAuQTocbCVGRHIBLCVD+sQX
 P6Q5w2flvM4C3rCbr0gXJ9dLdDPX1ZCiGqqRl2nQuaUUXcoh0AVz5ma/bcm6XGO5KD38
 qb7Uqz+WyCywIll8DGqm39CkHp9syOayPW+HAy8YI/F2Sl2a9sFGz3kHdB4dxqMKVvXP
 D2i6asAQaXiB/IuG2PFTV8RezjZVpll6jjlg+VIDCROa0Xk3nJ5C21uc+8oCSoTWIZS6
 OMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753996246; x=1754601046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bb7D9Lxegq02kvTykJdq3EA4Q6S0rk+CHbkli87raZ4=;
 b=dgn+cC9tNPnEJWa7F2cY80G51+UhHRJ6Iw+1AV16sAcwUL8Gfju7O61PQiyvEU64+J
 HH5PsmkYMn1kCHzwbC+gscpflJpfU5Uau3E71seAoZaCvoYwhOBS54zjFrgNNPVSJSTb
 P8lmNausLC7Pity8k5yMbMElZb/yxjIguyHed7q4/plz3UNJ4yaTSsav/VSWCio4XtmS
 zZ3lyyFqviSUz9x2eYBwSNTUBhTYhHjrEz4NRtOqwsjtHJnF4nuTUXB1wj4lTRPlExUg
 7BCQoNm3iZdArHvUIVJKxVa9be5YS1EG9Y1F6+KQPvLI2aJmdFI1U7HpHZYtcSyqz1vX
 vRlw==
X-Gm-Message-State: AOJu0Yz6FhXdQyfg5V357UDmyAW9gauh2xWGkkyLSycQ0w7UIW3TSgbs
 9GS9Jq7smelHW6ne08AJwz+9TP1c3nXkGE7PTvJ0bYyR/Zyo6MM75ad4UMi0KaCCYfOJ+r5skM+
 Gxaxm
X-Gm-Gg: ASbGncsnh8o+vAQOZJqFOZ2UikC3QExCRIRwrfoMIyrngmXb6j8rjvdYSyR6D7fQ4RG
 9oa0H1IgHMsMSFsdHWeSc8y+iyxB4iZ+3PCKv4fGJ7kYHAJd0hmchGDmxyvUhV7Wlz0C90JPzPB
 KCPLVmuXOSPGsTN8HGra6xbPpeh1vrNP8s1DU66bmSNoj/OnAwxRFIhR3c8Eyj3G9E6kQ2FmoFp
 prGibLQwkF7LZ22p7DSKT57bJh5D2fQhZdQdibC02HaUWr3MPlTlS3iyToRVBkL5fiAvfEYsVKe
 Q4bWgCsNOXYqZRm9qsbyKwhuX7ErJ6U7Bq2fAVNSunWE5P/vcwAWHt84WLYkNK9hdLYvyJnc0ll
 ld7tutUrwLJOc4QVrDyEOlbUy4oSWq3sTrd0=
X-Google-Smtp-Source: AGHT+IEa/Zc3w+vt/2NFyVWAgo7kRX3/yCOkFVA0mQ2tWbMlQ+Alt9n3o7sV4joEbvndMH13awd9EA==
X-Received: by 2002:a17:902:ef02:b0:234:9375:e07c with SMTP id
 d9443c01a7336-24096b2ce15mr131276995ad.46.1753996245631; 
 Thu, 31 Jul 2025 14:10:45 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aa9257sm26092695ad.153.2025.07.31.14.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:10:44 -0700 (PDT)
Message-ID: <8cb7b4a7-39f4-42ee-9894-a116d4de3369@linaro.org>
Date: Thu, 31 Jul 2025 14:10:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 53/82] target/arm: Emit v7m LTPSIZE exception out of line
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-54-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-54-richard.henderson@linaro.org>
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


