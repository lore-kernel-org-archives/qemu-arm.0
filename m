Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp941107ejb;
        Thu, 6 Apr 2023 01:22:54 -0700 (PDT)
X-Received: by 2002:a05:600c:2312:b0:3ef:6396:d9c8 with SMTP id 18-20020a05600c231200b003ef6396d9c8mr6369615wmo.5.1680769373905;
        Thu, 06 Apr 2023 01:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680769373; cv=none;
        d=google.com; s=arc-20160816;
        b=jIwIHZOdAPdO7rqXod140H2cIr0n4racN/glpHaAX/837pEvrEOwn0msctz3p8lTQD
         DpsA9lyx0YWPgg5MCQm5a3pmrmKN9of6fptbnHk9hmfpw2MQTifa8Q2RbHmS2K+rEtTY
         mLy/C9AzqwTkJufx2tUbE0ChJGTsTPF2WPnCIsNNrSm8FN9Ik2JiDuUbqhkLQftusOGS
         tLO/V4J2oBd8/mduyoZGSQe9vwEYNZF5oOSAMyLUgt0NagDQOYefq1rd25uhUmgt9qc6
         2tCrXH3C8MAILz+FDlgUZLngprojUO4zr//V1tSizefv9Tc7lXACMlXqC94ymrnkS4cO
         Mh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=f+vv1701z4r3GsWrWzYSdehjnmgPql22xoY5uBZzFYQ=;
        b=JjIr5c7UbGWh/xuvBe5cOwQ2wMt6r4NaHt6hpqA2JqvyAOP7Ftuf3cgdrhFSRdG7/I
         HIal/0pHOZmpU18r/FnNyYIfsX5nBwlYGUY2XRdYDPrVLvVk58aDZvHVGAtshlaJ6uKb
         bFu+39T9ouqPOUmSTx4c3t4YCZ7LClLBl5Q8qypfj0ZkhFEysUCYlud9y7cfpMBlK/Bz
         pGJqyzs3QWWfNgWNgvH1p6VdgRdxOMdyXwXahePjK80QQA/OgNkzIqHa1IwcIJkiyttp
         eQ8s+4dm2LXOPRHSncx+SLclmiaaPlOa91GU6ejauRzEljMmn4ikj8ox+4ostnMacL+R
         KzCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHfZ72U8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t19-20020a1c7713000000b003f046de2c74sor210279wmi.29.2023.04.06.01.22.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Apr 2023 01:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHfZ72U8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680769373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+vv1701z4r3GsWrWzYSdehjnmgPql22xoY5uBZzFYQ=;
        b=gHfZ72U8PDz3pJ0wSpvqzO56iy9RJ0imX7saOaCqxClUJyiEnArU+wNiP3jmx7GuRy
         hjYFHxs1VXKfQs6JeZuQN66v0h/MzWbkw/54erYOfqqRP4IvqRVebixWdejcycrQluvq
         cmFmI/l/3QGAaSDd0eF8KOrr+8Q0lO20Ymt9Qbsp+wHD4MRuYJTrHY8kQMa0iSuuyBV8
         EX0Mw0dI1i5p2m8GUqybfr/A9WAjUtFpbzvpcnshWY6fp2YHYQQNwatnwEwKYWFkQsVc
         hQpbvVFJA8PHRVwsFGuJChPbxSpU/kzukOpWkkyd6JHj/DpPbGk7w8fTt/6S9io95/0R
         yleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680769373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+vv1701z4r3GsWrWzYSdehjnmgPql22xoY5uBZzFYQ=;
        b=UTaaknNM6j24tmjXZvv7r9m8a1eqyEg/7OvbEw5E5VPjFTRsYg5IVx/fNGH994gdA3
         ovmUHTDsQEhOqAfAK8aRtR03sVaaGxM2HKP16ObZ9PLdW72bW1o6e+J6f+0ke5DgxsdF
         8PQed6MjdHj028+1FrqPYH5desbzrMFyyy3mBoIY4iEok0EQq8dv9hNdZEQKAIvXYsEU
         Ckw9uGXSjD8hsh1LfL7ediGZ5usf3IjADf7RixfVxAHGDSDsJYM8cy7KY4e9mpyLvjhS
         d6s85MIC1n9lxEtB2prmjanSEVp58HUGXb7swdGXj7DalSEqWgSlT1LAMaYGbvbTHbxU
         8dNw==
X-Gm-Message-State: AAQBX9dLsn5rMinnCxd0NeMo+UACa+q0puWItfbbI9t7bHIdvHROw724
	23wp9CMGzaBqYtEWtY0eW2mI0s5O
X-Google-Smtp-Source: AKy350bcVUwtarMk34DWCLPwzCwjECA0NL2+n2OBSiBjCe9BW3F4CnRqEgBhgifFneH5j/sjzSbckw==
X-Received: by 2002:a1c:7c05:0:b0:3f0:3377:c15f with SMTP id x5-20020a1c7c05000000b003f03377c15fmr6665588wmc.12.1680769373564;
        Thu, 06 Apr 2023 01:22:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id iv15-20020a05600c548f00b003ef5b285f65sm4614032wmb.46.2023.04.06.01.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 01:22:53 -0700 (PDT)
Message-ID: <c47e1b5a-38bb-fe08-8020-29361fd0e99a@linaro.org>
Date: Thu, 6 Apr 2023 10:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-11-philmd@linaro.org>
 <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
 <3fe240da-9a75-0e39-7762-cd91af9ed3f0@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3fe240da-9a75-0e39-7762-cd91af9ed3f0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oaE17vDcIR7s

On 6/4/23 10:04, Janosch Frank wrote:
> On 4/6/23 09:50, Thomas Huth wrote:
>> On 05/04/2023 18.04, Philippe Mathieu-Daudé wrote:
>>> Protected Virtualization is specific to KVM.
>>> Rename the file as 'pv-kvm.c' to make this clearer.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    hw/s390x/{pv.c => pv-kvm.c} | 0
>>>    hw/s390x/meson.build        | 2 +-
>>>    2 files changed, 1 insertion(+), 1 deletion(-)
>>>    rename hw/s390x/{pv.c => pv-kvm.c} (100%)
>>>
>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
>>> similarity index 100%
>>> rename from hw/s390x/pv.c
>>> rename to hw/s390x/pv-kvm.c
>>> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
>>> index f291016fee..2f43b6c473 100644
>>> --- a/hw/s390x/meson.build
>>> +++ b/hw/s390x/meson.build
>>> @@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>>>      'tod-kvm.c',
>>>      's390-skeys-kvm.c',
>>>      's390-stattrib-kvm.c',
>>> -  'pv.c',
>>> +  'pv-kvm.c',
>>>      's390-pci-kvm.c',
>>>    ))
>>>    s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
>>
>> Hmmm, maybe we should rather move it to target/s390x/kvm/ instead?
>>
>> Janosch, what's your opinion?
>>
>>    Thomas
>>
>>
> 
> Don't care as long as the file is not deleted :)

I followed the current pattern:

$ ls -1 hw/s390x/*kvm*
hw/s390x/s390-pci-kvm.c
hw/s390x/s390-skeys-kvm.c
hw/s390x/s390-stattrib-kvm.c
hw/s390x/tod-kvm.c

I'm still unsure where is the best place to put hw files which are
arch (and accel) specific.
