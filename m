Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp21552njk;
        Mon, 16 Dec 2024 23:11:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4BrfEIR38fKdxbIyOfLm9CqtY47ORZS68V5rEr+lOBzd0op1r4zS28/A+bKkbRpCeTHn+5LDEGn51Cg==@linaro.org
X-Google-Smtp-Source: AGHT+IE3HYlAk4u2l2lbH8ygTS5JfYlfaQdesDpGnQDk9wbmroxD4AmAagEJAmWj4eVTxTREVGDX
X-Received: by 2002:a05:6214:d49:b0:6d8:a7f7:c3a1 with SMTP id 6a1803df08f44-6dc9685001cmr258846906d6.40.1734419472535;
        Mon, 16 Dec 2024 23:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734419472; cv=none;
        d=google.com; s=arc-20240605;
        b=DWTafXEgQP8S9fwHMxcpba5B2hOPr2GvnFsjC5Yu3UB4hmkFJJ8jy7wDs8wg5wsnj0
         fIYMvmnbwEmYLwoNOT1TQj1h1Cj8Xgs0fe07oZvA0qnB/1D7dT2VSd4RVu2dTfu7XXsQ
         DmW6ix9Ko9wugTmMp3nkiA9tkss4KcpvOOm2iFA413QigSUz7HiojrM++eK+JmFUcmi2
         +WZTDBYFx7eBp2nE33QYMABEwgT6bBHLA5L4rgpSIYkdY9PQ1ZYAFpiGECIDrJpV35up
         GCgOHG4f9CmUOclw6iH/ubQB98Mo4p2aE3/ItWkfCsbls7dd7WUvtm8m/mGhLi8mKIOX
         gCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=UQae+zCcA79EIlsX+SB2839BhRUwlMBvl5iQNG5MpRI=;
        fh=sCNcCy19+Td8g6hNb+hQ1FXESYqAZgddj3J7KJ7nAR8=;
        b=cGHuv5+aOr66sv0rzzRNWDxQ+tiFoM3OihBoMpbon2/c0FxC2vCfHmCjY/PwDDXwDi
         zsq8FgNVI/XujXFRPYgXUyXiu+hvjkJrzegBbEKnXs1JAvRt49Eqe7RQ8kHTmIQM8YkL
         DztfR7vs786yFz/NWY+tj98iYCZf1g7ZSw+hiYlEn8eu4n06NQQtHsdoWnBefrw82e4X
         JgRMdwNOtH1TsNLCS2JlFUAUWaKKn7RvROHzxN8DiqnsuMmonYU7ZASG/GTsKhC1Q9af
         p6WMZASqKWmLBjhU+U46w6obKOdOQ21ztltoHDn7LOyopFKgjnz2c3VSACxM/6HC6KSJ
         M0Qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXqETOF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dccd396177si88565086d6.409.2024.12.16.23.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 23:11:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXqETOF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNRj5-0003EW-35; Tue, 17 Dec 2024 02:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tNRj4-0003E6-3v
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 02:10:38 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tNRj1-0001KL-6F
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 02:10:37 -0500
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so5316433e87.0
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2024 23:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734419432; x=1735024232; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UQae+zCcA79EIlsX+SB2839BhRUwlMBvl5iQNG5MpRI=;
 b=zXqETOF0PTHPyQ2xgbCnCEaQrWUk4DWaLpvj4/rw5VNzwfTTlXOLiqOZCDajB/UcUz
 vNPhYLPOxD+LSSTmX5BtjZ+UXdZ7oGw4u5KrO55XxnRvtshWc47QaDasBrXCezUs3/ER
 fFHHOtN/N9NY7WHQ2VICo3Axp96JK1Rg+dCAlXEldkeQD8ozJ6n+E6Vj2Xfs9dpgg/Yb
 OsJCQr8EPu7NDwF8r52cdp+bqqQr4pj7SrHSbDEeT7V0pu/KF8XzK0pQsLvwBAmXECFJ
 rJ1TJWa6AQIsGMIYIjvn5QVms/yGawBi4SHC/ZBTZtyqoeE2006NiorYW+dvnChptUhj
 zLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734419432; x=1735024232;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQae+zCcA79EIlsX+SB2839BhRUwlMBvl5iQNG5MpRI=;
 b=M7/9qfP/PO4VFaQKdtGYv9qgaYFSGwVs+qZWiE3oe+BmxvZ8/X35XmG56E5kDH4qUl
 swbESyxNcv/Lfp7f87A1dy+iQykuZ/tXRj2V/qgrdoV4shnhL+V3M/slALkDrP2B6h1P
 3baGimaittLvdLCxoBpaWGgHnQ/Nu2J8QfuwCDu8c8wfFge7529b4K9CTmd7vFRqQloY
 5T6dneEOcDPeAJvL9M21bEekGmx0AYaO9U91Z6+Y/FrV5CL2h41oAwlanRgTP9MuGLio
 veeqwbn3lTNcqJScDqp5Gk9Pnd4Ov99T5Od3mzWVXQ+vYmzILDsKpgbJomQbbp/6KTQO
 3bEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQircl8P+YMwA4KfSIuWMzIyiM6EUlFZmMzkUelRrdWyr4z3RxYHGwWbCKrOzFg7wV59PBm2iOFQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxf/FWiAakPcawRtvIxJC2vIgyArGOTf+Eo/8DoS/4ffceT8WhG
 5Wp4oiVfvZ1l9hdZmiz2S0gtg8KTFF5HCA3TYPYPRksL5V7eIhmJrzOh0cVrJxY=
