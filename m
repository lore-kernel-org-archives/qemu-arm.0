Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp91266wru;
        Wed, 26 Jun 2019 06:58:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVLF0kOVVD2+COKDsCCkkiqBZ7amQFxdjbaj+JR9u2BZvBcjdN3yODW5XvmTR7twM//sCT
X-Received: by 2002:ac8:2a69:: with SMTP id l38mr3595192qtl.212.1561557497142;
        Wed, 26 Jun 2019 06:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561557497; cv=none;
        d=google.com; s=arc-20160816;
        b=Jx4c/kR9Po0eGEj0ycjOnD/YRLUol0FZ88CQjaAdorZWdaOPMzyWv0o+Gp8BltxaLv
         LAoBWkT3zlrvjoRRdOai4wOLraMMBkjQ4Oa5/XfGWtReDPYjMC9YUPXacCVE53RlcaxM
         EdyY/Lb2qsotkps28lSRsFXNVsULFoIrNzkP6zXfcxVj9hlZlykO39LtzLDBb1j+S+WM
         6XugmtjUsb1krHKTs7baQ60IeUDRnxrcPaVJS4hpKeR/3ud/V/QLzcB6m9whmIg/kQ6x
         HQD+lJwTmC9YfnS7Su3eCVGRlXcgX7IOFDjAJ0wPQESrvYGvqDc1wcQMQegZjXtLv0Bz
         TW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=CuqS+Jb3bfszYWDMeotnYwobPRytnZHZBGOKkQyE0ck=;
        b=x185CoI8jklFh3TSl3YacrkTgSYxkB7oQfjK4cd1+bwNubUPECYxpl91vipQ3dEPe8
         eN8d4/sz56QBEfWlGgkYUs9tm/5atGWe5fQm+2J+cJiCaNDAJ1r9lGtv79+Uo+kDk17F
         8gmsc4VaS0OA/11D4LK0FHEcOKi+I8MZ3ZmyYPwj7tUDf/CjAGYJ+KYTV4D85XG8RGwJ
         5yM5Uk1FazUgZQpd06UrHiPSYPKQZHgNrz9g+WDT8RyLyQGhbLlK7QW/yXKYyOo9sLTY
         r43foVzBM9Xd51fqmwU/htI9GG2Ct5K07to73vgSsQwOKccUbJmaXHcheiNSvXgYpLCM
         BPsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t3si12207683qvt.202.2019.06.26.06.58.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 06:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E34E02F8BF0;
	Wed, 26 Jun 2019 13:58:10 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 085A51001B04;
	Wed, 26 Jun 2019 13:58:08 +0000 (UTC)
Date: Wed, 26 Jun 2019 15:58:06 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
Message-ID: <20190626135806.l6mna6swbdncbb2a@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <3c24d706-4ee5-336d-8f74-adae672c450d@redhat.com>
 <20190626132846.lj62nu4orn3nhnug@kamzik.brq.redhat.com>
 <4c96ac11-1195-81d5-79d9-ee3d5e92210e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c96ac11-1195-81d5-79d9-ee3d5e92210e@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 26 Jun 2019 13:58:11 +0000 (UTC)
X-TUID: 89XTHsBlU6OB

On Wed, Jun 26, 2019 at 03:40:11PM +0200, Auger Eric wrote:
> Hi,
> 
> On 6/26/19 3:28 PM, Andrew Jones wrote:
> > On Wed, Jun 26, 2019 at 12:01:10PM +0200, Auger Eric wrote:
> >> Hi Drew,
> >>
> >> On 6/21/19 6:34 PM, Andrew Jones wrote:
> >>> Suggested-by: Dave Martin <Dave.Martin@arm.com>
> >>> Signed-off-by: Andrew Jones <drjones@redhat.com>
> >>> ---
> >>>  target/arm/helper.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >>> index df4276f5f6ca..edba94004e0b 100644
> >>> --- a/target/arm/helper.c
> >>> +++ b/target/arm/helper.c
> >>> @@ -5319,6 +5319,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >>>      int new_len;
> >>>  
> >>>      /* Bits other than [3:0] are RAZ/WI.  */
> >>> +    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> >> Can you document in the commit message why this check is critical?
> > 
> > Sure. I can copy+paste the email subject into the commit message :-)
> Well that's not what I asked for. Are you enforcing an architectural
> maximum of 2048 bits or is the limitation due to some data structs in
> the existing code, ... For a non expert reviewer as I am it is not
> totally obvious.

How's this for the commit message

    The current implementation of ZCR_ELx matches the architecture, only
    implementing the lower four bits, with the rest RAZ/WI. This puts
    a strict limit on ARM_MAX_VQ of 16. Make sure we don't let ARM_MAX_VQ
    grow without a corresponding update here.

Thanks,
drew

> 
> Thanks
> 
> Eric
> > 
> > drew
> > 
> >>
> >> Thanks
> >>
> >> Eric
> >>>      raw_write(env, ri, value & 0xf);
> >>>  
> >>>      /*
> >>>
> >>
