Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1790521wrs;
        Thu, 15 Aug 2019 01:45:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxe75QM8p6TsxidCRxAUzORV37/JAhtSSU7+V6AMM0ZOwI6irTu8orBc1qET8QogSbIlY9j
X-Received: by 2002:aed:2c84:: with SMTP id g4mr3079229qtd.344.1565858733881;
        Thu, 15 Aug 2019 01:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565858733; cv=none;
        d=google.com; s=arc-20160816;
        b=FOTB6X2UtfnhrceGIJiOFH3Ui0uFtvybFlSUl+5zb4L7srnb6O/jxcu5uGaJI1HJEH
         uLj1FXUpYx5Y5e0tp3WetkUy82j3LRzTbjnH6FStb641yb285t1rqGZmJ2WRjyd7fnI+
         l/R7e98lpy5pSNHRN0h/QgsRJFyHhttWKDM33OX1+MtUdNPjHCJ6TSl/Ul7alOtnQhKn
         XCTZppAlXeh1Jcr/YdWvnMCDkjYk+2rTpfIhJXr7CHtRq98x5NETYQMg23rRgqScKpzJ
         P7217mFeUUjX0ruKVefCy8BeOmREAtFoRVtYNphncrc4cjvWUXFCqXAc+kFqpBacfmOw
         IHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=AZDMUWqTNe5Y/unQE6vuGEUhnn17HNJVmrr2bhp/C6s=;
        b=tCr1x6sPSa3WeTjgNVrzde7YALDD+H3AKMVWNyb/NJ3Tka0+/L3T3gRIVKGnSGVoCy
         sx8DtwyNySBIHiDF8MLuavVa4WK8d+CtcjQZ0T0EU5y1igFL4keBjQQJWeepImLIj1Ap
         kzkRN7fCITzbXlvsJf7myF5R5ciOCo+ofc+4HaR8G/x6LXFaBCOkcSFLxOqvyUrfjw8Q
         0bn2XlnO2t3e/coIX97ZHjU8sHsflSVFaaFcI9b1oCxqvyBKvaw8+rvh5SyWQELJ6f/n
         lq4kLaykXjLxaO5oSGzsn3jKGMUu2G3tv+pcdk39zUm3yDhxsWL89uT65ZnREh1Y/sZn
         +UyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d47si1217939qte.90.2019.08.15.01.45.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 01:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17F5759455;
	Thu, 15 Aug 2019 08:45:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-204-82.brq.redhat.com [10.40.204.82])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADF1B429AA;
	Thu, 15 Aug 2019 08:45:28 +0000 (UTC)
Date: Thu, 15 Aug 2019 10:45:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Dave P Martin <Dave.Martin@arm.com>
Subject: Re: [Qemu-devel] [PATCH v3 00/15] target/arm/kvm: enable SVE in
 guests
Message-ID: <20190815084526.e335iqjyvif3ecqr@kamzik.brq.redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
 <CAFEAcA_Tq-DLQuH2-+NtYOE0m4ki_CfEfWpHG+UM4rGhdK3q-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_Tq-DLQuH2-+NtYOE0m4ki_CfEfWpHG+UM4rGhdK3q-w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 15 Aug 2019 08:45:33 +0000 (UTC)
X-TUID: 2iEIWqcUW3tr

On Thu, Aug 15, 2019 at 09:31:35AM +0100, Peter Maydell wrote:
> On Fri, 2 Aug 2019 at 13:25, Andrew Jones <drjones@redhat.com> wrote:
> >
> > Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guests.
> > This series provides the QEMU bits for that enablement. First, we
> > select existing CPU properties representing features we want to
> > advertise in addition to the SVE vector lengths and prepare
> > them for a qmp query. Then we introduce the qmp query, applying
> > it immediately to those selected features. We also document ARM CPU
> > features at this time. We next add a qtest for the selected CPU
> > features that uses the qmp query for its tests - and we continue to
> > add tests as we add CPU features with the following patches. So then,
> > once we have the support we need for CPU feature querying and testing,
> > we add our first SVE CPU feature property, 'sve', which just allows
> > SVE to be completely enabled/disabled. Following that feature property,
> > we add all 16 vector length properties along with the input validation
> > they need and tests to prove the validation works. At this point the
> > SVE features are still only for TCG, so we provide some patches to
> > prepare for KVM and then a patch that allows the 'max' CPU type to
> > enable SVE with KVM, but at first without vector length properties.
> > After a bit more preparation we add the SVE vector length properties
> > to the KVM-enabled 'max' CPU type along with the additional input
> > validation and tests that that needs.  Finally we allow the 'host'
> > CPU type to also enjoy these properties by simply sharing them with it.
> 
> Hi -- I see there have been some review comments on these patches
> that mean there'll be a v4. In the meantime, patches 1, 2, 5, 6, 9, 10
> seem to me to be independent bugfixes/cleanups that have been reviewed.
> Would you like me to take those into target-arm.next to reduce the
> size of the patchset for v4, or is that going to make rebasing
> painful on your end?
>

Hi Peter,

Please do take the fixups. I think the rebasing should go fine, and indeed
reducing the number of patches in the patchset should reduce some of my
maintenance and also some reviewer strain for v4.

Thanks,
drew
