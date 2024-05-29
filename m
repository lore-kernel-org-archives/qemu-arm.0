Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp396119ejk;
        Tue, 28 May 2024 23:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKZr3ySG3RG7vhAlJbKubUMAOX2p3Rz3ELQayFcijXd96O3ban0agUXaGHTuX7lxnsvxfN18+FfIIOT3g4CdBN4rl3abqs
X-Google-Smtp-Source: AGHT+IFKhF+QSKkuymBmTNpV8hdO/6Y7ZGT7XXKpLQ7I3BKkh1kVzA5y7aI86GizNA3PDKWbPQb5
X-Received: by 2002:a05:6214:4a91:b0:6ab:9619:a811 with SMTP id 6a1803df08f44-6abbbccd9eemr171431846d6.33.1716964061540;
        Tue, 28 May 2024 23:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716964061; cv=none;
        d=google.com; s=arc-20160816;
        b=NQKa87bUArLRhAB0df2zftppMjgZLduvrbWVB6BKeKCtUPJqDm/f2e+QiRGJtu3q0O
         KnNxdxxQ1JT7kIO4siokV3WidV/NzawX+0ATvcNO95xEJpnmoHOfxkSpAItZmAm6XvQd
         6CdlrUE31CJ0seFIhRIKLxBJhDCaerMNd8DKOQUXTaFFF6zR79i0yTY3t9T+iQlnFU+p
         +gRdGWW/+CnTJo1KF+Jpcb9jtdybS9/HNAM1P5tYD6DK+iaXhFn9egG/ueBesoBegTuD
         s3m+FlHwSOHbpCpemZdRK/NJlExla9F8qj15HhG0sdDKVYmQmbsq0r4oTq0vbdNrIXbN
         r9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PPpsvwIIM/9rhJtSqKc0KQFiyKVA/H6AMru5rb7zErE=;
        fh=ukpubpZoXstsXShvuFo0bI5W4IuD/qpnvAEh31nHQc0=;
        b=IK2iqVxXPXshTSQuRCaaRJNXW4h011r45m3lf52mhEZqbajRHc3GXYHYUsIUVODFij
         fmbRzvN4tRoMxFA+1tr+UmeyI6HB5hL4WKJNm5CCpRJXABcQTLrolNMUMnbnEZKKFN6W
         wxtvoA/4hyxNLGkB+GI/Yuh98TtdN2DgzSHOvQKFD0KV3ABVHIa19SGRDLd5/OcPv42m
         XXVKhIi9a9wxnKjyOwJ7QouOu/4Y/xpXTaby9iiDeB2bZi8fPNdoEzd9cxcJqNujBzul
         VMm71DdUEsdv32UdjJo27Bb6QUzNrhN1a3i/yj0E2tcA8NfWE9HITR3xS2iXuoWPvD/O
         jSiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pbvnAn//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac070f338fsi121686896d6.265.2024.05.28.23.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 23:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pbvnAn//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCCmV-0002GY-Ht; Wed, 29 May 2024 02:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sCCmU-0002G3-Ge
 for qemu-arm@nongnu.org; Wed, 29 May 2024 02:27:26 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sCCmS-0005vi-Ik
 for qemu-arm@nongnu.org; Wed, 29 May 2024 02:27:26 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a632ba6c9dbso207959166b.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716964043; x=1717568843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PPpsvwIIM/9rhJtSqKc0KQFiyKVA/H6AMru5rb7zErE=;
 b=pbvnAn//hEFunF5Z1vCtOuichJSH2XUSyTxaAhb+fMK8IBfOiqee/ulGJrYyuEyG9i
 1F9r+1/m40djs2QCT6wZE/nHQbYLm78Szc0CMS0rYNPGXPo0Rzz1pTrDXLqOHkjxrK35
 JfxGcbNgs5P5aA1v1yttJltFLuC/BijdpaJJn7Kw+o64wamIfNMxZ+zDXCsZf8bH7EE8
 g+xSURVgmLxg7HnP6v8dVC7TVdEPp0XRIF+GkypL4sYKv7gRdIgu723xy0i5mGLttL7U
 XUJgaKmzjNFFxIKNB9gHOd02ziE+V4+/kRXZULezTES7+4tQv6uap6Qrf510bL16u4R4
 BaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716964043; x=1717568843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PPpsvwIIM/9rhJtSqKc0KQFiyKVA/H6AMru5rb7zErE=;
 b=Gp0sLme2UjOLG8QLqW8urz+hWCYZFoByj3ozQj1ecn3i86ShI7ggvxb77rckpj1ssD
 ZPDw6bjfBZ+nuHqF27PVWYHAmn1dVpzjf/6JXHehYXU+G/1bbZGjaPWim+XBz8nZHjhe
 W4rgFlGTk3u8nqRH7hGAh8kjWYk5g4EXBgEgD1eX+5BI3AL0PmuKM2ok6HqJYzs1awhE
 tXDOr36py0rTDAslsa6Wt3MgzXHP9tnhp0pskUUzetTslGdyDZjn9RdZEVw/wLml3nzC
 gzM2c8lqHswMhTiIbpULxnwKskrea3X5vg4B+Ms+m7oPwB3XM7dQRhVgRv88fPAh6T58
 RjKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2jQ6ukuDKkmkmRjEPlLak+Q4Go6sUz7vuF3Sgcs6QC1L84tFyRXhtEikLlT56dYnR7cJM3O9JMfUCifZqEOw7mBNj
X-Gm-Message-State: AOJu0Yy7w9tRd1fj7mospmZYMB6qTtIQSQQEcswoZIFoN7inBqnG7FnG
 e41xAD2L0uHf6zuCjkN8dRoGqKewMc+WGqdcdKTF7kSdXAr5KMwsEgItkGmSo7k=
X-Received: by 2002:a17:907:984c:b0:a62:a63c:18f0 with SMTP id
 a640c23a62f3a-a62a63c1a10mr756880366b.1.1716964042967; 
 Tue, 28 May 2024 23:27:22 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.204.141])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a635b2b7cdcsm83720266b.139.2024.05.28.23.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 23:27:22 -0700 (PDT)
Message-ID: <c22df582-735c-457e-a9aa-cd931e0beadf@linaro.org>
Date: Wed, 29 May 2024 08:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] hw/misc: Create STM32L4x5 SYSCFG clock
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Damien Hedde
 <damien.hedde@dahe.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc@lmichel.fr>, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>
References: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
 <20240523194441.21036-2-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240523194441.21036-2-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: PulYsjZcjYZP

On 23/5/24 21:41, Inès Varhol wrote:
> This commit creates a clock in STM32L4x5 SYSCFG and wires it up to the
> corresponding clock from STM32L4x5 RCC.
> 
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   include/hw/misc/stm32l4x5_syscfg.h |  1 +
>   hw/arm/stm32l4x5_soc.c             |  2 ++
>   hw/misc/stm32l4x5_syscfg.c         | 19 +++++++++++++++++--
>   3 files changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

