Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1144337ejc;
        Thu, 9 Mar 2023 12:41:27 -0800 (PST)
X-Received: by 2002:a17:902:cecc:b0:19d:20f7:daf0 with SMTP id d12-20020a170902cecc00b0019d20f7daf0mr23618020plg.34.1678394487209;
        Thu, 09 Mar 2023 12:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678394487; cv=none;
        d=google.com; s=arc-20160816;
        b=uvfYDP57FGJcQuFWIsW68OLXhpbPTTrvX6KZhihpFJGEV/w80AM6Ys6kHL7xhG2ThP
         7JNF6V1ehVb7ps8/pRiUypYt8Q2DywwPPrD2XmUXfjDKPb5cUrB6AI1g3iQXzGaLc0Le
         UgxSwGMlLVSCgya7Fos0QECXdBF7zVul5pU1QGjrRvxuHit1NH+etpZAHSwtFrZJe2qb
         EzITNqqDwAunb++Y5YIQHuBdp8hiDMuubshDjXTXXJceh+6RFAmKVI0eCFQurfxPBMV5
         0E4FBOgBCV58Vh45fr5QrUi9++dhqmQiV/1eBOtJf6TcpPHulJpAtWzUpjiOtqiDYKJp
         ghCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xbWg0R7JeTUN8Nov/NvIJX2oP2Ceq1o9xKIJUCF9ZuA=;
        b=jpMp/t5VbpuvjCkm+Y322Zb5qtpRqxDyZ1eM0mytMzZ3bnp6AxgbR/jdpU/G6pN8+3
         l6lMxeUkJsbjz9lAKDY/tVn6VtS2B3zmNR7CABMCmekmHg1XfM+kzwlScbWFZiD+xqLs
         g8JrEansrxk7FsY8Rt5kOBO2rZjqBGtbGCr8+ifl6hLpJGPVxAarVd+HPzKj74GqjeZ1
         x+L1coO2bWU6YTQKockox8jgSRid7h1+nV9XLld7h2WqryldL8mlydTmYclv4Xt0LDMw
         fbUSabj1htJ1eof+QSN8a3iEmCt7sc36LcV+hq6cKmSc8JdPDK2Jlrhe2EjfSAwnCk5q
         1kWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXyiwchp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lk3-20020a17090308c300b0019a9d1b8508sor87028plb.156.2023.03.09.12.41.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Mar 2023 12:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXyiwchp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678394486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbWg0R7JeTUN8Nov/NvIJX2oP2Ceq1o9xKIJUCF9ZuA=;
        b=LXyiwchp79nGeRk2Ska4C4zkrk/8SmaEaJdbe7aRA/t/IQMjGwxvw8zlxLG88V6gNP
         Bg+BLjx+M/gYePrEjJyFXFlUqgMp5hLY0uOC04MQ3nVDIEBdpxKQNE5qlVzE7/ETWsCU
         SolBA/pjMGn4TP6ov+gwsmDjlz/LEYYRA1Z5CyBhSYIuUGdbc3Bgu10djoApBW6Ds2cQ
         CqSqA/LEqw43Jq/KjZcwGymowy52yHDphXTUe/kby2N9nLCZOHnOVBIalOutL5hprAVb
         Gc4HhR1wed/18T3NZPnmfpu8sTZkN+inACkCz6c312cLM+wtFlfa6MeY7fmiwc1y5deU
         S4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678394486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbWg0R7JeTUN8Nov/NvIJX2oP2Ceq1o9xKIJUCF9ZuA=;
        b=XPOULQoytbt9LQdUAoVV20mlRPqa6OjvKPSVIt5otXg3a0bHxPF8J/i24hBzLVTJMM
         hb528360gxYYWmgrPHvTI/KgHgKiIwfUiJWMex5ZPC2IBMwZDhsVEr3vxmGRISmaZupe
         qd72VlbNvOnF8xvvwvk171JLfApAmOfIn2Cz38eG2v4bewv73sePpWJvWrRr4SRj39QK
         KxAsSuEndnaXygxXyb3URZjyQ7nBv0bgS6kIKw6oHUODxWiXVMKbFf+QWjlW/uhKo3V1
         svMEQS1tn7SDBThwhg85Q4kQ5Qmm4KO14pGj7aqWdN/U2RaQxcUkUr5CgE+D9HKRBOxu
         sF/w==
X-Gm-Message-State: AO0yUKV8FUv02kBUJ8jHbEYqrgSMRKs5VeO/zfNsKXDMQjisp/UD2Mk8
	zIxrLopFO2M2nFfQdnivXNCufGUj
X-Google-Smtp-Source: AK7set/5ljSgKNqCf/Bsln9BpJBGXqEbkxa4W1cMRxq+aRWMKyJ+O5PjIK8DRpMlMVL5nJBbHTK0iA==
X-Received: by 2002:a05:6a20:429f:b0:cc:8360:8cd2 with SMTP id o31-20020a056a20429f00b000cc83608cd2mr22248428pzj.25.1678394486588;
        Thu, 09 Mar 2023 12:41:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:bf7f:79a0:a976:bdaf? ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
        by smtp.gmail.com with ESMTPSA id r17-20020a63ce51000000b0050336b0b08csm35008pgi.19.2023.03.09.12.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 12:41:26 -0800 (PST)
Message-ID: <66fc9079-8277-5839-e682-c0fb1851f709@linaro.org>
Date: Thu, 9 Mar 2023 12:41:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 10/11] target/arm: gdbstub: Guard M-profile code with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-11-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230309201434.10831-11-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: rp8E7rJDejj3

On 3/9/23 12:14, Fabiano Rosas wrote:
> This code is only relevant when TCG is present in the build. If we try
> to build with --disable-tcg we currently get:
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function
> `m_sysreg_ptr': ../target/arm/gdbstub.c:356: undefined reference to
> `arm_v7m_get_sp_ptr'
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/gdbstub.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
