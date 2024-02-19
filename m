Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp728120ejb;
        Mon, 19 Feb 2024 06:37:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVz+ZMFOeqosRNdd5cIY8SSAsT/vJ+UPBEzCZ2TxVWcuAAzCH8G1vbhXR4QKXzP0tHqVP/eBw43aNZ6OrA35pLrBkBw0iu+
X-Google-Smtp-Source: AGHT+IHGCivZ7OXLI69NUU+spwZlvSkhqHeV26w5EPF9hGUYGiOaNWAy675+QUAzreR1q/CWzVcR
X-Received: by 2002:a05:6808:13cf:b0:3c0:36cf:6825 with SMTP id d15-20020a05680813cf00b003c036cf6825mr15583349oiw.8.1708353469583;
        Mon, 19 Feb 2024 06:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708353469; cv=none;
        d=google.com; s=arc-20160816;
        b=FS1bXbnW9C85IWqraxfWHqaAYn714nc4tPwG1Da1Hwv+MNrK++u492rFkh1AkEmDT9
         gy4zATiWPhlzfeG37jOcWh2Y7aIdDrdgoAi9iaymq/rRYqWdLwDEVwIfktTzeDVqNdwW
         QKY0Y0MVBIussbDI5fOszZCyF3naPnVWv6Pvy0kFM07ZLLMVkS6TAjdPHpj5Eyq1+Wxt
         iIC77ThTSYWfVlojBN4eceSazNylBX84JMqVU3t6lkEFXcpv+ljt+JxPBMcvu+5267Bm
         VAgzj2RttHDzGZc5CWey3dZG4LdJhEksxSzEkJEvGOM8Nu8+raQWB+ZyMGZu1UofHbtG
         4QvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+amIv0IqAhLn8GDdgFDj51FVtcIHkKcEJOsxW7HYsRo=;
        fh=viirAppeJ2ou7V+I2OkzWgThMuJ9VWeh42NlwXc9ask=;
        b=Y9AhBdz959fZTjGzpeVw7arJKuWtOBxrtco7P5oS9rROWX9iKd6qO1IBMTnqkKCD/l
         FI+nbgvPXa5WakdoBDa+aPZmGek3+nxTsolZbuCKwh0L8NhgXisiSlWQakvr85Z8Y+Z/
         ln7lBhAi0OZTkmJG99v0wP+Yv6kIz+robHfLk4Ym5JyqxC/zNG7Mx8VezHs/pUlNdkVs
         98gPbotVbpF6P2oXsd/BBrl8A/nZ73rOSpHVPGGZvigL1qacX+byAbrQhKR31dY536fD
         1aagGh35cN6KqSjpEAyd87z0NFhfRQlXqT7YDI1iiN9Pkh7zGNrA9aa3Uvf+Ni4Uori5
         tAQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LCExZgau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a05622a050600b0042e04621f7bsi3673925qtx.3.2024.02.19.06.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 06:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LCExZgau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rc4lr-0003gQ-ED; Mon, 19 Feb 2024 09:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4lm-0003eJ-QJ
 for qemu-arm@nongnu.org; Mon, 19 Feb 2024 09:37:23 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rc4lk-0004dN-RY
 for qemu-arm@nongnu.org; Mon, 19 Feb 2024 09:37:22 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33d60acfa73so297029f8f.0
 for <qemu-arm@nongnu.org>; Mon, 19 Feb 2024 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708353437; x=1708958237; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+amIv0IqAhLn8GDdgFDj51FVtcIHkKcEJOsxW7HYsRo=;
 b=LCExZgaud4pv2PWLoorLGWaNynpWC4+8X+IC8a+KhVDAoyLkUlKlUiJsKDaHZM7YkC
 kSvP6t3zceqsUChdH6b45Wfa6OTq1uJ4TGy+pJalFfX+LpXvD/b7OFaa1+QbJJag67TJ
 clZYxbOnjYaCCp+uQCJU07gB/jGIgKQaywWF/+yBjPIQ700+Hwuusuwu89z+jffYUdzJ
 3C0AXsUUNrjaIVxC+aWFuSIi7nsPxNIhc7Ugm9doHH9L6ROVaK0DCbZ19KRQWexPeIes
 y3rGvdLondB15e02FpseMvDrucYrc6qaqK60AXWgGUP4HBIFo8fbcsGRhHp0rQ8U2f0W
 Z4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708353437; x=1708958237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+amIv0IqAhLn8GDdgFDj51FVtcIHkKcEJOsxW7HYsRo=;
 b=e4AOKiG6pP/sbyFeuK4ezkNuz6teeCJr3bPEsNw2m7h7Fv8j+g9Xp8FwITuw0DZCZl
 Va7CVUUvzha4r4eL2UqPfM2uLsfrGljjh4d2qDIMoOprXANcNQUJ9u6McP0hQ6IMLFjA
 CCjxsCG1EZnSoWN2kjQCQ4UibGrwLygHO1EMRU1IrW/p66GSBIocaEvGuDEcKpLjWSCA
 fGuF9/0uog5IJ2Miit587ZElG8PEzTsmQ9Xay/PE9LRIcIQCKZ95NoRMctCtVWfdxAEl
 KRIWGbLf3g9IwSKfUDqWFvb6DJZ3Kua1/BkGbyLutqtTLICueTNGkLRoLDBesHZqFYXQ
 8+4g==
X-Gm-Message-State: AOJu0YzQ8Y6UP29378dOXJfjFtR1/x1KtlxlXfPvUgDE+g+lhutrtAky
 hRGz5IBIvrkPXAyuwu5lu5Gn83KSuKVg4lZnPjzYjrXlrbqufGZaSVDzcyZVjfo=
X-Received: by 2002:adf:fd48:0:b0:33d:1f9f:afa with SMTP id
 h8-20020adffd48000000b0033d1f9f0afamr6202528wrs.30.1708353437456; 
 Mon, 19 Feb 2024 06:37:17 -0800 (PST)
Received: from [192.168.69.100] ([176.176.181.220])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a5d460c000000b0033b48190e5esm10519226wrq.67.2024.02.19.06.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 06:37:16 -0800 (PST)
Message-ID: <aebd4e54-099e-4e52-9440-7bd68f2f881d@linaro.org>
Date: Mon, 19 Feb 2024 15:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] hw/s390x/zpci-bus: Add QOM parentship relation with
 zPCI devices
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-20-philmd@linaro.org>
 <84d0375c-b687-4e0a-b7c7-77f1891ea244@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <84d0375c-b687-4e0a-b7c7-77f1891ea244@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: gm4A7c+dhuzu

On 19/2/24 14:38, Thomas Huth wrote:
> On 16/02/2024 12.03, Philippe Mathieu-Daudé wrote:
>> QDev objects created with qdev_*new() need to manually add
>> their parent relationship with object_property_add_child().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/s390x/s390-pci-bus.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>> index 3e57d5faca..6d07a7b530 100644
>> --- a/hw/s390x/s390-pci-bus.c
>> +++ b/hw/s390x/s390-pci-bus.c
>> @@ -934,6 +934,7 @@ static S390PCIBusDevice 
>> *s390_pci_device_new(S390pciState *s,
>>                                   "zPCI device could not be created: ");
>>           return NULL;
>>       }
>> +    object_property_add_child(OBJECT(s), "zpci[*]", OBJECT(dev));
> 
> I think there can only be one zpci device per PCI device, so do we need 
> the "[*]" here?

Oh I missed that, I'll change, thanks.

