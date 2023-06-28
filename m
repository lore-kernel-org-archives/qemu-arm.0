Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp2161187ejx;
        Wed, 28 Jun 2023 13:09:52 -0700 (PDT)
X-Received: by 2002:a5d:6151:0:b0:313:fff0:ff44 with SMTP id y17-20020a5d6151000000b00313fff0ff44mr5090842wrt.38.1687982992446;
        Wed, 28 Jun 2023 13:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687982992; cv=none;
        d=google.com; s=arc-20160816;
        b=qAB62cAKrr/bTRFAhFXg+W4faiWbcuf+ukERt/X8MX/AC4rnPJ0lIp6DAOORsvi84m
         pjmgmQjuMaYAuQXux8Ts3sFmMcIKvlnzESoi+L2JFycd824MCgeCtQ2KoVKaFxrjRnQn
         kxzd3l6aGQK1y9JG7NvnkY9U5sWceRuX6yir2GGPKQOLmtsU+g+72yBzh+MZx+KQIMgF
         wNMJ/ytABLVwYZouVnVdC8Pp7Ke8skNZ4NI/27ZmOrW47g6DYdlflZofXlg26ZHEAG7q
         Lyy4L1yHkIsMQYRzeZYNkqVr8nhjmiBa85Ar2I4jUqfVh5jjx1yfpPsUwNeJs4vRuZEm
         /b3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iEuW69sfEvqBnPbokbE3p53YmPaHn4LFfEYbquahgSs=;
        fh=lz8gkrnW/DtE0fBr91LWztFbuButiiVbHgosMTL3Guo=;
        b=JxZgRSMoRQbGkmkU+2obTiew2GsS7pqv4QfC86NyjGhg0ICY6IDYUm+FReGvOnmK/3
         zUq/Q4+x4LMCbU3bWetNEHfO3SQ68rI8BaTVcRcCtvuR0jcQJ0mPAYh0Zd7PefyKHQIq
         7xJCyBGyajM0qdDjsNvbZoihrLbO2+uKNmhoBn4nRL8mQV/ghYQ3zXSeYNN8F9jSEQpN
         zEF/uoLVc/SbCLPgBUg3TgRsNmx9VELSiAxMdS+l4o4jBvEHc9Gt4QM0x6vqACWDRD3f
         5ZFgVP9xxTjseEK86WnOmihrwHHtyqtHmB0ePc9MmaWfrsIlJiZX7nxHWgKF4MeN7WB7
         qxdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNzEdgEH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g29-20020adfa49d000000b00312723a5397sor4462332wrb.2.2023.06.28.13.09.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Jun 2023 13:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNzEdgEH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687982992; x=1690574992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEuW69sfEvqBnPbokbE3p53YmPaHn4LFfEYbquahgSs=;
        b=VNzEdgEHDetg10zCYWoLW59h9sgLl804LSJ50rQNRxjyvj5WTBJuLR4p4y32tGB43V
         cE5Lgdlu87pQaUYoX8r9ClyCZGMCOwRqJDwLvNrSNQ0E2IXunTN46SCKnefD3HxN7qPf
         6Iy9wCN7z1IjHTm3MDCEgPPLpI4AuuQ8uY9sVnsODH5RuA8+Ym5mr5rxPwkFsOa9lH+e
         V5i8mAKXoTuwqabbx2Ug1ZTKblLoXZS/r5+/+Zx5uIscG2MnnT5mS3E9C2UoAzjEQWXe
         GXfvaP5M+gXxjuucqBw9xSxG01YEb7criUYYImVM4yS0VM//ED9kBdllmkAN5Qt2cL12
         JJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687982992; x=1690574992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEuW69sfEvqBnPbokbE3p53YmPaHn4LFfEYbquahgSs=;
        b=Dvxg8F7pwYNpWHi1EJKBbYc64Vwld2xSoxDzh8C6O1wqqeu0sws+/BEMbhyagYMDnq
         jbeHWqkePB8XaZ5Eb9xcgYOmFE4KFioGfDc32wSnN2aHnhsBdh33ywPCXyK5TilI1Y51
         W46rScNp9YmQP/K1Wvp+w/3g2jLS111zhzhFPPT85tCIPFKvYZQu4/elwzetJQJMxQl0
         C8yYOQz39wYs1u3NrCDijSgAGGkNgUn69zFvy156UGYntwpwdBbX9wcRQMGuaCa5ph2p
         DDIJqcAQCKBHhSIVDqvpUhwg20yKEmFHCiXm/QSuPgfMwuop5GrzfzTF8/HhlSCLmaMG
         CsFg==
X-Gm-Message-State: AC+VfDyARC+edySjKR/lnSTzy6quANxw2g+hSr2x0Sh+3/bKGuu1V0bV
	Ykjy7H4Df9QBk0oUQoeIJAkOwwb7
X-Google-Smtp-Source: ACHHUZ4v/+nFYdce2Yl8aGSYi04rhImV2+G5ZUnSw/G8uu4umk+ni/7NlW4bp8Dfo0x9kRefbF/Sug==
X-Received: by 2002:a5d:63c5:0:b0:30f:cf93:4bb8 with SMTP id c5-20020a5d63c5000000b0030fcf934bb8mr28948912wrw.57.1687982992103;
        Wed, 28 Jun 2023 13:09:52 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.207.229])
        by smtp.gmail.com with ESMTPSA id r3-20020adfda43000000b0030ae3a6be4asm14166863wrl.72.2023.06.28.13.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 13:09:51 -0700 (PDT)
Message-ID: <441e8217-31ac-0fd9-1d85-e83f9fdcb3f3@linaro.org>
Date: Wed, 28 Jun 2023 22:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230628164821.16771-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230628164821.16771-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: CO4FDULKyIuI

On 28/6/23 18:48, Fabiano Rosas wrote:
> This code is only relevant when TCG is present in the build. Building
> with --disable-tcg --enable-xen on an x86 host we get:
> 
> $ ../configure --target-list=x86_64-softmmu,aarch64-softmmu --disable-tcg --enable-xen
> $ make -j$(nproc)
> ...
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `m_sysreg_ptr':
>   ../target/arm/gdbstub.c:358: undefined reference to `arm_v7m_get_sp_ptr'
>   ../target/arm/gdbstub.c:361: undefined reference to `arm_v7m_get_sp_ptr'
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `arm_gdb_get_m_systemreg':
> ../target/arm/gdbstub.c:405: undefined reference to `arm_v7m_mrs_control'

I'm a bit confused, isn't this covered by the cross-arm64-xen-only job?

> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> This is a respin of:
> https://lore.kernel.org/r/20230313151058.19645-5-farosas@suse.de
> ---
>   target/arm/gdbstub.c | 4 ++++
>   1 file changed, 4 insertions(+)
