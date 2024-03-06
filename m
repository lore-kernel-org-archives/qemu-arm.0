Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp637467ejb;
        Wed, 6 Mar 2024 09:14:56 -0800 (PST)
X-Received: by 2002:a17:906:5a9a:b0:a3e:5ffa:d564 with SMTP id l26-20020a1709065a9a00b00a3e5ffad564mr9775913ejq.8.1709745296439;
        Wed, 06 Mar 2024 09:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709745296; cv=none;
        d=google.com; s=arc-20160816;
        b=Cb3DEKcq2u4Y1qb7bKxKiNdMHt+hFCdc1vxyEqLHgPJBbB9Ic8cV4RZ4Kl2v7D1mtX
         XllOfS5mnsbPXxApdYeV1FWjgAuyGGmJvz5xjJy8kgXOg/M7fuaKWVr9yvLWZH8wjGtc
         wvL4Fz/9SS9fOZ2C65U/+RXFjsA5lkRzs690Qqvu1NosD7UYMD0UwePgsIt6OXtobkCZ
         wCcT/YTtR7AAWrm1GccViLEXv0Ms7ZdzWhUB/lbW3Qob2ZooiC5lCJeHQpQ1DS2SIVJB
         smzZbmYKGxxvp/c125LF8Q1tPYWU4zQZWtAlLO5aTJk10JB42GrzGKRVD1kiw6ousZhi
         iJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XjsyNthJQ6LEz6SX9rxTBbqUR1TTwhwhwoVKkXhpUAw=;
        fh=ZGg3ZHI1pKEGfgIpTaenbd6OQotj3ouK92c0ES8lqaY=;
        b=ezXSPV60ib/mrHuAti0lUeF9Ey42Y7MWHyZwcyZyADjHzGGaY9WrxgpeTDbRnkAMDL
         cfYy8Pvuk5ge9756kr50pTphuLdGDZl33NatkeiCK/HrlKfXCWpFV5JtLXbBRmdGfG0m
         llJqzhqulglxkzy19KE18ubAF2G+KQXCJ4JhZMrxIjv9F0P8Hfsbt9CctfxtUIodS/kY
         +NF06/MleTCreKgMh0vUjVGowAwaVx+ro5M7JWF53A4F/pGM5iW8+t1TV1segEEcz1TM
         rtkz5V64CwFrSdZouB+0QwVR2yD6FyBBJq/weCUCK6wetU2fuvYXY24HMaQr39yL0XP0
         nEEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=INTFi60j;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l24-20020a170906415800b00a454e1ce8cesor2231677ejk.4.2024.03.06.09.14.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Mar 2024 09:14:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=INTFi60j;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709745296; x=1710350096; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjsyNthJQ6LEz6SX9rxTBbqUR1TTwhwhwoVKkXhpUAw=;
        b=INTFi60j0Xdk21tN4lDceN1t7MQWqwbaQWkubx1TdIKtRDcDmLVwZvZ2qx/0RBnqIQ
         WkGR3HaIMRfSD7ZEYSQxnjCbairjYqVXAOee81qpz/0JjHuUd7H4l2BMA7LnbpFbkKDY
         b8XWsMPCPf3wKnek2zh2DyCQ0Sa0Y4WMkcjojmKzjmzScotHPGg5wH/CThhFEzbEOHws
         M/BNr+D8xYaYWD+HS+QpPjhwd3Ko2gsx+2dZLBPemTDEP0kyrdfUEP11BV8IZchbmWa7
         51IsQZeDDDItg8z2U+gVDgPHEKBetpIbtUJuZPkPyQnvS9bG4HXxX/mOvB8s3uMf4lhn
         jMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745296; x=1710350096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjsyNthJQ6LEz6SX9rxTBbqUR1TTwhwhwoVKkXhpUAw=;
        b=vqwr1dQWo7hKw/58uVIghw7paCB6MR+/J1r08iIgbYq9eWWmfVXTFKKYMIJl9BQSa9
         BTXJvKoqIfj8Mneb0hc5TDTiZzvjv1RJcj6efXstGdgGlgQrUkTfOAOrSuVJ/WVCrp8w
         ufKU5aykoDoyKPT67/RzxaEwlXgXem+17/Z1evzMZW9OuS12tsA3qDKNj6DhV6ubbXT5
         LQaZtsDLdvwiqs2qGb26oVjI0z+t0CZnFV/mgqgIBlLPRo6qQGPndUvHmLFO/f2hPa6q
         tbLqn00lQawfGFKWzKOGV6sDHZ/1YXglxcf0YRi8TqDvnqilh1Nk00RM2+d32hDd3NAY
         lp/g==
X-Gm-Message-State: AOJu0YypUuiS4Eg8I0ovJmC0zmrRqG8FV3sZ3qSsaRV9MODkhQBsPgEP
	Sw8MsO9Uf+dJ4clK13IxdEXyaCPmJDYGnqrRmaJM4jqaOfce1ePWlVVu8562uahsPA==
X-Google-Smtp-Source: AGHT+IEzDMCAv1jmeGC0ooiGaix7vjr0dWNnW+e2K3+cHwRyHziRS4ipyA3ZMUpeB9SviZ5lAMKGMA==
X-Received: by 2002:a17:906:b154:b0:a45:da1:9375 with SMTP id bt20-20020a170906b15400b00a450da19375mr7102659ejb.30.1709745295992;
        Wed, 06 Mar 2024 09:14:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr. [176.184.43.100])
        by smtp.gmail.com with ESMTPSA id m26-20020a17090607da00b00a441ff174a3sm7372337ejc.90.2024.03.06.09.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 09:14:55 -0800 (PST)
Message-ID: <68c4a4ad-cc49-4917-b1d6-d0f28b611c05@linaro.org>
Date: Wed, 6 Mar 2024 18:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 10/19] hw/xen: Rename 'ram_memory' global
 variable as 'xen_memory'
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, David Woodhouse
 <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-11-philmd@linaro.org>
 <84F1C2D8-4963-4815-8079-B44081234D41@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <84F1C2D8-4963-4815-8079-B44081234D41@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cBRMAni8P2eh

On 14/11/23 16:49, David Woodhouse wrote:
> On 14 November 2023 09:38:06 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> To avoid a potential global variable shadow in
>> hw/i386/pc_piix.c::pc_init1(), rename Xen's
>> "ram_memory" as "xen_memory".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Well OK, but aren't you going to be coming back later to eliminate global variables which are actually per-VM?
> 
> Or is that the point, because *then* the conflicting name will actually matter?

Eh I wasn't thinking about running 2 Xen VMs in the same QEMU process,
but this is a good test case. I was thinking of running a Xen guest VM
and another TCG VM in the same process.

So IIUC xen_memory should be part of PCMachineState.

> 
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

Thanks!
