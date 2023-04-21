Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp888143ejm;
        Thu, 20 Apr 2023 21:19:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3BBslCXhOoM2UwugRXumdLtZfbLjQ/dtaeHsjuR2LA9i+DrJCOIgjoahKoPZxo6l75n0K
X-Received: by 2002:ad4:5c41:0:b0:5f1:5f73:aee0 with SMTP id a1-20020ad45c41000000b005f15f73aee0mr3750865qva.15.1682050757180;
        Thu, 20 Apr 2023 21:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682050757; cv=none;
        d=google.com; s=arc-20160816;
        b=ABsEv9fhA6xCLGmXjLKaawf3HowW1DGOQf4CcD6eWduUK4WO5SIeJMx7bhge6Zru6e
         Rsk/LsdPOhhALn/j6BqR7/SdtQItAoWyh2oym3f/Z7IiCGOOQRn6Nk40cdqDXjF/5tnX
         95OXanJhFS9tn06y8BVQWj+Qkg4iLR7w9Sn+Fdl3vstiG2VgXJdjIKYG6sX78QSvPEph
         47zQNfhe8ljNM7b1meYsH42vqWi9eO9e4wWaZOl3kqBzl4MJpvVEh+wy9t8/PqaTm9VB
         QPHlo0C9BqRAotSV4QaToijqm4GRYCFvXGy73RG2g05r/pndwnZK21nJzuryobADziHD
         XxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L1oZHDQLPG2gM87D0eT39CvXVL5Vz97NndtTXVulh3U=;
        b=w9h7DaGMqs9LKE6pazuWq+buWfdQFaS0UI/cIPXJQQjDn6rsg+OmnF9GPPpPMihAax
         IL/7O8kkbQF/q9NeM3ZBi7CDXK6H69gEEqeWpZivl4sJ7xgv44oF5zhDtVF9n37knp4L
         8HYxVxQcjb7Dty+2EHEnGi+Plp/R+t0L5jgz9Wh/iQKtc9nzVwQVV0yfvAekgNv689G0
         Qcd1Up8Tqxd+ivbIPrAZywc8vT55Dhf7jzkD6Z6RgzHr6Tap9ElgbE2zS/XJRI+FVHu8
         +KU5tw8XHQbEAj2PJvfbAlltw85BY/LG3hXPSP9tdya245/jdDttjeECfI9Ppe6w0zn6
         pCeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WaF42O1C;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id if2-20020a0562141c4200b005ef80b6ec3esi2499694qvb.568.2023.04.20.21.19.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 21:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WaF42O1C;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682050756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1oZHDQLPG2gM87D0eT39CvXVL5Vz97NndtTXVulh3U=;
	b=WaF42O1Cyutpz7YalL58rHVOa0Y3UnIhrvzx6AheBNGYyL7exiyBpjSY6ZBJWtWFP8Cl7g
	pLAJE97y7nKsnxwv+ZcmHriXNBP9/nCNdRqsk1sr8wsQArJwat/aF6MJVcbihAxxM58jdN
	0kHkWtCxSRJJj8f5K8tWYhE7gaqm9Ec=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-c8-WAod8OeK3k64P2XZ2gw-1; Fri, 21 Apr 2023 00:19:15 -0400
X-MC-Unique: c8-WAod8OeK3k64P2XZ2gw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-5ef4b68f47bso9252206d6.2
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 21:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682050755; x=1684642755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1oZHDQLPG2gM87D0eT39CvXVL5Vz97NndtTXVulh3U=;
        b=Mv0qSItyKumRVvJ+IXdu7QSPP6egmI+9lpAkKSo7tyg74md1W/XKq4/S9kyAw2/9a0
         gshsIxnATIPGZ3xu8cC/zjcFPF/sWqF5ljPfX8E1yFr0QTAO9CdvoVqZ4H3DtvXknfk4
         QYupcOPmOegXWI4i2iJxlzJxFZDAB/q9+f3opfBlc0BEeZDenWOkGjANT8AztVoGu1WY
         u3sNg2hsT2pXdHqXRv3IWzZC9vUkMJqoxt9wwqVoMzwnfoZtpWe+EAgzz1ZzkgNAxgEC
         MspiyNorEJHa0Ph55B6YQULZhOLfXnirt19PWQDW/255rosDTDDsfd5caqFaLHO16mhZ
         je+A==
X-Gm-Message-State: AAQBX9dqfL7fZzWOqXxoHQRFflyMtX4qoP9L17odKaQ8ayJ37xD+y9LH
	0il6JihfV84N1urHIvXJPr+AUOSpo6tPVpHyPWjoucl+OhYkLRztqqv5M2NufX9wpN4/YVoEPHo
	yhCUa9wQ8paJj9kEE
X-Received: by 2002:a05:6214:f6c:b0:5c5:6e60:eacd with SMTP id iy12-20020a0562140f6c00b005c56e60eacdmr3233242qvb.28.1682050754974;
        Thu, 20 Apr 2023 21:19:14 -0700 (PDT)
