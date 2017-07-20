Received: by 10.25.44.15 with SMTP id s15csp2553449lfs;
        Thu, 20 Jul 2017 12:49:31 -0700 (PDT)
X-Received: by 10.200.3.45 with SMTP id q45mr6172819qtg.3.1500580171241;
        Thu, 20 Jul 2017 12:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500580171; cv=none;
        d=google.com; s=arc-20160816;
        b=pw1ZhEsjKj29qTq2rU8rHTXcwiGrFJzQUYy4zWueYbuwcaof3FbYtX84DoTUJRBPYG
         Zff8h54rWm8NUe61W5dt3z0uTmFF9K40iKEq0lc3IiZyB03fguLg0m2nAf8sRe3rT/po
         pGywvKT29olwmdbxPYMQbCnNrikdg3KZZhxFFjCiRcqB/9RWfqYfB24JVCBCcD60UD23
         QRLZywtxrLx4ZclsjyMpJu6wYXqd8EGO3hMmeoq2O2NeYLF5nE6YgFcqC143oKNlfl/w
         weqVAGENVnupoq4VA5Jls6NkJvjxuN5cwQZzTjOyYDkcp8LoCxBB4mzIl/QG9z9UCOq+
         Q8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=M/k/V47OdeE8eaX354dJzr+WNaNkU44MnZjzHP/bBno=;
        b=Vxn3HbH1oeMRlMU/ckGf5MPpS10tSPWZDLezX8kxE/nVSxhNp35AKzVa2IgK9Y1Q22
         j6Rc4HHuvACaXAiuNNuXyFEyMYyTxPBdl0/cVFwp+dDDnLdioj3Uxs5azdfiER33jW2O
         QtPWeq1HKkZs3visSFzUF921GPyirTOw4wM/GFsf8AI8xghDHDXuvSbjBXzsbJQhkxET
         kcseIIuZPImxLpyeB9yACTjhDG/3riAuYbOcXzBWQzM2LImQyLEgz3qS05uI/e4sjQQh
         Q2jMv1Y9gdC2T+EnzEi5V2px8iNCxhfOPVf6pBT4yIn7/pNO1MHLYBz5vlcx0iqcJNGg
         ubZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=SDiha/VB;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::236 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com. [2607:f8b0:400d:c0d::236])
        by mx.google.com with ESMTPS id d144si2509390qke.245.2017.07.20.12.49.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:49:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::236 as permitted sender) client-ip=2607:f8b0:400d:c0d::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=SDiha/VB;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::236 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x236.google.com with SMTP id m7so30329214qtm.4;
        Thu, 20 Jul 2017 12:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M/k/V47OdeE8eaX354dJzr+WNaNkU44MnZjzHP/bBno=;
        b=SDiha/VBTscuvQyt2lTha+sba9jBs5sa6lKhuFFSBQi4a9YlTFXGQlnrOCLAFA4txs
         5Vh6xauW37bfahKxMIq4jwnF63rkNyrMYOsJjohTSZpFP3uzutBEOcLk5y8VQDLRJvKR
         abalgkzq7C4SGRUP+BtG0/G6t0E1oCTeoJ1UA5EEXx7rpQbHfbdBU+dycSuvRE16Wsse
         tr0s1pH78NTG7JrsCwXxNK7g30CNkE4Ll3GvvMsVXVblfLQyYDDrezNQ5YlZAfJNSifI
         t7SdNDWnMRVdazYgu+Ai6apiVAFGy4SIErXmVOUieA6jYIZSsKji2q036dULnISvamLX
         VXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M/k/V47OdeE8eaX354dJzr+WNaNkU44MnZjzHP/bBno=;
        b=WYZpdFsqzETC8mQcHOVZBLvGDFx5Fvy7NlSPcUwaYpReV85LuWTWMDI/sUUJRqYJ/B
         Odend761Mg/5qY5beMHCjMF/5iBrW0ymFnX/QrN7JvMNzbcAsRBQUhE3bDM2KuTYu9aO
         qb9+Kuev9qU6Ve28t4cv5BEvWB60sYXAWSzrHLQ0lzsU6pYJsFU4PYVhQzRkvxNPs8tB
         hw4gixa2YGSthRVDeSsCG7ZBtveVv92GtNo/UuqjTelEZSj3dif7p97jH9FYW7utU/mV
         s9d5imq3+9lcCPSWLDLBXVhmpZxXyKddf6YRxmV4rTHq9HnbSfFmnigHfoFzq5oAbYkm
         jDKQ==
X-Gm-Message-State: AIVw111xFZ87yllFI2De8Ci29EX/tB2NviPX4WeYGcOfCIlMo7wRSrcQ
	zWg4AQfY3K8/qefzS/A=
X-Received: by 10.237.36.161 with SMTP id t30mr6940022qtc.180.1500580170335;
        Thu, 20 Jul 2017 12:49:30 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
        by smtp.googlemail.com with ESMTPSA id z47sm2294124qth.86.2017.07.20.12.49.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:49:29 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH for 2.11 15/23] target/arm/translate-a64.c: AdvSIMD
 scalar 2 register misc decode
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-16-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <38211f3f-b5c5-003c-f568-eb9088c09f4e@twiddle.net>
Date: Thu, 20 Jul 2017 09:49:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170720150426.12393-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1B4c5j/DhaAS

On 07/20/2017 05:04 AM, Alex Bennée wrote:
> +    for (pass = 0; pass < elements; pass++) {
> +        TCGv_i32 tcg_op1 = tcg_temp_new_i32();
> +        TCGv_i32 tcg_res = tcg_temp_new_i32();
> +
> +        read_vec_element_i32(s, tcg_op1, rn, pass, MO_16);
> +
> +        switch (fpopcode) {
> +        default:
> +            fprintf(stderr,"%s: insn %#04x fpop %#2x\n", __func__, insn, fpopcode);
> +            unsupported_encoding(s, insn);
> +        }

Just noticing that we ought not issue N copies of the unsupported_encoding 
exception.  Return afterwards seems in order.  Is this a pattern that you 
copied that wants fixing elsewhere?


r~
