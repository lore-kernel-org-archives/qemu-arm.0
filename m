Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp135019njb;
        Tue, 4 Feb 2025 03:09:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXOIdoqO9POihcKxcnI+r6QfCfYS/ltk8pDBgBzyCmb0oXojqxvR0sGQmeNvcMBz+bwUSZGm+l6pvFzJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE0WuTZ9ks9PwXiDdBFR2fXkXX5hMAUb87l5hAWjLIh0hS8Q5jZ7e0cgHDlcRN5tn1djN31
X-Received: by 2002:ad4:4526:0:b0:6e1:b610:e495 with SMTP id 6a1803df08f44-6e420f622e4mr38554276d6.14.1738667387054;
        Tue, 04 Feb 2025 03:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738667387; cv=none;
        d=google.com; s=arc-20240605;
        b=PZCYlVe2ygWAre2gX+EYhThZN7oRDsp278GnOEHANZmiv3XE0eIxR8Z/xutYX+elme
         08TKzJ0EzTtQIRwPXw/rXn6tkNObJChPTnjIxGDmJTrEopAnQQhrBCXG8Gatbkq/wXgw
         ZzeuHQCnf9T+T4JmRHT2GqZeBv+LIlrWnsfbGX2Y+UgGI09lpaJz59agMFZt9KgRYhZ4
         VOerpBhmZkOPiINhJyRYY/bN+AcKPdgcWOVjTe4YSJX+OKyx0UQDWJet4OP0N1kUH/Jx
         WmpqKvPv3fgchBKEBtJv+6Fzu5mujyF3DBXD6p7LpKm20c7kPVK98v2gm5pGIG15D6go
         kYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qRJ+gO3RlqlkJ3uQqro/ScxrHGJgZZMun8MHfO4LoDo=;
        fh=Gwrs/LOetNbj4GJBDhVEemCU4NUn80cziS90nI56T7M=;
        b=jkiy+esf9KYRC3s0eaQBdc7I0Mcn7qWpADQx3aqFxOgnpZzRUPl4zOe/suJx/7mvnQ
         BiJwW5LlXQ8sfxo+IuIFvp/m6NzKumRxwxoupwaWnpr+9OD/pRvHqNI5ACmznnLJ7Gfz
         wkkBr/0AXaRtkbJ6yOl2S1Jmc5MSP/Pp/fwj3wp9I8TMhdd+VKkk+HznP5r61ZorZ6H3
         yM0o0y0tG452ScgQ6DtxOCO43Q5l7iEQ8ZwWsmfnCpJZumEbJxlxtLaJZvjIXYc0dJ+l
         WWB+SPLWOjwzxTS3xNuT3i/fHgQMPHmrDrtopuEOH4qOhw/pCicVIfVRNw+WECM7ATix
         djaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJ006GKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e41fdd7ef1si25775006d6.44.2025.02.04.03.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 03:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJ006GKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfGnz-0001lm-Qh; Tue, 04 Feb 2025 06:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfGnx-0001h3-A9
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 06:09:21 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfGnv-0006SL-JU
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 06:09:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361c705434so40143815e9.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 03:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738667357; x=1739272157; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qRJ+gO3RlqlkJ3uQqro/ScxrHGJgZZMun8MHfO4LoDo=;
 b=MJ006GKLhXfuvL8vON5jSEmaCTIa6Upgi01uQw3dNsP+iKlmQJVz8uz/z2cjZUu62D
 a4alCvsLpirfXpeoX/t3QBO/KBvhPOkmhpda7lXhy2TPrPUxJF/RVP5sltgBm8UzNYeJ
 BaGyBuUcUpzkxouY/zt/XPcAj8z0Bw1bBNMrKC7JPD3vBwyW/3UvVwuQDgP8sKkqU8oT
 fexvrtQfTiCuc57LwjtLn46Wj7rqeGKwdLlxhKeVecPadxQTk7mbA9tnzX8cLNLcfdDH
 KTZx638mXfDhA9mQW3ytDf3oJKrIreLbVMQE2S2jQBEzUQyO+4PbvsMdbhH99I9spFBl
 Gkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738667357; x=1739272157;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qRJ+gO3RlqlkJ3uQqro/ScxrHGJgZZMun8MHfO4LoDo=;
 b=Ob66IjkPJwuw784Eiq+JPMkagV/O+brE0g1pJFFVguDsC1T8gRrO5STT++GS2U6JtQ
 xQaacqIqBnFtwRiffy9oWTKBeozN0KCNiIUrMuK+KFAE/iWOwI3WjKfuXG2T3txalMr6
 y3S4YqXc7FYXld60ySEF6RHSK3LLu96uw49e3Qis/YFTabx/iPJpovJ6k0IO1r4fD3XD
 vpSwdNzd7/297zu5BDx2KyqCjkecYl0sD/kUVpv9ol8BC34UlMCfyIwCc5K32RoZ33fu
 b+H5LPpnExgLQv5bhESVrQL9Jfalx9T/rtTSmLkwnu9HImonZyUaG1QvZHduZaaouZ/4
 aRTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd+zThCK9N9kqO2YCfJJO9HFUvNKgfsdxkIzF+o1seWEYX4zGhZ3iu6zzKik2C/cq/T3geUL3BTQ==@nongnu.org
