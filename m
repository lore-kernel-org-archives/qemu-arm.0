Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp684517njb;
        Wed, 31 Jul 2024 17:48:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWbMWeFUIXbixbF12t8ajqe2ZghHdzjsv2fcJiCRGJhkPiZFVB9ptyG5zfzKUb9YMJk4TaGBV/kdQXTau0+Z1iy7dVpcnm
X-Google-Smtp-Source: AGHT+IEXSj1V0/NNrB7/QY8bHKZA4PCe3ubXVpZAc9L2dYgBgHEJcYqL2aAXQ5M8mVZXllvqb7P+
X-Received: by 2002:ac8:7dc2:0:b0:446:3487:17b4 with SMTP id d75a77b69052e-4515680cc5amr11898411cf.7.1722473292873;
        Wed, 31 Jul 2024 17:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722473292; cv=none;
        d=google.com; s=arc-20160816;
        b=STMMXfo3r119OCpE265a+ba/Vi0uNQb4ld6aKHh4ABA+42kCENMAk6Z8j3ZT3PGBzx
         sJHdc64CoV/BmpP7fgDE/2Vg30Ai8mLyD/Posw+8T1gvTDxcu0Xd0/NO2xVD++ZvlOwD
         7m8YMk7YJxP1FPB1aPKzszmKeROAoBjPEeKoJX5X439AcHzwJdGTfkq6Mjxo1Y36VZsH
         Xugu6CB5IbELoE8eUcLBTn2PUn0Y1lSfzl+wU5K+nZ6U/st2sJrF1ba6Vn09yIyqDGZk
         2qFRCprvk3YDqJ2qZoCQpbKscYdbA4vR4svxt1BqHcIhukyzHJtVTpInbWhgofX9Dkbp
         2l2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RFQclzW/vuWIgsBJAJ96++9Y/pmxYncNjR7KuXyfSF4=;
        fh=RKf0k43tcNYzENqtjabrBdC5p2IjfNRjz2TwJIjbZcc=;
        b=qyXtcAMS6TJ/JEDRs6nrkFBy7ORz+0NFFi3GydC2oxnct/KglGn0J/TChEQk1exDyb
         IICRGr3DL45fhJsEjTnlwoElvp3dXdpdrri7lbbSnHlqm4BGBBuwYx0rUdIKxHgLOk5Z
         mKtCfGxmTuacgShkrc9ZfO4/M4v6B+pDuHjRsEr9Xvofy/iyFn1rMoPnTdllfaYsI/9d
         OoNw71XCuvaep23BMy9ANWN2tA/MQXRuOqGKKuxp6koqMMEVyIpJ2VHRBG7kv+FNLTyo
         Nm8dFBvEM+9imVWw+ewFyxGp/zvWhmZVfhNAMPljh7SKtO/caPlJVtk78QvrMHP3bCXD
         aOhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FfxMq7h+;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fcca4si170308511cf.259.2024.07.31.17.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 17:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FfxMq7h+;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722473292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RFQclzW/vuWIgsBJAJ96++9Y/pmxYncNjR7KuXyfSF4=;
	b=FfxMq7h+OOQQvgjLuFnnve9idCYs1lHltr7tMrQD4Cr964G7DfAyB8W5ZqAQ5hKMrb1mE2
	Y4NumUZiD4T6+vSddgBcZD5EaifHt7JDaz8aNDLEboOIGXdyLKZeWfAqPfJTa60fFIEMKW
	yUogqvM2TEZH+Xcmd2ZLfX8Hc7WSrGc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-8sBKXc_YMnadAT1b2zwYuw-1; Wed, 31 Jul 2024 20:48:09 -0400
X-MC-Unique: 8sBKXc_YMnadAT1b2zwYuw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a1d4238d65so732998385a.0
        for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 17:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722473288; x=1723078088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFQclzW/vuWIgsBJAJ96++9Y/pmxYncNjR7KuXyfSF4=;
        b=WqAmC4/YQF47hu+UUHzqJQ+0b18B8XV0Cgu+XR/NS+Ygm0VYPQloLPy5oOkQ0QcK1a
         +HyIDc7N9bJA16VSDV967juf/8TkTXmUrer3Bpcv1C37aCqDwd+LwL/ph63q5d3qoKei
         g63Pc8khCZqMzHOyaSV5O5DGXKqmrZ889wrxafnKDawGb061/ngyaCZaEU/V2iQ2PBT7
         4RDyhSR5b4uKtm9ElCyWVdSWW7B55fbwMtNDZz68Jn/0EaDaxfCOLgxRNOLqfnS3/xt0
         OBHgd1oAaCysEJoejcLK9BHJ/Kv3XphFCwwG3AV+PAkAkQ2ohZDkBpY8Melm32tj5sfX
         lt5g==
