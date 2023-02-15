Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp845182ejb;
        Wed, 15 Feb 2023 12:47:50 -0800 (PST)
X-Received: by 2002:adf:dd90:0:b0:2c3:e142:5fd0 with SMTP id x16-20020adfdd90000000b002c3e1425fd0mr2471521wrl.49.1676494070679;
        Wed, 15 Feb 2023 12:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676494070; cv=none;
        d=google.com; s=arc-20160816;
        b=r5zF9LXRXF/P05+5TpQ+GMPCip5DK0TyGlYFOV6jJsEvTVpLofMCiDi0HJzhi+NU9T
         /mrmjorQegJgn1aNNv9SAlgH0bzVbkLYqS8HrWqSG4FevDGk1aNBmmz06Ksr6e4H1a5B
         EwEPZ2RSBmYd7G/Uygruwqe6VBh3ig9zzjXVssfUSw/u79ahEENeidH/k7DLxYZKSC07
         APt47W1M+JR/aOwhRZWCiWQrXRE+/V/7uvPkYgY+xbz9N9MmZ4Eajw4EsfsI2LPbRjHN
         NS7QjyXq8OSVBD0dJCj9kVfaNHabvtAn0kq3wSxfmHVY6u3qc+TFH0b646DQobpD73wC
         pMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XRuaB8/vPk6Sla2dXDUKLD2EFURy/RJZh1AC5WFlsT4=;
        b=AX9D/T2pi12ifRrLNDceLqOqjzzOtILs49SMjSD1XWV6yNOycaDZgCx2Y4fpJ9EYDa
         9DpbsZvELt54DmuzZ6v5HZQYL1ObYy8PgrP/EgMYjq1iiNL20M+7QmMzdpJwHLirKhah
         qW3nLGiI7fUbMGZe0LOQjq7qNC9Tj3EQMCXIiLaquvMpiRYN/Wnm602gswBGfL89yzWq
         i+vNcEkTe14gLCh/5F06hhC+XixlMxuVEVnLgyOIlIYzn3Bw/o7EMg+h54FeDxjQ+5fm
         RhmXrnhBioZzss8VcL2tYrYX9bxG28r+JyUal77An2LXQwZSS1g7Wb55nq7Z2Zhf0kov
         nPDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=coHp6VM2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d13-20020a5d4f8d000000b002c5739bccebsor967682wru.40.2023.02.15.12.47.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Feb 2023 12:47:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=coHp6VM2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRuaB8/vPk6Sla2dXDUKLD2EFURy/RJZh1AC5WFlsT4=;
        b=coHp6VM2/PVem4s/WbbcYLOJ6o5TTbuB4K2euBJj9dd8B4dljL9Xzc6QdSq8S+X5mb
         gVVvDfARsAiO7yZw1Hoi0Wg6f1Di7XCK0FMfzpC+gx4Bb7BYp5oOzfpv8WbQ/SwZsZr4
         Ce//e8hdkKw/xZw8coD9JJaVUZEPn0ei2iPhZG1KiLRCjVESD9pFDeV3BOkdiJIHAIUK
         jcXhMzg/m7YRbQXtPD1q0apd64x9LYpDZ3Lde5QmAQK87JZ8Zp1mjqgiY5f/UcPE7bYe
         2s8+PSgP/vIytAodhAoNqrbIPLhmg7qSgerFRlei2G6vWtgAciISe9WBpxhwlG67rK/m
         U4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRuaB8/vPk6Sla2dXDUKLD2EFURy/RJZh1AC5WFlsT4=;
        b=cGoqlKRxFTNClq3/kzhj3sYfSZv3N35Z/wV0nSLIMkaxW1fd24KdZQOxLBlEaBi/b4
         yRVTTojuSbrsVfWpkci5xFaB6K89zqWXDMsVkbV8lM6Mv34h3oTgKv2I+NNJlXORPTx/
         cgYJEn4XZ5S97PYWh5rBFWNjhgv/sS78uJcrwHiY5AzJIkZ1wg+v3YExPig6Gt5TOYes
         sC68OOrErZMePOOr0sqTf7xaP+vo+wmNC6XqONoTz7UChfg9TqnSbUK9xhsEvodM3Q+i
         IrKLdr71fKQ55ljw7kU2NNbdqrsB3aKRBOUfTtt7Rvalt7dOBMO2dxHJ9i9CB8NLV9xj
         iwUA==
X-Gm-Message-State: AO0yUKXvQlgLxsv86r/J43hBjEo21Ou/mbZG0hdkgzvhXbedDiPN+QUA
	5usTnBXFCVHSLuyZt3ykhMdNED7BRHOlRTlXi5U=
X-Google-Smtp-Source: AK7set/MS246tyonJIbJt9p/td7O+OIlC75gp5hM608FDqTVzU3VZlqteoKR/MXjrclRjfJZ4OArYg==
X-Received: by 2002:adf:e707:0:b0:2c5:550e:fad0 with SMTP id c7-20020adfe707000000b002c5550efad0mr2823553wrm.17.1676494070126;
        Wed, 15 Feb 2023 12:47:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id z17-20020adff751000000b002c57c555010sm70335wrp.28.2023.02.15.12.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:47:49 -0800 (PST)
Message-ID: <791c5a86-09e9-8208-6d71-93bb0eec4d52@linaro.org>
Date: Wed, 15 Feb 2023 21:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 10/12] tests/docker: Use binaries for debian-tricore-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kYy9xnZT78qY

On 15/2/23 20:25, Alex Bennée wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> 
> since binutils is pretty old, it fails our CI repeatedly during the
> compilation of tricore-binutils. We created a precompiled version using
> the debian docker image and download it instead of building it ourself.
> 
> We also updated the package to include a newer version of binutils, gcc,
> and newlib. The default TriCore ISA version used by tricore-as changed
> from the old version, so we have to specify it now. If we don't
> 'test_fadd' fails with 'unknown opcode'.
> 
> The new assembler also picks a new encoding in ld.h which fails the
> 'test_ld_h' test. We fix that by using the newest TriCore CPU for QEMU.
> 
> The old assembler accepted an extra ')' in 'test_imask'. The new one
> does not, so lets remove it.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Message-Id: <20230209145812.46730-1-kbastian@mail.uni-paderborn.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/tricore/macros.h                           |  2 +-
>   tests/docker/dockerfiles/debian-tricore-cross.docker | 10 +++-------
>   tests/tcg/tricore/Makefile.softmmu-target            |  6 +++---
>   3 files changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
