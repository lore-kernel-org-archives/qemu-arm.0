Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp882353ejm;
        Thu, 20 Apr 2023 21:04:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350YLEI5pSkqKNFsdkRWgSO8uC28KyOqa9pRmgmnY8PuAVL95t6X7u9Y3BOSzuJAFwDFdIN5T
X-Received: by 2002:a05:622a:1711:b0:3bf:e15f:935c with SMTP id h17-20020a05622a171100b003bfe15f935cmr6504039qtk.14.1682049876257;
        Thu, 20 Apr 2023 21:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682049876; cv=none;
        d=google.com; s=arc-20160816;
        b=REVzSMiN6S3YaMEKdL9LG1IPyHs/3g9lhNjcf9J+CyX7BQvzmHinVGT45Gsrzkrxg5
         dhsFldllKPznH8XCzq5TtHT3GAMQcWKejz7qoegHmPv2BcW7umJT0SHN8MN1VC/H5+yV
         /PBoZ0fLrWFagTjY9MbBHiIvBkGJipRULwsn7Vt2OUfQaDiKZPWXssP5hTnotGea7Ood
         tWRbOK14yAedKPmyO06VMYCG63gVmJH0FoQyx2nbVZZw9tPj7iwGZHOeUEH8V9kkPp7E
         s2N692QdPWwYTHhg1ArOice3+riYmfLuE0MbCEJ4/XmDwmtWhYpOw9kp7NAxRhnP9cJi
         XOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vMzNTPrUJS5JMZ6SEkPKIcJnwhAMSTH/bLapn1qPrl0=;
        b=aVTLl0sNL+QcfmicwP3f64E7WB9Nx9Q6jo1VdLFYOmGKoCJ2vbTFLeqHR1FKQcURKT
         bNFKiOrxCrK6RKzMKq9i0scJqk/PWhtLazd9MJ26Zpady33uWP9Ttt/SWzlIaN0amXBI
         AmYazxYuin6vk3wkdEQ1Qk2En/nKn+huTK9IoUDYebbPvqQG/WhqUgnQg/1pNcMAlx0m
         +rkVr88HVUCZ6k+JEBn9cwe2GP+fh69Mtzb7V+TPxxBvKxD3C9KZN65QR7ZQlH+EnLLH
         c74YYXO7nP2sVVwrztVRqS8BMK/kqTNQ0SxOJeESIxW8oD7XqA3X45nSCRnhszGo2nCN
         iQAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J4q57Aum;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y12-20020a05622a120c00b003e2e280c4aasi2555922qtx.713.2023.04.20.21.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 21:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J4q57Aum;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682049875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vMzNTPrUJS5JMZ6SEkPKIcJnwhAMSTH/bLapn1qPrl0=;
	b=J4q57AumCMmbQcPm3o7OZw8Sg5/tTz8hRbtlYHhJTDtTnP+srXzKzdBELEEzNEH90o8+dn
	K3ZyMXakU0sk5ltkwKjco07nTkkxPZ/rzwLNAQc1ffKjt6LOm2WepxcaTqrPVbUQV9X7FU
	pTCfo3sMtadEXRykVw3K1fusvzMQDws=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-LD9mKIWhPiG_18B97sh1AA-1; Fri, 21 Apr 2023 00:04:34 -0400
X-MC-Unique: LD9mKIWhPiG_18B97sh1AA-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-3ed80d7bf28so9508161cf.3
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 21:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682049874; x=1684641874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMzNTPrUJS5JMZ6SEkPKIcJnwhAMSTH/bLapn1qPrl0=;
        b=h0sMoM82Y4CPKJBDALDk5RkzAj0UFDzLwfqCpjsGOLbMTkjAHESHdAQFimEDtAxzaI
         ZXoGfsZFjLdSvDsv57e/zC0cB17c5R15dSmCX0IupaJd671wqzaT+dWO8woOGMChwq1H
         eDArCZ06UxRpM7Dpmhpz8s976yQcWDDy4iSxZpTMcF/7DLnl8wawojGo5v0dQyi3nBnM
         hypQ69AlOYdLYcXY/rmfxR7b4NED6WN+3pgmwWrEv8eqooA+2+f4O5QaFUtr4o6vLZOM
         Q+P9kTlMoN/8lNeTXBMN7QEdq7cqbIzatVrZBFJTZZqoZ2Cy7CICPP84eTB+xWCQWMSV
         atog==
X-Gm-Message-State: AAQBX9egguoaBly8ETNMQJYNzPKKDgk+5WIUYH7zkmnepAlq+zqzZugW
	rzIUUJNnW78xnKkRlvvtZw/gZfYIF57Ea16hgQxH+k9EXzkgOSUrx7O0xTUVWYQC4cZYQ+tksRa
	H8iHLLQXIC7US7yFI
X-Received: by 2002:ac8:7e89:0:b0:3ef:390d:1b4 with SMTP id w9-20020ac87e89000000b003ef390d01b4mr6016588qtj.9.1682049874035;
        Thu, 20 Apr 2023 21:04:34 -0700 (PDT)
