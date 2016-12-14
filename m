Received: by 10.25.205.13 with SMTP id d13csp211672lfg;
        Wed, 14 Dec 2016 05:46:50 -0800 (PST)
X-Received: by 10.200.47.204 with SMTP id m12mr101714461qta.79.1481723210131;
        Wed, 14 Dec 2016 05:46:50 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w30si30168242qta.180.2016.12.14.05.46.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Dec 2016 05:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BBA5730;
	Wed, 14 Dec 2016 13:46:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uBEDkiHj012146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 14 Dec 2016 08:46:46 -0500
Date: Wed, 14 Dec 2016 14:46:44 +0100
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, marc.zyngier@arm.com, andre.przywara@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [PATCH kvm-unit-tests v8 00/10] arm/arm64: add gic
 framework
Message-ID: <20161214134644.4jm4sfv42jai732o@kamzik.brq.redhat.com>
References: <20161208175030.12269-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161208175030.12269-1-drjones@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 14 Dec 2016 13:46:49 +0000 (UTC)
X-TUID: NfbKtA5oDBHd

On Thu, Dec 08, 2016 at 06:50:20PM +0100, Andrew Jones wrote:
> 
> v8:
>  - Main change is rebasing to Wei's sysreg framework, which is part
>    of his PMU series, which I've applied to arm/next. That rebase
>    leads to dropping the first two patches of the v7 series, expecting
>    get_mpidr() to return u64 (with future patches), a rework of the
>    delay routines (now based on sysreg framework), and changes to all
>    sysreg asms
>  - The delay routines also got their own files: delay.[ch]
>  - Another bigger change was to now keep gic_common_ops local to
>    lib/arm/gic.c, export the functions from the gic-v[23] instead
>  - Yet another bigger change was dropping the sender and irq cmdline
>    inputs, hard coding to '1' is sufficient and much less code
>  - Other minor changes listed in individual patches   
>

OK, I'm going to go ahead and apply this to arm/next. Before making
the pull request I'll post another series that includes the 64-bit
MPIDR fix that Andre pointed out we need, and a couple other fixes,
though. Assuming nobody complains about that series, then I'll fold
those patches into arm/next too and make the pull request.

Thanks,
drew
