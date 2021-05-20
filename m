Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp498848lfm;
        Thu, 20 May 2021 13:28:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybWaDyVOV9OXew3nP6Yb/iPO4yT3qxg3iA0ecXeNvCcYjdn3u01iis/YBVk53JTRTCO5wV
X-Received: by 2002:a17:907:16a5:: with SMTP id hc37mr6772477ejc.166.1621542524385;
        Thu, 20 May 2021 13:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621542524; cv=none;
        d=google.com; s=arc-20160816;
        b=xmd+PvxcJbbnk0F/dby+RmbVrJYEUfJIYL7qjLOb7cyz++Lwt7MebkBVXhe/hknLND
         rwqDbsX/duIdN8yJdDSv2cuiuf+hfvHIsZyBU/65hzsfKH1jWNrPShJxO8pCQc11sqcx
         BHvGyWVIyvzZwVlZGJUXhIg/6zJlgsmCyS+FMvbNp7t55ZtmibA4O6GdVdJ23+rpBeU0
         2QrQ1oCR62/L5S33QV6rKPCXAv8NTN4OQ4IRzOr+CgPx/pnGkTqIlULL1UlGmKCGPhTZ
         O8hDAXFsM0ZW0j6ENJOsTrvsZgn4XsDS/hck34omLHi1z58wR1fOwoh7FUzg9bd9llgN
         uS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DVyZCWHx/zyYX2R3PytFoCon6gMd6iSU+XA8VeSG3Nc=;
        b=YsJ8L/sYVjL4XEY4DB3m+uYP3egRMioGxYJ3MEz7gdb50cwOX03XQEM8lrOF/ar6L/
         1HN5WIc8E2QIf2dTllmuQ4UgvqwOU7LZG4wL/yglrveVRB1rvaWEI/fs6mjFIK9ziK80
         OEV15M7KHTHyl3uZeRN8TTjraeTAgCIXXZy56dJCNKv/o9fm4dJgfZYQoHG672eTcbpo
         DOW+X9eet8ta2uRzJdtIJdzKXbWA8B7SnPFXZY/k6YKaBgYnf13lzubncuKPwoHPl1p4
         vR/9RRpkNQLaoQwACCJGXO9mu4AIQXObVMAM/JnZXGKxiPPMAwdPpqagMXtlb/qNWfLG
         2ojQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ihUstzyc;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id i11si2884507edk.574.2021.05.20.13.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 13:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ihUstzyc;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621542523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVyZCWHx/zyYX2R3PytFoCon6gMd6iSU+XA8VeSG3Nc=;
	b=ihUstzyc1dX07WlwXCbyotqhndrDa5xOOe2h2UrExsNhH4AeZZX4YFM+5QJuf4vas7LHk1
	xsBKaCqcJk5OYrUMesJhWB59uRApggTTpS9Su3KvYGeyfBOTckkN79Ju6Sb3qMsaYqDonv
	52Om7wSyPstzdx9pgCCu7ENyS/oT6cA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-V9kIJR_RNvSiE052uK835Q-1; Thu, 20 May 2021 16:28:36 -0400
X-MC-Unique: V9kIJR_RNvSiE052uK835Q-1
Received: by mail-ed1-f71.google.com with SMTP id n6-20020a0564020606b029038cdc241890so10072960edv.20
        for <alex.bennee@linaro.org>; Thu, 20 May 2021 13:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DVyZCWHx/zyYX2R3PytFoCon6gMd6iSU+XA8VeSG3Nc=;
        b=ERij2mx6/k7hfZm8pIIaPs/LUs19mLLDlNi/+MD02e7W1yy3Ikd7Alk5Ee+5qYILJF
         vZ8DV/6VW/y6/TpraFgr8Zu770I8mUZSa0CrmJJxavmVkQza2lZ+HqeIm2Ph6uyVuFOz
         +qr/zHk0pYB8brd3nvNR1PXBYb39P6+DTqDlpz++S0RDoWsYRqNMlPTOw07XAKItktuV
         Waa1lFsXPPDDWxB/NaNv3cSpnrgzBo0KH1Z500EPPXSU9OeJIpGEfMeV4OE4Y5cAu71P
         wj8iI+O0cmC6vFx2c+Roh4TnPz4J0XHxmQX21m07NE6XhRw6ekjYXKCYiTNzSUd05eQN
         3/Ng==
