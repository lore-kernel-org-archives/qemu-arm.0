Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1519668njb;
        Fri, 9 May 2025 21:45:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d1:b0:1f8:d245:616d with SMTP id adf61e73a8af0-215abb39886mr7313683637.21.1746852334681;
        Fri, 09 May 2025 21:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746852334; cv=none;
        d=google.com; s=arc-20240605;
        b=fP8V3pv+oDvnMGeZAI3JLK8rlhSx9MF7fyKwXY/uEV+4+IxKFCNUIdlN1IUh3l8hAK
         hG4NQuzcCTghlvwv/EssnsBhZp1F+iCWci4eN/9tdR2unrTBlEvARTgaGc/Ua4OqmG+v
         9ZZbYX25i4tzeFU72L4t59ScUobCQw8n/+r0T/bkoqs2htDcdDLaAJDbnfIXr/qzJ/y1
         cjsgtFZDgo/7FuW+zW23ryteplLo2lx64luRUZOUOuniWmrW1N12scpIyi/i80NmJbpb
         VS6aU1P/VXvkxw888G2PSfxb2gTc5li41q3ZA9B90BL97alCTvSdJ/48rHxCn1YphbWM
         c5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QrSMM4TKtkt+LPkj2y0AwU2n7uM1JNftoyOLUf6bXyA=;
        fh=ZHcH16rPeTNtLnvhEH+sm1+eIB2p2w58S6Iys3eeOi8=;
        b=fO/H1ASv78fae8bIusE3xPiH3/bZ4JIejn9vtZ/oAbTX3Ow/Y6QgqLbJNoUKYIrFdL
         LxLFcxNoL74Geiv+zXpEZLfT5GJeFmA7sEkOeQS9UO3oIjIe161JCQ69hv+A1UIy7CGE
         CldvdnwiN+jhqU4WjfOytL/1KNfioDOK9US0DE3VqcE+TX3w6n1hCFP91h5eSb/Qmv4k
         I3bDjWIOw1o0ltczg/E1NtE0SemDt+iws2eI0E7d0Q/YxkiLZF0mWwdP0wKh8VB21Nxp
         hnM23EWtkCHpXOo26d9RzgFmBPvYmnx7cswnG6uy8+VF+DcmM6LvfQP0SC71lwyqoGxd
         FE+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Snsdr+zM;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b234922eb09sor2614238a12.1.2025.05.09.21.45.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 May 2025 21:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Snsdr+zM;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746852334; x=1747457134; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrSMM4TKtkt+LPkj2y0AwU2n7uM1JNftoyOLUf6bXyA=;
        b=Snsdr+zMxnQvo0aDByBTKheVfVDwSQDk+yJjVzBqRSPHKd7+BFsrsgUlqUHv6ZGwaK
         hvPHNXnwZcRXUUiwRyH6+rkVgMcIeQE3xNGwQGraNhzebHB/V35VL6JCvhFizIj84/k/
         wpd9MZ2hdzTk4DValKggq3Y3hJc9llJoe0mp13vKWC3wWdAanVSUtComc1WheR9gWEDn
         xaajo40wObKGrXmXzWj0cCcIjo8/FYSwFdPmMZoW4auY/BdB17K1u9uHJEtIYE2nBbMm
         ilw5mIsmU7g7nhGWHuel8yNDW4lnEL2+eRxRjnYGtHEcKVTwilPielnNAMOooMgno5AG
         kS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746852334; x=1747457134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrSMM4TKtkt+LPkj2y0AwU2n7uM1JNftoyOLUf6bXyA=;
        b=NPrGyvtCD52SKHjfcTSIRD8/zDjgDTEZZBHWNBbpVGNN4eZ8+eSnGL6TbpaNeZ+5dc
         RjZlulh7rw1G5RTOPiOPxZFIgQWIFFzrlf1plvHrSj307Aq96aPkDcKmp1kqsLsLEMdE
         Fes3agTjttGDODDLKAH6VsJfNafMJFdy7x1Hiu+HqDR+HDOqG2evNsmUg0UnB8phA6Y5
         3kGHTYXd4wmqjx1wAKd0cqxiT2tq4nTbusnlw9WZqN6lQXQazkJsliZTbUMn5MMJ4IYi
         8OuHqbuXBSV2S8+RN9BRTcl40z54Z/zAAMxJtJPrO/Y8xjQvQyU5h/03q3IqMi6H9git
         1Q7Q==
