Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp51814ejb;
        Mon, 13 Mar 2023 01:58:33 -0700 (PDT)
X-Received: by 2002:a05:600c:45c6:b0:3eb:4cb5:e13 with SMTP id s6-20020a05600c45c600b003eb4cb50e13mr9618121wmo.31.1678697913260;
        Mon, 13 Mar 2023 01:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678697913; cv=none;
        d=google.com; s=arc-20160816;
        b=cJ0OxZan3ZXfNprR/mFcY3+T7fkIcV2g592fBGU8BpHZ78MDutKkwG0p5T2Xx3Ohv3
         U8ysgfSI0uKWAzHfG8sPND9HQIHSWzVXjQZeOC5DIMGG1Ip9i6wT8/q521eKNYmgOU7i
         FSfc0nsimM2NMc6xpdK1CPH0jZ9gt3XRkjkEmo3dl04WIWUESDSdOk5NwEekckdbCiuP
         cJSFphz4GeiWizD0YiSoinEQb/suiWzJ+lVBAYcfCB3TWAKNCIvA9ljIPFhX2Ol5PzQa
         hnK3HUsNyuh6VvMC6bZDoylokUD18S7jCyUbqSvrK1CS4C3JOU+dg/EGNcigBnul9I3c
         W+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nwFUy0qPgo/d7vZtlR4ypK+dZBNwx+X5FK8USi/ohxs=;
        b=u+IGywjmH11ud2khy7UPMeds5O+x/OgQGNdKU2ec2idsbwqWCOPfhnxMCSadbhftUZ
         MO9PqWUaDX68PgefEt2SoKvX82FlOXkOw1taBqfNdSxhHkVF/M1AU7jxTT8XNhg5BLSM
         tGfYxItEM+pmJyW2wxjdytWR0F0GG1+Eqwzd9Y8Hw/ubz7mKUSn3P8NzigVCE0SI+sr2
         YYMKfCrU9+Lur/3/rMzLnE57OUry6NMschej+lzVDXnw+3RMtWklCgiWMewWREnrm/DR
         3oGQaaNmjOYj755mW8lvkI4OzvNMwVBHg82yzJl47PukT22yQb5HfWdcvmYevBusSYSY
         fgOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/6JBjSg";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q7-20020a05600c46c700b003dc49e01321sor1981891wmo.25.2023.03.13.01.58.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Mar 2023 01:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/6JBjSg";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678697913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwFUy0qPgo/d7vZtlR4ypK+dZBNwx+X5FK8USi/ohxs=;
        b=N/6JBjSgzQh7Ee+P5D8sMnBh/Nzg3K6AlGFhkj/d0kq4FDg5TrFd0SBl24dc5kb2MR
         10AUniUJvCR8id8uGZ1zBsir3kWgNxFfse0cgdtdq7SgDeeDoiUXSNhYqOEW+wsZYCZP
         5OgVJhQMv9DczSwJ34FbgLOhhhf+YCi+hpCrGCJ7Or/wsT53pmWP29AbvtBsbkZM14XK
         x9slvJ2arPpH5GdICaCbfeisBXZ1FEQ1SjNPCSdEiHvh4dw0WhXH/TzfyhtqwqW0U/9M
         zwyN8Rn8UWpGACGScNf7XGS/4VyOYYMxh3qrLQrhw8wRaXQVfOjcEkSTIbnuu20q4/IC
         H7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwFUy0qPgo/d7vZtlR4ypK+dZBNwx+X5FK8USi/ohxs=;
        b=mxZvjeY7NnUJ/CrnzcehXBp3dhPjJhAtP7woxI7Ii7qPCevJ1lN0iT8XCOstblRCnE
         MR9q3d6P0WfcIcWc4Bg5aPsiNm7zAciMcyxWSSxYguGx1HHHUwfMxZs67tGrFS1E9oJR
         uIf0/NUFkjiFsWO+0lug+ehy8CJsk1dy3VNcROuo79YnG8K3a0DIeMPwWthpzZaMDdOR
         eynzHZu9Apm4Jgnk/l86AwkLO2fINvf4kweoY+6E+Sjcap8OF0dtiCBoTXAi/MzK6G++
         E+r1UyXNgwrsKMrXqt3AJPf+fbykp8z7DXTKQJ+CFWy/4vRvf7HM8XkzFryZ3EKDi4ZC
         WGsA==
X-Gm-Message-State: AO0yUKV6cq5Ut+1bd9n0Wxj21HmCsZ7korwWg/W9egYt9hf1y0SZsGvn
	aRUz69Nt6KDHy+I2yBfij9NZHDfKXJZZrsxFIvcKiQ==
X-Google-Smtp-Source: AK7set96KAfY9LHs0mf5f/uGqK56+xXpJb/r0UDgZ9c0ad5hC6QdM4oU767tv39ZwWmSrrmL3HuPMw==
X-Received: by 2002:a05:600c:3c8f:b0:3ea:bc08:b63e with SMTP id bg15-20020a05600c3c8f00b003eabc08b63emr10268334wmb.2.1678697913009;
        Mon, 13 Mar 2023 01:58:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d4a8f000000b002c70e60abd4sm7390577wrq.2.2023.03.13.01.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:58:32 -0700 (PDT)
Message-ID: <71946be0-74ea-2596-3184-7ebe4ce21b4e@linaro.org>
Date: Mon, 13 Mar 2023 09:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v8 10/11] target/arm: gdbstub: Guard M-profile code with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-11-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230309201434.10831-11-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nRPuY9ka3Q1+

On 9/3/23 21:14, Fabiano Rosas wrote:
> This code is only relevant when TCG is present in the build. If we try
> to build with --disable-tcg we currently get:
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function
> `m_sysreg_ptr': ../target/arm/gdbstub.c:356: undefined reference to
> `arm_v7m_get_sp_ptr'
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/gdbstub.c | 4 ++++
>   1 file changed, 4 insertions(+)

This patch should come before patches 5-6/11, or become
first of this series.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
