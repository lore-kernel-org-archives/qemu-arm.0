Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp170605ejv;
        Tue, 7 Nov 2023 00:44:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNvkkEHFz+n1Pv8B6eEySY/Sty8EDpPf2AOVq9m7emKOs1LmemRC469sdpRYV2undhXLtW
X-Received: by 2002:a2e:b4ab:0:b0:2c5:1490:1687 with SMTP id q11-20020a2eb4ab000000b002c514901687mr24497498ljm.33.1699346698231;
        Tue, 07 Nov 2023 00:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699346698; cv=none;
        d=google.com; s=arc-20160816;
        b=FKt5tUgr28G+I+8Kccdh4PK42nnxdyqVBQ73DpsJrlgG9POd6rQubVqg3EDHoffoJS
         RoSwqpLFUnPgTK9QKh1bRlhr4wVHe5aLMTLZkhL26W3kciYQlZZ0Wub+SsNb8KewLU4J
         PUrvhjYLrqVrb9KN85WTrD01As4wpFBh3XWwdxZLcpArFtxu5YawOwIgBISSVVS95Xl8
         mp2DNRFOcbtihBerBhXaY8Sgc/pQDUBb0bRl+CMzoTAJaKQtQpUlJJhN3YaKrk6dHpYV
         KqXPhRH7Lwp5F+c0D15IfrNIZhYiedu4gzj38yB7rGse5PmODVe528M5n0Jk8TukvvNc
         /JOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WxUuRHTbAmo9a5uLXTuAZMzLMu6ttBb84VSvRxeY+mg=;
        fh=RAGOssV366wUL5gHG7GGxkSWCY6MSsF1kaJdJUU7ve8=;
        b=z96zeIakDs7AaE3iPS134zrlDTHZ6a0ZregeLk3amEcZux6LwuRU5JWAa1GDNtPrpI
         1Tzx68rUR8jkEmBFUJh8jcDWnpILIKodPdVueqLBm9gLLy6WqBvBNhku826OJMyM1cYw
         TZip15K2ZCpOemtsjRpyH1Js6LH6dHOvMIorSGCfFH8npmHK84a3uhXHE/FjRpylwgRf
         md67/BpEp3jGlVkybR0ka/qccKzLaqY+isjgIekOTtg8t/HhzxBgbztlG55fkjPUsXcj
         +AXz0zgOrQAa8uUBQ6xw2N9/w6pC2//ctEy9mogb4ndEeD3EThEaBQexWtSs5nnct2c1
         u+oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@univ-grenoble-alpes.fr header.s=2020 header.b=vGMwS0zT;
       spf=pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=univ-grenoble-alpes.fr
Return-Path: <frederic.petrot@univ-grenoble-alpes.fr>
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr. [152.77.200.56])
        by mx.google.com with ESMTPS id t3-20020adfe443000000b003296be9330esi1255185wrm.932.2023.11.07.00.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 00:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) client-ip=152.77.200.56;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@univ-grenoble-alpes.fr header.s=2020 header.b=vGMwS0zT;
       spf=pass (google.com: domain of frederic.petrot@univ-grenoble-alpes.fr designates 152.77.200.56 as permitted sender) smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=univ-grenoble-alpes.fr
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
	by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id BBA5A40358;
	Tue,  7 Nov 2023 09:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=univ-grenoble-alpes.fr; s=2020; t=1699346697;
	bh=oSfmaBcEbkq55xg1KGXlfdCZaOIDymOfchHSS5+5F6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vGMwS0zT3V5QuirBznkUIUpDxNYXhagORGFVC5ooe2FbYNKim5XwwGi/bqLxH1r9/
	 NbN94WMW6sIE/A2gt/lS2BmrIqrfcaiqeF4uKF29IrzOUDgDJTTiRqodeaI3mZAqsD
	 02NIAy2P5axKBPePVBlaazAe7ymoB/l3c/RjfoootZ3ozPWVyld32FUjmv17XVW/SK
	 SgMbfUvMUvzeoJVqhzyt8h06kAESJbJQ8r5+Jjik66wGqFpKoka3woWTamQ06bxnhx
	 IT6tpSs5SZqgyrjea+J/VaMcF3dolT6BIxu8AGnrDr7+fnx35T+1/GU1BSHEUDzS1t
	 o0nVbZj37+5gQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
	by mailhub.u-ga.fr (Postfix) with ESMTP id B3B7410005A;
	Tue,  7 Nov 2023 09:44:57 +0100 (CET)
