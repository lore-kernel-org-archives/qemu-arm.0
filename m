Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp884415ejm;
        Thu, 20 Apr 2023 21:09:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350brsBJ9WEnb8yOCgUdQY4y63ZTX4SDaej0a49MCR82LX5Idcg5VsbIJjk5oA8TOv/is1f8Y
X-Received: by 2002:a05:6214:20aa:b0:5e8:42d0:d74c with SMTP id 10-20020a05621420aa00b005e842d0d74cmr4998258qvd.37.1682050175716;
        Thu, 20 Apr 2023 21:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682050175; cv=none;
        d=google.com; s=arc-20160816;
        b=0BpK4ys7VJ0//xowrFIHS0pxZhkauuAuOBCEl+sYfSBLoWLlOOZ1+Ck6XYXYS9uX9w
         B2HyqlYSLRaz4lxjzhYojlxHzUNJye6I+flc3rwNNGxxKRhrje8SOzM5qUwSNnv22FdE
         x1oWKetIBnPHLRQqAG2Vnbh6EuOL00LUvQNpdsQ7VpkqZeTrHbMa3CKEKwQiZKhdDHci
         7K5drtUbBoELhSGhyOT3f+Wd79h/zMsksQHtDxQEF5zwFtlWHV3uSlUMKtAZln12vfJP
         4ryxIj5rG1Ghxsma8rWX06+byRWM8J7k1iToAmZijtxw7+a8E14RV8IUQIKSjzQ5Kg5b
         rqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zLbGYm0H2CK1LiFwWsNMUKtM8FNsuL53Mqy2W+BD9Rc=;
        b=aH7/KUbI6JYEU9Sphkjiy7/By3y4rDk4z/xfTuPGzDOvqDRluvkU8Op6GtlY/0RtPb
         mG0hMqjNSvxE9BFTcJruSXTtdnmoUwfRodnDjKGD7GWseWORaseR/gsFDGaUPMb/a02x
         VEyQmMPXFk3AS5+HCbkcqhwMnu9KaRXTCcttpOu5S8LhhYv0fvizxCfFWjNflg2edpCX
         iCK5njeqL8Rr64RIBnm30mKVH1aX3jsS+4f88W0xm+IbsxKVgMVd8yzCg/0mhADcy/Wr
         X1BfQknE2KM0rs05XQiAR1z4cZcn9MZ4dZr/nuJjdIwE1PqNhWo1X+xXHy0w3G3/51uX
         c4LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bm+7zGLe;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id gg13-20020a056214252d00b005ef5b0e47f8si2508567qvb.451.2023.04.20.21.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 21:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bm+7zGLe;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682050175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zLbGYm0H2CK1LiFwWsNMUKtM8FNsuL53Mqy2W+BD9Rc=;
	b=Bm+7zGLeRj92AtFKDrEBq8rgcKk/C9pH6ueBqgDnhF8GTyuCOKiym5+YbjqxBEDI+qY/Rk
	orM0pD5+CYgqYPbrDSTDwjlnupAIqZECzNzHcx3nSLPm0bHABkZU7S1bkVMz8zl9AJWDOd
	rmTxoSONo5LtNm0fBIzRN4Ms7RwFnjY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-zTuq4Q_vNqKIp2cASTUIDw-1; Fri, 21 Apr 2023 00:09:34 -0400
X-MC-Unique: zTuq4Q_vNqKIp2cASTUIDw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-5ef81bca65aso21080776d6.2
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 21:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682050173; x=1684642173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLbGYm0H2CK1LiFwWsNMUKtM8FNsuL53Mqy2W+BD9Rc=;
        b=NMeKhz6USC9kvnhyeAFvo+HQMevUCtPdvVEqpkF9oyq9amuWTU9UvE+HEecW9W5Rax
         M4LOpfbzUIkjgFRbddwEoc3y8dvt/wj8U42Q5wz7FD5yRfwK6nS+s2/0IunHnfR1lkO1
         GsiynmVSszlRuBaYUOjZtjS+YDEXP1+1C2f7DAkpd9gHPdA/W7KdgJt85v6HwHpmnGqy
         YqVde3cAIkVD2vIMIaXPMKJBU3CKLDrti4OEFAL7CaWd5Q25QhEf7kterf7OxCF+1BRg
         qLQRafUZMq487V1WlQYF1xBwP0DjjVT3D+PQh/4rUvVqoEw4Ip1itso0WFyGBxOaoAer
         8daA==
X-Gm-Message-State: AAQBX9eKIhcLODzVZpAw6ZSK6nz9uiEXp9wMFlk29DTRZSIl2xeU6AqT
	PMUzUlTLU3O6yyt65/XvegYxnuzuA7AGgbVvFgWehtImYmW0pddNCDZa8p0ZphrKdD/5hwSfQW1
	k/lxV89yve0cL+2wO
X-Received: by 2002:a05:6214:cae:b0:5a2:abf1:7d33 with SMTP id s14-20020a0562140cae00b005a2abf17d33mr5883703qvs.50.1682050173720;
        Thu, 20 Apr 2023 21:09:33 -0700 (PDT)
X-Received: by 2002:a05:6214:cae:b0:5a2:abf1:7d33 with SMTP id s14-20020a0562140cae00b005a2abf17d33mr5883672qvs.50.1682050173427;
        Thu, 20 Apr 2023 21:09:33 -0700 (PDT)
Return-Path: <crosa@redhat.com>
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5? ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
        by smtp.gmail.com with ESMTPSA id dz16-20020a05620a2b9000b0074df16f36f1sm983103qkb.108.2023.04.20.21.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 21:09:32 -0700 (PDT)
