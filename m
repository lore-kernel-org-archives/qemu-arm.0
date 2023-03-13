Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp493083ejb;
        Mon, 13 Mar 2023 10:14:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set+eFkDUtvvbt5+MNiOx8ZeYL+tRaUckWAvj6ioE6svrsYx9iOLO/HWZfJ5RroeM7usM3LJ+
X-Received: by 2002:ac8:5fc1:0:b0:3ab:ceb9:10fd with SMTP id k1-20020ac85fc1000000b003abceb910fdmr59396208qta.25.1678727653380;
        Mon, 13 Mar 2023 10:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678727653; cv=none;
        d=google.com; s=arc-20160816;
        b=dDEdfcFUYEwdEN0b8AnvTDHpWahOGcVapmpx/A9R7i9z9ux/m6UNzglBq2kn2ZlFap
         /MbqQEY5raUBXif5ysA+U30hVOqOVkvZt+IPNpZsWqGX0DzT2OWYzg9w6N+jGXB/p6lj
         69O9hSEpJullrgFawrkiJ/s3PWEFdvCG0w7ELT1e61tdX2YuTfqQHZM+Nm3RbyCaxzT1
         I3j5ReG2Azxrbf1zmhgT/oQ064GqQRYhlDqmd1XoUkDdxefn21ZFDkxCs/+UvjRSPKB8
         +aE9+hTyUn53iPL0mpn1yq/5HXsgQsjRaF7zsLiFCqFRZ+kcrA5/M6t9CYAFZynfGGpJ
         mhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tJP6VUkwFGYAY1BpgXT9Iu7NR1d5+Kne1UwV2XxOSPc=;
        b=tC4kQ3u/RupmX30OGgaklCgketT1biVeFj7ToX8QUis4kkishBSPFHQsgRVf6PpGfe
         KaK9ApLqLS17DxXDZoO83SGWfgupKG9aqQcSyoOy3UaxnwScL7c+6Vi8eejspp4GCTpR
         +hKPgBtEc+ntA8qgJ3cbaKHxFQ8gfBKAGh/kA74yfG5L+Z2ZliLz2NYrhZvJDIYCD1+d
         T56xxvuxu9yxAV2os6igSRyCqUxwSXpUuU4WEhB4/9empZYVSF7fByHuY075Eea5lHpO
         IGxxmPdvs+bNO0BH/NsFV7vwnuBQT+R57ovpXtqT5aiEel8B3TKpeNKxOoyb0NFUVRuw
         /HGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hV7BPfto;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p7-20020a05622a13c700b003a98930e7c0si239695qtk.118.2023.03.13.10.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 10:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hV7BPfto;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678727652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJP6VUkwFGYAY1BpgXT9Iu7NR1d5+Kne1UwV2XxOSPc=;
	b=hV7BPftoe8D5XBZQst7PDYrYJH7I0jwOd1OWIanQqJWFvM2PHeoal4+0KxMVHq1VxdCrDh
	KXUqS5cXjV2FwF5tn8zheZNS1k6+7nhQ2ZhJyDcVMKCk64ugUhzDcEvMXAkye+MMP7NiWQ
	83Wo5oZkzBqubxjp4IW6XvLeuF8GkKc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-0yztyDK4OIm2nFzpwSGqnQ-1; Mon, 13 Mar 2023 13:14:11 -0400
X-MC-Unique: 0yztyDK4OIm2nFzpwSGqnQ-1
Received: by mail-wr1-f71.google.com with SMTP id h18-20020adfa4d2000000b002cea098a651so1064597wrb.3
        for <alex.bennee@linaro.org>; Mon, 13 Mar 2023 10:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678727650;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJP6VUkwFGYAY1BpgXT9Iu7NR1d5+Kne1UwV2XxOSPc=;
        b=VVss07DBpiFIfcnP+PdL8MIcWIal7HmLcWcWVhmiRh+nja1C+/0v3LT5ZbcLESGR/O
         lURpvW2L3A+iDUsmId7aoBkrQ9sb5aah0BmsDqZuhtb/lyRbLYXgYb5EEFNn8itOEJz8
         EEZsIXKBF9xfC4RGPsjghQ6kOqqc692BkaxpVtM3B2urQ5e5OBtlhyWMWeQLzYMcqi7l
         yAc/cKd3y1rgJoPA06hFhVTDahBDC88cAcqgw+0N1vc3BsWvzdrVvVnTDyj4loZTrf8h
         Ex5AoD7L92or6k1f7G0YBOFCPi0Y4te7FfEs4GDMAPpcBhl28e9pk3YQTK0cC+GPCCKy
         oHnw==
X-Gm-Message-State: AO0yUKWBzOWCL8Picz2BJ+at5E6VTnDfbPKARNxMj80oyHlzyRvNtfME
	O+N+GoeTYxSugdX+wnb3cHLihSHCePlqZYEDhFpfSg79/jktd1nGNGtiHJrDtN9mPHMbeB9cIsv
	aJVhZRX9Rp6VuSB1y
X-Received: by 2002:a5d:4f83:0:b0:2ce:a8e2:f89e with SMTP id d3-20020a5d4f83000000b002cea8e2f89emr4376256wru.46.1678727650508;
        Mon, 13 Mar 2023 10:14:10 -0700 (PDT)
X-Received: by 2002:a5d:4f83:0:b0:2ce:a8e2:f89e with SMTP id d3-20020a5d4f83000000b002cea8e2f89emr4376247wru.46.1678727650220;
        Mon, 13 Mar 2023 10:14:10 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de. [109.43.179.26])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d42d2000000b002ceb7a11eb9sm7986wrr.42.2023.03.13.10.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 10:14:09 -0700 (PDT)
Message-ID: <b23fcfab-cc1b-a861-94ed-217af69f1ef8@redhat.com>
Date: Mon, 13 Mar 2023 18:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
 <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
 <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
In-Reply-To: <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: w+5No62QNc8T

On 13/03/2023 18.03, Peter Maydell wrote:
> On Mon, 13 Mar 2023 at 17:00, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 10/03/2023 11.31, Alex Bennée wrote:
>>> The kerneldoc processor complains about the mismatched variable name.
>>> Fix it.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    include/exec/memory.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>> index 6fa0b071f0..15ade918ba 100644
>>> --- a/include/exec/memory.h
>>> +++ b/include/exec/memory.h
>>> @@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>>>     *
>>>     * @notifier: the notifier to be notified
>>>     */
>>> -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
>>> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);
>>
>> I also keep running into this problem ... I wonder whether we should run
>> sphinx with "-W" to turn warnings into errors when configure has been run
>> with --enable-werror ...?
> 
> We certainly try to do that: docs/meson.build says:
> 
>    # If we're making warnings fatal, apply this to Sphinx runs as well
>    if get_option('werror')
>      SPHINX_ARGS += [ '-W' ]
>    endif
> 
> Has that broken ?

It apparently does not work in our CI, see e.g.:

https://gitlab.com/qemu-project/qemu/-/jobs/3922732898#L1420

... there is a warning here, but the job succeeded happily.

  Thomas