X-Received: by 2002:ac8:7e89:0:b0:3ef:390d:1b4 with SMTP id w9-20020ac87e89000000b003ef390d01b4mr6016556qtj.9.1682049873745;
        Thu, 20 Apr 2023 21:04:33 -0700 (PDT)
Return-Path: <crosa@redhat.com>
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5? ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
        by smtp.gmail.com with ESMTPSA id b10-20020a05622a020a00b003e65228ef54sm1015739qtx.86.2023.04.20.21.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 21:04:33 -0700 (PDT)
Message-ID: <b9ff933a-2319-ab64-5db5-186b70a5e68d@redhat.com>
Date: Fri, 21 Apr 2023 00:04:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Cc: Jan Richter <jarichte@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
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
 <87pm82e74d.fsf@linaro.org> <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ecpm5fb/Jg9X


On 4/20/23 05:18, Philippe Mathieu-Daudé wrote:
> On 17/4/23 19:44, Alex Bennée wrote:
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>>> On Mon, Apr 17, 2023 at 9:43 AM Alex Bennée <alex.bennee@linaro.org> 
>>> wrote:
>>>>
>>>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>>>
>>>> Avocado version 101.0 has a fix to re-compute the checksum
>>>> of an asset file if the algorithm used in the *-CHECKSUM
>>>> file isn't the same as the one being passed to it by the
>>>> avocado user (i.e. the avocado_qemu python module).
>>>> In the earlier avocado versions this fix wasn't there due
>>>> to which if the checksum wouldn't match the earlier
>>>> checksum (calculated by a different algorithm), the avocado
>>>> code would start downloading a fresh image from the internet
>>>> URL thus making the test-cases take longer to execute.
>>>>
>>>> Bump up the avocado-framework version to 101.0.
>>>>
>>>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>>>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>>>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>>>>
>>>> ---
>>>> v2
>>>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>>>> ---
>>>>   tests/Makefile.include | 18 +++++++++++-------
>>>>   tests/requirements.txt |  2 +-
>>>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>>> index 9422ddaece..a4de0ad5a2 100644
>>>> --- a/tests/Makefile.include
>>>> +++ b/tests/Makefile.include
>>>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>>>   # download all vm images, according to defined targets
>>>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, 
>>>> $(FEDORA_31_DOWNLOAD))
>>>>
>>>> +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter 
>>>> -j%,$(MAKEFLAGS))))
>>>> +
>>>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>>>> -       $(call quiet-command, \
>>>> -            $(TESTS_PYTHON) -m avocado \
>>>> -            --show=$(AVOCADO_SHOW) run 
>>>> --job-results-dir=$(TESTS_RESULTS_DIR) \
>>>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>>>> -                       --filter-by-tags-include-empty-key) \
>>>> -            $(AVOCADO_CMDLINE_TAGS) \
>>>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>>>> +       $(call quiet-command, \
>>>> +            $(TESTS_PYTHON) -m 
>>>> avocado                                                 \
>>>> +            --show=$(AVOCADO_SHOW) run 
>>>> --job-results-dir=$(TESTS_RESULTS_DIR)  \
>>>> +            $(if $(AVOCADO_TAGS),, \
>>>> + --filter-by-tags-include-empty                          \
>>>> + --filter-by-tags-include-empty-key)                     \
>>>> +               --max-parallel-tasks 
>>>> $(JOBS_OPTION:-j%=%)                       \
>>>> + $(AVOCADO_CMDLINE_TAGS) \
>>>> +            $(if $(GITLAB_CI),,--failfast) 
>>>> $(AVOCADO_TESTS),                   \
>>>>               "AVOCADO", "tests/avocado")
>>>>
>>>>   check-acceptance-deprecated-warning:
>>>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>>>> index 0ba561b6bd..a6f73da681 100644
>>>> --- a/tests/requirements.txt
>>>> +++ b/tests/requirements.txt
>>>> @@ -2,5 +2,5 @@
>>>>   # in the tests/venv Python virtual environment. For more info,
>>>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>>>   # Note that qemu.git/python/ is always implicitly installed.
>>>> -avocado-framework==88.1
>>>> +avocado-framework==101.0
>>>>   pycdlib==1.11.0
>>>> -- 
>>>> 2.39.2
>>>>
>>>
>>> I thought there were test failures that prohibited us from bumping the
>>> Avocado-Framework version. Did those get rectified recently?
>
> No, still not working on Darwin. At this point I'm thinking at sending
> a patch clarifying testing QEMU with Avocado is not supported on Darwin.
>
Hi Phil,

Do you mean with or without this version bump?

Even though it was somewhat recently[1] that another level of Darwin 
compatibility was added to Avocado, where a good part of Avocado's 
selftests[2] were enabled in OS X, Avocado 101.0 should not be that far 
behind.

I honestly believe people testing and reporting successful execution of 
the Avocado tests under Darwin with latest Avocado. Hopefully my memory 
is not playing tricks on me, but I'll attempt to verify that.

Cheers,

- Cleber.

[1] - https://github.com/avocado-framework/avocado/pull/5622

[2] - 
https://github.com/avocado-framework/avocado/actions/runs/4417285317/jobs/7742772932?pr=5622#step:10:11


>> I'm not seeing any with your patch applied.
>
> Are you using running the Cirrus-CI jobs?
>
