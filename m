Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp523853njc;
        Thu, 8 Aug 2024 07:12:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuy6m9Gl5J8w0KtyRImMdNhv3i9FpXczeU3fccj8+0LKCsKTY9Fd+FPJvyclXtrj8z+vtQU6DLaHEFquqydDAWynkyO+ij
X-Google-Smtp-Source: AGHT+IGE/LhE2FIZjhQ2eCpHsQbG5aXUNCt5ATHbs+AZMFrkpzm6dQxPVUeRL46/TT/eQSI9rQW7
X-Received: by 2002:a05:6102:38d1:b0:493:c261:1a9c with SMTP id ada2fe7eead31-495c7712811mr1063582137.5.1723126360236;
        Thu, 08 Aug 2024 07:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723126360; cv=none;
        d=google.com; s=arc-20160816;
        b=zFR5mkrdQ18i0TwJmt4I9VKiavslHS77jF5yri6Yj0UQtBxMzuthNDnVKTKPYk56Lx
         PoWMJXbFXU0Jm5QvMqi0gOqjX+OMjsVupdqaH6/wzVoi8Jbohn+eMyAFvcDis85l9Nfz
         lJ+5Ne1yv2S4McV1JXigyqzSMYgT1H92y/2RTowETJyDzCGoo+0miBZu/GZQUFNonR/z
         9kw9Q07na4UmUKTmOek94/IkX5Mjc0iBRkOxLpYaod9MErSM/wWhUYjKjRHh+OdMx9Sy
         pyKu4Cdy9b+7vObgk+XacKDFbzThvIjq2Zrc4N1suw3jAaa2lnJbtyCd3P1q9yzJZxDi
         dxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=mHvFUDGFU6xQKRN6lfMKOCKayeOApHPW6P0sow8iuUM=;
        fh=ztu+7y0Pc0MGlFkdBUqcRJ8TIWQg+rF9cUr9MoKbAk4=;
        b=zuoe3hRH0SzrbYFmD7mH6uHWL2xqVJ1e1q+6uqn8M35tM69J9o9AfX/TXoaqpQ2H6w
         5EkRVxOFdB6vPt1FsKXtahZ5GKmcZbtfp+lPW3WblG5fQx9bItHBraJ0YXJfxXz/kENc
         wYIJqondMX+UJFZZs4uBaikvynlSDZ8F6kpAORhfn6337AUD7Ml57snaNdfdw2Klg0Sg
         jM9zenupaoSr9p955PrHnAbh0pX8KxjggQLrW5lJ4SezAnfdGoPIV2+g9MxLDp5brIRc
         gvMV27djIfZKOokXCMT7KZ0csE/LCnmpwQ2vDDYKiIrJjd/pZMJZBkApkeya/uqJOAw8
         Uwzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sgSsRyDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4945dbfc27bsi3059865137.570.2024.08.08.07.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 07:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sgSsRyDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc3ry-00024L-EO; Thu, 08 Aug 2024 10:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc3rx-00022k-0V; Thu, 08 Aug 2024 10:11:57 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc3ru-0003Ry-Q0; Thu, 08 Aug 2024 10:11:56 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39748CE1235;
 Thu,  8 Aug 2024 14:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30833C32782;
 Thu,  8 Aug 2024 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723126307;
 bh=+8KhZkMTI5fRZGMzqJiKMgxHC07OvLU1UljF56wsFDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sgSsRyDFt7OAwOaW34uDzSl+7WLoS2aAgUs/xckW5EK/4cWOfyAlSYT64mTCgLcJb
 s1aexZW+xsPXBmmUNg33vx5AuKwMuALesWFRK/zxpFRo1ewo/4o2uqlaij7JIctLCz
 +5UVeyBMbJQf57ushrLmciG8wwZI0zDiDBddOs9BlQKMnjpb7u0t4V99NmUUYVt9Fr
 q7zEICRDImzWheYij9Vg3Jaa4MnvH9Xf5Z1AWHWBn2MSfb8m6zcATy0NSl5mR9LY++
 KV/zbZ0q413U4IzKvvL7Xz25IMG/FY+u9CpsCyyhFIQMJkO+70iSB1rzBm7r8m67BU
 gG8d9zKVBxbUg==
Date: Thu, 8 Aug 2024 16:11:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake
 <eblake@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic
 CPER error injection
Message-ID: <20240808161141.5ffe730e@foz.lan>
In-Reply-To: <87v80b1jqe.fsf@pond.sub.org>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
 <51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
 <87v80b1jqe.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=mchehab+huawei@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JehN45TLkEi+

Em Thu, 08 Aug 2024 10:50:33 +0200
Markus Armbruster <armbru@redhat.com> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 98eddf7ae155..655edcb6688c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2075,6 +2075,13 @@ F: hw/acpi/ghes.c
> >  F: include/hw/acpi/ghes.h
> >  F: docs/specs/acpi_hest_ghes.rst
> >  
> > +ACPI/HEST/GHES/ARM processor CPER
> > +R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > +S: Maintained
> > +F: hw/arm/ghes_cper.c
> > +F: hw/acpi/ghes_cper_stub.c
> > +F: qapi/ghes-cper.json
> > +  
> 
> Here's the reason for creating a new QAPI module instead of adding to
> existing module acpi.json: different maintainers.
> 
> Hypothetical question: if we didn't care for that, would this go into
> qapi/acpi.json?

Independently of maintainers, GHES is part of ACPI APEI HEST, meaning
to report hardware errors. Such hardware errors are typically handled by 
the host OS, so quest doesn't need to be aware of that[1].

So, IMO the best would be to keep APEI/HEST/GHES in a separate file.

[1] still, I can foresee some scenarios were passing some errors to the
    guest could make sense.

> 
> If yes, then should we call it acpi-ghes-cper.json or acpi-ghes.json
> instead?

Naming it as acpi-ghes,acpi-hest or acpi-ghes-cper would equally work
from my side.

> 
> >  ppc4xx
> >  L: qemu-ppc@nongnu.org
> >  S: Orphan  
> 
> [...]
> 
> > diff --git a/qapi/ghes-cper.json b/qapi/ghes-cper.json
> > new file mode 100644
> > index 000000000000..3cc4f9f2aaa9
> > --- /dev/null
> > +++ b/qapi/ghes-cper.json
> > @@ -0,0 +1,55 @@
> > +# -*- Mode: Python -*-
> > +# vim: filetype=python
> > +
> > +##
> > +# = GHESv2 CPER Error Injection
> > +#
> > +# These are defined at
> > +# ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
> > +# (GHESv2 - Type 10)
> > +##  
> 
> Feels a bit terse.  These what?
> 
> The reference could be clearer: "defined in the ACPI Specification 6.2,
> section 18.3.2.8 Generic Hardware Error Source version 2".  A link would
> be nice, if it's stable.

I can add a link, but only newer ACPI versions are hosted in html format
(e. g. only versions 6.4 and 6.5 are available as html at uefi.org).

Can I place something like:

	Defined since ACPI Specification 6.2,
	section 18.3.2.8 Generic Hardware Error Source version 2. See:

	https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#generic-hardware-error-source-version-2-ghesv2-type-10

e. g. having the link pointing to ACPI 6.4 or 6.5, instead of 6.2?

>   # @raw-data: payload of the CPER encoded in base64
> 
> Have you considered naming this @payload instead?

Works for me.

Thanks,
Mauro
