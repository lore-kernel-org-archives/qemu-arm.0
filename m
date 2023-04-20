Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp568231ejm;
        Thu, 20 Apr 2023 09:54:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZHAx4SmHL9VtTbGMeTvMDSt4qselmOnaLBSWK9lxtBlPjtUEwMN0Agv31XdFXgPeVjI6f0
X-Received: by 2002:ad4:5ba7:0:b0:5b5:99b6:f0d0 with SMTP id 7-20020ad45ba7000000b005b599b6f0d0mr3031284qvq.32.1682009682807;
        Thu, 20 Apr 2023 09:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682009682; cv=none;
        d=google.com; s=arc-20160816;
        b=gfN6V43WFdl6zIInI0ZZuIO1igyPwfOQACPjvyYKHPI/gD3kOo+K63t5LcdNTuUO8L
         24I0osxTAc8nzaUKU99lP9zVQZ3cnzxzY/g5cehwNa/cgmQ5ftg2UJIn1XbHa9PlJ1BW
         G3fDHKs3naCKRrfFSLbiCnlXmfeXCyE3wGifPLUj939cFIBL3ZYvIVDt4KX5+qcov8dL
         BaHk6Q6ZiSjX7NlYo+E8FKEKrnath3gBCOn2v2GaFXFnnLjvuPjHDEZUJpe/mSRNF2c3
         Aa8aS2E+lp1XDithdAPoKOdP9Vl9zBroDEWkN9orLJco8I2ps0LWfdRNCTux64Zj+rfg
         todA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1Mt7hNeizwniavCNQpnxrcNDkMWiOCKLmcw3DXQnItw=;
        b=eZwqmFyBlRKaYmM/9Pd415w+2ekUlv8i5QyCCITHHBNEnBEEte57k7TkT3j+nslOGg
         2Tq5zSqZodhJqMEgodYDQ4do7fjfhb2MImpNH/Y9U0/GIWbQXLsMWBmv9G7WGwryGU9I
         58/crT6cPDL/NoCmTq5FPdaUsj8FurPh8n4u1t1ZfPCJFaQ5ZNezlCq5M0QewwdVFol1
         ZceSt/TSgzIVVu2HOx2m8BWJCjZWhd9a3jC3KkzqrVPDVcCHg9RJEmFXFpN8D2lZvn6+
         r6AMiFDLvAqGuIZBn9ItFtCnkZgWRjQ+Uop7GHuZ9HKDKB7o5UyXHT6+wk0+6anw9PGc
         FxBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RhGIn3dn;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 3-20020a05621420c300b005ef83cf91cfsi1693934qve.518.2023.04.20.09.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 09:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RhGIn3dn;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682009682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Mt7hNeizwniavCNQpnxrcNDkMWiOCKLmcw3DXQnItw=;
	b=RhGIn3dnIJaVZdmsnHb+WnxtHg3PPURzlL0BagAsmmGb422cIZvsIZT+xf/6UkF114ytts
	2BJFYup30lqLQA5rV2NTuedl11rt1YNenxgiOkNIbGRG426rsQ2ya0TxHeUu88/d5RaL/U
	fA1SEr/gZdkmXWTI8gzPt1nbuwbNNpE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-e4BUM2AFNi6CLTM19F6L-w-1; Thu, 20 Apr 2023 12:54:38 -0400
X-MC-Unique: e4BUM2AFNi6CLTM19F6L-w-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-51b7337010eso1090442a12.1
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 09:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682009677; x=1684601677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Mt7hNeizwniavCNQpnxrcNDkMWiOCKLmcw3DXQnItw=;
        b=mFJFsemBZABFwsIQKK+sNaVSDJPAKBsEfezjmEqfaNdQqoxR8zponsfxUZL2xujCuo
         npg8Ujc7awhcEyl3O/yMwKYJW3NtKbVddJQdhFUWF2Qcy89ZMbaAmsa4I6PTAYa6Mq20
         bp+nQQ+ZNPDtQ9X9LIzgkSHYUmpCORjStqvOE0VjHr91Nz27GwRiPKIYdhR4fz/vcTDB
         TprFlAzqFmQkVn773bpqUIvx6ZPCliP+KLm+gODws8Luv8U9yj8vaXb8poK8xm54NTMO
         eAN51aDZTScpH8QWwlOwDtX+UirEOwHJERca0ZpiwOgB/VZc+puxmeEcIOXlUSthdBEy
         o9Hw==
