Received: by 10.25.150.194 with SMTP id y185csp301075lfd;
        Wed, 9 Nov 2016 07:07:09 -0800 (PST)
X-Received: by 10.37.252.28 with SMTP id v28mr17851374ybd.145.1478704028950;
        Wed, 09 Nov 2016 07:07:08 -0800 (PST)
Return-Path: <peterx@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b9si21455qkj.81.2016.11.09.07.07.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Nov 2016 07:07:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=peterx@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 063CD9023B;
	Wed,  9 Nov 2016 15:07:08 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn-60-187.rdu2.redhat.com [10.10.60.187])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uA9F75JL007340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 9 Nov 2016 10:07:06 -0500
Date: Wed, 9 Nov 2016 10:07:05 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, pbonzini@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org, marc.zyngier@arm.com,
        eric.auger@redhat.com, christoffer.dall@linaro.org
Subject: Re: [kvm-unit-tests PATCH v4 08/11] libcflat: add IS_ALIGNED()
 macro, and page sizes
Message-ID: <20161109150705.GA3762@pxdev.xzpeter.org>
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-9-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1478636499-14339-9-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 09 Nov 2016 15:07:08 +0000 (UTC)
X-TUID: Hh4oeJ1cJmdS

On Tue, Nov 08, 2016 at 09:21:36PM +0100, Andrew Jones wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> These macros will be useful to do page alignment checks.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> [drew: also added SZ_64K]
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>
