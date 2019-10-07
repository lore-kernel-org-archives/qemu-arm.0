Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3844793wrm;
        Mon, 7 Oct 2019 07:09:49 -0700 (PDT)
X-Received: by 2002:a25:850a:: with SMTP id w10mr11392201ybk.330.1570457389841;
        Mon, 07 Oct 2019 07:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570457389; cv=none;
        d=google.com; s=arc-20160816;
        b=pFUz/BXvafaRKhjGboqvuRQ/xep2+ItbaNfy0BwHU7knuLbCZycZ313Dp4H+I73gHJ
         timoqvun5pUQJN1YO1q7JCwuF7Wc6mNSO9RYp/egAdvnZXVMVnKILPtZliRLX5rlNalP
         HA/pL9U0ndqncB50bFFXnHQeE1uz7fwYc/n7O3ms6pNiH13VSurgWhcB1U47kUKEDTEI
         WGfq7njxDcO4gf3MuulAmzKWIAsDFGhl98YzkwjUZtMlapGUwmtCQutERq/OXGdixXZ2
         umt4hGWb20jT7hrlw/4+immYg6n74F7Euk72nGVoy+cYcvKGj2cIrTc8j4HHO2m5PEpq
         0SlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Ddr5Al70vUzB+KYP1WXeVhBnDvU6Y6cu1I5Fz4+jeO4=;
        b=eck8FPKsBvbsM8VwvJ7mS9BLTkYYjYhTqiU8mbeFEvARTaWixKr50Y6g0Gn8pT0c3D
         MEJSTvO5rsEpLums5ty8uAj42e/TMzw9TC7iOAz+KP80NI7TgBS4wO3Z7U2N6S4tp5/y
         5bUKp2FUpac0Mv+K4A0YsSV0FEzCE7B5o4vgnOPQeCAb6FGKg3CWHJM+SHwkIjTuqVh6
         7FO+oQ2Jkmwz4A63b3xxUK9s4ainyPC+iJ5sTHCpYTxRllvXnMYrK9ZpNbXqjC3kdi7x
         tBNs/TRwjeJ7PNIRIEahU0e9AUCfAWu4/GK/l4RNs0jzGFt/8Tsu9iH/nZfXifRn2Alz
         9FTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oM6bIJ2U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b62sor7761883yba.87.2019.10.07.07.09.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2019 07:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oM6bIJ2U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ddr5Al70vUzB+KYP1WXeVhBnDvU6Y6cu1I5Fz4+jeO4=;
        b=oM6bIJ2UgOzWJs1+zyNl1Rla6fsu8Nwc4ZKuWQIXqWkz2JFgTyOvtgqwINrit0nOZT
         daAGzY2SCHCJT31exGWNarEnAYKRMxk0UumDL7l3sJXDUC7Ifg7+P4/cjHsQtbnXMXvH
         8VguJ1JcXExl5jHaKRCMxrvDYkLynshwDgakZRPAjZrQGxEDah/3K9j+A/UStDm4/Gtd
         0D9AYB4SaNk6bS6tZIEoSH8K5Qyt7tKxuQuoO/sdAXtdSsRRZdToBNFQhDQ8Mlp9AExQ
         sAJIwKoqh/9a0olcZXCmfbVAt4fd9vZ33CnALj6uKGvBccwi//LoPW48OJoLRAVaCCkr
         czxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ddr5Al70vUzB+KYP1WXeVhBnDvU6Y6cu1I5Fz4+jeO4=;
        b=tuiFoslsqlo+lYFOU/B7KZrvgMTlkHV1UNVgPBisjHZZD+QFOJ6iWV3jAqUfjDWuds
         Vy0hX8t63hmcSMIyRJez2jTaKbSsEuSqxQNu/LtHRuQTV0yk6C6sUuF2Bezkixrf8erH
         BWyaJ9gJ4qybntv2scMxcIDPjMJmnV0rHt54pepJ4oO1DgKPJhcQJmH6X8sGQ/J+/4EX
         jKJc7vhDRQv/0jTKqIvp0ltJ32mTvO2a/31IGrH0Wb2920D6Phw3sgM6dPLLIkHSPpGz
         cmEYui2sgZaUn8e4GVbEPdQLxRnTvCjrJSYdT8AZXJJTJmpkL4AsrRvSxMbpIcXXOkNk
         3cjQ==
X-Gm-Message-State: APjAAAXD7v+gSDRVan2hdd9CkWXy7knnsuT9znH2FNyMgXwdbSFMeDbF
	pSMT4hcJDw+fevPBwLhYPu1vQoBrE7IMxw==
X-Google-Smtp-Source: APXvYqyIEDWv2w3MIOTpDHsSSwfxxJ30kHEQeCh23AUYqs9JEM1IZxdnYPRHK4671pKANxFC7/2xpQ==
X-Received: by 2002:a25:da46:: with SMTP id n67mr11244684ybf.467.1570457388996;
        Mon, 07 Oct 2019 07:09:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
        by smtp.gmail.com with ESMTPSA id y63sm3689519ywg.5.2019.10.07.07.09.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 07:09:48 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 04/15] target/arm/arm-semi: Make
 semihosting code hand out its own file descriptors
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <842d1592-1cda-2c58-93bc-ed6391d093b1@linaro.org>
Date: Mon, 7 Oct 2019 10:09:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Ys06SUU1g2Ci

On 9/16/19 7:15 AM, Peter Maydell wrote:
> Currently the Arm semihosting code returns the guest file descriptors
> (handles) which are simply the fd values from the host OS or the
> remote gdbstub. Part of the semihosting 2.0 specification requires
> that we implement special handling of opening a ":semihosting-features"
> filename. Guest fds which result from opening the special file
> won't correspond to host fds, so to ensure that we don't end up
> with duplicate fds we need to have QEMU code control the allocation
> of the fd values we give the guest.
> 
> Add in an abstraction layer which lets us allocate new guest FD
> values, and translate from a guest FD value back to the host one.
> This also fixes an odd hole where a semihosting guest could
> use the semihosting API to read, write or close file descriptors
> that it had never allocated but which were being used by QEMU itself.
> (This isn't a security hole, because enabling semihosting permits
> the guest to do arbitrary file access to the whole host filesystem,
> and so should only be done if the guest is completely trusted.)
> 
> Currently the only kind of guest fd is one which maps to a
> host fd, but in a following commit we will add one which maps
> to the :semihosting-features magic data.
> 
> If the guest is migrated with an open semihosting file descriptor
> then subsequent attempts to use the fd will all fail; this is
> not a change from the previous situation (where the host fd
> being used on the source end would not be re-opened on the
> destination end).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Change since v1: we mustn't treat the return value of
> arm_gdb_syscall() as being the new fd from gdb, as in
> softmmu mode it is not. So we need a custom callback for open
> that can update the guestfd association.
> ---
>  target/arm/arm-semi.c | 232 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 216 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