Message-ID: <9a0a7b21-8798-d5d3-bf4b-f1de38e82581@redhat.com>
Date: Fri, 21 Apr 2023 00:09:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jan Richter <jarichte@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
 <87pm82e74d.fsf@linaro.org> <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
 <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BVx8kGbBYP0k


On 4/20/23 12:54, John Snow wrote:
>
>
> On Thu, Apr 20, 2023, 5:19 AM Philippe Mathieu-Daudé 
> <philmd@linaro.org> wrote:
>
>     On 17/4/23 19:44, Alex Bennée wrote:
>     >
>     > John Snow <jsnow@redhat.com> writes:
>     >
>     >> On Mon, Apr 17, 2023 at 9:43 AM Alex Bennée
>     <alex.bennee@linaro.org> wrote:
>     >>>
>     >>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>     >>>
>     >>> Avocado version 101.0 has a fix to re-compute the checksum
>     >>> of an asset file if the algorithm used in the *-CHECKSUM
>     >>> file isn't the same as the one being passed to it by the
>     >>> avocado user (i.e. the avocado_qemu python module).
>     >>> In the earlier avocado versions this fix wasn't there due
>     >>> to which if the checksum wouldn't match the earlier
>     >>> checksum (calculated by a different algorithm), the avocado
>     >>> code would start downloading a fresh image from the internet
>     >>> URL thus making the test-cases take longer to execute.
>     >>>
>     >>> Bump up the avocado-framework version to 101.0.
>     >>>
>     >>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>     >>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>     >>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>     >>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>     >>>
>     >>> ---
>     >>> v2
>     >>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>     >>> ---
>     >>>   tests/Makefile.include | 18 +++++++++++-------
>     >>>   tests/requirements.txt |  2 +-
>     >>>   2 files changed, 12 insertions(+), 8 deletions(-)
>     >>>
>     >>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>     >>> index 9422ddaece..a4de0ad5a2 100644
>     >>> --- a/tests/Makefile.include
>     >>> +++ b/tests/Makefile.include
>     >>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>     >>>   # download all vm images, according to defined targets
>     >>>   get-vm-images: check-venv $(patsubst
>     %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>     >>>
>     >>> +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter
>     -j%,$(MAKEFLAGS))))
>     >>> +
>     >>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>     >>> -       $(call quiet-command, \
>     >>> -            $(TESTS_PYTHON) -m avocado \
>     >>> -            --show=$(AVOCADO_SHOW) run
>     --job-results-dir=$(TESTS_RESULTS_DIR) \
>     >>> -            $(if $(AVOCADO_TAGS),,
>     --filter-by-tags-include-empty \
>     >>> -  --filter-by-tags-include-empty-key) \
>     >>> -            $(AVOCADO_CMDLINE_TAGS) \
>     >>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>     >>> +       $(call quiet-command,                                    \
>     >>> +            $(TESTS_PYTHON) -m avocado                      
>                          \
>     >>> +            --show=$(AVOCADO_SHOW) run
>     --job-results-dir=$(TESTS_RESULTS_DIR)  \
>     >>> +            $(if $(AVOCADO_TAGS),,                          
>              \
>     >>> +  --filter-by-tags-include-empty                          \
>     >>> +  --filter-by-tags-include-empty-key)                     \
>     >>> +               --max-parallel-tasks $(JOBS_OPTION:-j%=%)     
>                      \
>     >>> +            $(AVOCADO_CMDLINE_TAGS)                          
>             \
>     >>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), 
>                      \
>     >>>               "AVOCADO", "tests/avocado")
>     >>>
>     >>>   check-acceptance-deprecated-warning:
>     >>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>     >>> index 0ba561b6bd..a6f73da681 100644
>     >>> --- a/tests/requirements.txt
>     >>> +++ b/tests/requirements.txt
>     >>> @@ -2,5 +2,5 @@
>     >>>   # in the tests/venv Python virtual environment. For more info,
>     >>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>     >>>   # Note that qemu.git/python/ is always implicitly installed.
>     >>> -avocado-framework==88.1
>     >>> +avocado-framework==101.0
>     >>>   pycdlib==1.11.0
>     >>> --
>     >>> 2.39.2
>     >>>
>     >>
>     >> I thought there were test failures that prohibited us from
>     bumping the
>     >> Avocado-Framework version. Did those get rectified recently?
>
>     No, still not working on Darwin. At this point I'm thinking at sending
>     a patch clarifying testing QEMU with Avocado is not supported on
>     Darwin.
>
>
> What's broken on Darwin?
>
Hi John,

IIRC, the main issue is that the legacy runner (the one active in 88.1) 
pickles some stuff that do not play nice under Darwin.  It has never (to 
the best of my knowledge) worked under Darwin.

> Is it broken with avocado-framework==88.1 too? (Is this a regression?)
>
It was already broken with avocado-framework==88.1, but it should mostly 
work with 101.0 (see previous reply).

> We might need to consider entirely separate issues:
>
> (1) We need to upgrade avocado-framework to a supported LTS version >= 
> v90 for dependency harmony with qemu.git/python testing
>
> (2) We need to upgrade avocado-framework to >= v101.0 to fix the 
> stated checksum issue in this patch
>
> (3) We would like avocado tests to work on Darwin. (Have they ever 
> worked? When did they break? etc.)
>
> My understanding is that this patch helps with 1 and 2 but not 3, but 
> if Darwin support isn't a regression, this is still a step forward.
>
To the best of my knowledge, this patch would help with 1, 2 and even 3.

Cheers,

- Cleber.

>
>     > I'm not seeing any with your patch applied.
>
>     Are you using running the Cirrus-CI jobs?
>
