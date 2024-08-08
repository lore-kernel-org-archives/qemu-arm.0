Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp528338njc;
        Thu, 8 Aug 2024 07:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJJXA+/n3n6jlomeczrLOhwEck6taCn0aTY9Zn/j3sgSq4VxDXL1SNPHAbZzKyjwwh46afj0SyahlS/kivJy44b+whl4OT
X-Google-Smtp-Source: AGHT+IH/XZrw2/E9NBrz9a86BC2zhlMg9h5Iv1yIidMek3QJH5wgPFZMndkUUvPG97ePhOT/334r
X-Received: by 2002:a05:6808:130a:b0:3d5:61d9:fac1 with SMTP id 5614622812f47-3dc3b45faebmr2526975b6e.46.1723126949581;
        Thu, 08 Aug 2024 07:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723126949; cv=none;
        d=google.com; s=arc-20160816;
        b=toNhX4tHLINkBSa0tXTPkxHZd4/plg3BcLRLq11gKb68kNZR9XWa0DGv3Vrajnh3/j
         p9WY0Q43xp+8G6faMYN/1lcbDgjdJVEYHbNU0/rqwXQcHhtgrUY8c7k2JngLhI89ozaG
         S2LQfSk5uQ5nRgIjz7gD14MpfcwxUu9Z2uI6DJX/MbXLFq5P5tzMt60EKqZQIdo9MNnt
         pFf6MKYMR1dGg3CZTLYg7J/i02e8EPUTcb5fPKaBPRTtWKHkFhBWuO0P5ncFJiY56A4D
         9PdfP5Wjem4r5dnj2Je0RWAIW7rwiw0Ua0xc5yIO9Y7WRh7G8XJj4hXhg+CGE9FsFpOo
         +f0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=eWiq/R1qfDvotqZucy6GvkqQ+EVl6vxLjsehT82Sjwk=;
        fh=WMtwTlMIVa9e3nQPUxC0gUskdKaQ9p+Ky1oUuYKLzWY=;
        b=wLfMf2hdWu4I1EaT+2WufGE0uQ2zTtoHWxw2082HWPoQb+lAdu92po3ICjJ4vNbMop
         dkZI7kZET2yAxfOLlDlsWnWkdSPFmgC0K6QfKEc+Lr1/amvrjlvgobjErIh1nQQQyyXU
         ukGlHgXNp06PSWU/ZvTszz1tGfGcu+LfmYBsMvfx14CWkje7GShHNkE8yjeJ2tD/nwf8
         tJWLNrZN9IOA7LvDl1DzhPbpUUuZDPKgFFyTMfUHJxJhR9GVf+QOvrbEIbdH43y/pM6W
         oET6NIYg4+6vm/NuQL4aZA8xecyKw0ENEvioEwWMmtK8A5nvR4+lYUiEQPCxGpr5CY3M
         7qRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V5793x0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4945da6c23csi3029084137.9.2024.08.08.07.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 07:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V5793x0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc41w-0008Tn-Eu; Thu, 08 Aug 2024 10:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sc41u-0008L2-Ew
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 10:22:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sc41s-0004tl-Eo
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 10:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723126931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWiq/R1qfDvotqZucy6GvkqQ+EVl6vxLjsehT82Sjwk=;
 b=V5793x0+Hynpq/EJXiLfpNOn4SfruRdz/EtETVEi4Rvmsrs0TX/orT4vKpbiHm0MrzlgpF
 r8WvnqdjDj+oe4M8XnVE9PHGBn7LcfuUZmFpfC7PBHL9W6MlEtHU5eK+bCvOiItcv6EyO1
 jaFVckq/8CmKN2qblSZ3nSUZgtoZL/Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-D8_tPgHfOL-tvnF3vfPKHA-1; Thu, 08 Aug 2024 10:22:08 -0400
X-MC-Unique: D8_tPgHfOL-tvnF3vfPKHA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-427b7a2052bso12742005e9.2
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 07:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723126927; x=1723731727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eWiq/R1qfDvotqZucy6GvkqQ+EVl6vxLjsehT82Sjwk=;
 b=xP0BDt3KZTnBOury6uMEhFaXp875YHKUTEXcK0ef7gXhsU7SLDF6JrOshZEo/3KnJs
 nHXVRbEdOAfMtjBUTYqRrm6yDXRI1P5LogmSGMSWoXyPyqh4ffrJ1QqjceX1KDkr7GaN
 MB5nf7ZkA4f6KHfNMG0MMHKYRV2qqjbQaUapeGiPcvWn8OZkQa7rCuzv/ee74L+aZa4L
 muTswbciFh2cU4jwlrSTrKqhnq/FK6+/af/Zs2Arz6JmhyqGBY3LWS6daiKc3t5b/FK/
 61UlBC5mjAZ370kleeToFkjOHj4JQhuuhvYJc1AdwxGOcDY6B0B3FoJTaSjp2VtcnYYj
 UhGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQMDh1UPKFZFHM6U8xSXm83Q5rVegUkeAAW/lpEDujtZrgOJzzI9JkLlJDFYxOHBwCZCaz7OnMJ3YP1wII6o9LEDr4
