Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp517275ejr;
        Tue, 10 Oct 2023 18:02:43 -0700 (PDT)
X-Received: by 2002:a1f:4b45:0:b0:48d:5be:2868 with SMTP id y66-20020a1f4b45000000b0048d05be2868mr10553412vka.0.1696986163105;
        Tue, 10 Oct 2023 18:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696986163; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHJGV2T3v5buA7CGfER0hUDQx+UGS4iFr6xw/rafyLLi1wWO/MLqBX6Fk6vfpOm/Z3
         XRI/QVfZFMOQ0B5eJctmPlzoh/AePQYiGCYAWDmKHinF6EoVKqtO+auh50q9JzTqh7C5
         v/kR23Q9c3r113SGOgiAVr5YgMmt82hz2eFIX2xazoh+VDjTigQv8btuFkQ2+XqC58AP
         oRfOS/Zr9VnMqsG9+5qL0yjD8prUEIlXeNja67cgFn02BVHepJgRRyxJn4lPM2Mw4Nwk
         0jWewNkSbtFe/CxgITB1W3WC/jjj0rkRSjrVT0FzLYo81JBvMclk90Mzt2CR+ufdq5CB
         VoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=az7hRY13AXihgfwT+snngU6CrW6XXZhg5oEBwlyT9c0=;
        fh=cS1m9iodkyxZQSyUNnuhOwuBRVvByRyjvwUhrz4vNkk=;
        b=RfaBsgxmM9A0iPMIfgV7EvG3oa4ZETMP1QA9ayXatgG57Qei4J6+u1AJZ0p8v8KnKR
         AQKc5oEduKb+uJrckctfrHMHaXzDa69JQwbyx8DXfjXqtvOsdyG4SwLuMND7JkvOYgCc
         wcq9Wtyr+xrhGDpFlPBbl73m3gryIl9fpmZjRLN2G6M2zR2I3jpNVie/hesxhmZMOOYg
         wIHLbsXppfFCtSA6QSeyIDtb3lNGCtZMe4nuOxG7dje62Q6+MLnz/TYCz2eZMMHfKFhi
         JutRpjwleUIgrKoq5J67kiBqmzPNdKOAHwWALpSSynjc/7tkFCSFaWhgB0kMVKAC+psk
         2EYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=L38mwIcH;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fw7-20020a0561222a0700b00493648d75f4sor6229195vkb.3.2023.10.10.18.02.42
        (Google Transport Security);
        Tue, 10 Oct 2023 18:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=L38mwIcH;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696986162; x=1697590962; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az7hRY13AXihgfwT+snngU6CrW6XXZhg5oEBwlyT9c0=;
        b=L38mwIcHLtKy5TrvdLrSRqpkJ2Ct1S4rc9MhlhME5SV/C+GgPLPf5pnzAuOYdxaF4h
         e0K0gv2BHm6+JeY6hGMTqIULE2uS3G3B40PjS8LYhAA6va3BAESh3nYYqMiNp3L1MbDN
         Rt7eAvs7fxuZRkJrSOY3FSW6jLGV31L3gkx7vN5nqSCezXdVrBk8USIzHLn6q3yGlQaI
         2nlpeb8ELf2eWqaPOEEP7nNjeR0Y1BzSU6uZUzYMpB6iHWTo/8uqVRrg5t+ggP9ahbzm
         x2edSkeBhLLg3y+Fg8BaxsQRxjl0A7yuVaBeMz/hu7a2g5yA/Up1Y6vijJwoPoSmRDjT
         T65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696986162; x=1697590962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=az7hRY13AXihgfwT+snngU6CrW6XXZhg5oEBwlyT9c0=;
        b=w3Uw5TkQPjzf+/ZYzsded3PsQTjJBX2vR6Qg9B2Vmo2dvovB1RZTE/cv90uZ0wk5DK
         91+FyMHjCDNPESEEOv0tTl6N2c6fvtqKhnX+HE6WK0kq3ns2KtW7p3a8ntKMY6VcCPBh
         JTOKjCL3nW00wVEUz0A2RS2+ajIDzqjqJOqeSLuyRvxbC6VBgJXaJkAe0NtMuu+LmZsy
         cxjlNQ9WvagOWJMvpzlkrNz07B2ocvo1nTyinPtHSOSf0zx3UCKGev/R2nedgEVGzpXR
         bfK1QUeYcwi5CyPKooOFJwZ8QbeOQLqgEI7XMKfuwUrKJYBZRjxi4HuuIUHRTcR9vi8h
         FhXA==
