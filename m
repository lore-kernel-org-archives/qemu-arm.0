Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp10507njb;
        Tue, 22 Oct 2024 14:38:00 -0700 (PDT)
X-Received: by 2002:a17:902:d502:b0:20c:7e99:3df2 with SMTP id d9443c01a7336-20fab33acadmr6608335ad.23.1729633080062;
        Tue, 22 Oct 2024 14:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729633080; cv=none;
        d=google.com; s=arc-20240605;
        b=X+U6V7jBBrhZ0ThYMw7F4cs36nNztopcY8rzpxveWxbHOuvpvRFYvwFc6a4A8r5+IL
         iVCn+5c1kS5CuRjWLayG4a6L2ZFtay7UUhDjufeRp+/WsCV6BUYqJLWQxekWZo7FYbYt
         SN1JmQ023+QRipDwj65SsQfhmrwqfnozd9KIOsjzk1SEp1BE06xZ7YRcJhOZkcU81vLI
         zM1R+nR7IIVczOFl75k0Pl0e75aWSUQa+hzQDjkranCXxtPfb1ScGx7miyVqo8IqChjY
         vgwryxgEd0TKI20/JrYf0XtmoAz+i5hnzkALPAKFgPf0GW1nTi/cjBh/k6yBi++G6xhQ
         dSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VUKVknCSlFqFsBqoQ9goFiTR4ArnZOnvNU99XEHFp3w=;
        fh=Nww9TSlvSrZvOpHQt0LxodzM28RhQ/w3CsC046muh1c=;
        b=NvrFCagsPzEzX1GdLnSO7BunF2sBXn6yMNKG9C7EfKJdkiW5C2Q3mTlbhIJ47YStm3
         1Y8x5y+hz50dd3Ho/nUCdkqsPijGMPUdiEWfE8LtIxoXX/eKXXbJs3audbKosU1FA8td
         l21wvcMUOa97XNChQY0gxbNr77LXgp18HKOyHrEK0ZN1jQLZGOokmvvWrkgrtAfxvD6P
         eCSltzi19lcw5SpsAtRnosMtn7rCBUXaE1wtX70in8zd2XIPGW2yVotpWWC65OpwUSUc
         2UD0sPz04kM/+iEhYsa/3k6gnTl38KrdvdFlZDMC9LzesmC7ReTPyc30pEtIYaWjHfCN
         /dGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ivXu8/sP";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7f0f5946sor33684965ad.8.2024.10.22.14.37.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 14:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ivXu8/sP";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729633079; x=1730237879; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUKVknCSlFqFsBqoQ9goFiTR4ArnZOnvNU99XEHFp3w=;
        b=ivXu8/sPLUjayC2IKZmzarNQjpV/Ez188HeVXWkQaMzd+B+5T0AmLknfdEgYMCVGhn
         hcUmH6rW5TmO5njHRIY1nagDndDPuRc8+Ay2+VDTGLKXx08vP/iMZZykbBwALCW68ebE
         6F9SKIlvbe4aK32nsPh06OJDA4rb7d2L3mxYklcl2qJhpAjMISUBSd/cZnE4Ms0OL2+v
         ojngjFtZi6ohdmPHJ9368HHmkjrFkV3eAI6cboWCIrwj3ZVYwtXrTMc4kJOjnGUsqBrf
         B2Un2EzRQqJY4/9oAIF9ty6zzDbojQLYQWLvyyQdr4VzSnXShk5aSxDpBNGMCGq6xwD1
         bwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729633079; x=1730237879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUKVknCSlFqFsBqoQ9goFiTR4ArnZOnvNU99XEHFp3w=;
        b=YgnefnWiNsr7dQghjwovxSCIFIbkTkxlXVilDNKcbYkTNbXO2q8gqmDBR12Xhroy/u
         Bm5TLCVMgTCxA5XH+HL8rvdOM+Lh2/FZPWHdSkw0xkOPXYo4TI0bi+X1mR1mhzRnfN1c
         2+umbjnu07ebgRv3B+43ic0nCkuwKC7Z20NOpKIfAYRA7qQenyPrABlCa92vqymHbeVN
         B6Sg0i8jw5njqS9QIrkdAKonXpDTlS7SHJUegSJtaFYTq/oRJLO7U3aQ1mRrJf9NMWqv
         PIpkfZEvstmOFK5J8TTi5wM8zOax4tolurMVTvVuEvqOJ0z8XnFaCd8snERMuZ2GN7d1
         26LQ==
X-Gm-Message-State: AOJu0YwjJTl6IGsjE5cFgjY3RKuSyPkhB2lxwxrNojq2b2GXkIqrNHu2
	CzsxDXsqUU7fkYbLqCDaG7W0fUfLMXhAbTvHKkywdPVchPKztWofVdhW1Lp5V5eanQII/FLSbkM
	akPY=
X-Google-Smtp-Source: AGHT+IHlm9BqHLU0sWEdynV1vM6Mhq6aFCZddq4VYJowPs+Wt47y1RjJ8GqOZOi7QgCpTbYANdT30w==
X-Received: by 2002:a17:903:40c8:b0:20c:62af:a0f0 with SMTP id d9443c01a7336-20e96ebc90emr70643225ad.7.1729633079139;
        Tue, 22 Oct 2024 14:37:59 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.49] ([45.176.88.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef152d3sm46951595ad.117.2024.10.22.14.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 14:37:58 -0700 (PDT)
Message-ID: <79577df9-fe51-46e6-9b70-01ae03ef4dae@linaro.org>
Date: Tue, 22 Oct 2024 18:37:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/20] tests/tcg: enable basic testing for
 aarch64_be-linux-user
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 devel@lists.libvirt.org, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Zhao Liu <zhao1.liu@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-14-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241022105614.839199-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oj3sCnxx3oV7

On 22/10/24 07:56, Alex Bennée wrote:
> We didn't notice breakage of aarch64_be because we don't have any TCG
> tests for it. However while the existing aarch64 compiler can target
> big-endian builds no one packages a BE libc. Instead we bang some
> rocks together to do the most basic of hello world with a nostdlib
> syscall test.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - fix checkpatch complaints
> ---
>   configure                            |  5 ++++
>   tests/tcg/aarch64_be/hello.c         | 35 ++++++++++++++++++++++++++++
>   tests/tcg/Makefile.target            |  7 +++++-
>   tests/tcg/aarch64_be/Makefile.target | 17 ++++++++++++++
>   4 files changed, 63 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/aarch64_be/hello.c
>   create mode 100644 tests/tcg/aarch64_be/Makefile.target


> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 2da70b2fcf..9722145b97 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -103,9 +103,14 @@ ifeq ($(filter %-softmmu, $(TARGET)),)
>   # then the target. If there are common tests shared between
>   # sub-targets (e.g. ARM & AArch64) then it is up to
>   # $(TARGET_NAME)/Makefile.target to include the common parent
> -# architecture in its VPATH.
> +# architecture in its VPATH. However some targets are so minimal we
> +# can't even build the multiarch tests.
> +ifneq ($(filter $(TARGET_NAME),aarch64_be),)
> +-include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target

ifeq and include once? Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +else
>   -include $(SRC_PATH)/tests/tcg/multiarch/Makefile.target
>   -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
> +endif
