Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1435249njb;
        Thu, 6 Feb 2025 02:13:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUop1c9c70ZPKLX2PIk6HdX5GpFo8QWdTveR1Vj8FQaYj0RSyCAcHRnKVPBZcyQw62S36BrOJwS62zVjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHQ9pNsHjXEW6qRbH2enGNKvzj+YcE71R84BOQ6ZHpX/jQu2sawHPuHsXEBCdvPpobtv8NN
X-Received: by 2002:a05:622a:1b13:b0:467:6e87:99ea with SMTP id d75a77b69052e-470283018a0mr106196921cf.44.1738836793118;
        Thu, 06 Feb 2025 02:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738836793; cv=none;
        d=google.com; s=arc-20240605;
        b=TjiLLlRE8Jg9mcwiWOpIW8DeN0ZJhLcL6qbhdJrdJ+ySKHMVizYLKIx1sW5Qz2MaYG
         6Pc9+vooWSLPQRCq3jNyzQufW2Rhiv42QO40WsTPrxjziC0bFZku5IyRqDcgyzcILTTu
         OG1W7reblXmCuyRk1uWWiBWqr6IWJ9aSn6qoTb6QRPjQ5lQFABKAQGXthbGRd/fHB3fl
         rRjExXLOLXrj/MO1Gvdn+GUbh7vVrUc07gCDHveRJukHphAXoGa+YbTU8eR4KC/1AZN7
         C4JAsbU4VQ6t5OzYhoEdh5xBWrVmAeu5P3xJRJ6HTo8XtjbVO3jXKGNZL3FL6Zu/zWEr
         herA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=74qmYuiEHZsoW3qpFUrxotGCmscxu7yjDuGjZCX+Wj4=;
        fh=N902TCJRl8HMhZhm2mGvIWxznrU21hBpL+PyzSAE5MU=;
        b=CqBYyR/J+uTLuEUmKZaN5mkEZ6XhiaMJvpwyWnEsHP+xwRQkEM3Rhxl22HywnoxPAu
         6YfAkizkvjsAbedmAmDXOhIQMkbE71yO0zqjD9LZbwu5jGUP73ZJgJoJG19f3fJSqYPK
         QW1CIwWBWLXySgMko3o/t2juLJ2MrXzQy0YE5MXY6PSwQc1KMAUpr9sq9DeIWcmo5yJP
         lpKnxO0mB8tWNPKnTC60rqvPFCzye/lhCR9CMZ8knTJmkMAnUxyFAULRNXwXXv5mEALr
         b8oruaX8LEE1Vg66Oei5AC5fcKgq/0mb/SMFlCW+sjttBkKe4RKlzfS1JkjC5D3W9hHY
         tDPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FavQIoe8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153be48d1si8073711cf.647.2025.02.06.02.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 02:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FavQIoe8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfysR-0001T3-4j; Thu, 06 Feb 2025 05:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfysO-0001Rl-5s
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 05:12:52 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfysL-0002Hi-OX
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 05:12:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso7681095e9.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 02:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738836768; x=1739441568; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=74qmYuiEHZsoW3qpFUrxotGCmscxu7yjDuGjZCX+Wj4=;
 b=FavQIoe8K4z4kG9CRNFVQgkIPyME1YRyt6NwqjfPxDljRyG4Z5n4ZHfwDhh+oVeKJN
 +BV0GOtoDkkMRHvPsa48XWktLIJ1jnOYahks0fpRpKE9aV4OIchD07ON14+vvEHTLJr6
 cBsbDNtTsLjUkJC19BgVjXvx9ibIExG3qEwonkHazYgE3vD2x7CQEXYpyEIgFX0lQOHi
 zCcDKpD2CPkSdH6jmUMJbp71bnXU0dJhe2hGg26wY1+VKSkpnUtpEoTb354PqpiauyKT
 k/U0NUwDnvG85eljxpLTOlLgkeI3RqgcMPS8eplDNTMspud1ELurwqF0HG1zxpNqTevo
 8egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738836768; x=1739441568;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=74qmYuiEHZsoW3qpFUrxotGCmscxu7yjDuGjZCX+Wj4=;
 b=oI/+U+4T2FDICwJFK2TA+LVXzXRG1mSJnPuP698Ha/cb0sCvUk6KObA5sSIAkq7fs9
 SN4XsH9SojB2ZI8QQSWZwefwi5nzUmTC6D7z8KqyABRkpuz1/bUKhYHDihaqTuN5JIzF
 oGBYYLUxD1Dsn7hu1ZYv5BvNr9emsU8NbfpxCmmUBYyF8QCHiuoytsLN/Zh+5HgV1PSG
 xImJjj3IZdkcH/GXUQwpDvKHeRVuE/87+GiNxyP+GWlLs4QSS6Qn4/utcNdYCb9uVo65
 GgeUvDJRS439j62ZEYNWzt3YVfABpmyR4KYOHa8zvFWnPJxGGXrXTbfBVqfiRlOMJGNM
 /Jcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsjiIA25tElEn6yO9liSkQalUaPeU+35Lw23eGLlvDvu5Ms4SgDH3XV3atrFQKAO0LNjlZVKNmXw==@nongnu.org