X-Received: by 2002:a05:6214:f6c:b0:5c5:6e60:eacd with SMTP id iy12-20020a0562140f6c00b005c56e60eacdmr3233226qvb.28.1682050754692;
        Thu, 20 Apr 2023 21:19:14 -0700 (PDT)
Return-Path: <crosa@redhat.com>
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5? ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
        by smtp.gmail.com with ESMTPSA id v3-20020a0c8e03000000b005eab96abc9esm875884qvb.140.2023.04.20.21.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 21:19:14 -0700 (PDT)
Message-ID: <edcd817b-826f-f437-4ea3-33c5a567770a@redhat.com>
Date: Fri, 21 Apr 2023 00:19:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <2a2124d2-5fcf-cfd2-4f68-c3f602f2824e@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <2a2124d2-5fcf-cfd2-4f68-c3f602f2824e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9oIeTz6g1pjN


On 4/18/23 03:10, Thomas Huth wrote:
> On 17/04/2023 15.43, Alex Bennée wrote:
>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>
>> Avocado version 101.0 has a fix to re-compute the checksum
>> of an asset file if the algorithm used in the *-CHECKSUM
>> file isn't the same as the one being passed to it by the
>> avocado user (i.e. the avocado_qemu python module).
>> In the earlier avocado versions this fix wasn't there due
>> to which if the checksum wouldn't match the earlier
>> checksum (calculated by a different algorithm), the avocado
>> code would start downloading a fresh image from the internet
>> URL thus making the test-cases take longer to execute.
>>
>> Bump up the avocado-framework version to 101.0.
>>
>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>>
>> ---
>> v2
>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>> ---
>>   tests/Makefile.include | 18 +++++++++++-------
>>   tests/requirements.txt |  2 +-
>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 9422ddaece..a4de0ad5a2 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>   # download all vm images, according to defined targets
>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, 
>> $(FEDORA_31_DOWNLOAD))
>>   +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter 
>> -j%,$(MAKEFLAGS))))
>> +
>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>> -    $(call quiet-command, \
>> -            $(TESTS_PYTHON) -m avocado \
>> -            --show=$(AVOCADO_SHOW) run 
>> --job-results-dir=$(TESTS_RESULTS_DIR) \
>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>> -            --filter-by-tags-include-empty-key) \
>> -            $(AVOCADO_CMDLINE_TAGS) \
>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>> +    $(call quiet-command,                             \
>> +            $(TESTS_PYTHON) -m avocado \
>> +            --show=$(AVOCADO_SHOW) run 
>> --job-results-dir=$(TESTS_RESULTS_DIR)     \
>> +            $(if $(AVOCADO_TAGS),,                         \
>> +            --filter-by-tags-include-empty                 \
>> +            --filter-by-tags-include-empty-key)             \
>> +        --max-parallel-tasks $(JOBS_OPTION:-j%=%)             \
>> +            $(AVOCADO_CMDLINE_TAGS)                         \
>> +            $(if $(GITLAB_CI),,--failfast) 
>> $(AVOCADO_TESTS),             \
>
> We might need to revisit this --failfast logic, too. If I've got that 
> right, failfast is now the default with the new system? So we might 
> want to disable it by default again if GITLAB_CI is not set?
>
>  Thomas
>
Hi Thomas,

I must be missing something, because under Avocado 101.0, I'm getting 
the following behavior without the --failfast flag:

   $ avocado run --max-parallel-tasks=1 -- /bin/true /bin/false /bin/true
   JOB ID     : 646f476f01b8d5599a57530606de543f2d9a5366
   JOB LOG    : 
/root/avocado/job-results/job-2023-04-21T04.15-646f476/job.log
    (1/3) /bin/true: STARTED
    (1/3) /bin/true: PASS (0.01 s)
    (2/3) /bin/false: STARTED
    (2/3) /bin/false: FAIL (0.01 s)
    (3/3) /bin/true: STARTED
    (3/3) /bin/true: PASS (0.01 s)
   RESULTS    : PASS 2 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 
0 | CANCEL 0
   JOB TIME   : 1.01 s

   Test summary:
   /bin/false: FAIL

And this with --failfast:

   $ avocado run --failfast --max-parallel-tasks=1 -- /bin/true 
/bin/false /bin/true
   JOB ID     : ae4894607a42194a7382efa545eccaccf7495fa3
   JOB LOG    : 
/root/avocado/job-results/job-2023-04-21T04.17-ae48946/job.log
    (1/3) /bin/true: STARTED
    (1/3) /bin/true: PASS (0.01 s)
    (2/3) /bin/false: STARTED
    (2/3) /bin/false: FAIL (0.01 s)
   Interrupting job (failfast).
   RESULTS    : PASS 1 | ERROR 0 | FAIL 1 | SKIP 1 | WARN 0 | INTERRUPT 
0 | CANCEL 0
   JOB TIME   : 0.75 s

   Test summary:
   /bin/false: FAIL

Maybe it's something in the Makefile I'm missing, or something specific 
to these tests, but that would be a long shot.

Thanks,

- Cleber.
