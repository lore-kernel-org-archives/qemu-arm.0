Received: by 2002:a05:6214:603:0:0:0:0 with SMTP id z3csp2452334qvw;
        Fri, 28 Feb 2020 09:41:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqwb9onk3gg3g2ItM5wv5G/2F9K6dpGCOE9Y3e9QfBwStvM2IlYdtyLd4TBVlKa6bf74H/SI
X-Received: by 2002:a05:620a:1364:: with SMTP id d4mr5440495qkl.391.1582911692132;
        Fri, 28 Feb 2020 09:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582911692; cv=none;
        d=google.com; s=arc-20160816;
        b=t1TMS36yJQDIwPohBkaAdayjezRa6wff2hxCCDTkv4TjMYghkGhwyuFx/Lv7Yoqn/t
         0wK3diExsmFmdXFpbfgsZEhOr+eOE70ZhlpHfU96av0MpDQgH2/zE500YqJvqaU2HpVt
         xdbNHGe5AE0z2f7XHkMOJl5DrXe8vruMB2LvzuyTTd7zLgNMWnWr+iNSYO0TWWa7gRZ9
         AyUXYF2oWBUJYKUrGAcFQ6Z62sHf2qG9A5QJ9HasNMg/O2CmKXx9pYm2IhcnjtY6GxDl
         LkDRE5rZgrUlRFKF7HjfBJFUKY3lO6HAT+PY0iwWVUNxR6nv/Gg9vw2TIPC9J3ld9rij
         nsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Z8DMy6RHo7V05MdBEsjHjDWbHn4NWD6APyZC5U6Qnno=;
        b=XYA1JkGbQQxY9FcnXLj/p03Bv379VM3EiR9VbSx2mK1PEI8+Ee1sTeFumzBuLMcouc
         b2KpwiUlt3ljziCBkLzLgxgGuVOWCVrPZuGkjqW/Z5oO8XX0vW0iugMCuXP63mpISdX0
         ipCpKit6ID2f0tiKUtUKgvu7n4QIpXAGtcByPCcRMlMcy+7IjNDHoCvtclpFKd7/zYoM
         SFEE3OHNMntdbpTt0Q6r44NF+7lkluq0z0bSICJZ/bw3cJLcD/P3P1GBvObmgS3ex/2S
         oWmeoaSFmu/bAc+QOqthFR9onB5JWxRGvIxrNVymjw/eNHyFb1nc2Lh7EvppPBDQpgd4
         vBpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IJzPdg3d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30si1810545qte.281.2020.02.28.09.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 09:41:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IJzPdg3d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7jdj-0001lD-LG
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 12:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7ixH-0007Tt-Tz
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:57:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7ixG-00062w-E8
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:57:39 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37285)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7ixG-00062W-0C
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:57:38 -0500
Received: by mail-pg1-x544.google.com with SMTP id z12so1814175pgl.4
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 08:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z8DMy6RHo7V05MdBEsjHjDWbHn4NWD6APyZC5U6Qnno=;
 b=IJzPdg3dvnRuosoVzk/yukQhJx+yEX9Y/cWcA5hBCSMUUYux8DKBTvbIyHXe9Y1+jZ
 xIceqtfQb2kTk5ccad8UP2ImYRwbAX5E1D/k1wXeo+cR4H8388LGLetiA/GYA3SbMjj/
 ZljTf6NLD2xZ0+2dVVYjB0mMB/UTaj+QobJaymPH1H/zNNR1aVT8agiscWnft5tVEmfS
 5GKObXeFwnsv4GZamxsL/JiUDpWiWHdidcPV5zj0FPO2tkW3Og7ziJaKoT9EM0QO2shE
 IpO8RkoibKR6BAv3/HQBG46DwI3Lw7LgjxeC4/JqKv1INtQo9JoC/M/imCGoW+Fh7RC8
 DLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z8DMy6RHo7V05MdBEsjHjDWbHn4NWD6APyZC5U6Qnno=;
 b=mU4fS38V6O1TVWQr5cTVxYDVnMc9RgykgF5CHaRkSIH09Euj9X9lwRAgLI4U7XmDxr
 Ps7wB+k0FSgsrHOajtzV8yxZ+J/Sc0Pl8Oj8CiGl3FmW2rdnDoGz+uU6Cnk5lvfUum+A
 FTMrpqaMD40XGRlH6sk6eZXmZBJKA88HCxOYy9VxefQ7XCEWxJcLgoCNkQn+1ETAy6I9
 g475pFp/DklnV0zC+PZJwWEOMEWF/A9JPuAogEppTrYvegDafJ06NdbBmE/GbjpPMi/w
 vKoWIwj5V74hQQ/1dS6D/fDSGUiMURqGNPHwJu/a39RAt5Y3u9BazWHHWYjDxUpL58TK
 cXHQ==
X-Gm-Message-State: APjAAAW4FyxfLFhAOF/VL173njuiH97EjtCErU02DtQdbLL7azbcE3hR
 oldb+IsaVPE2oX65t9MoyqKZuw==
X-Received: by 2002:a63:f501:: with SMTP id w1mr5831379pgh.61.1582909056105;
 Fri, 28 Feb 2020 08:57:36 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 i11sm3029224pjg.0.2020.02.28.08.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 08:57:35 -0800 (PST)
Subject: Re: [PATCH v4 1/7] target/arm: Improve masking of HCR RES0 bits
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-2-richard.henderson@linaro.org>
 <CAFEAcA8ipK0nZioEgbNq5B1L-tqA+rzn-C2yyfet4_4yNVnYqA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4a70637-f4b7-eaa7-237a-57053c5a63cc@linaro.org>
Date: Fri, 28 Feb 2020 08:57:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ipK0nZioEgbNq5B1L-tqA+rzn-C2yyfet4_4yNVnYqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ePfvxk+PT7Ky

On 2/28/20 8:22 AM, Peter Maydell wrote:
>> +    if (ri->state == ARM_CP_STATE_AA32) {
>> +        /*
>> +         * Writes from aarch32 mode have more RES0 bits.
>> +         * This includes TDZ, RW, E2H, and more.
>> +         */
>> +        valid_mask &= ~0xff80ff8c90000000ull;
>> +    }
> 
> Isn't bit HCR2 bit 16 (aka bit 32+16==48 here) also RES0 from AArch32 ?

Yes, and it's set in the above.

> I'm not really a fan of the hex-number here either, given we
> have HCR_* constants.

While plenty of those bits have names, many don't.  Shall I simply name all of
the ones that have names, and that differ from the aa64 masking?


r~