X-Gm-Gg: ASbGncuYM3FhuIKkzpRW0MLs6q18gzT4g+xDav24XRsxSiANkRBPg5QaVT5vN/aafNA
 /gL2yWGyikijJAMRx2auAgJxtIH9sQYMxyxso0TugpblX15Vdtmaf5Gdz9jpVqCSCGL1DUwBg3v
 HxHS9s3W1crGr3FAuiVviZMnbQliGUEeby7wstpagh+m45H+x7OzSDlvpKhv2QiXruytS80Y/TZ
 ATCbYmkBytK+0RBnookxNJ74JkbUQdUQ6ECSue5PkUwKKjDqDc5MRqasBO2xb0boZlUJp2+/jd7
 3ZWUgBN6r6CbNFeLTeuLh9FvDQCgABwzirQhuA==
X-Received: by 2002:a05:6512:39c8:b0:540:2fe6:936f with SMTP id
 2adb3069b0e04-5408fac7b04mr5674884e87.3.1734419431628; 
 Mon, 16 Dec 2024 23:10:31 -0800 (PST)
Received: from [192.168.210.26] (83.11.13.135.ipv4.supernova.orange.pl.
 [83.11.13.135]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120b9f3f2sm1077214e87.31.2024.12.16.23.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 23:10:30 -0800 (PST)
Message-ID: <7d5f349e-761c-459c-93db-cc32ec2a207d@linaro.org>
Date: Tue, 17 Dec 2024 08:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/avocado: update sbsa-ref firmware
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org
References: <20241125125448.185504-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-V3PGF7vst8QFjh+bWVx5EGDt_B9ZCe1OryNV8e39N4w@mail.gmail.com>
 <CAFEAcA_SRU5UtttB=G2=L2YSK2D1U7Rumbc6eafioxR3yfnYUQ@mail.gmail.com>
Content-Language: pl-PL, en-GB
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA_SRU5UtttB=G2=L2YSK2D1U7Rumbc6eafioxR3yfnYUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x134.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uiznw2mV0KZN

W dniu 16.12.2024 o 13:46, Peter Maydell pisze:
> On Mon, 25 Nov 2024 at 13:25, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 25 Nov 2024 at 12:54, Marcin Juszkiewicz
>> <marcin.juszkiewicz@linaro.org> wrote:
>>>
>>> Firmware is built using Debian 'bookworm' cross toolchain (gcc 12.2.0).
>>>
>>> Used versions:
>>>
>>> - Trusted Firmware v2.12.0
>>> - Tianocore EDK2 stable202411
>>> - Tianocore EDK2 Platforms code commit 4b3530d
>>>
>>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>
>> Hi; what's the benefit to taking this update? Would it be better
>> postponed until the 9.2 release is complete?
> 
> We're now past the 9.2 release, but it would still be good
> to know what the benefit to updating the firmware images
> for this test is.

We tend to update firmware to the latest in all places it is used. 
Previous one was built from pre-selected git commits due to changes done 
during cycle.

Now we got both components (TF-A and EDK2) from stable releases.
