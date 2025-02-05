Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1023845njb;
        Wed, 5 Feb 2025 09:07:24 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXoLmifgitvKeWtxv7trcCYjMHwHUh+13RNVAmglsd2S4W31SK5XVn9y0rhB5z7WeW4oG9sMOGb5IjfIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHW6XWu9HgGupBEO4meilYClkQ7cnPNraFGomCjsuKMQOTKU9A4DnmGKTJgl/XlToKbTWIa
X-Received: by 2002:a05:620a:2b4d:b0:7b6:d631:266f with SMTP id af79cd13be357-7c039fc3f7emr488395085a.14.1738775244295;
        Wed, 05 Feb 2025 09:07:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738775244; cv=pass;
        d=google.com; s=arc-20240605;
        b=J+fRsHXpOUrhBtqZ2Kc9ErPJNysMncSv5yX57MJcFd07QyEJovHuIXKJdTJh4bigPc
         xD8zYs55gdABgtCz2pTO683sjjcu36hGXiJK/2VhrHZILX8q7ikwNbWo2+SpZiX/I8Ou
         pf4ljDVeOINZVDUDWPaF07wksFre81hmvwphNO3Nl7IbiUcS0zA8+ixE5/U3yommqZlk
         yRDZb72qJamrOxpTs+c/XU+nLFZazuzjlBfkI1h1CkJGKx/s1hrMFkzXHy1l90W6WdrC
         4HihSCA+E+kGhUKBuyPmu2zAXH+8HizYG7VfIUtm7KX2t+hjNjoEF6URijQ7A+fslNLV
         QNfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=p+OLTbGqj/iIpCK8/1CkoJoVzjfpKlls86EfJDj73zs=;
        fh=KbiztnrlcvI52nKa/X7WmanTMdeh4gvY2634uwGgDsM=;
        b=EqwDlycDrVnQ0oTRxzEU5T0iYUjysFUotrHsRBLDkdezsqkElxLu/FAUaouvXxEUgB
         PhC8mUJgFyzlygLR63ztlASrzIkJ7cZyNhO1k80dlwGhBM8jmKzpQZa+uKQKEpMi0hv5
         93kBIeOjna0ENxmmSEonbksFZX9VXtD+MORGCR1TA/bknk7cIQGtLBOSMYWeDja6DhOw
         3pE/nXcsJcx8UnDgDLrveuKDVsOzG3YwN0CR8ZRD6q9NNGm21vW8LMszSL4Mt3mfisLj
         VvYon5uSdZuOuJMhmDmQ2aiP/J4nRvleBB34yS7kWxJ0cZKQNka6Mbgklg8EYovXHZz0
         m6VA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M445v1lC;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-37369-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-37369-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4dd01si522698285a.28.2025.02.05.09.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:07:24 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-37369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M445v1lC;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-37369-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4659116503C
	for <alex.bennee@linaro.org>; Wed,  5 Feb 2025 17:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F41E1DC9B1;
	Wed,  5 Feb 2025 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M445v1lC"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232741DCB0E
	for <kvm@vger.kernel.org>; Wed,  5 Feb 2025 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775240; cv=none; b=mIzQQg652OLSd68gNCzMEUt5HNOx8fS+VVAI8Zvpqsh4wnvXYyjau5kYNcoQmtNX4rdkNOyWeVMpi6PcEsIsYpA7spu58jwTyTvy60D1duCtdm4uF/voE0Fn4VGXay+BEiKsW+UYb4c+gIlORzATqOeqBVY/Q0q2VoSQW2QNWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775240; c=relaxed/simple;
	bh=2zNgr1K9UmvH5cM6uuJglJngBS5qC2wi8bIILVEWPsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGrRzJ1xGz4r0mLo0IOcyw9Qoo+9WQ4Sh70gsfFVH2kY+eDdsFTZT3165aB9QpphU+fPdHe1JqE097vMvPliY4CJl1UrzGJ7VvKG59i7lwlWAQmbDUcrzPuP3z6Qh7aJQbYbDWN1JzzFxPVEYRJ5GgjBqgwAdvWo2LC9bt/zDrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M445v1lC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738775235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+OLTbGqj/iIpCK8/1CkoJoVzjfpKlls86EfJDj73zs=;
	b=M445v1lCCdgaWk0Ab7ncWc2bhvV93iDcO3ZF6eb2eYqx815bDcl968BOgCzckI0Iq5ahiJ
	yQ+rxnD0Sx9QoRVmaI43lyZybhEid94iX2/AmucOkS3hg4CiKkuQc09G9mn1hqQvW3fT78
	xsjxe6JVTvvyVs907B4YHb+w6LmMMj0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-Zu6YVWzaNxC3p8lwmE6fMA-1; Wed, 05 Feb 2025 12:07:14 -0500
