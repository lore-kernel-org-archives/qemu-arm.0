Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp48455lfq;
        Wed, 23 Feb 2022 03:08:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9z9iArpqQnPNWfSs61bdIeaFXGgbh8j8h/G15x20Z3CxTKUJhnDUwVtAw4GnPJobXwU+6
X-Received: by 2002:a05:6214:da3:b0:432:6ec5:aa0b with SMTP id h3-20020a0562140da300b004326ec5aa0bmr639386qvh.52.1645614480912;
        Wed, 23 Feb 2022 03:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645614480; cv=none;
        d=google.com; s=arc-20160816;
        b=Dr7+4pzbScZnT9W9IBXNzo0sznUoI0aAmgdEyLqCfe0cMJpqtUTdRfETsMYXxTCmzZ
         sV4rmDAmJWUxlVBaSKfYSTIygLPArp+c86M9DtMG7hf05SiZmcx/tuj6a3AW7jziyzer
         iezP623sIojTkaFvJZlytjiO64UeVPFpxVgP0/U9TgFamp2Bk6WXhNW2amNqdMMt1Icg
         s+yAjyZtHkUpPwE1F7AH2uy7BORNBIm5+xIcvvnQsidQvmSC9AzNOI5Kg/WSdPwLG9+T
         2FFmjDgx9fL9kZk9RP9dHX3WMTey5582EgMhXunyzcdifxCX7IuwGXqCq8xf0a37O2f2
         YyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=OmemaJ1zGjeaXrXPm6gZ9cOTtQYIqC0FLjmjeT2j2Kw=;
        b=tCCJiC5IueL7rN+NHPHbN65bcrSi9ji/ROMqXRq8vX2/6YBuCI0mBDv8gZyORlmECn
         NifbM93s0fhTRYfarf+CGLGWnIOLGNqhDLzKoJXtNveoyDYVuLFXeM5WNp1DGJiO+0RC
         XO58gjlxz+ZxGUBUbPGeOvWsOmdVJTIGMKC7/cBfkCrj6iKIB7ujZfhSB1vI+s8I88kJ
         xEZf9Q3jRl9Zu9LANMufFxgnPl+P0GeXlvGw0vQ/PmOm8thNPZVPKGWLxKklNMzVBtQ6
         LKiuQarhtns6bfh/BOnfLp65erbnwhPL19bYCCflwEqNTQiHaRNFk9UF0qGTl6nteJXW
         JLHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DzRzMA62;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a9si1401425qta.217.2022.02.23.03.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Feb 2022 03:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DzRzMA62;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645614480;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmemaJ1zGjeaXrXPm6gZ9cOTtQYIqC0FLjmjeT2j2Kw=;
	b=DzRzMA62dXIi7x8XDxwpN90Y86PruOyDgYGATHP52nm2NyM7XQrSAX7rKL5dATtT5b1NzD
	28v4VhiUmIrgsyVE59Ywy6548kloiqH8QWZTFpMjxy6iic9xQqxSbiWkRMhl1QbwmebSG4
	nj3U9jl5B3elPYYrcMf43ZGJ0rLCof0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-C3dOOaUVNiSAb3bdCqxZAQ-1; Wed, 23 Feb 2022 06:07:44 -0500
X-MC-Unique: C3dOOaUVNiSAb3bdCqxZAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42D20FC80;
	Wed, 23 Feb 2022 11:07:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 336628307B;
	Wed, 23 Feb 2022 11:07:05 +0000 (UTC)
Date: Wed, 23 Feb 2022 11:07:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <cleber@redhat.com>, Oleg Vasilev <me@svin.in>,
	Richard Henderson <richard.henderson@linaro.org>,
	Emilio Cota <cota@braap.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Idan Horowitz <idan.horowitz@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <YhYVVnVSL8K1S4MC@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <874k4xbqvp.fsf@linaro.org>
 <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: Ld7wDF3gqpT+

On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
> +Igor/MST for UEFI tests.
> 
> On 22/2/22 17:38, Daniel P. Berrangé wrote:
> > On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
> > > 
> > > Alex Bennée <alex.bennee@linaro.org> writes:
> > > 
> > > > Hi,
> > > > 
> > > > TL;DR:
> > > > 
> > > >    - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
> > > 
> > > Laszlo,
> > > 
> > > Would it be possible to do a less debug enabled version of EDK2 on the
> > > next update to pc-bios/edk2-*?
> > 
> > NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
> > over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
> > an EDK2 contributor taking over from Lazslo in EDK2 community
> 
> We need the DEBUG profile to ensure the bios-tables-tests work.

Can you elaborate on what bios-tables-tests needs this for, and
what coverage we would loose by disabling DEBUG.

It may well be a better tradeoff to sacrifice part of bios-tables-tests
in favour of shipping more broadly usable images without DEBUG.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
