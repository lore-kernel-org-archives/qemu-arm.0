Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2188331ejb;
        Mon, 31 Jul 2023 06:51:51 -0700 (PDT)
X-Received: by 2002:a5d:5312:0:b0:313:ee73:cc9a with SMTP id e18-20020a5d5312000000b00313ee73cc9amr7090842wrv.70.1690811511694;
        Mon, 31 Jul 2023 06:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690811511; cv=none;
        d=google.com; s=arc-20160816;
        b=SJxDwrUcFydyx/TFmuB2gA5Y3YkVxgRf0vY66X2Eb+ihyHyi4iqIgFmLwUWrXLebcN
         NK4OFkwIDwfJc+27juPBFp068Dt25UoKECYZlqs2h2p9Ox5KeKJPdCZx/biLJ+D0Nefn
         sHkrnQNsIjRgcqeYi9oBWIUMVCrwc45kHYdZWKtkkzxBztfUR+9mw1ofRy2eRb0115gO
         YlYRd1HVSATjzlZd/6XndsJUIQcHNTsPxJo37Yj9r/MiZiydqw6voBDdQXBo/ZKTocKo
         KoY+arHGCLYfdTc2ib3PEJlZUfY5knYqgKJnZnzOf2YHXGdJQplS3ha4ftgDurGNDxsy
         TrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9C61sNBuLzkP1k7MRGfWxhB6WPJh2Tq71aTnep3VwTY=;
        fh=99M8M+8TD8TDQI1qe/4NtoIvOpLCBIu4dx5efhOEhl4=;
        b=mX2eyGTru+kkNblMdLIcYv8ulR82rdDgcW2UlvOdN3NJ8j5qlIdbC80laued5nFCS7
         ibxxa8qqxt3uKo+pJS3svJ0tOYMBspI/DSadFbATR0YWoGtU4+Y1rTeVUCrBjp/lyW26
         0As8ryInsyrtJOURC4Bw1uymkfNAQ5qzGO7/oz7oE66jQnz+T8gXXLNA5S8lCaAnoZu1
         DMIrtCaVuHl6A6qKnPNx7GDipgSZw/Ei61hVL2n7cirPTDaynBtyFJpmuq6kq3uoln8K
         oq9s1xy/m5GcKSNFMzRYlqXrL5UK4hpY1e4ND14uLsIAKND3dTW+eCDWqzXTiR3Vtwro
         01OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hgL3LJ4U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q29-20020adfab1d000000b0031755246841sor3514610wrc.4.2023.07.31.06.51.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hgL3LJ4U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690811511; x=1691416311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9C61sNBuLzkP1k7MRGfWxhB6WPJh2Tq71aTnep3VwTY=;
        b=hgL3LJ4UbBI66bG/QiBth9eUNg5I+oqxWFsmTMTz1CCwJSbu61BSpk0r/IdaOeHuka
         Gx3C7ghuD3CaQffRhxbvAaISlraH7FmeBl4U/lvb2m6BnJQwHjazCPFTJvbCpgKahCbZ
         0BGtLzVHJ21k4/pyfYFYH0Na+Abts0XOdUYIZqMreN17bT5DnMsMdxAZbUkAYKwQxKDl
         fZlUFoAkHd1QbHHDGDWPHgKT2HRtJsEkUIbJ5eH0KGP1FyzfSuZwfTGPAy11imywQxbH
         qCLJBGB09vPQZWLgHMIFdpBumwCCTuqxcJKIlnVnuIqzPFY+hXkQYxvCbnRH363Tgp9s
         l9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811511; x=1691416311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9C61sNBuLzkP1k7MRGfWxhB6WPJh2Tq71aTnep3VwTY=;
        b=fWVAHlup8eq2Q/Wy+ePeMD6R6pyQNhFY/GEmF0Dn84XUKvRKMoteJkY77NJ2GwZ7Ox
         ymC5o1YkAvWg2p2n/VLkrPcWbgbmTMJ1aZKj67JPA4JMkcNqOtr1RY9LZWcLAkLXW8gq
         Cu5LIIl/2ig4bRzp5yoeWv0ad0ngaC65yqqWa28NtSJwNPYPQ/nlFLZ/ITnAEj3wNqGu
         R32OxmbIXinLgYIp8/jwQSwK6O/LoLLxUj/oGkp5o9de3umHI1Vb31Z24SQk8tG+r1bi
         5NywSEDD7eAERuh0zyjbRIV1BDGVcPz8Bm9CZMVvONLp9btuSON3JZW0fjbYBlcCbCs5
         dpDQ==
X-Gm-Message-State: ABy/qLa2njLl6alvNROG2wW2XIJQFwnT8lFDbMtVEai5Pae3AbR+uPav
	m0JYQryCGBZeN6dyHsKs9OiVqTPXMYyQXDE2+TQxyg==
X-Google-Smtp-Source: APBJJlHILCBJRNZrn5crmer00CWRWg2FEycLAoJ3X2ChQegv8+/byit6ZlNXsw37noTTEhadIYXccw==
X-Received: by 2002:adf:ef05:0:b0:315:8f4f:81b8 with SMTP id e5-20020adfef05000000b003158f4f81b8mr8322326wro.50.1690811511118;
        Mon, 31 Jul 2023 06:51:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.198.42])
        by smtp.gmail.com with ESMTPSA id h4-20020adffa84000000b0031417fd473csm13249602wrr.78.2023.07.31.06.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:51:50 -0700 (PDT)
Message-ID: <f087def2-31f9-f18a-c6e1-03243af04b5e@linaro.org>
Date: Mon, 31 Jul 2023 15:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 02/24] gdbstub: Introduce GDBFeature structure
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-3-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: EuLD7JrF9V41

On 31/7/23 10:43, Akihiko Odaki wrote:
> Before this change, the information from a XML file was stored in an
> array that is not descriptive. Introduce a dedicated structure type to
> make it easier to understand and to extend with more fields.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS             |  2 +-
>   meson.build             |  2 +-
>   include/exec/gdbstub.h  |  9 ++++--
>   gdbstub/gdbstub.c       |  4 +--
>   stubs/gdbstub.c         |  6 ++--
>   scripts/feature_to_c.py | 44 ++++++++++++++++++++++++++
>   scripts/feature_to_c.sh | 69 -----------------------------------------
>   7 files changed, 58 insertions(+), 78 deletions(-)
>   create mode 100755 scripts/feature_to_c.py
>   delete mode 100644 scripts/feature_to_c.sh


> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 7d743fe1e9..bd5bc91dda 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -10,6 +10,11 @@
>   #define GDB_WATCHPOINT_READ      3
>   #define GDB_WATCHPOINT_ACCESS    4
>   
> +typedef struct GDBFeature {
> +    const char *xmlname;
> +    const char *xml;
> +} GDBFeature;
> +
>   
>   /* Get or set a register.  Returns the size of the register.  */
>   typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
> @@ -38,7 +43,7 @@ void gdb_set_stop_cpu(CPUState *cpu);
>    */
>   extern bool gdb_has_xml;
>   
> -/* in gdbstub-xml.c, generated by scripts/feature_to_c.sh */
> -extern const char *const xml_builtin[][2];
> +/* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
> +extern const GDBFeature gdb_features[];
Maybe clearer named gdb_static_features[].