X-Gm-Message-State: AAQBX9fTcZaEGgzlAttAETw61hWi6HurMk9259pflTXBCvPkBNuT1oZO
	Kd+9MwxJupqbltAcK8isK9VhYGc59aZ5kf50bseNo6hkZxNQtD8NzZN2uvSe+rrfskerx/404wa
	nDLL3zSnYHbDoGNpJsuk4jnu10h2NPNrS
X-Received: by 2002:a05:6a21:6d84:b0:ee:84a2:4ad0 with SMTP id wl4-20020a056a216d8400b000ee84a24ad0mr3317310pzb.22.1682009677666;
        Thu, 20 Apr 2023 09:54:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d84:b0:ee:84a2:4ad0 with SMTP id
 wl4-20020a056a216d8400b000ee84a24ad0mr3317279pzb.22.1682009677386; Thu, 20
 Apr 2023 09:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org> <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
 <87pm82e74d.fsf@linaro.org> <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
In-Reply-To: <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 20 Apr 2023 12:54:26 -0400
Message-ID: <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Jan Richter <jarichte@redhat.com>, 
	qemu-devel <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Markus Armbruster <armbru@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Kautuk Consul <kconsul@linux.vnet.ibm.com>, 
	Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000054679405f9c76538"
X-TUID: p2ZLdNyhw6vD

--00000000000054679405f9c76538
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023, 5:19 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g>
wrote:

> On 17/4/23 19:44, Alex Benn=C3=A9e wrote:
> >
> > John Snow <jsnow@redhat.com> writes:
> >
> >> On Mon, Apr 17, 2023 at 9:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@=
linaro.org>
> wrote:
> >>>
> >>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> >>>
> >>> Avocado version 101.0 has a fix to re-compute the checksum
> >>> of an asset file if the algorithm used in the *-CHECKSUM
> >>> file isn't the same as the one being passed to it by the
> >>> avocado user (i.e. the avocado_qemu python module).
> >>> In the earlier avocado versions this fix wasn't there due
> >>> to which if the checksum wouldn't match the earlier
> >>> checksum (calculated by a different algorithm), the avocado
> >>> code would start downloading a fresh image from the internet
> >>> URL thus making the test-cases take longer to execute.
> >>>
> >>> Bump up the avocado-framework version to 101.0.
> >>>
> >>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> >>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
> >>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
> >>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
> >>>
> >>> ---
> >>> v2
> >>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)
> >>> ---
> >>>   tests/Makefile.include | 18 +++++++++++-------
> >>>   tests/requirements.txt |  2 +-
> >>>   2 files changed, 12 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/tests/Makefile.include b/tests/Makefile.include
> >>> index 9422ddaece..a4de0ad5a2 100644
> >>> --- a/tests/Makefile.include
> >>> +++ b/tests/Makefile.include
> >>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
> >>>   # download all vm images, according to defined targets
> >>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%,
> $(FEDORA_31_DOWNLOAD))
> >>>
> >>> +JOBS_OPTION=3D$(lastword -j1 $(filter-out -j, $(filter
> -j%,$(MAKEFLAGS))))
> >>> +
> >>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> >>> -       $(call quiet-command, \
> >>> -            $(TESTS_PYTHON) -m avocado \
> >>> -            --show=3D$(AVOCADO_SHOW) run
> --job-results-dir=3D$(TESTS_RESULTS_DIR) \
> >>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
> >>> -                       --filter-by-tags-include-empty-key) \
> >>> -            $(AVOCADO_CMDLINE_TAGS) \
> >>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
> >>> +       $(call quiet-command,
>          \
> >>> +            $(TESTS_PYTHON) -m avocado
>                  \
> >>> +            --show=3D$(AVOCADO_SHOW) run
> --job-results-dir=3D$(TESTS_RESULTS_DIR)  \
> >>> +            $(if $(AVOCADO_TAGS),,
>          \
> >>> +                       --filter-by-tags-include-empty
>           \
> >>> +                       --filter-by-tags-include-empty-key)
>          \
> >>> +               --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)
>          \
> >>> +            $(AVOCADO_CMDLINE_TAGS)
>           \
> >>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),
>          \
> >>>               "AVOCADO", "tests/avocado")
> >>>
> >>>   check-acceptance-deprecated-warning:
> >>> diff --git a/tests/requirements.txt b/tests/requirements.txt
> >>> index 0ba561b6bd..a6f73da681 100644
> >>> --- a/tests/requirements.txt
> >>> +++ b/tests/requirements.txt
> >>> @@ -2,5 +2,5 @@
> >>>   # in the tests/venv Python virtual environment. For more info,
> >>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> >>>   # Note that qemu.git/python/ is always implicitly installed.
> >>> -avocado-framework=3D=3D88.1
> >>> +avocado-framework=3D=3D101.0
> >>>   pycdlib=3D=3D1.11.0
> >>> --
> >>> 2.39.2
> >>>
> >>
> >> I thought there were test failures that prohibited us from bumping the
> >> Avocado-Framework version. Did those get rectified recently?
>
> No, still not working on Darwin. At this point I'm thinking at sending
> a patch clarifying testing QEMU with Avocado is not supported on Darwin.
>

