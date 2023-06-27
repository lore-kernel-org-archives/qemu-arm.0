Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1296944ejx;
        Tue, 27 Jun 2023 00:43:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4EASQCFO/GC+L1hLk7o0QkObBge9un08Ynx8y4sXa8KoLQONgCWjC+wBV+o9ZvopSll9Ri
X-Received: by 2002:a05:622a:244:b0:400:813b:2274 with SMTP id c4-20020a05622a024400b00400813b2274mr14020004qtx.15.1687851811849;
        Tue, 27 Jun 2023 00:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687851811; cv=none;
        d=google.com; s=arc-20160816;
        b=WJ5475ksaqnKpes0oTRQdmBeD3frEs+SBx/XViYRuayD2SxTewXamlgETIqZRC9DRh
         fDmrHaHWpeZ4SIJ2MhYV7XuTHsSHYRHYrbW68joiLugJS5zUiuCW1i1g9xQDxNTx/fwS
         r6QlxS1Msy7JlanEpvMt70IOu1/iSLlok+fyPy3NNvCMn0Ho3ZC6m3IIhJD7HLgsvMe/
         conwVhr0CVJ2bjNQtNSqkgJLhw1zJq0qSBNvTWvuwU1A1qwADWTO51rf6ymHOY3ODUpY
         2o6PAEi0wlO1lBTtY3Uxj7gG2JVsYDeYvbFJYPL7MA8HzoTM3wlwjRrIbgz4ENZhicje
         J0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=fPzsXf9iRgTarlJsZEVKN380RiqqxmaILASs5EoYrlE=;
        fh=6QIuYp3bu4WDFqzD8rumM2P76rG3xMuySxYpxtsfyUc=;
        b=BdmjkWewSEiGf7Sfi4GdwOWwkoyBJYm9i5ak+gYdclj0yr8ATuftQF+m4EyZg/S2W7
         Rg9H+kNPB7Ihgv5FsNyzKLQral11TWNRq7Asg4t/2q7wUQjeOYYL9wTg8R1vL7h8vVyD
         0RcYVKu9aT01qsUWVkmGZajrNdOFVqlSMdDQljCuJVlpZi657ozYdHSVeeKxJhtoKtfq
         Nc/sds41aeto0nT+65aPdBXw1PaYLz1gSz9j7WPtDaP/3NS/T791mlCL5kNuLR01LxG2
         eXzpw0T4D0NQsl1DMnD+GbfKHB3pUVtAWHOI/cyFt5sEOPOAkv44n3AvvrEGWOnbIP5l
         46uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UrGobNqN;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n12-20020a05622a040c00b003ff229184afsi2735519qtx.60.2023.06.27.00.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UrGobNqN;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687851811;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fPzsXf9iRgTarlJsZEVKN380RiqqxmaILASs5EoYrlE=;
	b=UrGobNqN0HfhhBitjTwBpf4dRZWahdaIErGar32RMq4HH3kak2Da9OPYXeCMdZOAPLnbj9
	QKwEXRluHGdWMo8XpP0KMxBwMT4A53ce+qH4ijHnEQA/SgOKSNaevWtQUbi1M++wdxTUnp
	YrL1IUPJT8Eb87vlxHkvt5TnQwkkFdY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-tQUpcONtPw-5t9tRwqDKlQ-1; Tue, 27 Jun 2023 03:43:30 -0400
X-MC-Unique: tQUpcONtPw-5t9tRwqDKlQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fa88a6a185so15365475e9.0
        for <alex.bennee@linaro.org>; Tue, 27 Jun 2023 00:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687851809; x=1690443809;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0MhEYloR0BYkYXG4ibAxX0xwlzTpW1u+g01Xv7K5Es=;
        b=CDQ16frg/pSVSSm8jeQ58pS0tqnAweclAL21e0sBMBPMWneS/6FS6xztR6pDUBsy2O
         Drd5uU6955JCzPKyX7RVUR3GidzEcz+8UjzWfTisLfd/6q1FHw16xPO2BcrRl9NSPyIu
         qSA2kKPteGP8h3gkl9GZPAVNiItABiCGL29TB6bTRLX3nn3jghsodEdXuGflFGSuKlOU
         FM5vw0yA9AKUPnzQ4GUjM2ie3iidH1ZxJHMhnZynCuGFBW8ynuNEG+pZuv61KaPLG+cT
         xyCDlwz/K84AVcKCJkCFJRH40e4pxANbEKX1J2JCNwvCxiHD51Ff7+RvVd2OG9nU74py
         xfGg==
