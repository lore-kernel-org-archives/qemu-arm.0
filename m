Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4816879lfb;
        Tue, 17 Nov 2020 09:46:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFcxWPwkpJtcZ1k31xPdwQJOWcmmRAVDB5rtOdUZVXB3QWGDk3aFa6sKe0n6f2lkhB8bY0
X-Received: by 2002:a25:318b:: with SMTP id x133mr1203880ybx.201.1605635187584;
        Tue, 17 Nov 2020 09:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605635187; cv=none;
        d=google.com; s=arc-20160816;
        b=Q1NbSpmueIOswB78L9avh2hlEV1xiKnerQLcfCkU0/Glx/IZy7ikQ09o4IjIusir5G
         2i6voH0pqCFxPYmLee4PoQRvN32EvvPPN8b6kyoXB0WAQv/Ih+YWqiK/JlATLeiRf5YN
         tmDv3RJAq97X/CGjuC+haCl9n9i8s5uXrQXQzZtauyWC62ja9JdhUp+Z65/GJS7ALgCA
         zMKJKMntpfoSs875ltywIJOQBrz+q7xmYAryzclW4bTf/OhkVFNfyAF7yfj4PlevCySN
         XgZwuGybN00sfMqttmL0xi9difeGYLMF+wCuJB8mZC39hrthEaZYGG/0EdoJMGWYAMYF
         63fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=L5cJDQ/FpJ1c2TKZJN8q7TmMx8YZ6VjXFUGhVyTulzU=;
        b=GRNDRIeSid/IYs08EZE8ESA9p4og90MzOpCfau78c9RFdpA0WDVhUTQPYYuP36vSC8
         kLoORPMp5mGO/tJxlDGl3SaaHAH8x4OmZm8feE2sy9nbe5x8PGRpIOKvefvRY4iHfg9c
         QdASFtwbN1zmx1HONBoJaVSRCbXNd5QiXlyJdqG6/BwTEAAbDJDWmVfCU2vN2YK2Sdyt
         ORgapRKzTLc/hZd2K4Bi4xkKT/monb+u7hQGFBm5g7DKuxcqyBmmjuf8+za8MBP0NKqg
         MmJVyrEo2zTIRnaAE0ZAg/HUqlAYePxcFREn8LnQx29sV8SjQxxQSQ3WXU1uykrqCVMf
         dUXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gzv69WAh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id 1si20910535ybn.362.2020.11.17.09.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 09:46:27 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gzv69WAh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605635187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5cJDQ/FpJ1c2TKZJN8q7TmMx8YZ6VjXFUGhVyTulzU=;
	b=Gzv69WAhCl2y2iXgPYUYJkhptiR7oqme9+uOswuo6/7RMvS1NUCcS5bWQg+xsQIv8quywC
	AYfMxu1MLqOM9OqZwRYhFlJTepTz3qWK7nm8YD7D2HqFfJBAc+S3PPNFrObLeEOVjxsjOL
	IRV5EpTzIbtBOZDgzXLbQ2s9xEMBhU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-a-Q5qSRpOduFwWNS-T2mfg-1; Tue, 17 Nov 2020 12:46:23 -0500
X-MC-Unique: a-Q5qSRpOduFwWNS-T2mfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21CE864156;
	Tue, 17 Nov 2020 17:46:22 +0000 (UTC)
Received: from [10.36.115.104] (ovpn-115-104.ams2.redhat.com [10.36.115.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E11D210013D0;
	Tue, 17 Nov 2020 17:46:20 +0000 (UTC)
Subject: Re: Implementing GICv3 ITS support for TCG emulation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Pavel Fedin <p.fedin@samsung.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org
References: <87h7povsp8.fsf@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3600b038-15b3-06fc-17b5-7b7cf7298395@redhat.com>
Date: Tue, 17 Nov 2020 18:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87h7povsp8.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CSGmER0RW5ZR

Hi Alex,

On 11/17/20 5:44 PM, Alex Bennée wrote:
> 
> Hi,
> 
> I've been asked what the state of ITS support is for emulation. The
> documentation explicitly states that there is currently no ITS support
> under TCG.
effectively it is not supported.
> 
> Looking at the code it looks like there was a deliberate attempt to
> separate common and KVM related code. Currently the only realizable
> device (via its_class_name) is the TYPE_KVM_ARM_ITS device with a
> comment saying emulation is "not implemented yet". My question is what
> is left to do?
> 
>   - do we just need a wrapper akin to arm_gicv3_its_kvm.c?
>   - do we need to implement more logic normally carried out in KVM?
You definitively need plenty of logic implemented in KVM:
arch/arm64/kvm/vgic/vgic-its.c.  implement all the ITS commands sent
through the command queue. implement all the translation logic that
takes as input an eventid/deviceid into an lpi id. This translation
logic uses several tables populated by the commands: the device table,
the collection table and interrupt translation table. Configuration and
status of LPIs are stored in other tables. So yes that's a huge work and
amount of code I think. There are KVM unit tests usable for incremental
testing.

Thanks

Eric
> 
> Thanks,
> 
