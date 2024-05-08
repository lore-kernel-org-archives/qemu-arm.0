Received: by 2002:a17:907:a184:b0:a52:4db9:938b with SMTP id om4csp359344ejc;
        Wed, 8 May 2024 01:26:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXB5ilcpw8GOc3zwlu3jyYRw11JOeT23a2EXcofO8UaS5rmbVCsppFVpn3UYWB9pR07MEpdMnfy/wZZ/wam1veUn2iuqowM
X-Google-Smtp-Source: AGHT+IGW5WoMoDLq+C0xTULfRyJU3R4QRc3JSLbSs0O5WYCyWKZ8ElRYz62Pbvo2zhm+HJiyjGcB
X-Received: by 2002:a05:6214:4001:b0:6a0:d291:a35e with SMTP id 6a1803df08f44-6a1514d099emr20529496d6.52.1715156798549;
        Wed, 08 May 2024 01:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715156798; cv=none;
        d=google.com; s=arc-20160816;
        b=Cyt3ZiL+1P4/gVqCm9nFnHyqnT0KtpMhpVvHRsrXb9yQkcX6Fp6lwlssPZoNJaKeCs
         oRU5e8nZOgMkamXuN4jUhUBoHCV+3f0PsuxCGelS3wCiz0Wo/UNEK/SCvJMZwa/686QN
         5pOb2pFAPosbcriKj5K/Yj96gO6N8g9UVIVO3CLjCQeYANGSG2WH/bx2M8VLTZzoh2q1
         lGAKVPctIEBHGjc8SRLLhcStY4+aYiRjG7NvEnyzMtOGU2Uew8I7QavtO5/ThQaAO+PU
         Gatv/Q47BQjKPbfJPfCe80zwuQiuhHARplylWIz5d9ulurEz4QDh1Vx5vf5faTS5IduA
         qvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FzRXoUwxh4wkhYay+Snd3nbpb+LJezX0f1ITgy4dTOQ=;
        fh=acuOKXoH2COvi5QHCrHOCGUjY+p89AFgphjL+giFucU=;
        b=gxBNDxHUAy+K4qRalgH57wA8KzrAPriJ6UtElmmKG3tFH4XVSxQD+KIY8OCSeX4wvj
         kYSxFAuwCPVNDrfNKEnBuAnuzAeqQrRjBDVz9v3QlUNPZhZxhCbVRgClT8qBQmdfnlny
         jI4NUivW00FkTZC8fwBIg7Z6vD56h+p4CAAuMUFV13nlqFmrDITXNytEdHn8DiHDLuOT
         ynZOR26sOOjT+oOgHSpQZ6R/zX1yuxwxWWMXH7q19+q4mqmPKRrt7YTP54zuuP5UtaU4
         j2sP4F2AsctAhJAswhtgd9q+hep84tyiCzXZdd+mrvEvQS+MqK7fWmbW+Dc+2fgzaiJu
         kTzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4zlT1TZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo10-20020ad45f0a000000b0069927228578si13953945qvb.150.2024.05.08.01.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2024 01:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4zlT1TZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4cdB-0008Cq-Qg; Wed, 08 May 2024 04:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s4cd9-0008A9-Bk
 for qemu-arm@nongnu.org; Wed, 08 May 2024 04:26:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s4cd6-00079K-FF
 for qemu-arm@nongnu.org; Wed, 08 May 2024 04:26:25 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso1067727866b.1
 for <qemu-arm@nongnu.org>; Wed, 08 May 2024 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715156783; x=1715761583; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FzRXoUwxh4wkhYay+Snd3nbpb+LJezX0f1ITgy4dTOQ=;
 b=C4zlT1TZ/5HvL8CahmKBpir4AtbKRCkcidxR0rNco5uHx8Z+9EcFNl+7ypbCdPOUP5
 i59lKcItKEv3DovyXqJR0qTVVbf1otI9WQhLzF2G9srDJOvT0+eEzZcPzO182OLbNqp0
 oh0V8b3ohIuxeOx/V1sNmb+MSIafgUTTqZuVz+mmfvJ0ocxCBtfeM96zQ49Wz8GBIebU
 yAewTk7LGfm9iO6pBFk4DxPR4bH5GIpNZh2wVjh69alKldP0qhEB5oZJ8iTCd1xIfseK
 E23Dda8eavmeoN1i5+lHO5n9L7EK2rxKYU046Jm28+eAUlD2CDIsVNEzWhxfQIWGcZxM
 zYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715156783; x=1715761583;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FzRXoUwxh4wkhYay+Snd3nbpb+LJezX0f1ITgy4dTOQ=;
 b=HAFhpwre10Tgi/OcWf/Yd5U0N2H45V1BhuBVKnUW920mt8+i9ijnKdK1O03xVa1hmX
 1KyO1BaFE/wj8lmxFP9vW/TX6S2kCJ+LvjQrhp7ahDtJkG9IYgjdlUPMioWpt2l9uZCH
 UPWLMWUNquIIc//B5zLKi7QyG0JTiO8a1vALCDo5RX1zpOUxt8qmVBrbtwBqBTqLHrOD
 v+VKQaEF379LOKhMNn7ABEyr3tDeoH36qBuW6ioClnDHw7HOtbW7B5eeQsovZPpRrAnW
 57Q4wA/wRxGfF+TC10xw8i/Vx0Gdc31DJcZvezatZ5Rs/TbhIzgd5SAiF+UwQnor31dE
 2UIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIidv0mnT5g89TH7YxM6f0C2uSa1AO4Vg8i/greg5DESquVlaWskiWrYWEA8gJ6SRh0365PHwr+2LlTRsZTPf43noV
X-Gm-Message-State: AOJu0YwJQGS4lTJ3EpUEd85o18aRFOO4n0tbuxLQ+RwP2NMuYmjPc7su
 DqvCX66MweqsLZzPXYcBIlMYdqawj0Yl7OWHjNkUGv04LTFFKq5WzvsBfAYe4Zk=
X-Received: by 2002:a17:907:5c4:b0:a59:bdb7:73ec with SMTP id
 a640c23a62f3a-a59fb9dbd54mr207331566b.72.1715156782913; 
 Wed, 08 May 2024 01:26:22 -0700 (PDT)
Received: from [192.168.69.100] (sar95-h02-176-184-10-250.dsl.sta.abo.bbox.fr.
 [176.184.10.250]) by smtp.gmail.com with ESMTPSA id
 r19-20020a170906c29300b00a59c6859824sm4010137ejz.143.2024.05.08.01.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 01:26:22 -0700 (PDT)
Message-ID: <d01f4b13-ba38-4050-99de-9db557eb7bc2@linaro.org>
Date: Wed, 8 May 2024 10:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/gpio: Handle clock migration in STM32L4x5 gpios
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240507185854.34572-1-ines.varhol@telecom-paris.fr>
 <20240507185854.34572-3-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240507185854.34572-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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
X-TUID: KFoqh9GL+8Bv

On 7/5/24 20:55, Inès Varhol wrote:
> STM32L4x5 GPIO wasn't migrating its clock.
> 
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   hw/gpio/stm32l4x5_gpio.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