Received: from [192.168.1.33] (35.201.90.79.rev.sfr.net [79.90.201.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: petrotf@univ-grenoble-alpes.fr)
	by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id C6E91140053;
	Tue,  7 Nov 2023 09:44:53 +0100 (CET)
Message-ID: <4659ec99-9b86-4c91-8ee8-116bff8b48c4@univ-grenoble-alpes.fr>
Date: Tue, 7 Nov 2023 09:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/29] gdbstub: Simplify XML lookup
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Brian Cain <bcain@quicinc.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-18-alex.bennee@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Autocrypt: addr=frederic.petrot@univ-grenoble-alpes.fr; keydata=
 xsDiBEzGfDQRBACnR+QhOOA6gstLMoL8vexXgQ/shw+w6zEsACrydiwCrAXMOQfyozlXyGYf
 XBO0cf4RKMh51NLdgntJbYlOoFalY7iGRwo8U64iy8kHBcXlfdFYGrYFbFYervlMwXoY89D6
 02uMzWK/UossWWWX2PkqfBenmYd0zk+JwghTwY8MVwCgtr1Z52ZRv8vPA7ZLn4WSJLC/qv0D
 /1hBIaSsCAT/nO78oFZq9hzY51GsmiBT88hTofCma2PIotJT9qocJglgqzA9B+2ja4bgXJ1f
 0WFlvxyLTjga8jJ/lcdNpAGi13sFEhP6nyi2Zh2hFhrXlTPH+VtdnjTHSnzK23eLphZJv031
 SxCqEYT6pgJPwwHIWOHyeDZq0ORdA/4+2U4eYUhCGfi9u60L3zRDzUVULScq3vXah1ak1yBs
 Nxz/F1iMYVBUmp4SGSM6XFxVwvJxvSRPD+4zXIkr7+MfIheiXbiSzNoZdH3AwaAK6jGxhfWb
 f8Jm8KuLvGkR2QaS7QT+rhhv0OLEhVBMmm8EXZpsrOV3ZVmE934+WoRDd807RnLDqWTDqXJp
 YyBQw6l0cm90IDxmcmVkZXJpYy5wZXRyb3RAdW5pdi1ncmVub2JsZS1hbHBlcy5mcj7CeAQT
 EQIAOBYhBGyr6EloIPZXrmtYU0QWC1i+uhtgBQJa/b5sAhsDBQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEEQWC1i+uhtgNooAnjAwrIMPDJ+mQr1svgh9+NFFZBUWAJwONXxE5DrxP9OV
 R0tsDROd3EbvXs7BTQRMxnw0EAgA8XI4FU6LH2NryyrydYoopZfixTvfS3rra8Q3UN+eHvuG
 jM4+oebZO+ZZ6KtdGj/RDpXtn0KW6SdFynKuLS5obLx8GGfq1tj5KGep14kr1/BRp3xTqKE+
 rleeWvR1fGXryJhxIV/AQ/tY2Le1ExsgLbD5dbPQKJhpQUlScz6Y1U2UsyxnMV4c7PlCNNb9
 1ZWfxPN8c/w8XBSZDaE5UcBmxYxH9959yte9hsczuzqbMgiGa0DCN+iIgsQOYtD2csDxVQUL
 vxtD530vdTB32tdlmcumIgZCH4X7RyLhdbv1Xj6gcZ9InGf2tRLHbnd0/uPY6qTX/5teXQ7g
 0xzVlvcWQwADBggAvXpFpXACegDPqglkroyA8+LQWNyumsFtcrlAc9mcC5WwDBqNsSeCbGcx
 TXsUckRAC3DpJkzKLbBsFki4fcYEx3tjfJGkknxInPYmOIlKRinSnIMS0qFqXdy37w7vPhqv
 KMLwbeHYronnGUAW0Z//ZXZZTl1KbEeKOEXK2dyE0aLUtoWj/aLwM1c2zuJCctI38GENtRC6
 qaqFzCHKTqxjl7aL1LILSvKQ1sZGKdKjApw5KLoKnk6WbspFIfgIirXoC2gRo/lhhd1ctVZK
 IptiyHp7dw2Rr6TEzjy+Z/rDHVf9lGCzUkMDJHm5XQB8+f/Va5kddgZ9gznRo17IPvR0jcJJ
 BBgRAgAJBQJMxnw0AhsMAAoJEEQWC1i+uhtgg90An139WxG/GTGPRFVQCaxQRkycFiI3AJ40
 aR3/xWYMOEUWfcXpCS8dzPbdDA==
In-Reply-To: <20231103195956.1998255-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr) via submission-587 ACL (42)
X-TUID: ZFHA1ZILMOIw

Hello Alex and Akihiko,

this patch introduces a regression for riscv.
When connecting to gdb, gdb issues the infamous "Architecture rejected
target-supplied description" warning.
As this patch touches "common" QEMU files (not riscv ones that I am
a bit more familiar with and am able to test), I will probably not
be able to come out with a proper patch, so I leave it to you guys.

