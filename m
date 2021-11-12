Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1800442lfk;
        Fri, 12 Nov 2021 06:54:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMBvCXsDh2XU5ycAOJ4Wj8/Uhup7hClFVFULCpRmK0PH+U1364FvINc2ImGYLpdT+ICX+S
X-Received: by 2002:a37:b6c1:: with SMTP id g184mr13274520qkf.270.1636728889068;
        Fri, 12 Nov 2021 06:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636728889; cv=none;
        d=google.com; s=arc-20160816;
        b=wKCpUQuK5HPeLrUOLa1toaBv3ffpRHJ7Hze/6EUDAG2Pd1vuY0vxlKnuDgHnPe0/Tv
         NUmvsqArJdMU1cpvRZm5y9h4uO0owcVht/ND2XU5pSMm3SNfxRUvdx0MQjeKLAS5YDfG
         xqtHxjGRO6kv8MJhhuT8NJdqtAvK1Hje8Maj/YQxGn509TtNbeZC+QGpeUwssG5LrZTH
         8DnuI3RgqUU3aJ4lrQe47NHmLkxrHK5uKxO30z0Pq/Hmirm9tDooH+7eJ6Ily5IhBDOi
         xxdvv16TJXpRyNCSMAUQhtdJOnT86qXYy3Oohu1led2Bz95Mbp5/TwbzCc43M5kDJYDz
         WCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=CqpS1HH0zhDySu1JBKv5pA0ucN4UqNVJlGatSL7MT0A=;
        b=zwtw78fl+88gGHS/e2qHV4OTfwlqy8f6rkx+iO3ErKoEG3mhKRDSE1wmpnU1kIHHAk
         MjSgNd3dXhK3jOo6Rj7kxG7bvIYhZ/soE8HjlZXUDhhqWiXcvvhw873EoiopvflL+Rsv
         SEHySENAS7ntkYblGWE1k5PAJsEZtPwu8MVeKApprLhUMUrePqQirH67aSOxakzAZdTZ
         +aFa6/XQz2QfnzL92UW+L6ZR3Ox8EA/z2vgllq4OWIVyn/MW2yAjhX3V6pDxB31DV8a/
         nWl4frmGJIOuPR2psjnoQw08zNs8BrCirgcPTRd31pHfpXUiSjf0LCVmZKXhCObvY2wA
         NJqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FpBWA2S9;
       spf=pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id s22si2359279vsk.454.2021.11.12.06.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FpBWA2S9;
       spf=pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636728888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CqpS1HH0zhDySu1JBKv5pA0ucN4UqNVJlGatSL7MT0A=;
	b=FpBWA2S9wgAnV57bthshN9gjFxgCvLGa7HK9LkCOvBENpbZFNrq2m2RFDEx/t6S59QGgQT
	RZ24pkoZ9VfecoDUnTy4ZA8ZMZXZHKObEe6xMspZBLPKkY9T3GvnhYvbDgcWFpoVcjfk9K
	KuC/xhpL5kkAzq7O7hCjFjucnkTQe2k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-7-751uFtN5-u05GOYQ8SOw-1; Fri, 12 Nov 2021 09:54:46 -0500
X-MC-Unique: 7-751uFtN5-u05GOYQ8SOw-1
Received: by mail-ed1-f70.google.com with SMTP id h18-20020a056402281200b003e2e9ea00edso8418676ede.16
        for <alex.bennee@linaro.org>; Fri, 12 Nov 2021 06:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CqpS1HH0zhDySu1JBKv5pA0ucN4UqNVJlGatSL7MT0A=;
        b=B7aGLS+GZbiw9fbSTyAMIl323yVY3BzCcKeNyE3glx7j4osUHLghpnf40eKCE10Zbl
         ShSl3U9ZJjCO+jQeqYPxZ1zkUJlm50Jvo/XWWAvvR6F88aHLVUl+ZIoqUX0ptFXlLyCk
         HGMF5TC8cCFdoiFLgVaRspsrf9oQzt9R5C4Y4ScRJNjol3pMn58AwrwScip8L7KUbB2j
         z39p3fimt6lVC5LhNkw0ReegAoKC/Un11y5AjJgtghxlYgoqt6kG60gjFsIX1di+BQZY
         B9yS+uDZSV454B/0zDYKrYzXEKl0bKDHqPT9/PaGAC40UH6DLzsT1L6d5YX8cNZY8DNT
         Z0Cw==
X-Gm-Message-State: AOAM533K08VlA8DEBB2vbHOETZIzMQFUngJzceWha+FoEtXaUIzsbqtK
	dvpmiRtdump1xMU3irj6G0Ri+3DYEVI/1IPXoafr5znIxk58Mo0ow5IjeS1TGN4Z9NB5ztLhgWl
	ymyiF2LFpdIY6xIR2fn87BRacL7uf72lqy4dy6ulgbx9Iq6KOVGBL9tWJrW2TiXFkhLU=
X-Received: by 2002:a50:e089:: with SMTP id f9mr22475527edl.290.1636728885171;
        Fri, 12 Nov 2021 06:54:45 -0800 (PST)
X-Received: by 2002:a50:e089:: with SMTP id f9mr22475491edl.290.1636728884981;
        Fri, 12 Nov 2021 06:54:44 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id mc3sm2769954ejb.24.2021.11.12.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 06:54:43 -0800 (PST)
Date: Fri, 12 Nov 2021 15:54:42 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
	qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Message-ID: <20211112145442.5ktlpwyolwdsxlnx@gator.home>
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
 <20211112132312.qrgmby55mlenj72p@gator.home>
 <87wnldfoul.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87wnldfoul.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: cflfhV+JH9+C

On Fri, Nov 12, 2021 at 02:08:01PM +0000, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > On Fri, Nov 12, 2021 at 11:47:31AM +0000, Alex Bennée wrote:
> >> Hi,
> >> 
> >> Sorry this has been sitting in my tree so long. The changes are fairly
> >> minor from v2. I no longer split the tests up into TCG and KVM
> >> versions and instead just ensure that ERRATA_FORCE is always set when
> >> run under TCG.
> >> 
> >> Alex Bennée (3):
> >>   arm64: remove invalid check from its-trigger test
> >>   arm64: enable its-migration tests for TCG
> >>   arch-run: do not process ERRATA when running under TCG
> >> 
> >>  scripts/arch-run.bash |  4 +++-
> >>  arm/gic.c             | 16 ++++++----------
> >>  arm/unittests.cfg     |  3 ---
> >>  3 files changed, 9 insertions(+), 14 deletions(-)
> >> 
> >> -- 
> >> 2.30.2
> >> 
> >> _______________________________________________
> >> kvmarm mailing list
> >> kvmarm@lists.cs.columbia.edu
> >> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
> >
> > Hi Alex,
> >
> > Thanks for this. I've applied to arm/queue, but I see that
> >
> > FAIL: gicv3: its-trigger: inv/invall: dev2/eventid=20 pending LPI is received
> >
> > consistently fails for me. Is that expected? Does it work for you?
> 
> doh - looks like I cocked up the merge conflict...
> 
> Did it fail for TCG or for KVM (or both)?

Just TCG, which was why I was wondering if it was expected. I've never run
these tests with TCG before.

Thanks,
drew
