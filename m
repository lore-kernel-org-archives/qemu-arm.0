Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2664656ejb;
        Mon, 4 Dec 2023 04:43:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXIQzsQ3giGbIoBl+hKvyPdEUn+PcyuoiBQR/xx+FrfErgwUfSQaMNAyUFH0xoRyzc+S5L
X-Received: by 2002:a05:6214:11a4:b0:67a:ad71:ce63 with SMTP id u4-20020a05621411a400b0067aad71ce63mr4773017qvv.90.1701693827577;
        Mon, 04 Dec 2023 04:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701693827; cv=none;
        d=google.com; s=arc-20160816;
        b=LMaxhRqMscXW7vydndBEGOtGZ3aQmCudcT7p4omW6H79tONqA3ZZfEMffauLyNMvJa
         wdF5Ruznvwh8IQgVNbmbUv2l+fu0pONmSj3vdXaonF+nd3Rtjh+Sb3MS6pTOO63jswlW
         hfcdp4jifRDtx7xnBCEhD2VmYQZjs3DFb6bViX1ClC7lHf+oo5ojdK9PV9s6bPU13pud
         Wb1OErAGFsQaF2xMucQCo1NOGtumRx8hN9s8k2kvT0yIh1fF7R8GGx9ebANi69Sa49uR
         FfrkspCiWdP3yeA9/9UIFT3XHh6uAOxv8ADXJqL15TVWRxXAmTngrjTrRfyXWnsB2Bts
         MK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=D+HuZSsmQS/rqOmwoYbeey5kqj+jdcg9vitNcUC0Rqg=;
        fh=82P3E+KJKIM5XIqS7na1aBqLNRsU0K3cn72rosvXq08=;
        b=eGa9SnnA4KKtUrxa7DjxzT1BxLqRh3ZYTTYgVcZ6bKxWLUkP3+XcXgiTokUVXp2v7A
         W/BPZZzxN3B7zV+DQ3ngNUHoDmBTjtUE6H8BnWw3mUdPxSphQdW0fmgjCEIA+5AmcMNR
         EZ20yGhXahjoHQde+ahN5NKnc3gtPRQbRrGoH8vXccgYnIQ+3xFj5P0FDSXAxzqoMt8y
         YOoDmgKu8LVxTp+vzuq3GjBW/ik8cet21wtFiwLM9p86hq+RHGQ/2ejYqnWEzLPWIqUV
         WQj5fX0jmPqC6sw4Eu3iOdVyawusquSrVCmpETvmnTILK4wuyW8D8i8Y9GfsE9tXjQER
         wchg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gVugbSwO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id mh12-20020a056214564c00b0067a9a386783si7464471qvb.324.2023.12.04.04.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gVugbSwO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D+HuZSsmQS/rqOmwoYbeey5kqj+jdcg9vitNcUC0Rqg=;
	b=gVugbSwOe2jBjBOZxpE0eNvy6ST6QYHLIB/rYlhTZTcdfCiwxG6KsMiw8wBK5e8570a93I
	yl4FuoVq5Tp7RwWxIgeqkldr7mhHPhuZgfZAnwuZbWtFIWZAntaY1PrChhvtBOVTTfgG02
	sAIHfUW1TWOXYGCVH8fDshidccufwJo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-66uhWvcSNbayUAK3mEIbIg-1; Mon, 04 Dec 2023 07:43:46 -0500
X-MC-Unique: 66uhWvcSNbayUAK3mEIbIg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40b32faeb7eso34259285e9.1
        for <alex.bennee@linaro.org>; Mon, 04 Dec 2023 04:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701693825; x=1702298625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+HuZSsmQS/rqOmwoYbeey5kqj+jdcg9vitNcUC0Rqg=;
        b=HtQ8kN4LHBolZel7II8I1ojqnJewNGw8lEjHme9NAK+PuUUUQp9QOa3bQ920cTIwC0
         QqUEQ+QEFvlDlkF6fVrgtFWR5xbKag4abMxcUC6Mpiw9pkFunTcN+CzeMAzbynWIVoh/
         yhFqH9VDVWBVJxVo0wfpy9v6KbK9GxHwB7s+CSYL0ItRQGMzKJIWSnVEVuYniw6b9lAI
         1JLDJkfDci2P/V48vcVR1JSP4NuNmNMxZSlMtTZav7C87+VEkDo9VOSa1tRSJcLLUAVs
         5ObZYBE3Yk0GYvjKWYmbUcHDg9G2sb7P4Ajq3/BUSp7UtN2gG1CUEDeHueopBvIbYlZs
         zDiA==
X-Gm-Message-State: AOJu0Yz7nAXc8QnLb5AjDQWKrL60eBV7fnaPPRifSmLwlJbvRCznpl+U
	eCgzk212dyx5UzfkBOY1FzS4Qb/WAlhoGh4/uqjm83gCOeFtxXfnkbM9gJS/XqrgJf9aEWecpnO
	fHSNR1eIMlxoFYSe09pm+7lNJcGt81P+HTTpGA0W8k1zt8l8SWq8spwUbYcBESYqwQ5z0XTAo
X-Received: by 2002:a05:600c:3510:b0:40b:3417:a667 with SMTP id h16-20020a05600c351000b0040b3417a667mr1814133wmq.12.1701693824965;
        Mon, 04 Dec 2023 04:43:44 -0800 (PST)
X-Received: by 2002:a05:600c:3510:b0:40b:3417:a667 with SMTP id h16-20020a05600c351000b0040b3417a667mr1814104wmq.12.1701693824632;
        Mon, 04 Dec 2023 04:43:44 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-85.web.vodafone.de. [109.43.178.85])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b0040588d85b3asm18395958wmq.15.2023.12.04.04.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 04:43:44 -0800 (PST)
Message-ID: <181145d8-4d1e-4b19-a77b-1c583155a725@redhat.com>
Date: Mon, 4 Dec 2023 13:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] gitlab: build the correct microblaze target
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-7-alex.bennee@linaro.org>
 <a9b7f414-5229-4dc6-9d32-b95d36cdbaf7@redhat.com>
 <871qc29m3z.fsf@draig.linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <871qc29m3z.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9ISSmOCizXQK

On 04/12/2023 13.40, Alex Bennée wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 01/12/2023 10.36, Alex Bennée wrote:
>>> We inadvertently built the LE target for BE tests.
>>> Fixes: 78ebc00b06 (gitlab: shuffle some targets and reduce avocado
>>> noise)
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    .gitlab-ci.d/buildtest.yml | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>>> index 7f9af83b10..62b5379a5e 100644
>>> --- a/.gitlab-ci.d/buildtest.yml
>>> +++ b/.gitlab-ci.d/buildtest.yml
>>> @@ -41,7 +41,7 @@ build-system-ubuntu:
>>>      variables:
>>>        IMAGE: ubuntu2204
>>>        CONFIGURE_ARGS: --enable-docs
>>> -    TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
>>> +    TARGETS: alpha-softmmu microblaze-softmmu mips64el-softmmu
>>>        MAKE_CHECK_ARGS: check-build
>>>      check-system-ubuntu:
>>
>> We've got microblazeel-softmmu here and microblaze-softmmu in the
>> build-system-fedora job. So please don't change the ubuntu job here,
>> otherwise we're building the same target twice instead.
> 
> Hmm - what would be really useful is an actual microblazeel test image
> so we can test what we build.

We've got at least a small test in tests/qtest/boot-serial-test.c, so we 
know that at least some instructions can be executed via TCG.

  Thomas

