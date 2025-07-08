Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FBEC8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:13:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFET-0006O2-U9; Tue, 08 Jul 2025 16:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDqq-000783-Jf
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:19:38 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDqm-00087V-JJ
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:19:35 -0400
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7d20f79a00dso705173885a.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002357; x=1752607157; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gJfeKqNJvliyVsof1tnXNWGe5oI1E6MCoJRkgy/dOSs=;
 b=yvRFLyo4Do0ojqttaMOiqzNEw7VZl7c45SA6RI3WWKPg04xhifTnUzPu6Jc6nZxfC8
 jA3X8hWZPOqcDH+EmJYrQvGJ3OwxtPMmTf1j2bmoMx3hInWpt5dVaLIlUpM6dbUIOkSY
 G99Unc1EDLX0/ox323Ki5u4CZz6//rsm3B0UTSO2yuVCFHxi9otOSYdhSZNLX1BRK/n4
 1EwL9ghdJ8vOcR7C/MgdWLjN38nwitoI4X35LXloHid6GqMgVI8J51Is3J+JKyL1WOEc
 xvm74cCyH4I2FMq/Z0fYnxRm+0lK4e4PScUqGYlZ2GHIVv3tvq2wuNBLXKAJRtbXIVOa
 fQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002357; x=1752607157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJfeKqNJvliyVsof1tnXNWGe5oI1E6MCoJRkgy/dOSs=;
 b=n/iyzV9qK6sDXWhyUPLdKNd/C8bDatOlyF65ie1KuLo4AS8NRkUeqsFl1B5RKoK4zD
 dXkqzRRr3iiutmelwbwS/QW2Z8qrG+SN4W8bfwy68ExD9e4xSpYojWSc85a02aTNx5aS
 8Qsr4zVU/KTPqfXEI7LbgWDT/uduyl+fm2qXpJRuQfTvuwfzfsQm5eznOR3l37KXnBbh
 xFDAYrwft/37lZZrjrrBTwlcgrBOaocRvEz7SKRNZvtOZ+j3gRsyUEw9epK8OA7UTHXV
 BYaedFSkCGmuMO2y5RsYOdrJrBJdwBSvaqkSne9uRKs1PZs/4VPVKtldp918L/vuDitW
 duuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0QPO4KnBZTiNCtD0gzynhzGVA+ZFFWeMACbwmBWvPSGyoAwXsqUnddhVyVV2gDH1brBG522l0mA==@nongnu.org
X-Gm-Message-State: AOJu0Yy0IDCRIEihWlzh36iBBF0u+tZlBQ3Cc4CiRHDW3cjlxoyFUJva
 wYyt2l71648qjXLlyFKMCBjnHuhCi2bW6u3btt8iuJO2yQDkADyWlCp+sST7pOnKmbOnz287Yru
 rEwsG
X-Gm-Gg: ASbGncv3M3Sx8xf4n9yjV0vn1EXKYilf1S1zOGXw5SY4BuB20It9ICErox8mNNqIJFj
 hIVAZa+GKJumsi7IgO7iubdRrr30QfW9/EjWce4aeGGt/9Wd9p4cRYf/iwMoXDJ7uSe1wZKfaqR
 r6Rvom5nOdcMK8kPVOqX2vCxqYRcyWmoRJxQ5wyMzR2+APMR+G44cNdMIgsbi34+xHA2KmZOGZn
 ixQmFRV3WYwB0pA5Z6FcVCqHzeLJgD/0cHp/lqQkkJZdaf73frdYG2Tkrk1h5E0E8N+qu+/tURO
 JYG211WbyYczuyg6JXBS2BaYS4hvi7D47gjMVYFM2aonuFLAmYL7g2BV9T4Neo5dhjifalqmsLc
 =
X-Google-Smtp-Source: AGHT+IEpzc8plQC4rcAJGrcS24kwQb5Eh/ouKne5TQChs8nh1tzAlwlioMkMRwTv9sLvZ7Swcd1aYQ==
X-Received: by 2002:a17:903:1b47:b0:234:eb6:a35d with SMTP id
 d9443c01a7336-23c85e77329mr246108985ad.27.1751995953966; 
 Tue, 08 Jul 2025 10:32:33 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8459701bsm123651925ad.205.2025.07.08.10.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:32:33 -0700 (PDT)
Message-ID: <1b58205a-1794-40db-8e52-d2a4c4a52956@linaro.org>
Date: Tue, 8 Jul 2025 10:32:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 3/8] qemu/target-info: Add %target_arch field
 to TargetInfo
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-qk1-x72e.google.com
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/target-info-impl.h | 4 +++-
>   target-info-stub.c              | 1 +
>   target-info.c                   | 9 +++++++--
>   3 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


