Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp879267ejm;
        Thu, 20 Apr 2023 20:57:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zyz4DYdcNiRHvXDTJjVarJIs3C9MfChHdY+XeLssY4Q28VdG3VeNkAZ2lErSFYPCZbOTJ+
X-Received: by 2002:ac8:5846:0:b0:3d9:4586:3ab2 with SMTP id h6-20020ac85846000000b003d945863ab2mr7044008qth.28.1682049424256;
        Thu, 20 Apr 2023 20:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682049424; cv=none;
        d=google.com; s=arc-20160816;
        b=kCXsRU7i6NAbqqXPaKudOyCmWrPMgnsBmYDD4n6TQ63BBzqpBCOiTOK3ipePgR1+ZF
         Y/6hAHPwfshJp+NY4TowPEUR1W2n46ZeyjV3FDOFjh7Glzr/6M8V/vqcTfKHdg9o75Bv
         4ZZwNElj960GTiBWSLACi+g9Fh67ahu0KtouNcsTpPI5HBhBhqSIGZfxCog6PfTXdHHY
         4HRLodro6N7Ih77xSEDmysyixohLfN1gX0NW9LOCJcw/JsffD7qvyw6BJD/ksaG/OIg6
         CE6fkq6WeMvMR5FgPyPau8tWFRu1NstKvzalm6GllusWCRErZc4rx/4b/Z82DYhue+1/
         OAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=D2R9+j84v3SZps6ZPoxuZMk+JbRfFMGX4gEN52VNSbY=;
        b=Q1xvbH+wCM33nsswAUf+iL4/7XCKOdm7nqTG6OF5F7sCHRYMUmjPB3RR+mlUV8dsLS
         gYI3LeYo69Yhn0ypdfMrAcjriUrh7gB1GtFBeOdnC49wRYROFXvTLUultWqOcqrR3LLH
         EA6EFYIltgQCqATxZNvML1c5S0n8bqhiVkDzWUXEK63N3u/vcnUZ5lroVcpUgHKeZ1GZ
         P4SmJQubUwI5Tiv3x5LxPU52dE0kauz8C3Jv1Ctr04ernC221K9IdOypQFI5Bx4KYbjE
         JgnOiWc/iCyqbVi2MLinyVJsRfK1Obl3Abp8SgaWr0FqvVW8um1iurGqwdFvXGBOF/Fe
         Nz6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WJnjLOB8;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bp13-20020a05620a458d00b0074e028df985si2468440qkb.456.2023.04.20.20.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 20:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WJnjLOB8;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682049423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2R9+j84v3SZps6ZPoxuZMk+JbRfFMGX4gEN52VNSbY=;
	b=WJnjLOB8aPrmTCUQUlB3Vv28JR189Ctqh+RzcUSKWQPb6fmyENsx6H8x2NR6LZaUnJNZBF
	GxZggDcJY6pIcuh5Sw5NnNQBhs1rCeLdzl2k9AWUBCsJMyKOMkmYBlogN65Jf3ZBf04VnH
	Qe4UIZd99JC0NuHrO+VLdPshBr4YNeg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-G3qO_jc6PzWjgXOxp4giTQ-1; Thu, 20 Apr 2023 23:57:02 -0400
X-MC-Unique: G3qO_jc6PzWjgXOxp4giTQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-5ef447da6b6so9431536d6.2
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 20:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682049422; x=1684641422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2R9+j84v3SZps6ZPoxuZMk+JbRfFMGX4gEN52VNSbY=;
        b=TJE21oyHekp+B4oNLDDqgjj0MLrHS45h9kfUIRPAUIIleg3FyFzyXTwTZAq+DDriOC
         MsZrbhP3j2vrYhiDn0X7KtzOHfUgH0fL7HtnUe3NZ5pfNN2LAAY5axzmw3DAoAJKkQyu
         YMe/Z1SFZOIbGqZ1UiZEPBqG2M4J9Hz6bzKQbIOKuBM3Ts+uUKPgdAqGMzPhvOIS5kAP
         rvuUhhwyCuPAQr1F/+aNf2rFxpDOXRDhGdvqex4/oveVsGpDZn0hVGek0YN4I27K94ji
         V0GYJyCOail1aLRHIh640NVIdDSMyWBJtXQ1ms23lKf8MLpOcAeI1mYRDGTYZrl3IlAR
         QZ6Q==
