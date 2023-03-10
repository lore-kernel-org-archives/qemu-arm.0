Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2166586ejc;
        Fri, 10 Mar 2023 09:44:08 -0800 (PST)
X-Received: by 2002:a05:6a20:748d:b0:d3:45f8:256 with SMTP id p13-20020a056a20748d00b000d345f80256mr662414pzd.60.1678470247905;
        Fri, 10 Mar 2023 09:44:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678470247; cv=none;
        d=google.com; s=arc-20160816;
        b=zTjb2UaHQdiM9aNLcaJJ10is9xvti6qbWxPrmreg4vHdvRDVqBf5FasD9OrJavs0zy
         xP9jbNBH2HYvXTcplkxR96v4XBCFUAMeOEdPYtC7XZkHznQ4d32ZlQiYBPTA13M6gEka
         X7yg9TRqaZRnWLZGOwtgCcdFo4eg9uQS9F+ugfWBSdh1l4tkc5BRJ9TpzDqLwibYEnWb
         VkGRKJTAwjOPLxgXVoOvprfOZUFpamMW6p3nnZreeM6SLKUcAp4wsWOvjt0gT7bUBykh
         i1EyKgK2qsuIBE4ejh4ZUvGRIxjtTK0i3a4EVNkDyd1Qvba4ieo4G5692gbgabdlRxFY
         Hdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tuiZ9a/hiVQeQ2ApwACp7vp+tO3Kq9zcHFaznjM4hZM=;
        b=H8YrCtBqOhilZYJUDIVvmxFxPKCBZUuYq3R4RVAllO3FEXIyopBFJHQ4eMKyk4U1PA
         RCtZPhGl9ILSkukrg1G2j1beMdYhFbuV7o+8WPg/mfNLXiSKI11Mxpus7dRjXXXvRZYH
         eaKP4jPWBrCMW7tcMKYhsQitFNmNqXLi07cRq6ad0qM9jujlgn0BG2sfQKSgHXYb2r5o
         KkgSS6T98+2h9wzEcfLn6wMh9AeiyaDtbEdfLAvGy/koJ4YxM0hJ3xjsRWqJfPGEKjlI
         SfGEEDS6v9w0NQs0Kp2JnGXjjP+/kuc0YdYjWxPbmyCSkIN4o/iK08WD+vHj4NY3rz1L
         FgNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WtmnzrB/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y4-20020aa79e04000000b005a8c1b3fbbesor118069pfq.31.2023.03.10.09.44.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 09:44:07 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WtmnzrB/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678470247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuiZ9a/hiVQeQ2ApwACp7vp+tO3Kq9zcHFaznjM4hZM=;
        b=WtmnzrB/6NPKmeSOvsh5H+YOnGmthqOy41Lzhg4FU0P6R4lR8YhzHxGvnPiD9Rbodh
         qFhkl6dwbaVOX2cmOM9QBAu0EK5KRWfwvmRh0X1sGtPzUsyQOTn1nAkaHcBwo+W5phcC
         1EBnfTzwGXUWBz74fgMJKjKWJ9BuCi5po71XQWxGnoqkZMxmeEwI4DmysQ5kFIpBaLzv
         sQl7nvZd1UWpOVKFngezMHSDpKjk+04fw8fUVof7AxDxZjZz9gkzzN2OMAHC63TQdUDy
         C5UyI4Eh2WLUYLXtA68XZ+xyjhLTWqKMGzjb52XM86/1mqxpZs88v+q8AIOIjMKeWBUA
         irqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678470247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuiZ9a/hiVQeQ2ApwACp7vp+tO3Kq9zcHFaznjM4hZM=;
        b=0a1X3NtpHGL3BbkbA5lxNedKBctkt+757SrRayRpzFD4A/LoCSWvrccdPzjZqJ0tAf
         iAVatMBOAkxrbAxfA4eSu99edkNsKzfqEIiDFLBJk7j+ZGgyD3ZCIzg4DniBhLykyUNp
         42hsLbH2qDaE+aNBkdldHTgjObDA9oLeid3qvQSZ9vKOYi7+Dy9+IVAAxfmE69cj6vQJ
         7KQzzjsK3ws/kER7v+0QW1+sxfulVm1npPB7djwAis6Gmsxt/I06ZMRedHNnTtXTU9DO
         buFPCpesLvBMXi9c7mJTkHKpGrQ/H7br4EX+h1qJyOmx3kJTOsbV8Jctqkhj3vNCfz0/
         7etQ==
X-Gm-Message-State: AO0yUKUj+zNKxCgb4erNFErXZI509RfVJCAtnUtrKcqLlVPnaeKBCdDY
	1Rzu57AQs98v7q4C6Iugr58RdDQuMhwEKKs3iRKvCw==
X-Google-Smtp-Source: AK7set8MBn5nQNQ614WDNWoo8iSCmywBaGJphcvecesaLxN4Hju68G1x5ZI+6XzgIp4QCgcJrE5RxQ==
X-Received: by 2002:a62:63c2:0:b0:5de:3c49:b06 with SMTP id x185-20020a6263c2000000b005de3c490b06mr5360858pfb.3.1678470247266;
        Fri, 10 Mar 2023 09:44:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62? ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
        by smtp.gmail.com with ESMTPSA id 25-20020aa79219000000b005825b8e0540sm76177pfo.204.2023.03.10.09.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 09:44:06 -0800 (PST)
Message-ID: <133f7c48-8b10-8b41-2b33-d593e46eea70@linaro.org>
Date: Fri, 10 Mar 2023 09:44:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310103123.2118519-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gaNtC6tH6LgW

On 3/10/23 02:31, Alex Bennée wrote:
> You need a very new gdb to be able to run with pauth support otherwise
> your likely to hit asserts and aborts. Disable pauth for now until we
> can properly probe support in gdb.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.target | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 9e91a20b0d..8ffde3b0ed 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -84,6 +84,8 @@ TESTS += sha512-vector
>   ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
>   GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
>   
> +run-gdbstub-%: QEMU_OPTS=-cpu max,pauth=off
> +
>   run-gdbstub-sysregs: sysregs
>   	$(call run-test, $@, $(GDB_SCRIPT) \
>   		--gdb $(HAVE_GDB_BIN) \
