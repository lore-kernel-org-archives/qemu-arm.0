Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp866533ejx;
        Fri, 11 Nov 2022 05:23:12 -0800 (PST)
X-Received: by 2002:a05:600c:4aa0:b0:3cf:cfc8:9450 with SMTP id b32-20020a05600c4aa000b003cfcfc89450mr1247301wmp.99.1668172991853;
        Fri, 11 Nov 2022 05:23:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668172991; cv=none;
        d=google.com; s=arc-20160816;
        b=Ea/dC1QfLv/Tk8qdNWrdTIzxUg7gjT1EIRV5tSYzb+4LKce9zbFmZJn616YTMstmgZ
         wVmjpXpRBFsPXhBjftNFGQd6EfMOggnxXoaBTjcoQvqo1OOS3MolAhZi57G3A1gZBn/m
         aQWn0gglTOI0hv8uRvGASUKlDfqagZBQKcrkR9naIALmHLGxdgImibcdm7fjiLdBHa/y
         TKnxztqdad0rMtFaSDgfac4snv8h8idHuegw2RL+Gm61fclDpPcsjos9PBnWR9SWL6Nb
         HrJL9pfXf0Ua8Lwr+vwYQ6DM7t0KodG56rNASzjohqEsa5m/P/NlvmZrcqi+1meP1KUy
         RTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qXgo7Mw6qt0EJsFqvbTbEi1XSmF0KPUKKh4M2kBzFCI=;
        b=Q2eURQBUOltWE33ZrqCNq32/ZBH+pqdg8/PsX6CVCBrmqUYXBiqUrDvnj1V8zqhEXp
         urraSN8I8Cqk8hSRUde5ecor4vAgKt+63HmyK6Axpm55huy169+sYCk78z5dzFWgGb+3
         hv2ljZ2/VjVEuy5Bycsv2lXKGnZfjTeC1Rlp9hOVtnnMRGi1Be44TyFgAzKCPz3arduW
         JkXuz+per07RH2Wk7CVdQPSw+rdnEUUnx6M8S4lvslM34xSTQKuiRM1EELc/QeGroVvW
         Sjfp7Z8Y5K8FcFmS6oF3rYVwd4iEMyeIKQQwK6VqFp+FZQduLq5eFSN5ho+z1/1Xf1R7
         rWJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KOCHQYp3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p17-20020adf9591000000b0022e5ec02779sor1074186wrp.61.2022.11.11.05.23.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Nov 2022 05:23:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KOCHQYp3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXgo7Mw6qt0EJsFqvbTbEi1XSmF0KPUKKh4M2kBzFCI=;
        b=KOCHQYp32bE3vJriEGdnIqwr5wFjnqlkR5vP0MqAUYkgtGP97xKIUhOmdtDiojGemw
         K8qDIutC+p8cmjOiiH9FTy+qGOrzGOrGPLMmhVANDAonzxwstmlRL58PlB4OJwnjI4im
         mDPj4C8fZhaEEAX6026JU5aSUlcr71zLHP3ljBP8V1BIyMD/hKpgaeCgKktA8DBwTqPD
         wCgr05F4kf7uKOtEaMuLvzIuS5EzKWzZ59i5QlpQfbtF248dzPvsyNtSe/uRzViYv6BX
         g9A3FlRojOirT/0lyv7rY1LilBRdxcYEGH4gN41aIaOgwQNSxvXzQFuDfK115QsZQvKy
         P3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXgo7Mw6qt0EJsFqvbTbEi1XSmF0KPUKKh4M2kBzFCI=;
        b=sQ7RBJNRcPXtwPb8AyJ/iPoDSN1ilY2Dn/xU1QK4i2cUZEEWG3k+5Hb2cC41WaJ+a1
         lNxAm1h09yR9BgE1Y0tEmS50wrf6jyIuCmu3INxODlhQedkPRa2l+MTS8ua+AhFuVcG9
         /1V/mmMAztiya7482tGNgDFulUrqM1BA3vf+ySxkdlHxm6mCgtKaYYaOeLXmkFFlKNmt
         vB+Lbl5QQnutnDlOUqU/MxEXb3jDAeGp2tQ0SCUYHnUweJiFiPKJlPj3CKSA8MB+C5jK
         l6n7+IAV5iXjlNifz+cqVveK+2QxNCTtodkxXzZ/S8wmD/QBCOStj7zUsaQR1sdZH2Uk
         eUdQ==
X-Gm-Message-State: ANoB5plaiDqYFAx0x0LnUjCXPhQNLQFn9f137PdgQAYj3Lu3oL4w4nkz
	6YpDB3GL/PGgb1b4pmLsC/MOylpJ
X-Google-Smtp-Source: AA0mqf7BWg7m4kGogxRprL5RpzQBUPyLl4H7d8IWYT2apA9hfZk6+UdRhe0qjh848FgCmbM+vR5vQQ==
X-Received: by 2002:adf:eb51:0:b0:236:6253:e2c7 with SMTP id u17-20020adfeb51000000b002366253e2c7mr1238298wrn.434.1668172991458;
        Fri, 11 Nov 2022 05:23:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [10.50.0.10] (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
        by smtp.gmail.com with ESMTPSA id q10-20020adff94a000000b0022cc6b8df5esm1929843wrr.7.2022.11.11.05.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 05:23:10 -0800 (PST)
Message-ID: <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
Date: Fri, 11 Nov 2022 14:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
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
 <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
 <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ih1E+AXHVpMq

On 31/10/22 14:03, Peter Maydell wrote:
> On Mon, 31 Oct 2022 at 12:08, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 4/10/22 16:54, Peter Maydell wrote:
>>> On Tue, 4 Oct 2022 at 14:33, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>
>>>>
>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>> The MSC is in the address map like most other stuff, and thus there is
>>>>> no restriction on whether it can be accessed by other things than CPUs
>>>>> (DMAing to it would be silly but is perfectly possible).
>>>>>
>>>>> The intent of the code is "pass this transaction through, but force
>>>>> it to be Secure/NonSecure regardless of what it was before". That
>>>>> should not involve a change of the requester type.
>>>>
>>>> Should we assert (or warn) when the requester_type is unspecified?
>>>
>>> Not in the design of MemTxAttrs that's currently in git, no:
>>> in that design it's perfectly fine for something generating
>>> memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
>>> to meaning a bunch of things including "not secure").
>>
>> In tz_mpc_handle_block():
>>
>> static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs
>> attrs)
>> {
>>       /* Handle a blocked transaction: raise IRQ, capture info, etc */
>>       if (!s->int_stat) {
>>
>>           s->int_info1 = addr;
>>           s->int_info2 = 0;
>>           s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
>>                                     attrs.requester_id & 0xffff);
>>           s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
>>                                     ~attrs.secure);
>>           s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
>>                                     tz_mpc_cfg_ns(s, addr));
>>
>>
>> Should we check whether the requester is MTRT_CPU?
> 
> That code is basically assuming that the requester_id is the AMBA AHB
> 'HMASTER' field (i.e. something hopefully unique to all things that
> send out transactions, not necessarily limited only to CPUs), which is a
> somewhat bogus assumption given that it isn't currently any such thing...
> 
> I'm not sure if/how this patchset plans to model generic "ID of transaction
> generator".

Does your 'generic "ID of transaction generator"' fit into MTRT_MACHINE 
described as "for more complex encoding":

   'MACHINE indicates a machine specific encoding which needs further
    processing to decode into its constituent parts.'

?

> 
> -- PMM
