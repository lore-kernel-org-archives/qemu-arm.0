Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp778138lfq;
        Thu, 24 Feb 2022 01:10:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9+OwjHOs6CBX+QwgJT/MiAMaXHxcJj+cNEypH2i25tPRCSRWi3t14yKHSxRBYsszDZ+KW
X-Received: by 2002:a17:906:5804:b0:6ce:3f17:bf35 with SMTP id m4-20020a170906580400b006ce3f17bf35mr1474846ejq.346.1645693825694;
        Thu, 24 Feb 2022 01:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645693825; cv=none;
        d=google.com; s=arc-20160816;
        b=ohHa/vObNEHdWihqX/DsJSbYYZ/IvoKBDEbpF2yaCQMn+fLE20kGUEu8GxDIhJS+z3
         LTeV9X8sTHwKVFUU+CSgEZNGiorYmmhX/ridNkdTLQwgB95A0DorK6XRue9kyeOKGHJp
         wvzgFKYGqekL+Wa7cO/+gCNAF4DJMEL85TYDtic0r4yJHGx6Dh1ViG4GecSJg2Up0+Oz
         ub/3V4Wz1/ExX4PsFCqq1pFG8n4HgucZHjjwlevps6yNh/LDJrGpKtsBqYVNmW3CQGmG
         nY6wy34hrbowFzstROzpNBBYsk3narqi1a3o+NoJENP5gR4w3vsH1s9xVEdyO25iTrha
         DKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=+rdqagwISMbbUFbBupZKEqJKpOvZ7RrKc9RcjpzaC+M=;
        b=xB41sq8FVHMDtyxgTrr3KNTMyF9CXfus1kpNIBW/pi3WO9qSQeBDBq9gX323dYxq4H
         s33WkUBFpMOe2e/Fp/j1ZAAE7XuRCbT2QM+ST84yaMKjl65NmAlYg9mp+t9P8whWPJC9
         GrxF53sbikUhBuUAHwh9yn0jr6v2FOLirSV+SKIpWA3mSOHtrFLIYRyDfZimixhYfPgz
         NMeWAv7VgY28v4BbnEB0sSX2oQmcxjcsWhoFZHEg03wMsx0K7hPjb5wuSe66zk7SHjSl
         lv7Qn4/JeLCh5DCIchF/KzkRSBqehU5mQ8uRRjghPf+aADu3nCAcquJV/a2BG/JzZtOp
         4MXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ghaup9fX;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 5si1234450ejh.215.2022.02.24.01.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:10:25 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ghaup9fX;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645693824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rdqagwISMbbUFbBupZKEqJKpOvZ7RrKc9RcjpzaC+M=;
	b=Ghaup9fXitus/lZv4tkI4DAKu78I/ppQ3ZMEgmNAd9NkslReHfbf0xLY2ae7jWiu7YfTUD
	+egpP2wicHIXprvUTeojtYCT/Pof3TE0LR4JHkdtfA0XSYStn6quf3rb0qlvkefneZjfqm
	ua6L7Upv6BvH6AE0PQpjUndpk2NB5qA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-fHAtPDhoPvOKiAIDDRHo4Q-1; Thu, 24 Feb 2022 04:10:23 -0500
X-MC-Unique: fHAtPDhoPvOKiAIDDRHo4Q-1
Received: by mail-ed1-f69.google.com with SMTP id b13-20020a056402278d00b0041311e02a9bso441332ede.13
        for <alex.bennee@linaro.org>; Thu, 24 Feb 2022 01:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rdqagwISMbbUFbBupZKEqJKpOvZ7RrKc9RcjpzaC+M=;
        b=uXD+msbz38Eb8TjLDuDjTWSkvvMkvsuwJ+0JFc2QIb3ftFwtn9tLzhUQxJZGRgfCyd
         FjHRYkHGcK/A/pUoErWT366VdzXCJF2/6AjYKGgw6q+tX5RuYDrmutvPPQLpsOU3hPn5
         mrQxq+g5w4HuhuYxjh+JdMzU1cMxX8dT/Uut66SziJiGj/W9M6WJYSgcYc0banqBANB0
         ehj5EMxkBgLiYaaQppRJ4EmojEjPRpB9y2ngG5G6xVgKT2p9n5hS8e2UrNdK2m0dg7zo
         jhfwEJGnHHIDHIDtvwAbD1jHuptUtcgeLBKyjCey1+Wd5f3om6eAtZ7h7sO1SFxBSVsb
         ARNw==
X-Gm-Message-State: AOAM531BT9eQ0UrgaejTIae5L4ChhcUPapLVlSqU/sPtCfMIwxT9ydP6
	KVQaiRQrs7s4n0EPaGiIrczDgG3+k2qR2m7Q/OAj2VOkq8oKW13oTCcE86Nl7tmEUSW6v0j0brD
	xgZ1gM4rc18fxaS7O
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id r11-20020a170906280b00b006cef3c7688fmr1473063ejc.468.1645693822149;
        Thu, 24 Feb 2022 01:10:22 -0800 (PST)
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id r11-20020a170906280b00b006cef3c7688fmr1473046ejc.468.1645693821991;
        Thu, 24 Feb 2022 01:10:21 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id h5sm1037267ejk.188.2022.02.24.01.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:10:21 -0800 (PST)
Date: Thu, 24 Feb 2022 10:10:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philippe.mathieu.daude@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel
 <qemu-devel@nongnu.org>, Laszlo Ersek <lersek@redhat.com>, Cleber Rosa
 <cleber@redhat.com>, Oleg Vasilev <me@svin.in>, Richard Henderson
 <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, qemu-arm
 <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Andrew Jones <drjones@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <20220224101020.2dd35c16@redhat.com>
In-Reply-To: <20220223115042.lvxgrjirr5avzkzw@sirius.home.kraxel.org>
References: <874k4xbqvp.fsf@linaro.org>
	<878ru2nacq.fsf@linaro.org>
	<YhURfqMvRT4xbiz6@redhat.com>
	<96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
	<CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
	<afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
	<20220223115042.lvxgrjirr5avzkzw@sirius.home.kraxel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: kfgjLerdVKhZ

On Wed, 23 Feb 2022 12:50:42 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > > Also, "make install" installs these EDK2 images, which doesn't
> > > seem like the right thing for "this is only for one test case".  
> > 
> > Well I'd prefer we never had them installed. Today I don't remember
> > why it ended that way.  
> 
> Probably to behave simliar to other firmware, which makes sense to me.
> 
> So maybe do non-debug builds for install and debug builds for the test
> cases?  Why do the test cases need debug builds btw?

wrt bios-tables-test, it doesn't need debug version and should work fine
with non-debug builds.
(if memory serves me right it's this test case that prompted to add
uefi images to qemu)


> 
> take care,
>   Gerd
> 
