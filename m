Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4493330lfa;
        Tue, 8 Jun 2021 07:45:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCsfa+IiwdVD8fXDW+8hmeCxgr3lzLzEV8cl8T1DZ7eLEzhWka7DCucCMDQ+WrB2V2aPbt
X-Received: by 2002:a17:907:779a:: with SMTP id ky26mr23648018ejc.293.1623163551003;
        Tue, 08 Jun 2021 07:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623163551; cv=none;
        d=google.com; s=arc-20160816;
        b=DcCWo2fShyc5drnKvqHNp3GaBo4Rt+iV3kuqdlO2BE17UTFdoaZ8JYsW+7fQhzvfe3
         AB87nThx3SMT7aJaBw7GdTHH5QMQtVpNDFVYSruigMCfJcY9q/oN+Day3Zc8I41ZBQES
         LNSWx3fuOtD8M/Uy+sa71v57WJTWmhbksyYPBVkSfclZjWTvPfVkG3xa6UaoM6mEhvnp
         59/0OSi/pU7OJvxHYZ8LmJm1cL5tBtu3Q+QOrq17bWGwg6KuXzL8grDXkF7Kn9tvnijM
         0gaWv2GBuzfhfxnVL2+8tSjlTc2P8BoCcjHW/wjipJKxGaEe3NmILUfAbfFmzjNLHHpn
         Jq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=0bZrE+OSi9x7BhqGIg9fwu44BYqgDsQKTFFG1rxVLQM=;
        b=fN4BHRMLa532XkMBKj6GgZG2K1Cc6enNvd3tGV5D60zuinWhxfAxu71x1U1hpldHh6
         iE76E0GQzxj0EuwBOj+zzpd3G/QkCtqSFVWT/eORPZEfe2CVObdmLHGBOBs0lPz63GAX
         0GEmCNMANXuY6zOEpxgxnHyGJ0nzah61aUIhjO1v/GncDG0KFjOzHv1g9IxtIWG4fo/O
         6dFMiYDS/wWtZJ8k5mTeNPoliv1kn3EX/CdTD4kmBhHxGWXEvpfNAvIgM6mL0za4sBsL
         L3t/qsJ19eHr72AduAs/17xw3CxVuA3pawmsT7W0oHUYZakvZ5fsfSzDhFRwAnjiy4m9
         dgVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WlIVe6vl;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id x19si14886236ejs.382.2021.06.08.07.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:45:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WlIVe6vl;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623163550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bZrE+OSi9x7BhqGIg9fwu44BYqgDsQKTFFG1rxVLQM=;
	b=WlIVe6vl0kuLS+1n3OFsNjMsNF4igzuOc+kq9+AqvCNIXQGk6023r+d1mrHxY5kjCqqLMz
	01i2UmOKEwuQTLejuASQRkzMdq/4l6ZaDjKoAioReIp9nCvKeYmXwWhLmbT688fAVXcgWK
	++8ahnscOY3N/5GyFTfagkSM8uAQZzg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-x5fOxgxcO8iudP2BSsj6zA-1; Tue, 08 Jun 2021 10:45:47 -0400
X-MC-Unique: x5fOxgxcO8iudP2BSsj6zA-1
Received: by mail-wr1-f71.google.com with SMTP id u20-20020a0560001614b02901115c8f2d89so9473598wrb.3
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 07:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0bZrE+OSi9x7BhqGIg9fwu44BYqgDsQKTFFG1rxVLQM=;
        b=bqpYO24p+wZXm8y6cSVkmYsfOdSGb2ZqwFwjLKK7ZpP9vNzc/0wEMtRMFIyopXDaUs
         QsgNzEVeRg5clgjsWgMWnFEjvzrm/rPH/k1Q3C86znum6o79rlV2JQUtDLajQOYc/Jiw
         7jGwTJrtnG7M7DoS1wHdQQ++yElGm8H8N889iOWvgNP8XMn6Iau8//ncE3cBY+GNR37f
         aC9k0lLD/Oy10p6ZurdvFj44L48pk+MDc/Y/DzHtrHe9JrRgx6hwwoJ4J4XjOHMtmjVY
         1sdCW3YpyVa56DJT62VoVEdimRnRpw4FRRm9t9VkBf5P6oMepzHZiXqKXVNjweUxd4BZ
         Jyrg==
X-Gm-Message-State: AOAM533SPL4Fgywo+72UjwvG81QIUGKAnGaqiVAx9IhKkT/0li4dqbkv
	s/aaNvDzZf9uvr/HBUa6e6/BTYlcN8rnYOzMZKg9Cpdj84agsZ8D+xyF6E8OjLut00ccT02jhQD
	lW53+aHhzzaCRICsH
X-Received: by 2002:a05:6000:1847:: with SMTP id c7mr23339953wri.368.1623163546573;
        Tue, 08 Jun 2021 07:45:46 -0700 (PDT)
X-Received: by 2002:a05:6000:1847:: with SMTP id c7mr23339940wri.368.1623163546454;
        Tue, 08 Jun 2021 07:45:46 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de. [217.232.61.128])
        by smtp.gmail.com with ESMTPSA id m21sm3058601wms.42.2021.06.08.07.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:45:46 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
 <8f6c0b14-16da-4699-a279-fcbacd1e862d@redhat.com> <87fsxsl8o8.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <471ef045-3097-97de-0629-cce8f4cab235@redhat.com>
Date: Tue, 8 Jun 2021 16:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87fsxsl8o8.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: h73EgK6o5qBG

On 08/06/2021 16.41, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 08/06/2021 15.42, John Snow wrote:
>>> On 6/4/21 11:53 AM, Alex Bennée wrote:
>>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>>> machines is about to be broken and besides it's not likely this is
>>> What's changing? I'm not deeply familiar with aarch64. Why is this
>>> assumption about to be broken?
>>
>> That's also quite a surprise to me. Do you have any pointers?
> 
> It's at the top of the series. If you build qemu-system-aarch64 with a
> custom config you won't be able to instantiate those machines. Ideally
> it would probe and maybe fail safe if the binary doesn't support the
> model. Is that possible in qtest?

Not yet. You'd need to do something similar like Philippe did in patch 
03/99, but instead of running query-accel, you have to run query-machines 
instead.

  Thomas