X-Gm-Message-State: AAQBX9ec/ndugTk+omx8hgICReHK0ltuyOkahYqxB9ol6MwHLqIRbXJx
	weYA2s6zQsb5fWmn8wAACIPzs+qHmGFMVRQg5JgDE3N3hjr6zywPTrfJNvCHWWFFBysq6BG7go5
	b0qplrkYiit55rXP1
X-Received: by 2002:ac8:7d50:0:b0:3ed:ac62:1039 with SMTP id h16-20020ac87d50000000b003edac621039mr6299374qtb.8.1682049422124;
        Thu, 20 Apr 2023 20:57:02 -0700 (PDT)
X-Received: by 2002:ac8:7d50:0:b0:3ed:ac62:1039 with SMTP id h16-20020ac87d50000000b003edac621039mr6299347qtb.8.1682049421856;
        Thu, 20 Apr 2023 20:57:01 -0700 (PDT)
Return-Path: <crosa@redhat.com>
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5? ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
        by smtp.gmail.com with ESMTPSA id 1-20020a370701000000b0070648cf78bdsm985413qkh.54.2023.04.20.20.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 20:57:01 -0700 (PDT)
Message-ID: <6096da77-6488-7702-78bb-3c0390bb825d@redhat.com>
Date: Thu, 20 Apr 2023 23:56:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Jan Richter <jarichte@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IU82H2s9q82O


On 4/17/23 12:50, John Snow wrote:
> On Mon, Apr 17, 2023 at 9:43 AM Alex Bennée <alex.bennee@linaro.org> wrote:
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
>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>> ---
>>   tests/Makefile.include | 18 +++++++++++-------
>>   tests/requirements.txt |  2 +-
>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 9422ddaece..a4de0ad5a2 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>   # download all vm images, according to defined targets
>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>>
>> +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
>> +
>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>> -       $(call quiet-command, \
>> -            $(TESTS_PYTHON) -m avocado \
>> -            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>> -                       --filter-by-tags-include-empty-key) \
>> -            $(AVOCADO_CMDLINE_TAGS) \
>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>> +       $(call quiet-command,                                                   \
>> +            $(TESTS_PYTHON) -m avocado                                                 \
>> +            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR)  \
>> +            $(if $(AVOCADO_TAGS),,                                             \
>> +                       --filter-by-tags-include-empty                          \
>> +                       --filter-by-tags-include-empty-key)                     \
>> +               --max-parallel-tasks $(JOBS_OPTION:-j%=%)                       \
>> +            $(AVOCADO_CMDLINE_TAGS)                                            \
>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),                   \
>>               "AVOCADO", "tests/avocado")
>>
>>   check-acceptance-deprecated-warning:
>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>> index 0ba561b6bd..a6f73da681 100644
>> --- a/tests/requirements.txt
>> +++ b/tests/requirements.txt
>> @@ -2,5 +2,5 @@
>>   # in the tests/venv Python virtual environment. For more info,
>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>   # Note that qemu.git/python/ is always implicitly installed.
>> -avocado-framework==88.1
>> +avocado-framework==101.0
>>   pycdlib==1.11.0
>> --
>> 2.39.2
>>
> I thought there were test failures that prohibited us from bumping the
> Avocado-Framework version. Did those get rectified recently?
>
Hi John,

While testing before and after behavior of pretty much every test in 
tests/avocado/,  I've found that some tests may get affected by the 
extra isolation (and overhead) of the new runner in recent Avocado and 
may get interrupted more often than on the previous runner.  But this is 
highly dependent on the amount of resources the machine you run the 
tests on has, and how tight the current timeout is.

Running all the tests under old and new Avocado also revealed some tests 
that are equally broken under both versions.  Thomas has bisected some, 
and Cedric has come up with some patches too.

To risk not being too verbose by default, let me know if you want the 
full details.  Also, see my previous reply about the two issues I'm 
aware that would make this bump as seamless as possible.

Thanks,

- Cleber.
