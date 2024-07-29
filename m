Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1846131njb;
        Mon, 29 Jul 2024 08:15:24 -0700 (PDT)
X-Received: by 2002:a05:600c:4706:b0:428:fcb:95c with SMTP id 5b1f17b1804b1-42811dcd2camr50022935e9.23.1722266124398;
        Mon, 29 Jul 2024 08:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722266124; cv=none;
        d=google.com; s=arc-20160816;
        b=f9Cy4/urhKsXt0AR39GAOs0aNrtjzYxQeZ5Tzp4/T6vSA2vTqm2zyH1KrGWT5vxKe1
         VJgfMQ1gY+kHUOb8fiYn4nRWa7YJfPKLM3O81WZ7sbnSl6rxow6U8MOcDSqdPJrgCWtA
         Vh6sspc7bonf5JgcsicSs0fxj78HpeRZDq1Ll1MqbcF7kP4HXau2JB0Xm1VaywlFCeQ5
         mjav4few6Rj0CIbtxdAx//JvxE+xT8SeGU/A6dkAoArToh2OogYSfsTrjv8dhJBdrXvH
         qS582wOGjdb0AXyoEVgoOifIH72TzELgprHQapomwdJbpBMWxqHSnrRIhLR3WVheTsj7
         Aq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=79xu6GwJt2tOSZjRUkS6x2bp/kSXLFMEOLWAaLfoTjo=;
        fh=gUW4hSboMkqtq+LmmnwlQ2YvzO5fDItH08Zl3PXREgo=;
        b=CFlrqhgAaodaRYzsCbKHSCUIYanMK3SaFqH+9LvDv2RfMcFiw4zPF0TvLr2Yt3UQgW
         PIukyLx/J+u3Rd80vuQ7/oVZeeHmCTqzQf3bBJRuMVoribmM+7m7bpQgzAgkDHRm0lEX
         +7pAluAeUqpyo4SAbiSPg744UCb3f+OtHFtlWxssErFLay7dcfpTuM81h9s6LBQVLwgK
         EdyCd+ic6t+q5p3ShTps3FyPSkbKlVGcotQ7cga1cb5gGSPsokBleNoAmvoVOU+Mknqa
         XwI6Lbia3PrBHErkReoUwbVS3znoDQKXrD6TECOXr7eooQmDb/EXTkYN8p6zZX6MVbJK
         UMsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aB8C8x3k;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-428068b165asor25894015e9.10.2024.07.29.08.15.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 08:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aB8C8x3k;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722266123; x=1722870923; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79xu6GwJt2tOSZjRUkS6x2bp/kSXLFMEOLWAaLfoTjo=;
        b=aB8C8x3keTG2ZopsE5Uj5Lz/uWia3CZfx6iFkGCCp92DjeYjmzcG5MSGbyV0nKFyKP
         J7xgSPV+hlTc22PcEKO8KYOSvuLTpjKOi8bEGgmKWLa9vmVnq2+ZcgnlssuCZwPVNYll
         01FB3pdOEYak8gfjV+VUvmoyBxorkjJln4QWRkpns7ZnjZn67HLts1JUoesk61BLEpIs
         FaqLUuNFd0FYJw3TjHpGgakZ1lpdMTLuYEuTx0csNxxx2t+8TRxiGLt0GUb1AgteY9OP
         0pa8K5F6l69TGDGgnX2M/ylpc8aQJGb8jRUtaQLCCyS2KIp3tJh2/5AmAULGwAUUf9ow
         zbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722266123; x=1722870923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79xu6GwJt2tOSZjRUkS6x2bp/kSXLFMEOLWAaLfoTjo=;
        b=i99Jujn70eL+0WtZSuVk/lBtcdS1AF1qqrSRgcQNMuQK76Tr1gaVt3o4gsiPpr6w31
         nfWGanzQBLxaoK5/wr2Xgy/+ZKi8W3lJtGQunULORJgantam47S4otA0q1QK5iUEyXUE
         hTSlQbslFvWzPgKiN6r6xIJMBB+bRlXeEmIHnrQTQLLpUw5NaWOTTF7XMvkhRz7sRfwo
         YXfCAs7eg8wwHqLf/ZHJEjmLFFrSjHMtyTfrty5+BwqDxyJTEwec6T12LrdpBKD53X4Y
         hn0bECD0IeDQ5e7RaRq2cTl1If1fEqpjmtlIurW8XH5IQEtWURokL09G7sb/PeMpHYDt
         bgng==
X-Gm-Message-State: AOJu0YxQetLU7LZM4CXGXrsm/ea7sVWtw4gORVrR+CZ6TKaXlXdiNjV4
	yqpGXKsiJnEStr1StxC7tv6iuf33o0c5fiLHUhw0XG3gxQrtwDGbQT7fp1PCHVrj8nE9G7zqml+
	vuA4=
X-Google-Smtp-Source: AGHT+IF6nc5Y+e2eOcabdpkPzuygIXcrytI+wRNmlOTnBDBa1WK+EeAGe2UPQng2y/E8HyELyGQXTQ==
X-Received: by 2002:a05:600c:2143:b0:426:5471:156a with SMTP id 5b1f17b1804b1-42811d86408mr53805875e9.13.1722266123436;
        Mon, 29 Jul 2024 08:15:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280a867e7esm136621325e9.27.2024.07.29.08.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 08:15:22 -0700 (PDT)
Message-ID: <15dd571f-e4c2-4eac-a0f2-a056f63843fa@linaro.org>
Date: Mon, 29 Jul 2024 17:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] tests/tcg: move test plugins into tcg subdir
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Song Gao <gaosong@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
 <20240729144414.830369-10-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240729144414.830369-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: grr71Utm0lig

On 29/7/24 16:44, Alex Bennée wrote:
> You cannot use plugins without TCG enabled so it doesn't make sense to
> have them separated off in the test directory structure. While we are
> at it rename the directory to plugins to reflect the plural nature of
> the directory and match up with contrib/plugins.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                               | 2 +-
>   tests/{plugin => tcg/plugins}/bb.c        | 0
>   tests/{plugin => tcg/plugins}/empty.c     | 0
>   tests/{plugin => tcg/plugins}/inline.c    | 0
>   tests/{plugin => tcg/plugins}/insn.c      | 0
>   tests/{plugin => tcg/plugins}/mem.c       | 0
>   tests/{plugin => tcg/plugins}/syscall.c   | 0
>   tests/avocado/tcg_plugins.py              | 4 ++--
>   tests/meson.build                         | 2 +-
>   tests/tcg/Makefile.target                 | 4 ++--
>   tests/{plugin => tcg/plugins}/meson.build | 6 +++---
>   11 files changed, 9 insertions(+), 9 deletions(-)
>   rename tests/{plugin => tcg/plugins}/bb.c (100%)
>   rename tests/{plugin => tcg/plugins}/empty.c (100%)
>   rename tests/{plugin => tcg/plugins}/inline.c (100%)
>   rename tests/{plugin => tcg/plugins}/insn.c (100%)
>   rename tests/{plugin => tcg/plugins}/mem.c (100%)
>   rename tests/{plugin => tcg/plugins}/syscall.c (100%)
>   rename tests/{plugin => tcg/plugins}/meson.build (70%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
