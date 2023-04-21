Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp877089ejm;
        Thu, 20 Apr 2023 20:50:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350YksL0Ys14fnm2Sjj5G2KCSBMcdN1D8u0cFOiGmwoyPo2K1UeA9juKLT4RSjvemCee8Xuug
X-Received: by 2002:a05:6214:e6b:b0:5ef:45a7:a3c6 with SMTP id jz11-20020a0562140e6b00b005ef45a7a3c6mr5890674qvb.26.1682049003618;
        Thu, 20 Apr 2023 20:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682049003; cv=none;
        d=google.com; s=arc-20160816;
        b=k+gYrDBnPbuLiaoIAD+45sJilydUS3fNDJCRmO3kkBlmenD6UdO8lqKLsXNeXo7pzB
         N8R02RhJfEvt6WNpPhLRub7aErtcbJZ0FKSzK08J5wkTzSP5RPxkw+KPXGbqUojneh5m
         0uWRLpGPyebAysAPf/jzI/V6m5nhBSIeY+jBoiwE7eOL3d7o9j7infSTEyuxV4q2VZWt
         9ICm0jYFWoU3trMcmH9eO0cyvH5f/nrfM7pdTvouJDoPOUs2VHWrmR3vWKCBUvu4dS8S
         9pI/Ejd/wgkxSWe8fsVfJFJX4rs9Og4LpsvC1QCKS+i24DDbOGIJ1d4vMkyGTEY8vnzq
         Xjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6OLeGyBZAJYP/ReCsjoFBsGEm2axluUmkFazXbl6C8g=;
        b=E8N2oy/+F6kzqDclfm6abJ3uWdXcHa44WzlXa90Cevh42my8c2WMDow7meb03jqmVb
         BzJqSk/MWskPpJeG06mmzGB4+cq/1HKdBFbndlzrLe+NY5aeIadxLoRCtk1oBd8Rb5e/
         ScH4coMkIUlbqNaCsOMqpXL88Cy08+YkTdKrKTy4Oi+MFRTu42sG76bAkXGsPFnAxxpK
         WsmfQBceIpihK0WkI+D4vSXi1utXk15FOzs33YKioYPJCyZ1nGDcMOrT4xkGeWMqSmdn
         v0fFA+iW4oAdzDXWMdZ4DLbn2FEs+EsHPJ8Icar89RxXq2Moy7Uk33T/fgoCr/tbpxPE
         ndAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pul71zSS;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 10-20020ad45baa000000b0056eb1aa8734si2311387qvq.405.2023.04.20.20.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 20:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pul71zSS;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682049003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6OLeGyBZAJYP/ReCsjoFBsGEm2axluUmkFazXbl6C8g=;
	b=Pul71zSSOxVkFvNNV/a3rlqQ0j5UXbx9OgqTt33bHSmKzn22cHppI1RaEb5DIMZ0NkjNFz
	M1mquZRBAI/b9UCsWWHy2BLrvyr9n6gyk7/mjD7ehXpKZMxLiyLgAUuEokfN0WQFIH8s4+
	C5Uzu0/Fql+3DwGkv2wUaZHWaWI8+ZQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-_b8vdzknMPWqNvja-oCyvA-1; Thu, 20 Apr 2023 23:50:02 -0400
X-MC-Unique: _b8vdzknMPWqNvja-oCyvA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3e7182d5544so9495781cf.1
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 20:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682049001; x=1684641001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OLeGyBZAJYP/ReCsjoFBsGEm2axluUmkFazXbl6C8g=;
        b=Y86HZL56ueiDd6Xd1TRsQjsXrvVKV590eCs7oqJts3WrvU8Z1FYEj9MyDGULpcAKMf
         i1WOCWQa5qsYgqREJhKOg8wEY91ZGAAyr/6bMdqDVfkntmRnkLXJtsoIlzR3/H9Lv/vE
         G/hjJEfYYFcyVJrjtBogf5gq6mg1H0/vaoOoLEE5EiYFtAlk39H7fFeLMks5I3+EgU4n
         LlnpdRaACKc/N7vgvG32gafgLnBiTUDm4w3YuyZDiTw1UmlYqz8RCfThH6LeIVJTLU49
         znUXms/4NUkYHk6Fro6Of3a6f4Yypwg0yeqeW8+lAp+OgSe9GfzedLKGLNsaigSX4vpt
         WOJQ==
