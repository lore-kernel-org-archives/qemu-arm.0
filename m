Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp213213wrg;
        Thu, 13 Jun 2019 14:32:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9vsqfAgHArudX2Di/T2E5vsaY+K2Z7ZOMfKCVeZkr8QauxF/wT2E0ucoFt4w+MHo/+zY6
X-Received: by 2002:a37:8dc1:: with SMTP id p184mr73032266qkd.226.1560461558903;
        Thu, 13 Jun 2019 14:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560461558; cv=none;
        d=google.com; s=arc-20160816;
        b=lotlB07s1TJ72bP+kv2iYJxfUmRJlbSwKrFTX409pIvqqfOrwUOHPIB8Z/eY3MLJGJ
         YDVjC3aWIvCglBAv2amK3E3L/0ZJd/MVfhRamSwJvplx1mjEP8h2ekwOJOJCKRslhmtF
         a/lMoTbaaCK3ErO2SW1GLJnLcuPx9JHcnty03+y6Txsjb53nqV32tBjRjF/PmTVbgZCT
         orwSUU2htPAjpbqYT7htyjT6jpg1MKMHl67/GVxV25xbHamJ3vm6kBfz7eAT+98kPy7y
         g/TQeoq4oPUBSC9pook9uwxbJetpJNDlt8eWMUSsLPUIqE1GhFR/JHKUxSZ24i94wvBR
         DwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=xliFVyd+L1z4t/SGEf7l3fazrap3Sq4RK1AsGcXYU14=;
        b=gf1ht3U8RfMnKqKR7OgFxTveW3UhgrLc8Y/5VTLFXWNnfiXCniovKyoNXCxyZ2cgOt
         l5TNC/xFQscZS54BarMGaqVHKRHt5xL1k8qwwRdMXHmqOQ87fjBzRUeSmwWgDUyPkuHl
         RvoLl5JWiZdk4fAEfCMpBzOTRM8dceBwuFOumkPTbhH5dCgBeV98jZYpId8Shw0V29OU
         jCz9sAOEgNhUUBl5EQ+GCsenYk+hEG6QvvM+v/dG5J+KCUeFj+P/8cFAYlItfPnFVrne
         v0QTWhF7snF9VoqJ+sg4V8GkXGbWKR1ckyZIe5SZrV1+gcAZFdLPsLDpjilXuDdsbxT+
         I6Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WF0fLdjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si439480qtg.142.2019.06.13.14.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:32:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WF0fLdjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXKo-00079h-BX
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49724)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXHr-0004xN-Hc
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXHq-0000ji-CZ
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:29:35 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33789)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXHq-0000jE-3Y
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:29:34 -0400
Received: by mail-pl1-x643.google.com with SMTP id c14so80916plo.0
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xliFVyd+L1z4t/SGEf7l3fazrap3Sq4RK1AsGcXYU14=;
 b=WF0fLdjO/u4RlMUDYj4nwBGuLbz2JknqUCaCVGq3CmK4yLs9ulXXW19ifpFl2+hVke
 2dmv9b8CgnfZxtemLv2U97byVKfklbh62Q3O5m498OVOW5eFmUE9fc6ogKwbYDj4MYFa
 B6vzvnd1dYkhuMr9jdw5Szs6RP0F9m/whgD4RgcvzAHFhPd+982cOGo5HeRenDrC5D9/
 7hT/9FwY6Acr1fjvPJONQ39zW/q+Kn/y7vaujTUiFxYjHtOoZkKI2NLjoKw0EmDBT7y9
 G5XgzAyy8h8om7OHB6wryzRJ9Y8x5wX8ZyarfoGmj00Qv8ZHzyvDwPqXCHCQSB47Jfmx
 2x8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xliFVyd+L1z4t/SGEf7l3fazrap3Sq4RK1AsGcXYU14=;
 b=o0OkLSqeR95RIXZ8klaBYnkB/QpxNoWFs4D/xHPwzgOYNxe0UxWTIBbZZSVbzoXEIv
 whGAW3honIpw1eDMivLnugyqOan3PvaMgXDIZQf/4qKhuGPJI+p0AEvv62Ld4tKOyDuE
 hXZvbBI32ydyHz0T0ESb8ZHIN6YDIHE6nDlvBt5/RXouZ6xdypkQV80xUVZmeOcWTbL8
 OGoD7lA7ngFMYNAOEynbQDeMl+WfUSJHJ8/jEUWIjHBqoujx/lxWNpV0PLdntaHMWX2/
 Z+2w0lzHrbvPm2ObWCFuJ7px6AaK1EswhwFQilhW8y3ebcttK+PfboA5SfRrILsZeUyI
 yEEw==
X-Gm-Message-State: APjAAAVpBPa1DyEjm5Bf8Zm79MVePOMwL2mwzdxEwDFlx2yxNDRF4oZv
 lWmwHLeDR7xwoZTXSR7rVMFosQ==
X-Received: by 2002:a17:902:27a8:: with SMTP id
 d37mr90318116plb.150.1560461372860; 
 Thu, 13 Jun 2019 14:29:32 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id b17sm658899pfb.18.2019.06.13.14.29.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:29:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dae3bc40-576a-c592-3bd6-c30e2938ebd8@linaro.org>
Date: Thu, 13 Jun 2019 14:29:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [PATCH 08/12] target/arm: Stop using cpu_F0s for
 Neon f32/s32 VCVT
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ITUUE3zUmrhT

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Stop using cpu_F0s for the Neon f32/s32 VCVT operations.
> Since this is the last user of cpu_F0s in the Neon 2rm-op
> loop, we can remove the handling code for it too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 82 ++++++++++++------------------------------
>  1 file changed, 22 insertions(+), 60 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

