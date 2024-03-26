Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1258277ejj;
        Tue, 26 Mar 2024 03:57:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxd5F88D94/2/FJvPzzqElqvuBzk9Y0z92ROmvhbPqc1osjslVTU2yZNB1O9Diqp7tlx+6noLMFnGhHp/mIVbGyAabMuAj
X-Google-Smtp-Source: AGHT+IF5HIsgq5fgYXOxx9J8M920n13uOy7wk1DBXYlXtaE2/hxHXcd78udqi7PRd72RBBqYvbTZ
X-Received: by 2002:a05:622a:202:b0:431:1e2d:a638 with SMTP id b2-20020a05622a020200b004311e2da638mr721380qtx.43.1711450665422;
        Tue, 26 Mar 2024 03:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711450665; cv=none;
        d=google.com; s=arc-20160816;
        b=tkh/9qQmdo5b+bv/BmRUG/K8niMZLxc4DtSEHViVOxKHyPDEMx+JEfZUPID+p15cX2
         oQEwshLwfyl/O6VA2DXA8onGyTyHXAlCvXvDa6W8zTP5tKos+ZkSFJjco04DG9Kk6bFW
         Z/T9Z/7ZQYrKfx3VvQRJK+ufLk/7O3L39UGDyc5PekenvEd5x/noId6tKWnSbSpgWrDa
         thNMGqznsfpMdttPemLhMYW89pJ0gC06N6x6fr9GBjxTjSNkF2qAOyUVVYiBsWLcAG6Y
         oghbluF09axm6WYw7lKsk8wGZySsfRuP6WacL6Ub13iCB+qtRuUvk9DkI4w+FupvP4x9
         GGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=hsAuvtjcGMknxupq7dt0Tx5jDHTx3kFzc8XXDd0b8jY=;
        fh=+8z5BiqZKMGZ0zVC89rxr28L/OHZ+FIAjNMKA3AFSTg=;
        b=htAiVE7wKV7Ix0R/qPMkCc2DYuXDkUx6j/yaFU4QMci2Hn7XbjU+0hVZYRF2q5cQRc
         8LAbeLQshRn19s2wJvd9I3vfSg60U9+uobjd4bALJmQlWfekDu/AaBnmrX5VU832fVlE
         wvgt4fXwZZ1Ul00sFEd6VsUS2D/pXOlPHE0zlUjDGMsResvgWvBPjSAtA3qQjNDdHiku
         MoJsF3KMNgLr6p755suxpu1tBz3XIbgsLUQzzVyGBY/F/XJ0cKiYrnMw2b6F8LV2BbbZ
         1oCJUKCB2jbUF2JT/TdstJsIg9YLgJOD5GWhC+xuDXgk9tRPsPL3x5E0SFo1R3N548fJ
         sSBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z2Ed9IKH;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j18-20020ac85c52000000b004315b3c3709si3608172qtj.101.2024.03.26.03.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 03:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z2Ed9IKH;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711450665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsAuvtjcGMknxupq7dt0Tx5jDHTx3kFzc8XXDd0b8jY=;
	b=Z2Ed9IKH+BnT3AhR1hsgntRSKjpCr0zM69cah5u+NvT11pGdeEFwqBQ+GpXYuNelbKJWer
	yCEtJWdEDvR10AhFLQwplSWeMh7P4NgVYknrkTFgZAGDMCQD8JutcnzDp5NCjRHvpe1gAy
	B0OjjMHnqfxlkEOYlUeZ9mgcCX8EeG0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-YsFiHoJlPj6J1yCYNtY6uw-1; Tue,
 26 Mar 2024 06:57:41 -0400
X-MC-Unique: YsFiHoJlPj6J1yCYNtY6uw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA2B0383CD69;
	Tue, 26 Mar 2024 10:57:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E4E1492BC4;
	Tue, 26 Mar 2024 10:57:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8667721E668C; Tue, 26 Mar 2024 11:57:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Anton Johansson
 <anjo@rev.ng>,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
  Eduardo Habkost <eduardo@habkost.net>,  Claudio Fontana
 <cfontana@suse.de>,  Richard Henderson <richard.henderson@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Zhao Liu <zhao1.liu@intel.com>,
  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH-for-9.1 06/21] target/i386: Make X86_CPU common to new
 I386_CPU / X86_64_CPU types
In-Reply-To: <20240315130910.15750-7-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 15 Mar 2024 14:08:54
 +0100")
References: <20240315130910.15750-1-philmd@linaro.org>
	<20240315130910.15750-7-philmd@linaro.org>
Date: Tue, 26 Mar 2024 11:57:35 +0100
Message-ID: <87h6gtp8f4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-TUID: Jt68c6FqEf/6

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> "target/foo/cpu-qom.h" can not use any target specific definitions.
>
> Currently "target/i386/cpu-qom.h" defines TYPE_X86_CPU depending
> on the i386/x86_64 build type. This doesn't scale in a heterogeneous
> context where we need to access both types concurrently.
>
> In order to do that, introduce the new I386_CPU / X86_64_CPU
> types, both inheriting a common TYPE_X86_CPU base type.
>
> Keep the current "base" and "max" CPU types as 32 or 64-bit,
> depending on the binary built.
>
> Adapt the cpu-plug-test, since the 'base' architecture is now
> common to both 32/64-bit x86 targets.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

[...]

> diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
> index 7f5dd5f85a..97316d131f 100644
> --- a/tests/qtest/cpu-plug-test.c
> +++ b/tests/qtest/cpu-plug-test.c
> @@ -90,7 +90,7 @@ static void add_pc_test_case(const char *mname)
>      data->machine =3D g_strdup(mname);
>      data->cpu_model =3D "Haswell"; /* 1.3+ theoretically */
>      data->device_model =3D g_strdup_printf("%s-%s-cpu", data->cpu_model,
> -                                         qtest_get_arch());
> +                                         qtest_get_base_arch());
>      data->sockets =3D 1;
>      data->cores =3D 3;
>      data->threads =3D 2;

Doesn't build for me:

../tests/qtest/cpu-plug-test.c: In function =E2=80=98add_pc_test_case=E2=80=
=99:
../tests/qtest/cpu-plug-test.c:93:42: error: implicit declaration of functi=
on =E2=80=98qtest_get_base_arch=E2=80=99; did you mean =E2=80=98qtest_get_a=
rch=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   93 |                                          qtest_get_base_arch());
      |                                          ^~~~~~~~~~~~~~~~~~~
      |                                          qtest_get_arch
../tests/qtest/cpu-plug-test.c:93:42: error: nested extern declaration of =
=E2=80=98qtest_get_base_arch=E2=80=99 [-Werror=3Dnested-externs]
../tests/qtest/cpu-plug-test.c:92:47: error: format =E2=80=98%s=E2=80=99 ex=
pects argument of type =E2=80=98char *=E2=80=99, but argument 3 has type =
=E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
   92 |     data->device_model =3D g_strdup_printf("%s-%s-cpu", data->cpu_m=
odel,
      |                                              ~^
      |                                               |
      |                                               char *
      |                                              %d
   93 |                                          qtest_get_base_arch());
      |                                          ~~~~~~~~~~~~~~~~~~~~~
      |                                          |
      |                                          int