X-Gm-Message-State: AOAM532JH2d8/sfQdBFFhqSx834OXhI83tTPPSBYLfHOrFuiL8uLd5Y1
	S834edJFfNzfxHwYvO4ZM4QRBo4WMxvkI2GYC4df12soVim/1z+0e0BqJdcKl7fl5GsyBrBQBGG
	FLsFhfyI95Um73ho/nT3cXvjenzkUjJ3kyhW7ugJ8xGKveqO+iyQJQR46Hh7DVIEn3A==
X-Received: by 2002:aa7:dc4a:: with SMTP id g10mr6962275edu.316.1621542515115;
        Thu, 20 May 2021 13:28:35 -0700 (PDT)
X-Received: by 2002:aa7:dc4a:: with SMTP id g10mr6962250edu.316.1621542514779;
        Thu, 20 May 2021 13:28:34 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net. [83.51.215.31])
        by smtp.gmail.com with ESMTPSA id d25sm1995581ejd.59.2021.05.20.13.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 13:28:34 -0700 (PDT)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
Date: Thu, 20 May 2021 22:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520195322.205691-2-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +wG1g0ALwGPa

On 5/20/21 9:53 PM, Willian Rampazzo wrote:
> Conceptually speaking, acceptance tests "are a series of specific tests
> conducted by the customer in an attempt to uncover product errors before
> accepting the software from the developer. Conducted by the end-user rather
> than software engineers, acceptance testing can range from an informal
> “test drive” to a planned and systematically executed series of scripted
> tests" [1]. Every time Pressman refers to the term "acceptance testing," he
> also refers to user's agreement in the final state of an implemented feature.
> Today, QEMU is not implementing user acceptance tests as described by Pressman.
> 
> There are other three possible terms we could use to describe what is currently
> QEMU "acceptance" tests:
> 
>   1 - Integration tests:
>       - "Integration testing is a systematic technique for constructing the
>          software architecture while at the same time conducting tests to
>          uncover errors associated with interfacing. The objective is to take
>          unit-tested components and build a program structure that has been
>          dictated by design." [2]
>       * Note: Sommerville does not have a clear definition of integration
>         testing. He refers to incremental integration of components inside
>         the system testing (see [3]).
> 
>   2 - Validation tests:
>       - "Validation testing begins at the culmination of integration testing,
>          when individual components have been exercised, the software is
>          completely assembled as a package, and interfacing errors have been
>          uncovered and corrected. At the validation or system level, the
>          distinction between different software categories disappears. Testing
>          focuses on user-visible actions and user-recognizable output from the
>          system." [4]
>       - "where you expect the system to perform correctly using a set of test
>          cases that reflect the system’s expected use." [5]
>       * Note: the definition of "validation testing" from Sommerville reflects
>         the same definition found around the Internet, as one of the processes
>         inside the "Verification & Validation (V&V)." In this concept,
>         validation testing is a high-level definition that covers unit testing,
>         functional testing, integration testing, system testing, and acceptance
>         testing.
> 
>   3 - System tests:
>       - "verifies that all elements mesh properly and that overall system
>          function and performance is achieved." [6]
>       - "involves integrating components to create a version of the system and
>          then testing the integrated system. System testing checks that
>          components are compatible, interact correctly, and transfer the right
>          data at the right time across their interfaces." [7]
> 
> The tests implemented inside the QEMU "acceptance" directory depend on the
> software completely assembled and, sometimes, on other elements, like operating
> system images. In this case, the proposal here is to rename the current
> "acceptance" directory to "system."

Are user-mode tests using Avocado also system tests?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html

> [1] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
>     Practitioner’s Approach. p. 430.
> [2] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
>     Practitioner’s Approach. Software Engineering, p. 398.
> [3] Sommerville, Ian (2016). Software Engineering. p. 240-242.
> [4] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
>     Practitioner’s Approach. Software Engineering, p. 407.
> [5] Sommerville, Ian (2016). Software Engineering. p. 227.
> [6] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
>     Practitioner’s Approach. Software Engineering, p. 377.
> [7] Sommerville, Ian (2016). Software Engineering. p. 240.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa7..c5de3c9fd5 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -52,7 +52,7 @@ include:
>      # Avoid recompiling by hiding ninja with NINJA=":"
>      - make NINJA=":" $MAKE_CHECK_ARGS
>  
> -.acceptance_template: &acceptance_definition
> +.system_template: &system_definition

.system_test_template: &system_test_definition ?

> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8f220e15d1..c580292bb5 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
>  	@echo " $(MAKE) check-tcg            Run TCG tests"
>  	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
>  endif
> -	@echo " $(MAKE) check-acceptance     Run all acceptance (functional) tests"
> +	@echo " $(MAKE) check-system         Run all system tests"
