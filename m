Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp946104ejm;
        Thu, 20 Apr 2023 23:24:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350bohjzmCTCzHWVpThCR951rFcmM2T7+IgGK7qxqLixDDsg+zuawQu8tfMkJMn0RUOa2W/e+
X-Received: by 2002:ac8:598a:0:b0:3e6:3929:e9bc with SMTP id e10-20020ac8598a000000b003e63929e9bcmr7110533qte.6.1682058255514;
        Thu, 20 Apr 2023 23:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682058255; cv=none;
        d=google.com; s=arc-20160816;
        b=JRj5UOn5D58F7+/6P+0jzrfY8ZBryS6CP1/Ace5WL8rEWz18C06yj1PeuEYD1Y0iQc
         5XipNI7IX0MnEmtDO53E88suDykM+3sE10WacUi2nFqBGf2ZNyFqD33q9qAMiexArzOg
         C/k8/Dy23rxEhK6Kh0ZUykoyO1oNa4/UGf+YN7DPrVa9YXAXfOA4TnhcuP7qmIB98eor
         okrEO3i+kcUKokepP2glenxOKncEbpl5LO5+ImdStkAgpqJPFADQeEw2binpCyU9kN4K
         dRG5oCOt++PPnoCFV0T/ScwAlNS6MmOIzp2lj/GEJm997JdQCm7+m8cAnrPDpd1Jugf2
         wrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OkgaPyJpN8gdRqhrI5pRo7nJc6v2E2P70vuPYgvrJ3I=;
        b=YOdBC4Eq/ppj+wXYK10Vg7E3JJDKlFNU9X75DzqyWgGqhGzO+cfxf/6DpnfKWTV06O
         08HtZrhyVtW+tvgMIGK1qdDsERL6HkvBHo/Zwie8Y13WFjnH3HM0b0WsXFrUjoe9B6nT
         W5SqBr4122q/yLC626ECActN9GCEknwKZpRGDr8EZWuxXHlubHrNbB3asixH46cnfrc+
         KZ/VPDMdRKXbGCZtLhfSdC7xgPvhopavbxLdF99mL6mMRIWMPXz20rymvMEB36nOjTaq
         Bhtv7Q5V/Dl2rf8wRReOVMOF+LTCGh6KC5SP3DLQJX1FH6zOiIXxIGErtZy7NQxocdqt
         3F2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZktUHcYv;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t64-20020a374643000000b0074df4277968si2412245qka.164.2023.04.20.23.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 23:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZktUHcYv;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682058255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkgaPyJpN8gdRqhrI5pRo7nJc6v2E2P70vuPYgvrJ3I=;
	b=ZktUHcYvkEnLCfL9FUSiXCPy3KVu+GjpomQv8xZYDLSVpXS6Yhg/CTp6AgcxQ3Y0hLFf7e
	9Zq6NpQTWTWyDdB1aXIVqopDqnz5j4FVGTobRGM+OZ7sP1I0xH2Kk277XNCZqL/4dlHCTK
	PnAffO8zV75rbDJlUKArxYwuwSMUOlQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-ZBx6CZpAOLa90ySsG-vV_g-1; Fri, 21 Apr 2023 02:24:13 -0400
X-MC-Unique: ZBx6CZpAOLa90ySsG-vV_g-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5069f2ae8eeso6183488a12.0
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 23:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682058252; x=1684650252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkgaPyJpN8gdRqhrI5pRo7nJc6v2E2P70vuPYgvrJ3I=;
        b=IGuFAF+f6sKkFA3mSxft06BQK+81q8iTSWPav1CUaLvr4DvnLDZ95/40hNZY+rlnIV
         C8FXR7+jNvxpeSKhYuDEWWTIGtm7/m1qEHhrtbLq2NKZLD0Ar/hIIPEME+DNf3zVrDw4
         LuCz5ChIHRkFRmF2pt+084oqW9cY2TRK7c8pkdFbWuJmFPOP9EQcMPVjUn8cEzlJqEWI
         rx5Qwr7Q88zfbjxuH/r8RWW4u/4hEErYf0mI8DMkGT472R9VxK4yCPGxaDo/W9CinOO0
         uA0rSbwarsHD85lpf5lLfdTCSPebpXM1vnMdX1HISZmGDAzlWBarb30vBwdh5vsLWgIZ
         EwhA==
X-Gm-Message-State: AAQBX9cqK/DuX9cMA2yZ6+D8ISg56PdZX6Vukl3Mx2gD4hTG+Bl3K0P3
	tJYLAGd8wxi6xuytwIleTaQyiKGNPRKB5oACopGDhb123eguMkBkVA+wncneYTA/uE6H/PKEKBk
	rCP8BkgmXeaA1ylGaSXsy2WhjBnHyVzfgT3qRACEedN0yx03LJ44dge4yRnj/xJESY4uSCzUK
X-Received: by 2002:a17:907:7851:b0:94e:f9ad:5775 with SMTP id lb17-20020a170907785100b0094ef9ad5775mr1392182ejc.12.1682058252095;
        Thu, 20 Apr 2023 23:24:12 -0700 (PDT)
X-Received: by 2002:a17:907:7851:b0:94e:f9ad:5775 with SMTP id lb17-20020a170907785100b0094ef9ad5775mr1392149ejc.12.1682058251704;
        Thu, 20 Apr 2023 23:24:11 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de. [109.43.178.20])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906058f00b0095708428cdcsm720924ejn.6.2023.04.20.23.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 23:24:11 -0700 (PDT)
Message-ID: <8724e7f9-92f9-cc38-cd37-be416286b65c@redhat.com>
Date: Fri, 21 Apr 2023 08:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230417134321.3627231-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: r7t9ucv9LaQt

On 17/04/2023 15.43, Alex Bennée wrote:
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
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 9422ddaece..a4de0ad5a2 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>   # download all vm images, according to defined targets
>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>   
> +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
> +
>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> -	$(call quiet-command, \
> -            $(TESTS_PYTHON) -m avocado \
> -            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
> -			--filter-by-tags-include-empty-key) \
> -            $(AVOCADO_CMDLINE_TAGS) \
> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
> +	$(call quiet-command, 							\
> +            $(TESTS_PYTHON) -m avocado 						\
> +            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) 	\
> +            $(if $(AVOCADO_TAGS),, 						\
> +			--filter-by-tags-include-empty 				\
> +			--filter-by-tags-include-empty-key) 			\
> +		--max-parallel-tasks $(JOBS_OPTION:-j%=%) 			\
> +            $(AVOCADO_CMDLINE_TAGS) 						\
> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), 			\
>               "AVOCADO", "tests/avocado")
>   
>   check-acceptance-deprecated-warning:
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 0ba561b6bd..a6f73da681 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -2,5 +2,5 @@
>   # in the tests/venv Python virtual environment. For more info,
>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>   # Note that qemu.git/python/ is always implicitly installed.
> -avocado-framework==88.1
> +avocado-framework==101.0
>   pycdlib==1.11.0

Reviewed-by: Thomas Huth <thuth@redhat.com>