Fixing this might also fix an other issue with selecting registers on
QEMU command line when using Alex "new" execlog: for riscv there is no
match on the general purpose registers that are given in
gdb-xml/riscv-64bit-cpu.xml.

And by the way thanks for this very useful feature!
Frédéric

Le 03/11/2023 à 20:59, Alex Bennée a écrit :
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Now we know all instances of GDBFeature that is used in CPU so we can
> traverse them to find XML. This removes the need for a CPU-specific
> lookup function for dynamic XMLs.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231025093128.33116-11-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/gdbstub.h |   6 +++
>   gdbstub/gdbstub.c      | 118 +++++++++++++++++++++--------------------
>   hw/core/cpu-common.c   |   5 +-
>   3 files changed, 69 insertions(+), 60 deletions(-)
> 
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index bcaab1bc75..82a8afa237 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -27,6 +27,12 @@ typedef struct GDBFeatureBuilder {
>   typedef int (*gdb_get_reg_cb)(CPUState *cpu, GByteArray *buf, int reg);
>   typedef int (*gdb_set_reg_cb)(CPUState *cpu, uint8_t *buf, int reg);
>   
> +/**
> + * gdb_init_cpu(): Initialize the CPU for gdbstub.
> + * @cpu: The CPU to be initialized.
> + */
> +void gdb_init_cpu(CPUState *cpu);
> +
>   /**
>    * gdb_register_coprocessor() - register a supplemental set of registers
>    * @cpu - the CPU associated with registers
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 4809c90c4a..5ecd1f23e6 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -352,6 +352,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
>   {
>       CPUState *cpu = gdb_get_first_cpu_in_process(process);
>       CPUClass *cc = CPU_GET_CLASS(cpu);
> +    GDBRegisterState *r;
>       size_t len;
>   
>       /*
> @@ -365,7 +366,6 @@ static const char *get_feature_xml(const char *p, const char **newp,
>       /* Is it the main target xml? */
>       if (strncmp(p, "target.xml", len) == 0) {
>           if (!process->target_xml) {
> -            GDBRegisterState *r;
>               g_autoptr(GPtrArray) xml = g_ptr_array_new_with_free_func(g_free);
>   
>               g_ptr_array_add(
> @@ -380,18 +380,12 @@ static const char *get_feature_xml(const char *p, const char **newp,
>                       g_markup_printf_escaped("<architecture>%s</architecture>",
>                                               cc->gdb_arch_name(cpu)));
>               }
> -            g_ptr_array_add(
> -                xml,
> -                g_markup_printf_escaped("<xi:include href=\"%s\"/>",
> -                                        cc->gdb_core_xml_file));
> -            if (cpu->gdb_regs) {
> -                for (guint i = 0; i < cpu->gdb_regs->len; i++) {
> -                    r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> -                    g_ptr_array_add(
> -                        xml,
> -                        g_markup_printf_escaped("<xi:include href=\"%s\"/>",
> -                                                r->feature->xmlname));
> -                }
> +            for (guint i = 0; i < cpu->gdb_regs->len; i++) {
> +                r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> +                g_ptr_array_add(
> +                    xml,
> +                    g_markup_printf_escaped("<xi:include href=\"%s\"/>",
> +                                            r->feature->xmlname));
>               }
>               g_ptr_array_add(xml, g_strdup("</target>"));
>               g_ptr_array_add(xml, NULL);
> @@ -400,20 +394,11 @@ static const char *get_feature_xml(const char *p, const char **newp,
>           }
>           return process->target_xml;
>       }
> -    /* Is it dynamically generated by the target? */
> -    if (cc->gdb_get_dynamic_xml) {
> -        g_autofree char *xmlname = g_strndup(p, len);
> -        const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
> -        if (xml) {
> -            return xml;
> -        }
> -    }
> -    /* Is it one of the encoded gdb-xml/ files? */
> -    for (int i = 0; gdb_static_features[i].xmlname; i++) {
> -        const char *name = gdb_static_features[i].xmlname;
> -        if ((strncmp(name, p, len) == 0) &&
> -            strlen(name) == len) {
> -            return gdb_static_features[i].xml;
> +    /* Is it one of the features? */
> +    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
> +        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> +        if (strncmp(p, r->feature->xmlname, len) == 0) {
> +            return r->feature->xml;
>           }
>       }
>   
> @@ -508,12 +493,10 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
>           return cc->gdb_read_register(cpu, buf, reg);
>       }
>   
> -    if (cpu->gdb_regs) {
> -        for (guint i = 0; i < cpu->gdb_regs->len; i++) {
> -            r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> -            if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
> -                return r->get_reg(cpu, buf, reg - r->base_reg);
> -            }
> +    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
> +        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> +        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
> +            return r->get_reg(cpu, buf, reg - r->base_reg);
>           }
>       }
>       return 0;
> @@ -528,51 +511,70 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>           return cc->gdb_write_register(cpu, mem_buf, reg);
>       }
>   
> -    if (cpu->gdb_regs) {
> -        for (guint i = 0; i < cpu->gdb_regs->len; i++) {
> -            r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> -            if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
> -                return r->set_reg(cpu, mem_buf, reg - r->base_reg);
> -            }
> +    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
> +        r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> +        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
> +            return r->set_reg(cpu, mem_buf, reg - r->base_reg);
>           }
>       }
>       return 0;
>   }
>   
> +static void gdb_register_feature(CPUState *cpu, int base_reg,
> +                                 gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
> +                                 const GDBFeature *feature)
> +{
> +    GDBRegisterState s = {
> +        .base_reg = base_reg,
> +        .get_reg = get_reg,
> +        .set_reg = set_reg,
> +        .feature = feature
> +    };
> +
> +    g_array_append_val(cpu->gdb_regs, s);
> +}
> +
> +void gdb_init_cpu(CPUState *cpu)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    const GDBFeature *feature;
> +
> +    cpu->gdb_regs = g_array_new(false, false, sizeof(GDBRegisterState));
> +
> +    if (cc->gdb_core_xml_file) {
> +        feature = gdb_find_static_feature(cc->gdb_core_xml_file);
> +        gdb_register_feature(cpu, 0,
> +                             cc->gdb_read_register, cc->gdb_write_register,
> +                             feature);
> +    }
> +
> +    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
> +}
> +
>   void gdb_register_coprocessor(CPUState *cpu,
>                                 gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>                                 const GDBFeature *feature, int g_pos)
>   {
>       GDBRegisterState *s;
>       guint i;
> +    int base_reg = cpu->gdb_num_regs;
>   
> -    if (cpu->gdb_regs) {
> -        for (i = 0; i < cpu->gdb_regs->len; i++) {
> -            /* Check for duplicates.  */
> -            s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> -            if (s->feature == feature) {
> -                return;
> -            }
> +    for (i = 0; i < cpu->gdb_regs->len; i++) {
> +        /* Check for duplicates.  */
> +        s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> +        if (s->feature == feature) {
> +            return;
>           }
> -    } else {
> -        cpu->gdb_regs = g_array_new(false, false, sizeof(GDBRegisterState));
> -        i = 0;
>       }
>   
> -    g_array_set_size(cpu->gdb_regs, i + 1);
> -    s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> -    s->base_reg = cpu->gdb_num_regs;
> -    s->get_reg = get_reg;
> -    s->set_reg = set_reg;
> -    s->feature = feature;
> +    gdb_register_feature(cpu, base_reg, get_reg, set_reg, feature);
>   
>       /* Add to end of list.  */
>       cpu->gdb_num_regs += feature->num_regs;
>       if (g_pos) {
> -        if (g_pos != s->base_reg) {
> +        if (g_pos != base_reg) {
>               error_report("Error: Bad gdb register numbering for '%s', "
> -                         "expected %d got %d", feature->xml,
> -                         g_pos, s->base_reg);
> +                         "expected %d got %d", feature->xml, g_pos, base_reg);
>           } else {
>               cpu->gdb_num_g_regs = cpu->gdb_num_regs;
>           }
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index bab8942c30..2a2a6eb3eb 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -27,6 +27,7 @@
>   #include "qemu/main-loop.h"
>   #include "exec/log.h"
>   #include "exec/cpu-common.h"
> +#include "exec/gdbstub.h"
>   #include "qemu/error-report.h"
>   #include "qemu/qemu-print.h"
>   #include "sysemu/tcg.h"
> @@ -223,11 +224,10 @@ static void cpu_common_unrealizefn(DeviceState *dev)
>   static void cpu_common_initfn(Object *obj)
>   {
>       CPUState *cpu = CPU(obj);
> -    CPUClass *cc = CPU_GET_CLASS(obj);
>   
> +    gdb_init_cpu(cpu);
>       cpu->cpu_index = UNASSIGNED_CPU_INDEX;
>       cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
> -    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
>       /* user-mode doesn't have configurable SMP topology */
>       /* the default value is changed by qemu_init_vcpu() for system-mode */
>       cpu->nr_cores = 1;
> @@ -247,6 +247,7 @@ static void cpu_common_finalize(Object *obj)
>   {
>       CPUState *cpu = CPU(obj);
>   
> +    g_array_free(cpu->gdb_regs, TRUE);
>       qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
>       qemu_mutex_destroy(&cpu->work_mutex);
>   }

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot,                            Pr. Grenoble INP-Ensimag/TIMA |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+
