Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2641815lfb;
        Sun, 6 Dec 2020 15:44:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzE/lvBrp4OqnXXLHiBzS6aZlAXg1GDcZbScrR9t/7TlF2Cm/tSn2RUnTiw99qP7vj481ED
X-Received: by 2002:a17:906:1282:: with SMTP id k2mr16276801ejb.554.1607298290790;
        Sun, 06 Dec 2020 15:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607298290; cv=none;
        d=google.com; s=arc-20160816;
        b=slqEhoVExByRsq+1P5C7qh2ICOO5YYegSON4Hp3kc8MISv9xYCaULL+4206oOg+4Dt
         ZzpMvPiGvcsCAGcQkfWBqCIh6oASdSLXF21U6X0rGe6TzhamRtz5CIh0uATNeHkwd/xx
         WfqJFMZ1gbmyUipkjItsunlVnJc0rVKAdBXW5mCPpK+iFLDQt0PPB9V/VUYSQQ3vxIbD
         Jf5g99fRtSvRX6EanAptShZLsTl6YWAo1/+GAk8m77vK46cld1LT5ZhImUG7Uz2jZD+R
         5kvD14o0TFj4OG6UhHnImxrBGkHbfq/O9uXqkeJQzPkC7vW43y4s0R+B7wXYEv3URRg5
         OL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=EVBInixgmn136ovV1rZRYaD9AJ24IiI0pMFI4QniZVU=;
        b=ux+WfKzd61TfKY2oJW1JSZVtQtWCnbhTjZONt8p9fhzLSMUt2XvrcKlU15ejbb2x2d
         Qj2xcQqt7SJjsuyelWSXK/XdfUzAnqMxOUh+mtBcWqxLAM28nQEpxaSoqKMudMPob45U
         MSjnCKx1uUU3d9QXuqCyuFj8+nKGTuNi5ArhozyluHzuDWtLaXhQDbx9hvgRT8NKnXKc
         xLE0ZTNtwSRJt0eGeF4MHLp30IDtZZI6aOS4y9wtOo0PERBQYrdU2dcIy7XT4y/5rNL0
         5HKkjoe3UPD4aTM2omINMQRtzyHgsM0wsLH67n7gFB59LDWXAVa98k7sAI4DKTJglMLJ
         KZjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z5MFfdtt;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c11si8696365edw.86.2020.12.06.15.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 15:44:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z5MFfdtt;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607298289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVBInixgmn136ovV1rZRYaD9AJ24IiI0pMFI4QniZVU=;
	b=Z5MFfdttJmL+jS/jrQNGh3AIV+Nz4WGQqI5HZXxkK1h8Rw5wzhW2ehZFbGOoOKghuIE3Vp
	Pf3x1QUwP/ZKUR0LtttTIB9ESxVHTTyiSgBzu484xjQca2RK0bONnukhxroL9W+1Rl20s0
	wun9XtedSnPh8pyMCAXQOk6jhOgiBkg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-eZOZ03ICNWGWBMfMRe7roA-1; Sun, 06 Dec 2020 18:44:43 -0500
X-MC-Unique: eZOZ03ICNWGWBMfMRe7roA-1
Received: by mail-wm1-f69.google.com with SMTP id r5so4622041wma.2
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 15:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EVBInixgmn136ovV1rZRYaD9AJ24IiI0pMFI4QniZVU=;
        b=JUhyZtMdDTxvBWgHp3vslVZoV9A/FP0K3pR3NdD2q96Fg2ibBWjP2eJLctrgLQhSTV
         un7L00MG57LSKMWyVauzG0gI457UcbBUCVFwwvLvwtDCxghuNHRIKvDXFpA4HIlidJpD
         Ggmk41hBbM7w7KHopn40odkP4SGa1Q8ymAg8z54JINDgfxQv/TGpf01yeAYQrVsPBOIY
         6eVUr4E9cuvk7DZbg6n0Q5l1mpnrIXjO8Ea++ff7meM++yTW873dwMk9GUdUaL8UlqKg
         DKvQO6jA0h+mSAXOwZqOdPkEHQW+j2lQlnWwPILJcDU3yTTTvDKCNYWLVDkRa5o/jaWb
         dYvw==
X-Gm-Message-State: AOAM533RkWYuHa9pq0snAYHnZf4hsVnj233GMbg0RsexiXFTVbbqt5vA
	MkvqswO8q3zeG/YD8l0NQGJEFauf4Act4XHqRb3wwuYFBA2FJgfYl7TacYsBuZ8kA/4hsU4yIxv
	6Sk0DvoqeKUZFb52H
X-Received: by 2002:a7b:c303:: with SMTP id k3mr15698499wmj.21.1607298282181;
        Sun, 06 Dec 2020 15:44:42 -0800 (PST)
X-Received: by 2002:a7b:c303:: with SMTP id k3mr15698481wmj.21.1607298282031;
        Sun, 06 Dec 2020 15:44:42 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id c9sm12697020wrp.73.2020.12.06.15.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 15:44:41 -0800 (PST)
Subject: Re: [PATCH 2/8] gitlab-ci: Introduce 'cross_accel_build_job' template
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Willian Rampazzo
 <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-3-philmd@redhat.com>
 <1691b11e-dd40-8a15-6a34-d5e817f95027@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3b42add-6586-8723-ab81-4fdd660277fc@redhat.com>
Date: Mon, 7 Dec 2020 00:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1691b11e-dd40-8a15-6a34-d5e817f95027@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: PHFbV9zHG//1

On 12/6/20 8:23 PM, Claudio Fontana wrote:
> On 12/6/20 7:55 PM, Philippe Mathieu-Daudé wrote:
>> Introduce a job template to cross-build accelerator specific
>> jobs (enable a specific accelerator, disabling the others).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 099949aaef3..be63b209c5b 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -13,6 +13,18 @@
>>            xtensa-softmmu"
>>      - make -j$(expr $(nproc) + 1) all check-build
>>  
>> +.cross_accel_build_job:
>> +  stage: build
>> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>> +  timeout: 30m
>> +  script:
>> +    - mkdir build
>> +    - cd build
>> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
>> +        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
>> +    - make -j$(expr $(nproc) + 1) all check-build
>> +
>>  .cross_user_build_job:
>>    stage: build
>>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>
> 
> Hi Philippe,
> 
> probably I just don't understand how this works, but
> where is the "disabling the others" part?

Sorry I forgot to document $ACCEL_CONFIGURE_OPTS, which
can be used to amend options. See x86 and s390x jobs
(the only one buildable without TCG afaik) use:

    ACCEL_CONFIGURE_OPTS: --disable-tcg

> 
> I see the --enable-${ACCEL:-kvm}, but I would expect some --disable-XXX ?
> 
> I am probably just missing something..

The goal of this series is not to test --disable-tcg, but
to test --enable-kvm when you don't have access to a host
arch. I see testing --disable-tcg as a bonus :)

> 
> Thanks,
> 
> Ciao,
> 
> Claudio
> 
