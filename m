Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1484751ejc;
        Fri, 27 Jan 2023 14:37:19 -0800 (PST)
X-Received: by 2002:a17:90b:1e41:b0:229:a46b:7629 with SMTP id pi1-20020a17090b1e4100b00229a46b7629mr56116pjb.30.1674859038901;
        Fri, 27 Jan 2023 14:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674859038; cv=none;
        d=google.com; s=arc-20160816;
        b=IgzAnH2vbx7xMfdzf9HQ1+gQW5rGksNQLncfUfHDhOfrVcQeQCFIOYp9sL5h+BXMcQ
         Eq5hZefF70CG3xClzxe2+Mez5COtGXpCZ+s2APHFZrDFwJJql24zOLcHpvJOoae0jWTa
         5LifR8T1g3kknSAaMUjr/iTnR66DOn2fnCsbefEt9uLXxWt87zDvTSWmNnJehLSon42g
         9rCYnrZ7EpWQ21F/ZdhhkDUfGxMp52I1xn2wMd3uT6R24ih/z4mmdgabFaFYi3sszOCu
         snkQmoE6zhUJSSwv3/YoAXxoIKK3rQGtohvF5q45si2pC2rDOGRUiW9ZUa95dJVisK6S
         Bf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=s2CPd73Pjd/UIOMM2lbN5Y4pguFIZFCBuPPYBU70ubY=;
        b=CZJVTkjeLfDzksP17MkUviL4sr7eSpSnNhu9je3Uaf00CiJfeUwJriWlAyKzJ3B5F9
         Zkn2wQi4mEppHInB2JqHmMewv00dbU94WiuKdLPte8TXeT33q/V75+/zfXKl2A0OM2L1
         6QWXEYZxUcWJUDjlfaSo02maurQ2NCrPmd3868Hzve6mHtZC7rK9790w8WP7AIbcWX6f
         bprqeP6FORJf/QpIZWu3FXhToGgeaqJh8qt6yzzxlKGngDfHoSxc50Vs9656+3ldBfVD
         6y+KHpuS+AV++0Ss1xvthMaaUNH7MrBh35MkeHS2EjQ0uLzW4gaFqSi0lioJpx0iE1th
         uvyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DEcnKj1m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q89-20020a17090a4fe200b002299632a00esor4068999pjh.25.2023.01.27.14.37.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 14:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DEcnKj1m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2CPd73Pjd/UIOMM2lbN5Y4pguFIZFCBuPPYBU70ubY=;
        b=DEcnKj1mEwr/VUkGrcAKw0HBRr5j7St/KwA55HKycEnc5OC0js4KhwbGNrG+YkOQqJ
         RQlm3cQg6SPSuZIUGudKQZkd6judIREvFD9CVTDHh9ksqqhbXuWP35/EsV4OXv5OQ+ud
         IenrKETflOfJk2eI7LaHN81vQTGkZ4UUM16xsbP/JryJt76bOfBQrOyQ+b93Uu3USa48
         nyAyTw3ebd3eWSUsCVAxoVdm8g0SVGgsuDQq49J2r1oxeNLN+1y3doUOfG832w/DXZtX
         lI91Dw9x5UTxmMG0W4TrVp9zh+NzFeze08UuoAlEn1njtDZBUxFb0aFoLK3zctg/gK0L
         Y+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2CPd73Pjd/UIOMM2lbN5Y4pguFIZFCBuPPYBU70ubY=;
        b=JWIYxXzfXp/85j8jgc6RDHCoysipZWM4m9BnOPgjeI9gGQHP28NCtCGsqbHbzbDSpR
         di7lw9vFzqkGzz4KIoNrhoRKkhdfk81hhC5b6ox+bjeNspNmM4Jba0Tp1E2LM0v6/kJ0
         Hd0i+bm2cLjspMX3bGW2RVKt0sDJBwyy3jlMy4C4lin3E3LUh8E0tLnYiUFlZcU2Fuzi
         jR1az6giyiFjzefesNTYf5r0jbvdQfrs96KhXh6rRvpOjar4yY0GsOit9ifwiVLTr3b1
         tUyViP8cR6UYi/jmYOoRmcZJciZNrV37hyRAa3piuj30ohP25uSead4lCjwr+ftUq1Nb
         R1lg==
X-Gm-Message-State: AO0yUKWVH0sOAgie0blxSL2YSRtCS67Cq5kztwTF++W9Hi7W6PIcROP/
	XZfFgdQ6ku9JXKkaIGX4d5qeL5m3
X-Google-Smtp-Source: AK7set+qlQekEf0GSrIDvskDxx7cQqiiS322YchR6t4v5o0nQt5EvMeuJslSXrIT1hbbfGBUeFtfPw==
X-Received: by 2002:a17:90b:33c8:b0:22c:1331:9c59 with SMTP id lk8-20020a17090b33c800b0022c13319c59mr71219pjb.31.1674859038440;
        Fri, 27 Jan 2023 14:37:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm2826072pga.9.2023.01.27.14.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 14:37:17 -0800 (PST)
Message-ID: <85606bc0-5e48-9280-781f-b9641c36ce03@linaro.org>
Date: Fri, 27 Jan 2023 12:37:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 06/16] target/arm/kvm-rme: Initialize vCPU
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-7-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-7-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YpUiQCafKMAD

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +static int kvm_arm_rme_get_core_regs(CPUState *cs)
> +{
> +    int i, ret;
> +    struct kvm_one_reg reg;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    for (i = 0; i < 8; i++) {
> +        reg.id = AARCH64_CORE_REG(regs.regs[i]);
> +        reg.addr = (uintptr_t) &env->xregs[i];
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}

Wow, this is quite the restriction.

I get that this is just enough to seed the guest for boot, and take SMC traps, but I'm 
concerned that we can't do much with the machine underneath, when it comes to other things 
like "info registers" or gdbstub will be silently unusable.  I would prefer if we can 
somehow make this loudly unusable.

Pardon if I'm jumping the gun and you handle this later.


r~
