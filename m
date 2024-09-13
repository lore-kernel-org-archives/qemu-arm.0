Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp874819nji;
        Fri, 13 Sep 2024 05:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX0McwfzW6Uu5qVRdENvMv/yUIDWgRqmMNxrW0M4sBh5f7FKVCja5XLJSQqss1cgsgiwlUlhf1x2gfHhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEcKXAbjwBnqtFJKKQTGaJti7jhDFVuzXzmuJnKo2DdM9yqEowVFNYtbQo+vmFWK3i3+gnz
X-Received: by 2002:a05:6a21:9201:b0:1cf:3885:b9d8 with SMTP id adf61e73a8af0-1cf75ef2beemr9397436637.27.1726230501489;
        Fri, 13 Sep 2024 05:28:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726230501; cv=pass;
        d=google.com; s=arc-20240605;
        b=OIE627AuYzCG44dirZAIDt2DTHPFclVqCkvO43PLZjruF/19znsLHtkyV31RDvDyS5
         6Wp+xykaERHri5dYBc69uMGiTBK7fILW+sr0tHzOlnEIwC50XGB4Xpk8P3WoP6TF2cWJ
         DQePNH2HM8arZoeLM6lLjc7MsZGn7pcxenZ96AsTvqlmxJ99UVKMC2uu4bZQG01Fu/qS
         5izYCtI2CDQcBLLw4giL318FDiCljBStDRZfoyauex6BjnPzB/uzUZYoPXjieyh06sVz
         zO6tNi7RfYwMIMJbeO3DVxOXv98Ajm33PTM1kUa/nO0LCSJriOsyeIY6xBahq36LYATk
         Wsbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=EOsEOZ442fZTnpwmIAalviKZpEy09FAoSuiqvRfcTP8=;
        fh=YOrMHR/HA1OWSU0LFvSITnqUYSPJmt92wF27EdKOTRA=;
        b=ChPnF8NT5SEqljtQsycpgLmtUzsqUCrMXxIhc53xCptzD7HINFmLdp5Jr46/PK+IAT
         ubbYvk6sRc57ckteI/5IbtZqr/Mfgt9tjNEJWEQs5A+28HKTnB2mlLbDsAeKW71qFCqJ
         0tc1wVmqX+foHlw39NF3k0y4+eWlLEDmwi7qmxuB73vTAzaPi0tE24u/8IEt7OTmSwf6
         iat/8+VO3imnusiV6g4oKhab3gzeGaY8eL++HvF213Ft3CW9bqmpQIlzLQvFrDQMlnpR
         CRFyRfqgogsDHkhmAMRvjpt3X7L7g7H+SecSHlxVo43oX9IaYs2eYgUuIaROlp80jrCF
         o4aA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RxqHzYTw;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-328166-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-328166-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-328166-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-71908fd5080si8968858b3a.25.2024.09.13.05.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 05:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-328166-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RxqHzYTw;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-328166-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-328166-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03BD2289ABF
	for <alex.bennee@linaro.org>; Fri, 13 Sep 2024 12:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9973C1D935E;
	Fri, 13 Sep 2024 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RxqHzYTw"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D321C2BF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Sep 2024 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230490; cv=none; b=fNdYUyMQHfPz1CfgfSUfTKTDws7QYYZyX+F0le1sLz0sjA9Bf35VArCFjxbqJbrKiS5SiWAjzUH4DjbHSIl4IxNhfghvfxCsy+RCuslz0ZWsNcJeVJgvVjgxIcDYCs076dN6toRBExwwIJ2Rt6JXxhRV/Op529Qdd2RY4lQ+Jhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230490; c=relaxed/simple;
	bh=9u3ZTF5+yEOHijIR7MEcR87JGXlMqf2ETMW9omSZGkU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/1lxyqACjWfqW4gDgauj9OLB503WAEn9vrPgo1TN2Zj/e8ct+49+PYeD+3N8vF8K/VQPllxWAvT8BwEVwm3ucb5t86Tk+3iaWptID4/9zl5nUVJtrb9nBiRMPziJfuskDD52v9JfuMAwLVoxUXyDaDgwgVID6S3sSfzvt31Aa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RxqHzYTw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726230487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOsEOZ442fZTnpwmIAalviKZpEy09FAoSuiqvRfcTP8=;
	b=RxqHzYTwx+q+NvSjTPCbK5tUJH5MV865oH1OoGpgmqaI9CzZTtEMueChrWVgwN+T+YDvTc
	lU4loqohcZ0yCjYCsK/NFDQqqEUAP6VfTs9rf65syeediged4O8Sa7y/QKNyCkvvm88XYd
	3L/r6UdD8kK5/0Z7uJmdAek+jGDHvJU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-ROWWXoTyMiiZS6zvxXwUCg-1; Fri, 13 Sep 2024 08:28:06 -0400
