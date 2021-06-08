Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4491068lfa;
        Tue, 8 Jun 2021 07:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyobEGqGLv/4F/vBPIdvs4OrDKAKZxxUtXnlI5jqnSf3qn4U+msTcTPc3O4ekKW0L97Aojv
X-Received: by 2002:a17:906:1682:: with SMTP id s2mr23648169ejd.172.1623163368629;
        Tue, 08 Jun 2021 07:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623163368; cv=none;
        d=google.com; s=arc-20160816;
        b=RhQnpaA996DyTYuSxiRjLJp2FqH+55VFD2WV3cSOUQLR6S3gXtZoexMn/XL41HThcP
         nI+cz1YowqpxB+bpcFH+goK71EXv37u0IZnKpMiTE1gk332vVrSmcTz7tFCTDjZ2YQiT
         OkVpTPeYGMbzP15rWrqCHzcOyhd/E9qfaNpUNjMf/lBSXeUiDS0M7WlVDAU1+i8GAS6O
         9uK+crygHAI/NswmfIvqQYoT0tpTCg2zq94Q5qQYq2swjbIvW90rxGtVw1BYFohjByRZ
         KsGRSkeUao072a1WeSRvPK56uUbm30cakUovwG2AIP0/W5wYZlHEJ+J4i0jzhUgBCrG3
         yjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ClW0UWQgQDuHWw8kNI7ZJsTF923UcRS3+wmAMiBGX9Q=;
        b=oIji+7wEx8pcxlqdyjIlTvlzl3hGYJwKoyfcefuzLVAtf6VWsLlGFXlBVYQ5VzxrlO
         bwdwGsvfesIRte6RcB/IdIhd7FNpeoSHd32URX6gaosQt1IyJtJ0RXjyAeq7NEYfC2yz
         bsurugKpSJKO6AQFw1tiNT9pgL7+27mEJGNNlVs11SesZvXrqP55LyrBRUWtQxKearo0
         /XbTkv6wVETbGbphNHkA57FU+p2peIjD1myNVdWMj2q4TPTXLYShmOOuA1k7WBoyZsCU
         fuTEhUH/bApvB+NmL3gH4F4X0Kq0zBuVmL6HcBQSOZ5kJHtCmjdTm0UX4h+bMepicjgT
         WJqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RN7smTpE;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id ms23si15339159ejc.115.2021.06.08.07.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RN7smTpE;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623163367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClW0UWQgQDuHWw8kNI7ZJsTF923UcRS3+wmAMiBGX9Q=;
	b=RN7smTpEXvJW7UK0bIBMWeugm023difyVZBCSPhzKJBfmbyAgV9SIHfMJk3MqWp0JPGw9/
	lXLNMibE9ZFE53uQOBb6uxgasSjZxAESMQfAGkxaSxQIl+aGG88Y4IGUbbzzKs61nVPRDE
	p+Gs91qzhlsx180InQW3RPbAQG7F0Ms=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-MVLWIb9AMPuvGaOvEEFwvA-1; Tue, 08 Jun 2021 10:42:46 -0400
X-MC-Unique: MVLWIb9AMPuvGaOvEEFwvA-1
Received: by mail-wm1-f69.google.com with SMTP id l18-20020a05600c4f12b02901921c0f2098so526551wmq.0
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 07:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ClW0UWQgQDuHWw8kNI7ZJsTF923UcRS3+wmAMiBGX9Q=;
        b=Zsqd66kaXV5tPBvEexv9gtrie3rbJVQRfz6B8p55EbddJ7vz7XnHJjyvKLuN+ooIqX
         2dKZO/67p0o0AJj+iJ3m9qWfghyDEUvLcJABtzy1xV0x9BJEchA1Pw7C/E/0NlYWPleq
         2rzrRoklgrTsEJXFL++JRQpOlPS0iAc+H5cz6oas6L6JTAPrzyxV83kJxPBrp111A9kf
         Fha9wZtZpoE6aH/12hwhEXxHQjvzDtAzZHBy75LapxIPv7qm9WBGZnJEU3g432gbVp1i
         ipgfXAa5cLdpBPftct55vvFjGCjmR8cYEglCCm59kN85BK+iljAumzA9/SZy6aK0qPZf
         lObg==
X-Gm-Message-State: AOAM532yk0GbX04wsS1ypzjH7/viTcGTmwmcrLpMxw8wdgnMBYZcYXa1
	BCx9Ei/s3xEf2MfLMWj7rchEohm8EzdmuXYCk9+qY9dMdcQzOhU1983/S1858Dwm6YfIuaWCmnh
	Kmu3B2KaGMPsMWZM3
X-Received: by 2002:a5d:6209:: with SMTP id y9mr23272947wru.50.1623163365128;
        Tue, 08 Jun 2021 07:42:45 -0700 (PDT)
X-Received: by 2002:a5d:6209:: with SMTP id y9mr23272930wru.50.1623163364950;
        Tue, 08 Jun 2021 07:42:44 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de. [217.232.61.128])
        by smtp.gmail.com with ESMTPSA id o9sm17641367wri.68.2021.06.08.07.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:42:44 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b0f5feb3-ce55-0307-f64c-c65d1528560a@redhat.com>
Date: Tue, 8 Jun 2021 16:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87im2ol8xu.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bnIwdbmhXnnQ

On 08/06/2021 16.27, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>> machines is about to be broken...
>>
>> Um, what?
> 
> Really what we want is to probe the -M (machines) that a binary
> supports rather than just barfing the test because we've built a QEMU
> that doesn't support all the random 32 bit machines.

Ok, so this is rather about being able to use the qtests with custom QEMU 
builds where you tweaked the default-configs? That's certainly a valid 
endeavor, but then I think this patch is the wrong way to go. You should 
rather add a qtest_has_machine() function that checks whether a machine is 
available in the target binary or not, and then only add the tests to the 
test plan that match the list of available machines. (we have similar issues 
in downstream RHEL where we want to limit the amount of machines, so a 
qtest_has_machine() function would certainly be welcome)

  Thomas
