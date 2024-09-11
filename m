Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp205772nji;
        Wed, 11 Sep 2024 08:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzp9KuLJF9Xr1yKI2OyBEPeoX1OlKxlPjk031c6/QowCYGRVVZnvLBt3U29Yfz4MLpbCWInNCTEkK8eA==@linaro.org
X-Received: by 2002:a05:6a20:cd0e:b0:1cf:55e:f893 with SMTP id adf61e73a8af0-1cf62d5cb74mr5418106637.36.1726068735037;
        Wed, 11 Sep 2024 08:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726068735; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAf4oeO2MVFRz1qOeE2ogAkOMWY1LUjyeXnLzvzNAewe3MMnVZ8EtZuc4wuZzva2ij
         r6A4T6Yc8IhD2XET+I8/nFPOI5zyKzdimOpgv+/7vZ2vvkhMX/HAXuc817nyuAoNwjZN
         0b0rBodvFnmIPemdJDXM9Ww810MBVRhpcrYQ+qwwCUelMofwtCVUWIY+k13VqL8xjZl1
         DjRI17oA8nrL6dV3czsBOqd8KXLYz/QZlSKF65cqEp/1f4+BKmTzQVLmhwoJIziNmr1m
         /C8RQ6eZQ+vtFdE7dwpkSRamH4KMhjmG2tVHn8pLaZsdW5hJvBtYkcnnU0FfptAtDS9b
         Hshw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y9xV2TZChxQ5XF8GRBSAuhQm9XxO95EtIVwV6Hqv3wQ=;
        fh=5dAABGTg1/L3l1jriYOuPVD+qYt5W8TLe8Lluh42Iws=;
        b=npAq3pEhOsxp1h1h/ghtK0bWDmXEEesDsHG7EDzvMujMC8mChvgeEzUGHGLRExFADh
         i1GQVNeawuwZR5bDdvhlfoB9pVoY68Y64nZokXsrX8xNsAJTl5qjyeK9E18c+BkiI7Gg
         p+qmTuAeZN15KLsHV4/axSqZ/1g3FGY7fvvXJ8hpm8KkeB7BDeEb11pjzwwIVI8YazMd
         zmasWtRr+gTGxdKEuoEozJokkD3m7i9fzn/cDvTffwQtHWVaKSvc1rttM/Ch3PYHyvId
         9eBglTkR3rB269AImVz69in8+BDltHFaExXZJfEzs3TKu8ujGZKL+HzPmiIk/B9iiavZ
         lBfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EY1ouJ1p;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598e834sor6628803b3a.10.2024.09.11.08.32.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 08:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EY1ouJ1p;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068734; x=1726673534; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9xV2TZChxQ5XF8GRBSAuhQm9XxO95EtIVwV6Hqv3wQ=;
        b=EY1ouJ1pKKk5DGv/SUg3RQmIa2Qz1+tOTYWGhuIm/ONVRI/Egh1q4zEtVuwWWff762
         9zhzRGmC8Ddy2N5EZGZShPy4DGr5tqKU5XS0cQ40o2mV2vF42ZosrO3Rt7b/ap36d3C8
         WP6jOPWE+Ap5Gsw0C28bqw2TVc05sTjkdWhMEdsWfyGFybG/h7RTuiemd3yQviv6Oy5o
         DhPReXnjMuyybTz9xdJHiWXbxMP23HNackjWqSgJZAVk2JLugF7JlWmwalDp2Z57MDZ/
         o0HYjPOFFb3ILD9zuFV1ciua43eeZG1JEkNAeJzNx4RdDqjRkqJOv23V+X5Ip5DX+pso
         glhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068734; x=1726673534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9xV2TZChxQ5XF8GRBSAuhQm9XxO95EtIVwV6Hqv3wQ=;
        b=h+g9GxNqEMa61/g8P+M1rbHdvW8wn1vYb9uZHyEGM8GKonsg1MHQ5j4QMk5LamX2K3
         +3c68+5K7xbs/AhYzwlVV9+XJ6XSQNrwX05NZxASlNcb2LeYaYj944Vun8wKwXRL+poi
         fJAcSX7J+uaTaOcEgejMUwiXbJyvdUCXtQR95Fa/3ws9MNEZgsTuDkMXn7RMroz4JWkq
         Aly2kgjipdxovyc35KvJWDZGE06PEsOqlrokK4kwWUO+iBySI8E/z3RbP9uFyxVEbYFX
         NJc7mF3fmaPNIffUUjNOK/edZOa2fd77BqwSlbr3rBiuPj3pX0Uyw5QEtEeS9r8UfgbV
         9h7w==
X-Forwarded-Encrypted: i=1; AJvYcCXcBFjCQDvVN6cPjp7adVhC6t/ntX+564WLoD2vG9lZYzUofPN0hVAinllKHiSCQDRlaSVGIGGexS745Q==@linaro.org
X-Gm-Message-State: AOJu0YxJIrxI/CeboHpSdhAN36lWTfG32eW7GCUCLsW1NXJlUPmQ/Wfx
	pvhVyjJ2cxkIDW/xFlrti9Zw8jyAfdo9zt4h/4YIaZESjgCGpfH8W7JVfsNsSDXXFg==
X-Google-Smtp-Source: AGHT+IHsW5uOP/RaOllDCB0TLXsQjlnlosQgvXVaTG84PqVow4h1ijgneVn5RfrzY4pP4UlM86UxFQ==
X-Received: by 2002:a05:6a21:2d84:b0:1cf:2ad4:3083 with SMTP id adf61e73a8af0-1cf62ce253cmr6250911637.23.1726068734436;
        Wed, 11 Sep 2024 08:32:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fc8205sm3131563b3a.21.2024.09.11.08.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 08:32:13 -0700 (PDT)
Message-ID: <45c6a39b-9c16-4580-ad6b-99973b5e6b0f@linaro.org>
Date: Wed, 11 Sep 2024 08:32:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/39] hw/ppc: replace assert(false) with
 g_assert_not_reached()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Corey Minyard <minyard@acm.org>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Keith Busch <kbusch@kernel.org>, WANG Xuerui <git@xen0n.name>,
 Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-21-pierrick.bouvier@linaro.org>
 <232858c7-6270-f763-adfc-b6c8259bf021@eik.bme.hu>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <232858c7-6270-f763-adfc-b6c8259bf021@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 11qJ3CUvZnbc

On 9/11/24 07:10, BALATON Zoltan wrote:
> 
> 
> On Tue, 10 Sep 2024, Pierrick Bouvier wrote:
> 
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>> hw/ppc/spapr_events.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
>> index cb0eeee5874..38ac1cb7866 100644
>> --- a/hw/ppc/spapr_events.c
>> +++ b/hw/ppc/spapr_events.c
>> @@ -645,7 +645,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
>>          /* we shouldn't be signaling hotplug events for resources
>>           * that don't support them
>>           */
>> -        g_assert(false);
>> +        g_assert_not_reached();
>>          return;
>>      }
> 
> If break does not make sense after g_assert_not_reached() and removed then
> return is the same here.
> 
> It may make the series shorter and easier to check that none of these are
> missed if this is done in the same patch where the assert is changed
> instead of separate patches. It's unlikely that the assert change and
> removal of the following break or return would need to be reverted
> separately so it's a simple enough change to put in one patch in my
> opinion but I don't mink if it's kept separate either.
> 
> Regards,
> BALATON Zoltan

Mostly done this way because it's easy for creating many commits.
