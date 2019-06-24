Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3667983wrg;
        Mon, 24 Jun 2019 04:30:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzFIjVUW9x+KB9gKkoQH+li43SNUUBvF1gZCd8lGQ1RkF3W3chxg7ud9atHZx1R+Lb/E4i9
X-Received: by 2002:a37:7a84:: with SMTP id v126mr16018559qkc.439.1561375858955;
        Mon, 24 Jun 2019 04:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561375858; cv=none;
        d=google.com; s=arc-20160816;
        b=yIybA4ASHUuYjDyWj+xqN95pNvqeXuUF0FnT6w21SmypERIk6Ijn1041oeWAs7Ugp0
         9vzT5FowWgmfrzmhjSY0o6u1I1/rb/z5PwSJMs5nvAvvSpNVpQca1QWMEoMOgNMvRw1Y
         QrR3IKRjYM89VLlG+PVEvL43jqfvZr5LclutgEl/PdkchRnqvYXIQWv78B/Z+j9LIDcl
         ljt7r/aNXHVs3JyFjbpUZFvJPP9Ia694mldbSjjRh+/uUASczaS2iW3lXF2J4XyGHxpJ
         OM+Bv1jTzXF5UdzaROxrr/KX8/UDLPgT8j3RezLvPv7udTiFV3mf4QWVLe4GtHm1449B
         PdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=ylRTU/1uXgW/3JerEkeXYhCMSDizbewp7SJdM56Et14=;
        b=DcGXl2y/0SBHeT2kPVcj1KKZU1tsfkb3iSrM7F6Z3ycZ4p+8lxKRZgA+6BgPgZIFwz
         pe70ynMIVqj5nBQ/tmEALGEqrhUlomKMpMHx8eUhL/BEKJrWD6GT/sRFTkn41Fn34c4p
         6yVeGpvQVqEKGG3zRO/AdOS9eJV7IK5geDhrB41LMYwLiTmjzF4ysGwNm4ABt7LfUNI+
         cI+OCtQBi/ZsOqXtSqYm4P1GljizH7kyW9+JNQNg39VTABRrgeQXzkJnq6QrIOc0kYQ9
         uaeMLkllTUNfVDG4iYulDTAsi7Wizhs1S1KWNhXEtDzIrvS6IET/p5eqIng9oN7kODkr
         3KXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p48si4071691qtj.235.2019.06.24.04.30.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 04:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C9B87E437;
	Mon, 24 Jun 2019 11:30:48 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D874D60BF7;
	Mon, 24 Jun 2019 11:30:39 +0000 (UTC)
Date: Mon, 24 Jun 2019 13:30:37 +0200
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
Message-ID: <20190624113037.m5onedluc4x7c5ej@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <20190624110507.GG2790@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624110507.GG2790@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 24 Jun 2019 11:30:48 +0000 (UTC)
X-TUID: jr+k0aWnh1Wb

On Mon, Jun 24, 2019 at 12:05:07PM +0100, Dave Martin wrote:
> On Fri, Jun 21, 2019 at 05:34:13PM +0100, Andrew Jones wrote:
> 
> The purpose of this check should probably at least be described in a
> comment -- i.e., what actually depends on this?

I was thinking the already present "Bits other than [3:0] are RAZ/WI."
explained that, but how about this for an improvement?

/*
 * Only the lowest 4 bits of ZCR_ELx may be used to constrain the vector
 * length, the rest of the bits are RAZ/WI. Since the vector length of
 * 128-bits (1 in quadwords) is represented as zero in ZCR_ELx, and all
 * vector lengths are represented as their length in quadwords minus 1,
 * then four bits allow up to quadword 16 to be selected.
 */

Thanks,
drew

> 
> Cheers
> ---Dave
> 
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
> >      raw_write(env, ri, value & 0xf);
> >  
> >      /*
> > -- 
> > 2.20.1
> > 
> 
