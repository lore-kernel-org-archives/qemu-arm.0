Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1135682wru;
        Thu, 27 Jun 2019 03:46:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/JwHeFagsArK6AVVORvkcbomyUBa8E9YBhS2orUnIaWEBPD+FA2XsbN+3ee01HPW4/+BY
X-Received: by 2002:a37:660b:: with SMTP id a11mr2580602qkc.342.1561632407818;
        Thu, 27 Jun 2019 03:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561632407; cv=none;
        d=google.com; s=arc-20160816;
        b=BjnCgecT6+HtzCgRNHyoEkDdsDrihFdW1LUHcVpszX+5aeRBMtGRSfrBqbvfVbDopj
         xorLY3kPANaPEUhKEr9q5EUHa8/9mMIbfMfvJn+urhvdqEk6mHuymFNEhIXSlxj1Q7k5
         FOYtDz0v1pOWAryniCJqL09tukXDK9Y2h+nOg1ss5TrZOUObIxa92xikEzafNNgobFmy
         uMfA8JsueVs7C41UvvyI0EaXZbmfg+GfDSCE4lAIXPzSMdl9jXSZHY+FdSTL0nG1+XxU
         2PWn5egvUnYchGjH+hvgEctq7NzZPD7clpibsoBuHKDev5o/PXug4hIkIjLl/blomspv
         6FgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=EYd+qNqb/a5wR0axPQtU+f4lpF7edmJSxA3t6Y9Pos8=;
        b=aA0eFB1EVfDbZF9JEEjcOjcpirwR/7ploz8zxzZm8LxoMwKjs60Ixp07JcWS1mDkHg
         TSZHQ32ZpY8dkHXEHZ6rsAsgtQ2D9hm18WNqjH5d4itYXGJK7/akHDp2amCkpOsG1Igw
         eVIrD9k2yghU+QDnMPFO+TKkTHKaKPO8gvV3bWPguQM7IDRK8tEmJaUo7gf4XZvJaPQz
         w+D4xm1vFZzS8ooAMuB8YwBZ/NVROMpLF+e8uv5KLcJBR+A7/entEs36kJPgNzmdtLHE
         FHSvSa+IEjZGfvtzDCb8Afa/0jk1tbrkYcBN2LRMEATBl/zosWgID2tMj1KG+N77F7EF
         zovQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 5si1400347qtz.196.2019.06.27.03.46.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 03:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5695EC1EB214;
	Thu, 27 Jun 2019 10:46:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10DA45D9E2;
	Thu, 27 Jun 2019 10:46:40 +0000 (UTC)
Date: Thu, 27 Jun 2019 12:46:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
Message-ID: <20190627104638.x4gxsmv7vpww3mra@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <ee8ce4a6-09fd-47ab-ef7e-a231df1e9c1b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee8ce4a6-09fd-47ab-ef7e-a231df1e9c1b@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 27 Jun 2019 10:46:47 +0000 (UTC)
X-TUID: CS8jq9D1M1ge

On Wed, Jun 26, 2019 at 06:56:54PM +0200, Auger Eric wrote:
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index f500ccb6d31b..b7b719dba57f 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -5324,7 +5324,16 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >  
> >      /* Bits other than [3:0] are RAZ/WI.  */
> >      QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> > -    raw_write(env, ri, value & 0xf);
> > +    value &= 0xf;
> > +
> > +    if (value) {
> > +        /* get next vq that is smaller than or equal to value's vq */
> > +        uint32_t vq = value + 1;
> > +        vq = arm_cpu_vq_map_next_smaller(cpu, vq + 1);
> > +        value = vq - 1;
> spec says:
> 
> "if an unsupported vector length is requested in ZCR_ELx, the
> implementation is required to select the largest
> supported vector length that is less than the requested length. This
> does not alter the value of ZCR_ELx.LEN.
> "
> 
> So I understand the value written in the reg should not be unmodified.
>

Sorry, I can't parse what you're trying to tell me here. Here we have
to write 'value', because that's what the guest is trying to do. As the
spec says in your quote, we have to pick the length the guest wants, or
the next smaller valid one, so that's what the code above does. So are
you just stating that you agree with this hunk of the code?

Thanks,
drew
