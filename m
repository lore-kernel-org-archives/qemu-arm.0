Received: by 10.25.27.66 with SMTP id b63csp1453638lfb;
        Mon, 6 Jun 2016 05:12:45 -0700 (PDT)
X-Received: by 10.55.144.68 with SMTP id s65mr15207075qkd.209.1465215165609;
        Mon, 06 Jun 2016 05:12:45 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 78si10796253qgf.38.2016.06.06.05.12.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jun 2016 05:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C84C63153;
	Mon,  6 Jun 2016 12:12:44 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u56CCdEn004354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Jun 2016 08:12:41 -0400
Date: Mon, 6 Jun 2016 14:12:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, christoffer.dall@linaro.org,
        marc.zyngier@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 01/10] lib: xstr: allow multiple args
Message-ID: <20160606121239.paubfta2c74epgfk@hawk.localdomain>
References: <1465064165-14885-2-git-send-email-drjones@redhat.com>
 <87d1nuiod6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87d1nuiod6.fsf@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 06 Jun 2016 12:12:44 +0000 (UTC)
X-TUID: BT+QNHOE6vg6

On Mon, Jun 06, 2016 at 11:49:09AM +0100, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  lib/libcflat.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/libcflat.h b/lib/libcflat.h
> > index 582e3fc60e287..e5e588c742763 100644
> > --- a/lib/libcflat.h
> > +++ b/lib/libcflat.h
> > @@ -27,8 +27,8 @@
> >
> >  #define __unused __attribute__((__unused__))
> >
> > -#define xstr(s) xxstr(s)
> > -#define xxstr(s) #s
> > +#define xstr(s...) xxstr(s)
> > +#define xxstr(s...) #s
> 
> OK my knowledge of stringinfication is still rusty despite having read
> the QEMU softmmu code. However:
> 
>                 printf("Unknown subtest:" xstr(foo,ba) "\n");
> 
> Yields:
> 
>                 Unknown subtestfoo,ba
> 
> Is that what you wanted? Or were you aiming for xstr(foo,ba) => fooba

The way I did it (which is like Linux) is what I wanted, see Linux's
version in include/linux/stringify.h. I can correct $SUBJECT to make
that more clear if you like.

Thanks,
drew



> 
> As an aside I couldn't actually see xstr being called with multiple
> arguments in the source tree.
> 
> >
> >  #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
> >  #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
> 
> 
> --
> Alex Bennée
> --
> To unsubscribe from this list: send the line "unsubscribe kvm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
