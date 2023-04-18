Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2326155ejm;
        Tue, 18 Apr 2023 00:11:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350bd0/BcPN97MPN/3B+uIl6WLYtCrjt84CF8g8f8gC1LFG/pPiqh8KCF/cmhoWoZNU47l7u8
X-Received: by 2002:ac8:7d8f:0:b0:3e4:e08e:6807 with SMTP id c15-20020ac87d8f000000b003e4e08e6807mr25053003qtd.30.1681801915086;
        Tue, 18 Apr 2023 00:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681801915; cv=none;
        d=google.com; s=arc-20160816;
        b=kZ5qv+NWASGF28GMfizLGHgGG6PjVWiMy0yD73B4BsKQOet5SMdH2XqzWeTr+WSJ3A
         Uci12Ng7JRCytUDUg/5qaonVI9HL881OpPA2DCstd0DV3i4FnYQH7arAoI3b3Y8H0Yku
         h9WvhVdLLjSC9rTYaDPmFAafIR8wFG7MNkyvw249vcIRep0tQPAHEpbHUHSOeTg3KAEK
         8nqw/D0UZ+fIHDEBzx58sNUl6nwjFxdJrFd8caREJBoQBdxUeGIMpw/Uq4oqHbkivWA0
         WVSEFEwilmxije5Xc9NHm6oPSYJJ6zHsHRbEy0ABQEBuMLe8/mcdKEkcI22Zn+aZQXXy
         tm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=S1GpnM616yx4lGRhZQg2um50odqu2LVJAKgisLf2pIA=;
        b=BIRhi4X8mWJm6Bx5nkW9+aeFWZE5wtd3j9HnHv2oa/3wx9QchGkwtA5fMiELvSbpta
         4udMyZizfRPBU2gy6C2mC9q3Q9MY25J2ozv4shtE5NgzSn5k+etzenMHIPPyKBMDmmp1
         zyTraHxxqcZlVklmFGt+ggZzHgw9PFUvAj6PUlPPYF6OfAnWi4AJcOx30drow2HBB1kT
         uvoplRctka8DTox5esm4VXkIRiAZjZI41h6mnvEHdz5rDGba+h7wqG8UsNAdTCRvkEiC
         sejLUV5NsjSU+ItBq2AuIGGqrpntIwTRitU0oCkqyBvf0PTBFiopw5Oopeve1pAW4+N/
         EVKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D4tv/r+1";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ay35-20020a05620a17a300b0074e0951b8f1si83583qkb.303.2023.04.18.00.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 00:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D4tv/r+1";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681801914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1GpnM616yx4lGRhZQg2um50odqu2LVJAKgisLf2pIA=;
	b=D4tv/r+1PQOCISqLGmuG9Hfqgoi2o7NHPYqylo1CLlQFZ0FyFqL7D5y0Orwq6ypwuXuGd6
	3ALxHSvhjkNbFI97qFjM50Y3NVM0oTRSs7HHTzOcfjYameoZ4+fBCF0st8MBNjHaQvKjrM
	M0BLfcPM4fBfLo0oyhcJepY0c+GhEXc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-DL0PBZ4GN3-q14n_bWxDLA-1; Tue, 18 Apr 2023 03:10:18 -0400
X-MC-Unique: DL0PBZ4GN3-q14n_bWxDLA-1
Received: by mail-wm1-f71.google.com with SMTP id k39-20020a05600c1ca700b003f17b10763aso116676wms.2
        for <alex.bennee@linaro.org>; Tue, 18 Apr 2023 00:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681801817; x=1684393817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1GpnM616yx4lGRhZQg2um50odqu2LVJAKgisLf2pIA=;
        b=Idp620gKnSIXNNTkg9pCYt2vOyCZXOnYjKnKOE9MpXgib7YKtbUxgepDX/ph6ugroF
         3xlbGDWH8I359QEsd9x31G8OADmz7DLLsCPTgF0D+L9xPYpZAaXl97y7kP1iA8cyoI8t
         ui7Fh49FPmhIJQ6EzXrKFfcLFiCWX5nyYlyftKfi75E7lU0zKmYRVJd1VfYMHNEpmSkF
         WRal5BqG2lJ1nnWDOqEyWxUdTw/212c11PnBbl1zhJX1mjZW8c/kaVtec6Fo4uYtibbW
         CJg0/BeS4eodDIOaL5mqSMMx+K0HIBHQ9LXP+nYOM0sw504etbzES7RBy9mE6XRSPRpD
         rJxQ==
X-Gm-Message-State: AAQBX9cylbJnONdhCxgi64AVW3DzshYBRv/Wp4mTHmdzQx3bxZAG0+OP
	gzC6LGWDr26jQeXBCLALYE2cVLvIjG6oft8xFFX38g6qy9714lhAb8Fk24cKPuK16cu0RJjj3k+
	zNddmuYhnp0rm4vS2j4CMZkeBBb3T85+c3e7K717lr8psT3dtsGBuv/2oNBU2V+guOTlMwtoZ
X-Received: by 2002:a05:600c:22c4:b0:3ed:88f5:160a with SMTP id 4-20020a05600c22c400b003ed88f5160amr12990501wmg.11.1681801817026;
        Tue, 18 Apr 2023 00:10:17 -0700 (PDT)
X-Received: by 2002:a05:600c:22c4:b0:3ed:88f5:160a with SMTP id 4-20020a05600c22c400b003ed88f5160amr12990457wmg.11.1681801816551;
        Tue, 18 Apr 2023 00:10:16 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de. [109.43.176.59])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c3b8600b003f173a2b2f6sm4942331wms.12.2023.04.18.00.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 00:10:15 -0700 (PDT)
Message-ID: <2a2124d2-5fcf-cfd2-4f68-c3f602f2824e@redhat.com>
Date: Tue, 18 Apr 2023 09:10:14 +0200
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
X-TUID: FS/fGyMLx8s7

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

We might need to revisit this --failfast logic, too. If I've got that right, 
failfast is now the default with the new system? So we might want to disable 
it by default again if GITLAB_CI is not set?

  Thomas
