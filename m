Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp140499lfq;
        Wed, 23 Feb 2022 05:44:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2HSZTJ5usMeFIqM2LcnzN61SwQ4XMJrUhC0sDI/pItHzYztW7erUa1CPtRtHegC873BsY
X-Received: by 2002:ac8:5a86:0:b0:2de:3ced:312c with SMTP id c6-20020ac85a86000000b002de3ced312cmr10653671qtc.73.1645623856118;
        Wed, 23 Feb 2022 05:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645623856; cv=none;
        d=google.com; s=arc-20160816;
        b=votpIbIVzSK44GbPLlq7H+Xt465XkJAKLIjlMILxRSAqfou2c0U8C+55UeCYrtwUK1
         H7DvC8REUb9m0PBppqFPE8OAKokssMk0X87MWww6c7aFQHf7UGwyjT/iTs+fiqdDd2Oe
         17VlEK8BATjeh+yfIE02RzRVoITOTmBZM6T7UV5vgg1so5xKidBXUSs05Vk5VwiVV90d
         iJnLYZEk6RX9mk1g2fzKbqfKe4QY6xdP0KEDMUcBEnkDHLGVuJiTr0b4Ykf4swrELpBj
         rQu7UfSwI4Ck+gnCKBHrL4hRwfY1BS6Q1xpyB7JCa5mddxmTeD0lVjJHUh9tnfwpTYxv
         Ke3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=gvRF6Bk2Hdl11kNRsEVHwxmqlwLQr1+buD9hdb+CiuQ=;
        b=XezES7q4ZWF5qfdUU22NPLjiJYyFNLb6bG8BmhHcNO/VaPQJQ1sdZvGgKmIp7+nHPP
         p8Hu4CoQizbevyp39adFaJxik2iSJ29k1tV0w+OlFKAskKaMYL1ehFUt2adFtFNPLIDL
         Cu+hwq5XtjnRawgBFR1/egR0HX5AcLCOZ7gzSg2ZiVTG/4QqmwAyyBjfYxnstjDUK/lN
         yuj0kz6QyzhLu3abM8UKmBMvjdizBgH3e8YJYq5GSpoDH9DoOvuQRmHrH/gjkdM5hwdZ
         SE4+XZqnBHn3ZYkbgez/XVD9/UX3JRsVzyVRDvZWkeyuOaseOX30gEsTACt8CV5mR5NU
         8D7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QJBN8C6T;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bk1si1308244qkb.192.2022.02.23.05.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Feb 2022 05:44:16 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QJBN8C6T;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645623855;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvRF6Bk2Hdl11kNRsEVHwxmqlwLQr1+buD9hdb+CiuQ=;
	b=QJBN8C6Tj0Snk0vPItKdkuF1cUsGDuLQICtJQBXbUBNEpeDEyPQF66kQftmUV1xJQlfoqs
	2SUestdHZ1RKqcd7Z7DWwRw+BMa5s7hf0GDf3LQ6Hfi6ExiY2WKN2wMJlhRjzON5JcUvSp
	WsEhuWsjIpbu7Bwn0yz2FAM8uWYijHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-dEL1MJ0-NnalQwfY-YFTDQ-1; Wed, 23 Feb 2022 08:43:55 -0500
X-MC-Unique: dEL1MJ0-NnalQwfY-YFTDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DE2510247A6;
	Wed, 23 Feb 2022 13:43:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E7FF84974;
	Wed, 23 Feb 2022 13:43:07 +0000 (UTC)
Date: Wed, 23 Feb 2022 13:43:04 +0000
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
Message-ID: <YhY56KLLPrqGWtBM@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <874k4xbqvp.fsf@linaro.org>
 <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
 <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: X7b77GQLoj0z

On Wed, Feb 23, 2022 at 02:34:23PM +0100, Philippe Mathieu-Daudé wrote:
> On 23/2/22 12:07, Daniel P. Berrangé wrote:
> > On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
> > > +Igor/MST for UEFI tests.
> > > 
> > > On 22/2/22 17:38, Daniel P. Berrangé wrote:
> > > > On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
> > > > > 
> > > > > Alex Bennée <alex.bennee@linaro.org> writes:
> > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > TL;DR:
> > > > > > 
> > > > > >     - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
> > > > > 
> > > > > Laszlo,
> > > > > 
> > > > > Would it be possible to do a less debug enabled version of EDK2 on the
> > > > > next update to pc-bios/edk2-*?
> > > > 
> > > > NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
> > > > over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
> > > > an EDK2 contributor taking over from Lazslo in EDK2 community
> > > 
> > > We need the DEBUG profile to ensure the bios-tables-tests work.
> > 
> > Can you elaborate on what bios-tables-tests needs this for, and
> > what coverage we would loose by disabling DEBUG.
> 
> Maybe it was only required when the tests were developed...
> I'll defer that question to Igor.
> 
> > It may well be a better tradeoff to sacrifice part of bios-tables-tests
> > in favour of shipping more broadly usable images without DEBUG.
> 
> Why not, if users are aware/happy to use a unsafe image with various
> unfixed CVEs.

Note there's nothing special about EDK2 in regard of CVE fixes (or lack
thereof). The same applies to every other firmware we ship, as well as
QEMU code itself.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
