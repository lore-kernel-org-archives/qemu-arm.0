Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp619125ejs;
        Fri, 31 May 2024 09:23:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUITdx34/wSz0GAjsfSIyIc8qKZMUq1UScQ8YmJT7x7dmAc28lUD1uiBGbKRN6t0pvDFoH7AftvDtrzK0Fwa0YwjfmDDvkb
X-Google-Smtp-Source: AGHT+IGjWcll2FMCk4ScoOpyI2y/808cQF624l+SCWJtFa47F2ztOwjRSMw2xMwol54QOVD6HxeX
X-Received: by 2002:a05:622a:1aa0:b0:43f:f238:f7c7 with SMTP id d75a77b69052e-43ff5238cb7mr26021651cf.12.1717172626356;
        Fri, 31 May 2024 09:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717172626; cv=none;
        d=google.com; s=arc-20160816;
        b=zPQB5zfRpk0dOoQIFCkLVPetXpk8ZHlwEdLmpdE+sqFiMQRi+lhY7+XE8uIVS36S5K
         08GzKKU63mTVr9dXcsT0N4jUUtiasjf+cEKb/JWmfwJqm/JksY1yHCYCCMfIMr7eZiRm
         QHaKV/4QF/UTAAzCbDExpzCh8uBHpeKs/JMblSxpvCMbdHxbZ137iyiL2XsXXpw5sDJV
         L4izyAxlhpsK0X0C0dJ/08x3t4Xf/X54pMTvn1wz7XA5ecj1EMJF0mOYPF6dwBzd3ksF
         khCwP24GYYiouOqcWDWKhHGssb1gnoV+YczkS2A0PviXINfymq31pG0k5RjSbT9S7HEF
         BjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=QSyRvL3fViS1ze85bZ1WGsZzC+7tfcXns1wLCwSrmPY=;
        fh=UwvuTn1ZYx3bYqAfqIteIrdVkq3w6x6JRd9ocIbwxng=;
        b=m7pnhGsXJuzVLYxEI3SoD73HSOoMJZxwW6aSjqxDjyV9kfxG6eGNsNr+yEFHR4rY/j
         vVKgPCZN6s9Tt7ekA6VGv2xziY2uJJ1km3NTpXqidvENz5oHXyWx14t6ZvsyXXn5etFY
         QvvpjxQyAkercb8oPK6BBh1KVXeGvQtctJqvmyaJSedaMpmogTbd8gkjloA9Wqo1Ovsq
         nya4Kr9jNL9dvCoJG83N5XF3NQJwR5l5J45X5Qi0pBH5jb9wUWB8xeSgdsxNRjYIlszq
         RJ1qlpM7zDikqtu7m+17ChEW8J9Yyn/dqA1jbZDhUAsjKQyB4nzgjkdGYqusmEfs28qU
         YOww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PJ4pV9XL;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff25b6e46si11331991cf.771.2024.05.31.09.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 09:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PJ4pV9XL;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717172625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QSyRvL3fViS1ze85bZ1WGsZzC+7tfcXns1wLCwSrmPY=;
	b=PJ4pV9XLK7KdvmjIPRwNCqw+zuW2W3b83lj+uvXZxsabXSxxgbBwBPjPiIQjNLmSE9uwmG
	v5EMmxjiJ9jL362NNwtLQ1l8N0oAnTfQTNJCj5FLMCZFAbwpHCq5VucBFKy5SEV/271wtE
	q3IX7uxYzoiGsxfkQ6GtKhSaiy2H2yA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-Qm1N-FnJOC-SNacTidCA_g-1; Fri, 31 May 2024 12:23:44 -0400