X-Gm-Message-State: AOJu0YyhAy2S7Qn3nXKSzXkrCnxZkyIgDRtj8wNRDBTdm6PN7YrJUxO9
 NQPW9ylfWy6xOozgnbvruzNqPHwq20ZsgLOgHmg94jycjU7myxBneM80dddu4tjHxEYhjPyGgM5
 33cKZ6yPKmNmc77gOoJ+xQszIPbWM+/bqvwCyGHqjNT+ET/mJQg==
X-Received: by 2002:adf:979e:0:b0:36b:a40c:5c09 with SMTP id
 ffacd0b85a97d-36d27591d39mr1599397f8f.58.1723126927512; 
 Thu, 08 Aug 2024 07:22:07 -0700 (PDT)
X-Received: by 2002:adf:979e:0:b0:36b:a40c:5c09 with SMTP id
 ffacd0b85a97d-36d27591d39mr1599371f8f.58.1723126926960; 
 Thu, 08 Aug 2024 07:22:06 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36d2718bfc4sm2072056f8f.57.2024.08.08.07.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 07:22:06 -0700 (PDT)
Date: Thu, 8 Aug 2024 16:22:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Markus Armbruster <armbru@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic
 CPER error injection
Message-ID: <20240808162205.3a85efb6@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240808161141.5ffe730e@foz.lan>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
 <51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
 <87v80b1jqe.fsf@pond.sub.org> <20240808161141.5ffe730e@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3/OsSZoTq8i1

On Thu, 8 Aug 2024 16:11:41 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Thu, 08 Aug 2024 10:50:33 +0200
> Markus Armbruster <armbru@redhat.com> escreveu:
> 
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:  
> 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 98eddf7ae155..655edcb6688c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -2075,6 +2075,13 @@ F: hw/acpi/ghes.c
> > >  F: include/hw/acpi/ghes.h
> > >  F: docs/specs/acpi_hest_ghes.rst
> > >  
> > > +ACPI/HEST/GHES/ARM processor CPER
> > > +R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > +S: Maintained
> > > +F: hw/arm/ghes_cper.c
> > > +F: hw/acpi/ghes_cper_stub.c
> > > +F: qapi/ghes-cper.json
> > > +    
> > 
> > Here's the reason for creating a new QAPI module instead of adding to
> > existing module acpi.json: different maintainers.
> > 
> > Hypothetical question: if we didn't care for that, would this go into
> > qapi/acpi.json?  
> 
> Independently of maintainers, GHES is part of ACPI APEI HEST, meaning
> to report hardware errors. Such hardware errors are typically handled by 
> the host OS, so quest doesn't need to be aware of that[1].
> 
> So, IMO the best would be to keep APEI/HEST/GHES in a separate file.
> 
> [1] still, I can foresee some scenarios were passing some errors to the
>     guest could make sense.
> 
> > 
> > If yes, then should we call it acpi-ghes-cper.json or acpi-ghes.json
> > instead?  
> 
> Naming it as acpi-ghes,acpi-hest or acpi-ghes-cper would equally work
> from my side.

if we going to keep it generic, acpi-hest would do

> 
> >   
> > >  ppc4xx
> > >  L: qemu-ppc@nongnu.org
> > >  S: Orphan    
> > 
> > [...]
> >   
> > > diff --git a/qapi/ghes-cper.json b/qapi/ghes-cper.json
> > > new file mode 100644
> > > index 000000000000..3cc4f9f2aaa9
> > > --- /dev/null
> > > +++ b/qapi/ghes-cper.json
> > > @@ -0,0 +1,55 @@
> > > +# -*- Mode: Python -*-
> > > +# vim: filetype=python
> > > +
> > > +##
> > > +# = GHESv2 CPER Error Injection
> > > +#
> > > +# These are defined at
> > > +# ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
> > > +# (GHESv2 - Type 10)
> > > +##    
> > 
> > Feels a bit terse.  These what?
> > 
> > The reference could be clearer: "defined in the ACPI Specification 6.2,
> > section 18.3.2.8 Generic Hardware Error Source version 2".  A link would
> > be nice, if it's stable.  
> 
> I can add a link, but only newer ACPI versions are hosted in html format
> (e. g. only versions 6.4 and 6.5 are available as html at uefi.org).

some years earlier it could be said 'stable link' about acpi spec hosted
elsewhere. Not the case anymore after umbrella change.

spec name, rev, chapter worked fine for acpi code (it's easy to find wherever spec is hosted).
Probably the same would work for QAPI, I'm not QAPI maintainer though,
so preffered approach here is absolutely up to you.

> 
> Can I place something like:
> 
> 	Defined since ACPI Specification 6.2,
> 	section 18.3.2.8 Generic Hardware Error Source version 2. See:
> 
> 	https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#generic-hardware-error-source-version-2-ghesv2-type-10
> 
> e. g. having the link pointing to ACPI 6.4 or 6.5, instead of 6.2?
> 
> >   # @raw-data: payload of the CPER encoded in base64
> > 
> > Have you considered naming this @payload instead?  
> 
> Works for me.
> 
> Thanks,
> Mauro
> 

