Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp516055ejr;
        Tue, 10 Oct 2023 18:00:20 -0700 (PDT)
X-Received: by 2002:a67:fdc1:0:b0:454:640e:58cb with SMTP id l1-20020a67fdc1000000b00454640e58cbmr19991217vsq.9.1696986019756;
        Tue, 10 Oct 2023 18:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696986019; cv=none;
        d=google.com; s=arc-20160816;
        b=E5/je1Pzo0n13JTRXH6tw5ILq/ufYhBtmFuPFuL0bV3Lqhd506iio9aTWU3hAw/Zin
         JVVg7PmAa+jQIMIC59+/oX7i9F7FnbQremq6379MDjGb6KGmvGnqMfZAPlVZO7oeeh9+
         7HZzwh3XfNtqOZeeNVVpGaNAXeNkqlRwpEzzlgRaubP0ueXwts4A3BN5nszyDkcAH54/
         eSIDTGkbeyWddvpVSK5lmo6+Fkb08E+S0IQKpTOHnwsI8yiXiUDsdaHuUuQ16olVcQgT
         /nCa7YP7SH7SF4h1Bor5tnbrGjxcqZ5oegN1wzhq4A82PmCexfLQ3x3S1pO4NHdXreqE
         QVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=++o7UftkOXHi8q803uDAaQvUzbJ0NQP3tioGwwFGfjU=;
        fh=cS1m9iodkyxZQSyUNnuhOwuBRVvByRyjvwUhrz4vNkk=;
        b=c9bKY04YBPZGOhE3FZbK4s0kVyNQW9X5/Udzg4UYbuoovoYwcaDo3PuLZPUCMhl2qx
         YkiYfLWyYPdBoNA7Tdq+ckTtqSDR1Mv/x6+pddQrEJbKUQcU3+aH94NNVV8XjVEIe9N8
         Su7vPT3maRnZHDPjyPRfJbiM9Gv+ePZy2OPUDFlHvkNQFkqFsfTB6u+XArh1bLbMscRK
         RspYaIa7JHKWlLWFUyiRa7xVhWOAmMGMa2kuQZwHpB9iIHCu7sY5RqGSEmRQzhruco/P
         SztBddmMB5IOx2GdEAXJo8+GX9rj2PRPcw0Y8yazZO+8dM0P+Or9PpV7Vx1N6tPBKK8z
         aGaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTxYPotE;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k43-20020ab059ee000000b007abaa83901fsor3070258uad.2.2023.10.10.18.00.19
        (Google Transport Security);
        Tue, 10 Oct 2023 18:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTxYPotE;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696986019; x=1697590819; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++o7UftkOXHi8q803uDAaQvUzbJ0NQP3tioGwwFGfjU=;
        b=BTxYPotEH+AElWwrSvqs+++vt34zNpx59j2fJzsBpWLS3uknfgFZxjRQl0RFd0/aot
         K18WrCXPSi5i1unVpQq6RWXz210sFoklbNHMTPG3rk0wtkU86sWQwHLt+aCCkAv6GH8e
         PuWlRyFn8aXL84LchY4nTHgy3cG8Fs/vULTTxgMJv8pfU0kKuk8EGCWhHK8wQj+T/so9
         WUrX5+om4w9IntpaDPfOKU/IHK8CKlSGvUs7m4W6/cAxhCYNkUrTWsS7L6cf5h5cc+Wc
         Wl/T+t+QhCUHLb3+90c7uqIRNlgl9TL2aQbN/+F1FjAV6kGP8sbRLwPXw8AFeWGCcvc6
         4VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696986019; x=1697590819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++o7UftkOXHi8q803uDAaQvUzbJ0NQP3tioGwwFGfjU=;
        b=Wl1cNuij3frS+B+WotoeB2F/ve7aKCc54eVykwo6Dz2FPcjdsurj77WDPLsgm0c+IR
         y576sBTEtv8YZpMXgrqhnWAXIyk1282Uodbqrhf+N2h//ghwQrLLv6Dzyx5OQWkyCQFZ
         I0UfaFDYa0tLForIAU8GDoI8s3mWUHF3Xna3YgWiMcL5Yt/bdB46EEmJ7g0CUpJqGQ25
         y+a/K8iVU0GP3/ShkFD9aTiqdeB9DQoPR0vJgS0i4cbGGyH8jaCK+8LXqZp4WmLQM7P8
         OmGZtlaHYuK1ZbKQVn5rDoso/LTgp9v6NNdsMMLAh2I/oSMgJETq/p7p7JAziukFpa69
         JxRA==
