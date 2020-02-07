Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp510893lfp;
        Fri, 7 Feb 2020 04:19:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8awed5DyXXzWNB4ix8WKbJN53muv12TPdOYo7uuIhYsz9peIAXZsXe/3KAjPw+54TN2Bc
X-Received: by 2002:a05:620a:12c8:: with SMTP id e8mr6826293qkl.380.1581077993081;
        Fri, 07 Feb 2020 04:19:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581077993; cv=none;
        d=google.com; s=arc-20160816;
        b=tvNrQVVi1XzfvuofD8zCrkDiEzikU5A8iPJ3VqVTT+nDi4N8zB4KbXMRzY+J5osjsb
         qs/0OUQzE+2gedlQ0v/zGkKYpxeUkdVWxzTVHNNp4qK6i7WPeniGrvuxc9sH6iEgsq4n
         ZCseWe7NCTR8dK/2sSCGcElXnr00VqhnAcEClJXA6BVx/OkrMvueF6k4Bud26UBbJTSj
         yXM19fXL9skjlKbnzZzZTqEDTtS3M+RRfwrb6rulIxiprttkiggTsEiKn6FJIErScVwA
         qL0aObmJHpkN7HG17cfMh6f/zcuVsgggzL+hGkGErViS/IVeWfn6BAXN2bn/xIYjvgGy
         yQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=PKIloqskMmYwtoD2bRti1PpJFKXNYrHah/rjrV6uw7Q=;
        b=rv2R0YtAWBB8u4IzKb/7U6RKiY8Savp+4slua9DYk6BnT2Dh+mDkKCxaeFxZ2A207Z
         k8hXQfCSRAIBTJS3yY2S0eI9m5pDeJUgTblwKWE4LHfz8xl3X7scBp1sT3uduW1BoDHV
         U96bNwTD6zdNcneNC+mkbEH9sb+gfbkNxN9Hl1mywLytBGM2d9QwqSKqCfKI/uQ9+Tne
         d4uUQg5GQgHAVjF4ot/VrxxSGsJUVXoz0hYcK9li2bvoJp+JxRr9g/GZrH2jlWfTtTf8
         nhX+TdBuqDhxpMjd3bouSZ6kOS3J0Bjl82N1p5U5Ayn8+w9JdPe612KrG1SBK/jO83et
         Or8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=gLOxkvcz;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id dk19si1128962qvb.106.2020.02.07.04.19.52;
        Fri, 07 Feb 2020 04:19:53 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=gLOxkvcz;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 9D3AD4A52E;
	Fri,  7 Feb 2020 07:19:52 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0-EHisPjl-6; Fri,  7 Feb 2020 07:19:51 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 9745E4A542;
	Fri,  7 Feb 2020 07:19:51 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id CC1904A52E
 for <kvmarm@lists.cs.columbia.edu>; Fri,  7 Feb 2020 07:19:50 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnHF9vYgphze for <kvmarm@lists.cs.columbia.edu>;
 Fri,  7 Feb 2020 07:19:49 -0500 (EST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id E61264A389
 for <kvmarm@lists.cs.columbia.edu>; Fri,  7 Feb 2020 07:19:49 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581077989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OTNUC9fsNE6VxpNL7r78PwDWNHM+b+0JIyuBMuACd1o=;
 b=gLOxkvczDybq1uuFHPdO5OcaUKanASytkmxcXo1mPffrkcOteWXFXedsO01Wu6uRBuNDdL
 2bcszHWtNDU8CYzdBWlrLscLDnvyvMdodvpyqrQHYIAJs9RHZ8SAbz9ETmNJRSBSSAdSV6
 BIc8+9CVXUIsNY5jSucYFCGYh1prvjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-L5xCDUqvPKSy6tgTy0YJPw-1; Fri, 07 Feb 2020 07:19:47 -0500
X-MC-Unique: L5xCDUqvPKSy6tgTy0YJPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A17ED108838A;
 Fri,  7 Feb 2020 12:19:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18FEB60BEC;
 Fri,  7 Feb 2020 12:19:40 +0000 (UTC)
Date: Fri, 7 Feb 2020 13:19:37 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v3 07/14] arm/arm64: gicv3: Enable/Disable
 LPIs at re-distributor level
Message-ID: <20200207121937.qstc3m55icpcn5rr@kamzik.brq.redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-8-eric.auger@redhat.com>
 <20200207121437.qtvonx2x2xh3dvgc@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207121437.qtvonx2x2xh3dvgc@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: thuth@redhat.com, kvm@vger.kernel.org, maz@kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: KzPpI9qp8ELs

On Fri, Feb 07, 2020 at 01:14:37PM +0100, Andrew Jones wrote:
> On Tue, Jan 28, 2020 at 11:34:52AM +0100, Eric Auger wrote:
> > This helper function controls the signaling of LPIs at
> > redistributor level.
> > 
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > 
> > ---
> > 
> > v2 -> v3:
> > - move the helper in lib/arm/gic-v3.c
> > - rename the function with gicv3_lpi_ prefix
> > - s/report_abort/assert
> > ---
> >  lib/arm/asm/gic-v3.h |  1 +
> >  lib/arm/gic-v3.c     | 17 +++++++++++++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
> > index ec2a6f0..734c0c0 100644
> > --- a/lib/arm/asm/gic-v3.h
> > +++ b/lib/arm/asm/gic-v3.h
> > @@ -96,6 +96,7 @@ extern void gicv3_lpi_set_config(int n, u8 val);
> >  extern u8 gicv3_lpi_get_config(int n);
> >  extern void gicv3_lpi_set_pending_table_bit(int rdist, int n, bool set);
> >  extern void gicv3_lpi_alloc_tables(void);
> > +extern void gicv3_lpi_rdist_ctrl(u32 redist, bool set);
> >  
> >  static inline void gicv3_do_wait_for_rwp(void *base)
> >  {
> > diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
> > index c33f883..7865d01 100644
> > --- a/lib/arm/gic-v3.c
> > +++ b/lib/arm/gic-v3.c
> > @@ -210,4 +210,21 @@ void gicv3_lpi_set_pending_table_bit(int rdist, int n, bool set)
> >  		byte &= ~mask;
> >  	*ptr = byte;
> >  }
> > +
> > +void gicv3_lpi_rdist_ctrl(u32 redist, bool set)
> 
> _set_clr_ ?

No, probably not _set_clr_ here. The function could be
static though, with other functions to enable/disable

void gicv3_lpi_rdist_enable(redist) { gicv3_lpi_rdist_ctrl(redist, true); }
void gicv3_lpi_rdist_disable(redist) { gicv3_lpi_rdist_ctrl(redist, false); }

But whatever.

> 
> > +{
> > +	void *ptr;
> > +	u64 val;
> > +
> > +	assert(redist < nr_cpus);
> > +
> > +	ptr = gicv3_data.redist_base[redist];
> > +	val = readl(ptr + GICR_CTLR);
> > +	if (set)
> > +		val |= GICR_CTLR_ENABLE_LPIS;
> > +	else
> > +		val &= ~GICR_CTLR_ENABLE_LPIS;
> > +	writel(val,  ptr + GICR_CTLR);
> > +}
> >  #endif /* __aarch64__ */
> > +
> 
> stray blank line here
> 
> > -- 
> > 2.20.1
> >
> 
> I'm not sure why this needs its own patch. I could just be part of the
> next patch.
> 
> Thanks,
> drew
> 

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
