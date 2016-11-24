Received: by 10.25.150.194 with SMTP id y185csp178185lfd;
        Thu, 24 Nov 2016 06:11:09 -0800 (PST)
X-Received: by 10.55.48.11 with SMTP id w11mr2355484qkw.109.1479996669678;
        Thu, 24 Nov 2016 06:11:09 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c62si22532037qkj.331.2016.11.24.06.11.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Nov 2016 06:11:09 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0AA5C05AA63;
	Thu, 24 Nov 2016 14:11:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAOEB4jB014690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 24 Nov 2016 09:11:06 -0500
Date: Thu, 24 Nov 2016 15:11:03 +0100
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, peter.maydell@linaro.org, marc.zyngier@arm.com,
        andre.przywara@arm.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v7 11/11] arm/arm64: gic:
 don't just use zero
Message-ID: <20161124141103.yzfswsvi6ion7po5@kamzik.brq.redhat.com>
References: <20161123165406.32661-1-drjones@redhat.com>
 <20161123165406.32661-12-drjones@redhat.com>
 <2f88f60c-f7a2-3916-cd1f-5a86453d9ba9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f88f60c-f7a2-3916-cd1f-5a86453d9ba9@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 24 Nov 2016 14:11:08 +0000 (UTC)
X-TUID: c69iohtA8HvC

On Thu, Nov 24, 2016 at 10:57:01AM +0100, Auger Eric wrote:
> Hi,
> 
> On 23/11/2016 17:54, Andrew Jones wrote:
> > Allow user to select who sends ipis and with which irq,
> > rather than just always sending irq=0 from cpu0.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks!

But if I spin a v8 then I may just dump all the command line parsing
stuff, dropping the optional input arguments sender and irq, or at
least irq. I'm feeling it's a bit crufty... Any thoughts on that?

drew
