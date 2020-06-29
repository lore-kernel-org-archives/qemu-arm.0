Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2899496lfm;
        Mon, 29 Jun 2020 04:35:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQW1k4zmi+5dR/y/OPsU3TLLFjg8sJTXza4bJ3FYh/cW5GiZudX83DNWZN+pqfKRmE3TlF
X-Received: by 2002:a25:cd01:: with SMTP id d1mr24098776ybf.479.1593430534667;
        Mon, 29 Jun 2020 04:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593430534; cv=none;
        d=google.com; s=arc-20160816;
        b=YHR5fyFzPXl5N0T4sdsGX7axJcTDYoptGuYBBNlWOj3VZIMYCGoJGfiBKw4IXuJ5D0
         127/78qBWZuPu7vgBWq4bIQ/q2+JU3EWxk4SGcx3eMxgkr846Udjbl7oylV2EYGULns6
         WE9J8+3BPlIZRot8EViCDnEnNpzccVZc8g7f6f1zV0UIR/dGE276ACmJ8OlNs7PLXoAW
         7waFLIbNgwaiNv3vbOhAtf4YK2K3x//IJ/5PtDeDQQt8pxtwCsU3fgK0/CXV+T1Oyoin
         5hFT3o/iUQ7Ac1+XJNZ4S3R197Jrckhp3heB8u93WfnSxj4QsdQuzhcEAF/l+MdqsuOH
         7DPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=Qnk49S+rPRO9pLLaZn5U8AfCNZDBuDNmkleDV9AAQ9M=;
        b=1BOhuTUnS55aimSyo6hD2MGD1nXwiuxaOqCAVSWgfVr6+1hNU5IDJzDriadAAjVC3T
         yowWFV7ps6t5aHiq5Y1/3AQwnfFp//+/UHCOSJGAWQep0VPRuJziOA6HGhpGxkmufj/d
         h1Vvj+yk0DnHp7ZltlmCjDRgOI0HcJM6Ch5SfRbzMXbhAlmKkQw/MWgW1eTaZKpQWb6N
         /X6HEbNn/LF8H9y5Tt+ih7RkN534le6+k5DSEVEY6njDlHSY+m+c8xqLkG3JfEabimSg
         U2hkgfOMd0mKmepEbrzoRBtOjga19zjJ6AVD6Ij/GgqD9sVxTicpWrXGGH6kHJqNqIvO
         1gNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hHNsCMKi;
       spf=pass (google.com: domain of lvivier@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=lvivier@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lvivier@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id e81si32637140ybf.12.2020.06.29.04.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 04:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of lvivier@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hHNsCMKi;
       spf=pass (google.com: domain of lvivier@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=lvivier@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593430534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Qnk49S+rPRO9pLLaZn5U8AfCNZDBuDNmkleDV9AAQ9M=;
	b=hHNsCMKimlQ11rVNSezWbFayGmREKFDeF9shAsBV6AkLYhHMFMVUs0EhWRB1NnG2/6cWaD
	ehbE33JkSLzeZN1IqrXXe7Xe7sFURPxJdOnOwzFpVcnG6oA1g3m86lFxbMdmAw3aBJBS3M
	WXk8DwS01mIB3u1ecW4e00dWOTFryBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-AxoZin2yM3eSTmcSVQWS5g-1; Mon, 29 Jun 2020 07:35:31 -0400
X-MC-Unique: AxoZin2yM3eSTmcSVQWS5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A8B2107ACCA;
	Mon, 29 Jun 2020 11:35:30 +0000 (UTC)
Received: from [10.36.114.211] (ovpn-114-211.ams2.redhat.com [10.36.114.211])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B376870915;
	Mon, 29 Jun 2020 11:35:24 +0000 (UTC)
Subject: Re: [PATCH v3 26/30] gitlab: enable check-tcg for linux-user tests
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net, qemu-arm <qemu-arm@nongnu.org>
References: <20200626181357.26211-1-alex.bennee@linaro.org>
 <20200626181357.26211-27-alex.bennee@linaro.org>
 <9d44ff2f-a42a-449b-7e1a-8e006a510f6d@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
 D+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <24628d83-9d1a-395b-4bb4-f7363c26f675@redhat.com>
Date: Mon, 29 Jun 2020 13:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9d44ff2f-a42a-449b-7e1a-8e006a510f6d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: xJqZE+tUEl2Z

On 29/06/2020 13:03, Thomas Huth wrote:
> On 26/06/2020 20.13, Alex Bennée wrote:
>> Switch to building in the new debian-all-test-cross image which has
>> most of the cross compilers inline.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.yml | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 5ae8130bd1a..17c3349dd9e 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -140,10 +140,9 @@ build-tcg-disabled:
>>   build-user:
>>     <<: *native_build_job_definition
>>     variables:
>> -    IMAGE: ubuntu2004
>> -    CONFIGURE_ARGS: --disable-system --disable-guest-agent
>> -      --disable-capstone --disable-slirp --disable-fdt
>> -    MAKE_CHECK_ARGS:  run-tcg-tests-i386-linux-user
>> run-tcg-tests-x86_64-linux-user
>> +    IMAGE: debian-all-test-cross
>> +    CONFIGURE_ARGS: --disable-tools --disable-system
>> +    MAKE_CHECK_ARGS: check-tcg
> 
> The pipeline is failing for me now:
> 
> https://gitlab.com/huth/qemu/-/jobs/615345144#L2654
> 
> qemu-arm: /builds/huth/qemu/linux-user/elfload.c:2321: pgb_reserved_va:
> Assertion `addr == test' failed.
> 

Never seen, but perhaps it has been introduced by the latest series from
Alex that modifies elfload.c?

Thanks,
Laurent
