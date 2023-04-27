Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp238640ejm;
        Thu, 27 Apr 2023 01:08:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4cLASNXwJRoRYDRlCQxxbrTWeMNXek2HYiCu8i/+pggetW3nPhVHvbRq608onfcuRYePP3
X-Received: by 2002:a17:906:58cf:b0:94f:3312:3daf with SMTP id e15-20020a17090658cf00b0094f33123dafmr1047489ejs.66.1682582922661;
        Thu, 27 Apr 2023 01:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682582922; cv=none;
        d=google.com; s=arc-20160816;
        b=F5Dy5Pay9iF+bPa61gG0JyMwtWQe6lULiVWdFlUTxgST7+naBkFb5YFrvYks+ZphKb
         y3pyOTzT2nY5hbMt9/7+Lw1xHiCHXRVS5pVxRohsrpbbMbHrkaD1vJMg/gBS5Npx67Tw
         QE+HxFJWNJYpRrrDWcbwkGiKKRAMiIj1lVdXr7/vCzNqKDMI31WHcjeiS6joQoJteEnF
         TX8LlHvCEdvb4K+A3GbWYRmVlW9uIj/PINGrktEUo2nQQmPXEA6tFI+M6JU6OWB5VhjL
         VlqJB28pIpUY59aWE5MF2jOn91wWxRgDMmOG4JEptkX9E/1sXGBLihkkxGYp1Xjp5GFY
         /Niw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5La+inFjev9sb/HVfdXkMAcCJMT8COrL8KUCROo2QX4=;
        b=1IrwwvR9p4KFX7YZt5fRxy70pQMhBpWmW/+8It5/O8Y+zlp2z6qJm4RXzz0oAaRcHd
         PlCIa3UkyA5UU95ivHchzlP+nWg2bwIs/j+WPmdXg6LGiPuZxxABTh8VtvC1hQgYejmx
         UdMDy+X2ijwaqHUY9VGrlGztE491ZbjjIS1crHnw4/3tIrQ+PbM1kHBIZZn56O5BmZCS
         C4G8k9ZutCXmqTCsZHEjNvLuIBHdfv3KPjzrP7ra1l5p4N28UxAhAuEvObOdtEg6+9eP
         QnsBJabmM+ts9qi7z269rxbdFADCAUr43RBvcLG6muPtoU1DVxhBAEOTyOJ3saOJE4b9
         Gz9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrPJ+NKk;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b7-20020a170906708700b009537ef82da3si13065321ejk.993.2023.04.27.01.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 01:08:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrPJ+NKk;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682582921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5La+inFjev9sb/HVfdXkMAcCJMT8COrL8KUCROo2QX4=;
	b=LrPJ+NKkF860KHFkFbOREi75Qll8847yy67WK8kny7nEMz1doSUsAz1HjYF8PVhpCoEt/v
	kfWLuc6w1tdmILhkIo6fz3A4v0xFZb1TdDO+2CkQlp/kfSGfrr/FWGGnO9tvrChLt9b7bB
	dwjBbGnAoypu9HTDIQyWdDhWNyajeD0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-ZplTzwKkN1WCb9SQirFj3w-1; Thu, 27 Apr 2023 04:08:40 -0400
X-MC-Unique: ZplTzwKkN1WCb9SQirFj3w-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-2f55f0626a6so3006894f8f.3
        for <alex.bennee@linaro.org>; Thu, 27 Apr 2023 01:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682582919; x=1685174919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5La+inFjev9sb/HVfdXkMAcCJMT8COrL8KUCROo2QX4=;
        b=a2vVac7iPFJgWWIsmsDYA3LGA7Td41ZHWaTey/RqRHoN13TdbIBHOL/gFOn6kahgQb
         N/A4FaLjGJK19vF8OTxOHf4KWmNvv+iDUDYxxcvd93QwaCEAsbuUXJctGGRyWS21EyoN
         /gBkWoyspWvR1fHPkhFJuakNaNQjP9hBJsHJJ04oI+syAgTdc9IFMAuKhnq6ucnkcoPT
         bkS5pbx9VHqj0ozZyDJIGorxA/Fq30sFGE6IGONwaTYKGdJ8hVZ+FG/x/BQtg1Dre9bz
         7aH1VpmfdULUuTRMDKxuv+pmIooSjxPIBKNk1c/hSSs9OMKLydoYbKN1QymFYq+ltBUy
         sFCA==
X-Gm-Message-State: AC+VfDwWXAvEOoperJhicjXGhqYPtPHNuTCIa0CZMSpYwFGrYKbrQn9N
	eDXO6tDQ1JjBGl0z3z798p1Lev+kkUPXhbZf712w/On77ghxr3eF11THqqLO1Fb1F6uuTC3B+2B
	uSql6N6TsVwml5gHH
X-Received: by 2002:adf:f7cc:0:b0:2f5:9800:8d3e with SMTP id a12-20020adff7cc000000b002f598008d3emr627273wrq.47.1682582919420;
        Thu, 27 Apr 2023 01:08:39 -0700 (PDT)
X-Received: by 2002:adf:f7cc:0:b0:2f5:9800:8d3e with SMTP id a12-20020adff7cc000000b002f598008d3emr627258wrq.47.1682582919164;
        Thu, 27 Apr 2023 01:08:39 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id he13-20020a05600c540d00b003f198b9eac5sm14812023wmb.6.2023.04.27.01.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 01:08:38 -0700 (PDT)
Message-ID: <25062cf1-107a-2492-02df-91b66d2854e8@redhat.com>
Date: Thu, 27 Apr 2023 10:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230426180013.14814-7-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cSpKKVyXepD5

On 26/04/2023 20.00, Fabiano Rosas wrote:
> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
> query-cpu-model-expansion test to check against the cortex-a7, which
> is already under CONFIG_TCG. That allows the next patch to contain
> only code movement.
> 
> While here add comments clarifying what we're testing.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>
