Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp704630ejc;
        Fri, 13 Jan 2023 13:58:57 -0800 (PST)
X-Received: by 2002:a62:5f87:0:b0:576:1c37:5720 with SMTP id t129-20020a625f87000000b005761c375720mr73772456pfb.4.1673647137451;
        Fri, 13 Jan 2023 13:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673647137; cv=none;
        d=google.com; s=arc-20160816;
        b=vcD4I3nQZY/qC94KfcddHz6RqhVXvdAOs50efuDOlPZU3DrK56Rocz4zmzSy2zWWCa
         0iMktQ8+ASQlh8/et7Hfaw6qV4BgHFCvb1PMMum5c59G6oaI5BpxgdXUpfK9DgOhP3fU
         N2kbEP0f8z1yC+kE4fr5RNtqfcbILt9HWulHHf+BKLHKzgP3O5VErafS9Xi0x4U8swvV
         6MDLVZOTt3jhJE2ygezzcARq3iQQFzIVfqdgqdHWod4uWuRNcWNT3wreWSNlL2vdhw0O
         TpVZHwgn9WVUl9CtL25Wze3mOvGKzN+HRb9Nielfa7bJ/C51N2p7X2FLDrn1YSDY/rNt
         q54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tq6AiRtKVmwDGbnjlqMbHs3w5jVGhXsRwmRDnXTB03A=;
        b=0PS9bKQZrMdUmtx7eMeACkqTCnSN7qKrRPOjIPGGS/3zjX6pRKptsNxKyfFQx75err
         XeCD+397ULtc+q7UTZA5E7CfnBsv24iB6TU0tX4TwY5VwYL2sKdMRx4Esv9T5yIPds56
         ysHB3ukiensVk7wouoFcJNPSOTwa8ZhZVABcwkANCYtL2Yc9UnyphbWMCGnRHYxK1Rgj
         hdaG8wwoH6Ijb3srlc1MwggFssmKbecNxVV7N3AddgYOGvjTnb32n2mKGnmQ+yMU3n1F
         WjXOVZicrUJuoSDdp2dy7hnUpTBUKt40i9c+SCT9dhKZzRUKY8JXuLwM1c34etL8ynkG
         IBTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmYUP0TZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4-20020a620504000000b00561e620c5fesor11892614pff.79.2023.01.13.13.58.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 13:58:57 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmYUP0TZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tq6AiRtKVmwDGbnjlqMbHs3w5jVGhXsRwmRDnXTB03A=;
        b=OmYUP0TZz79RLi/jD0ECX+6l2hbHcVWH2rOMeTQiQu4Uvfo9ThIOeiB8J2R3F33AOr
         G2JprTnlmm0Fn8bzJYFIkoHO9Jc9HkOFFc/UHqGevIj+wJl5m6MkUOEdQU1ThZWFRdJ7
         tJ/r7yNJ2mnerbfrPVdzUbF+rN5wnCBHXcvPPej5Xr8jaOyTSEhcEP2mgcOWMuSZt09d
         EY+9L7QDM8R4qPYp51ZiOlwWZE35flcLyTojuG3Xv066eMTKoz0cEB6extvEKEUeuCIg
         ZVmYNVo6VPOo4iFOBl7yoEZRykSIo181dK54GcVnc/6zNfhoIos+KMo8OsGNPk+kBbC1
         4bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tq6AiRtKVmwDGbnjlqMbHs3w5jVGhXsRwmRDnXTB03A=;
        b=4sTvh0UQQkWvTxCOjR2YhaXKJNmo9DI3hIKqJURxvQ4qJ/zdNzy3+hSJkdmxkRJoi1
         v9qcGIsEqsnMgFhtF3IMsfJtpBtwTpBBafuSluaYY+HiZ7MpgcfRhpn2xRpNlD0bkQOC
         wjQGxT+6GiXCMPNW1RcjEcJ82rBMlE35h2KYlh567Ll1sO1otUWty56TDeB6i9xb0F2f
         RpcxKTTml1bQLPPiUPJ9ybu+PXYyblp6JyR/sCvYL3JEe7rskQ7skkBLGzKQ94G/dZ2K
         TyGXyoaR1Y4hORx4sjOc0eAQfQcOl72yE67I0SBXeW4GRIDm+X4zUlIlwyHePINWsRDp
         KTbQ==
X-Gm-Message-State: AFqh2kr3InJYv11zrBei0CtLjUBFtPL5baLLogJPkDebo4ODIgcI7Zmz
	uPPBU4vaFVcMHbtMRQ1/KGIy4A0E
X-Google-Smtp-Source: AMrXdXvIKAT2F9KrTUHIAsOI5guTYQZ0ybe8ekH0Qf6Q8koJ9RDxT2yumVirtghse89cpI1BKbf0KQ==
X-Received: by 2002:a62:84c9:0:b0:581:1f4b:d1e5 with SMTP id k192-20020a6284c9000000b005811f4bd1e5mr66306169pfd.12.1673647136884;
        Fri, 13 Jan 2023 13:58:56 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id 124-20020a621882000000b0057709fce782sm9485591pfy.54.2023.01.13.13.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 13:58:56 -0800 (PST)
Message-ID: <6e727a48-1418-23f7-1e67-8662f3564efd@linaro.org>
Date: Fri, 13 Jan 2023 11:58:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 17/28] target/arm: Move cortex sysregs into
 cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-18-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-18-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: UpNjgg77HftU

On 1/13/23 06:04, Fabiano Rosas wrote:
> The file cpu_tcg.c is about to be moved into the tcg/ directory, so
> move the register definitions into cpregs.c along with all the others.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpregs.c    | 59 ++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpregs.h    |  6 +++++
>   target/arm/cpu64.c     |  1 +
>   target/arm/cpu_tcg.c   | 59 ------------------------------------------
>   target/arm/internals.h |  6 -----
>   5 files changed, 66 insertions(+), 65 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
