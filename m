Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5698070lfh;
        Fri, 3 Jun 2022 08:15:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbRY1GCtPLcqz7UaV+empI3A8Q75QRbcerDu0DjMqHrDciUkEtDVHPWNHk+3cbVcZjZfVQ
X-Received: by 2002:a17:907:724c:b0:70f:63ed:b834 with SMTP id ds12-20020a170907724c00b0070f63edb834mr1799948ejc.126.1654269332488;
        Fri, 03 Jun 2022 08:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654269332; cv=none;
        d=google.com; s=arc-20160816;
        b=1CVbfq3s7sr5jU6EMnBIFiBK3rUk19q7OEVWEYHFniIEBNnjtTcNAFyFbRzvqmgqof
         PB2wPo0oApbRUx/wVal6gVh+X+SaC/YBnrN7iLuxkGPXxZfkgzd1oqYFAnVRCfZSiOG6
         OkIgL47Uq/fbVa217KFdW/CTiA3JvfoLsuyHjbuXygnr+k3yZw592nVL/wj3c3qSw2Qy
         fUIujQX29kTF9Wcl99uZCDX6ORzByeZAm0uhaOYjNhQoRcDpSYUJpzAw4NxghClH9oTl
         7TZn+Gg5uC5ipRHB6Uw8nMVi3VWDXMc6UQ/21XbH8Zi2TAgc+W1PkGIvKW5DQGmZ+Nzo
         gTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JmoCgHGVJ9yyB06tjVGcoAbeAwtCQgCYNssDkl7CgOc=;
        b=qvap+68V/J+8sgwi+VAfn3VdJtSQj+VKjHXzPY/1XAo/xC3yW7daSVnU7fl+ySFeBx
         kc+PH+JyzQqNMUHS5WLovhipIytW990229OiPQL1OSHh6c+TyO5OkTnZ3EbXG8ONZ1Mh
         W4Wd3xFHp3YG1HGbISe2R6PrQFI2IcLmPdt8hu3MSbUzj9OMWYrCpSnQN7joBniz/89X
         ory52b9asHdPAo3Lt2oD4RV5LE9we/bI8WZLgWGRAxyfZzATCcP31KfZIM78WLUqaacq
         psJssuii+27CG91CKoouWmvnhLbqUhUP4DVfpID2+ct63DugbA4M8is+7SPgbUPduWRG
         CzDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=isP11q7F;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f4-20020a50ee84000000b0042dd83c6e26si619764edr.418.2022.06.03.08.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 08:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=isP11q7F;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654269331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmoCgHGVJ9yyB06tjVGcoAbeAwtCQgCYNssDkl7CgOc=;
	b=isP11q7FH2H6ZPAHMFxvmvmPTNlUXeJ9VS9RNWrkfKAyjhcgo6XbXfg14FGckv7O5KwmgU
	+RIdbHsnt49zhcvi63MwUw9hEC2fOTC93IFzM+saGEKFF3lGVIRzs+iTiSpQ7fWWtjUHQh
	Qg+oNIIRqE3ygMgTTSbk8mGoKabH2ks=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-wyk5CsLPPdKqIPJkY8VVJQ-1; Fri, 03 Jun 2022 11:15:30 -0400
X-MC-Unique: wyk5CsLPPdKqIPJkY8VVJQ-1
Received: by mail-ed1-f72.google.com with SMTP id y13-20020a056402358d00b0042dfb820070so5419728edc.6
        for <alex.bennee@linaro.org>; Fri, 03 Jun 2022 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JmoCgHGVJ9yyB06tjVGcoAbeAwtCQgCYNssDkl7CgOc=;
        b=Ho/rKhwtnBu8BlT3XTA++71MD/NQKUg/5UGH9fyurut6MfBAVwj/Rdl1zP6bLvnJWm
         jP8Az7C2d8yS04iUdiy4oWWWBQL0+eozEKSorip5MZlKydEsb9PoT2lOcGDmDXFY7d/r
         vtCHqtrZJMjcqt7eD2uQo8hYmzIFEFvcA/brjKUNe6CQ42seZBu+cCCZ/ZyFmTfk+JX3
         4mtPvQlF99ur5sYtAxXDzA7Fu0iq88pJJJgWHKSbjJ8ZzyRH18NGkue1NNOn0lCQxgwf
         BZvKTzTcdJLzrGrBlswxKrCyaiF3sLO7GvV0RVjNVndIpmvBNN8DqGrcxvhmCcWfOG3K
         f+fg==
X-Gm-Message-State: AOAM530CqTUXtCk8KEY4EeRYf85CKe3D1urQw85bOk4sErKnsr6ZWCd8
	UkTNIS1gPhxVQ05IrfxPcEiDyoe5oC4Kh21x6K8MXLAqQsO6n9+eJRbEBMO+1iTK9Wms+FmYtlZ
	HNcntAjttakowDd/V
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id r25-20020a170906a21900b006e486a344eamr9233917ejy.385.1654269329287;
        Fri, 03 Jun 2022 08:15:29 -0700 (PDT)
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id r25-20020a170906a21900b006e486a344eamr9233906ejy.385.1654269329115;
        Fri, 03 Jun 2022 08:15:29 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-175-76.cust.vodafone.cz. [31.30.175.76])
        by smtp.gmail.com with ESMTPSA id b6-20020a17090636c600b006feb6dee4absm2935134ejc.137.2022.06.03.08.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 08:15:28 -0700 (PDT)
Date: Fri, 3 Jun 2022 17:15:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	alex.bennee@linaro.org, cohuck@redhat.com
Subject: Re: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt
 machine
Message-ID: <20220603151526.6wuerkzb664u4qoq@gator>
References: <20220603111849.1481100-1-drjones@redhat.com>
 <8baf9cbc-3cd4-bcd7-c60d-b68bf0784779@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8baf9cbc-3cd4-bcd7-c60d-b68bf0784779@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: wIsk+66m4KW9

On Fri, Jun 03, 2022 at 07:04:01AM -0700, Richard Henderson wrote:
> On 6/3/22 04:18, Andrew Jones wrote:
> > The max cpu type is the best default cpu type for tests to use
> > when specifying the cpu type for AArch64 mach-virt. Switch all
> > tests to it.
> > 
> > Cc: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> For avoidance of doubt, copying v1 comment to v2:
> 
> > diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> > index 0b2b0dc692b1..c19022ea977d 100644
> > --- a/tests/avocado/replay_kernel.py
> > +++ b/tests/avocado/replay_kernel.py
> > @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
> >           """
> >           :avocado: tags=arch:aarch64
> >           :avocado: tags=machine:virt
> > -        :avocado: tags=cpu:cortex-a53
> > +        :avocado: tags=cpu:max
> >           """
> >           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> >                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> 
> This will *not* work without further changes.  Fedora 29 will is old, and
> will not boot a cpu with FEAT_LPA2 enabled.
> 
> See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")
> 
> Which makes me wonder if you've actually tested this?

I only did 'make check'. I'll also do 'make check-avocado' for v3.

Thanks,
drew