X-MC-Unique: Qm1N-FnJOC-SNacTidCA_g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6861bb1c0bso46582866b.3
        for <alex.bennee@linaro.org>; Fri, 31 May 2024 09:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717172623; x=1717777423;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSyRvL3fViS1ze85bZ1WGsZzC+7tfcXns1wLCwSrmPY=;
        b=jnaN3io8IVmVWzSYWlF6ppxSb34IeTykfT2JMpSjJ9lndnnYUCm+HkurKVddYepz9x
         +0s6cRuD6Y8iCuSFgPRrUPVgW+cg+btxjrh2WSJsAlnXqjU8xMC3MD3HOYSkYThhS8Bw
         xuc0fhRssRi9OaD3R3Dq5tc0AZzqy+NQ7sd2MBCO46R0jcxoPCfnVwZl4hU8VhIYiYzJ
         DJEJ/19ZFj0UJYIOO+i5c8y8L5ChZvx3qxBtJoNFU59BEOJleOK4gscCgQcJ4z4/mDXM
         t1889STWoQJSKzVxnlPGwju07xKnoMK0i4MvVsEWZa/d+a9VcaDb7UlBWWG+z8z3tZR+
         hY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVXankAD/9gvOaReZS7FiLVzrDfCDOtsPCCtVeLqwO0GUVW3S5EDAtKUTdlQLcMLAxemJoyuBRxWi+FmaUvBor1XWgb0ECa
X-Gm-Message-State: AOJu0YwrS+aHCaJ3uac2iaeEdQTS3Oen+VZF0JEs6Y7kqhxlTUFKInrw
	Hvo43awFeY/5cMGIaXnkh6CUjcPmtDfkQMe3zR8vwBkQkyf+z+WDUIu4TL/VhWkQCJoQOJYdTVz
	Jlgb/lQmQ61CWJCKsvXIK9ZD+g6r3DFugqu/iaZGe5qJvONT5STY3+A==
X-Received: by 2002:a17:906:b24c:b0:a5a:8ca4:6781 with SMTP id a640c23a62f3a-a6821f51918mr157770566b.51.1717172623153;
        Fri, 31 May 2024 09:23:43 -0700 (PDT)
X-Received: by 2002:a17:906:b24c:b0:a5a:8ca4:6781 with SMTP id a640c23a62f3a-a6821f51918mr157768166b.51.1717172622691;
        Fri, 31 May 2024 09:23:42 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-43-176-229.web.vodafone.de. [109.43.176.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67ea586905sm101745666b.114.2024.05.31.09.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 09:23:42 -0700 (PDT)
Message-ID: <6fec1c49-c6a6-4e96-bc44-5dc7feb843e6@redhat.com>
Date: Fri, 31 May 2024 18:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org, devel@lists.libvirt.org,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <ZlnYkt9sLgDbQqVT@gallifrey>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ZlnYkt9sLgDbQqVT@gallifrey>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nTKqfvO3N+3h

On 31/05/2024 16.02, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
>> On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
>>> We are trying to unify all qemu-system-FOO to a single binary.
>>> In order to do that we need to remove QAPI target specific code.
>>>
>>> @dump-skeys is only available on qemu-system-s390x. This series
>>> rename it as @dump-s390-skey, making it available on other
>>> binaries. We take care of backward compatibility via deprecation.
>>>
>>> Philippe Mathieu-Daudé (4):
>>>     hw/s390x: Introduce the @dump-s390-skeys QMP command
>>>     hw/s390x: Introduce the 'dump_s390_skeys' HMP command
>>>     hw/s390x: Deprecate the HMP 'dump_skeys' command
>>>     hw/s390x: Deprecate the QMP @dump-skeys command
>>
>> Why do we have to rename the command? Just for the sake of it? I think
>> renaming HMP commands is maybe ok, but breaking the API in QMP is something
>> you should consider twice.
>>
>> And even if we decide to rename ... maybe we should discuss whether it makes
>> sense to come up with a generic command instead: As far as I know, ARM also
>> has something similar, called MTE. Maybe we also want to dump MTE keys one
>> day? So the new command should maybe be called "dump-memory-keys" instead?
> 
> I think there are at least two different concepts; but I agree it would be
> nice to keep a single command for matching concepts across different architectures;
> I can't say I know the details of any, but:
> 
>    a) Page table things - I think x86 PKRU/PKEY (???) is a page table thing
>      where pages marked a special way are associated with keys.
>      That sounds similar to what the skeys are???

Sounds a little bit similar, but s390 storage keys are independent from page 
tables. It's rather that each page (4096 bytes) of RAM has an additional 
7-bit value that contains the storage key and some additional bits. It's 
also usable when page tables are still disabled.

 > I'm not sure the two fit in the same command.

Does it make sense to dump all the MTE or x86 keys all at once? If so, we 
could maybe come up with an unified command. Otherwise it might not make 
sense, indeed.

  Thomas
