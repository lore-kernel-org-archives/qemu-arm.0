Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B666DC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:14:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhE7m-0005ai-QR; Wed, 30 Jul 2025 17:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDxD-0001IO-Ey
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:03:15 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDxB-0004lY-Rq
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:03:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-23ffa7b3b30so3560275ad.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753909392; x=1754514192; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EcsBdj3tkVX3+/fASzXAnChM5KU5p4IRaqA05bkeAbM=;
 b=K6plQpP9nY/Leimi+aOOUTl+NYpypqXhTQspDkIK2grXQeV1/I7qTvE2Urw39nQE9J
 RixfsHIjDyUU1Gpj5gZdeWWZ3g5ahvaqr2JIgibmq7oJSdyxiG9O2uk7+06A05Hbn+jr
 4v7PYAj6/mbcOqjFdZ21gmyJ2wdUCVDYM0NMm6OPyqJN1z7yyebGZ22Rtu5hu2Num9Xz
 9KVXOKbWDBqRpwO7p3tVSrK3TOGRfCEQU+oXOodJmg4OM3l5X075/uV3sRDeHE5NrSNm
 oyrEqVUfPefocl98vDxgHdql+vLfsSF/uXsOcMBPSerhhY/AF9NCXI95Xz/2aY6wJX+3
 3LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753909392; x=1754514192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EcsBdj3tkVX3+/fASzXAnChM5KU5p4IRaqA05bkeAbM=;
 b=ftRFhfspOiZAPW4zzmEXNvITc22TYYxfGsZYubbeZO+uUfQla2qWI1LDIuFUUjnv9b
 +IfIhTtjEqGaB3i8g3H4k2k4joDG0xmhIc3ZjNrUTx0kIctckAfDOGDJw7FIaHvTNz/z
 s2/eaj6ANPejQGJLkKBiLf/8S33oYrrpe92vG4Bx/PPGFpaGC+hyXIZEK4hHyXbhQpZw
 qD2gfru+Fs6tEDY+qy9XwFWde6pjG2C9KJVfPPOA5+86g6wX1T4LfAB5J2K2jBomkSAy
 6VU5CX8BE1rFHvvICywtAqoR8sB1tJIl/hFlTw1KfmrMkFv7gS+vnHXXil/41NGxMgBt
 jNFg==
X-Gm-Message-State: AOJu0YyXDLc4YqXRkPzy+Fk3e/qGChabHYY9slYI7JaF2crZy0PwhG38
 WuUzo9YSEV2YbtETIGmThlopC0Xt/1BCoKiD3Xw+KoLPoduULohUTKAiGHYhoqvgrrY=
X-Gm-Gg: ASbGncsqb6eb2Uj/bKYYrn9nGP7vX91/uzJK9xUaAY6EJT+olggDQFDDffVog75U96z
 B0of2RO7LadPYMdG9H6cuTXFRb9PLOsZYwooL3KAJFVEkrqVPRtneOf0sEZJgC/VCw/PA/m/v3f
 gAX+IpeqS2AvhFvpVgaumjHHETQ1lVW75bowzLADxEHlaX7L9MYhWPGfMtJRx48hakOxA/IUWsZ
 NQLZVud0OcabfHZwygg9OSsGIra7nNTQuOiFKpgHEidQ+bb9lqLkL9U8CCJ77WMmdg8+/n0XJ8B
 OIqldCf84XT8tb4jhiJw9mdwj/pch8m+wImbHJuJBGDhIA67bQKsrH7DOob6q3toaVqyKhH1pxi
 RF/AjRyatr/oLOSdFwRtBZCAckxSBBxX/bJqs+6Zq5P1V0A==
X-Google-Smtp-Source: AGHT+IG5y3pRGnuBBX0McZwLU/u/fC2BlfEVB2pyKObzJAmU17HSOPiO6l7NAIfJ8ArX4mwKrTOjWw==
X-Received: by 2002:a17:902:e845:b0:23f:f6df:dd2b with SMTP id
 d9443c01a7336-240969a85b4mr61883955ad.0.1753909392326; 
 Wed, 30 Jul 2025 14:03:12 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899b43dsm282555ad.136.2025.07.30.14.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:03:11 -0700 (PDT)
Message-ID: <17ebcdb4-c86d-4f4a-b0bb-230631daebf8@linaro.org>
Date: Wed, 30 Jul 2025 14:03:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/82] target/hppa: Adjust mmu indexes to begin with 0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-27-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> This is a logical reversion of 2ad04500543, though
> there have been additions to the set of mmu indexes
> since then.  The impetus to that original patch,
> "9-15 will use shorter assembler instructions when
> run on a x86-64 host" is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/cpu.h | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Thanks for mentioning the original commit, else it would be hard to follow.
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