X-Gm-Message-State: AOJu0YzaJkK4uyAWKNMr+euXbifDo5jffVSLSrqIAtp8z43si5Vx4oxF
	qc6LeHzpptk5bw41BKya4lfBVIazME1h02scFfcBkQAg0BF+7Q==
X-Google-Smtp-Source: AGHT+IEvf93Yxj4oZz0NTJ8qGczKWc2RXD6w5T6XupZRdUvKXy0nd5u+ck78IiMEVRhfzAPo/g2jvt5NP9aBq6r55FY=
X-Received: by 2002:a1f:e7c4:0:b0:49a:9f99:bb03 with SMTP id
 e187-20020a1fe7c4000000b0049a9f99bb03mr9918940vkh.1.1696986161996; Tue, 10
 Oct 2023 18:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org> <20231009164104.369749-6-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-6-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:02:15 +1000
Message-ID: <CAKmqyKPgCd0ej7Jd8v8o-8Y=E_keMCA8v1-iLBrNKEfQn_U3ZA@mail.gmail.com>
Subject: Re: [PATCH 05/25] tests/docker: make docker engine choice entirely
 configure driven
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Brad Smith <brad@comstyle.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
	John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: cnD41Gszrp3d

On Tue, Oct 10, 2023 at 4:05=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Since 0b1a649047 (tests/docker: use direct RUNC call to build
> containers) we ended up with the potential for the remaining docker.py
> script calls to deviate from the direct RUNC calls. Fix this by
> dropping the use of ENGINE in the makefile and rely entirely on what
> we detect at configure time.
>
> We also tweak the RUNC detection so podman users can still run things
> from the source tree.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
> v2
>   - add RUNC stanza suggested by Paolo
> ---
>  configure                     | 1 -
>  tests/docker/Makefile.include | 9 +++------
>  2 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/configure b/configure
> index e08127045d..707132a3ae 100755
> --- a/configure
> +++ b/configure
> @@ -1694,7 +1694,6 @@ if test -n "$gdb_bin"; then
>  fi
>
>  if test "$container" !=3D no; then
> -    echo "ENGINE=3D$container" >> $config_host_mak
>      echo "RUNC=3D$runc" >> $config_host_mak
>  fi
>  echo "SUBDIRS=3D$subdirs" >> $config_host_mak
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
> index dfabafab92..ab68b2dbad 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -16,9 +16,8 @@ DOCKER_DEFAULT_REGISTRY :=3D registry.gitlab.com/qemu-p=
roject/qemu
>  endif
>  DOCKER_REGISTRY :=3D $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGIS=
TRY))
>
> -RUNC ?=3D docker
> -ENGINE ?=3D auto
> -DOCKER_SCRIPT=3D$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
> +RUNC ?=3D $(if $(shell command -v docker), docker, podman)
> +DOCKER_SCRIPT=3D$(SRC_PATH)/tests/docker/docker.py --engine $(RUNC)
>
>  CUR_TIME :=3D $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
>  DOCKER_SRC_COPY :=3D $(BUILD_DIR)/docker-src.$(CUR_TIME)
> @@ -158,7 +157,7 @@ $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(D=
OCKER_IMAGES)), \
>  )
>
>  docker:
> -       @echo 'Build QEMU and run tests inside Docker or Podman container=
s'
> +       @echo 'Build QEMU and run tests inside $(RUNC) containers'
>         @echo
>         @echo 'Available targets:'
>         @echo
> @@ -198,8 +197,6 @@ docker:
>         @echo '    EXECUTABLE=3D<path>    Include executable in image.'
>         @echo '    EXTRA_FILES=3D"<path> [... <path>]"'
>         @echo '                         Include extra files in image.'
> -       @echo '    ENGINE=3Dauto/docker/podman'
> -       @echo '                         Specify which container engine to=
 run.'
>         @echo '    REGISTRY=3Durl         Cache builds from registry (def=
ault:$(DOCKER_REGISTRY))'
>
>  docker-help: docker
> --
> 2.39.2
>
>