X-MC-Unique: ROWWXoTyMiiZS6zvxXwUCg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cc4345561so13479705e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Sep 2024 05:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726230485; x=1726835285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOsEOZ442fZTnpwmIAalviKZpEy09FAoSuiqvRfcTP8=;
        b=LCe09QU4cZrlIhUNWNBFMORf7vE+QE/DGGCJOfpGfG6LzNLzOEHc73CFIyp69RLiZt
         dpici1hsBYSWgaLpaCGPj2mBXQF+h05bNuRwWU9nVXY2sN4x90Lg6r8MQlhRqnw3G/Th
         NwfyKQdAAhxYdQH8AF2HujG6pTVFTDDNshT0/rIm7g85kie2MfKLdLp0U9oUcfDOI+O+
         JaJNnghcGJeXJp9EKCMNt3Boe4+tTX6zsx2gAHEtt3IZuj00X7o/4ViPpCPIpVnEVAfg
         YGvEnf3OinJqLOnorZH6POoNULXQkX2cypvoFIWcl6HudPe5QgeXqB3UVAxVw5qTW7Rq
         1HMw==
X-Forwarded-Encrypted: i=1; AJvYcCWkVPFM/2XHxdaIREJdX/krqZKaYRPamu1BHsXrqflVNkYTgu7AtEyeDXKlAX7zjrYTy+qocsZZ/VdrTjw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1xNVUGmdzncFEuwYJMieJW++MBKolJcBT5TymNVtbTWkQzkSh
	WQK3dTwvEVygNuErTyg+5CS/1Qlv7RqP5n4HsvuDgTYFNzoa2gwPgiSrUDxinUHkebFUFMSDEQ+
	fy1lV68PmI1v6V6E7dcoVpqCx0J8/2uXyTJDnxjneGcL/DNuF8jhqJejliGq29Q==
X-Received: by 2002:a05:600c:198b:b0:426:593c:9361 with SMTP id 5b1f17b1804b1-42cdb5684damr49732105e9.26.1726230485133;
        Fri, 13 Sep 2024 05:28:05 -0700 (PDT)
X-Received: by 2002:a05:600c:198b:b0:426:593c:9361 with SMTP id 5b1f17b1804b1-42cdb5684damr49731645e9.26.1726230484047;
        Fri, 13 Sep 2024 05:28:04 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b05d6fcsm23251065e9.15.2024.09.13.05.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 05:28:03 -0700 (PDT)
Date: Fri, 13 Sep 2024 14:28:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 06/13] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240913142802.08571a15@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240913111300.00007a3c@Huawei.com>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
	<2c8970b5d54d17b601dc65d778cc8b5fb288984b.1723793768.git.mchehab+huawei@kernel.org>
	<20240819145136.0452ff2b@imammedo.users.ipa.redhat.com>
	<20240825052923.715f88bc@sal.lan>
	<20240911152132.65a7a219@imammedo.users.ipa.redhat.com>
	<20240911163436.00004738@Huawei.com>
	<20240912144233.675d6b63@imammedo.users.ipa.redhat.com>
	<20240913072025.76a329b0@foz.lan>
	<20240913111300.00007a3c@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: cP8a0PS+eSzC

