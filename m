Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2698106lfk;
        Fri, 19 Nov 2021 10:31:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIYL+YuSiMU+uehx8QwAoMvcNAbY6AiUczIJybrZHuhnCbUggqnHY8iCjmqJRKwg9VGTsl
X-Received: by 2002:a05:6402:12d3:: with SMTP id k19mr27691778edx.244.1637346667432;
        Fri, 19 Nov 2021 10:31:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637346667; cv=none;
        d=google.com; s=arc-20160816;
        b=C1xKNPxulD3WU69d56mPqEcNVX9uB6HmA0yaH8GRc7eTrS0VPvPQIWeIRFXn73Nt+t
         2jr6Rpot723TZQLdhwo5yOX8d5yPRsOZf0JTodhbwe5aMzSgnsbFkFI9YviV9yemb8TO
         qzdCBRE8xF/Q+5v7Ps+euOxXMw5XUx9Z/MPVnJyupqLgrwT8BFoaGZTKyKJ1nNLEM+6s
         roAcafsdx0us14GpX/rwwnjfwLJvRfoeOwMkiJvXDyh0VS5tAUBV2M+TZJJpQ/2rY5eD
         HAoVWubwcPFpBwr/+z5Tf7CThljSK3nJCtDe5G/BgFThzfqHCQjQghDz4teoMBdytmNG
         R8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=U64RY7OU2Xju+JsoSQCaxT3xKU3oSuMc1u+Un65V0zY=;
        b=YrIMLuq6GWWkLpEy8oh6AwF61aQULfyPlNTE2nKtWIoEpVNabf/aGYjVUCWWZc7VT/
         q+c2ep6S4/P5e7/2Va/0LglnvDy+Po4GK41v7z6NQoGmubd73iGggKtAACwMkrPVPyW3
         x7YlU3Ion01hnh0zns3A0IeWYv7J4Y4jojwL7HtdZ2TX8jBIa5wu7KejXThri3h/XHsT
         FxWLwqBLQ8MHiVdjt47oedL44F+FLtfZ++7cegPz6aajwYTBMoQNF84QouxesXMebMpB
         xa5wfzha81BgxmNDj+vjSx/qDF82dHlGM1PjRr6tO1hK0NEoKwm5kq6XOpP7UCvQNpR4
         xAog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gj9AqvHp;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hq36si1485024ejc.29.2021.11.19.10.31.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Nov 2021 10:31:07 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gj9AqvHp;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637346666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U64RY7OU2Xju+JsoSQCaxT3xKU3oSuMc1u+Un65V0zY=;
	b=Gj9AqvHpMK3mXzJneQT1HhnwyyTeUfXB07XWIsyskJUq8ct+OhKIsPHwp7rXOFAcDbvAKL
	xyXZE0blzpOrw4UUAGa2ubEIrGgOMAxtNoeWW6xJ2D4VayVRpSGe2QXwo7AxZMCC/ga1nP
	ksfrcJPavacelSEwLr2dsMWzMNTQlY4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-z35ufHXBPsueJkgbHH0pzg-1; Fri, 19 Nov 2021 13:31:02 -0500
X-MC-Unique: z35ufHXBPsueJkgbHH0pzg-1
Received: by mail-ed1-f71.google.com with SMTP id p4-20020aa7d304000000b003e7ef120a37so9145049edq.16
        for <alex.bennee@linaro.org>; Fri, 19 Nov 2021 10:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=U64RY7OU2Xju+JsoSQCaxT3xKU3oSuMc1u+Un65V0zY=;
        b=jF+PXM+3Lf0AWPDojmthkqMfuzcO0SihtXlWpkC253KwNzYvOSnzmvUFubAv+P7fo4
         JzxOcCb2qbd3EwGNEmPwuwl6Ex3lnCDeci4+IxuqfdPbn9IcGb2NmkUpbc/nNqi0QdcR
         mwnQ/+9KMxBPteCe/X/341R5q6mfQ/SGwAJzbGoeQXIF8xyKPCLOm/9i/l+kDZODRNVZ
         hDhsw7dFxYkCmACwiZ64T9pLWRsN81h7LqedYCwJcXtaxSGKhjKoMk4ZS1PcA9SdpMvQ
         cuQEvOELJtHuzAy0WtF+jHkel5AwF9U9eztSP0PY72o03roNnoMgfoks1RBh7VwhAW+L
         flHw==
