Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp909746ejc;
        Mon, 31 Oct 2022 05:08:52 -0700 (PDT)
X-Received: by 2002:a5d:59ae:0:b0:236:6861:a89d with SMTP id p14-20020a5d59ae000000b002366861a89dmr8087704wrr.437.1667218132696;
        Mon, 31 Oct 2022 05:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667218132; cv=none;
        d=google.com; s=arc-20160816;
        b=RoJASAyeEywdqMGd0OhgMIkcXMgZYw9Nf2r5LqE95blI3s7gqemZvv4FMahAiFgcEx
         sdU6+/E3RtX0J68N/QAyc0B9OZ6sUIsm5mITSxQX3QMXDYzr5NFyFdlQKYFp5rDvaJ6E
         HNgA6nZpXE+ZFDOLVIzVm9/6jAFQmtpCsDsk0gWO1gTIqufV6npaudjIUwHSLdacy0Fv
         HYu/KAnfGPjV5KGsUmFMQIyiTrp9XZpkCaI5G6TcNdP0BwlJNfTiLGJRpnCX9b5Fzi+d
         GLgvR3U/cnvM2I7TkqLIWOC26ryDGJhtpOVAyGBnBsrMC/Pl/3jOAF3KyttFwbYrU/Aw
         VpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DBjVtxZ+wHjdKuTsvI1g5CLD6lyRmqYU1lJ3qz9q0ig=;
        b=Q0RYuM0KjWiqnySADFB62u+itpj39787vS2XtjRvFposJHYAbm8OqpSjdwgTcC+LRd
         2P2Zzj8TZPH5D67B2PX8oANq2UBqMwkziFyOdKf4I6N/DiIzEj7RUxhmlXgbpYHMmgA1
         xajBxOD3KG3h34NBHCTlkp86YbMVk5E4dMleQtSIEVi6JhpwUz0+2vNzPP+h4R0x9tVf
         q7wo/aTHj/NO9VWrrsrkFUKnuFtP+4LH5gaJILBY0jnWp4sHxAVc5tQ6ePO9KVGK5KkQ
         ZIyIzBLgBL3E1yfNm9NruQiojCI+abQubGsdHrgXkI9FDrXeUpC6Vo70SOymnmzUSYgq
         xY1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGRqjA5D;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p10-20020a05600c064a00b003c6f26651a1sor1290366wmm.21.2022.10.31.05.08.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Oct 2022 05:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGRqjA5D;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBjVtxZ+wHjdKuTsvI1g5CLD6lyRmqYU1lJ3qz9q0ig=;
        b=KGRqjA5DfR+ppG0HCNsbCgm1J04GM5xe61BM9jhJu95BgrjHSw1Q+JBHwos3XTTfPO
         e8yyCYJz7LISUlV1tFebUpH/QrqjTiaH/UcOIx8QksoxX8pY4DUmTz1sanx78EBvAi+C
         NVts0vuNwtX21qAF6GweMUGNqapFawHzer73z9pf+2W3UXQAHSAhZ61jK85cysJEEp8f
         8oOWnZBBG4ZBNqqzoVSMfw13AxfxcG9pLc3yblZe34XC893plkkcFkNIWtj/YtrY2bjb
         1YYXkuCkbaRtP6eBZppPiCMBk5mWlDeSrkShfEJfIW6jgIYhqdJDMuF5TYNln7Bh6CRz
         U2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBjVtxZ+wHjdKuTsvI1g5CLD6lyRmqYU1lJ3qz9q0ig=;
        b=Qc/Tmg7wh3oXqqQX/hMZqndRzV08qYEoKIMigqL43WuzxyFzg7fMlfJkGmqiYAjSeo
         4SKugZDNzbWIvY1MFRL+wgnSypSbVeCh0aZxHBXZVMMMYbHX2uMqtf1Aqxmx/7tLERD7
         Gf+5TlhFY9Cd/+LHW02TSlqP8WzTBpWqi9Pg4u+5n2fhnhZFzzl63Ph8lKPqJ/BWStTo
         qJ12GsX5JUZNxit6vc1/uyrOF81r+rT/DTJ8mzGRz7MTAP/rDLdy+khJ5mhswGMQCmAk
         NL0+rVdROdR0AiFcjs9nYxzUr0JZhJwi1ZvVPTaYiIsw0AtooyLBlaOKxwIXl07RQ/1k
         y1ZQ==
X-Gm-Message-State: ACrzQf1nbVhobFKdAKWrPIFSgQgZwZ/NRXb8xbnhk+rFtqKSD2r6VCU7
	1JqMKwtqHct9gLgSS3Ta7SZURbWix3Nwr1VT
X-Google-Smtp-Source: AMsMyM4oTqIaT0NSE0CnIq2mDM8aUCG3SroRvxe1/L4YPDjTjP6r7+gNy3ZjMSEI6sLr58kc9SgjGA==
X-Received: by 2002:a05:600c:314f:b0:3c6:f3fa:cfec with SMTP id h15-20020a05600c314f00b003c6f3facfecmr17616682wmo.68.1667218132421;
        Mon, 31 Oct 2022 05:08:52 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id u7-20020adfed47000000b002366f9bd717sm8494423wro.45.2022.10.31.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:08:51 -0700 (PDT)
Message-ID: <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
Date: Mon, 31 Oct 2022 13:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org>
 <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +7v0G/akKCth

On 4/10/22 16:54, Peter Maydell wrote:
> On Tue, 4 Oct 2022 at 14:33, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> The MSC is in the address map like most other stuff, and thus there is
>>> no restriction on whether it can be accessed by other things than CPUs
>>> (DMAing to it would be silly but is perfectly possible).
>>>
>>> The intent of the code is "pass this transaction through, but force
>>> it to be Secure/NonSecure regardless of what it was before". That
>>> should not involve a change of the requester type.
>>
>> Should we assert (or warn) when the requester_type is unspecified?
> 
> Not in the design of MemTxAttrs that's currently in git, no:
> in that design it's perfectly fine for something generating
> memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
> to meaning a bunch of things including "not secure").

In tz_mpc_handle_block():

static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs 
attrs)
{
     /* Handle a blocked transaction: raise IRQ, capture info, etc */
     if (!s->int_stat) {

         s->int_info1 = addr;
         s->int_info2 = 0;
         s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
                                   attrs.requester_id & 0xffff);
         s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
                                   ~attrs.secure);
         s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
                                   tz_mpc_cfg_ns(s, addr));


Should we check whether the requester is MTRT_CPU?
