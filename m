Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp5611483lfv;
        Mon, 8 Nov 2021 00:01:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu8+AaKEHd1VnSNqQAHGLUK6RlLjlbVTX4HPZkxJzRNWCm3rM4ORHTiJ/P3FzCqkeWZTMR
X-Received: by 2002:a05:6102:5113:: with SMTP id bm19mr10813024vsb.31.1636358466144;
        Mon, 08 Nov 2021 00:01:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636358466; cv=none;
        d=google.com; s=arc-20160816;
        b=gyajNacbX6Hdo2vXHRYmWEDwCn3pk3zkn+xZjTAOgl2PNgKFLKawDfS+a56u12WPSh
         LZHe9775OywFtdASt8Neo1XmuT6GSYJ3kEAmjTK5x5dAxS5XNVN1cpHXHkyumY5BRUr1
         tmCE1Na1puuABlWFULyPnCQYLlVWsIA2S5ufFuIktQc1kN78eCvX1sJauhNqzvJAp+Og
         Y4OO1swHOJxJy0iyg8ysvAhI1+8Si4zBH0WavSahyStjz+MmphrudbOzQkd4y0We7piv
         /Qz4EBASD7taBx9Us9cV2RC1AlyOGG0WoNkXjTifndKPOkzihgGNyo7vvbpOjqT4nvka
         GTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0kkMb7kDsGzSofKV1UUTTx5Jp9cMER8zKuDMM54Zm9g=;
        b=QEWN2pbJPCrtajgfKWDYICoRU/Gsv7SyE8Cq6Ugk+n+b190G8hiWVMYcT3/B4KEWpY
         JYtflZA9uYgB4Sq20HW6tSRX+H89swL3ikV2sSQu2O5SDMv0LUvg8xazsp+qnu2gQC1o
         EMc8yYCNZ/qopAoqMjPmMgpEgaC8I4v/S8Mkw0SA1r8GuRzSwMxRYDEZ0zIwZDY0INYK
         jlN5iV87LvuJJDcdqqJP2lcYSdo9+xE+z2UyFUK1TGvV427nqEuJu0oqpimAKBNgZkYI
         B4WVtmHZqAxjaPt/Te11kxZLzhJBjc+LMk4wZlt5oJoNKo6bCqOagdodPQXykm4H5ouG
         gy5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WfXsI3j/";
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r3si45263141uah.142.2021.11.08.00.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:01:06 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WfXsI3j/";
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636358465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kkMb7kDsGzSofKV1UUTTx5Jp9cMER8zKuDMM54Zm9g=;
	b=WfXsI3j/WfGjkYRkH5Fle3tdHL/tE2+9K5hsuzv4oHK4UIr/6tUrigaZC2yQhqY6Vs5c+0
	DnJ4nabKDOJUTSUeyFD/3VKOtjOuWmu4ITzb7xQ92Ylx2KOgjhvy/52QQe2czGM5JsFKKs
	EO1NHRlEsG96hIIFdjgji4qDZQRhf80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-H6NM8yGVMt6rLgZbazGqiA-1; Mon, 08 Nov 2021 03:01:02 -0500
X-MC-Unique: H6NM8yGVMt6rLgZbazGqiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0A5F1006AA1;
	Mon,  8 Nov 2021 08:01:00 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05B5B60936;
	Mon,  8 Nov 2021 07:59:52 +0000 (UTC)
Message-ID: <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
Date: Mon, 8 Nov 2021 08:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
In-Reply-To: <20211105155354.154864-2-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: f0sLm1ZU1kbU

On 05/11/2021 16.53, Willian Rampazzo wrote:
> This introduces a new `make` target, `check-avocado`, and adds a
> deprecation message about the `check-acceptance` target. This is
> a preparation for renaming the `tests/acceptance` folder to
>   `tests/avocado`.
> 
> The plan is to remove the call to the `check-avocado` target one
> or two months after the release and leave the warning to force
> people to move to the new `check-avocado` target.
> 
> Later, the `check-acceptance` target can be removed. The intent
> is to avoid a direct impact during the current soft freeze.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   docs/about/deprecated.rst | 13 +++++++++++++
>   tests/Makefile.include    | 17 ++++++++++++-----
>   2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 56f9ad15ab..7bf8da8325 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -410,3 +410,16 @@ nanoMIPS ISA
>   
>   The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>   As it is hard to generate binaries for it, declare it deprecated.
> +
> +Testing
> +-------
> +
> +Renaming of the acceptance folder to avocado
> +''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``tests/acceptance`` folder was never used to store acceptance tests
> +in terms of software engineering. This naming can confuse developers
> +adding tests using the Avocado Framework to this folder. The folder
> +name change to ``tests/avocado`` also changed the ``make`` target from
> +``check-acceptance`` to ``check-avocado``. In this case, the use of the
> +``check-acceptance`` target is deprecated.

Not sure whether we need  to document this in deprecated.rst, too, since 
we're normally only listing the things here that affect the users of the 
qemu binaries, not the people who want to recompile and run the tests... 
OTOH, I don't mind too much either if we list it here... Anybody else got an 
opinion on this?

> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8434a33fe6..8e8ee58493 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
>   	@echo " $(MAKE) check-tcg            Run TCG tests"
>   	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
>   endif
> -	@echo " $(MAKE) check-acceptance     Run acceptance (functional) tests for currently configured targets"
> +	@echo " $(MAKE) check-avocado        Run avocado (integration) tests for currently configured targets"
>   	@echo
>   	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
>   	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
> @@ -24,7 +24,7 @@ endif
>   	@echo
>   	@echo "The following are useful for CI builds"
>   	@echo " $(MAKE) check-build          Build most test binaris"
> -	@echo " $(MAKE) get-vm-images        Downloads all images used by acceptance tests, according to configured targets (~350 MB each, 1.5 GB max)"
> +	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
>   	@echo
>   	@echo
>   	@echo "The variable SPEED can be set to control the gtester speed setting."
> @@ -83,7 +83,7 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
>   
>   # Python venv for running tests
>   
> -.PHONY: check-venv check-acceptance
> +.PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
>   
>   TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
>   TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
> @@ -127,12 +127,12 @@ get-vm-image-fedora-31-%: check-venv
>   	$(call quiet-command, \
>                $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
>                --distro=fedora --distro-version=31 --arch=$*, \
> -	"AVOCADO", "Downloading acceptance tests VM image for $*")
> +	"AVOCADO", "Downloading avocado tests VM image for $*")
>   
>   # download all vm images, according to defined targets
>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>   
> -check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> +check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>   	$(call quiet-command, \
>               $(TESTS_VENV_DIR)/bin/python -m avocado \
>               --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> @@ -142,6 +142,13 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>               $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>               "AVOCADO", "tests/acceptance")
>   
> +check-acceptance-deprecated-warning:
> +	@echo
> +	@echo "Note '$(MAKE) check-acceptance' is deprecated, use '$(MAKE) check-avocado' instead."
> +	@echo
> +
> +check-acceptance: check-acceptance-deprecated-warning | check-avocado
> +
>   # Consolidated targets
>   
>   .PHONY: check-block check check-clean get-vm-images
> 

Acked-by: Thomas Huth <thuth@redhat.com>