What's broken on Darwin?

Is it broken with avocado-framework=3D=3D88.1 too? (Is this a regression?)

We might need to consider entirely separate issues:

(1) We need to upgrade avocado-framework to a supported LTS version >=3D v9=
0
for dependency harmony with qemu.git/python testing

(2) We need to upgrade avocado-framework to >=3D v101.0 to fix the stated
checksum issue in this patch

(3) We would like avocado tests to work on Darwin. (Have they ever worked?
When did they break? etc.)

My understanding is that this patch helps with 1 and 2 but not 3, but if
Darwin support isn't a regression, this is still a step forward.


> > I'm not seeing any with your patch applied.
>
> Are you using running the Cirrus-CI jobs?
>
>

--00000000000054679405f9c76538
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 20, 2023, 5:19 AM Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On 17/4/23 19:44, Alex Benn=C3=
=A9e wrote:<br>
&gt; <br>
&gt; John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" re=
l=3D"noreferrer">jsnow@redhat.com</a>&gt; writes:<br>
&gt; <br>
&gt;&gt; On Mon, Apr 17, 2023 at 9:43=E2=80=AFAM Alex Benn=C3=A9e &lt;<a hr=
ef=3D"mailto:alex.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">a=
lex.bennee@linaro.org</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; From: Kautuk Consul &lt;<a href=3D"mailto:kconsul@linux.vnet.i=
bm.com" target=3D"_blank" rel=3D"noreferrer">kconsul@linux.vnet.ibm.com</a>=
&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Avocado version 101.0 has a fix to re-compute the checksum<br>
&gt;&gt;&gt; of an asset file if the algorithm used in the *-CHECKSUM<br>
&gt;&gt;&gt; file isn&#39;t the same as the one being passed to it by the<b=
r>
&gt;&gt;&gt; avocado user (i.e. the avocado_qemu python module).<br>
&gt;&gt;&gt; In the earlier avocado versions this fix wasn&#39;t there due<=
br>
&gt;&gt;&gt; to which if the checksum wouldn&#39;t match the earlier<br>
&gt;&gt;&gt; checksum (calculated by a different algorithm), the avocado<br=
>
&gt;&gt;&gt; code would start downloading a fresh image from the internet<b=
r>
&gt;&gt;&gt; URL thus making the test-cases take longer to execute.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Bump up the avocado-framework version to 101.0.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Kautuk Consul &lt;<a href=3D"mailto:kconsul@lin=
ux.vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">kconsul@linux.vnet.ib=
m.com</a>&gt;<br>
&gt;&gt;&gt; Tested-by: Hariharan T S &lt;<a href=3D"mailto:hariharan.ts@li=
nux.vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">hariharan.ts@linux.v=
net.ibm.com</a>&gt;<br>
&gt;&gt;&gt; Message-Id: &lt;<a href=3D"mailto:20230327115030.3418323-2-kco=
nsul@linux.vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">2023032711503=
0.3418323-2-kconsul@linux.vnet.ibm.com</a>&gt;<br>
&gt;&gt;&gt; Message-Id: &lt;<a href=3D"mailto:20230330101141.30199-10-alex=
.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">20230330101141.301=
99-10-alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; v2<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 - limit --max-parallel-tasks $(JOBS_OPTION:-j%=3D=
%)<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0tests/Makefile.include | 18 +++++++++++-------<br>
&gt;&gt;&gt;=C2=A0 =C2=A0tests/requirements.txt |=C2=A0 2 +-<br>
&gt;&gt;&gt;=C2=A0 =C2=A02 files changed, 12 insertions(+), 8 deletions(-)<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/tests/Makefile.include b/tests/Makefile.include<b=
r>
&gt;&gt;&gt; index 9422ddaece..a4de0ad5a2 100644<br>
&gt;&gt;&gt; --- a/tests/Makefile.include<br>
&gt;&gt;&gt; +++ b/tests/Makefile.include<br>
&gt;&gt;&gt; @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv<br>
&gt;&gt;&gt;=C2=A0 =C2=A0# download all vm images, according to defined tar=
gets<br>
&gt;&gt;&gt;=C2=A0 =C2=A0get-vm-images: check-venv $(patsubst %,get-vm-imag=
e-fedora-31-%, $(FEDORA_31_DOWNLOAD))<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +JOBS_OPTION=3D$(lastword -j1 $(filter-out -j, $(filter -j%,$(=
MAKEFLAGS))))<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0check-avocado: check-venv $(TESTS_RESULTS_DIR) get=
-vm-images<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command, \<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTS_PYTHON) -m =
avocado \<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --show=3D$(AVOCADO_=
SHOW) run --job-results-dir=3D$(TESTS_RESULTS_DIR) \<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(AVOCADO_TAGS=
),, --filter-by-tags-include-empty \<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0--filter-by-tags-include-empty-key) \<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(AVOCADO_CMDLINE_T=
AGS) \<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(GITLAB_CI),,=
--failfast) $(AVOCADO_TESTS), \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTS_PYTHON) -m =
avocado=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --show=3D$(AVOCADO_=
SHOW) run --job-results-dir=3D$(TESTS_RESULTS_DIR)=C2=A0 \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(AVOCADO_TAGS=
),,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0--filter-by-tags-include-empty=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0--filter-by-tags-include-empty-key)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--max-=
parallel-tasks $(JOBS_OPTION:-j%=3D%)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(AVOCADO_CMDLINE_T=
AGS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(if $(GITLAB_CI),,=
--failfast) $(AVOCADO_TESTS),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;AV=
OCADO&quot;, &quot;tests/avocado&quot;)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0check-acceptance-deprecated-warning:<br>
&gt;&gt;&gt; diff --git a/tests/requirements.txt b/tests/requirements.txt<b=
r>
&gt;&gt;&gt; index 0ba561b6bd..a6f73da681 100644<br>
&gt;&gt;&gt; --- a/tests/requirements.txt<br>
&gt;&gt;&gt; +++ b/tests/requirements.txt<br>
&gt;&gt;&gt; @@ -2,5 +2,5 @@<br>
&gt;&gt;&gt;=C2=A0 =C2=A0# in the tests/venv Python virtual environment. Fo=
r more info,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0# refer to: <a href=3D"https://pip.pypa.io/en/stab=
le/user_guide/#id1" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/pip.pypa.io/en/stable/user_guide/#id1</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0# Note that qemu.git/python/ is always implicitly =
installed.<br>
&gt;&gt;&gt; -avocado-framework=3D=3D88.1<br>
&gt;&gt;&gt; +avocado-framework=3D=3D101.0<br>
&gt;&gt;&gt;=C2=A0 =C2=A0pycdlib=3D=3D1.11.0<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.39.2<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I thought there were test failures that prohibited us from bumping=
 the<br>
