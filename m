Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5480125ejc;
        Mon, 27 Feb 2023 23:39:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8uOoqBLc4PtucZbNePu63Rq31549YGQCj0UT7v7DOyYzL74VlZqBX+eau3gdcWv99QNmJR
X-Received: by 2002:ad4:5fcf:0:b0:56e:b273:fb36 with SMTP id jq15-20020ad45fcf000000b0056eb273fb36mr4009167qvb.51.1677569994904;
        Mon, 27 Feb 2023 23:39:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677569994; cv=none;
        d=google.com; s=arc-20160816;
        b=ovZ9honip6xAURBX/4+/yvg+NeyuDQxpU0c4gc9AloyKD2/72tBaK0UQZu0gWIezCz
         lyj2ixb9aWz4YXyrJntW9wYCFbg9qf2UbXHffGkygHPry1r7g+90HiYFXdd3FTtrUY3/
         CunM1WZv0XbA4poHsm0/2IKjTej9FvPqh2R+qccLvNG4+2CHtOR15eWBFoWN6sHbeqJk
         F3c2FshBIE2w9lAt+UUxgQiNzW8uKsiU6sxjDcajSFQ8tZ0C6QniiRA9j5OSxwVqBuH5
         nZaIYXmqbdSY1jFgc9caaiIYfQWZRBDrvdGRSWVu+3RbCIeaXqw7W4F/AVkFIRQ4acaV
         UeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=V4CuH1aIrAL4IShJibOpzwPQfte5RpGoDNGh1Yknmno=;
        b=cP8GxIVSgfkqEDMgq9bPbALBWCV3bCAb3hF2xa6zFlIFFXbzoKyBzmdPlcdMF8MsH7
         8oLE4AeYpidL2+t8cL43xqRdKpTNYs+IuI8NZacWM3vlvOn9dGWQ8migvLx19Mvi42kQ
         r8IhHXeb2nGiUovi1CVjQuhtJ7TpKxBCZvAUTTP4T5gwMRfUaMngr9aKJTnsZQ1gIq3y
         5lh18aRe8NUN4YD7TUqq6JqOszFoRhBqrEh/LdcLOYp6m0CWJ9Lc0q8yz3s0HZGp71m8
         fup5kc6HeJb2vnZRqXaPt7E1DhFKIWR0UOaft0l6uX+atMLyHPYB24GIhKRFjNumsXd1
         KKCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dSfVZA76;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r1-20020a0ccc01000000b0056ea051a8edsi8134816qvk.323.2023.02.27.23.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:39:54 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dSfVZA76;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677569994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4CuH1aIrAL4IShJibOpzwPQfte5RpGoDNGh1Yknmno=;
	b=dSfVZA76tuA/yOTQ88MypLxdPxyBcUD6IJOxjIhbk2izEcWEP8t+qZZuutvNdXGW/Y7lCX
	C2ZUQkNq+vf/ZgXlB3XTRkHT9x3kYOA5RrIk4xCh4LgT6v0mFzgVMXedDSxXrGqqC6yDHo
	mJ6nfTaDjaQOSgs0l1t+SG8Z/vP911A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-_55h59iMN_SMERqpgKeG1g-1; Tue, 28 Feb 2023 02:39:53 -0500
X-MC-Unique: _55h59iMN_SMERqpgKeG1g-1
Received: by mail-wm1-f69.google.com with SMTP id m28-20020a05600c3b1c00b003e7d4662b83so6557636wms.0
        for <alex.bennee@linaro.org>; Mon, 27 Feb 2023 23:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4CuH1aIrAL4IShJibOpzwPQfte5RpGoDNGh1Yknmno=;
        b=D/nylIDfdRWhG/cSYMCCdZueIbv3NVIuUqdSixwQzXE2CAM3f6ZcJety36uhhZLzQb
         GJ5+qQjB5tQeVj4dio5wKl5ZOCob6DaqBs9r5XStwaG9Nj+9gVhVTfUEOilfbukQWeLe
         h8Xhjtd3jaIrKgGHUaldohWKVzXo9tFNv0T8X8NT4G5PsPHXD6qqtftC15c2E2X84cyh
         OrzvAqW7jwLL25w8g3KNMofy15C6oSoCjHZjM0tuVNiCoWLKfVPU0yB50i6wtrAE77a+
         jxKzGAc0fiPUeApQk1a3Gz9uNqNO8V5HSdl3k+iTzkzsSO+xp000dkoEz/uXhrJYraus
         nEig==
X-Gm-Message-State: AO0yUKVDH0EynESRSgnYvxFUanmjj+eK5zM2kx/4azJHv0Z/Tn2fPthN
	mdQRbSvidJ/WUBMc/NnW195uw0HlJXLp8sEZ60Fzo43nzT0hOstek0ZRqKft8H16Mb6p7rf17N+
	IlQZhHa8/Xi1I1Y7g
X-Received: by 2002:a05:600c:491d:b0:3dc:d5c:76d9 with SMTP id f29-20020a05600c491d00b003dc0d5c76d9mr1711005wmp.0.1677569992209;
        Mon, 27 Feb 2023 23:39:52 -0800 (PST)
X-Received: by 2002:a05:600c:491d:b0:3dc:d5c:76d9 with SMTP id f29-20020a05600c491d00b003dc0d5c76d9mr1710980wmp.0.1677569991934;
        Mon, 27 Feb 2023 23:39:51 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de. [109.43.177.75])
        by smtp.gmail.com with ESMTPSA id q8-20020a1cf308000000b003e11ad0750csm11789964wmq.47.2023.02.27.23.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:39:51 -0800 (PST)
Message-ID: <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
Date: Tue, 28 Feb 2023 08:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <Y/z4rwv09Ckhbtfp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lpjE5PELzT/p

On 27/02/2023 19.38, Daniel P. Berrangé wrote:
> On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
>> We're struggling quite badly with our CI minutes on the shared
>> gitlab runners, so we urgently need to think of ways to cut down
>> our supported build and target environments. qemu-system-i386 and
>> qemu-system-arm are not really required anymore, since nobody uses
>> KVM on the corresponding systems for production anymore, and the
>> -x86_64 and -arch64 variants are a proper superset of those binaries.
>> So it's time to deprecate them and the corresponding 32-bit host
>> environments now.
>>
>> This is a follow-up patch series from the previous discussion here:
>>
>>   https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>
>> where people still mentioned that there is still interest in certain
>> support for 32-bit host hardware. But as far as I could see, there is
>> no real need for 32-bit host support for system emulation on x86 and
>> arm anymore, so it should be fine if we drop these host environments
>> now (these are also the two architectures that contribute the most to
>> the long test times in our CI, so we would benefit a lot by dropping
>> those).
> 
> Your description here is a little ambiguous about what's being
> proposed. When you say dropping 32-bit host support do you mean
> just for the system emulator binaries, or for QEMU entirely ?

Just for system emulation. Some people said that user emulation still might 
be useful for some 32-bit environments.

> And when the deprecation period is passed, are you proposing
> to actively prevent 32-bit builds, or merely stopping CI testing
> and leave 32-bit builds still working if people want them ?

CI is the main pain point, so that's the most important thing. So whether we 
throw a warning or a hard error while configuring the build, I don't care 
too much.

  Thomas
