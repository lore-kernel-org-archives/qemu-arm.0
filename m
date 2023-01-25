Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp202168ejc;
        Tue, 24 Jan 2023 23:58:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/iOHtOnUMNqt7h/4M+hi9+q1scaq2Mc9JpsC4IeMPAp2AnWANRI2I5I4/fhAb5MoCI07CR
X-Received: by 2002:a05:622a:1787:b0:3b6:4731:1d0b with SMTP id s7-20020a05622a178700b003b647311d0bmr2274947qtk.16.1674633514621;
        Tue, 24 Jan 2023 23:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674633514; cv=none;
        d=google.com; s=arc-20160816;
        b=m45BdEyYkxUYapVlvIFvaEO4hm1lzHv37s+RmSz31FfZ2U6WjAfaZFaCKIMNZ/rD1p
         g6N9erG06oPQV4CRJAzRHkgVlA/gWNZ8QZ5m/9QDTOfKi1d/WI9CPe3gT6gjA6RA2YjQ
         EYP27BQz+L9g0PnzEBVOfXr/DRZBdBeJUdqvEZkTiCgXucSmeOo7H+LvEhv8ln3cnJCD
         SHcsWXMuHv3GPmuDgiLNS9ne288wXq4fKRP2k2OQ9f/9Pb+C4rBQ0uJ1ucb0j/zhvXSP
         PGjHjFqBBLoVEdSBTpIP11EakLJOON1oynGM0N/nLI0ssfgII+L353IGh0/7ZTg1YNJn
         Ui2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Fv886kjrQJymLC26y6gcI9Cr3G7XhDYkbOZY3nZbwqU=;
        b=gp3NwKpjfPqZPYM9DV5rFqhuh0wf+F5oaQnbsHp0EX7PaLesi6J7AjTXwecyxCUHfA
         ThxSaRBgaKa3fBFe1Mu0fnwlEIKcjvsr7DgkW6DDH+MSoWnfK/KA9Jd7PpPaW+ffhM6R
         fsPhIm62/fM1galQr1mIhtUx0TgKfdNphJzJUnW4U1jeyO30rYlhAf4e7LszQgKpWPxX
         VNznmaE0CcIxCw+nb7Rw/5p5W8b8nfX1hYPk9/sEG1m+TIT1rDADTlJKiT8YSJqQwBaL
         JJt6qI+2OvXC8ZkERtK6CMli/tbKBsdMdB6sy/slwTbNwpJMemmRL6iHgXnvbEEd3ShP
         t7vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M1EiXegY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ay5-20020a05622a228500b003a584259797si3359374qtb.315.2023.01.24.23.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:58:34 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M1EiXegY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674633514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fv886kjrQJymLC26y6gcI9Cr3G7XhDYkbOZY3nZbwqU=;
	b=M1EiXegYdWIsZhE+vdXzU5+1/gqB1tiXf0pDf8Yi+7tYzurUXD3qTIDr0NojfFb/8ztVD1
	24w/wWrOoqJuvdhUlJyTTKcaVF5XKYEsvJK4fVyCpsZcgW8dwFtzsI5+6l/icVy+Jmlf4E
	FADAg6m92rdVh6ogal2tNeN1sPbsgis=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-250-wUZZsPrfNQG-PFp17nDs_g-1; Wed, 25 Jan 2023 02:58:33 -0500
X-MC-Unique: wUZZsPrfNQG-PFp17nDs_g-1
Received: by mail-qk1-f198.google.com with SMTP id de37-20020a05620a372500b00707391077b4so12542587qkb.17
        for <alex.bennee@linaro.org>; Tue, 24 Jan 2023 23:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv886kjrQJymLC26y6gcI9Cr3G7XhDYkbOZY3nZbwqU=;
        b=znaEW6MVxVneQ+15qkFFTpsUtZvui0yVwhIsQ3xZNyJqAv1h6c6IcrdaXTpOgK18Zz
         4vsOS6AB844yO5GHnkIE8DYAVvu8nBDZ9a80VoAm5u6BdZTYvZ3pxix15jtum2YKrC0O
         5/B3LL3OcSTHmsAfg99u1jE2D5gG2+GH1cl+UA0C1nIQQ+eDZTV9osZRrW/7dKpcMiNy
         Noq6cndjbhh18+buwMLwMwYjXlS8qFhmPENBAHEPaL+9Ax2uu2bFU11q3Py3mwU9s95K
         dD6FzM5TLeuuE8XIc1hRAGibGEHcImJeerZvPHjMmKtDy8dcYQWiWmzTU9ZMzHep2qRL
         of6Q==