X-Gm-Message-State: AAQBX9fb7FwCpkgi6C3gsKTH4hbE2gl+9ap9qunvwKAUmPXzEtvbmpIt
	mKlB8U82vGzr9PRbSLEfp36I380qCnEstpWyX9pVL33+de8oZ0BaJuhMAmN2NnYMxdFN1bDhPxA
	hQQVX33NSlbJ0WvMW2BHMa+O/7hkcDmouXeon3RnlOaiVfMVElB6UzwPE3d/8OCQ3sxISFKpGdY
	E=
X-Received: by 2002:ac8:5f92:0:b0:3b9:bf83:d5de with SMTP id j18-20020ac85f92000000b003b9bf83d5demr6067287qta.26.1682049001348;
        Thu, 20 Apr 2023 20:50:01 -0700 (PDT)
X-Received: by 2002:ac8:5f92:0:b0:3b9:bf83:d5de with SMTP id j18-20020ac85f92000000b003b9bf83d5demr6067251qta.26.1682049000957;
        Thu, 20 Apr 2023 20:50:00 -0700 (PDT)
Return-Path: <crosa@redhat.com>
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5? ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
        by smtp.gmail.com with ESMTPSA id b2-20020ac812c2000000b003e8160cf93asm995629qtj.80.2023.04.20.20.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 20:50:00 -0700 (PDT)
Message-ID: <e9d0f20a-4ca8-7622-0171-2cb56b75821b@redhat.com>
Date: Thu, 20 Apr 2023 23:49:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
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
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <20230417134321.3627231-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ma3VPc47fzUS


On 4/17/23 09:43, Alex Bennée wrote:
> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>
> Avocado version 101.0 has a fix to re-compute the checksum
> of an asset file if the algorithm used in the *-CHECKSUM
> file isn't the same as the one being passed to it by the
> avocado user (i.e. the avocado_qemu python module).
> In the earlier avocado versions this fix wasn't there due
> to which if the checksum wouldn't match the earlier
> checksum (calculated by a different algorithm), the avocado
> code would start downloading a fresh image from the internet
> URL thus making the test-cases take longer to execute.
>
> Bump up the avocado-framework version to 101.0.
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>
> ---
> v2
>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
> ---
>   tests/Makefile.include | 18 +++++++++++-------
>   tests/requirements.txt |  2 +-
>   2 files changed, 12 insertions(+), 8 deletions(-)

Hi everyone,

Looks like I've mistakenly replied to the earlier thread, so here's 
pretty much the same message on a better location.

First of all, thanks to Kautuk for sending this and thanks to Hariharan 
for further testing it.

I'd like to give some context which not everyone may be aware of. 
Avocado 101.0 is a very different when compared with 88.1. Everything 
related to the execution of tests is brand new.  To be more precise, on 
version 91.0[1], this new runner[2] became the default. On version 97.0, 
the old runner implementation (currently in use in QEMU) was finally 
removed.

On most releases since then, I've been running the QEMU tests with the 
latest Avocado, and finding issues that are (as resources allow) 
addressed in later versions.   As you probably noticed, Avocado 101.0 
runs the QEMU tests without much (or any) visible issues for most 
people.  But, I'm aware of two pending issues that may or may not be a 
big deal to users:

I) The logging behavior is a bit different since Avocado 88.1. At a 
given point it was considered that Avocado should not mess around 
inadvertently with Python's root logger, and should be more picky about 
it includes in logs.  For most cases, a simple workaround[4] does the 
trick.  But, for some other use cases (say for 3rd party libraries' logs 
you want logged alongside Avocado's logs) there's a pending PR[5] that 
will take care of all known limitations.

II) The support for killing tests (internally in Avocado represented as 
more generic "tasks") and all its children is a bit lacking.  This is an 
issue I'm actively working on[6].  This may leave some processes (such 
as "qemu-system-*") running even after a test was interrupted.

Fixes for both of these issues are due to be in version 102.0. The ETA 
for version 102.0 is 1-2 weeks.

With that being said, I'm more than OK with this patch (alongside PATCH 
2, without which havoc ensues :) provided people understand the two 
pending issues above.  If this patch is taken before Avocado 102.0 is 
released, the delta from 101.0 would be much smaller, so it should be an 
easier change to test.

Cheers,

- Cleber.


[1] - https://avocado-framework.readthedocs.io/en/101.0/releases/91_0.html

[2] - The new runner is called "nrunner" and I am to be blamed for the 
naming lacking any originality

[3] - 
https://avocado-framework.readthedocs.io/en/101.0/releases/97_0.html#users-test-writers

[4] - 
https://gitlab.com/cleber.gnu/qemu/-/commit/a9f39c4f6671b756196a185c7275eb7ebd13e588

[5] - https://github.com/avocado-framework/avocado/pull/5645

[6] - https://github.com/avocado-framework/avocado/issues/4994

