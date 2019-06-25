Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4581105wrg;
        Mon, 24 Jun 2019 23:11:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyZ0AILzrI1LvHiJkJ33+RmIs8FaTUh+M+IzxIXCJ6K9+XFHdqlKd2XGOnk04BP1mO0U0W
X-Received: by 2002:ac8:34c6:: with SMTP id x6mr69377984qtb.353.1561443102036;
        Mon, 24 Jun 2019 23:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561443102; cv=none;
        d=google.com; s=arc-20160816;
        b=05LBu2QTKzpLd7KW/droUMto7N+ohPhSrmFIa2Wcc+9JHstyeZbBQIY7jBeLYQd245
         qBiZAECxwCWHuXjK1AAobHWHW9s15v5jtuYIsVA0M73rhGqfBOcBwCX4/S3kHXaL2O+Q
         JjbBYPw9IOsm56P4wckbPFMPRvVeTLr5PsH06Jnub08S51r9AEshnXD1isXzsH6MRplm
         12ACRfow90SHwV63JJt9ZB3MQySFBpoMQwGzzlhkCMutKGS9YXaYB0LVqEFp4dvGfGB2
         73FS0tq6ciI0E1CcIIEnzn0YFdHGrbzihlD8isHs+1zx8rhVQ1wduUSUwnGwzdLwF9Hf
         lRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=j5OQ8PFce5lJabo844LzZYnsv73G9H6CSYQYoHpjDEQ=;
        b=GL/6bqXjyoV74jPUKb18N/0SjfJX5HYTx5/wik5vBvL02X13EJ8sxrRvpFIHoBYBeA
         OvPwgnuAoatEmYObgZM9MJTHEJqksRHSGt27JbyG2qonrMXz6IG4ilqcEfS7fQWprCMN
         eIBQ01lt3O9m8bLSJSGFV3IefsWidSThfmrM5r+Zxn+DBg0JSbp+A08mPRhuTeMEv7n2
         KhrXlr6SSa3Z1trCoMXf940C0inr2YHfdRqJxFrPP0ZJSGZOKQNIkIzWEZ41UThfo7hs
         jkt6INEEvVt+e7SUDzlDwNoOzyS28p5W5lTwB1C/9BDcaPZG/mysxUx+LVSgfWGzAige
         QC5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s21si8596726qte.82.2019.06.24.23.11.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 23:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AD4E7FDCC;
	Tue, 25 Jun 2019 06:11:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 629AD600CD;
	Tue, 25 Jun 2019 06:11:30 +0000 (UTC)
Date: Tue, 25 Jun 2019 08:11:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
Message-ID: <20190625061127.jvrbee6eyxf4meem@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <20190624110507.GG2790@e103592.cambridge.arm.com>
 <20190624113037.m5onedluc4x7c5ej@kamzik.brq.redhat.com>
 <20190624160308.GT2790@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624160308.GT2790@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 25 Jun 2019 06:11:41 +0000 (UTC)
X-TUID: SQg4pIcPl8HS

On Mon, Jun 24, 2019 at 05:03:08PM +0100, Dave Martin wrote:
> On Mon, Jun 24, 2019 at 12:30:37PM +0100, Andrew Jones wrote:
> > On Mon, Jun 24, 2019 at 12:05:07PM +0100, Dave Martin wrote:
> > > On Fri, Jun 21, 2019 at 05:34:13PM +0100, Andrew Jones wrote:
> > > 
> > > The purpose of this check should probably at least be described in a
> > > comment -- i.e., what actually depends on this?
> > 
> > I was thinking the already present "Bits other than [3:0] are RAZ/WI."
> > explained that, but how about this for an improvement?
> > 
> > /*
> >  * Only the lowest 4 bits of ZCR_ELx may be used to constrain the vector
> >  * length, the rest of the bits are RAZ/WI. Since the vector length of
> >  * 128-bits (1 in quadwords) is represented as zero in ZCR_ELx, and all
> >  * vector lengths are represented as their length in quadwords minus 1,
> >  * then four bits allow up to quadword 16 to be selected.
> >  */
> 
> No, maybe the existing comment is enough.
> 
> I thought there might be more code elsewhere that assumes that checks
> sve_max_vq <= ARM_MAX_VQ then then assumes that sve_max_vq <= 16.  But
> if not, we probably don't need an additional comment here.

I suppose there is some assumption that if sve_max_vq > 0 then it is
also <= ARM_MAX_VQ elsewhere in QEMU. However here in zcr_write I don't
think that assumption is being used. Here we're simply enforcing a limit
of 16 within the emulation, without checking sve_max_vq at all. So I like
the suggestion for a build bug like the one this patch adds, because
otherwise we have 16 in two separate places; the ARM_MAX_VQ definition
and the '& 0xf'.

> 
> I haven't tried to understand all the code in the series beyond the
> user/kernel interactions, so maybe I was just paranoid.

Paranoia is good for the soul. Or something like that...

Thanks,
drew
