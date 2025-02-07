Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp290244njb;
        Fri, 7 Feb 2025 07:58:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxNd1RXe8XKJSoz0wSE0v3mgYObPRBQK/BIetFA5xNHM8PzQZwXrpZ9W0ChQ35gE4jwr0XUsAHtlXcXg==@linaro.org
X-Received: by 2002:a05:600c:3d0f:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-43924984042mr30167535e9.9.1738943936816;
        Fri, 07 Feb 2025 07:58:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738943936; cv=none;
        d=google.com; s=arc-20240605;
        b=OdYglHCZinPUpj5nxoLyzwOUmRiZ5Hsd37jz5TewYgDFwaLYw/oKqDabpY/FrWJrhh
         0f0tAoP3g1kOGh9f1emVng5JSvmdnj9qWk8vMdCkjSZrjrSw98BHD5Qa49ZM/VrjgKo8
         XxoC1I1+Agv8VU150LkOm5AKgRIiucwNQZl6Ga8f4WEmAKg4cAxY1QCApGd4Wnw9YJ/k
         ROGyrfwF1qPdfcDcSiyfJud3EqsiMVtNglv9BUsJ9cxkVw6+6fdC7o9wk/gr/WluMUgm
         c0ki05uV66ob1cpX4TzO4ReH6cN4hdLNQvy6YEww9o56CjvyWoonNZ1TcA7cEjUa2+ft
         NVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=kqeh+h1QXkswiJkm4JJr0gR4w369qLmdh3P5XRMBllc=;
        fh=K8a6syNo/CFmjkvRREfG8yrtMHOHSevMSvUVlZzd4XQ=;
        b=kF3kX7c7YZRIAjaIDq70VpqLqjxougDv4eUvEbB+EFhVzxRppIfcW0b8pEZssQhzl1
         Pc80zXkIV9QKi6cs2z0G5NHvXD9pzWLdPHboZafRMQ9saZ1qhZV82fvncTkmQrtLYHXq
         0W35cSnq5Wc88AqmMX6XXs1ATxzVeehCajJAooTQxV+/ZxCe0tIovkxnQcO4RTphrCI8
         6FCkJdvzBArmndYXMUl1EeoegNXCPLwV1MYbxdYxhN9XI0kaC/Vg85BmLhaCs6PYwlAt
         ABZfn78zsqJK7O8LOlCzZko3LKUlMDxIDGGO9buY+nHkH7vEutoad4HBuu5R/rVZrRlX
         J2ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PYCGYae+;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43923ff2813sor9783695e9.9.2025.02.07.07.58.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Feb 2025 07:58:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PYCGYae+;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943936; x=1739548736; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kqeh+h1QXkswiJkm4JJr0gR4w369qLmdh3P5XRMBllc=;
        b=PYCGYae+GmF25pTTIfik6B9ohGCC39nyBPHpWyQ8joDaGmuWf9+8NQcfpchsy5gcTU
         Dn3bn4VE4X4XSVe2Vj18/FreUTc5M51Y0yoEVzT5d7ZwnqS8kPtpylkbrHrBMJHr1NfB
         OgATXoPQLdfzrrriDq9Mqvc0/Ifzu3kPD6gMnRhjXBhKMQRVtV5SpCNqyJxLG7gjUpzA
         xxOMK6wx2jTaJ82kufaZeiwKOQw7r1KT9bGYVl9wCH8eiIqD//bm9jvMIasQMgy8wB9w
         /HbKOTmNmvaL0910Xa1ue5YrhhOhkgJASh9q5uJ50EU2rkUzF8V3UsSpUbUyAqzbM32F
         i7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943936; x=1739548736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqeh+h1QXkswiJkm4JJr0gR4w369qLmdh3P5XRMBllc=;
        b=d+l0IctMUaLI5RxBhK0VUFeBGyoosPesTVw53wk8QkCatPTYBLIQeKsca6UDM6Numi
         9fk8fhTBv+BUszBd7iQs3Jq6FS1EUFgBcI/EfCBvlDiENDPdkZWtVIm+IysK5u9SQiMy
         ujOp6JvC/FtSg56yjDQZpeEBs6PiHXCjryjhrcQ99c9AupwOntddfvVf9k2MB+EJ3ML9
         uE58iknqHbd2BvY0dcRSsYh+3OZBIqol9nT63mNJgLhT4sKZrDscHvHHFWM57NFgYH8V
         w+8rkAgdTvzD4VXAK2wbVK8J/cSe3IXMBPJPuUjsCsxra3fiv47XtxPKlKY4urduPVBw
         PBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAkRYCvBAnw7IdB+FgxhquR0INtGwKboV2o7kOC41LhbFZhOoJw9wbJrLH2Km3YTUYvlEfzXU94+hqMA==@linaro.org
