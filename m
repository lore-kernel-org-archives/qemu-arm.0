Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2631724ejx;
        Wed, 13 Sep 2023 02:02:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVm5mCUh4lDJebHYp2Or8qejzDBynXSNIX5ObPrS0TWS1qbglYz6eTUTMofvnK4RR857Dw
X-Received: by 2002:a05:622a:92:b0:412:2c24:f497 with SMTP id o18-20020a05622a009200b004122c24f497mr2205789qtw.26.1694595728050;
        Wed, 13 Sep 2023 02:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694595728; cv=none;
        d=google.com; s=arc-20160816;
        b=vrZLmuuOeGvu5f8L65s6s1oS/kQH+ap1EqzkmPR5q3Sx4y3G7TxKIsEOUt+9pn69qJ
         xN/Zy/Fy9pmwqTWdSstqpI1e0/WnWYrDwOBdBRTqVsfmv7NVn8bRGzdMheGFFtF/XsGK
         B6AAim7LMhlNX1VyVmOI1jDL38ueWQIpZyBrlct/x6VBcaKkVCu0lGebXdRqF6jHyg+W
         B0U7siZonRffMPU6b1ZbBA2+dj4WxLT7tS1JwtEED9mkbvDMgNDR9t4CP6LFp3E2SmLG
         R0ehYoSDgNCkG58/Jt2EweHRW3M2RlPt+k7d8pJBDwjh37WYg0ol2OI0+h3fpp+fHv+D
         //og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=slLPdvZwGLgcsnZnsC8K9w2N/TZJ4yvIEAk6TSfFTMw=;
        fh=5riOZd+4V+b33XiWxvZeOw7zL009b4cL/S8CAEiHnS8=;
        b=oXGcr3PkUC5z14BI+/DK29aKe3eNL6gNp1k4tfUM3yeeqTKZUtGVokzhxzaVJjkTQ1
         OehvkFtLOl91t+rXMgYsw5Kj2zaI9fzvgxQd+kgTe62qQ8+W/FCucsQz8useWD+QZ0/L
         ws4MlQ1Qt/e6YGyJH7NaNaHB7QpE/SY2LDgeC5swplcbBN7yAmEn2gYo4XTVfNkDn2Vf
         UAT402aX/Lxttth6OdGb8tBR0IYxr+VkEV+8m+XfiHAeKGZtzSCAaNJITBZ9A298fKnr
         KVbzkdy6n/esQgh8+kGdC0R5XiF20JgCBO8cCaT9vUbDfJjyFeGPJAM53/oG9YrE/25l
         S93Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A4iRFEQv;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v5-20020a05622a014500b00403ea9d6917si7160954qtw.648.2023.09.13.02.02.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 02:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A4iRFEQv;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694595727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slLPdvZwGLgcsnZnsC8K9w2N/TZJ4yvIEAk6TSfFTMw=;
	b=A4iRFEQvudnOmYgUGvEMvlSGP/qk2ldf6/Cn2i+pGfQp+N68n5Nx3lONY2d1CR8l2rsxFF
	wRlOMU6rsft7+qfLa4eNN8puKQj4kcs3RzUMAdAzrKXilhTs+HkLfoOsHLKkGFDZ1L5iuT
	3LUu5Ir5rNew6+rMJd92//BTOn6GaVM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-bvksbTpJNbSgSoExCuWvkQ-1; Wed, 13 Sep 2023 05:02:06 -0400
X-MC-Unique: bvksbTpJNbSgSoExCuWvkQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4020645b2a2so47121085e9.2
        for <alex.bennee@linaro.org>; Wed, 13 Sep 2023 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694595725; x=1695200525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=slLPdvZwGLgcsnZnsC8K9w2N/TZJ4yvIEAk6TSfFTMw=;
        b=HX/re8r2O2G7Ko3L2PbF3tZ5YdtQJ/VWZTIxlJKj6XNHB7vK5EmjNAXMpVoQc5mKD/
         1rXySIAJBdzeUIyGN+gxlPBF3GS7FFhU3IIjnStPkiJvoeXhXF+t/ctByvNiOPJ6WS6w
         MAHKWXXYNJ4mc2s/kmWtYqELflbHvqF/fv6HcsOgZyvIrnc3KkgfJQ+Q0id7OaVoO6BM
         DBFFRI8kyVES2OjCN8MQyFWKz4bCMlJ22LiZGRHzBeV2ZdnievYh5ltvO7BRsI63HYYZ
         dh4GG2G5XEVn+5kWkEdbc+zYLHhbANvDxsF1LM4OMQAd/0Oqf6vtkHCgRNgLQOuqYrwG
         b5xw==
X-Gm-Message-State: AOJu0YzIlQbJ/yGtIPOpUrU0MgRTaPKFvGuveQjazF4kGy585qrEmvtV
	b5kReUzmCrdJu3+jVbFfzOl/g3/wljJ/atgn3qOym8jClSGtWtfEiL8rX7tQw32f8VbBmEugfyA
	QQy3oJ3kWGVxUucI0Kr4S3E5JT8AHm92MppLoPIu9pESItuwLAN09Z3VLfavwfD0cBckYntbjWS
	A=
X-Received: by 2002:a1c:f701:0:b0:400:46db:1b68 with SMTP id v1-20020a1cf701000000b0040046db1b68mr1498578wmh.35.1694595724689;
        Wed, 13 Sep 2023 02:02:04 -0700 (PDT)
X-Received: by 2002:a1c:f701:0:b0:400:46db:1b68 with SMTP id v1-20020a1cf701000000b0040046db1b68mr1498544wmh.35.1694595724354;
        Wed, 13 Sep 2023 02:02:04 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.218] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c0b5700b00402fa98abe3sm1390242wmr.46.2023.09.13.02.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 02:02:03 -0700 (PDT)
Message-ID: <2a8bc661-5fb0-f514-3ae5-4c6c9acb935f@redhat.com>
Date: Wed, 13 Sep 2023 11:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] ci: fix hang of FreeBSD CI jobs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
 <5cbb92ab-f8b5-4d03-5698-06d0a0b7cfda@redhat.com> <87ledatq3s.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87ledatq3s.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: W/pR4mgAoDkX

On 13/09/2023 10.48, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 12/09/2023 20.41, Daniel P. Berrangé wrote:
>>> This addresses
>>>     https://gitlab.com/qemu-project/qemu/-/issues/1882
>>> Which turned out to be a genuine flaw which we missed during merge
>>> as the patch hitting master co-incided with the FreeBSD CI job
>>> having an temporary outage due to changed release image version.
>>> Daniel P. Berrangé (4):
>>>     microbit: add missing qtest_quit() call
>>>     qtest: kill orphaned qtest QEMU processes on FreeBSD
>>>     gitlab: make Cirrus CI timeout explicit
>>>     gitlab: make Cirrus CI jobs gating
>>>    .gitlab-ci.d/cirrus.yml       | 4 +++-
>>>    .gitlab-ci.d/cirrus/build.yml | 2 ++
>>>    tests/qtest/libqtest.c        | 7 +++++++
>>>    tests/qtest/microbit-test.c   | 2 ++
>>>    4 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>
>> Series
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> Alex, will you pick these up or shall I take them for my next PR?
> 
> Queued to testing/next, thanks.
> 
> Do you have a patch to disable the borked avacado tests? Or maybe I
> should just include Philippe's fix?

I thought that Philippe mentioned that he wanted to provide a patch that 
disables the broken tests?

  Thomas
