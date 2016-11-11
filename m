Received: by 10.25.150.194 with SMTP id y185csp1393819lfd;
        Fri, 11 Nov 2016 07:31:02 -0800 (PST)
X-Received: by 10.200.40.101 with SMTP id 34mr3938730qtr.38.1478878262844;
        Fri, 11 Nov 2016 07:31:02 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m25si17459qtm.250.2016.11.11.07.31.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Nov 2016 07:31:02 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8542C00E0A3;
	Fri, 11 Nov 2016 15:31:01 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-166.brq.redhat.com [10.40.204.166])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uABFUuJh021007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 11 Nov 2016 10:30:58 -0500
Date: Fri, 11 Nov 2016 16:30:56 +0100
From: Andrew Jones <drjones@redhat.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
        qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
        pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v5 06/11] arm/arm64: add
 initial gicv2 support
Message-ID: <20161111153056.2jl5vvixb33jsmoe@hawk.localdomain>
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-7-git-send-email-drjones@redhat.com>
 <87vavu6pc7.fsf@linaro.org>
 <2400d95c-02c3-5621-8cc1-32a61d3795e8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2400d95c-02c3-5621-8cc1-32a61d3795e8@arm.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 11 Nov 2016 15:31:01 +0000 (UTC)
X-TUID: jxQBnJJu3nQ4

On Fri, Nov 11, 2016 at 03:17:25PM +0000, Andre Przywara wrote:
> > 
> > This doesn't seem to be used and I'm not sure what GICD_TYPER_IRQS it is
> > trying to achieve.
> 
> The idea is to calculate the number of implemented SPIs. But I am not a
> big fan of copying a macro from the emulation code base to the test code.
>

Consider it rewritten then :-) I did review the spec while copying
over stuff from Linux, so Linux has been getting a review at the
same time. I agree that we should be cautious with copy+paste and
we should probably not bring over super complex macros that are hard
to understand, because we want kvm-unit-tests to be easy to read.
Let's not say "no macros from Linux", but rather case-by-case it.
I think this macro is a nice addition to our little API.

Thanks,
drew