&gt;&gt; Avocado-Framework version. Did those get rectified recently?<br>
<br>
No, still not working on Darwin. At this point I&#39;m thinking at sending<=
br>
a patch clarifying testing QEMU with Avocado is not supported on Darwin.<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Wha=
t&#39;s broken on Darwin?=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Is it broken with avocado-framework=3D=3D88.1 too? (Is this a reg=
ression?)</div><div dir=3D"auto"><br></div><div dir=3D"auto">We might need =
to consider entirely separate issues:</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">(1) We need to upgrade avocado-framework to a supported LTS v=
ersion &gt;=3D v90 for dependency harmony with qemu.git/python testing</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">(2) We need to upgrade avoca=
do-framework to &gt;=3D v101.0 to fix the stated checksum issue in this pat=
ch</div><div dir=3D"auto"><br></div><div dir=3D"auto">(3) We would like avo=
cado tests to work on Darwin. (Have they ever worked? When did they break? =
etc.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">My understanding i=
s that this patch helps with 1 and 2 but not 3, but if Darwin support isn&#=
39;t a regression, this is still a step forward.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
&gt; I&#39;m not seeing any with your patch applied.<br>
<br>
Are you using running the Cirrus-CI jobs?<br>
<br>
</blockquote></div></div></div>

--00000000000054679405f9c76538--
