Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2512918njc;
        Tue, 23 Jul 2024 06:36:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQ7A0WaVTPIf8J7gF4pjZOAXO4/HF1BsBv2XISOtlF6/LI1KFcg2GAJfNKz7lbJAWMBPfAvMNEbXR4/XvPBm9SIDf36zjV
X-Google-Smtp-Source: AGHT+IELmz/P9ygDYxYGC5TY1YvHiQR08wcYhf5gtF0veYY/pUTkxFEAiu8vsIr2yiOz0B3Up/HS
X-Received: by 2002:a05:6902:2188:b0:e06:3823:fa6a with SMTP id 3f1490d57ef6-e087b345dd7mr10988229276.3.1721741774269;
        Tue, 23 Jul 2024 06:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721741774; cv=none;
        d=google.com; s=arc-20160816;
        b=P5v9ItE3uApRLopQGh4GoP0El6dFISWlYtxwZUGJ75QJ9NoJhRbJj/CoDQcy1SpJ3v
         iLQkj7u3sMIVS08ftNA4brd/+Gj7QHiAVY18/1/F77dz9c6IOAn7ZGSiu3resxPKQn8D
         xf8hBU38vehHekgVMF93vsuS5yOCIEtqjJH7nVHYR1Q2EFBF0/8/NImJ65HS/w1CHIDj
         qzkgQlpDuMr6sCE5GTuTXmBzBg/uwZ5mXqOOXiHBMOhCCP6RDWssyRdRNczozCzWiHdt
         +7l80zaAgoRVFyHT+6ph1qGmtGlUYUv96ayIKNlW1dM+JgTErV/MQjlhRE842MCb9ouU
         dsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=azOBo8n7PTI1z8TaVTvpugK+dx9lsNzTIbJJ+xk/hOc=;
        fh=ahwL2Isy++Da3w4Yu8B/VRlnfz1YBmtysu4rA6WlSdQ=;
        b=y97aNKlb62cNiJ68o5ibHx2XC2PDavvlH7prLTaem2ghB6yDu6mtBMuP/avnV1N8Vi
         KQxusdj0hNh3cdZPoRDJ374CvaUB2liyoLrrtucw8wAH2fHTBgwCvzAUvpN87MSUlVrQ
         xgeNW37v21JJb0bmu2vSuzJ7gSyFEITNpzB8VlUNFuUn2ssGkzxnir8SAOgxNZsWlDZD
         CZNlJh7GJmcTmxIDmo+Fu+64Qqk1mYwpRACHuoJwZ390ktbfIL/oQUAHjnGYXMHmUBAT
         1jYhzkunC5DHM3KBujT7/zzUZN0Co1I2nHaVOqZ5DzTw5zSUY8tCzQzDdE08b8UcUbJE
         AXRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKveFRRg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac99cda8si104054466d6.238.2024.07.23.06.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 06:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKveFRRg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWFgV-0002q7-QL; Tue, 23 Jul 2024 09:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sWFgT-0002lp-TQ
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 09:36:05 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sWFgS-0006jT-9b
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 09:36:05 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ef1c12ae23so34218661fa.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721741762; x=1722346562; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=azOBo8n7PTI1z8TaVTvpugK+dx9lsNzTIbJJ+xk/hOc=;
 b=BKveFRRgXA5nOM4Ayok8cVE7e1kKr6bxmmR0096RwL2MgGMchWE4BbFXM3z8Qch6eH
 DKJBNw4q/xueZ0ia0cxalZ7mUcLvY7xdx1NnCnyreYQleoERNMmxPrfb9xkvQfLEX4Z0
 giyk1pZyTjy/3l5Wqcq4JMOnOPEWUiyoe2RskWqyrqG1U1ADEQ3oHZJSzSihTZiNp79i
 1mt/I2iErcV62mMVsqA/X48B6dxyPnDIbNLykQVu1nfL9eAr/EVtnAq6QG5gv5OZ2myt
 LWNuVnf3uQF9b0vvH8cdB/BE1SANYvzCoc3foBcAkfMOG7RlLUKjHb9TKeEdBcPMjfLp
 TsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721741762; x=1722346562;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=azOBo8n7PTI1z8TaVTvpugK+dx9lsNzTIbJJ+xk/hOc=;
 b=sjis7SPMwMYu5jovfcrmbfOhwPevnTsqVCUhbph3YHOeJdE8yL9WbuzjQTmncSMA7n
 0ymQdYnSQWIO6SgIyk/exA00f194g5Od0K98HtiaiKP4/Yzm//TpKfjTdCrdQxzF0sK0
 UDrEtbR1/2SJNPvr9P9wUNt8kvDD+WOn/O2+OIi5Ljo+peStN5GchRXadsppV9T491Nx
 qCF1modNXahJkQpAC3JR6nXcqQckQQOSNnGXIiEMvgJe/A4MOxHuezh1fBbobYX2faDU
 +jKiMM7UrGmefADgpoXiBzJ5Dhvj4SOZYFkfvNwcdU9F3mO3SrxyRC2ljs1hvv97RyWQ
 jQ0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXddRtnNB1uAfN/fdOdHH1ckDuxNthtW9NbKGY2MVCBnwcDrbXK/KZw3KDpMgCOCqRwfvLNUzdYwg5Vvh1E04mphyk6
X-Gm-Message-State: AOJu0YynvbUDXSs26lNj7eDB7tT4KqFHqSGw9Fotf+qz0UzGTD0xpMeC
 PRUy+II0kXCpmxsVYKhqG4bhgVNHeuwVXhzAIZNKHVkv1k3Cqq88RcRF2Ni6iWRV8Li/5YtsdOw
 ieaU=
X-Received: by 2002:a2e:bc26:0:b0:2ef:316e:8930 with SMTP id
 38308e7fff4ca-2f01eacebe2mr26197591fa.42.1721741762348; 
 Tue, 23 Jul 2024 06:36:02 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a94380sm202242665e9.39.2024.07.23.06.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 06:36:01 -0700 (PDT)
Message-ID: <16970204-0835-4747-a8f1-798d77a74f42@linaro.org>
Date: Tue, 23 Jul 2024 15:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/misc/bcm2835_property: Restrict scope of
 start_num, number, otp_row
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
 <20240723131029.1159908-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240723131029.1159908-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
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
X-TUID: OLK6534h7kaM

On 23/7/24 15:10, Peter Maydell wrote:
> In the long function bcm2835_property_mbox_push(), the variables
> start_num, number and otp_row are used only in the four cases which
> access OTP data, and their uses don't overlap with each other.
> 
> Make these variables have scope restricted to the cases where they're
> used, so it's easier to read each individual case without having to
> cross-refer up to the variable declaration at the top of the function
> and check whether the variable is also used later in the loop.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/bcm2835_property.c | 34 ++++++++++++++++++++--------------
>   1 file changed, 20 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

