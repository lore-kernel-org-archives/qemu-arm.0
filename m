Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6494025lfp;
        Wed, 5 Feb 2020 02:19:11 -0800 (PST)
X-Received: by 2002:adf:ce87:: with SMTP id r7mr27512952wrn.245.1580897951037;
        Wed, 05 Feb 2020 02:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580897951; cv=none;
        d=google.com; s=arc-20160816;
        b=AcXAUanRg3mntevJMNixbBZU+sM2G60xc4M/GU+FE98QrJga91rYXmaJJxRo7DkUPM
         RBHZ2rThfpYIG/lYzEeoE165Axd0IMFBTyEuWHfD/PqmzN5K0Y2S3w5UMaDrvbYMlnpN
         vAYBw2/4/9FlsEcoEIToiPUZdeQFgFpj91xHHAvanr446mu1YNNK05JfLx/nL1dX7G0m
         GcWhkmIMxN2YDaA2GcpgM50jH/OVo5g9uTB2OlRES6M9IznXlXMsX4eBo2j/CeQ7TIci
         rrjm3xVNu5yhlvXeCPCLj9MHZoIU3ljMaL3YLs5otob75pbR5Nbtu4reQ/nEKatBV90k
         EA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=cheKAPsPgiaBJIzhq1a63cWBr231jEjpWu3kGAqeVc8=;
        b=B7o4DR9VRPBEC+UvNdkAIcKg3VSqX3aepzWx9ACpKhP4zMil5Bu7A7O59Y4jc3LlZk
         ALTCylxNau0g7m56FrZedwV0OOyk9GeewGZM+MqmLINsB7YJNw/5uiZb332nCUcbuPx3
         8IXEFCcPcI5ZARZYNmBgMSnpMCj9CE02GbUAT7fhUGOuKZLYxc8RJq4pn9gMGLO6s7mU
         TgfwgOXNXj9NNmRaBjOjEe70GbZ0bMV2eb2LMPEYnnVre89dBVRm2zkKN/8rO58aHyBv
         mKpTTupcdoHdXULVjGaqIcD2UW15xk6N87azC0PqNP0vuLNgfSMqUcG4lf7OBHMez/GP
         fc+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4QBuU6E;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t12sor3722900wmj.11.2020.02.05.02.19.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Feb 2020 02:19:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4QBuU6E;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cheKAPsPgiaBJIzhq1a63cWBr231jEjpWu3kGAqeVc8=;
        b=s4QBuU6EEzgY6T/cy6w8iECthSNEHJckwyExzoY2T4Ml1v6jtAVrtmM9KkSQjmogbW
         j9xTpwlpqwbiBum7JZfQHMVgwFP/2YN87AS7ABFIt1Wu7w7V+5deA3EbBMiAe2byNX7n
         NerVI9NpgpOWlFk4JZX0do0Lynvd7l0UxOVxxmNUaEN9r8iz3lfyiS2FVecNSlRB8ScD
         QIQDJVcWkhGJVSWoWInn9fW1BuQgpjLydfftGf6Wt543swhuvfZFE6GifQZzI/N6cusM
         ZETv3nPU4oABCynatusWfApmxiRq5ahrwZ9vrugYlaU6wEA7/pYaI8DZAuswOJ80dXyl
         Bx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cheKAPsPgiaBJIzhq1a63cWBr231jEjpWu3kGAqeVc8=;
        b=TXbPTA8nccbtfEq40CM+Mtf8BfzdZAecGzLYF3zbEW71Otx3hWOnNe3lYt6UrXGio9
         4Zlw/c+OOwfUnvuFrFkD8PxOF6rZxyRP1atunbq4FqDgQ+e++8GlHcJq9cx4zckKhUZi
         abRd+MUKvMQPFdeUtj4psjyGGKbA5ALBGrGWdlgw/vJ2uI3k1dFkVzCxwR64YczBZdN9
         qr53zR+3Y4NM2wqZZzaBCZUz+TlAYeVD8asxefAZP47u47jJ7xvSoepEr16xLNKZbjW8
         E8KSehLq4uVJi9Tmmqcd/BmhjtFXYKdKQgR/vL0AXeVx9WvgiM1Zk7+c4iJMmjfdERa2
         k2ag==
X-Gm-Message-State: APjAAAXhc0Gdt459BvbIS/Pz7+l8kDuqlyccIqEMtdy+9T83aL97B7KB
	m4bT+dfM1ljYL7VCFIwQMr/XiMu2wbqPzFbD
X-Google-Smtp-Source: APXvYqzS6N41oLXqSKUb5BITACNMA0uXEY14OATW2UonILjtqc6AtJciBlYwL9VTjxd0Ief1Dy5WAg==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr4850483wmi.58.1580897950601;
        Wed, 05 Feb 2020 02:19:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.27.246.193] ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id g18sm7273906wmh.48.2020.02.05.02.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 02:19:09 -0800 (PST)
Subject: Re: [PATCH v5 20/22] tests/tcg/aarch64: add test-sve-ioctl
 guest-debug test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-21-alex.bennee@linaro.org>
 <2731815f-9a72-390b-0a8e-73b77c4b62b6@linaro.org> <87lfpi81sn.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a361a310-f6f8-9c17-6846-64e9f0b189f2@linaro.org>
Date: Wed, 5 Feb 2020 10:19:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87lfpi81sn.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: FdrtqOq9Oks5

On 2/4/20 9:45 PM, Alex Bennée wrote:
>> Also, ZCR_EL1 it itself not correct if the
>> hardware does not support all vector sizes.
>>
>> See some of Andrew Jones' qemu command-line work.  Try -cpu max,sve512=on and
>> then use the ioctl to set vq to 3 (sve384).  The result will be an effective vq
>> of 2 (sve256).
>>
>> We *really* need vg, as computed from sve_zcr_len_for_el().
> 
> How come TARGET_PR_SVE_GET_VL is happy to compute directly from ZCR
> then?

Bug.  It didn't get updated with Andrew's changes to limit the set of supported
sve lengths.

> I'll put the vg back in but it seemed a little pointless given the
> gdbstub ignores it.

I'll say again that this is a gdb bug and we should simply report/fix it
upstream.  Don't try to work around it in qemu.


r~
