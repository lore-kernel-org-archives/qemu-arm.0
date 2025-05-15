Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1935945njb;
        Thu, 15 May 2025 08:22:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYcjozsA8UhEFIqIO1zEXvl36CFJXWcHNn5cS/AsAn70rx5+k61FeBSdXWoyAWqo+IhMs+vK7h0n0aaA==@linaro.org
X-Google-Smtp-Source: AGHT+IG/vVryYTodprEcWlhu12siHf1sSPlcHm5jYfm/jwd/ko6wUipW4YfnaeesOxM+YEgZb90d
X-Received: by 2002:a05:6122:4147:b0:52a:916e:91cf with SMTP id 71dfb90a1353d-52dba80e89cmr85050e0c.3.1747322550019;
        Thu, 15 May 2025 08:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747322549; cv=none;
        d=google.com; s=arc-20240605;
        b=MU0CImHpRJrTU0DgwqWzEgYzDOE8nJuZBQJD+hjJN3LLO2t5ZQnc5h12WiAVh73FDS
         cHEKwYOchwaRv7jIlFozt0JF8uvMrK8WMMgHWzx5n+fxxgF2KtfVJv0FdUHePfqgQcH4
         U0+d0XI7U4bOCvWyG0r91HTIojD/L6J/xjNxYNxwX5SXo6vGBrhtg+FRBy6fvBJMxNxQ
         MgMA19Mk0rUUvhiQC86eFKTQ7Y3ROH98srppxz69aUMrMff0DuGYwGLSJZilS0++q6w4
         WmcdPsofViFVYmwcwb1nEIn7fiPtGAm1CfEHdaspY2SwPR3nd7v4OC9LASp4LZitNzOf
         HM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8Wwaufpr8Z6a4ck6g2EdvI8iMo2hfWASSYRcby6tdEc=;
        fh=Tb0yAUdE/DqA/GnWRpfW0r9H/OtgFehHB2XTCRw7kpY=;
        b=gDF7coTh6udvOUFjh3ypt9FiXQ00j3pi1Dm9PS/Ifdr1gOE5S5/6bRMy0/GRI6kci2
         raevo7ka//zpdiB7h6GD1mA7n1GJJ7YH6gQS5nCx7NXMMyu1hdZ8rYlKicqOq7PhcGQr
         h9aEl/ZGYdp8lcFjycATxcjoTza5+KgIGG2uAfljLWnI5RF4ZD6Eqh9ggfh8LI7ShUZM
         r3VeKiZ4KFMBZAj/RsUjVUUZ5y6P5RRgiGr+uUJnPXnJZiG6bHm2REM1mV9D/qe/xHhd
         KW8Nuu+0sW7+1mH9aQ+XkF6aeez5egrqj+5I/8gvsrIirqrHC13wKFUvE4FogI+Rayhw
         rAdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vS1oM5lW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4dfa66bce22si63071137.185.2025.05.15.08.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 08:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vS1oM5lW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFaPW-0007qH-Ut; Thu, 15 May 2025 11:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFaPV-0007ot-1T
 for qemu-arm@nongnu.org; Thu, 15 May 2025 11:22:13 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFaPR-0002nX-DC
 for qemu-arm@nongnu.org; Thu, 15 May 2025 11:22:12 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b26d7ddbfd7so921611a12.0
 for <qemu-arm@nongnu.org>; Thu, 15 May 2025 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747322525; x=1747927325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Wwaufpr8Z6a4ck6g2EdvI8iMo2hfWASSYRcby6tdEc=;
 b=vS1oM5lWXnHL2bD1+v4TSycF4FvM1anQYbsvCkTkjnimPrJI5kvxPXOFEHv4lmPFpN
 jcl+3N+M6qV/hiLvbXGrrBOqw4a6LqLHf8wXHI2eoP0TdIXMiT3Tw6XRzAGb66eCWvTk
 IraaP5dawZOe4mtWT2oG/voCHoAcbumLjjB2T2M4+wepHpGDxHjST7KLHzRrksKkw0M3
 O868vjY7rE1viofD6YmtDYnQzL5qNw8Pq/27ftlTQlnVnkLk38e1dHmbdZRJX72KNYmy
 slTN9FxvZRrzIE8BpBkQgRHjp+O+Y9aX38vF2MujtN+feJd1eUbwD+4YXhLZmYvGnSk+
 1XrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747322525; x=1747927325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Wwaufpr8Z6a4ck6g2EdvI8iMo2hfWASSYRcby6tdEc=;
 b=ArpOlYM2PFS9/XDIkNo2dQd+HbiMQNjwPq1xoqeNmpyCAmAjzD4LS/6LFv/mZUNqFP
 4KXLLvRd3MnpT+hQzf5Q4orGLqg3D4N7wDvyPrKEkf+vsHUQgb1Dcynny7xV088FIT/y
 hihCCsxJCp3H75awwbAAsll9Yl9WR13AURbzsHKjKvClIyYU/RliawXqFE3kDqdsr+DW
 p1r1Gqq/IUkGQI7Eq7pomNskaysEZXvJUKLPGHJdMhshRLPAeuNtIJX75MVh7BiWZZrm
 tiKLodZ+KGH8tc68LP/CYKLUQgJrNZMwKLgsrR/+WCjNLX7UYqSfNgTgyoBMIe5waypX
 8Htg==