X-Gm-Message-State: AFqh2kprnM2tTLTviCNas2SP3QIpYj7NSZi6+WhKiibsY+bXI4VPWVyw
	k5ZWm1/YJNTTTfKHvhJGNVeryJYh8nccvX9kK+mRGJ9KaRNVtSEOuQM3oQ9G9wJuOm8be/QeCeP
	7gLNAtfRksZLayz2Ku57NTFsPkDuOK3Gr9i1XwHHqtT3x0TU4zmaD79zJjioWBPJR
X-Received: by 2002:ac8:1301:0:b0:3b6:2cc8:e120 with SMTP id e1-20020ac81301000000b003b62cc8e120mr41384744qtj.39.1674633512489;
        Tue, 24 Jan 2023 23:58:32 -0800 (PST)
X-Received: by 2002:ac8:1301:0:b0:3b6:2cc8:e120 with SMTP id e1-20020ac81301000000b003b62cc8e120mr41384699qtj.39.1674633512070;
        Tue, 24 Jan 2023 23:58:32 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de. [109.43.178.209])
        by smtp.gmail.com with ESMTPSA id e2-20020ac80642000000b0039cba52974fsm2791620qth.94.2023.01.24.23.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:58:31 -0800 (PST)
Message-ID: <f21ac8e6-911f-b156-18ff-3929d89ba3d1@redhat.com>
Date: Wed, 25 Jan 2023 08:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 20/35] docs: add a new section to outline emulation
 support
In-Reply-To: <20230124180127.1881110-21-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fDyMDgo/8J0h

On 24/01/2023 19.01, Alex Bennée wrote:
> This affects both system and user mode emulation so we should probably
> list it up front.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - HPs -> HP's
>    - MIPs-like -> MIPS-like
> ---
>   docs/about/emulation.rst      | 103 ++++++++++++++++++++++++++++++++++
>   docs/about/index.rst          |   1 +
>   docs/devel/tcg-plugins.rst    |   2 +
>   docs/system/arm/emulation.rst |   2 +
>   4 files changed, 108 insertions(+)
>   create mode 100644 docs/about/emulation.rst
> 
> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
> new file mode 100644
> index 0000000000..bdc0630b35
> --- /dev/null
> +++ b/docs/about/emulation.rst
> @@ -0,0 +1,103 @@
> +Emulation
> +=========
> +
> +QEMU's Tiny Code Generator (TCG) gives it the ability to emulate a

I'd maybe rather say "provides" instead of "gives it".

> +number of CPU architectures on any supported platform. Both

I'd maybe add a "host" between "supported" and "platform.

> +:ref:`System Emulation` and :ref:`User Mode Emulation` are supported
> +depending on the guest architecture.
> +
> +.. list-table:: Supported Guest Architectures for Emulation
> +  :widths: 30 10 10 50
> +  :header-rows: 1
> +
> +  * - Architecture (qemu name)
> +    - System
> +    - User-mode

Maybe just use "User" instead of "User-mode" to make the column smaller?

> +    - Notes
> +  * - Alpha
> +    - Yes
> +    - Yes
> +    - Legacy 64 bit RISC ISA developed by DEC
> +  * - Arm (arm, aarch64)
> +    - Yes
> +    - Yes
> +    - Wide range of features, see :ref:`Arm Emulation` for details
> +  * - AVR
> +    - Yes
> +    - No
> +    - 8 bit micro controller, often used in maker projects
> +  * - Cris
> +    - Yes
> +    - Yes
> +    - Embedded RISC chip developed by AXIS
> +  * - Hexagon
> +    - No
> +    - Yes
> +    - Family of DSPs by Qualcomm
> +  * - PA-RISC (hppa)
> +    - Yes
> +    - Yes
> +    - A legacy RISC system used in HP's old minicomputers
> +  * - x86 (i386, x86_64)
> +    - Yes
> +    - Yes
> +    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
> +  * - Loongarch
> +    - Yes
> +    - Yes
> +    - A MIPS-like 64bit RISC architecture developed in China
> +  * - m68k
> +    - Yes

Would it be possible to link the "Yes" entries in the "System" column to 
corresponding target-*.rst files? E.g. docs/system/target-m68k.rst for the 
m68k entry?

> +    - Yes
> +    - Motorola 68000 variants and ColdFire
> +  * - Microblaze
> +    - Yes
> +    - Yes
> +    - RISC based soft-core by Xilinx
> +  * - MIPS (mips, mipsel, mips64, mips64el)

The table renders very badly for me, the last column is cut off and you need 
to scroll to see its contents. This seems mainly to happen since this MIPS 
entry is very long. Could the information in the parentheses maybe be 
shortened to "(mips*)" or be dropped completely?

  Thomas
