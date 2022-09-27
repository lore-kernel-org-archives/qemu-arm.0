Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp431157ocs;
        Tue, 27 Sep 2022 02:46:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77UIUcFRIC41NOTY8ySKOvxoOGvfSjrX7G4hlVQC7fKeUfAdOYM5NZ78qBNeWYWKPUnbdY
X-Received: by 2002:a17:906:ef8b:b0:77f:2b14:6eef with SMTP id ze11-20020a170906ef8b00b0077f2b146eefmr22181471ejb.612.1664271972815;
        Tue, 27 Sep 2022 02:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664271972; cv=none;
        d=google.com; s=arc-20160816;
        b=ue6wHuFqXQ+gvTudVdEJJD1bCEa+JTfw6xzXA6fUB/2HHJYwHeN8jmUEsnxMKffs39
         pCFdC0orOmVWXZZi0nW/kP0cPR+1vlW18aKhhOrhwg2SQWdMj7afh8tJ4xfQpC3+8FPD
         afIZ3emMK7mQ3v50oBedxoRc9sScTKtPth00PzG8CXLqeeK16dckfMuUzSUj3oDlO4dc
         uie9ZdbsuT0GW31GjQNXIJrCxTuX/v3BeL3GlKKu9kJCPAcIyKuCzQHxwEdpwtv+L3kM
         ROEYJdSjXqH2gQf1kVqryd+l9Ce0uGHfBd+pznZ787+iUkqg9ALMObe0t/49NbfVecLx
         jgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aZiN0icSSJMdRfEF/dFFQX2Msek/+2i3KkinbfOF1qc=;
        b=JcoAURGrW8APm1utL3mNm1CwNiCvBZnU1wZHjFV+sDv9mhv7twA2BMPJBzHXM/ceWs
         cnI7/iojl/i4kkNBNgszhfPgAZxFLNV4E2NhM0oH5d9FVwXcP38zKOux/vF+AjEpBAsp
         ZCe9IiGR/zPS/LZGwn+nxEc8XUvBoLQ3HEr+Zeqcg+y4akrXHy4qHNs76byxSUrvxA7d
         JHabyM+36f1bQephggZ7nCOb56BNioG39AbqVlI5Cf5fG8bZG5BVPyOwNthVjs8q3POG
         yKlL+IHR4UziFZ4WWUfKuHSDDeZ9EXZmlNDNSUovOeLXD9ESnfOG/wMfvizu45nBE0C1
         k/FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YBte8E/3";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id cr13-20020a170906d54d00b007803ea2d040si885309ejc.478.2022.09.27.02.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 02:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YBte8E/3";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664271971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZiN0icSSJMdRfEF/dFFQX2Msek/+2i3KkinbfOF1qc=;
	b=YBte8E/359Di3VfzbUxJWyjQWRuB5ASehP/KvZCvV/LaN9HZvANirQz41/jj80FkMOPdiz
	NGLQz3AFTvuMe4G5mWqSQ1OtybBvW4sHgrWqiITsXiYfyh7uX4lb4Zkjx3BGD8I6wT56+I
	1vpz6D7qKNW23Y1Cm2F1BhIO7ij5Hzg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-tvyM92cBOiaNDzRy8FLIiA-1; Tue, 27 Sep 2022 05:45:49 -0400
X-MC-Unique: tvyM92cBOiaNDzRy8FLIiA-1
Received: by mail-wm1-f72.google.com with SMTP id d5-20020a05600c34c500b003b4fb42ccdeso8345810wmq.8
        for <alex.bennee@linaro.org>; Tue, 27 Sep 2022 02:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aZiN0icSSJMdRfEF/dFFQX2Msek/+2i3KkinbfOF1qc=;
        b=tqiES6abFTmPuk3Vn7GpGaYDWXoIgxqgbHvFifJqedDHXNzYd7FY/tjlyt0wQWo+8p
         3QVCe6c2o2lALtVXb9TiK51EyMd0VKXVNkmhqnW9rx1zR0DYrqs6P3diRVduzL92bYQa
         0h6p0b1HJRmXjhQP2/qsow2ZAALbpRUzPZp+/W0dlIngdmRYjEaIw197jRcS6w9yb61J
         G/nrCdiv2eUFfw7pCKL+5MezqH016ZvrOtz6zagxy18p1SsSFMS/7elnLDXJ9iEGHnv5
         NQLXoUXV/0N5rTwf4q5n75lqQ5tsFHTbnsXichY7b6uiCky3yyosdSvzGP6Oup0gWupW
         eNhg==
X-Gm-Message-State: ACrzQf0rKLmLqWYs2sCb+9FYS+D5s0D+zBHYlaTAged7J9L2UoWAFNee
	olfHHOTbHaBgPUulq+LKqDgoTmrp5SEQG9ewzn1TtGOe2dnKD09NaMgC34vqrjZRmkqIJEIzTZM
	dUrLAM2CV/Vd3UAQ1jFIjhSrCUip8gGTsf9eIyiNw0ajBoxRBQIwVy3sRWKgQUasm
X-Received: by 2002:adf:cd10:0:b0:22c:a109:f51d with SMTP id w16-20020adfcd10000000b0022ca109f51dmr7009611wrm.238.1664271948033;
        Tue, 27 Sep 2022 02:45:48 -0700 (PDT)
X-Received: by 2002:adf:cd10:0:b0:22c:a109:f51d with SMTP id w16-20020adfcd10000000b0022ca109f51dmr7009590wrm.238.1664271947756;
        Tue, 27 Sep 2022 02:45:47 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de. [109.43.179.30])
        by smtp.gmail.com with ESMTPSA id v13-20020a1cf70d000000b003b31c560a0csm1224975wmh.12.2022.09.27.02.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 02:45:47 -0700 (PDT)
Message-ID: <574e596a-0016-9f0e-9e8e-12d7ea0b1ecb@redhat.com>
Date: Tue, 27 Sep 2022 11:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 04/11] qtest: make read/write operation appear to be
 from CPU
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220926133904.3297263-5-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BKK/l3HHHe4C

On 26/09/2022 15.38, Alex Bennée wrote:
> The point of qtest is to simulate how running code might interact with
> the system. However because it's not a real system we have places in
> the code which especially handle check qtest_enabled() before
> referencing current_cpu. Now we can encode these details in the
> MemTxAttrs lets do that so we can start removing them.

s/lets/let's/

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - use a common macro instead of specific MEMTXATTRS_QTEST
> v3
>    - macro moved to earlier
> ---
>   softmmu/qtest.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>
