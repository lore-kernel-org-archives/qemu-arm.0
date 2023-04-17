Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1944045ejm;
        Mon, 17 Apr 2023 09:50:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZqUeN1hoicYx6MX7Scojty+aKV8NmBy/rgxY3hdHKkCLE+p9z3KG0v9yvXhU0F+7ASh/jA
X-Received: by 2002:a05:6214:c21:b0:5e5:c00c:8189 with SMTP id a1-20020a0562140c2100b005e5c00c8189mr17824851qvd.10.1681750220818;
        Mon, 17 Apr 2023 09:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681750220; cv=none;
        d=google.com; s=arc-20160816;
        b=zWZbN5rFhCkTgCnwfKcJDlUR4kDKKlf6BrjW0BFpU4sXFmlTN6VF+S3lNOUoDSgmhX
         TNjOImhO6NTemfa9kLqsBvXHE2p+EGK2Js6Djk3tqI/CNHQjmY0Rxa2yIuL+rxxE4Lr5
         Sq1+vXUDE8QO+Iy3u5AVoozisXoHefcnqrB1MgNauQOevC5xYXy89vrX4srRucuvG0hh
         RGVyrXM63TFhC6czL6Bak4csr5X6K59ygBKs0v+xidWRKHz2K7kn7XQDqS/y3gFUUi6b
         MWjTRBScE5SnNMx9Z33iU+fS5oIyeyznG5EJIxAh/kZctZmHfMnug038Ecc9Xa4dhcp4
         26AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qZYb6wB5wi2bPpLSTO7isOkM0GXEXq1uxyXyPygDCBs=;
        b=CD/tEia4GoZcZ7EKE+eUmHqFqDk2JQrENRlSD35/i25F0BlzYCH4llXIEBoEeXnZ1M
         fFrr6aXiW2BAoGIwic0MRYKgqZOFoLDRpFJPPAs5Q9S3Nujw2AM8aV2tZOXKccyC2Nht
         yVQEcSmyNzfmsBvUCtzDX6tL7+zhyKhwa9wFONPhSr1MZiruSHx15zukteIzYdiICYkG
         nPNba1FChIVMDzE2XNKeMloEKZQTUHyaY5iBVoSvRcVgBHv6O6ZWJ8nsIWe9ykZ4R27S
         k9YNq+UnXK46MLANzoPOBFyRwgmgOsUmzExsxrjNNhmnwJLlw3Vd6mY6XxbymUzsKke0
         trLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gqlINlo4;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q10-20020a056214194a00b005e63645ed30si470560qvk.506.2023.04.17.09.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 09:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gqlINlo4;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681750220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZYb6wB5wi2bPpLSTO7isOkM0GXEXq1uxyXyPygDCBs=;
	b=gqlINlo4pQKcpjg0dTRyHnvT9eRR0cEJ6fgMzNF7Dmtvbe1kHizBghWfKcG+YdJjsXSU3i
	Nz5CAYanswNdxf0Kb4mDG0XNC7FLl24XdIa2/bXdX+5DSg2gHxpt6Dl92nltQQ2fDSgxZ0
	17DK7uuIMqUTJDLIbFudya9rrFpJQQY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-7-EY_Gh-NWCwlBQ_Tdck3w-1; Mon, 17 Apr 2023 12:50:19 -0400
X-MC-Unique: 7-EY_Gh-NWCwlBQ_Tdck3w-1
Received: by mail-pj1-f71.google.com with SMTP id nn5-20020a17090b38c500b00246772f5325so10932765pjb.6
        for <alex.bennee@linaro.org>; Mon, 17 Apr 2023 09:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681750218; x=1684342218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZYb6wB5wi2bPpLSTO7isOkM0GXEXq1uxyXyPygDCBs=;
        b=krdu5UU7SlLsQcVYeqc35Yes/PEqBAe9Yu1dAu+pAForYUtaQ9v/pF8KXwzcv4w6j7
         FlQL/Ik2fqqeZe0FTzhbreM5AYtDezL4bCqdGKJDqswXu69dygwaI+zGwDLmkX/8638W
         BT60SKv7IwNIu380VNahknz+27W/QOy73LEKf2H3tVeXUH2+X/XGqlL8uvIaGLr4XrEr
         mMM6yZzhXZpXbrw4ErEjFWQ0fWFtwhaAh7PptXKVtT91uc4s/I5zrHmpRs8E8ZW8ohX+
         TTy4FaixUvz9MH1Wsp2cLRKEhn/31Q4evisxrChNzEIWfZJxJRAvhRoDC2UgpIwvk7ZQ
         LLcA==
X-Gm-Message-State: AAQBX9eJEdFB47NFfk0a4qldVlG/jHPOIf6OY2NDoNdwWdZBPAn47Bed
	6ufXVRaHFYEC79VUtBJtYyivT0rxb5BolY2jAJ3kFt7rg6Oj66JOdG1IK80jmkSp3lkf4J0jq2M
	4ce1Jc3MrRnnMhHygjn/XgyJyRbvLXyoCIUM9n5kT
X-Received: by 2002:a17:90a:cc0e:b0:247:9d19:311f with SMTP id b14-20020a17090acc0e00b002479d19311fmr3301239pju.30.1681750217751;
        Mon, 17 Apr 2023 09:50:17 -0700 (PDT)
X-Received: by 2002:a17:90a:cc0e:b0:247:9d19:311f with SMTP id
 b14-20020a17090acc0e00b002479d19311fmr3301217pju.30.1681750217432; Mon, 17
 Apr 2023 09:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230417134321.3627231-1-alex.bennee@linaro.org> <20230417134321.3627231-2-alex.bennee@linaro.org>
In-Reply-To: <20230417134321.3627231-2-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Apr 2023 12:50:06 -0400
Message-ID: <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Jan Richter <jarichte@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Markus Armbruster <armbru@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Kautuk Consul <kconsul@linux.vnet.ibm.com>, 
	Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ij9ZjyDor4Au

On Mon, Apr 17, 2023 at 9:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
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
>   - limit --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)
> ---
>  tests/Makefile.include | 18 +++++++++++-------
>  tests/requirements.txt |  2 +-
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 9422ddaece..a4de0ad5a2 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>  # download all vm images, according to defined targets
>  get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDOR=
A_31_DOWNLOAD))
>
> +JOBS_OPTION=3D$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))=
))
> +
>  check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> -       $(call quiet-command, \
> -            $(TESTS_PYTHON) -m avocado \
> -            --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RES=
ULTS_DIR) \
> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
> -                       --filter-by-tags-include-empty-key) \
> -            $(AVOCADO_CMDLINE_TAGS) \
> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
> +       $(call quiet-command,                                            =
       \
> +            $(TESTS_PYTHON) -m avocado                                  =
               \
> +            --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RES=
ULTS_DIR)  \
> +            $(if $(AVOCADO_TAGS),,                                      =
       \
> +                       --filter-by-tags-include-empty                   =
       \
> +                       --filter-by-tags-include-empty-key)              =
       \
> +               --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)              =
         \
> +            $(AVOCADO_CMDLINE_TAGS)                                     =
       \
> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),            =
       \
>              "AVOCADO", "tests/avocado")
>
>  check-acceptance-deprecated-warning:
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 0ba561b6bd..a6f73da681 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -2,5 +2,5 @@
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>  # Note that qemu.git/python/ is always implicitly installed.
> -avocado-framework=3D=3D88.1
> +avocado-framework=3D=3D101.0
>  pycdlib=3D=3D1.11.0
> --
> 2.39.2
>

I thought there were test failures that prohibited us from bumping the
Avocado-Framework version. Did those get rectified recently?
