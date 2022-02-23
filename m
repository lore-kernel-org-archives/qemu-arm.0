Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp4130731lfq;
        Wed, 23 Feb 2022 00:49:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrvVzkKHYYLQ8tme7LP8V3s1+pHFQx0SsA3g0Bo2x0RLf/ZTOce0bQFC6vD2u/EWvYrWJ9
X-Received: by 2002:ad4:564b:0:b0:42c:3cdb:16c7 with SMTP id bl11-20020ad4564b000000b0042c3cdb16c7mr22733740qvb.86.1645606142387;
        Wed, 23 Feb 2022 00:49:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645606142; cv=none;
        d=google.com; s=arc-20160816;
        b=P7y/dEqT2atQtWceCHRtOnQFDcXhmD4Ux+tRMKTWaQBNO1MkI3ev/gD8SqZu/9kJAd
         OB3ZAQR4zwRRDBvDZJWisWnNEUnACgP8Gke7pzNSg+xsuLrMlFr+I30ay6dF5y/wH7IB
         LhD0B8+MkzzJrv3avcvBy8H4708Td/gvEQbv26xTJy1LXzlMi8nrb/6LzHTQS8W2k0ZH
         lJryO2oVPAYyPfBeSaoG1jk6RNE/rZ0hDiqTOoFEyMgH6Qlft9LdkA12wdFgchJ7EDuQ
         27/p8mN3tKmPcK1HTxY+ZOlptHh5mB5b7vKaMDFt4DxY5fhHwD0P360JVddanMzlojGg
         C/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=SBM9UWjQmSViiuGkp+5zLBwd/t6PDtuxKubzl7m466Y=;
        b=ShdPPu2dF1QxcBagC0/D4Oa4W2Rj4B8BDm4NPXOyNH3w3OprsefDodrv0IFLS0cbz5
         FlSAQb20PpOjczVOPdtFqbxqbgCTB/KLRMQQwH1YBvFum9ITKwS9y8wngtwDJTtbLDRq
         EtRWN3GmzyM28Bk3xOfZqvkccMMoN0O9EHZ+GOzdSLAXpxqnyWmJCk1DNMYCFvRODUs9
         LXEzIPYKt/ibogBF591Nk+5ginVc+IX4l0pK5s4pbreCmu7sNfaQ49oUlWy+KbHGB/Ia
         nIh8UyNwbTzK7MuCqP1/JTlkm+mQroqlWCrNyNS0uxmsNv7hQTqcOmrZlu/9XaJCylAJ
         1jgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkumWuor;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w12si1248346qko.604.2022.02.23.00.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Feb 2022 00:49:02 -0800 (PST)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkumWuor;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645606141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBM9UWjQmSViiuGkp+5zLBwd/t6PDtuxKubzl7m466Y=;
	b=JkumWuorJM04p//OjkJ4cXe81AkKAr48wPA94+dJnDk4SFfj8Kh6NzWrHsNsLGRTy+M24D
	DRbNp5AB+2fWjpWQYuWopcBZd62jBPRBYqT+MnigcxO7LYaWZHthz7nwfi23QlyF9Bl1YD
	UK15C4m0bCwgrXuYE4rS2toeEKHzNp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-RbXG_cuiMWWuyct6N1RCnQ-1; Wed, 23 Feb 2022 03:48:58 -0500
X-MC-Unique: RbXG_cuiMWWuyct6N1RCnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1736180FD71;
	Wed, 23 Feb 2022 08:48:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAC908318F;
	Wed, 23 Feb 2022 08:48:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id F04F41800613; Wed, 23 Feb 2022 09:48:36 +0100 (CET)
Date: Wed, 23 Feb 2022 09:48:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <cleber@redhat.com>, Beraldo Leal <bleal@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, Oleg Vasilev <me@svin.in>,
	Richard Henderson <richard.henderson@linaro.org>,
	Emilio Cota <cota@braap.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Idan Horowitz <idan.horowitz@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <20220223084836.yapqj35tiocjios4@sirius.home.kraxel.org>
References: <874k4xbqvp.fsf@linaro.org>
 <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
 <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: x9jltjjHHzSg

  Hi,

> > > If you want to boot a guest using EDK2, you should use the images
> > > build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
> > > not these images.

> Then we should add edk2-aarch64 and edk2-ovmf to lcitool, to have
> the distrib images in our generated Docker images.
> 
> Cleber, you added this test in commit 6fd52d671d ("Acceptance test:
> add "boot_linux" tests"), can you have a look?

Well, it's not *that* simple.  Names are not consistent across
distributions.  I think if we want go that route we have to inspect
the *.json files in /usr/share/qemu/firmware to find the correct
distro firmware images.

Also note that at least fedora ships both verbose and non-verbose
images ...

    kraxel@sirius ~# rpm -ql edk2-aarch64 
    [ ... ]
    /usr/share/edk2/aarch64/QEMU_EFI-pflash.raw
    /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.raw
    /usr/share/edk2/aarch64/QEMU_EFI.fd
    /usr/share/edk2/aarch64/QEMU_EFI.silent.fd
    /usr/share/edk2/aarch64/QEMU_VARS.fd
    [ ... ]
    /usr/share/qemu/firmware/60-edk2-aarch64.json
    /usr/share/qemu/firmware/70-edk2-aarch64-verbose.json

... so maybe it is an option to use the distro images for the bios
tables test cases too.

take care,
  Gerd
