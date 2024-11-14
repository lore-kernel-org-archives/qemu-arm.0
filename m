Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp556904njc;
        Thu, 14 Nov 2024 13:13:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEL5jJL+XkajNEmTgiuhLb+RBkHuMVlh8RvkKrp9Kt1STg09v04ks8zzBsS/XrvdlkGug9co9bwL7Qsg==@linaro.org
X-Received: by 2002:a05:600c:3b99:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-432df74c6c7mr2064995e9.16.1731618788490;
        Thu, 14 Nov 2024 13:13:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618788; cv=none;
        d=google.com; s=arc-20240605;
        b=VPhIuidMMp8NMLtybpecZvI2Ez1EjWlkBYyae0LhXwnShUAskFQTVNlkEDulycgpiU
         D/EukC8o6vok6jYHOIQHQ2ilo0+yNtrJh91HRypZ74zMGaQjrE7TwqFlnZeFsS1TQTsl
         DACF4Y3QNjbfqOoIi48+JlDwWd1bwqJbQo1jbKD5W6+ADsb2aZWy4iyLeZknMMCdyFM9
         aJFZFW3pb2rO7eedHWWPUa4BACrxuNNijmV9wcpYz6jrLqvAInXNGVk0yqrq5M+vs2+m
         a+u6H8df4NTw4J7mPOAsq1qgZbgtdh/3M+48OxWfjTeAyTPxqU3igct8mYteSiO0sJQx
         Plmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BhQoEz1AwEdA7j3JwLiWaYoSglgpi7vLBsBQwLuEyRk=;
        fh=8RRSnWbS5zzTUz+qp/1FSjJgNvIdlF2Xu9Eop5ZCnGU=;
        b=QfM0apIoZxWAiX2Ixr+QDjm6JazkoGVjyNyjCVw5dXqrAsQOqC8fEu8zvYnELptZ3g
         36i3RaMeDyZxr4mv46t/jKp+27xx5FY11kUYVlPeuhIHaHoxOECdu6JGv3WcbaTie28V
         ry6loMjCoU/IrhbX3vRLPvBU7t51mejNRNvxVPwad/6FsBQGsl9YABkDXah3LpF5JhKJ
         Q+LAnsQuLmupixVZxW/fDBkN3kABS2QJANH0/9BYIKm8un4jdA7m8T8O5VvABrR2Zo3g
         xOKDN3ESdkaSXJHBGBTbxb8xylvY/kwtoOcowgyrPx9urX7sINu5UeFf/3hyPF75UDu+
         X/rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlx1GNqs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432db233353sor8836545e9.12.2024.11.14.13.13.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 13:13:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlx1GNqs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731618788; x=1732223588; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhQoEz1AwEdA7j3JwLiWaYoSglgpi7vLBsBQwLuEyRk=;
        b=rlx1GNqsKyWE4MsLOUjJd+Ct0TpQx/YDL6PRzc/06Q0sXdppBnGao7xsonhzskcEsa
         +JHkvAozPpr1O48jVIa8ezpC8t+h6hxe0k7FZxEb+0E39DwtPWDY7/OhTimYnzloz1G4
         T7c25Anl+qzTkT/BRmVTNCNLkIn1JIya/RmDENVsTQDejY5DWSp1Y250gbxA4DD7TZ+S
         KdIeLxz1ZQ2EM+J/jJ3HAY6H9EelgEdLdUmsx27xZKHTVsgXuaXBPe0zsXbqKhC52w+e
         w40ydESJPylX7sUggZ3weaRsxJo/K+wE1yoBy4AMUP8/rCtHsL+CUPYbR24zkSAkb1Xx
         XPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731618788; x=1732223588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhQoEz1AwEdA7j3JwLiWaYoSglgpi7vLBsBQwLuEyRk=;
        b=wLXkJp6ppyG7UK6mveNh/fLzvEX5CrMC2JaVXja97yVDeVlHjh1L3hVR8UButGcFLl
         xOn5pruk5kUmTjrtvWNqaSS0zjcJCkDK3iMLOXSKuzyS/zsQZHaUXnr9mxcQPtC/Vy32
         8XZcGvvH2edBJhGlZh71vCMzjU8lh3ad6xmhJSMeV1N1unBS/ARH8mkKTMM+DanJfcv0
         aOKOA51ThOWhrMEMsCG6murSlEHVdnh/zSB/AiKkekGYPEwikohyVfyRcevv4xbosIEt
         Oojp5P39jpEnZ5YlSrDz0i7tFTO3X6lpFp2+ieoWKRFHV18f1wdzHptaBv6qR+cvOPaX
         vodA==
X-Forwarded-Encrypted: i=1; AJvYcCUOTPjIHQrQ9fnbsfc+VVaPyV+mCDSyb3xcM5KsqrLIKOVEIna1zchVK2gCFSKOr8Cd2ee2aFxRbFoyLg==@linaro.org
X-Gm-Message-State: AOJu0YxDQZCCURI1hj1zGUoZ4yu4rxr2cejGP2qI8dFtVgbLVE/3UGTh
	b8Jd+Ho5zejtw4Rpxz1cg9zyY4a9QNKjbX6PHOQe6socSEGmkTbORLbF/MdaFybMvw==
X-Google-Smtp-Source: AGHT+IECB3IOQPU8siDOvfjZDXK4zBWBRULODoRPPgw7oH+uWjCXOpwtKqXOcu5PAMOTNYT7ETulOw==
X-Received: by 2002:a05:600c:4713:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-432df78d34amr1572435e9.27.1731618787971;
        Thu, 14 Nov 2024 13:13:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.126] ([176.187.209.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28b698sm35778495e9.27.2024.11.14.13.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 13:13:06 -0800 (PST)
Message-ID: <2ff772ee-5abd-40a2-b672-b1189db36e35@linaro.org>
Date: Thu, 14 Nov 2024 22:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] exec: Declare tlb_init/destroy() in 'exec/cputlb.h'
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-15-philmd@linaro.org>
 <d6a52090-a8d3-4cb6-881f-071a5668f1d3@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d6a52090-a8d3-4cb6-881f-071a5668f1d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ARU6S8EGZ7M1

On 14/11/24 19:21, Richard Henderson wrote:
> On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
>> Move CPU TLB related methods to "exec/cputlb.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/cputlb.h   | 28 +++++++++++++++++++++++-----
>>   include/exec/exec-all.h | 17 -----------------
>>   accel/tcg/cpu-exec.c    |  1 +
>>   3 files changed, 24 insertions(+), 22 deletions(-)
> 
> This is only within accel/tcg/.  Better to move to 
> accel/tcg/internal-common.h.

Yeah, and IIRC this is also true for some other helpers.
My thought was "better keep all the API public" but I
don't remember why I decided to go this way, since this
is of no use outside of accel/tcg/.