X-Gm-Message-State: AOAM53149bwAESLiff3qVf2xo4QspBNO7wqSHVVX7EI332QKX4HbQHjt
	BMRrcpjvDDYqP4v6p/BJnHdb5oW3Svtb7nbzqGIvcFfDQ+u+1X+SWKpl21x43wGLtLuyekU2wSz
	r+82fqizoSdu7G1ZEwcA1LrzL9Fp7pOIVhAa898xtx/9JL2yBKqT2RJYZKgw2/fd6HYM=
X-Received: by 2002:a17:907:980e:: with SMTP id ji14mr10567052ejc.346.1637346661533;
        Fri, 19 Nov 2021 10:31:01 -0800 (PST)
X-Received: by 2002:a17:907:980e:: with SMTP id ji14mr10567009ejc.346.1637346661324;
        Fri, 19 Nov 2021 10:31:01 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id qf9sm301194ejc.18.2021.11.19.10.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 10:31:00 -0800 (PST)
Date: Fri, 19 Nov 2021 19:30:59 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
	qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Message-ID: <20211119183059.jwrhb77jfjbv5rbz@gator.home>
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
 <20211112132312.qrgmby55mlenj72p@gator.home>
 <87wnldfoul.fsf@linaro.org>
 <20211112145442.5ktlpwyolwdsxlnx@gator.home>
 <877dd4umy6.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <877dd4umy6.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: J999GewMNL6S

On Fri, Nov 19, 2021 at 04:30:47PM +0000, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > On Fri, Nov 12, 2021 at 02:08:01PM +0000, Alex Bennée wrote:
> >> 
> >> Andrew Jones <drjones@redhat.com> writes:
> >> 
> >> > On Fri, Nov 12, 2021 at 11:47:31AM +0000, Alex Bennée wrote:
> >> >> Hi,
> >> >> 
> >> >> Sorry this has been sitting in my tree so long. The changes are fairly
> >> >> minor from v2. I no longer split the tests up into TCG and KVM
> >> >> versions and instead just ensure that ERRATA_FORCE is always set when
> >> >> run under TCG.
> >> >> 
> >> >> Alex Bennée (3):
> >> >>   arm64: remove invalid check from its-trigger test
> >> >>   arm64: enable its-migration tests for TCG
> >> >>   arch-run: do not process ERRATA when running under TCG
> >> >> 
> >> >>  scripts/arch-run.bash |  4 +++-
> >> >>  arm/gic.c             | 16 ++++++----------
> >> >>  arm/unittests.cfg     |  3 ---
> >> >>  3 files changed, 9 insertions(+), 14 deletions(-)
> >> >> 
> >> >> -- 
> >> >> 2.30.2
> >> >> 
> >> >> _______________________________________________
> >> >> kvmarm mailing list
> >> >> kvmarm@lists.cs.columbia.edu
> >> >> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
> >> >
> >> > Hi Alex,
> >> >
> >> > Thanks for this. I've applied to arm/queue, but I see that
> >> >
> >> > FAIL: gicv3: its-trigger: inv/invall: dev2/eventid=20 pending LPI is received
> >> >
> >> > consistently fails for me. Is that expected? Does it work for you?
> >> 
> >> doh - looks like I cocked up the merge conflict...
> >> 
> >> Did it fail for TCG or for KVM (or both)?
> >
> > Just TCG, which was why I was wondering if it was expected. I've never run
> > these tests with TCG before.
> 
> Hmm I think expecting the IRQ at all is broken so I think I should
> delete the whole pending test.

Feel free to repost. I'll update the patches in arm/queue before my next
MR.

Thanks,
drew