X-MC-Unique: Zu6YVWzaNxC3p8lwmE6fMA-1
X-Mimecast-MFC-AGG-ID: Zu6YVWzaNxC3p8lwmE6fMA
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467b19b55d6so358041cf.2
        for <kvm@vger.kernel.org>; Wed, 05 Feb 2025 09:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738775233; x=1739380033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+OLTbGqj/iIpCK8/1CkoJoVzjfpKlls86EfJDj73zs=;
        b=OHphPn9NSmbod6k9YwalE9ZfCdyqXQUx1nFWmP8vLC2J4/6PEUwgrVw5T7+/yeQwlc
         a2mUV6UTdCiizK6QAi9Mxt/+W8HT8LJphkcYX13C7/Vrd913guOb2OVYHt2ZQ8R4Fz+q
         yNxkDVYMUyY+NYeCYYQCKDctlCWLDuD5j4xOL5mQv3V4Y+qynHDklzy8PD94z7+y2Z+u
         3TgqY51ZlEP8QSppFqddL2P4yPYPNb2NIgtQ2atoFUgCrjANR85zISg45NkBGFKD5We4
         OfO2AHSSPBVpgAE+7oIdkCDUOjM+Q6vkZ0zc5CurKNVxAGt/CtQh9jMj/5/go/ekfNcc
         Hdpg==
X-Forwarded-Encrypted: i=1; AJvYcCWG7fk1CSUJFU5JWCWCthNjFfacJOCwgJZTbIuEeXVNOeHLZevQvVozhGnyEWQM3qetw10=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhaoNOkzxq9I0MvsdwLQVYZCsdG+qr0VSnO46TBui0ZcQrvix
	l2GwHb6r2Tpm96ZoDSgR9u7fEsNXD+OBugVj+DVQJYxYpq1+onBYqaAUl6G0Ydv7BY1yL2CgFij
	OTHOv/e9QY3N0kkgYJDq8YfvvpgQDTC7pP5DJLt41ogy6EkWPUWO9gfUmeg==
X-Gm-Gg: ASbGncsaPwm+z9JaVjXdBuix941fnE/JrnalKPUD9jYc2I4wDhM9cpZNmjxUISrurBv
	HO5HjL/7GWnba3DVrFyop5c3KFspJSsDWAM845dtU91VxY+07sxMYw6hV435mS07OiKt17iCgRJ
	kr+V5kSR6+ruFqJqZLMjjMXMmhTkXkU/uvG43GF3A+/xY4szsCQ40gAbRQjFmy1pACC2crbV/MD
	JVxmJt9ldvGM3KO0nK83l2os23SXnoLUoHkO93ce7Om8SZ1pQJDNKj0/E6IITmXAVSRD+5KOtV9
	37vjwDAbYffD4ORF0Fh4/fc7I+JqEbQt4HO5CO+qdJJun2YI
X-Received: by 2002:a05:622a:1209:b0:46c:791f:bf56 with SMTP id d75a77b69052e-47028165422mr48419601cf.1.1738775233116;
        Wed, 05 Feb 2025 09:07:13 -0800 (PST)
X-Received: by 2002:a05:622a:1209:b0:46c:791f:bf56 with SMTP id d75a77b69052e-47028165422mr48419311cf.1.1738775232822;
        Wed, 05 Feb 2025 09:07:12 -0800 (PST)