X-Gm-Message-State: AOJu0Yx2b8+nivvfZH7rRgii+zPlSmhKQbDiNZ03ZKAPxBSSe5qyGenV
	CklqBzuCa3El4azqaqp3QbwiiesHdzEX/yicEE3sVYaPzPy7SQ==
X-Google-Smtp-Source: AGHT+IGOTekLtXsKXqcaZWKvLoEU95j0yEnCWAbkefEpVHJTMrfRmKg+4u5NpSxd4S2qicxHJJhgrlzrmwmIaho5mrI=
X-Received: by 2002:a1f:da84:0:b0:49a:bff1:23 with SMTP id r126-20020a1fda84000000b0049abff10023mr16645118vkg.5.1696986018847;
 Tue, 10 Oct 2023 18:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org> <20231009164104.369749-7-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-7-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:59:52 +1000
Message-ID: <CAKmqyKM-93jCM5-Q4+wJJ7Yv1Z2OX6jr8nC3qzSQLFBi5y1gLg@mail.gmail.com>
Subject: Re: [PATCH 06/25] configure: allow user to override docker engine
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
X-TUID: MtSCa7iogNKL

On Tue, Oct 10, 2023 at 3:52=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> If you have both engines installed but one is broken you are stuck
> with the automagic. Allow the user to override the engine for this
> case.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  configure | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 707132a3ae..ebad155d9e 100755
> --- a/configure
> +++ b/configure
> @@ -180,6 +180,7 @@ fi
>  # some defaults, based on the host environment
>
>  # default parameters
> +container_engine=3D"auto"
>  cpu=3D""
>  cross_compile=3D"no"
>  cross_prefix=3D""
> @@ -787,6 +788,8 @@ for opt do
>    ;;
>    --disable-containers) use_containers=3D"no"
>    ;;
> +  --container-engine=3D*) container_engine=3D"$optarg"
> +  ;;
>    --gdb=3D*) gdb_bin=3D"$optarg"
>    ;;
>    # everything else has the same name in configure and meson
> @@ -921,6 +924,7 @@ Advanced options (experts only):
>    --enable-plugins
>                             enable plugins via shared library loading
>    --disable-containers     don't use containers for cross-building
> +  --container-engine=3DTYPE  which container engine to use [$container_e=
ngine]
>    --gdb=3DGDB-path           gdb to use for gdbstub tests [$gdb_bin]
>  EOF
>    meson_options_help
> @@ -1195,14 +1199,14 @@ fi
>  container=3D"no"
>  runc=3D""
>  if test $use_containers =3D "yes" && (has "docker" || has "podman"); the=
n
> -    case $($python "$source_path"/tests/docker/docker.py probe) in
> +    case $($python "$source_path"/tests/docker/docker.py --engine "$cont=
ainer_engine" probe) in
>          *docker) container=3Ddocker ;;
>          podman) container=3Dpodman ;;
>          no) container=3Dno ;;
>      esac
>      if test "$container" !=3D "no"; then
>          docker_py=3D"$python $source_path/tests/docker/docker.py --engin=
e $container"
> -        runc=3D$($python "$source_path"/tests/docker/docker.py probe)
> +        runc=3D$container
>      fi
>  fi
>
> --
> 2.39.2
>
>
