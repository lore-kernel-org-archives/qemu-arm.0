Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp838773ejc;
        Wed, 18 Jan 2023 13:05:08 -0800 (PST)
X-Received: by 2002:a17:907:a68a:b0:7c1:4d35:a143 with SMTP id vv10-20020a170907a68a00b007c14d35a143mr25092921ejc.3.1674075908172;
        Wed, 18 Jan 2023 13:05:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674075908; cv=none;
        d=google.com; s=arc-20160816;
        b=efnZcD1JvvGeeH9y/Xr2EHft07r+kwMcUA2pFXFPXMsu1eVYWl7ixEzWCdBpB6zeZI
         aySrt0838qDn87qiGJSmYuoq+d4njgnj43m1LF6QDNWBWkl1qciYIzlBIhg1PjbJEUQ0
         hk+naoLobLuKCyR1kR30nkPWcxPjiyRexXIDzQH+Evf9pYYrFieGXKErd3bXlVGOHP3p
         JiWMOe4PbwF6b+p2smulOZW7/CuBK3YXgBd8/fkPbHXKMFQ4BtE11LIp9y+wR7sq9FNZ
         nFeaGiEmBX75QMEdU869r6ainwxORb7uF5Y+hUkNIIn4i5gy4peWZjplxiFRcy3Eao4P
         dchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=710spzrLZOeRQTIExtr4HPibXxiq7aGlcMwfASk6A3Y=;
        b=081JSVUKqQKEmDzUgghfGxUSzSxRqj8apwW+2+6Qq3HBjLN7Mhm40Y/shvZxoI2Iqu
         MVB7bf+Me7sVpATjzV+Euhs505TxkU+4H/5M8ybHllW4nMWIMqVW7SY4fgB/3+ffV8b8
         Pnkay4vc0GSOnVzMMG6K9M4A74BCup03S5ELNQtNttz6yqZ2q/cMKA9cdvYhr3RdiNSr
         i7X2RqVmgJhBYBM58X2gPVqf6QuBZKvEyblBtNOEF2a/8nFuTeJlvbwHvQAZEinc8fFN
         NTATuc5c7xgTOspzka/3go8DDKHqiryzZ2iIeF9DxA1KKCC7CJX7ztY6pLv5p7jDRcF6
         EKMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oiCwWWe5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n21-20020a1709065e1500b0086edc8eca56sor5857534eju.106.2023.01.18.13.05.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Jan 2023 13:05:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oiCwWWe5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=710spzrLZOeRQTIExtr4HPibXxiq7aGlcMwfASk6A3Y=;
        b=oiCwWWe5qNsTLYq3O5XCI51vI9HQ2sH2ivHlNFq28pn+IFZ69Yif56SbP9uDKkTZto
         2rf9UyX+7NXqwPla/yubm1Yr8vvXTdugIy4vDuwxAtUinq4zVSTx2bcK7g3bg0X3hEoo
         V0I4qr1EcNoENmtImwvoY7KE6MrV7Sq3VGogc0ny4/ogF4xV4VesG/jd2cXmN6Pau6Gw
         Fv5sZwlQLhdDBy7plaW9/29aCHYKZy3EY2NWrV55LjXzh74sOiX3JrN0GwZYyQ6RIh3C
         HxL9HRyMI1Ui54ohfsW/VzZuT1NAePN+mPOMEl+TKCiFT9SknZzGLKVFdfQyCJT82rYj
         wCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=710spzrLZOeRQTIExtr4HPibXxiq7aGlcMwfASk6A3Y=;
        b=WmQOnkYt1xR07jUcSJ3nsI5mFLApBZIIsOzR1dbYS/rKGsfKrEvESTEPPk/8E4xwjZ
         DUrPcFnoqFPBzNCZN9J3MMlBAw7/RccSjBA5OfaHiky3PBNVwTcoAaFz+KRtB9ALUxJ3
         liFOfbt4B33Buh91NkmzxR9xZ7aR5B2kqe5vj4HIdmNH/THB8OuYZSbpZh9Zgkw7fBrq
         KpAwMIVril9xGBr04GLL6KHUA+3cQYAVhlGPnMNa8DtHaserpjmKsMLxg1J8VDnuyM7k
         tPVq/MQ/4A5x2YaNbcictxaqG0JXcfLXZODeeyNSBUMYHeAwVME+jOeVhP+4/n3YAEwv
         f2oQ==
X-Gm-Message-State: AFqh2krnvYPZ/xMUdGYLFBLMGBtFYAv3OgJtoishRNB8t3xhhUjDzyHP
	zBjk2KgqIZ6ro6sNxqgYWF8pJITJk8KYRLgQvE8=
X-Google-Smtp-Source: AMrXdXvGqxpHzggyp/2gTEgtZ/wCTSbeowfO11Hxzv2y12CidDQbZYJMpTL2+fPID5TZeVZUWTeLpA==
X-Received: by 2002:a17:906:7f8c:b0:86c:360:3dad with SMTP id f12-20020a1709067f8c00b0086c03603dadmr20288509ejr.53.1674075907936;
        Wed, 18 Jan 2023 13:05:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id d9-20020a1709063ec900b0084c2065b388sm15079179ejj.128.2023.01.18.13.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 13:05:07 -0800 (PST)
Message-ID: <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org>
Date: Wed, 18 Jan 2023 22:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230118193518.26433-1-farosas@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: QswrUuQw9j7s

Hi Fabiano,

On 18/1/23 20:34, Fabiano Rosas wrote:
> These are the already reviewed patches from the first half of my
> previous series:
> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
> 
> This unbreaks the --disable-tcg build, but there are issues in runtime
> that are still being hashed out in the other series.
> 
> For the build _with_ TCG, this should behave the same as master.
> 
> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org

$ git am 
20230111_richard_henderson_target_arm_introduce_aarch64_set_svcr.mbx
Applying: target/arm: Introduce aarch64_set_svcr
$ git am ./20230118_farosas_target_arm_config_tcg_n_part_1.mbx
Applying: target/arm: rename handle_semihosting to tcg_handle_semihosting
Applying: target/arm: wrap psci call with tcg_enabled
Applying: target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Applying: target/arm: Move PC alignment check
Applying: target/arm: Move cpregs code out of cpu.h
Applying: target/arm: Move define_debug_regs() to cpregs.c
error: target/arm/cpregs.c: does not exist in index
Patch failed at 0006 target/arm: Move define_debug_regs() to cpregs.c

I am based on commit 7ec8aeb604 ("Merge tag 'pull-tpm-2023-01-17-1' of 
https://github.com/stefanberger/qemu-tpm into staging"), what am I missing?
