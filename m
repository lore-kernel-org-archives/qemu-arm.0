Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp994792lfc;
        Fri, 17 Dec 2021 14:19:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRdMpORyGqLlA2vc6nqBZtw1OjHnHLC/KShAX4kzm2cfwiDmUYXzwIAHxn70W76XFct7Wg
X-Received: by 2002:a25:db8b:: with SMTP id g133mr7368337ybf.697.1639779583656;
        Fri, 17 Dec 2021 14:19:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639779583; cv=none;
        d=google.com; s=arc-20160816;
        b=JFILcwsAyiPh1TGGCSi4ReF6VMuhZxn1cRIoEXmrGc9vL/NpeT+SjvW7G3rAYgy4xO
         3/JpsW/GNvkt3B3w9O6rU702BhpxNEX22QHNfISKfz21nqMIihIiiVGSRGUxHj8QQW/N
         ON0EMnlWTuyDl6cZHqkTvxnrA3f6pgBQ2RoyRZgzkkQaIzkXXC1UPr+qehdwJQ3bAZ9/
         hUIdoHpPld0JityXGHMDv6Qw1Mi6vSaXhpuQKN5BxiVAUuBbv4Ce1HoABV/ZLjvZRIVy
         CgEUJQF+x+EHCvoWgTOB06oCLb52cMx7b79dWnv6IUZ2eZOtu38deSHApdmJNRfsdpGI
         d5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cvd4B7eDK5SwZPR94/4jVaZJa4s3t3KyGC4s8ZbrZyY=;
        b=oRQPaAixLY2wM2yByR+RPPrwfbfcYl6MifMnDLzYkMY2cwBOBi/+pfsIcNa0VC5lI5
         97Mllzyh4CkfnpCoj1kx3veG5ItmE0fJ2axbh36rW4RSqdZVXOillQU/kyozgRFMfuFb
         +F6sUGqQ0/ezV7t66x1iEfmkMBL7XEd0ts+dQEjrePRq3I0xDL8lC0YLt1h55ysu7Z3i
         chrQ4R06HPKtfU42xiXr7l3NnPRxq91UgLiODpiz4zm7XgJIp+CCVLEuy41gRIU96vuz
         WQW0ivUgVYG7iQJqmMyu1IDMQRHFkOfV50L6l/6yaXiX2kgLC4XJaBYYAEzsX5ZCcB9h
         BRaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WssWTGOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si1204374ybn.745.2021.12.17.14.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 14:19:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WssWTGOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myLZn-0006tY-3S
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 17:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLZd-0006so-NA
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 17:19:33 -0500
Received: from [2607:f8b0:4864:20::632] (port=39842
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLZc-0002iS-A9
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 17:19:33 -0500
Received: by mail-pl1-x632.google.com with SMTP id z6so3010542plk.6
 for <qemu-arm@nongnu.org>; Fri, 17 Dec 2021 14:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cvd4B7eDK5SwZPR94/4jVaZJa4s3t3KyGC4s8ZbrZyY=;
 b=WssWTGOgoDwS2mEOfZoxQZZjvFgkvIAPEYq/DCthWlxnmmS4Oo2MhglAahwCCUTjQW
 Cj5TiMKWFANmkPd5EyKfS/iog82J+xVMeHbFNCdATkQ5ZCyt3lA79Vo3MQ57wQZQOh3v
 I67YlLFT8MZdrlQbX4p1IBgPIDDf5ZqtvVKVdPtKbI8V+THQFDT4ZwLYpOaHOu+rabhv
 /UbPECJRcUKwyfnHuSU5LkfZWREZ8nhIaWJfCMvYnCw0rSMhyIIJ2+fzwmzcWkuaELuM
 gjfa21eQJEe70CX1q9DJPMUzwpk6ydwri/7YlQEFsTuxNLKbGKZKM+661XSzVxs9lxqo
 l44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cvd4B7eDK5SwZPR94/4jVaZJa4s3t3KyGC4s8ZbrZyY=;
 b=FWYUo4yVC5rMJQkGmxyUsuCcsTamdttBHwsf9I9+0DYYOkndy0XXfBZErT6C8dZslT
 54eP62OpdrmaZ41WA9OCCNGx5E31rndLJZ0gVKIbJoldo7nNUBzflKZGNiJOBp2C3Flx
 WBWXfs2zJ8YIhwm5Z5SQcZys0H9mKa+GWCyyeH2eebMePaAIthglrkJlGVYnzl8Xhwmk
 ukOZ2h6sBLMYqHKCNyLOi88/qAdJ35+fT5So/+wj+KeNA8QikftZitiPMxEeyjLUGG1d
 tKUr6x+hsNl8KAoT1RvQoMsfLBjuJsZ21Apk3mHoOAuwxLEPOqMJ4iKgXszIfbxvY2Or
 tjTA==
X-Gm-Message-State: AOAM531m/gcRhfeFx+xL8A0r2RpCN5/OKhEWjWFMdyMaxm3ygp5prIiy
 8BjiAi9+6zwBzJf8RXiB0c8TSQ==
X-Received: by 2002:a17:903:32c8:b0:148:f00b:9c9f with SMTP id
 i8-20020a17090332c800b00148f00b9c9fmr654602plr.122.1639779570846; 
 Fri, 17 Dec 2021 14:19:30 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id c7sm5398358pjs.17.2021.12.17.14.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 14:19:30 -0800 (PST)
Subject: Re: [PATCH v2 1/2] hw/arm/musicpal: Fix coding style of code related
 to MV88W8618 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211216125647.805544-1-f4bug@amsat.org>
 <20211216125647.805544-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb3bdfd6-3f71-21c7-703c-fdc6a5c9ecbe@linaro.org>
Date: Fri, 17 Dec 2021 14:19:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216125647.805544-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ihrUjQkwWbVT

On 12/16/21 4:56 AM, Philippe Mathieu-Daudé wrote:
> We are going to move this code, so fix its style first to avoid:
> 
>    ERROR: spaces required around that '/' (ctx:VxV)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/musicpal.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
