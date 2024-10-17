Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp299212njb;
        Thu, 17 Oct 2024 09:20:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUc4wfRH/jH86NeeovmmabfGgRNgLI/qbnUqY1MqWg5ZhiIcR8EDPsjqu82FQOTZlX3Rk3Lf73L4Mu3OA==@linaro.org
X-Received: by 2002:a17:907:9445:b0:a9a:59f:dfb9 with SMTP id a640c23a62f3a-a9a059fe81amr1450761566b.5.1729182007999;
        Thu, 17 Oct 2024 09:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729182007; cv=none;
        d=google.com; s=arc-20240605;
        b=feKm93pNm9N//OxHobx4BimDxUeUtJ7rOzNG3wWr0OnWmYE5wQeSUrU5JP9Qbuotpg
         4aawkQVyy39YNzvjqk4kT9AhEZSUgej4SnNF2HNdtpQPUplsJq++/IECronDdalvS1T7
         uPc8B4lT/0OF6ws4r0+6IlGgsTxdMZDUMoDImpwUZY8jSlzhYTZf8lW4+0NJPjFuSKa4
         OMc/lQL76Krq4GT8n0Hb0klEHptJmiuDPH5SmatGTrjt0wtfIJ7Vi/B8JiE5+LSiE2Ir
         IZhmu2yHb5lWLb3qP/PjrRb403yROhHZ8Y/TlyRmNXmTlBNuX4vWHlbMxckdueWQFqd/
         WZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=HmpBTcOE0ntFZvS0kQpWXmflr4NC+lD3no9yEdxNmiI=;
        fh=7xYI+nuf0Ggv9JuazbjoWENGjia2b6HMlqd+ZuTjFCQ=;
        b=YlhFLU35stibLo8Y63yffR9IgexvtQrHXN6WerbdTE3o0So6+625/il/bGzASRxBRT
         Em7k+KkGpiBflcR7dfb5UgdqCEY3Df/XTVHQskoOb44GP9UblFFmXyiHWpaHUrKSgi9G
         DNncuRmlj0+wXjoYAA0Evk5NnlCfg5AO43IE2J72nNKYmUCOxdmU2bOe2lp1TbzSvIx+
         p6aM48/u1A6uLjQeLGSFBxEl7s5GPtWhJTHDbieyt8m4fxs0hV4Bkh55QzfWp6u//kCk
         yimxbky6t0vIV9t8rSyPa+BlQPuDkI4CTDqLrlJbr5Yv9BLHEK6nDYy4LWKd0fnj3X2m
         wDWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QeymjzH3;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a9a38ece675sor164740366b.15.2024.10.17.09.20.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Oct 2024 09:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QeymjzH3;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729182007; x=1729786807; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HmpBTcOE0ntFZvS0kQpWXmflr4NC+lD3no9yEdxNmiI=;
        b=QeymjzH3MJyvXPxaIwmteZAtw6I+xFFWzBNTCsNbDjwI9Vgxgf9cWBerjuYbyzPD1v
         f5hGNFaff8/FNjNzVqKXjO+yTGJrd3BttLIDBZJlZZNDjmBXPaPSr6ZLllolTPoJ9uKY
         Wf5VLIaiSLF3RfGfOsMluy6f6o+VC8l6RKkTCStV+6GS/e5CGHXB56zgigTazUb1ezJe
         DDGBsHASxTkwFE17qE8Ox9tOlmLXcRpBwGwQspg/u+eKRC3QkJxJrtmDBKIruoP5Zji6
         UMQz/e9UySKXFgwWUbiJirpjsTS9ltZlzC1CZjjbgEFXSalOh4KcXkwSr9xiGIgfqq7Y
         Dy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729182007; x=1729786807;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmpBTcOE0ntFZvS0kQpWXmflr4NC+lD3no9yEdxNmiI=;
        b=KXuHeQ8R/JCsonL75vgHUjjF3YoU3OUo6M+D4gCue07FQ37KalC1xu5PIC8odBsTh8
         IivoFvToxcnd+j0ljUBV1uVUvKava5k6so4N7rMQgL+3CKiir9AaXW5cSplARHZfMvqk
         NZHtg9uTpqTD85c7QZ8FFV9z1nXwMmo5pTlRcZYXUzz6bKJ1EDpAqYpDgIMQb/JTirvu
         NaBCgfl4H/QIV+eKEn8qxPMW6JISLXgJEYQ1cFtQLySXs0nhsLjxPdQLAcrcJraRa+Qi
         HTXXFsN13OoVBJzOb0R/f61si4UT+zZ0G2HN4VmoA8DiSXDcXgFCAQ14W6Cx7pz8xpUj
         9a1w==
X-Forwarded-Encrypted: i=1; AJvYcCUdlwGMfDnNpVRZjQmsLMaC0CsUUVNnEb6jvwkNueb4zqhIXCdWFvy4MdlvzhigRhCoofLolUOiqUq+pg==@linaro.org
X-Gm-Message-State: AOJu0Yw/LgNVDklX+IYThcP8LqR2KCLAXoEwHFtQEePuqMItEDYepCiS
	IHI7HZeIMvFp+ncbYZXxo2LLmqP1HD+CtuE8e8A7m0DeTvlIzakcjfBEmaYAfGMcgA==
X-Google-Smtp-Source: AGHT+IGSttzxUaUhDZZgaCdVEeYQp2df1z3HHJBSILlLsGRR43kbRiALvs1wI4UZ6o20hU9GQ5z7pg==
X-Received: by 2002:a17:907:2da4:b0:a99:ffb5:1db6 with SMTP id a640c23a62f3a-a99ffb55507mr1572531666b.24.1729182007247;
        Thu, 17 Oct 2024 09:20:07 -0700 (PDT)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.210.26] (83.11.13.124.ipv4.supernova.orange.pl. [83.11.13.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29844425sm310087366b.168.2024.10.17.09.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 09:20:06 -0700 (PDT)
Message-ID: <0b884126-1fcb-40d2-9fc2-ab0944370fd9@linaro.org>
Date: Thu, 17 Oct 2024 18:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] hw/core: Make CPU topology enumeration
 arch-agnostic
To: Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-2-zhao1.liu@intel.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <20241012104429.1048908-2-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: STeW74ODDYyv

W dniu 12.10.2024 o 12:44, Zhao Liu pisze:
> Cache topology needs to be defined based on CPU topology levels. Thus,
> define CPU topology enumeration in qapi/machine.json to make it generic
> for all architectures.

I have a question: how to create other than default cache topology in C 
source?

If I would like to change default cache structure for sbsa-ref then how 
would I do it?

QEMU has powerful set of command line options. But it is hard to convert 
set of cli options into C code.
