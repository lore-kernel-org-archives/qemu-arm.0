Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6797055ejc;
        Wed, 1 Mar 2023 02:43:13 -0800 (PST)
X-Received: by 2002:a05:6000:c2:b0:2c5:54a7:3646 with SMTP id q2-20020a05600000c200b002c554a73646mr4142854wrx.5.1677667393786;
        Wed, 01 Mar 2023 02:43:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677667393; cv=none;
        d=google.com; s=arc-20160816;
        b=mvwyEA6Pb3pwN+OHEfaVlHBw3YmqLKRwP27FXW1PY33DzGsEVm+dl3wa7LK1qGT7+g
         Hab1Xx7hdchcD8gl/CDPxMLa8fPkFlmKOLbGZj9z4kxGW+4PhjxVEJEx2QDiCZPEgdWt
         8U+Ueea3n295S27lry/+uvy1UFdH1TB6Ov79b03XyKEMR05rMdEfjIHuc0mSpzeWom2H
         Npyl/HhDd93j2AAE+1nLGMadAkmLP8WFgGDJh7/HvmPaMWSjQZzLOfyRQYoL7OC3G9Fr
         6I5cmfcJJcN5v9e7wzu6q41C9LfDxViQUfLC1r40AysR3tcDVnklBWruG9m8Ww174xRi
         EC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wsXQUeyFAJEfxTkVDZ8mG6U2/zmfD/nyfojNaH3hanc=;
        b=EriNnWKDJj/tUbB3TkO44zdY4FL4HrwGjIOufYBagY3p4N/x60qVhCCd9pafhIQsVu
         QvI91kGfzWK7KHkEQWykslx46qj8jHpV8hmPCejdaJRrzBtpLw9F96+S8o210wgJFcia
         7PFHUh/xCU7C86MZhq/ColJ0kAc+nt+yJZWaACh9AzDDxa9IZbun8WYAHMaULKqNFoLh
         +QnInGSvDN0zz51pn2jqmmEVBBjJrmU98rFHNzYOlewKASaqSmhXSDegYw8yehRw4Ud9
         vAVMkUA5U5JFdPpR8ecaO5XAKVuyjrPpdDVlRm9Ob/EGRPUebz+wwrcv5/1rApRHethl
         bLPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GP8tM9iP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n16-20020a5d4210000000b002c5540ab092sor4550799wrq.36.2023.03.01.02.43.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Mar 2023 02:43:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GP8tM9iP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677667393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wsXQUeyFAJEfxTkVDZ8mG6U2/zmfD/nyfojNaH3hanc=;
        b=GP8tM9iPve8HnXuaAIybtDFWT8js59UZB4B3pGdung1vtXlRhMuioYiedLXBSGljY5
         ddWehVh9DvKPvWgcb8X67bjOmU40diKRZXwrqJxmuf5m8OgjJ5+keVRuO43NYIs7UGHi
         0sSbgE53+EkfOzaeTeo2KMLjoWthaEob2fSBS9L080CNDLZZK2CckWGrgMGA5c7l17Mt
         bJQ+4MLPXiwi2KVMpoN12jE9urBpBCaqWc2rMHSlBaU/Z58Y4B8UzjK/+r2ZdeiYnWEG
         aRIHODZ1SfKEfhYMr8sRIQPpHRfo6QxHS1rY4QRwcYSS+zOIhjoTKwYWOu81BY951zrM
         J2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677667393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsXQUeyFAJEfxTkVDZ8mG6U2/zmfD/nyfojNaH3hanc=;
        b=1hLMm0Cd6YZaSh4QqUm5lg30zL2LI/YEE4atXaOqcfIzgmDns0nWzVjDTmwyEmzLkV
         lTz4OQJ9dHlfSSfBhNdqJJlgosq4pCbZ7oXQJpVvX1dKvVs7YZPyz2pyw+eC3ZjAxHNy
         IVjoqrCed6m1UqOM/IXe63IjT9on2aI/uStzyrRG4TcLFRulE1fpsmt8OVhmWJNCFmS/
         whMIkJfeoCfCcQxAnwKrI004wXEWQAhHlqMBsSzPRewXmdzbKlC7pfJ3N7sMFVVwCcdy
         3shh/OJVVlULa673Pn2ddP56nGfCVAsOy5YbAFtbTWqFfWfymAvqPhES2+hFoQGwNt4E
         CRLQ==
X-Gm-Message-State: AO0yUKXLZ3nKcp8R5iJsMLuDnZx98ekpsBpwLc8ZOf39il/k+kljNRmx
	EsRhCPD+pXcw0BrseiwFbZ0ubsvnjz8mM7+KIak=
X-Google-Smtp-Source: AK7set82yOLVwxB/Uu1gOKUcv6EEtoOKnkCy9Yj9L8IqihaYCIOUAhAQnEUh4EAcXmkSFyk8SARBeg==
X-Received: by 2002:a5d:40ca:0:b0:2c7:4ec:8d79 with SMTP id b10-20020a5d40ca000000b002c704ec8d79mr4007883wrq.21.1677667393202;
        Wed, 01 Mar 2023 02:43:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id a2-20020adfdd02000000b002c3f03d8851sm12512961wrm.16.2023.03.01.02.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 02:43:12 -0800 (PST)
Message-ID: <8e982d42-4b3a-7334-8f13-44c3c58da1a3@linaro.org>
Date: Wed, 1 Mar 2023 11:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cpoJSuh7SFdN

On 28/2/23 20:06, Alex Bennée wrote:
> To avoid lots of copy and paste lets deal with artefacts in a
> template. This way we can filter out most of the pre-binary object and
> library files we no longer need as we have the final binaries.
> 
> build-system-alpine also saved .git-submodule-status so for simplicity
> we bring that into the template as well.
> 
> As an example the build-system-ubuntu artefacts before this patch
> where around 1.3 GB, after dropping the object files it comes to 970
> MB.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>   2 files changed, 46 insertions(+), 51 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index cb96b55c3f..a6cfe9be97 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -25,6 +25,22 @@
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>         fi
>   
> +# We jump some hoops in common_test_job_template to avoid
> +# rebuilding all the object files we skip in the artifacts
> +.native_build_artifact_template:
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +      - .git-submodule-status
> +    exclude:
> +      - build/**/*.p
> +      - build/**/*.a.p
> +      - build/**/*.fa.p
> +      - build/**/*.c.o
> +      - build/**/*.c.o.d
> +      - build/**/*.fa

Why not exclude "build/**/*.a", was there some issue?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
