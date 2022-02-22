Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3650097lfq;
        Tue, 22 Feb 2022 08:38:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmP6iWsUaPvl3lpxWHhgo1nZat8m1XpDfqqQ+zjs++XyA7sk3yBY4AZ7s42eCD9zeptML0
X-Received: by 2002:a05:6402:3553:b0:412:d0aa:e7b0 with SMTP id f19-20020a056402355300b00412d0aae7b0mr20619430edd.309.1645547915719;
        Tue, 22 Feb 2022 08:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645547915; cv=none;
        d=google.com; s=arc-20160816;
        b=F5Bh9Dbftys7XGAHj4ahyphL7JGbQ/Pg7cba9KGYTFxQRr5P6RWOC/TaFVDsVTT1YU
         cSnRIx3DMp7P6cNnM4Vx+l1WKtrGie5LOyx+s7yfdpajcIFIf+oII2E+ijaY43M8+zVR
         O2ZTWarnwHys383ryrIUhC3NG9cfGn4nweL+mPRKe6KowYxJhiSB6JSJba7LmrMXBXEg
         LpwIvNE75i430ZtOEKW2H4v/cFQdSmuK8DYiwJh+rPjA2+wPUbG/WS5FZbb51bdL9IP4
         ncRZUI/0XKNdlxzMN3m2hV271+Fv/3TtJfV/tcXU6MUFcsZhKOakl1bHOs6l7zGJU2NR
         27bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=LYa4rHDhYe14xmC6555n1VmRCeOY76oa4WNCVke9MWk=;
        b=TALz2i4sAtwH2rm4ReCU2ZxqM110KzouTRMttgs4o7XVSIu9mwJrcRyFZGb+XL2TtP
         Q6eAGh6LYucqVqjoscKmTdS4D/4yc6pviZT4q6VGztzqFKQ2F24Hh/GpG9/CVBSepyOw
         rVzwfTIR8jRL7fOEIlvpIMD4w/1PLXhvq94SRwvSlS5uxxF+hxm9HS1GC26i8pU3z2xo
         inO6VbR5hAAatug1O3/B70SdOcvlaedbOVZnNk8u3Sbg+238nRKlyS0/fS632kfbnIRw
         YIJONRrlbvvy6UQbKSZtW/1krO2bYl11Fbb11J7QGe0X3bD0k4EGScFGss645Mzj4ER9
         enSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XLSkfvNj;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b25si12826135edy.68.2022.02.22.08.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Feb 2022 08:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XLSkfvNj;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645547914;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYa4rHDhYe14xmC6555n1VmRCeOY76oa4WNCVke9MWk=;
	b=XLSkfvNjXzRy90Y26t+3s/Q2Zn5uoSajsNa3TnCfSPtxUakrfAz476Z58CxiXs6fm954TN
	uDSFo2fu4Ln/y4CrpEiQsaynbVLNfjYBOWJlvmmV41SBbiAj3Qww4s9w3p0rvzbYZKQRWX
	wkjVpss/XE/0o2gRzmqtZkDrq8u3oIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-n-nHbnUDOoC3-ZeOPZv5AQ-1; Tue, 22 Feb 2022 11:38:31 -0500
X-MC-Unique: n-nHbnUDOoC3-ZeOPZv5AQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3624D100CC84;
	Tue, 22 Feb 2022 16:38:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD182348B8;
	Tue, 22 Feb 2022 16:38:25 +0000 (UTC)
Date: Tue, 22 Feb 2022 16:38:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Laszlo Ersek <lersek@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <cleber@redhat.com>, Oleg Vasilev <me@svin.in>,
	Richard Henderson <richard.henderson@linaro.org>,
	Emilio Cota <cota@braap.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Idan Horowitz <idan.horowitz@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <YhURfqMvRT4xbiz6@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <874k4xbqvp.fsf@linaro.org>
 <878ru2nacq.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <878ru2nacq.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: M0N+a1N5ucH6

On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Hi,
> >
> > TL;DR:
> >
> >   - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
> 
> Laszlo,
> 
> Would it be possible to do a less debug enabled version of EDK2 on the
> next update to pc-bios/edk2-*?

NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
an EDK2 contributor taking over from Lazslo in EDK2 community

> 
> >
> > So my working theory is:
> >
> >   - booting with EFI leaves a number stale code pages
> >   - as the kernel boots it clears these pages triggering lots of
> >     slow-path writes
> >   - result very slow boot
> >
> > I think the only real solution is to improve our TB invalidation code
> > but perhaps another approach would be to detect a high TB invalidation
> > churn and just tb_flush the whole thing and start again?
> >
> > Any thoughts or ideas?
> 
> 
> -- 
> Alex Bennée
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
