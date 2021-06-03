Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp975143lfa;
        Thu, 3 Jun 2021 00:31:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeYXS7/VJXuFEuzAw/b3XYv1SAbQTyVPRhjwhQ9VL+RQAaqgCXkLPViePPt3jj4u/A54tQ
X-Received: by 2002:a17:906:95c8:: with SMTP id n8mr30965926ejy.357.1622705510224;
        Thu, 03 Jun 2021 00:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622705510; cv=none;
        d=google.com; s=arc-20160816;
        b=J5qydvaz1RD4ysFeaRknrVNWzcE0GwrUUTsksMvdR09foc5cL/Xo/kB7fNMt7VZkbY
         tVMfF3BAM4X0FxLbqmKMlow5/ROhK8/6tUDXCK9RjJ8U3vqhsr5KSTK0mDMr65sxkcYP
         hhq5gPXchCPNa4veuW8OWwGLih5aiC/6GG5AqRWV2zIzUX0My+AhQDw1mXQi5qdspQ3t
         gVzFLl6fhjuLjj6hG+IvmbiUeMepdGtZKIbcLqL4zlRRSci1oNQy0L5i22B93NEy4mTn
         pr5BaGbEdLit6/GB0tpqftCETKOTOztPiZ3yFh245+ewpuL+7eUcZXFs1J1iIF32tXXz
         3i+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pCTDmi48zjVIWQyiqWra6J10ZTXn/GPlHRkqMqEgK5w=;
        b=ThzuNRm2nKhZyiQtFaxytkg8HMHWskJcNUx3vWuhiBmVMzGR9LoxFI0uKgxCW/cpGW
         JYpmv5HmST4QJ/fb1WTyx43pcETDwSTU5p/cG2cD5WyfbUHIpWxbqnK97gYfKIJC3QDg
         3k3KPwhnYdBIj/xkKXiRYuFsKV+z4eDiQQUWENqbfanPxeFnJ98bWcr6hyP1emlpJucE
         laEy7sCIOKEhBcNYjQIwqTU215mhVH1Vy0ICcPHpfScrtps6LrOOl8aO/EgiO7pvRpA/
         dnGHEslPBIOtlJld2oHG0yl1/iiH/G42Ur4ixnVi0a+HDLXO7qQM9KjsvzqpMzk2AtrW
         1xfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="X/BMoHw9";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id zh8si2066067ejb.109.2021.06.03.00.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jun 2021 00:31:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="X/BMoHw9";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622705509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pCTDmi48zjVIWQyiqWra6J10ZTXn/GPlHRkqMqEgK5w=;
	b=X/BMoHw9GxCHaGznNflHat++N24Ygzwq1ynR7QqliN+56cyck/nFalcfrod4A55tPk938z
	FvOB8CFbO88jk+QiyYtVpjGa1w9Hx3kjWvr9w3dQ0/TM3vwZ4zM0yrrpIOzVJAY4A3Vy+R
	mm4nBYpwi/63BUxw2BLAlORt1/qusaE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-YiYHpVLzNNK181DfqA5NvQ-1; Thu, 03 Jun 2021 03:31:48 -0400
X-MC-Unique: YiYHpVLzNNK181DfqA5NvQ-1
Received: by mail-ed1-f71.google.com with SMTP id s18-20020a0564020372b029038febc2d475so2829678edw.3
        for <alex.bennee@linaro.org>; Thu, 03 Jun 2021 00:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pCTDmi48zjVIWQyiqWra6J10ZTXn/GPlHRkqMqEgK5w=;
        b=dX8Firu1cj4ULFnI7VRbxICbz40EQcpUqNt8nPxfz/ufRHDMkDCq8e4zTEHHO382uv
         z8xGBX+UhElY6lgVHY5amecYszoVH3eJ8phPP2r54fcXNqImNdgt5Cs6R1rDZwbK3uTG
         q/+BVHx2nquEUUfhH6gw4yFldXMX/HiJXlMv1bijUXBGszFoCpoprmW8Lla3JKslEAQA
         UKz56FB0QyTeuacBKn7hm7qtDvoT2wRE9Wlj+3TYffmdVDnyFUNpvbHnKImOVKXP10dp
         rxPVlIKoydJqTHyvTR1PghSMTZQ9CTy9HoNCUXyvNDLsS0xxMGrG+b0BJVT9L9/M06dl
         0kLw==
X-Gm-Message-State: AOAM531Nz1Cf3AHF2EcL2wRMqdQKRfO5zdAaBQLDorpjT/rOU7puCSk0
	o91aiFBjnF4BS5f84ZgSfn7/T1NnCFKRY7mVctSJkQHne2noUIbJ/aW35hLMgPq6y2RSir4FE5I
	kQ4P3UTXXH6fUFqAH
X-Received: by 2002:a17:906:13db:: with SMTP id g27mr37921931ejc.88.1622705506665;
        Thu, 03 Jun 2021 00:31:46 -0700 (PDT)
X-Received: by 2002:a17:906:13db:: with SMTP id g27mr37921918ejc.88.1622705506525;
        Thu, 03 Jun 2021 00:31:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id h2sm800210edr.50.2021.06.03.00.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 00:31:46 -0700 (PDT)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
 <e42a93e4-dfee-2446-f82c-8fec074d4c59@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2ae093f8-a825-275f-a73c-81d7af0d58f2@redhat.com>
Date: Thu, 3 Jun 2021 09:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e42a93e4-dfee-2446-f82c-8fec074d4c59@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ANHFtY/eYYoz

On 6/3/21 1:26 AM, John Snow wrote:
> On 5/26/21 1:04 PM, Philippe Mathieu-Daudé wrote:
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>  > - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>    specific information. Currently the common structure base
>>    provides the name of the accelerator, while the specific
>>    part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>      { "execute": "query-accels" }
>>      {
>>          "return": [
>>              {
>>                  "name": "qtest"
>>              },
>>              {
>>                  "name": "kvm"
>>              }
>>          ]
>>      }
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v8:
>> - Include code snippet from Markus adding to machine-target.json
>>    to be able to use enum values or union branches conditional.
>> - Use accel_find() on enum to be sure the accelerator is enabled
>>    at runtime (chat with jsnow / eblake).
>>
> 
> Hi Phil -- Unfortunately I think I am going to defer on this one until
> Markus is back. I need to chat with him about the right way to design
> this, since I'm also not entirely clear on it myself.

OK, thanks for the update :)
