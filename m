Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp852498njb;
        Mon, 9 Sep 2024 02:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbH7/XLv10Fv5eCv9dbGjEmNcWgwDxyKx96avMdxx2cbP1TpVh8+Q2ts+DNFYrb6av/oM8dJcW2xTvdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHoUeDo97I9TW9DTgCzAXIpeP2IKZVs1Kglds1asu4LiYtyldSjan3TKwg394CpCYr6rzgJ
X-Received: by 2002:a05:622a:3c8:b0:453:6d98:4802 with SMTP id d75a77b69052e-458201df98cmr116889761cf.47.1725874389203;
        Mon, 09 Sep 2024 02:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725874389; cv=none;
        d=google.com; s=arc-20240605;
        b=UTF8WWRcpByGqNVKGtIWASvpS9uW8mCoRifQySeqw88pWZ0KTXydH+NtIJHOBvZIjg
         nAb5JDkmu6Vwaly5qsTM18SoDlhuVKkE5ppx5o2onAFlB4Z23MF4kxA82zPLPQPbDVdD
         M8pFEP60bBI2sNiJp2+NVpma0nKfmrl2SNalxzWyn6HYMLp5WfzFqAsKcqRp+18pYbDe
         ui0VqBUgtF83PFoRtDz/rvyMQ2vQpEZ6BllSGTTMHragbIvpkbBw0Eak/QxhDXUsP4ze
         EPu/1XBq0m5SOrKSj4mOi1bDq+LFhx+XZf43ysMG/R4Ht8Exe7BGuux9LrHC/qxx3yDQ
         1PwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Zp3fMx02yjuxBxyLnCz8moKM20upWbpFrJDtxAa470U=;
        fh=uUeRj5pEjHLoVBfiLQ0nVagfVGZ1iMgq4y9nWfWnUpU=;
        b=HeE/SUlyknqj65TydS77QT59gdzwazqu2flJZs8NxMUNB5IOsoURiNRMvbaE6wRWvl
         nEBbG48zOC9toGB3PkMZRY8QfdA2FI4EIiFS+50UiBsj/45p5OjJoIkOJv9GkS1sWnXh
         3J/8s1rrpSnqfmZCA7ziJUNw8MHIuk4rlMhuvUwH7nI6xg7ULUFnb5f1CxlCp61zDO2F
         gVJ8sAb8UKOXMflZVUsgzU2EiPAbVWfm6ojE1QGsv4No9YTmEGyhDRKrdUjjHjnSssUJ
         lMnIINbmyzdnkRoz8s3iB97Uay9tSv8y9dWAWJOyk1Sec+fU5IuOPuoeNxvl6ExiSGiT
         SBZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JiJ7ZqFE;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45822fa6c7dsi51485821cf.548.2024.09.09.02.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JiJ7ZqFE;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725874388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zp3fMx02yjuxBxyLnCz8moKM20upWbpFrJDtxAa470U=;
	b=JiJ7ZqFEaJp3gYNND31Sh5n4/PEd/LNbX6l8bj9jl0q93moq4ke6HahSD4UbP8e3f2+Vtz
	f6V/ZA3q00iDXNS0a/YRg2KYyM29lPtBMvwK1lQUQHwsVpD1OcQAvRwzZMUeJ8dkiPVNLx
	7La463v1behtVJLiudwmHhibkvVazhQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-t1KvnuyKPJaCpllU2xLNIw-1; Mon,
 09 Sep 2024 05:33:03 -0400
X-MC-Unique: t1KvnuyKPJaCpllU2xLNIw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C057F19560B1;
	Mon,  9 Sep 2024 09:33:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.146])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BBCB30001A1;
	Mon,  9 Sep 2024 09:33:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id DC8B81800D70; Mon,  9 Sep 2024 11:32:57 +0200 (CEST)
Date: Mon, 9 Sep 2024 11:32:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: qemu emulation for USB ports of Allwinner H3
Message-ID: <xgwmp3mjq2vhhwgbkbjr76o3yejkbm2ke7ybfes7xbafmpha53@pihh3myr7h7o>
References: <85f61ad3-da14-43f7-983c-62053ce0cfa6@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85f61ad3-da14-43f7-983c-62053ce0cfa6@roeck-us.net>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: 2VEjrtGMUEOW

On Sun, Sep 08, 2024 at 11:36:18AM GMT, Guenter Roeck wrote:
> Hi,
> 
> the Allwinner H3 USB port qemu emulation creates separate USB ports
> for its EHCI and OHCI controllers, resulting in a total of 8 USB ports.
> From the orangepi-pc emulation:
> 
> # lsusb
> Bus 005 Device 001: ID 1d6b:0002
> Bus 003 Device 001: ID 1d6b:0002
> Bus 001 Device 001: ID 1d6b:0002
> Bus 008 Device 001: ID 1d6b:0002
> Bus 006 Device 001: ID 1d6b:0001
> Bus 004 Device 001: ID 1d6b:0001
> Bus 002 Device 001: ID 1d6b:0002
> Bus 009 Device 001: ID 1d6b:0001
> Bus 007 Device 001: ID 1d6b:0001
> 
> The SoC supports EHCI companion interfaces, and my understanding is that
> it only has four physical USB ports. Does the real hardware instantiate
> separate EHCI and OHCI interfaces (for a total of 8 USB ports), or does it
> use the companion functionality ?

Well, on the guest side you'll see 8 ports even when using the companion
functionality.  Each physical usb port has one ehci port (used when you
plug in usb 2.0+ devices) and one ohci port (used when you plug in usb
1.1 devices).

The main difference is on the qemu backend side.  When using the
companion functionality you have a single qemu usb bus accepting both
1.1 and 2.0+ devices.  When not using the companion functionality you
have one usb bus accepting 2.0+ devices and another usb bus accepting
usb 1.1 devices ...

The guest-visible difference is an per-port bit in ehci registers which
controls whenever ehci or the companion manages the device plugged in.
This bit exists for backward compatibility (guests without ehci driver
can manage all devices via ohci, with usb 2.0+ devices being downgraded
to 1.1 compatibility mode then).

> If the real hardware only instantiates four USB ports (or, in other words,
> if it utilizes EHCI companion functionality), would it make sense to
> reflect that in qemu ?

Yes.

take care,
  Gerd
