Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp63066wru;
        Wed, 26 Jun 2019 06:29:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIKJZT0Bem40wVbtP383d1RWisoTa8v/iPLLyZJ4liHYNxY0L1zdsoOCrc8pDulsrj2w/U
X-Received: by 2002:ae9:ed4b:: with SMTP id c72mr3894530qkg.400.1561555752227;
        Wed, 26 Jun 2019 06:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561555752; cv=none;
        d=google.com; s=arc-20160816;
        b=xEHcPF67BKHewWIOG+MqzNoNZ82vw4jFLzrc3tSXoLz+SXfTcCsl7QJ/SI8AgnAINW
         zvxsjM6BckWetqq3AbNeaKuFo/ImFf77Uadvcl0GjByuLrYgALYCaOIBkkkAmu4d2Unv
         UlTvViSJuR4hF8oIOQAylXSdU2RJow6SB6+S1r80sTUGyxnuRnZ4eGPcqizP8WtkFpD6
         nrJMlOovGaNIH7eqB23QRRwvSB8wGvKJ8zCBrUxjAlvgqbH8UWYvhBlC69ErPmjen80V
         8AtA2S6CUIM1SEEiQHzapryNSqD/zMHJ8JaJ/qRoQ6wSH7PWZEIyhQTXVRuvJrbnbk3n
         3CZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=LHrmEEEf40hTeXkYclh/JNroDnAZuw0nRfFPBwCT/9A=;
        b=Rz2g1nySkhmPoByp/3Mg/oBRc5hxwApUHSKxzvtdUFVokkoxnFFgdjFN3XXODNiU8H
         2t9X65UgVrYmDdhSL/7ZaQ+bvHbLtWobyQtDAZ9900aqa+Vy+OV+o4FJt8br3dN/jA4G
         zYvLDBXA8r1SVR1GbFPqMPUSftWB4Z8wPUPB0rCeY5rbnTMmsuoha2KOt2cGmvbuJaiz
         8m6S5rs/kC3M8deNNdGox1VUtwm6+8Y662SE1u7wmITn5YuLfnU9U4rgmWzYGW51DUFC
         y5CXkJ0dky/P/yrGgPFwJHxp6m1vYW1XcrtUbVyW65ps845HNVpz94/l1HtwctBVMoUe
         fbtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p28si10229799qve.83.2019.06.26.06.29.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 06:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30DD9307D871;
	Wed, 26 Jun 2019 13:29:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6890260C64;
	Wed, 26 Jun 2019 13:28:48 +0000 (UTC)
Date: Wed, 26 Jun 2019 15:28:46 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
Message-ID: <20190626132846.lj62nu4orn3nhnug@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <3c24d706-4ee5-336d-8f74-adae672c450d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c24d706-4ee5-336d-8f74-adae672c450d@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 26 Jun 2019 13:29:01 +0000 (UTC)
X-TUID: LokxJv03w/NM

On Wed, Jun 26, 2019 at 12:01:10PM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > Suggested-by: Dave Martin <Dave.Martin@arm.com>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/helper.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index df4276f5f6ca..edba94004e0b 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -5319,6 +5319,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >      int new_len;
> >  
> >      /* Bits other than [3:0] are RAZ/WI.  */
> > +    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> Can you document in the commit message why this check is critical?

Sure. I can copy+paste the email subject into the commit message :-)

drew

> 
> Thanks
> 
> Eric
> >      raw_write(env, ri, value & 0xf);
> >  
> >      /*
> > 
> 
