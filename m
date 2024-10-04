Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp460415njb;
        Fri, 4 Oct 2024 06:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZfKaVNtN5vbWpzk5ppzTdw5GhH7eGhp612iMribPWbbVCqIBR4D9dMulJg6YSHZswgueYtohmIrZFzw==@linaro.org
X-Google-Smtp-Source: AGHT+IHHGntvLu630x/myVQP0A+2P/HebQHWobP5L83+HVcDMgzNFI3u6G5tE1rIpqf0oXGnGvov
X-Received: by 2002:a05:6214:5d06:b0:6b2:de80:2be5 with SMTP id 6a1803df08f44-6cb9a30cd17mr40840056d6.31.1728050087402;
        Fri, 04 Oct 2024 06:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728050087; cv=none;
        d=google.com; s=arc-20240605;
        b=bzlfE3PBOpCY/9fYTfUJ0h9GWKRDYYZN9UzoXdNPFH1LZsiWx/9wkV+CKyLJ6o5JpU
         CBUHv3UcogRZbOfgVkU0nM3lYQUrib2J516yUgMUMzk3uHUBeYlKwDsh8MytnSx+3Ext
         iR13+lix9/N3H91mgZhvtZPPAXSW32lsYVRRwPvLnPbjXCHnGLpxF1aokls0kW8qRlhl
         kXwnPaUGTJGPjMBFr8vBm88sUUEMA9XPofeWcq0k6n2GAg+eAQioNQeuNReyXep3tOOF
         QkTSBj35+KN5lpQrkcv/ZYvIvY6OTEVy2WTcNkb/FUXbA5fshjgLzFY377SALQxe+gSY
         biYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gu/DFFYEw7/VG36tvxDS6RaxAlNo/zUlq3tKZeME2ss=;
        fh=B/VV400p7W5+9EL0aQwmUn6DJhlVZQ0y7ijwGefL83Q=;
        b=feM6xjnF9DrM7Xdv6YKi11thwPpow14VDMHApOZHZIgepgG7uT0odG1am1h46MTcYf
         UaU22lgDTfGt+SR6sIP9LzTH3DGwHv50EqodTzQjslEbHAq8u1MCVUf6PAVMnhWtA1/S
         VwmkwLuwY8o4tTS1LfLRLOdcfiux3YI81Tq4FEQGi7aEFf7IznL/ZFmslL7phLv7pM1x
         4rhpEPksC3PeZ1Ijg3QfjUJflkr66BabEE7DrY9jIad2/HWl3DPAs3uXF8ujhr1+tovA
         HtEMVVX2ywfZrL+UgmykJogu9zWtk8DAXOsF9xHmKKWqDo822GYhU7If40rXSjsyUe/q
         bt0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BAqjgEex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb93830544si37296146d6.328.2024.10.04.06.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 06:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BAqjgEex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swilN-0001Zq-UT; Fri, 04 Oct 2024 09:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swilK-0001Yu-FG
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 09:54:30 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1swilI-0007B0-Qz
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 09:54:30 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-71116d8504bso1316641a34.3
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728050067; x=1728654867; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gu/DFFYEw7/VG36tvxDS6RaxAlNo/zUlq3tKZeME2ss=;
 b=BAqjgEexfBKt/1Wm2MQuQbsgLXztGgzpIFA73ocjIyCrKqNKrCzvO+RoZsUpxaq70F
 QP/iZd/PJ0KNTzx96el8Cd1FJBWreigzafmG5ZM14Orh/xIg+ZWn1FOC1T1zlFXDYeMA
 dl9k+TCLz9I7sb4Yoqw8hSBAg6YdsMycUHVHWyVjQZGcVxxgCyyHP8kxpx3C5psvEAZH
 QtDGNrXqvwvpw3NyOyBT9Lq7twpr1hVWh+fRF01/Wc+2S/Jdmp1vldVYhnjTmae5wMk0
 helLweCuaS52OLCPixUlXTguVuUmeE5oGFhZk95QxB4nK3SEfVQn2IGDY17NwiyZEcRc
 08bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728050067; x=1728654867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gu/DFFYEw7/VG36tvxDS6RaxAlNo/zUlq3tKZeME2ss=;
 b=IjIRQzWvHRsBFigQfFtpLE0/1H4IyuBIsggncxLVtCuiIdwDoqjrsHExdMtbtroM71
 a2XGInqHApbpiMkNfE58RaQfbuJ8zd0u2C3VCZqxv0JdaL4qUKnERITsQUs4WIgVJeHf
 pEZHGMs1oPUqMzIgtLZ1umOWcpdBM0y9FkX/6mtKvkNufUIbSK6ipa4gcJOSrlSumAC5
 +I5zyY1MpDMLjcEJd3j724xDnZeUeiNz1fTYt4LNRZ4y//uX9yP/TCBQ7msWDO8Pa2D9
 XWic1s4Ha17hbGopgjitPqmu5A7vcxw3F3eUORszm+oi/o6K6BbwHXxXvPpsApo3yIo6
 Dq9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzQL9I7v8zsZuEpPEdDsZVsC6PNRNlspveOrgK2m6QghEawUzoYEnmIjnnJ8qoDJ173nu2CXzkCQ==@nongnu.org
