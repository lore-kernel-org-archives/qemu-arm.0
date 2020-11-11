Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp619265lfb;
        Wed, 11 Nov 2020 09:40:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7IttWwBVt+EUpVMvq5spva3xr5/urhrmqxcmKxxpu8qn7jtPrAQ6UkNxmYa2kK64dc8d+
X-Received: by 2002:a25:3342:: with SMTP id z63mr29239074ybz.393.1605116404875;
        Wed, 11 Nov 2020 09:40:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605116404; cv=none;
        d=google.com; s=arc-20160816;
        b=fGi9IuVbgRX90RYzdDQhfW4k8krkhSf4xLMNPa2LAws7jIrenjmcrSWlk+Ktfwoi7c
         UBCZPBmo0cR5hPx3ekrxGLyglrxGa8ZxPH4JWLB5DX+cwRVkhYq+J3pbFgapG8WKt/GZ
         w64aF7vpkS1cSEK6oF84ZjvLJehNmopnGHZzU5TuYyEpxqwKQgSzK7RvujRErgJY9jb7
         ykLDkbpZcBoNAATHL8WrpDis+38FeHEeilOBVMck8fsBi0+eWlx+Jy0Hfl7qmc5umnz3
         Z1lXrZym+AAqkHiqqwYmSOEQUkpFtYdQDB7ljL4zdNHvW3/6aryPFhu4BOzzIi89dPVL
         95kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wm7cbPjL0pc1pz7T3BWnf8WELH6qbuYnEbCLKNygj70=;
        b=rJfzjbIQa8SOAxUuNLI27cI1BfKSDKFmtZ8T8UF4HGwkp9dH8KL9zPUeWSHt6NWe2P
         CezTmYwiR42hIiwfOhRZwOucqvr3XrCGH7Cfj82uXy6oOVp0CCyc+pVL851bVaqDQZSQ
         iBS9hEmMXYu2DPmcUp2h7JclP6oRrpMdaCOwXA0lHIdjeEVWBOco02RhaZPYqWkDbHYC
         6mzcSZWpAWuKMHWmNrWYLinvG+zfmjQUwto7QJeJrhBBBbol2ujMj+ha/qmCx4mbp+tt
         BGJqqh3CQeKt65jB5oCo3UHmoEFK86PmRq4ToeEqpJ0xFISnpIf69yXMGY79A77lPqTu
         PvfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Bib6a7D3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si2317328ybc.418.2020.11.11.09.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 09:40:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Bib6a7D3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcu6G-00072n-1o
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 12:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kcu5y-00071r-SS
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 12:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kcu5t-0003XM-0p
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 12:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605116379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wm7cbPjL0pc1pz7T3BWnf8WELH6qbuYnEbCLKNygj70=;
 b=Bib6a7D3hOHZv0oRnAPbjcBoEjZU0JBBUrlpIvwdaFTkelEvqjQICAu7zjY2sXQXOQBUY8
 w3J7TNatJdnV4PKCompM56g/cZ0w3ti+YhXWtewDBcmnmpfl7LTC0LhjIsHb8Jh95uqJ9R
 8L5zv1ifUyPxV9/rFscD/uTlvKH8tm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-EAqsbt2cOcmyX7QAj5STMw-1; Wed, 11 Nov 2020 12:39:37 -0500
X-MC-Unique: EAqsbt2cOcmyX7QAj5STMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C5E1800688;
 Wed, 11 Nov 2020 17:39:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E78E85DA6A;
 Wed, 11 Nov 2020 17:39:34 +0000 (UTC)
Date: Wed, 11 Nov 2020 18:39:32 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
Message-ID: <20201111173932.yjrlkddo6v6msqff@kamzik.brq.redhat.com>
References: <20201111143440.112763-1-drjones@redhat.com>
 <1888391810.22919498.1605107125694.JavaMail.zimbra@redhat.com>
 <CAFEAcA9pYcXZ9LF=76N1OxF=UgYkiF+Z549vq9xWpS52qV7cLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9pYcXZ9LF=76N1OxF=UgYkiF+Z549vq9xWpS52qV7cLg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8YNXApdXk7PP

On Wed, Nov 11, 2020 at 04:00:25PM +0000, Peter Maydell wrote:
> On Wed, 11 Nov 2020 at 15:05, Miroslav Rezanina <mrezanin@redhat.com> wrote:
> >
> > ----- Original Message -----
> > > From: "Andrew Jones" <drjones@redhat.com>
> > > To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
> > > Cc: "peter maydell" <peter.maydell@linaro.org>, philmd@redhat.com, "Miroslav Rezanina" <mrezanin@redhat.com>
> > > Sent: Wednesday, November 11, 2020 3:34:40 PM
> > > Subject: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
> > >
> > > The removal of the selection of A15MPCORE from ARM_VIRT also
> > > removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.
> 
> >
> > Problems with missing dependencies solved by this patch.
> >
> > Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
> 
> This is the second of this kind of "missing select" bug I've
> seen recently. I don't suppose there's some kind of testing
> we could add to 'make check' that automatically catches them?
>

Miroslav is finding them because the RHEL build of QEMU is more selective
than upstream as to what gets pulled in. Effort keeps going into making
upstream more configurable, but it's not quite there yet for RHEL's
purposes. I'm not sure how best to test something like this upstream.
I guess it would require the flexible configuration support we don't yet
have.

Thanks,
drew

