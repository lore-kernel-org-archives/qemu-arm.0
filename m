Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp230605njm;
        Fri, 28 Jun 2024 09:50:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQxtX1gugXeaFAKj9J8JSYdN0O25xmDCyjLpSxdmZ6zv3l8J01FqDfESoqOEyOD065ooVaJF4KHjHpQdRiHEt2jA2DHG8x
X-Google-Smtp-Source: AGHT+IEGY466JHHkiB3M3ltSk+3SJ5jYjm3yHAx1uCbqFWzf72PHt/cKn9+RiEMO+1HKzf7/Ck4y
X-Received: by 2002:a05:620a:1a8f:b0:79d:69db:e5e9 with SMTP id af79cd13be357-79d69dbe956mr348635685a.10.1719593442438;
        Fri, 28 Jun 2024 09:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719593442; cv=none;
        d=google.com; s=arc-20160816;
        b=hHMnvn61RhksadX5MCyHvlTmLDC1RTq4hSVsmwtIav52qJ+SoIfmu1EYWLTlq6RTOL
         ZMAZG4qJ04F/Rn6I6IUPpHXDGS+1WO/5rMAqNUrDD3f7d/hfGpnH/rHXGMRYnASV5yrh
         xjfLdq/2cWf9SYRp5zCR7vhj8XD0Vo2u/vGg6CPAwQ9DxQn8Y4/OZW7CPpJ3923Lzj/w
         2euI7FeUL2066Lt+jsQjnRBM7887dQS8l/r+Z8DEKdEBmHmDVK0/EKRH5MrbfI8iONdd
         W2fw+sawQ3gwbZ/WvIg+11OnATuDyFi63r+sCIQV7clSUv8e5p1FWHrXKDUuz9uq4oJ4
         j1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8ELVTI/N5D3MWmzOvRVDf5qXVVV/RIV0l4ceNBegRSc=;
        fh=fhbZTEnOgTCF2oYr327pJj6312A/59HdCkdXPAwNA6M=;
        b=NDCnyJFTyUMfPXqmpcS7ZlN3HOrCkzVXSBItU8e5XnYpwjtN4Gvzzx1VF8zUwM+91g
         p/vTvf+1uTS2u5XPmTCXEOi/6KeehvaX2DuVKC1KY59YCh+3bxAMEATZlChyy6U6euuJ
         uiYKY4cW3KeCVvF41Co5M/9YeMPeOIhuEo6VEEHs3vsJe5x96gaOIZU3z1FBEzbfN9KX
         2agU+i1AC9qhAQdSSUXONHf5fg+R+/Fu6+g+NjMmlR6Ga6XxRD6ND0B8rvxKqEYd1tdf
         jkh08QxOH4JK0qo70kjJVARBRu/Sjubd+0k4Oanwpc4chXXRrY2UjbeqJ4wiF7qH3+fT
         /YMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pjG2PebX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1f65si22675451cf.5.2024.06.28.09.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 09:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pjG2PebX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNEnx-0000Re-RE; Fri, 28 Jun 2024 12:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNEnr-0000N6-1Y
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:50:32 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNEno-0005gx-Pk
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:50:26 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3d55c0fadd2so531353b6e.3
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719593423; x=1720198223; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ELVTI/N5D3MWmzOvRVDf5qXVVV/RIV0l4ceNBegRSc=;
 b=pjG2PebX0MvSRCSk6fD5Wie8dIaKRqU/KtTD7YR/oPdyl0qVWfdf9OHcQ6RHlKq345
 q9ANqLXv5F1yNYZiVZ6BHwrjXiOPIE/M4N8Soze3Q7rZDSpWk6me2eFFFaLAJQ3DFUkb
 4JOfmULJsLZMIJIgfcA4Dh7/M3bwOP90dDe8zsIa1NJA3rjvuhwcJoS+X1fVeN/6jW2P
 0/mNM+WxX3sk3UKUJk6y7u1Lyjxx/uq4CVWEww3WZLW9/mSc6+f+xvaB69WhiZYt7nes
 lsIugj+zZ9jhCb1Gu4TRXWDNL4xUE0oEr2j1d+3yER90wPCWQsNVzcmUryhj+I6RNJUQ
 8CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719593423; x=1720198223;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ELVTI/N5D3MWmzOvRVDf5qXVVV/RIV0l4ceNBegRSc=;
 b=F6ztonwZJEZw5BGVrcK91Kty35QIwf9erwBHjZBVx/P1yn7f1FgUxB8lVlto7L8e/q
 p7jEkv8ihCHmqzklwNVWAyaFLp2I43UhBf8zxIm+/yXcRZjHyz3D6ThRsKMHCZg42k5R
 4RynPf3a+sWJ/CxlGmpc3YEsYR92EZ/hePBVg5hOgnV2mGfBgRRsCfdvuTP+SHE2qWBE
 Awju+bT8AJM5DFg21/qKDJ8X5QOkbhWvsMUyg32ewZwe5V155N4y6L6ArrMrQ5mWNJ2s
 D4GlYPaa33wTo2zXHGpcqYMcXywUAuMN/5k9GmcEO2rraenSAuLzvUHypK528cMRWzt2
 paww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj1fXCd6GmVUN7KHIjzvg0rIINMYEp0e6cMOmVb4qn9lXF08v5oFwALALv+nvLVw7NTB9XFHhJcaKfqZVvbMBHF4pF
