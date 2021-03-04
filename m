Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6237583lfg;
        Thu, 4 Mar 2021 05:29:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbnEwP950iXiDNG9y9iUiu0TaGY8q3wQxfBh5DByQ+jWFYSl3x1kQHZ1hg42TMAYpkN7i0
X-Received: by 2002:a17:906:a147:: with SMTP id bu7mr4096379ejb.383.1614864566258;
        Thu, 04 Mar 2021 05:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614864566; cv=none;
        d=google.com; s=arc-20160816;
        b=hiJ3F9Fbl703mQ/S6DMb6VZq7jGmbowWFHGsJmay8hKgQSUTAicIvs+la/Viz+HF/8
         t6ftPR67cyiaZFUx+djoemSsZxNPKVXrAeqhfZFq70mgZ0CXZFpQgalx+n9mgkflFKWA
         E4olkrzVv3RWqDykpMdMQj9F0aZ8eiAN3mdOuViUTwwCm2LDxyGWOz4fPCi9GL4iWX53
         w5PC8cc1XB49RDlct2xkkxOmMNeELKuLiGo595D9ghKaZgTuwpy7D0l0ojUZWjGzIg4X
         G57c+rNKaE1HRjkVqvYOrkVZylU61gmU550SDWywIp7CH+vpUFG5mP97qecW/BC1J7Nm
         wzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=OaUgLzEuoTZ+j76HtUck5LmdQDfa5GlD41NRdKwQBQ8=;
        b=NqVRBZSkvxUZc6xHkJQvZdEtHYr2aPxNOizvosK+y23kfDA8U52EXfYBEIV0wBiWvK
         7U2x0Br0q2R2SjEnFoDZwvmSAEL4LO9NLxKaFbLvF4iolkvvEipc6N3gCoMRyzeNMEbO
         r2HXC0KP7RAhZa+snUuSaxxOaZmWH+dOrpyLHJu86RemGm5d8Juuk7zdipq6AZW85H7/
         sRBdi+k6hbRg8SptIeqi6EebSHXOPU77Ao/UgvUzsoH7C37QYjx1AsGE6pfwimh+1zst
         hyZVRlYSLFOPK0pdCWHMJ779t3AAU0+AjDelVne5vi2ayBcscrZKd1Rrcc9ASk0E26sM
         oqKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GAEieUKW;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id cw22si9488978edb.429.2021.03.04.05.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:29:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GAEieUKW;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614864565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OaUgLzEuoTZ+j76HtUck5LmdQDfa5GlD41NRdKwQBQ8=;
	b=GAEieUKWPxa2Ku3mMtIqRmSM+dqrQ58waLR+jM8pyb/QDtWL5oMCiyUlNm74ymS2tEsIgq
	VAgxLjeYNOaSWclSpWLY1pTWy4aIZH0cusADlY3Ypnw+FiOBMfAeUxJCbT0Ltt91oahwbx
	7EtY+p32fViSf0TWqGFvwsUujpPU6As=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-B_lzezmoOQaQufk5QynSgQ-1; Thu, 04 Mar 2021 08:29:22 -0500
X-MC-Unique: B_lzezmoOQaQufk5QynSgQ-1
Received: by mail-wm1-f70.google.com with SMTP id a65so2649506wmh.1
        for <alex.bennee@linaro.org>; Thu, 04 Mar 2021 05:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OaUgLzEuoTZ+j76HtUck5LmdQDfa5GlD41NRdKwQBQ8=;
        b=M7cwUTFj1EY3dszKmZNosJQKV13XYN6tMVwubaDruPshWoCYIilh+1lTKUbqXcBSQt
         QAagoQ2rhqW8PT/tOcl6rTFJrF35mPVLYgVPjlC4gvZgkg1Te1lwL9FMMpScEUOSQ598
         WeFCfugY5IJeQYnJYjvjyqv2bXqbWyWQOotYB9usMR3doBGVd8vOXhvWzxvf/NjsG+Kp
         qQ0BxxbVoYKjp67IelP5JZyRP/FY7gO3WLJ1KM2GUQMIMDdwW3iPh+jOVWe7sfc7HPLY
         VrGYF32073bz7lgfDv4vOvbD6LsrAKI27UgFNmBGimb4gl7M7oUVpJJAg/c2JmGd6PoF
         AJSQ==
X-Gm-Message-State: AOAM53088cQaA0rPPCuBPyjgT0jFcI8uLk2Kq3iY4SBUjtPY56JiRrQj
	Vgs92P7VPTg44+h4ldqwBGK5nQpJQbWdW3bqqnGQxcr/Vp4oUwO0ofCjFvLCqSMOX+mXst0WQtD
	FGA4DwlaospIgwdzknENCZWY0Nd5JN62osiUpqQaggSrDkYBt1tygQsZExrC7Ud11Xg==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr3988827wrn.213.1614864561258;
        Thu, 04 Mar 2021 05:29:21 -0800 (PST)
X-Received: by 2002:adf:ec46:: with SMTP id w6mr3988808wrn.213.1614864561122;
        Thu, 04 Mar 2021 05:29:21 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id b131sm10094277wmb.34.2021.03.04.05.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 05:29:20 -0800 (PST)
Subject: Re: [PATCH 1/2] tests/acceptance: Test ast2400 and ast2500 machines
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210303012217.637737-1-joel@jms.id.au>
 <20210303012217.637737-2-joel@jms.id.au>
 <5c772df2-8291-ddd3-d289-1f564ec7c744@redhat.com>
 <CACPK8XddbgGgPtkK41MM5ZYeaar27RhnD4vQwh8DcXnFpgoUoA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0aae3aa6-1b82-9002-5911-cd5ec8225f72@redhat.com>
Date: Thu, 4 Mar 2021 14:29:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XddbgGgPtkK41MM5ZYeaar27RhnD4vQwh8DcXnFpgoUoA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: SN/W5G47GjEN

On 3/3/21 12:19 PM, Joel Stanley wrote:
> On Wed, 3 Mar 2021 at 10:19, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 3/3/21 2:22 AM, Joel Stanley wrote:
>>> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
>>> from ASPEED, by booting Palmetto and Romulus BMC machines.
>>>
>>> The images are fetched from OpenBMC's release directory on github.
>>
>> You need to justify here why this is safe to run that
>> on anyone workstation, or use AVOCADO_ALLOW_UNTRUSTED_CODE.
> 
> I don't completely understand. What circumstances would it be unsafe
> to run a qemu guest, aside from a bug in qemu itself?

See Alex's rationale here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg774096.html

Point taken, this should be better documented.