X-Gm-Message-State: AOJu0YyYlMgajfV09gHf08jEnsZt2OozJnuzGJdlTUsnBVKwSpMiIDA3
 kbe9CFDEEk9Q4qRIxZq0OeVn2I8HoKcK8PxpTKDYSUqZzUNh6ewLCC90lzJ+xR0=
X-Gm-Gg: ASbGncub2JlVYCebfv86ZtIq8s0D6GbkoFBFYBk83Ok7+OLMykrVJDlccd+QaJHeht4
 N3cNmlAgu+OlQKTcMsSWofjq2186htL9ciJQg4tOfKZjBwYZq1GeIOZt9NB6VFqLtF4a07gY5Qm
 g93hrt1A5fhNanorWOJ1WP/wBW8xmkLdaT/I0sIKF4xrQI0sNZhkq7YtfWVslIX415JOniGzhlT
 JDRDCxuCGtP/6uA3OGGsZU4x9haM0SXR+V575uEEbCKafgM1mhUwFORBjTKnsEppDm+GirownTM
 L07m0+sYf4RtoOHtH/X57sN6+IZK3ZGjuuIlrWpxPwi6B+C41vrCfD+Quxo=
X-Received: by 2002:a05:6000:1866:b0:38d:a876:845a with SMTP id
 ffacd0b85a97d-38da87684cdmr1356668f8f.47.1738667357262; 
 Tue, 04 Feb 2025 03:09:17 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf53asm15159268f8f.87.2025.02.04.03.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 03:09:16 -0800 (PST)
Message-ID: <04b4c0f6-aa4c-4c95-b93e-7a16d58b5567@linaro.org>
Date: Tue, 4 Feb 2025 12:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 3/3] hw/boards: Rename no_sdcard ->
 create_default_sdcard_drive
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
References: <20241125181420.24424-1-philmd@linaro.org>
 <20241125181420.24424-4-philmd@linaro.org>
 <47db9d33-8fa4-4ebf-90c9-db6e252cc38e@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <47db9d33-8fa4-4ebf-90c9-db6e252cc38e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: D6Lx/ysD7EwH

On 4/2/25 08:07, Thomas Huth wrote:
> On 25/11/2024 19.14, Philippe Mathieu-Daudé wrote:
>> Invert the 'no_sdcard' logic, renaming it as the more
>> explicit "create_default_sdcard_drive". Machines are
>> supposed to create a SD Card drive when this flag is
>> set. In many cases it doesn't make much sense (as
>> boards don't expose SD Card host controller),
> 
> This indeed shows the insanity of the previous state, thanks for 
> tackling it!
> 
>> but this
>> is patch only aims to expose that nonsense; so no
>> logical change intended (mechanical patch using gsed).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> ...
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 86fcf9c81f..5cec73ae68 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -285,7 +285,7 @@ struct MachineClass {
>>           no_cdrom:1,
>>           pci_allow_0_address:1,
>>           legacy_fw_cfg_order:1;
>> -    OnOffAuto no_sdcard;
>> +    bool create_default_sdcard_drive;
> 
> Can we maybe still bikeshed about the naming here? The current name is a 
> little bit long, and maybe we could "standardize" the prefix of the 
> flags here a little bit. We already have one switch starting with 
> "has_..." and some others starting with "auto_enable_...", so I'd maybe 
> suggest one of those instead:
> 
>    has_default_sdcard
>    auto_enable_sdcard

I added "drive" within the name, because this option isn't only
about automatically creating a SD Card device, but also attach
a block drive to it, and 'create_default_sdcard_drive' was shorter
than 'implictly_create_sdcard_if_drive_provided'.

I'll repost using 'auto_create_sdcard' as compromise, also shorter
than 'auto_create_sdcard_for_drive'.

Thanks for the review,

Phil.