Received: from x1.local (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0a74c6sm72351171cf.6.2025.02.05.09.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:07:12 -0800 (PST)
Date: Wed, 5 Feb 2025 12:07:06 -0500
From: Peter Xu <peterx@redhat.com>
To: William Roche <william.roche@oracle.com>
Cc: david@redhat.com, kvm@vger.kernel.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, pbonzini@redhat.com,
	richard.henderson@linaro.org, philmd@linaro.org,
	peter.maydell@linaro.org, mtosatti@redhat.com, imammedo@redhat.com,
	eduardo@habkost.net, marcel.apfelbaum@gmail.com,
	wangyanan55@huawei.com, zhao1.liu@intel.com,
	joao.m.martins@oracle.com
Subject: Re: [PATCH v7 3/6] accel/kvm: Report the loss of a large memory page
Message-ID: <Z6Oaukumli1eIEDB@x1.local>
References: <20250201095726.3768796-1-william.roche@oracle.com>
 <20250201095726.3768796-4-william.roche@oracle.com>
 <Z6JH_OyppIA7WFjk@x1.local>
 <3f3ebbe8-be97-4827-a8c5-6777dea08707@oracle.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f3ebbe8-be97-4827-a8c5-6777dea08707@oracle.com>
X-TUID: nPeYfwYxJ7/w

On Wed, Feb 05, 2025 at 05:27:13PM +0100, William Roche wrote:
> On 2/4/25 18:01, Peter Xu wrote:
> > On Sat, Feb 01, 2025 at 09:57:23AM +0000, “William Roche wrote:
> > > From: William Roche <william.roche@oracle.com>
> > > 
> > > In case of a large page impacted by a memory error, provide an
> > > information about the impacted large page before the memory
> > > error injection message.
> > > 
> > > This message would also appear on ras enabled ARM platforms, with
> > > the introduction of an x86 similar error injection message.
> > > 
> > > In the case of a large page impacted, we now report:
> > > Memory Error on large page from <backend>:<address>+<fd_offset> +<page_size>
> > > 
> > > The +<fd_offset> information is only provided with a file backend.
> > > 
> > > Signed-off-by: William Roche <william.roche@oracle.com>
> > 
> > This is still pretty kvm / arch relevant patch that needs some reviews.
> > 
> > I wonder do we really need this - we could fetch ramblock mapping
> > (e.g. hwaddr -> HVA) via HMP "info ramblock", and also dmesg shows process
> > ID + VA.  IIUC we have all below info already as long as we do some math
> > based on above.  Would that work too?
> 
> The HMP command "info ramblock" is implemented with the ram_block_format()
> function which returns a message buffer built with a string for each
> ramblock (protected by the RCU_READ_LOCK_GUARD). Our new function copies a
> struct with the necessary information.
> 
> Relaying on the buffer format to retrieve the information doesn't seem
> reasonable, and more importantly, this buffer doesn't provide all the needed
> data, like fd and fd_offset.
> 
> I would say that ram_block_format() and qemu_ram_block_info_from_addr()
> serve 2 different goals.
> 
> (a reimplementation of ram_block_format() with an adapted version of
> qemu_ram_block_info_from_addr() taking the extra information needed could be
> doable for example, but may not be worth doing for now)

IIUC admin should be aware of fd_offset because the admin should be fully
aware of the start offset of FDs to specify in qemu cmdlines, or in
Libvirt. But yes, we can always add fd_offset into ram_block_format() if
it's helpful.

Besides, the existing issues on this patch:

  - From outcome of this patch, it introduces one ramblock API (which is ok
    to me, so far), to do some error_report()s.  It looks pretty much for
    debugging rather than something serious (e.g. report via QMP queries,
    QMP events etc.).  From debug POV, I still don't see why this is
    needed.. per discussed above.

  - From merge POV, this patch isn't a pure memory change, so I'll need to
    get ack from other maintainers, at least that should be how it works..

I feel like when hwpoison becomes a serious topic, we need some more
serious reporting facility than error reports.  So that we could have this
as separate topic to be revisited.  It might speed up your prior patches
from not being blocked on this.

Thanks,

-- 
Peter Xu

