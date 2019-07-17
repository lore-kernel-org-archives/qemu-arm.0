Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp550376wrv;
        Wed, 17 Jul 2019 01:14:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyh67QsR3KrQ+QUvJ+KabUdM6Rjvooe0lk9uLMOgkfPrkowVQnaK5wbnrPWS9fXNZyXwhR6
X-Received: by 2002:a0c:ba0b:: with SMTP id w11mr27706634qvf.71.1563351242009;
        Wed, 17 Jul 2019 01:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563351242; cv=none;
        d=google.com; s=arc-20160816;
        b=XLWp9P+uDSHCjAHxuK8HWTduFksYyMaXH8ZCweA3ctU94YewVaUcRTGYjKOAZF+RB/
         qcaqC2hWB8yAU4ZHv4rJ8ktRgas4lBgrej8dlW4EVCO2fmsLQDG7mOkQMi5y6MPWBYuZ
         yYTD+fJSm3B0WYvqjZvMqB6gJ6NfYbSwvM6YgFT+ZFEaXzP0iH7pk1PpV8jV6oR8YF8M
         gdGqX+GrM23dRRBr7DDhRNEdgCISG1/yM3yg/TExvSUb5T+CQD5GUedzffbdCBa9UH3W
         61hHcySFd0BlduulVCRZhVItHF+pRAoIMCf30vxvASQVOKNgmTsB9HvqY2FP2gVYvz4H
         rb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=2olGxxBhPSwEfSLqaq1IB4/BMC+iCqVkCx3p9WIa86s=;
        b=YQO5y0UkKiD9f4RqKRpTHRTmE7K8pjJz3EfTq8eVnxe6H/JOskcEtBezJbr/FSSaBU
         SesR3MwCmtT9YlsNTfIsZtOQVBE/6O2/Uncw+5vpccwWChE1cY923e9NwCtOQ85oD91t
         b/F8ILnoBtygMOiZftlathvb781cSILC2LNm+zCXei41R43Kaqg/uG1dtmg1ZpcAZzWu
         o7oERhgu+kaA3uMc7x+5544tnbAu9F4CiPRuyhK3IOwtEmTZHRI5ss+yGULZEYCVXY6Y
         ZPksVY0XHTDv5zTiUVotmInf/XZMg2cqqmr+mX+FGgAPv1Y8T/iX+urL6NoYMZCxNU0a
         VJ4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t55si15932455qtt.283.2019.07.17.01.14.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 01:14:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A5C1308338E;
	Wed, 17 Jul 2019 08:14:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 152EB5C232;
	Wed, 17 Jul 2019 08:13:56 +0000 (UTC)
Date: Wed, 17 Jul 2019 10:13:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
Message-ID: <20190717081354.adoflwxpvxxt7iwi@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <be805987-250d-93a7-7d11-5204f0e16e7b@linaro.org>
 <20190628072739.5t2o2yqaejn6pyd5@kamzik.brq.redhat.com>
 <4e7e78a6-1e6f-4190-4b15-12f443d9be78@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e7e78a6-1e6f-4190-4b15-12f443d9be78@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 17 Jul 2019 08:14:01 +0000 (UTC)
X-TUID: PNjmPGZurmmU

On Sat, Jun 29, 2019 at 02:10:28AM +0200, Richard Henderson wrote:
> On 6/28/19 9:27 AM, Andrew Jones wrote:
> > Also, while it's true we can always
> > get the max vq with next-smaller(ARM_MAX_VQ + 1), having it cached in
> > cpu->sve_max_vq is convenient. That said, I think we'd rather keep it.
> 
> When is it convenient, and for what?

It's used for the upper boundary in several loops in target/arm/kvm64.c

> 
> Certainly the only thing that we check after boot is the largest enabled vq not
> larger than x.  And for that I don't see that sve_max_vq is relevant at all.
> 
> Oh, something that we should also think about is -cpu foo, where foo is one of
> the Fujitsu thingumies.  We should be able to default sve_vq_map to that which
> a real bit of hw actually supports.  I, for one, welcome our typedef long
> overlords.  ;-)

I don't think we need to implement an A64FX cpu model with this series,
although that's a nice idea for people that focus on TCG to do as a
follow-up series. This series fully enables the guest to use SVE on the
A64FX when KVM is enabled, without the need to special case it in any way.

Thanks,
drew
