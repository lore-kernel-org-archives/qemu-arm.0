Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492757ejo;
        Mon, 11 Dec 2023 13:22:12 -0800 (PST)
X-Received: by 2002:a17:906:2411:b0:a19:a19b:78be with SMTP id z17-20020a170906241100b00a19a19b78bemr3048049eja.129.1702329731997;
        Mon, 11 Dec 2023 13:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329731; cv=none;
        d=google.com; s=arc-20160816;
        b=Zm53U0UCQXpOkBe30z50Qo7qHCfdXki8ZR1bw+ppB8uyfe3GYFcQCJvlsvaQF0LBpc
         gjmFr9wWK3pTsU8ZTB4RIG6GWb+tYzYl4RHnvp562E9I9bCQVdSCVmkgM/ljhp3MHYFu
         gzCfPQ8H2OlE77IXiIA8wL37PUuffhJHBCna0X0kphXX/JFQF8pCzdBxRHHC+k2F09PQ
         Jsb5PaXoMLeeWeNz6h5wQDCgEXZl4UkfOtMZ9nF0A6XY2ZMK7XjtrxeIpliN/lLeUFJT
         rS+sWZrHjMc/Q76IG/bSnsXYlgP1su6xxzOZaRPk1+d9ir3RxGil0jXWqInl0LhxSwOz
         B0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pHOOtAnxrumGhcPX3MIHrVqNAKP2pZj98HD0RrLMt7c=;
        fh=APZiOVChRq1pbb4M0/vHIaQNkwwJ07v2IkPexBj2Xsk=;
        b=EmHFww8BYhAIp2sunvQqdnb77q3/aK2QCJOElolgr5Nxw2Amasa1ap1JBKDvD9fKTj
         +SnPnv54qpDQKBv9bqm7wPPlyVrvFjIETpiup7mydP9jxv7B4b2LU+eO2TVOQgRK2Ndy
         PS+/mYX5Il8+UzUTvZ+z0Ad0U60bS8FpDlzhlSNkcv8I8AiTt2ZTSnEHaawTB4s8ez+F
         v/Tlts+sX1AncFsVbTrqxooiBY2K3uPK+Z5gqpj6RTXmLiXCcpli53etqtujfqxDBxch
         vJqINgaZpwv2hZOkyVQ5wU9+gYRqrT+PDxQZFJ7uldFCBISnO2hZjlDSk6v29zit33Wh
         69bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DOYwCK9k;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hy3-20020a1709068a6300b00a0e3a21fe9fsor1946108ejc.4.2023.12.11.13.22.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:22:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DOYwCK9k;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329731; x=1702934531; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pHOOtAnxrumGhcPX3MIHrVqNAKP2pZj98HD0RrLMt7c=;
        b=DOYwCK9kfod/dmOE8EMZ4Z2sOy/A9cqynEVIzQrR9wq5DvCY9lnpf3jwvPY0jK+kjN
         +gwvtqKu9N/8cBEUc0nRETENFe0IRuxQi6cNmLkF8kt4magx8vBziw0gxQCykES2rJI+
         7BRhJk07o3DL+VobrFd6VQ+3KvvmdWMb3POhFM2NsrlibPWRBaCW/dPzsM6sVibc/IPK
         taeN5D6vAH1xij/UgCU7n1zQ/2b4wuqD/IYETottXPfW5ObFwRZNcPBd0MwDpZwoT6oj
         1882KtixH2uvAZHZMH1wBUQ/+eSfkG21jE859ek9nAfjyq3GEeBnhzrvW5h6w5GJ+Hx5
         8pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329731; x=1702934531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHOOtAnxrumGhcPX3MIHrVqNAKP2pZj98HD0RrLMt7c=;
        b=wvCfwDFDCQ/aZduVLLJ9ZTLj4TvKh2KR3h2EnoTH2Q+c2ermzMjthvXh9mgPOsrIy8
         5bUg2+M73E3WII/jGxJ1fnaivRaMOIouJtxH5cvTlF/fyvHr8NIh41fjg5JNMoN5dk1B
         0TkF7ytKoHWaeRvG+8AhUGG45uQUDkMd0ozRAK0xKqAwcwHDgYz8uCkwMhF/Hb7Voiiz
         Kd8wL+Zxek/ns/JU3fi4dxfhFmzgyLD5m9YGag9hys8K5Q0Cm8sU58Htu/LsDAkDxbjj
         6Z75YvFYpF9J/Lb4qPsO0YsLy42NSiE92MTrL3eYLAhWYbAx2eMp1IvxrmFGCLs2R1UF
         pTUQ==
X-Gm-Message-State: AOJu0YyyaWeiGgFg7pnyHmt/vOBd6xScjutE0Kgfyy2lwp1Z1mtnxv52
	a0hmJkHpwqN9jGGxAcJIIZIlb3nr
X-Google-Smtp-Source: AGHT+IFfbsKA8wfC8skTB/yoF3/ySzTZdf5W7q0m1rGxxrtoSwlumHzcEZ+qPSObAal65lz1rrWhJg==
X-Received: by 2002:a17:907:9057:b0:a1f:786c:1b6a with SMTP id az23-20020a170907905700b00a1f786c1b6amr2301410ejc.52.1702329731750;
        Mon, 11 Dec 2023 13:22:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tj7-20020a170907c24700b00a1c522990ccsm5332007ejc.85.2023.12.11.13.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 13:22:11 -0800 (PST)
Message-ID: <b977d019-52cb-47d3-88c1-b354db8b330d@linaro.org>
Date: Mon, 11 Dec 2023 22:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] exec: Rework of various headers (user focused)
Content-Language: en-US
To: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Alessandro Di Federico <ale@rev.ng>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20231211212003.21686-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8KK+diF32u7w

(Forgot to Cc rev.ng folks)

On 11/12/23 22:19, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> These patches are extracted from a bigger work where
> "exec/{exec,cpu,translate}-all.h" are split in various
> specific APIs. This helped:
>    - differenciate/build:
>        . user VS system
>        . target-specific VS generic
>      which is necessary for heterogeneous build
>    - reduced header pressure
>    - clarify APIs
> 
> This series is focused on user (vs system) cleanups.
> More useful changes will come after.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (24):
>    exec: Include 'cpu.h' before validating CPUArchState placement
>    exec: Expose 'target_page.h' API to user emulation
>    target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
>    accel: Include missing 'exec/cpu_ldst.h' header
>    semihosting/uaccess: Avoid including 'cpu.h'
>    semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
>    host/load-extract: Include missing 'qemu/atomic.h' and 'qemu/int128.h'
>    host/atomic128: Include missing 'qemu/atomic.h' header
>    hw/ppc/spapr_hcall: Remove unused 'exec/exec-all.h' included header
>    hw/misc/mips_itu: Remove unnecessary 'exec/exec-all.h' header
>    hw/s390x/ipl: Remove unused 'exec/exec-all.h' included header
>    target/i386: Include missing 'exec/exec-all.h' header
>    accel/tcg: Include missing 'hw/core/cpu.h' header
>    gdbstub: Include missing 'hw/core/cpu.h' header
>    exec/cpu-all: Remove unused headers
>    exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
>    target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
>    accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
>    exec/user: Do not include 'cpu.h' in 'abitypes.h'
>    exec: Declare abi_ptr type in its own 'tcg/abi_ptr.h' header
>    exec/cpu_ldst: Avoid including 'cpu.h'
>    exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'
>    exec/cpu-all: Extract page-protection definitions to
>      page-prot-common.h
>    target: Restrict 'sysemu/reset.h' to system emulation
