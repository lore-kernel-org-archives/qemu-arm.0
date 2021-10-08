Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2373525lfp;
        Fri, 8 Oct 2021 04:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPpyCrdGHExADItsJ0pevaRnDiREzC0Zjh4EAPiL5sTd0FAyXqIlDqG226CVzotg8YZ1dw
X-Received: by 2002:a17:906:c015:: with SMTP id e21mr3406844ejz.113.1633690886867;
        Fri, 08 Oct 2021 04:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633690886; cv=none;
        d=google.com; s=arc-20160816;
        b=L3DsXcMfpN9RPfND5xLl2NbOednpFMQ7CVvOSPvkw6Q3dga22I6OUNYZZ0dO/ZH32e
         7Gr3vBvx+4LMaZ71rgiYYxuTCC/yMfHw3lkfwQK4wpXze4RkfW4r6PCtarhbxfMTOn4H
         l+xheazFGSQxb3n0C39NWPp/8XW1vpXk1nkeBflbDRKz1DBtRS6olvREFtbMT8P6VojG
         jt7h2+Kx2PviYDmo3e1LIEhMoD0cXbBj66q1Yu7x9JqV7izSrL83nBDpt8pDZdJHGp/n
         5PW+bZ9tRPydQd8wzyn9KGgHWyzE5QbiVMrZzHgd7e+jKf6CCUo1FMyw86S6ykwJzQrR
         CKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=S3Le4MG/sH+0J17/DA3PcBuwRRGIPbf8AqLU211Mo2w=;
        b=y2C9SGgvEv6ivcj0ncWIsJLSa+aMSHeF4m99IJ3XmLvFleQ6M0aiF/SVnBI0lD5mql
         ukQUAFnYhM7IkMLk5wXogBB/FzP8FtOv8YLlkuhDVyOgBp1Mvvh1KskTg0acK7Bvf0f0
         5HT3hn5aq3Cg7foQbao09up7c6k+axs+swUvTjUMkrdtUj06yh9B2fPx7QuwDW/GsTln
         78btewVM+nrUisd/ILiE6YCzZ1JF+QYNhx0UOQXbRkJ4sSOrY7KaCcGxqvkz0B1A5yLh
         ODXElauBquSS9P5kpp4vm1vExWb2EmfOJQ6U7clOippRc4gKrlsom5drNrdcb+2fznfu
         icjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LXPtT5kg;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h2si3044863ejj.419.2021.10.08.04.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 04:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LXPtT5kg;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633690885;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3Le4MG/sH+0J17/DA3PcBuwRRGIPbf8AqLU211Mo2w=;
	b=LXPtT5kgK75NpiDC6y4WGEttvdcSqK+gRkr4vSX+XIFtEhri0pQ3t2Be1uyWcFd3nkb0iL
	68q3jbl3KmcP1r0ROm5SSBKklUD9KPQIKKDNBa26scknsq41sKPBG1kM+o5MLUQ4BvFrAY
	NhKgrSa1s7obIx1degaw9YmavH/oR4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-mIx1sSxjM12PXwYVWlgFNg-1; Fri, 08 Oct 2021 07:01:14 -0400
X-MC-Unique: mIx1sSxjM12PXwYVWlgFNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D06CC802CB5;
	Fri,  8 Oct 2021 11:01:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5205460CCC;
	Fri,  8 Oct 2021 11:01:10 +0000 (UTC)
Date: Fri, 8 Oct 2021 12:01:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	assad.hashmi@linaro.org, qemu-devel@nongnu.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	qemu-arm@nongnu.org, "Eric W. Biederman" <ebiederm@xmission.com>,
	Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: Approaches for same-on-same linux-user execve?
Message-ID: <YWAk88MtPDufjzmK@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <877deoevj8.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <877deoevj8.fsf@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: N3K+p5ne6TTN

On Thu, Oct 07, 2021 at 03:32:19PM +0100, Alex Bennée wrote:
> Hi,
> 
> I came across a use-case this week for ARM although this may be also
> applicable to architectures where QEMU's emulation is ahead of the
> hardware currently widely available - for example if you want to
> exercise SVE code on AArch64. When the linux-user architecture is not
> the same as the host architecture then binfmt_misc works perfectly fine.
> 
> However in the case you are running same-on-same you can't use
> binfmt_misc to redirect execution to using QEMU because any attempt to
> trap native binaries will cause your userspace to hang as binfmt_misc
> will be invoked to run the QEMU binary needed to run your application
> and a deadlock ensues.
> 
> There are some hacks you can apply at a local level like tweaking the
> elf header of the binaries you want to run under emulation and adjusting
> the binfmt_mask appropriately. This works but is messy and a faff to
> set-up.
> 
> An ideal setup would be would be for the kernel to catch a SIGILL from a
> failing user space program and then to re-launch the process using QEMU
> with the old processes maps and execution state so it could continue.
> However I suspect there are enough moving parts to make this very
> fragile (e.g. what happens to the results of library feature probing
> code). So two approaches I can think of are:
> 
> Trap execve in QEMU linux-user
> ------------------------------
> 
> We could add a flag to QEMU so at the point of execve it manually
> invokes the new process with QEMU, passing on the flag to persist this
> behaviour.
> 
> 
> Add path mask to binfmt_misc
> ----------------------------
> 
> The other option would be to extend binfmt_misc to have a path mask so
> it only applies it's alternative execution scheme to binaries in a
> particular section of the file-system (or maybe some sort of pattern?).
> 
> Are there any other approaches you could take? Which do you think has
> the most merit?

Could a new Linux personality flag be useful in combination with a
new flag in binfmt_misc.

eg a flag "E" for binfmt_misc which indicates the rule must only be
applied if the process is execve()d with PER_USE_BINFMT personality
set.

That would let you add a native match rule to binfmt_misc without
it affecting your system initially. To then run native binaries via
qemu-user you just need to set the personality() flag and the only
that  sub-process tree gets redirected.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
