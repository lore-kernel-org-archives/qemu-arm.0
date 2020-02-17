Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5447688lfp;
        Mon, 17 Feb 2020 13:32:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0zxEcLuhUTIUIBVphnCxTlFUhFb5Pe2IymNrENBkHoC709BlwEPcohObtqf7qDFnWVoSw
X-Received: by 2002:a37:9e51:: with SMTP id h78mr15757813qke.323.1581975132956;
        Mon, 17 Feb 2020 13:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581975132; cv=none;
        d=google.com; s=arc-20160816;
        b=fbF58vB/ClH55rY1OUpsaHV7t8k8dcWBXfq/htQIWdv5NPBGUt0Gd7IIapXiRVEyxg
         0H86ORqDUyxX1LX/op0JrUFKXVzp7MJhwr4uOYP5sfBZvXSktQdajO/xDJwHolaUGY7W
         4NDl2TC/w6ROPRshKK4LuRQlrDE3dKeMuAPhRBdH4h405nlSRtxwBdRlQ2VUK/KZkNwO
         fAkL3NUxU4hpPAIHfQJr/+wwkmEWTz7q1NhlwAofwKZWYtEUdvu6I2TLpsTNuYVqrHUd
         HoHXnatbpfJm0og6uq1XkXPH7BVKxrhKAw+MgvjINrHg4yTuwr7Nc9c6rEL+nM5QZoQ5
         FhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SoeM7QLrjPjbm2c+Vot0BOvlPIKe2WT5EWxhA6IsmEc=;
        b=LVVhO8kwEE1y0Mq3WXl2RWbodwA2VxKEzoN4fqDPouq1WaUZM5A2n7xHXdbyXRu+Uy
         Znr2gjSxXPo587PGN42U7+Dwf+L7Cka+bI1QyWCw8dKR2PW4nOwEJvEur8fb+KrGbQhG
         GAmzOVZPzRmw1s8HTkF7lS/DGsdo7DobjKJX+dOMQV+r1wlwXEEpIWx9mHoE79ger1MC
         LxkwXeNcjvfHPdMIJj32lHjGOXpCUSp3jw8STOfwHhr5AgVPZecR25bUmVp/3ooyc/jC
         i7peJooJQGm7i2cMtRTX4/zXjihejBb5EihWS3+pMwFH42odajYsIA67chevM2/dqJWV
         Naiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YA8igVpG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si940053qka.175.2020.02.17.13.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 13:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YA8igVpG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3nzw-0001vB-Dz
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 16:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3nzq-0001ux-6M
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 16:32:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3nzp-0008GW-4c
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 16:32:05 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3nzo-0008Fm-U4
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 16:32:05 -0500
Received: by mail-pf1-x442.google.com with SMTP id n7so9567853pfn.0
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 13:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SoeM7QLrjPjbm2c+Vot0BOvlPIKe2WT5EWxhA6IsmEc=;
 b=YA8igVpGVz0Aj3DzwWpKo3C+x4DV/iq3Oo0H4Sgr1WIfWETGOqQUBVCyuC1Bt2Ma+f
 PZP1CzooWcI0qT9cqvT4iFyw/K/qW7Iisn6W6ndkXDVAtPM2N4EqjXi+Nm2luRTxsc/f
 G4h/kQZGTj9MltstY++xlLNNT4uypLRL/eixL86Ung7OF/gWZed3v0LAW8Z1Fb4SvvMR
 jiy2tuXyRm3azCOaYyFdB/8LAKpt6Ymm1ryPMs2icrHoTqot3/x1qxAFShXjR93ycM+H
 iJ3nA1qv5lhNK67XfEEmEetX+ENmM4m6nkuREVaPEUZ3/P1UapM1ShrsttbeByUzd+8t
 rtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SoeM7QLrjPjbm2c+Vot0BOvlPIKe2WT5EWxhA6IsmEc=;
 b=IZHOLfeHd3rlJu8c9ozD0aa7KNknHFTf+ea8YOnyptKTfeA8/e5rkzEbGhKnansucF
 QvHKU/97YUnqzSNc9otyvL+hARU6QqRzyAKJxKJTZ2p1Ucy/+oXpLkw4HOp14PmQ8IN6
 iBBrZK9onakbpRNDFOafJ+yXbhOQ4fb2ANjPcwfexCgL5TymaOuNfyLmdcE5j44G1cn2
 RLeqUMY5+XP3x0AXmsIZdDvmc42X0/fJfMwoX5F4pz8ZYzgnJQuCEbA4w+XP3lHITzB/
 SA3lP+UyRih1AcThyocVP4fP3lTNPlK0qq0+o6kvCDEc1dAenpV9tXBWI6dFiI34N16K
 7xrA==
X-Gm-Message-State: APjAAAV03pjm8cvnepyJ4z3g+pxa2hmTN714sHP5h94e2MLclHG67fNG
 aoUgH3H7Uq5wLbJ9TkWPZDujPxZ7yDQ=
X-Received: by 2002:a63:2bd6:: with SMTP id r205mr19479205pgr.69.1581975123507; 
 Mon, 17 Feb 2020 13:32:03 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z5sm1378387pfq.3.2020.02.17.13.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 13:32:02 -0800 (PST)
Subject: Re: [PATCH v5 05/22] target/arm: Suppress tag check for sp+offset
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-6-richard.henderson@linaro.org>
 <CAFEAcA9ps2JZHi2nTUrog7rgRc5gL8QbqYhSgFCS_-ARe_0T1Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4685425b-5412-19f3-a6fb-3b2c6b0f25e1@linaro.org>
Date: Mon, 17 Feb 2020 13:32:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ps2JZHi2nTUrog7rgRc5gL8QbqYhSgFCS_-ARe_0T1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OaL6REttKCja

On 12/3/19 6:07 AM, Peter Maydell wrote:
> The load-literal case is implicitly tag-unchecked because
> the address calculation doesn't go via clean_data_tbi(), right?

Yes.


r~