X-Forwarded-Encrypted: i=1; AJvYcCU3iMSgMTtdQiFaua6DqWx/Y2uGvu8btVB19v5jM8M/8+g7G9YjhgDPbZr3NcxA6B0iz28lI+UceNImcXlBD2nfYT3GQlLQ
X-Gm-Message-State: AOJu0YzDmzd8QSQAvvOgo8VioffC4WA1VRMx0ZsfNnnVOi3jRpGTdF6O
	RuHmWbBTpQs+Uvb9KElhoWm6yNtJzSxcgc/PAtCTwZBKZGyL4onBCPsF+vp4ksORd/I/b8yHJch
	5qwaVs+jEI5eEV2ZHWdh5sr8GFXZ7Cg/gzGBnMrGjIPfverE2RQ/OGw==
X-Received: by 2002:a05:620a:24c1:b0:79f:1e1:faa7 with SMTP id af79cd13be357-7a30c654a9emr124839685a.17.1722473288665;
        Wed, 31 Jul 2024 17:48:08 -0700 (PDT)
X-Received: by 2002:a05:620a:24c1:b0:79f:1e1:faa7 with SMTP id af79cd13be357-7a30c654a9emr124838585a.17.1722473288292;
        Wed, 31 Jul 2024 17:48:08 -0700 (PDT)
Return-Path: <crosa@redhat.com>
Received: from [192.168.5.27] ([172.56.119.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1e4292ae6sm628776985a.74.2024.07.31.17.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 17:48:07 -0700 (PDT)
Message-ID: <2331dba4-4366-48fd-baaf-a5579df8ab59@redhat.com>
Date: Wed, 31 Jul 2024 20:48:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] Bump avocado to 103.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-13-crosa@redhat.com>
 <2d85304c-ccec-43d1-8806-bdf7b861543d@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <2d85304c-ccec-43d1-8806-bdf7b861543d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bV4ccm5juF07


On 7/29/24 8:02 AM, Philippe Mathieu-Daudé wrote:
> Does that restore feature parity for macOS developers? Because this
> community has been left behind ignored for over 2 years and already
> looked at alternatives for functional testing.
>

Hi Phillipe,


As early as Avocado 102.0,  macOS support is pretty complete. The exact 
words on the release notes[1] are:


"User of macOS will have a better experience when using Avocado. The 
full set of Avocado’s selftests are now run under macOS on CI. Please be 
advised that macOS is not currently supported at the same level of 
Linux-based operating systems due to the lack of 
contributors/maintainers with access to the needed hardware. If you are 
a user/developer and are willing to contribute to this, please let the 
Avocado team know."


When it comes to the lack of updates, that is a longer discussion 
indeed.  When it comes to alternatives, I don't expect the QEMU project 
to do anything else than what it's in its best interest. As late as this 
can be, please take it for what it's worth.  If it does any good to 
QEMU, please consider it.


Best,

- Cleber.


[1] - https://avocado-framework.readthedocs.io/en/latest/releases/102_0.html


>> Reference: 
>> https://avocado-framework.readthedocs.io/en/103.0/releases/lts/103_0.html
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   pythondeps.toml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/pythondeps.toml b/pythondeps.toml
>> index f6e590fdd8..175cf99241 100644
>> --- a/pythondeps.toml
>> +++ b/pythondeps.toml
>> @@ -30,5 +30,5 @@ sphinx_rtd_theme = { accepted = ">=0.5", installed 
>> = "1.1.1" }
>>   # Note that qemu.git/python/ is always implicitly installed.
>>   # Prefer an LTS version when updating the accepted versions of
>>   # avocado-framework, for example right now the limit is 92.x.
>> -avocado-framework = { accepted = "(>=88.1, <93.0)", installed = 
>> "88.1", canary = "avocado" }
>> +avocado-framework = { accepted = "(>=103.0, <104.0)", installed = 
>> "103.0", canary = "avocado" }
>>   pycdlib = { accepted = ">=1.11.0" }
>
