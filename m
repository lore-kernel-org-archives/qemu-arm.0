Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6383CD66B8E
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 18:40:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVwQI-0006jg-UV; Wed, 17 Dec 2025 13:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVwQC-0006a5-7h
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 13:38:52 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVwQ8-0007o8-98
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 13:38:47 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2a0c20ee83dso47809865ad.2
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765996722; x=1766601522; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=seABeKHpcn3xEvoXlJNdpC7YVLBGOeOifIAM39GElZU=;
 b=csguFCS+Wo6Y8sHY34zE4hQXDT9q/ZOKrwtirJQK7EMJS18spW9HG2d39mD6KOWmgi
 r9/MbgAOyReDacmVN8c8Zs9RC6MLw63HY3NnvsatEK1Si3dyo33mNFmcvBWS8kGTdl+T
 O10m5uT2Mqi0JQ4SCo8b+bJSQOG+YNAggtQBeGn2hGaqhf7MBXJ6Q6uDsqepV6uLFKX0
 qs7iXx03aiOjmfUeimC2c8nsxD/jNJVrej5+IF2jjL1KLPI3fkP2I+F+lH3Z8/pyGbfO
 JLk2uEi66wNJAZ9EidBwpU8BI+bAQ100MgJPVjKtFR2zVi2QgM0fG+7hTw6ZfcpeU1IC
 cOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765996722; x=1766601522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=seABeKHpcn3xEvoXlJNdpC7YVLBGOeOifIAM39GElZU=;
 b=NJ5B/H3oEVZv3Lvqf1U9nxSFcccHrgnXAxELkJfvnHw0U7ODvIOopmu6qdIEb9gnna
 9/zOtnubszNru2P7puTV17EfklokdeBTEPrwlk/zotwRn6Ygf8y7XQ3+VQwX4LPyjivV
 VZpN2cbLBReqyPyudvs8aFDYkQJ68/TlNmTY4QGEQ8/TY7KRuLWPAFXAh2TBo0bBVT14
 Cj1dUi/fUPGEAMPJuaJHQreguhxcF9x51RqFVYozZdxovy8ux9uwSGbmi845tzwxJky0
 nFGNfKlp8dqZMTzFeA1OBJDmFW0NzpJ5Y88mSGkcHdU8zQeG5tKPrcQrZpnqxwKWx50p
 GKKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPoiYpjBeE+Yjbjmio2Y+JmyNt/IHQBMkal4TOUWUFtN3mZKHGXfjw0EjdA7jg+q/M1EldwwabRA==@nongnu.org
X-Gm-Message-State: AOJu0Yxk477pBNcrCmza8Rez6f/YVq23ddHibzjKiGcFUZYoLWQGD0xU
 oKveR8VVIL/Dq2/NnmpM+2vLqNiYktnheIScS9nNCmbAqgVy5Vr0zi5VyFlQjt+C6As=
X-Gm-Gg: AY/fxX7v0DT/ppxdiDf/5xDy7xe4zDMqg4Utmops6YdcVor+KbFT+35/7o6yfrna/7p
 QiqEvufOLj3uwX8hsz+Z0W9ho1ZywmAwmuKSYhh9xTrAP2XO/1WKsmSBKoBMCDnBgEoe8N5uVRZ
 iVq3IIiI6IJMYWyNFjmUjXd8y3c10f03vXtY4SsNf6V7l0F9aMxH1UjHkCP2dUdScAbypLZKXVS
 gEVJb27lN3bbkWMY0PLohij1jO7Un1uobcr1l2o+uj9EW4dnUJDZUupL483oTTpBClH0lCVJ/tR
 gADnwTmrIXOmtLgTwrn9F0h2AsV6w6guTz5UGE61hf9DDUbLMH0qWP0bqmkQjKqnVhzkkD5Vr1R
 Y/Vq38M18SK0NvGnC1nGRz4SMpa9YwGITZuw8H39NQgshghjYXlFxD0UeRdxjYQ7mXuUlNLYrku
 0jHLUJtCVW4LX7sSbDNAG73CW0kqvEX5B33AGewo/CDc9nTvvCYcNtcpM=
X-Google-Smtp-Source: AGHT+IEVhglo+Hr2QPGO23r8JcmASMupGhNaTkRzw+hYZgeeYWBybC/0N79C+m0PeIHwcHPmzz6+MA==
X-Received: by 2002:a17:903:3843:b0:2a0:d403:a2e3 with SMTP id
 d9443c01a7336-2a0d403a5cemr135330545ad.37.1765996721541; 
 Wed, 17 Dec 2025 10:38:41 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2d19269f0sm208365ad.79.2025.12.17.10.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 10:38:41 -0800 (PST)
Message-ID: <c5f0b0f1-cd02-47fe-aae9-1da25c91f6f0@linaro.org>
Date: Wed, 17 Dec 2025 10:38:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] target/i386: Remove x86_stl_phys_notdirty() leftover
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20251217143150.94463-1-philmd@linaro.org>
 <20251217143150.94463-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251217143150.94463-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

On 12/17/25 6:31 AM, Philippe Mathieu-Daudé wrote:
> Last use of x86_stl_phys_notdirty() was removed in commit 4a1e9d4d11c
> ("target/i386: Use atomic operations for pte updates"), let's remove.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/cpu.h    |  1 -
>   target/i386/helper.c | 10 ----------
>   2 files changed, 11 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