X-Gm-Message-State: AOJu0YwHMGMh6OYtEdDXhtG+MD9q3W7XAgP3hDp968ihy0dtInJEz5Qb
 oPUeHWIbfiWpnHkN5rf8sSGUxl+qXwL5iO6JsZV0zj/VCcMKWDOmld3qHPnHl44=
X-Received: by 2002:a05:6808:1824:b0:3d5:1f50:188b with SMTP id
 5614622812f47-3d543adb0e9mr21641775b6e.23.1719593423179; 
 Fri, 28 Jun 2024 09:50:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7080256af87sm1840122b3a.70.2024.06.28.09.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 09:50:22 -0700 (PDT)
Message-ID: <ebfa6ca6-d93e-45b3-8786-cb52505e2d7c@linaro.org>
Date: Fri, 28 Jun 2024 09:50:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Always build Aarch64 gdbstub helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Anton Johansson <anjo@rev.ng>
References: <20240619124903.56898-1-philmd@linaro.org>
 <42de8f25-3624-4e7c-b38c-ad8e3b8e61a4@linaro.org>
 <83667101-daba-43ea-ba33-1df547020cd9@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <83667101-daba-43ea-ba33-1df547020cd9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VIQCYEu+l6b3

On 6/28/24 09:37, Philippe Mathieu-Daudé wrote:
> On 28/6/24 16:31, Richard Henderson wrote:
>> On 6/19/24 05:49, Philippe Mathieu-Daudé wrote:
>>> Merge gdbstub64.c in gdbstub.c and remove uses of
>>> target specific TARGET_AARCH64 definition.
>>> Small step toward single ARM/Aarch64 binary.
>>>
>>> Philippe Mathieu-Daudé (2):
>>>    target/arm: Merge gdbstub64.c within gdbstub.c
>>>    target/arm: Always build Aarch64 gdbstub helpers
>>>
>>>   target/arm/cpu.h       |   8 +-
>>>   target/arm/internals.h |   2 -
>>>   target/arm/gdbstub.c   | 363 +++++++++++++++++++++++++++++++++++++-
>>>   target/arm/gdbstub64.c | 383 -----------------------------------------
>>>   target/arm/meson.build |   1 -
>>>   5 files changed, 364 insertions(+), 393 deletions(-)
>>>   delete mode 100644 target/arm/gdbstub64.c
>>>
>>
>> Are we attempting a single binary for user-only as well?
> 
> No, due to ABI constraints, right? I did a user-emulation
> smoke build, no failure, did I miss something?

Well, no.  But qemu-arm does not need gdbstub64.c.
Given TARGET_AARCH64 will be set on a combined build, I'm not sure what is the fix?


r~
