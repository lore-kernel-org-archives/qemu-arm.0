Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1311829eje;
        Mon, 10 Jul 2023 09:44:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMu9Dewj/diQlBtH/P+wFYojBEF8LPuBNXjylivYg57+v156AXbOfDA2TNT4MW9Dk1F7gC
X-Received: by 2002:a0c:b295:0:b0:636:abd2:3b57 with SMTP id r21-20020a0cb295000000b00636abd23b57mr9448623qve.20.1689007469996;
        Mon, 10 Jul 2023 09:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689007469; cv=none;
        d=google.com; s=arc-20160816;
        b=sRvGfCBD8Z1kArfOsJ389RSkEkri6VaTGaElHbc8JYYyPqW1uNa1SBquUb0uhdkk9R
         vwou5civi+wfa+qugFdo7K4gJLUo952M7sCL8eoRKIe0pL0BMyrpj/MxnUqGGOyiF4iu
         2hjhCDLUMGk2BpBKKNweyDfSHKIGocJgPKULUKFKL1EFmGhG5I7qZ5fyDHt3dTZ6D6CW
         Y/nzP68KNG4rf6CtCZ/8vJ9n7VZM0pBn2RQL/rMVC0o02z/21Gzvw+bn0mgcqHn7Yfa1
         RkRWnVjv48hre9FPdIvrUjq1zbYjrYnkmPI0gFV8wltUBTp899/sR8dnhYS2LoZA5L30
         oEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xb1StjqhEoChGl9o/gMdYYZN1gH8eJF6tw+EWRq+/g4=;
        fh=IKZt+3BXVpmJF6B7A6sCn0BVK2ZE8WtwCYkhqm/ri50=;
        b=yFCpPJps4pxMFE3/qk5FLDyh0uPv5k1vbmONNszON1VTI98hwq6OKSZaAjnDkRk6QH
         75/OJRk4dM45deDSiSKGRC2yF7KSi5A5YRmd10IqayGCFp2LCAmMMIpxE4nCsVNsIsdQ
         v14ZRY3nkpmoKAqpHk5lLl2ADTKd9MNj97GmNxsyUZRHH4GzO7Qug6Rz+DHTJgKxFgN7
         SiTsV/I4pOxE5QV5Z1nUNbPjuv2TGskuahS0u/NBqPVSHkkrQi7yJYXA06zAMWDcR17C
         YXUJJryyJZ4dl16dE0vbjzDJ04+v8BlUe5CYxiNuYpmgCONa+oxpNtzVdwGxcnu/4GfS
         +fNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UWyn5Mq6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t5-20020a0ce2c5000000b006259b105384si5738983qvl.515.2023.07.10.09.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 09:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UWyn5Mq6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689007469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xb1StjqhEoChGl9o/gMdYYZN1gH8eJF6tw+EWRq+/g4=;
	b=UWyn5Mq673G+WSkYGv9vze2eny4xygg/3uSRGHHsZDaVBUPkC6Jf/PCHXhXw0AHEZTyE2i
	NW6MIZZ6dFcPpg6cnj0OU4rituOrMhKIqI0xXxdyXVRWtqM+GghNPY7qtcWBAN6VNbhw9r
	Db1wwybLefF3DwQROXPw6M1jLjT94yc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-Srb3Mu4yNW2B55aTm4kaow-1; Mon, 10 Jul 2023 12:44:28 -0400
X-MC-Unique: Srb3Mu4yNW2B55aTm4kaow-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-39ecef7a101so3916770b6e.2
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2023 09:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689007468; x=1691599468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xb1StjqhEoChGl9o/gMdYYZN1gH8eJF6tw+EWRq+/g4=;
        b=N/Mjs4aMHlucRP0gu+kG/L0DfUmuYJ7zYYX3mahrik4mo0/r1PRLmubd2Mtwewut4r
         x20rCgY5Cc7ospOozuW2x9LbqfOPkpKmFllSCSJCG7mbxlClGT9p0jn1tfpIu3800wrO
         fFtzlpZtLwA9obds6hohc908lUS8P4HHh9SpJ99X8oK8Qd1FrNUSrRAwfVYhotzzgvAR
         wWd5axkeDTT4HlquuBnm4I545PhPFe9OLpt/XeDr8OXlz0zqX+rldeWLFndVWdEVnGmI
         JJsZ7Isf9OLDY1aN7Kih2VlQ/nDU2ln0Hd7zBSzDpkD/+IEi8Y9YRBQCnX/2pu7+R+oo
         3qUQ==
X-Gm-Message-State: ABy/qLag3LODlpebhf9EJ2fiUI/h0EKWN9MoYhvIe7P60Qxx/d1/f1jL
	3G23xHDck2ToNfmFcr8kpS+NNo3P3MC+daX+x96vleEQj3wi5BfCc0CyOZr4lm2dOdejxqB7Fma
	7FFNkFZkjhdWSPzH1
X-Received: by 2002:a05:6808:1689:b0:3a3:64a3:b5a1 with SMTP id bb9-20020a056808168900b003a364a3b5a1mr11958696oib.7.1689007468037;
        Mon, 10 Jul 2023 09:44:28 -0700 (PDT)
X-Received: by 2002:a05:6808:1689:b0:3a3:64a3:b5a1 with SMTP id bb9-20020a056808168900b003a364a3b5a1mr11958679oib.7.1689007467770;
        Mon, 10 Jul 2023 09:44:27 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.101] (tmo-097-99.customers.d1-online.com. [80.187.97.99])
        by smtp.gmail.com with ESMTPSA id k6-20020ac86046000000b0040372a5968csm90191qtm.28.2023.07.10.09.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 09:44:27 -0700 (PDT)
Message-ID: <0c70e8f3-586f-5683-7ef2-0aa3138d7832@redhat.com>
Date: Mon, 10 Jul 2023 18:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] tests/avocado: Disable the test_sbsaref_edk2_firmware in
 the gitlab-CI
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230710144348.239441-1-thuth@redhat.com>
 <CAFEAcA_QTRJwtQxh1FRHtwjSARAptF-j1ZeyGen8xBfrhq7tww@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_QTRJwtQxh1FRHtwjSARAptF-j1ZeyGen8xBfrhq7tww@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YHcOAIv3F5BT

On 10/07/2023 16.54, Peter Maydell wrote:
> On Mon, 10 Jul 2023 at 15:43, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The test fails occasionally, see e.g.:
>>
>>   https://gitlab.com/thuth/qemu/-/jobs/4196177756#L489
>>   https://gitlab.com/thuth/qemu/-/jobs/4623296271#L290
>>
>> Disable it at least in the gitlab-CI to avoid failing CI
>> pipelines due to this problem.
> 
> I'm not really a fan of disabling flaky tests only in the
> gitlab CI. It means that plain "make check-avocado"
> is useless to the average developer because it can
> have all manner of broken or flaky tests in it that
> never get tested by our CI. In fact I've had to develop
> the habit of running "GITLAB_CI=1 make check-avocado"
> so I can run the CI tests that we think work and not
> get distracted by intermittent failures.
> 
> If we want "disable this test except for if you're
> trying to investigate why it's flaky" then we should
> have the test be opt-in, not opt-out, the same way
> we do with QEMU_TEST_FLAKY_TESTS in the qtests.

Agreed, this makes perfectly sense. Actually, I was looking for something 
like this in the tests/avocado directory, but I did not find anything 
similar, so I went for the GITLAB_CI variable ...

I'll send a v2 with QEMU_TEST_FLAKY_TESTS instead (and document it in the 
docs directory).

  Thomas

