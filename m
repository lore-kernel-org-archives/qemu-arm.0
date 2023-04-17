Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1987159ejm;
        Mon, 17 Apr 2023 11:03:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZMegtAw0d8rD/luMfB8OUvfXNhAindIvRs0tnIf65MbhM8BhWzmxIDe4NUfWZcc8p7Otm6
X-Received: by 2002:ac8:5954:0:b0:3bd:1a8a:8015 with SMTP id 20-20020ac85954000000b003bd1a8a8015mr27349208qtz.16.1681754610198;
        Mon, 17 Apr 2023 11:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681754610; cv=none;
        d=google.com; s=arc-20160816;
        b=JkERELG5hojLG6sZcLvB/TxGEN5FABLpyOc2EF3E6s8gtnvQLorwNqzYgKkr9X2k/7
         SfMvpuHHtzCRviQFGE41kRkaoswqyaDzKk2+O/AlTOjPKXufJ5A5rcdHYRLorK+yUCys
         h2Wt3qxYyhhqSDz4pIccN17AnDmWaRPQafyVmTDXBwtX6ikfc4Wjzc7cVomlXotmNhlN
         pZ1m5SbFXRYIDypkh65RSHo5a4Yr8r088uWolWTKJl0sPcMeSkJJZyyD0xJ2ys0hkdEM
         OUhubiXNzLehRymY8vpgnLwer6R0kUA0gt1iF1crAtK4BFW1xCeWlXvaUQk/5rT6OAxv
         KN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jIMFLhKFmQImPl1qfpvTE4q/2phmpZqK5GqbApgg/iE=;
        b=PKgxY0+drqz8y0Dd+hJm3QiWmCtbdgMonERCOS/BwgGgpQNbCwG7n7BFXf4HOZni1E
         r0e57EIHdOthnyp/XHx0TRKCBGvpjkuZNIiwaWC3kOpQFys/Ume+h8VmSqxn7BHjxc/4
         KITMaIYMzop6VwogUB9ueaITueaiuVm6CIl0S22fLrkzMJ0iQf8DVfjgL9ho2zeKBmnp
         qn/4ajzxXG4JX8kVNVeuxRE6KFrLahpunmoa5jFt8UaSwhrgswSOybr0jU+NBdjWQw3q
         cG3zUOv9DQJaFyjEWcRQEJfuBTlREoywzqOAxW+xpd+SAKBGtfXYvUJxyGn0srHKLwjp
         2pDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FrPBdJUk;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u1-20020ac858c1000000b003e4eb036877si1588715qta.180.2023.04.17.11.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 11:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FrPBdJUk;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681754609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIMFLhKFmQImPl1qfpvTE4q/2phmpZqK5GqbApgg/iE=;
	b=FrPBdJUkRqYPX1OVnUXeouy2jQS68i4XSgkdAYgDmH8qfPbR/SKHMf/ZcCKlfet3OTU31G
	ExWSECsskmVXUAdyfXnHJQ+ohDoWw7FtXeCNY6ajDaMYJ69/SnOKO7q578dQJYOktIXSwj
	dbMyhFK5Qb63CoRQ0KQuGK3zW+HZCZw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-yaBnjoZcMcyUgQ_WZCoU_A-1; Mon, 17 Apr 2023 14:03:28 -0400
X-MC-Unique: yaBnjoZcMcyUgQ_WZCoU_A-1
Received: by mail-pj1-f70.google.com with SMTP id s13-20020a17090a5d0d00b002478f3e8cbfso1290217pji.0
        for <alex.bennee@linaro.org>; Mon, 17 Apr 2023 11:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681754607; x=1684346607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIMFLhKFmQImPl1qfpvTE4q/2phmpZqK5GqbApgg/iE=;
        b=aH37a6PHIVYYIs+pKvkuy5+pWF2Ko7vV/0XTM06vxGE243qJRXjzeXTT/nasld78Zh
         +p+zuojjZ3INcYstEIningGWM8WgLra/hjugxCsqQ7QrplCU8ZZiTkN7rABYbP2qkR/g
         M6JTncfeIKAdhvrBLsztQrlrGldjrilFT0tHwEA4u+tcOILcMR3OwOgF90M2PvpBE50r
         xleazU11IbWb0WWBi5JDEr3zWJcjOKaRrLKXvuIKbpw6LcyqTGqSpz1ppEYl95gb9wuI
         G+ffi3T9lTxJLzRDKZ1MgzA84xDjQH4hTYHy8nUPNtZCLvsP3oRTnajjM7waO4yAYv6k
         pVPQ==
X-Gm-Message-State: AAQBX9fI8Ul8txRrn9MMM2RsW7CsiMpeD5ludW8HolG7XQhJTSMf0BAi
	9md8WTvqOymg8JcL1bUD68992MYfmDvLobyNWaN/t9gxIVZmNZ/a9ZOJfo5MxSvfl11tHwpOHO/
	NKguTRXmafxmlY6vI9CKuql+lPOApKHSHJqObtr6N
X-Received: by 2002:a17:90a:4d48:b0:246:97d2:dc0d with SMTP id l8-20020a17090a4d4800b0024697d2dc0dmr16899599pjh.39.1681754607205;
        Mon, 17 Apr 2023 11:03:27 -0700 (PDT)
X-Received: by 2002:a17:90a:4d48:b0:246:97d2:dc0d with SMTP id
 l8-20020a17090a4d4800b0024697d2dc0dmr16899568pjh.39.1681754606929; Mon, 17
 Apr 2023 11:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Apr 2023 14:03:15 -0400
Message-ID: <CAFn=p-aVB_Gwm2Rsa0zvDOdQuCQNURvwz53yg+sSy3JZK7Cg2A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] testing/next: avocado, docs, gitlab
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Markus Armbruster <armbru@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: hF6LqRb0diM8

On Mon, Apr 17, 2023 at 9:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> This is the current state of my testing tree. It contains a few
> patches that didn't make it into 8.0 and more testing fixes including
> a bump to the avocado release including Thomas' --max-parallel-tasks
> hack to avoid running the tests in parallel. So far it doesn't look
> like its causing any problems although I am seeing some timeouts on
> the BSDs.

Oh, looks like you answered my question here. OK then!


>
> The following patches need review:
>
> tests/avocado: use the new snapshots for testing
> tests/requirements.txt: bump up avocado-framework version to 101.0 (0 ack=
s, 1 sobs, 1 tbs)
>
> Alex Benn=C3=A9e (2):
>   tests/avocado: use the new snapshots for testing
>   qemu-options: finesse the recommendations around -blockdev
>
> Kautuk Consul (1):
>   tests/requirements.txt: bump up avocado-framework version to 101.0
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   tests/avocado: Add set of boot tests on SBSA-ref
>
> Thomas Huth (2):
>   gitlab-ci: Avoid to re-run "configure" in the device-crash-test jobs
>   scripts/device-crash-test: Add a parameter to run with TCG only
>
>  MAINTAINERS                              |   1 +
>  .gitlab-ci.d/buildtest.yml               |   6 +-
>  qemu-options.hx                          |  24 +++-
>  scripts/device-crash-test                |   4 +-
>  tests/Makefile.include                   |  18 ++-
>  tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++
>  tests/avocado/tuxrun_baselines.py        | 170 +++++++++++++++++++----
>  tests/requirements.txt                   |   2 +-
>  8 files changed, 343 insertions(+), 40 deletions(-)
>  create mode 100644 tests/avocado/machine_aarch64_sbsaref.py
>
> --
> 2.39.2
>