X-Gm-Message-State: AOJu0YwM+EIwjq/BAkz4unAsMBJU/qY0E15/sciaUSZA+dn9UQ05tLZi
 cN0Ku/Z/Xe5/3tDi2VKAHfFp/y4y/DQDI1g+VkmB/r0icpR8WnejV4zgaQU+06I=
X-Gm-Gg: ASbGnctfV0tGtUPm/Z7QGrD6ujEsW815JE+FxEY6vSjdsP7nKoiyxTT2HQHnhBKs2GE
 2cGU+v9YRZ3e+bZOF7GmulQ/7lQwSWrGCNWBZmLHzzYIpiwQrZGdR4GODarxVrhICXuHWsFVsgm
 dwnXaCoP1jNAkAbvnOjz/VX04TW2B5rozbAbVUvF/lANT8jVLNnZxmv/swAfRUoIInRo7uhmoiH
 zpltux8yoMx3jU4/DR1RTbYUMmXNczEIGA27v75P6UUhnSuILDvpUUZY0eMDiKVErshGaT7fqeH
 SbxA6vG5/dNywRmJRrRMuYlCMczylB2b+8cW/yWH8rMl9ULjY+k2cz3C9I8=
X-Received: by 2002:a05:6000:a8a:b0:385:e37a:2a56 with SMTP id
 ffacd0b85a97d-38db48fec0bmr3972471f8f.52.1738836767869; 
 Thu, 06 Feb 2025 02:12:47 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd1b9b3sm1336405f8f.13.2025.02.06.02.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 02:12:47 -0800 (PST)
Message-ID: <34235ce5-9f6c-4968-a8c1-ab868389e9cf@linaro.org>
Date: Thu, 6 Feb 2025 11:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] hw/boards: Remove all invalid uses of
 auto_create_sdcard=true
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-5-philmd@linaro.org> <87a5b07u1d.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87a5b07u1d.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: uOHcsOy+oa4P

On 5/2/25 08:03, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> MachineClass::auto_create_sdcard is only useful to automatically
>> create a SD card, attach a IF_SD block drive to it and plug the
>> card onto a SD bus. Only the ARM and RISCV targets use such
>> feature:
>>
>>   $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
>>   hw/arm
>>   hw/riscv
>>   $
>>
>> Remove all other uses.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Impact?
> 
> As far as I can tell, this stops creation of the if=sd default drive
> these machines don't actually use.  Correct?
> 

Yes, since these machines don't expose a SD-bus, the drive can
not be attached and always triggers the same error:

$ qemu-system-hppa -sd /bin/sh
qemu-system-hppa: -sd /bin/sh: machine type does not support 
if=sd,bus=0,unit=0