On Fri, 13 Sep 2024 11:13:00 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Fri, 13 Sep 2024 07:20:25 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Thu, 12 Sep 2024 14:42:33 +0200
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >   
> > > On Wed, 11 Sep 2024 16:34:36 +0100
> > > Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> > >     
> > > > On Wed, 11 Sep 2024 15:21:32 +0200
> > > > Igor Mammedov <imammedo@redhat.com> wrote:
> > > >     
> > > > > On Sun, 25 Aug 2024 05:29:23 +0200
> > > > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > > >       
> > > > > > Em Mon, 19 Aug 2024 14:51:36 +0200
> > > > > > Igor Mammedov <imammedo@redhat.com> escreveu:
> > > > > >         
> > > > > > > > +        read_ack = 1;
> > > > > > > > +        cpu_physical_memory_write(read_ack_start_addr,
> > > > > > > > +                                  &read_ack, (uint64_t));            
> > > > > > > we don't do this for SEV so, why are you setting it to 1 here?        
> > 
> > The diffstat doesn't really help here. The full code is:
> > 
> >     /* zero means OSPM does not acknowledge the error */
> >     if (!read_ack) {
> >         error_setg(errp,
> >                    "Last CPER record was not acknowledged yet");
> >         read_ack = 1;
> >         cpu_physical_memory_write(read_ack_start_addr,
> >                                   &read_ack, sizeof(read_ack));
> >         return;
> >     }
> >   
> > > > > what you are doing here by setting read_ack = 1,
> > > > > is making ack on behalf of OSPM when OSPM haven't handled existing error yet.
> > > > > 
> > > > > Essentially making HW/FW do the job of OSPM. That looks wrong to me.
> > > > > From HW/FW side read_ack register should be thought as read-only.      
> > > > 
> > > > It's not read-only because HW/FW has to clear it so that HW/FW can detect
> > > > when the OSPM next writes it.    
> > > 
> > > By readonly, I've meant that hw shall not do above mentioned write
> > > (bad phrasing on my side).    
> > 
> > The above code is actually an error handling condition: if for some
> > reason errors are triggered too fast, there's a bug on QEMU or there is
> > a bug at the OSPM, an error message is raised and the logic resets the 
> > record to a sane state. So, on a next error, OSPM will get it.
> > 
> > As described at https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html?highlight=asynchronous#generic-hardware-error-source:
> > 
> >    "Some platforms may describe multiple Generic Hardware Error Source
> >     structures with different notification types, as defined in 
> >     Table 18.10. For example, a platform may describe one error source
> >     for the handling of synchronous errors (e.g. MCE or SEA), and a 
> >     second source for handling asynchronous errors (e.g. SCI or
> >     External Interrupt)."
> > 
> > Basically, the error logic there seems to fit for the asynchronous
> > case, detecting if another error happened before OSPM handles the
> > first one.  
> 
> Agreed - the error logic to act as backpressure for the tool injecting
> the error makes sense - it's just hardware acknowledging to paper
> over slow software that is an issue.

on top of that, read_ack is serving as sync primitive
If one disregards it and starts overwriting error block regardless of
ack value, One will be inducing race condition, where OSPM might be
accessing error_block while HW is in process of overwriting it.

> 
> > 
> > IMO, there are a couple of alternatives to handle such case:
> > 
> > 1. Keep the code as-is: if this ever happens, an error message will
> >    be issued. If SEA/MCE gets implemented synchronously on HW/FW/OSPM,
> >    the above code will never be called;
> > 2. Change the logic to do that only for asynchronous sources
> >    (currently, only if source ID is QMP);
> > 3. Add a special QMP message to reset the notification ack. Probably
> >    would use Notification type as an input parameter;
> > 4. Have a much more complex code to implement asynchronous notifications,
> >    with a queue to receive HEST errors and a separate thread to deliver
> >    errors to OSPM asynchronously. If we go this way, QMP would be
> >    returning the number of error messages queued, allowing error injection
> >    code to know if OSPM has troubles delivering errors;  
> 
> Is this not better done in the injection code outside of qemu?
> So detect the error in that and if it happens back off and try again
> later?  Basically EBUSY done in an inelegant way.
> 
> > 5. Just return an error code without doing any resets. To me, this is 
> >    the worse scenario.
> > 
> > I don't like (5), as if something bad happens, there's nothing to be
> > done.  
> 
> If it happens on a real system nothing is done either. So I'm not sure
> we need to handle that.  Or maybe real hardware reinjects the interrupt
> if the OSPM hasn't done anything about it for a while.
> 
> > 
> > For QMP error injection (4) seems is overkill. It may be needed in the
> > future if we end implementing a logic where host OS informs guest about
> > hardware problems, and such errors use asynchronous notifications.
> > 
> > I would also avoid implementing (3) at least for now, as reporting
> > such error via QMP seems enough for the QMP usecase.
> > 
> > So, if ok for you, I'll change the code to (2).  
> 
> Whilst I don't feel strongly about it, I think 5 is unfortunately the
> correct option if we aren't going to queue errors in qemu (so make it
> an injection tool problem).

+1 to option (5)

> > 
> >   
> > > > Agreed this write to 1 looks wrong, but the one a few lines further down (to zero
> > > > it) is correct.    
> > > 
> > > yep, hw should clear register.
> > > It would be better to so on OSPM ACK, but alas we can't intercept that,
> > > so the next option would be to do that at the time when we add a new error block
> > >     
> > > > 
> > > > My bug a long time back I think.
> > > > 
> > > > Jonathan
> > > >     
> > > > >       
> > > > > > 
> > > > > > IMO, this is needed, independently of the notification mechanism.
> > > > > > 
> > > > > > Regards,
> > > > > > Mauro
> > > > > >         
> > > > > 
> > > > >       
> > > >     
> > >     
> > 
> > 
> > 
> > Thanks,
> > Mauro  
> 