X-Gm-Message-State: AOJu0Yw6QQfJsmIUjnJYiC3FIocEg975+/UM6Wh0Rv5iJyKVTpVrMuk9
	BZPReEJyLE+W61YlsGe6OyHA2cPnwCcGbucmSQIYjb0nWyDyi/gjmTS2/gNZNQo7DA==
X-Gm-Gg: ASbGncssuq5SlmH6+hY36bE6CtSfV6IdDi/a3TA+DhYSVu5NJf7OIFWYUcYe2xdY1hR
	OsI+e0kwZgWpRC+XvuY/yxWqLGex0Wdk+dsjkTB+QO6EdqA54H48XKfMu29tN4yogVXgVUCbLZ6
	p1kzaoABjs7RzK+xAn9hxzSjKvC/LP488RKdi2Gdkz7H3JxjHG1n3I+hXsPY/oFHXKkoxsJ0SOw
	Zhpk/plASScPYRZoV520lcZEYJWX+sFrCFY1UY0ELjQwEvHWINArcoK9uljCHheEsQgC3DOJsJm
	EnSCu1paEF78SA==
X-Google-Smtp-Source: AGHT+IEuWkdH2e+ehVQ7UkgUJ/atzJB1wHcX0nVz7kTWJubhBVqxzpXeLrW5oXbuVgXGY8VyJVvrlA==
X-Received: by 2002:a05:6000:1acb:b0:385:f195:2a8 with SMTP id ffacd0b85a97d-38dc90ee7dbmr2293163f8f.30.1738943936312;
        Fri, 07 Feb 2025 07:58:56 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde31d9bsm4899334f8f.94.2025.02.07.07.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:58:56 -0800 (PST)
Date: Fri, 7 Feb 2025 15:59:20 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org
Subject: Re: [PATCH v3 09/26] target/arm/kvm-rme: Initialize Realm memory
Message-ID: <20250207155920.GD3546768@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-11-jean-philippe@linaro.org>
 <91b825c4-462f-4663-8412-effa84c0863d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91b825c4-462f-4663-8412-effa84c0863d@redhat.com>
X-TUID: ZcC2QmwQ5NKK

On Tue, Feb 04, 2025 at 03:30:00PM +1000, Gavin Shan wrote:
> > +    hwaddr ram_base;
> > +    size_t ram_size;
> >   };
> 
> s/size_t/hwaddr. To be consistent with RmeRamRegion, we may reuse
> it like below.
> 
> struct RmeGuest {
>     :
>     GSlist *populate_ram_regions;
>     RmeRamRegion init_ram_region;
> };

Good idea, I'll make that init_ram

> 
> >   OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> >                                             CONFIDENTIAL_GUEST_SUPPORT,
> >                                             { TYPE_USER_CREATABLE }, { })
> > +typedef struct {
> > +    hwaddr base;
> > +    hwaddr size;
> > +} RmeRamRegion;
> > +
> >   static RmeGuest *rme_guest;
> > +static int rme_init_ram(hwaddr base, size_t size, Error **errp)
> > +{
> > +    int ret;
> > +    uint64_t start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
> > +    uint64_t end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
> > +    struct kvm_cap_arm_rme_init_ipa_args init_args = {
> > +        .init_ipa_base = start,
> > +        .init_ipa_size = end - start,
> > +    };
> > +
> > +    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
> > +                            KVM_CAP_ARM_RME_INIT_IPA_REALM,
> > +                            (intptr_t)&init_args);
> > +    if (ret) {
> > +        error_setg_errno(errp, -ret,
> > +                         "failed to init RAM [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
>                                                      ^^^^^^^^^^        ^^^^^^^^^^^
> The type for 'start' and 'end' would be 'hwaddr'.

Right, I changed everything to hwaddr

Thanks,
Jean