X-Gm-Message-State: AC+VfDxpyllUnp/5b1A8GomqdmuqKL8pE1y2/w8ftmkhTOCV19ycSmhK
	VBHU/1E8cSK77VzPvW2gpAtB+86v6x3dualzqtY9jm07kw1i7jL7FqBv/xIZ4cxMA8yJkzBT9B5
	buVT4rZPEuvN86iq+FNQxhHpFxxFgNY/KE5EweQIbkfWKFgkIaj+fY0e9++dNZnS6ZgBzvwAdcc
	thmSk=
X-Received: by 2002:a1c:7212:0:b0:3f5:146a:c79d with SMTP id n18-20020a1c7212000000b003f5146ac79dmr25514819wmc.15.1687851808737;
        Tue, 27 Jun 2023 00:43:28 -0700 (PDT)
X-Received: by 2002:a1c:7212:0:b0:3f5:146a:c79d with SMTP id n18-20020a1c7212000000b003f5146ac79dmr25514754wmc.15.1687851808326;
        Tue, 27 Jun 2023 00:43:28 -0700 (PDT)
Return-Path: <quintela@redhat.com>
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net. [188.85.120.92])
        by smtp.gmail.com with ESMTPSA id y17-20020a1c4b11000000b003f9b24cf881sm12745516wma.16.2023.06.27.00.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:43:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Alexander Bulekov <alxndr@bu.edu>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Alexandre Iooss
 <erdnaxe@crans.org>,
  Thomas Huth <thuth@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Leif Lindholm <quic_llindhol@quicinc.com>,
  Riku Voipio <riku.voipio@iki.fi>,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Bandan
 Das <bsd@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
  Beraldo Leal <bleal@redhat.com>,  Peter Xu <peterx@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Yanan
 Wang <wangyanan55@huawei.com>,  Eduardo Habkost <eduardo@habkost.net>,
  Bin Meng <bmeng.cn@gmail.com>,  qemu-arm@nongnu.org,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Darren Kenny <darren.kenny@oracle.com>,
  Radoslaw Biernacki <rad@semihalf.com>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Qiuhao Li <Qiuhao.Li@outlook.com>,
  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 08/26] tests/qtests: clean-up and fix leak in
 generic_fuzz
In-Reply-To: <20230626215926.2522656-9-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Mon, 26 Jun 2023 22:59:08 +0100")
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
	<20230626215926.2522656-9-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 27 Jun 2023 09:43:26 +0200
Message-ID: <87h6qtcpup.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gkHOF0qCfMPY

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> An update to the clang tooling detects more issues with the code
> including a memory leak from the g_string_new() allocation. Clean up
> the code with g_autoptr and use ARRAY_SIZE while we are at it.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/qtest/fuzz/generic_fuzz.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_f=
uzz.c
> index c525d22951..a4841181cc 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -954,17 +954,14 @@ static void register_generic_fuzz_targets(void)
>              .crossover =3D generic_fuzz_crossover
>      });
> =20
> -    GString *name;
> +    g_autoptr(GString) name =3D g_string_new("");
>      const generic_fuzz_config *config;
> =20
> -    for (int i =3D 0;
> -         i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
> -         i++) {
> +    for (int i =3D 0; i < ARRAY_SIZE(predefined_configs); i++) {
>          config =3D predefined_configs + i;
> -        name =3D g_string_new("generic-fuzz");
> -        g_string_append_printf(name, "-%s", config->name);
> +        g_string_printf(name, "generic-fuzz-%s", config->name);
>          fuzz_add_target(&(FuzzTarget){
> -                .name =3D name->str,
> +                .name =3D g_strdup(name->str),
>                  .description =3D "Predefined generic-fuzz config.",
>                  .get_init_cmdline =3D generic_fuzz_predefined_config_cmd=
line,
>                  .pre_fuzz =3D generic_pre_fuzz,

Once that you are here, what about?
(Yes, I didn't care about the ARRAY_SIZE) but you got the idea.

Reviewed-by: Juan Quintela <quintela@redhat.com>

To your proposal with/without the change that I proposse.

modified   tests/qtest/fuzz/generic_fuzz.c
@@ -954,17 +954,14 @@ static void register_generic_fuzz_targets(void)
             .crossover =3D generic_fuzz_crossover
     });
=20
-    GString *name;
     const generic_fuzz_config *config;
=20
     for (int i =3D 0;
          i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
          i++) {
         config =3D predefined_configs + i;
-        name =3D g_string_new("generic-fuzz");
-        g_string_append_printf(name, "-%s", config->name);
         fuzz_add_target(&(FuzzTarget){
-                .name =3D name->str,
+                .name =3D g_strdup_printf("generic-fuzz-%s", config->name)=
,
                 .description =3D "Predefined generic-fuzz config.",
                 .get_init_cmdline =3D generic_fuzz_predefined_config_cmdli=
ne,
                 .pre_fuzz =3D generic_pre_fuzz,
