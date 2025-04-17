Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1048748njk;
        Thu, 17 Apr 2025 14:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVCUMzoAtDpUt156zRXhk/NT32vxOSqARIzDgG3Bc300XJnAWyD8Ja5BzAnmaTXjitdnoBQFt9sujNpw==@linaro.org
X-Received: by 2002:a17:902:f60a:b0:223:60ce:2451 with SMTP id d9443c01a7336-22c5359c344mr6053105ad.15.1744924112664;
        Thu, 17 Apr 2025 14:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744924112; cv=none;
        d=google.com; s=arc-20240605;
        b=Jci4R8W0X19+78FZ9WX0dy00xCjT8edBe3nRzLmdFimEfTbOM5iidn694xsVy66lzi
         LSyBN+h4BOmscf7abgUAA9VVnp3s5j7E9HTf6y5H+v+QTPDNLEX0l778xnvy7ladDQBH
         ++qluqsbz6WM4blXFtJmmrdhIDzU7efY0qkNetJpElrPwjSusjocji6useLsFXoLHK1q
         +TgeZC+7jXPkNI9wFFuHnYiQXlBXIDrwTBZAJvsZO99z95mi5adV00WFvcwmn/RSmfeI
         dds0/KDL5tseWa7IHQuDtJEa9pjdFT5SJ0kIzum0yu8eLJi/J368OIC2pOQYL56UC4ON
         23Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Jy98ubffpFY3J30aDDry5MZaYuJ5R+InxA2WyR2h0Bo=;
        fh=W4IX6oaZzVBCWrNJ2Yh0KQAE6lmLBnXrwh6+AjJqDCw=;
        b=SpuDPzjKngrKiroEY/qSa58Dd9k2XWdCsXmxp0j3amojEuUNm4xG+PJ1jkK4ZL9zxJ
         dOSASyvaINk0dB8PbdKKsali01JTMKmKy8eEc93qTzbxjMngv/7bpBKcG6jvR0GcD3gp
         IxSVBEmXVkHl7ODhY+x2fIBS592eIeJohEqaw4yPB5Nmy0kJnmNBvu9h7EBgXvmC5xPa
         tFvlKcSrxoXZDRbEf+bnIBDiw/ZgEULX/LIk9kF5+uRV96pNADZmfZWfU/9PnWkUdE5n
         PaqmQv+4q3FlguoMY/GP1EKRkYmBwhPxAq9oNYPdShUJL+d0O0NgZNluIshlLsCuZOoN
         jLYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eepA/qw2";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50bf32c4sor4982845ad.5.2025.04.17.14.08.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Apr 2025 14:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eepA/qw2";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744924112; x=1745528912; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jy98ubffpFY3J30aDDry5MZaYuJ5R+InxA2WyR2h0Bo=;
        b=eepA/qw2NHurqKIVY+JErYkXwoiYkFmvfoWOm3JmQ8tItyXy4h4SnkamunpNnU9nbp
         kuIXq8MTeHlOwFgROMoNpFmztfyIjFYfTJC95t4dTk4IJjRf6QreeAi1YsU6n6wN9aWc
         neg4ZxfiI4CbTems30DmU51rep4P3ZKs5L3cd101BlLvK8oI9C8HVl8EVbpQL170XtSW
         6raRLdjqnWoj5arX+NDWNKYlkEXH4wqWUe+6nXgyGD81wjMItaIknrKyRPDtNI79m/nn
         MZGXBdYt2OwQYz6/dCRtSZP3HKaCSR/WgImBdV8uTzmFHcm7kdu4YPKPBU7CmyC+RErO
         J6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744924112; x=1745528912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy98ubffpFY3J30aDDry5MZaYuJ5R+InxA2WyR2h0Bo=;
        b=VXkqDDUhHs60psmAQUN1Z1S/unfZRSm1prYH7s+wbNgiJr0+cUjI8xnBi7qrBFfgTU
         bc6ka+ve2gf2bFKA4SrZRn28SW3hyLnk+lxJUIdMawOdrky1zA00jrIgzuAq4iSnE/D3
         aOEaj0DvWMIybkjq+GQlHHDBSQrLBtzhnjbWzbc53ualWlXOXU0ml2zb7YrJw7U5LqqN
         +gCvykF1GvUEKFCe4EF7aM9iWn+8NV0FrosDMoWZbUsfrkZeY6K3uO04tH9p8j9FlbD2
         jw/9rxx2o5CW4MW4Duvniaxt0bSqojgu/Wr98fVWO2Je47XY12S0fY6mkUBg+XRfJlSt
         K+dg==
X-Forwarded-Encrypted: i=1; AJvYcCUeKdDdJYS7eptHyO0ec6FtnLZOTpPmQpThEMqtkwVg8sdB0hYyOuubjp5sBOBa30dEqiHfDc8321sOsA==@linaro.org
X-Gm-Message-State: AOJu0Ywbb4mZabLUcuoOkYWNSOaI64sNvZaIdBZK44+nmxSRgfE/V35d
	Mr/x3zUsCbGChLAxVXI9hJ8pc4BS7Iqu5dwvgbWRgeYHnhtKheYGDe1cQi+Zen6VHg==
X-Gm-Gg: ASbGncvINrTSaoxPOpMuJnPCzJ+85yOSUOmQ+ajzY7haryXh7zZFtDFp3R73S3jqtUD
	XyMDn+Vd0kC7IkyZUtzgwwnDDuZTldHv2j6tH+8OuBHsmwrSfXSm90bGA/XQjq0UoRiRpInTaS8
	rjVadtGTY/B+ryz/M9LcsubGqW8AO/c46Ssdl2HOovHRY7zKGtYfwQk4htwXBSWgIVydgRWjLup
	jbOjMjblmjyuYpcR2LCg7chPEwsX1TpnMddwOZT5lGbTKaCqreZEt1UTWXt4Sfe5jbNS4XjVGUO
	P2nvXwn/7khZj/K7DtdrT4efp2Hu0GrqUvHWMMiIE7lHNQdPZ+V8lPqzi09s/00=
X-Google-Smtp-Source: AGHT+IHAqmHG+gCegdRdildPKQzA1FG88dZ39XyUN7OzdAAkJRLdKdrvI8aC4lxYsAoChB03vRdATg==
X-Received: by 2002:a17:903:1b0d:b0:224:a79:5fe4 with SMTP id d9443c01a7336-22c53573508mr5949335ad.2.1744924112211;
        Thu, 17 Apr 2025 14:08:32 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.52.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde89asm4443445ad.235.2025.04.17.14.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 14:08:31 -0700 (PDT)
Message-ID: <3fd95fa9-6de3-436e-95d7-8ff2b9ec0909@linaro.org>
Date: Thu, 17 Apr 2025 18:08:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v3 0/9] hw/arm: GIC ITS=off ACPI tables fixes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <b26000c7-f72d-49cc-8f7d-2ce3458c47b2@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <b26000c7-f72d-49cc-8f7d-2ce3458c47b2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: edIRca2OzKKo

Hi Phil,

On 4/15/25 05:19, Philippe Mathieu-Daudé wrote:
> Hi Gustavo,
> 
> Could you take over this series? You seem better suited
> with ACPI and testing with Aarch64 virt machine :)
> 
> Thanks,

Sure. I just need to clarify a couple of things regarding
the IORT spec. Meanwhile I'm (hopefully) waiting Igor or
Michael confirm that the patch organization I've suggested
makes sense for them.


Cheers,
Gustavo
