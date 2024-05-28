Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp102634ejk;
        Tue, 28 May 2024 10:31:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3V5SaTS2JgOm4gee4x9itBiFGbJnJCYLEDahnNVsLWuviL6fHuwmtM48AryRXPizUIvbFtOZaBQVKFzfJjqvL/X/BWfsY
X-Google-Smtp-Source: AGHT+IGuoQDzHZ6xuIYndj+/tedw0NGOEpAZ7S5YYwL1B9jYGrIy9ui9ZJfcd9PDaWNsztHn+O9v
X-Received: by 2002:a05:6214:498e:b0:6ad:7920:191f with SMTP id 6a1803df08f44-6ad79201b45mr89954106d6.30.1716917487555;
        Tue, 28 May 2024 10:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716917487; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1YVx9RWTNvy+XgpKgjjwDa3rK4aFcwCY1ZnLy1EVfwk2e+S6ZpA4q/NSMLMpvMUwV
         5VyW6XYQ9z/oCh0nw039aNaQMeEXg4pMQEPFtTzJsR3IJE7NTzLvpf3YXEdgc3k43tFb
         gnHBjxr8mZAcKJZZf0fhUVBXR7QZaN4YdieAzPAXtkHjEYzCxixI0dzB66LN4P//0ilQ
         npXM0/ThnRUnh1HqT6T8TKC6PD619AgTAaflkBLOe7XLojPnUVCpqF6D5dPeb3hLavWx
         aj8O+sBCtE9Qc98E3OCl76pzZ4m+1WzkV+6UYjiO6puZyOFyx7UWtYha5noThydSDb5f
         zrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NB/nwVrrgDBRHouywkuXvv+N8TsBDL8RdTXXYQhf4mY=;
        fh=+eL75WNQ4DFP44V9JaEoOFwBmnogt34A69UtpMA9+es=;
        b=lo3PxI8AC3VGEcMc9QG3kyCFKO32jGc0IjCty0IaBXROuPOtOb2Ar69G6YNZxk8FrX
         Q1XDfCtjfswut1hCochG7NwU8av8NRa4VVVDDjM9qXAab2AVjw1nHXrUk+qbYqpc5dGS
         Rk/NAcXPWqgB9t83q0AK3G2pqywHiDktP+hsoOaHtu4qrJdCDiT/bjKJ2PJsNTOIl+Pm
         sHvolQhH9qCRQ/VRjuNWh5tAdWGofn3uwahP+6dRPpUV0eRK/ZExIcx0kERTJvCS3Qe4
         T6SD7V5eH0xkDs4E8L2O8DOL/PUxYV30a1Vdt54OkBTR5hJrgbvCazQb38JGI1As0b1F
         Rvyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxRFxIbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b5063si107481606d6.492.2024.05.28.10.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 10:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxRFxIbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC0fG-0004nD-AF; Tue, 28 May 2024 13:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0fD-0004hc-Rf
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:31:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0fC-0003Vg-5G
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:31:07 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f48bd643a0so8650865ad.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716917464; x=1717522264; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NB/nwVrrgDBRHouywkuXvv+N8TsBDL8RdTXXYQhf4mY=;
 b=yxRFxIbfZJnu1eSK/JJmqleOgx/IeMl4qLN5utWmpWJEFfM0IHbmK9pve2LGUHaJby
 hjIIIV7eDwStfUaHZ8GeFzuynjdv3uha87ftJpayd6s3u//ZNCX7JMxS+YK7vnr3MDwP
 dgSwplwCjiEoYsX64RrA+MBJ/15UCZT2Mhi+hZF7YB+7+9gmJ6pvaIIlsiznCpGf6STD
 JLKA7Plyg4KkgyWh8pirTaCYYbsRgriLnKvOED0ygXkfVP+PUSzBeKuiv+1Wwcuskc4f
 iuN+loi1o91YBVo8beXDNf4QKJUaw2xyn5OKnlVksjxvXBwUtpZWt6HdpgJ4LC1DJdmB
 9MTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716917464; x=1717522264;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NB/nwVrrgDBRHouywkuXvv+N8TsBDL8RdTXXYQhf4mY=;
 b=m7EuWJ266JiuQ5vveeehJjrU1xayAy4RvClMJ9mnonDQEKemN9lXQPFmVGLrFRUOgH
 XnHn6/5fvFVUzkIRcF+gLzlBIo5w9vIN6nYZ7tY5HLcqMnQKDtZlZX3ssxBCV44+PE3z
 mo5LDIXMJ4Q08v42JveL7l+DJ5eoelRcWUMa00aeL/GO48VRuT/3wZXPGcKAaSVjeajQ
 WDuGtXMrQPS15hB18CHRZYZ1uE+dHvTr3UXcfiMeYHMhDSCOdEmvCCV6BPcyCGt9pEBR
 rlx+7BvdltkA6ctSukU+6odHhb/aHFOxMM4juafjr2C8wgUetEVO1hmd+5pKHdKkMXLh
 9Zuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOZut/bU9Nd1kK6Dg+4uOYZwaKy3WEBbsYxGK/h8tF4WfA1rlZYD6D0eIcDJHZRHAwfMWwOW2h75PpARKRPllbKYwt