X-Gm-Message-State: AOJu0YxV9UL+IZeELI0coBp5AZhCKH5S1/4RsAkn/ILtOtmCxcgxTLtO
	UhXN083KEFlrpaSlkLRc5M/BrxPB5ThAr5X+NphKCspdw8M+Ed+WbEYcW+SbE0P2Xo/mT9m/GHp
	2
X-Gm-Gg: ASbGncuwvhlxXMFhXrbAy3X/WjUbaK8pjagrM5qv25xmNbjww/5ly3Gv9K+Dc3pN3WH
	UIAC8nB3I5LJ6SpRNgapNQtgXUVSdev2mAuX6He07f27s2GsIrcq7RSDIGczXH43g7O+CUhgA3m
	QtDFXbT1jiTgtzBt+n3gwmGXtrrUfVR+PRKq/BXEQt4Xj7iDIT3K5W5Y37Givc/OvpPmoUVa9eS
	3a1Wm9+U1/rD2BjaQIH1+VJRnLul/aT3mtyGmkfIrZ2tNyBsCHZ8U2lK0VRudAr7ee+CHczQkMf
	RUhWDU7xplXttyGLB4T9P3FE9zx28XhMh2QnJcshLCI+eu/xPcT5ttC93SFiGQ==
X-Google-Smtp-Source: AGHT+IFrYoQEbzLU5wPGDpCzZFJ2jWLYUP+crdH2QfRE3HaxOyAg9RQnpWXBl9AuJI6MXi1y7pJp5w==
X-Received: by 2002:a05:6300:668a:b0:1f5:7007:9ea5 with SMTP id adf61e73a8af0-215ababa3d9mr9801554637.2.1746852334098;
        Fri, 09 May 2025 21:45:34 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b235198cccdsm2265681a12.64.2025.05.09.21.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 21:45:33 -0700 (PDT)
Message-ID: <f0890b48-9b80-4ae7-892a-c45fd3dee089@daynix.com>
Date: Sat, 10 May 2025 13:45:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] contrib/plugins: allow setting of instructions
 per quantum
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
 <20250506125715.232872-7-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250506125715.232872-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lfTvRkRuLBfR

On 2025/05/06 21:57, Alex Bennée wrote:
> The default is we update time every 1/10th of a second or so. However
> for some cases we might want to update time more frequently. Allow
> this to be set via the command line through the ipq argument.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> ---
> v2
>    - checkpatch fixes.
> ---
>   docs/about/emulation.rst |  4 ++++
>   contrib/plugins/ips.c    | 10 +++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
> index a72591ee4d..456d01d5b0 100644
> --- a/docs/about/emulation.rst
> +++ b/docs/about/emulation.rst
> @@ -811,6 +811,10 @@ This plugin can limit the number of Instructions Per Second that are executed::
>     * - ips=N
>       - Maximum number of instructions per cpu that can be executed in one second.
>         The plugin will sleep when the given number of instructions is reached.
> +  * - ipq=N
> +    - Instructions per quantum. How many instructions before we re-calculate time.
> +      The lower the number the more accurate time will be, but the less efficient the plugin.
> +      Defaults to ips/10
>   
>   Other emulation features
>   ------------------------
> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
> index 9b166a7d6c..62ed8ddd08 100644
> --- a/contrib/plugins/ips.c
> +++ b/contrib/plugins/ips.c
> @@ -147,6 +147,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                              const qemu_info_t *info, int argc,
>                                              char **argv)
>   {
> +    bool ipq_set = false;
> +
>       for (int i = 0; i < argc; i++) {
>           char *opt = argv[i];
>           g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
> @@ -177,6 +179,9 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                       return -1;
>                   }
>               }
> +        } else if (g_strcmp0(tokens[0], "ipq") == 0) {
> +            max_insn_per_quantum = g_ascii_strtoull(tokens[1], NULL, 10);

It may be nice to have an error check performed for ips.

> +            ipq_set = true;
>           } else {
>               fprintf(stderr, "option parsing failed: %s\n", opt);
>               return -1;
> @@ -184,7 +189,10 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>       }
>   
>       vcpus = qemu_plugin_scoreboard_new(sizeof(vCPUTime));
> -    max_insn_per_quantum = max_insn_per_second / NUM_TIME_UPDATE_PER_SEC;
> +
> +    if (!ipq_set) {
> +        max_insn_per_quantum = max_insn_per_second / NUM_TIME_UPDATE_PER_SEC;
> +    }
>   
>       if (max_insn_per_quantum == 0) {
>           fprintf(stderr, "minimum of %d instructions per second needed\n",