X-Gm-Message-State: AOJu0YyUpD2qUyEZ/i5zzd1PoD6vSApFFU6X9dUf1Fyqnqd3qxAy4gdj
 egIbQqtZ2MmXn+41OGXembAyzW2BEPCum7dcLlVlVqxTznVegaUiVi2uYtFMDXPVWAgn2GQN5s5
 N
X-Gm-Gg: ASbGncswSHi5iVVraByO5BxWuodDgqvhWgatd4YVIDw/rIgYg6P3gtcB4UBL2hfF69w
 45TN0uwAoI5fr+TrIesxyoWFeswAxcxyaGjoukJ9uBWdSFsOlgl9zSO2mCRLkWKURUTw6BU7xl9
 aKBAK65RuJb2X6NSUQIY1wwClR7UwCzu6lC4smoXScFeVYrhOVOiNg5WxHnjfKMs7G2YmQ5QzgW
 NqzBtj/v7Mg09zAlz4+J+/i7mqhJY55aOhuDQ3A+be1AYLwPLNFwIODpvRxML1Jo3Qdz21D98YI
 jboPa2Qkhc6WNiJSbHEq6/WebSqiKi2qRui3AycaLoKpqCBexbiePUsOUNG0+XVW
X-Received: by 2002:a05:6a21:4cc7:b0:1f5:7c6f:6c96 with SMTP id
 adf61e73a8af0-215ff11a577mr11182366637.22.1747322524885; 
 Thu, 15 May 2025 08:22:04 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb084980sm34145a12.58.2025.05.15.08.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:22:04 -0700 (PDT)
Message-ID: <b5c07354-fbe8-4910-a019-fa9fd7e813a5@linaro.org>
Date: Thu, 15 May 2025 08:22:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] target/arm: Add arm_cpu_has_feature() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-17-philmd@linaro.org>
 <b6c81748-091b-4d61-8d34-beaa0442aab3@linaro.org>
 <f7bcd8b2-2c0c-4907-8a0e-af172c235d56@linaro.org>
 <59b1ccbe-9ddb-43f0-98c4-8000a08d27b0@linaro.org>
 <eff0b1a9-5267-4290-a9d4-da95179289b9@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <eff0b1a9-5267-4290-a9d4-da95179289b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52a.google.com
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
X-TUID: LPaH5s0DEQbv

On 5/15/25 4:05 AM, Philippe Mathieu-Daudé wrote:
> On 14/5/25 18:59, Pierrick Bouvier wrote:
>> On 5/14/25 9:53 AM, Philippe Mathieu-Daudé wrote:
>>> On 14/5/25 10:24, Richard Henderson wrote:
>>>> On 5/13/25 18:39, Philippe Mathieu-Daudé wrote:
>>>>> arm_cpu_has_feature() is equivalent of arm_feature(), however
>>>>> while the latter uses CPUARMState so is target-specific, the
>>>>> former doesn't and can be called by target-agnostic code in hw/.
>>>>
>>>> CPUARMState is no more target-specific than ARMCPU.
>>>
>>> ARMCPU is forward-declared as opaque pointer in target/arm/cpu-qom.h,
>>> so we can expose prototypes using it to non-ARM units.
>>> CPUARMState is only declared in "cpu.h", itself only accessible by
>>> ARM-related units.
>>>
>>
>> Maybe we can simply postpone introduction of arm_cpu_has_feature() when
>> it will be really needed.
>>
>> Patches 17 and 18 are not strictly needed, as cpu.h (which resolves to
>> target/arm/cpu.h implicitely) is perfectly accessible to code in hw/arm
>> without any problem.
> 
> OK.
> 
> Peter, would you be OK to take reviewed patches #1 up to #15 (the
> previous one) or do you rather I respin them?
>

In case you respin, feel free to include the base series, so we can 
combine both.

> Regards,
> 
> Phil.

