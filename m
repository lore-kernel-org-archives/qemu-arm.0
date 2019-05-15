Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp461648wrg;
        Wed, 15 May 2019 04:28:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynvN2ReIrxk81nMAIYsDE3A1KwPZj61xWP4wGFIvAbkR4cH2Ljkhx/BRyuoORkebjiLjK4
X-Received: by 2002:a37:a894:: with SMTP id r142mr32833322qke.37.1557919704491;
        Wed, 15 May 2019 04:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557919704; cv=none;
        d=google.com; s=arc-20160816;
        b=h2FY15W5bV5ld4KbYdYAQduehKjDcQkd6SPlbuHPVHUKHJg+KGo4poRXCE1k6D4vtQ
         tWynbPZHT6TktnUIkIXIWlcdk9oZxnWCQY74Ldo3LIi+cP487CDmNN8OSGONB+VK6sG5
         qKG8r0KD2gmT3i//2DfdG3Q49leHfSQ+h+Cbn7SVMv1x/OHkzb9D6+TEDuJCWUnFCXZp
         MSlab4VbreW9Qho7GuKlhaYYKFBVbILQxNVHbStLjLbCCaflq/1kAfNC/O553E/8tXi3
         pjO03X52Dn2v9eFHLhBoOVOw4NUHFpZq2vgDqY4nRl5W+Wfibu9CsbO0rN+asQMaykmw
         A3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id;
        bh=UX28lJXwk+FKYSsZW+UNood18BkhFwJkGzGcJv/qmMI=;
        b=sXJhmzoqzB4oW3lDx5SyRc5yDUZAE7lYebSDrRpi6Tv0vP319aCIY/Q3/OwWz2uQ1+
         sgRz1ZAUAIj/k8ud1vbqgwURxRCHVPcSV01q+pz6Nhm+p6PkQ2oZil2pI/MSJVIGVANg
         YWF8ekN01If/r+SoSzipr3ZBggJxYKubKp0j8Mbihz/JqUDLQ4iemrEQdFoDumEsV4tZ
         uTXIur1OT+JaG4DOLVgTWP8TxdZwXD/aYi5nHBbRC9PQcSjITAGPk50bERuI5iS5ka41
         JMARuItS8nNV4XjIPHqp+weOA3k4OUFHw7mK7FhJWIOM07r+ZdyoDLFeHHfaD+qC/VuH
         xL3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=abologna@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <abologna@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p8si1105013qkg.103.2019.05.15.04.28.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 04:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=abologna@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 845C93078AD9;
	Wed, 15 May 2019 11:28:23 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEBD65D9DE;
	Wed, 15 May 2019 11:28:21 +0000 (UTC)
Message-ID: <6ab7415d80419a7d9ac832b9194bf2d944696cd9.camel@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
From: Andrea Bolognani <abologna@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Date: Wed, 15 May 2019 13:28:20 +0200
In-Reply-To: <20190515111420.GR28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
	 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
	 <20190513123656.6iu7ebu7zucn5mxt@kamzik.brq.redhat.com>
	 <e38aac8cb33c5782499b4ca0356c43267f05dc5e.camel@redhat.com>
	 <20190514125329.mi7ctaoujirwm6gs@kamzik.brq.redhat.com>
	 <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
	 <1cd94ba6-2bfa-645e-1034-dd05e8a77000@linaro.org>
	 <a24b6d34b99835ea38b021896a57c7af8bf4747c.camel@redhat.com>
	 <20190515111420.GR28398@e103592.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 15 May 2019 11:28:23 +0000 (UTC)
X-TUID: zpmrz06GvquA

On Wed, 2019-05-15 at 12:14 +0100, Dave Martin wrote:
> On Wed, May 15, 2019 at 09:03:58AM +0100, Andrea Bolognani wrote:
> > On Tue, 2019-05-14 at 13:14 -0700, Richard Henderson wrote:
> > > Why is =4 less user-friendly than =512?
> > > 
> > > I don't actually see "total bits in vector" as more user-friendly than "number
> > > of quadwords" when it comes to non-powers-of-2 like =7 vs =896 or =13 vs =1664.
> > 
> > I would wager most people are intimately familiar with bits, bytes
> > and multiples due to having to work with them daily. Quadwords, not
> > so much.
> 
> Generally I tend to agree.  For kvmtool I leaned torward quadwords
> purely because
> 
> 	16,32,48,64,80,96,112,128,144,160,176,192,208
> 
> is a big pain to type compared with
> 
> 	1,2,3,4,5,6,7,8,9,10,11,12,13
> 
> Even though I prefer to specify vector lengths in bytes everywhere else
> in the Linux user API (precisely to avoid the confusion you object to).
> 
> This isn't finalised yet for kvmtool -- I need to rework the patches
> and may not include it at all initially: kvmtool doesn't support
> migration, which is the main usecase for being able to specify an exact
> set of vector lengths AFAICT.
> 
> Since this is otherwise only useful for migration, experimentation or
> machine-driven configuration, a bitmask
> 
> 	0x1fff
> 
> as some have suggested may well be a pragmatic alternative for kvmtool.

Just to be clear, I have suggested using bits (or bytes or megabytes
depending on the exact value) only for the command-line-user-oriented
sve-vl-max option, which would take a single value.

For interoperation with the management layer, on the other hand,
using a bitmap is perfectly fine, and whether the values encoded
within are expressed in quadwords or whatever other format is largely
irrelevant, so long as it it's properly documented of course.

-- 
Andrea Bolognani / Red Hat / Virtualization
