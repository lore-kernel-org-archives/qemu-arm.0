Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s13sm15093698wrw.29.2020.03.10.07.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 07:29:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C65C41FF7E;
	Tue, 10 Mar 2020 14:29:13 +0000 (GMT)
References: <20200309215818.2021-1-peter.maydell@linaro.org>
 <20200309215818.2021-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 1/5] Makefile: Allow for subdirectories in Sphinx manual
 dependencies
In-reply-to: <20200309215818.2021-2-peter.maydell@linaro.org>
Date: Tue, 10 Mar 2020 14:29:13 +0000
Message-ID: <87d09ki8qu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iIhuKHpfkU/U


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently we put 'docs/foo/*.rst' in the Make list of dependencies
> for the Sphinx 'foo' manual, which means all the files must be
> in the top level of that manual's directory. We'd like to be
> able to have subdirectories inside some of the manuals, so add
> 'docs/foo/*/*.rst' to the dependencies too.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 2e930688942..5dba949947a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1081,7 +1081,7 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html \
>  # a single doctree: https://github.com/sphinx-doc/sphinx/issues/2946
>  build-manual =3D $(call quiet-command,CONFDIR=3D"$(qemu_confdir)" $(SPHI=
NX_BUILD) $(if $(V),,-q) -W -b $2 -D version=3D$(VERSION) -D release=3D"$(F=
ULL_VERSION)" -d .doctrees/$1-$2 $(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 =
,"SPHINX","$(MANUAL_BUILDDIR)/$1")
>  # We assume all RST files in the manual's directory are used in it
> -manual-deps =3D $(wildcard $(SRC_PATH)/docs/$1/*.rst) \
> +manual-deps =3D $(wildcard $(SRC_PATH)/docs/$1/*.rst $(SRC_PATH)/docs/$1=
/*/*.rst) \
>                $(SRC_PATH)/docs/defs.rst.inc \
>                $(SRC_PATH)/docs/$1/conf.py $(SRC_PATH)/docs/conf.py
>  # Macro to write out the rule and dependencies for building manpages


--=20
Alex Benn=C3=A9e
