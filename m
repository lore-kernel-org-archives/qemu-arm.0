Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5506491lfh;
        Fri, 3 Jun 2022 03:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1wMSIrt9s2iklBO5RWyLa68otcf9YDmEINqolsg+gxH/xT9bH/4prsiePzybGeKxQziOw
X-Received: by 2002:a05:6402:3585:b0:42d:d6d9:385d with SMTP id y5-20020a056402358500b0042dd6d9385dmr9801533edc.334.1654251487460;
        Fri, 03 Jun 2022 03:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654251487; cv=none;
        d=google.com; s=arc-20160816;
        b=WM6jpObsvgjDsDM89bwiUbsB6O2I+pi3t2yjUqp8j6yZ6AdCSA52bCG3/jv9/MIr4k
         nLniN1cuzt8AVnCv3PrEDxsOTlhN3NGIky7Ea2kBvMIVQvxN9YPzd0QN4SNTlUR2BB4J
         KJmLUuw1+0JD3ISdUMBdBbdytg0NKL9pdtnShJ9R68+0OugOVIaxYe1IoIExmBjx/m4C
         MQTsREHlKKUY2qlvoPkETBUe8OiFdqZemk+/SZ8ReJrFacadyFfwXMHBJj7ACK+jIs55
         aC4684kgLbxsj7ziZ8SfgWHw8RKuBMVPDseNUbG5fnLHmOHxbjxm/cBb6y9zENOcxAU7
         1fsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=uHYAzxbVGjp5JbyYdqvf++lelD1fygiYeGEgSc9ft0w=;
        b=uBB/sQGjWD5h/v/mHBfzeRrXcOWVV2w5mfFaHKkbtldaBZlmMrcn/GqB/cjXcMfue6
         nPgAcQ+8pUwMjizCvhRTnAtRxxo/kw5ym4XeWeLPFl2k4zFKxkyK8fiGJinTu6Mqs/+g
         StMGYf6RcZAYUglLsTfP9F5FRGKKIGo4sdaZ+5nbnkhfSrIZ0dKiTEJ0o5g8TZbNsFKt
         EAhxah8FGzeLaFskGJKwiprxy0+McGrEGxtBf/Yf7nCwg44kZ7hqVZHFqp5F7sq7S8Wp
         ulWyrBUbRDZ4L8TH/xFQsAX4nwaCcvC/QKbP/m4y6jUu4UXbmv9ZmTGTVNTiVaDMLhsy
         r2ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P2ycMGQ2;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id js15-20020a17090797cf00b0070d1720813esi411944ejc.241.2022.06.03.03.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 03:18:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P2ycMGQ2;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654251486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uHYAzxbVGjp5JbyYdqvf++lelD1fygiYeGEgSc9ft0w=;
	b=P2ycMGQ2w0cdVSHc+Yp7n/eeIbflSAko91Ow7K2fSWXEiXf9NeAQeV7GZpPYfYv+8Mq8EJ
	Y53UKp9IjazACnyg0AgUAJHBDdRSLxh2WZ7cPaVzCCpJbnY13hqqzcxLyVixjwpnNeIVqk
	lnbJLqkV1CAGVe1dGnB39NV9VHTjW04=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-60Uvv7X5MWOaJ8D_8maHcQ-1; Fri, 03 Jun 2022 06:18:05 -0400
X-MC-Unique: 60Uvv7X5MWOaJ8D_8maHcQ-1
Received: by mail-ed1-f69.google.com with SMTP id j4-20020aa7ca44000000b0042dd12a7bc5so5153098edt.13
        for <alex.bennee@linaro.org>; Fri, 03 Jun 2022 03:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uHYAzxbVGjp5JbyYdqvf++lelD1fygiYeGEgSc9ft0w=;
        b=wvOCoYXdWaUpYYgBab2RVJGhv3l9TYD3DkobttSN9W+lnOWEhDz3pmSkbsH+rTCDk3
         KKcaBwx13ezdHb9FRd0nbqQmLNOIatRlDDuGIdUO0brUyueE3NhbIEe4HHxHqTiI7Zad
         iu2uMxeBlLPtEq4V3K9X5CVplabLdVFdgwrvfsc8dRmFWZDGRj5Xdql1r/y77TXQQSx3
         hU60BjSLdPXP29Ttb0NnrpiSlYG34j2qBEiLOc69nWoBP2YfNiogJIZTW/bMVbZh6Phh
         qURxuIWptWmDmvabOgyyjklD/2Q7PWIXwXMnPRPHW5FOaGOu68Erwyqh8eEHzlchNAGu
         D+1A==
X-Gm-Message-State: AOAM533kxA72r3FIwu4PTUSlhnlJHp4c/na8sz467Pi89gyvKBjCb7gq
	HPnU9L9RbjoxqzHEF+q5zCXm6qMwrEvdYEM3EvC9XCESS2hcGkI9Q3OqyjTUyrchkPbBt00BY/c
	1qYfvzY1THFS2oYwE
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id r25-20020a170906a21900b006e486a344eamr8065091ejy.385.1654251484352;
        Fri, 03 Jun 2022 03:18:04 -0700 (PDT)
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id r25-20020a170906a21900b006e486a344eamr8065080ejy.385.1654251484208;
        Fri, 03 Jun 2022 03:18:04 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-175-76.cust.vodafone.cz. [31.30.175.76])
        by smtp.gmail.com with ESMTPSA id b6-20020a17090636c600b006feb6dee4absm2686274ejc.137.2022.06.03.03.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 03:18:03 -0700 (PDT)
Date: Fri, 3 Jun 2022 12:18:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	alex.bennee@linaro.org
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Message-ID: <20220603101801.rgb2igghtcgljdw6@gator>
References: <20220603092505.1450350-1-drjones@redhat.com>
 <871qw69i26.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <871qw69i26.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: 63DoTd4+S7iS

On Fri, Jun 03, 2022 at 12:07:13PM +0200, Cornelia Huck wrote:
> On Fri, Jun 03 2022, Andrew Jones <drjones@redhat.com> wrote:
> 
> > The max cpu type is the best default cpu type for tests to use
> > when specifying the cpu type for AArch64 mach-virt. Switch all
> > tests to it.
> >
> > Cc: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  tests/avocado/replay_kernel.py     | 2 +-
> >  tests/avocado/reverse_debugging.py | 2 +-
> >  tests/avocado/tcg_plugins.py       | 6 +++---
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> Is there anything in the boot_xen tests that requires cortex-a57, or
> should they be switched to max as well?
>

You're right. I was ignoring xen tests for no good reason. They're
simply using TCG mach-virt with a "default" cpu type too.

I'll spin a v2 that changes everything in tests/ which uses mach-
virt and appears to be want a default cpu type.

Thanks,
drew