X-Gm-Message-State: AOJu0YzJIbY2Z0RK7L1+ScN0THrQyFDkVwphdz2UxNO3HD5TsSqQ4a4B
 GWGlkgbQH034sCCWJ/Md/0gPT3Do2FQx4xTjxJ7IAHQG7k4TBa2jZ5th2AW+0Bg=
X-Received: by 2002:a05:6830:6e99:b0:715:3a11:eced with SMTP id
 46e09a7af769-7154e81a955mr2202391a34.5.1728050067329; 
 Fri, 04 Oct 2024 06:54:27 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71de8b6c1c5sm1238273b3a.166.2024.10.04.06.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 06:54:26 -0700 (PDT)
Message-ID: <927dc38c-e5bf-4522-a857-d580cab924bc@linaro.org>
Date: Fri, 4 Oct 2024 06:54:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm: drop last bits from deprecated boards
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20241003140010.1653808-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241003140010.1653808-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
X-TUID: FbtjAkUkbi/y

On 10/3/24 07:00, Peter Maydell wrote:
> This series is the remaining patches not yet applied from my "arm:
> Drop deprecated boards" series; this is essentially the device
> removals which didn't get review in that series and/or which had some
> discussion about whether we should remove them.
> 
> To summarise the remaining removals:
> 
>   * max1110 and max1111 are SSI devices so in theory could be
>     created by users on the command line. However I found no
>     evidence of doing this when I did a web search for
>     "device max1110", and the utility of doing so is unclear
>     to me since it's not possible for the command line device
>     to have its ADC inputs or its interrupt line output
>     wired up to anything.
>   * max7310 is an I2C GPIO controller, so it has the same
>     "in theory a user could create this on the command line
>     but in practice it's pretty useless because there's no
>     way to wire up the GPIO lines to anything" status.
>   * the microdrive device can only be used with our PCMCIA
>     bus emulation, and we no longer have any boards using
>     that, so I think these are uncontroversially deleteable.
>     Some boards we still have should in theory have a
>     PCMCIA controller (strongarm, kzm, sh7750), but we don't
>     model those controllers and none of those boards are
>     sufficiently interesting or active that it's likely
>     anybody will ever add one.
>   * The ECC code is entirely unused now; this is an
>     uncontroversial removal of dead code, and I only didn't
>     put it in my pullreq because it wasn't reviewed yet.
>   * Consensus on the v1 series was that we could get rid of
>     -portrait/-rotate even though in theory you could use
>     them on a non-pxa2xx machine type to achieve the odd
>     effect of rotating mouse input. I've added a section
>     to removed-features.rst about this and beefed up the
>     patch commit message.
> 
> Of these, I think we should definitely be dropping microdrive,
> pcmcia, ecc, and the portrait/rotate options, and I didn't hear any
> dissenting opinions on v1.
> 
> For max111x and max7310: these are fairly small (a couple of hundred
> lines each) and not too badly behind the curve for code quality/API
> usage (in particular they're both QOM devices), so I could fairly
> easily be persuaded that they should stay.  However I would like in
> that case to see:
> 
>   (a) what's the use case/user ? (e.g. examples of "I'm
>       actually using this on the command line, like this"
>       or "I'm using this in the machine model I plan to submit
>       in the next six months")
>   (b) some kind of testing of them (which we can write
>       based on the answer to a.)

I have no trouble deleting them now and resurrecting if and when they ever get used, 
especially since I think that has low odds.

> Peter Maydell (6):
>    hw/adc: Remove MAX111X device
>    hw/gpio: Remove MAX7310 device
>    hw/ide: Remove DSCM-1XXXX microdrive device model
>    hw: Remove PCMCIA subsystem
>    hw/block: Remove ecc
>    vl.c: Remove pxa2xx-specific -portrait and -rotate options

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