X-Gm-Message-State: AOJu0YwUtnuCNtVSD25DN0Ie9baSx/S9dC1m+zm/HMuCKTHEirBMtsGM
 +WedwzFryTCz4/OiW+Zp3/sI1P2kfm60GU4qPMHc2Ba3F6r+R4LU+Hma0+DP2tk=
X-Received: by 2002:a17:902:e746:b0:1f4:be9b:d30d with SMTP id
 d9443c01a7336-1f4be9bd7b0mr37317795ad.25.1716917464587; 
 Tue, 28 May 2024 10:31:04 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm83033435ad.10.2024.05.28.10.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 10:31:04 -0700 (PDT)
Message-ID: <ebb37b0c-0ea6-4bfc-b704-1a006ae34acb@linaro.org>
Date: Tue, 28 May 2024 10:31:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 46/67] target/arm: Convert SQSHL and UQSHL (register)
 to gvec
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-47-richard.henderson@linaro.org>
 <CAFEAcA81fGFByCYbqYvDRWXib99tYGfYcujfBapfrsMxenMJmQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA81fGFByCYbqYvDRWXib99tYGfYcujfBapfrsMxenMJmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7sm0rEo+CczU

On 5/28/24 08:53, Peter Maydell wrote:
> On Sat, 25 May 2024 at 00:28, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.h             |  8 ++++++++
>>   target/arm/tcg/translate.h      |  4 ++++
>>   target/arm/tcg/neon-dp.decode   | 10 ++-------
>>   target/arm/tcg/gengvec.c        | 24 ++++++++++++++++++++++
>>   target/arm/tcg/neon_helper.c    | 36 +++++++++++++++++++++++++++++++++
>>   target/arm/tcg/translate-a64.c  | 17 +++++++---------
>>   target/arm/tcg/translate-neon.c |  6 ++----
>>   7 files changed, 83 insertions(+), 22 deletions(-)
> 
> 
>> +#define NEON_GVEC_VOP2_ENV(name, vtype) \
>> +void HELPER(name)(void *vd, void *vn, void *vm, void *venv, uint32_t desc) \
>> +{                                                               \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                      \
>> +    vtype *d = vd, *n = vn, *m = vm;                            \
>> +    CPUARMState *env = venv;                                    \
>> +    for (i = 0; i < opr_sz / sizeof(vtype); i++) {              \
>> +        NEON_FN(d[i], n[i], m[i]);                              \
>> +    }                                                           \
>> +    clear_tail(d, opr_sz, simd_maxsz(desc));                    \
>> +}
>> +
> 
> Same question about H macros as for patch 44.

No H macros needed.


r~

