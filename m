Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp328209ejo;
        Mon, 11 Dec 2023 08:37:46 -0800 (PST)
X-Received: by 2002:a17:907:c08:b0:a1f:9842:5a4b with SMTP id ga8-20020a1709070c0800b00a1f98425a4bmr3143223ejc.66.1702312665994;
        Mon, 11 Dec 2023 08:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702312665; cv=none;
        d=google.com; s=arc-20160816;
        b=mW9oeqSyPl2M09cRvV2YXDGS+Zf2gtc2FXcSrfFgrTaIDsEpHu4KSuOs1NcACbOajY
         JhBbtG3aPFc0F0+koG1jE9BlpcRRl7teNtwUuJGqfHbFrfUYSbAvdFZZ3IsNiBsNpCDw
         DCiBwpzSHVEv2mKwpY8NMpg+7uEdl2+xSA+VV3zr8n9aSMbpz2Nkr9zYyZbBbhJm1lMI
         xp9I4SCvW5+ejWg9u6b5w6VUqcEtAaILlUQFQclP13kJurLuJn7J7o0xvRakQAhjm5Fj
         9luIr0PZ7dl5qPwhAick8nxXqrNSgg/KBLtcUY23WDaNL4wp1mf6HPMZ0GVOZuVNK5Mr
         ptCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aZ9XXmId1yzNKbpMkkoAkMgLTFP9oyzkyWQqbnJsHh8=;
        fh=LIN1c+usLVQtekpuVQpiJib5J9IPes9pLLH99qh6RZ8=;
        b=g/Qdk9FvawxazFCe7++pqnb0Oy46XfmmMORlQ1GJyomz/aOQ1516T6vcOKWdsDClTU
         rG/fy3pjPjyWE+o+HTIsIsBVMy198XjiSNENDgsHSIRG9TVrVsU6HcWbchNXFXscAs3C
         NVTnWVuMMb1eOK1+6Up973oTyrS29GwPctaLKoMiYO60wWESgVIqJdXuKa94W2EdQnoH
         DpzOzkT3d2csmoECXTHJIOtmhyENt8rgLeQjfyTj2+KCpeumQJG2YdLkAhKDykRLwzv8
         Thi8QdkE06xMrYyXFTXNdpBpvgw+f7Jb+O8By1A8zv0HzYSsJj3nzu7naC50QZFU4tgX
         vntA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TEd9PIno;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k9-20020a170906158900b00a1d68882026sor4063296ejd.5.2023.12.11.08.37.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 08:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TEd9PIno;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702312665; x=1702917465; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZ9XXmId1yzNKbpMkkoAkMgLTFP9oyzkyWQqbnJsHh8=;
        b=TEd9PInoG9GlkN5ZRBm2cI3zolPOsWxnDQvI3jS3bf5W3Zj8g/avH4//Zy5HU2y9ga
         y2zAvnvnTCHycSaZr1C/bg/N2FaKoYxA9r9DH7eVAcXVn5lqJC2Hf5/ECOJ+8vn3OsHF
         yHzRNRn3RcguTsKp3QsLCxobaOunsJd+6o2vTnXcGP502IotT/Kl3qBQ2BjbgerwXbaw
         lZuTePbmxupkIwEyjLfLyxfvxVuHHBpxMNM4eEB25ZVWUElFDR7ORA6JKt6WJpMSt6oa
         PUktzs6VGf0G/aOTGW6M704Nnj7EIFIZXmrQgOnmVtVPZ94DwDzUPUDaQznNDU9JfABU
         BoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312665; x=1702917465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ9XXmId1yzNKbpMkkoAkMgLTFP9oyzkyWQqbnJsHh8=;
        b=t0/GTjKujVImXr4HH6IlKbuVp+x9/9tbtEoU66EzRVzg8J/DeaHUV0PZFZequYpEpJ
         5Nje+3Ohfm9Z5qYm9oqSvoI+FIa40RPXt9irbVkl4gMrGizr1izffUbKmEedBIoXOEVv
         chtEr3Ova1y24F3Y6xnWD7LIdnwvEWJadCRLsqzYg5W2MJpaLv2fd1dUtlWUe5E8d0L9
         5TGHTKO1d/rdTO8xesJpi0n6aSNiXZh36MWwQR+JRg71h2NJQvpMBohyFesGazwY8RlS
         c6BeH6P5ldReUHUHfK67WeQUTyc/XnFbpLbw7EAdHKFasOYjj5bl8f5cwiwn8XWp/V/n
         HdyA==
X-Gm-Message-State: AOJu0YyKUaVvN8oRvcpcSKlyh46S12KMxpczuMVAARkYeLX3yp3fedmC
	p18hcesXufzVl1EJSe0lw5QOGazE
X-Google-Smtp-Source: AGHT+IGuPhejSEsdQBopcEBi2QQyqELHJP5rBS4xsF9O6h21RXEDalMYKXGwzBhKJWBGWOsAMrAilQ==
X-Received: by 2002:a17:907:60c7:b0:a1c:4c3e:99e2 with SMTP id hv7-20020a17090760c700b00a1c4c3e99e2mr5132099ejc.22.1702312665779;
        Mon, 11 Dec 2023 08:37:45 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cor91-h02-176-184-30-150.dsl.sta.abo.bbox.fr. [176.184.30.150])
        by smtp.gmail.com with ESMTPSA id rd12-20020a170907a28c00b00a097c5162b0sm4995159ejc.87.2023.12.11.08.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:37:45 -0800 (PST)
Message-ID: <fecb9b5d-caa3-438c-aa78-4775c2ef2002@linaro.org>
Date: Mon, 11 Dec 2023 17:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] tests/avocado/boot_xen.py: unify tags
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-10-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231208190911.102879-10-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EHLS83qb8GjT

On 8/12/23 20:09, Cleber Rosa wrote:
> Because all tests share the same tags, it's possible to have all of
> them at the class level.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/boot_xen.py | 26 +++++---------------------
>   1 file changed, 5 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
