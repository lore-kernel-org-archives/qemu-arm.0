Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1588789njf;
        Mon, 28 Oct 2024 09:20:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJWTM5pi2Bl8fU95fL1f7XvYs6DvWpIUrssmaYehKWvb/iZJaG5dT0CAmXhxsxIYDSgG7pNdy10XjW8A==@linaro.org
X-Google-Smtp-Source: AGHT+IFVw60kz5cGfBGIS2Ze80HzdQ+y8Lk+BB9KLEr46ihCBqZZkqsP+XpPzXPMFvM+ONnPvhhh
X-Received: by 2002:a05:6122:169f:b0:50d:81f9:5210 with SMTP id 71dfb90a1353d-51015345061mr5638320e0c.13.1730132417597;
        Mon, 28 Oct 2024 09:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730132417; cv=none;
        d=google.com; s=arc-20240605;
        b=aW+HGmucVjGy7euYHLNx5Q9LkXyjJr2aAm0J2/GGaQyc6Gv0VdjrDcwJMyKmTNJbAO
         ckEDiT5IFR1qBk2dI1TRJckYbrdIYbLOK5jlZM6vBf5NH01IqowPAvj+WccKvNjHFJyb
         f5zVqZ1D+3GYe2AMTd/DgtcdNvlcXHHGfL18PuSLKLGYcbXNTHeJpTcVno2YeVShQfVB
         RIrr6aKEAsgDGq+wd3ZFv5ocZSPdwn7oR6KjWknGteykj3zLIXRDGMSPxozbnLGzSrzD
         S2jIeRoSZU69kYaoobAA3z+D3nNaU6KH5tNxFgfmWzIkjBsauxIYabIQSCCclL5BMNEg
         xxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=wEB65em+UxE9CbH8ToQp/Aqsq3Gdimrn9NbYT5ZTZiM=;
        fh=mO5mLvAWiI/Vzc9ocDpn3XHUeXwj+hxn2jU/ASzBbGY=;
        b=VFKQJ7jdREoIYBUhpCvjnfaiZ9qZV2PqQfFWR86CLa4bAZwpSiifwvCKij1Ouf7dt8
         JCx5SnmV5LedyTNVYfqoEOmIxfksGp7kKs8hcJzEAdqt6q8Kv5TLlvqEq/tTcyamwV40
         dlwre6hod3TFcJVIXeIsIT6JT5TT+TC/6a7B7zp5IwPVcYsB2u4MaRwTht5qtzTLAR8r
         0SPWhbzJ3I5BQ1dvub7b0Hcmz1IbKQ9i7pbWd3qCRHcgGB6My06vEIB2OvjbzIo98/+t
         +aIjcaTVsQppT6AQ+s4wCmezpnbZHzn7HaPekYygteSiBYXuykJbjyTnpJNdgJm9qlJ5
         E0vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hE7sbwXO;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-510047493c5si1658092e0c.132.2024.10.28.09.20.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:20:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hE7sbwXO;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730132417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wEB65em+UxE9CbH8ToQp/Aqsq3Gdimrn9NbYT5ZTZiM=;
	b=hE7sbwXOF6mimSfyq0IcPgWfHstaXsr/Jry+rIyvholmDZ8iBzM4yu9EWP13e+yJjV/8+x
	O2y3Bveuh1dBA9uPMY3io2jQ5LDJ0AahYG5Vk75M9atlW4s9FBNwAC+lZpHx1N0Irl/N0k
	7khs/rU4phy/FYeu5dafRq0bNmcvcJ0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-mT4IjqerP4OirGAA0p4R0Q-1; Mon,
 28 Oct 2024 12:20:13 -0400
X-MC-Unique: mT4IjqerP4OirGAA0p4R0Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E24C61956048;
	Mon, 28 Oct 2024 16:20:11 +0000 (UTC)
Received: from localhost (unknown [10.22.88.106])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A46F1956054;
	Mon, 28 Oct 2024 16:20:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [RFC 00/21] kvm/arm: Introduce a customizable aarch64 KVM host
 model
In-Reply-To: <ZxuwZw2plMI6dNyE@pinwheel>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <ZxuwZw2plMI6dNyE@pinwheel>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 28 Oct 2024 17:20:07 +0100
Message-ID: <87v7xcnqrs.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 55hjbiBRWl05

On Fri, Oct 25 2024, Kashyap Chamarthy <kchamart@redhat.com> wrote:

> On Fri, Oct 25, 2024 at 12:17:19PM +0200, Eric Auger wrote:
>
> Hi Eric,
>
> I'm new to Arm, so please bear with my questions :)
>
>> This RFC series introduces a KVM host "custom" model.
>
> (a) On terminology: as we know, in the x86 world, QEMU uses these
>     terms[1]:
>
>     - Host passthrough
>     - Named CPU models
>     - Then there's the libvirt abstraction, "host-model", that aims to
>       provide the best of 'host-passthrough' + named CPU models.
>
>     Now I see the term "host 'custom' model" here.  Most
>     management-layer tools and libvirt users are familiar with the
>     classic terms "host-model" or "custom".  If we now say "host
>     'custom' model", it can create confusion.  I hope we can settle on
>     one of the existing terms, or create a new term if need be.
>
>     (I'll share one more thought on how layers above libvirt tend to use
>     the term "custom", as a reply to patch 21/21, "arm/cpu-features:
>     Document custom vcpu model".)

I came up with the "custom" name just to have something to differentiate
from the currently existing "host" model (which supports a number of
properties that do not translate to id regs.) It is certainly not set in
stone; I expect us to end up with named models and a handling of the
"host" model which is more similar to what is done for other
archs. Maybe we can then rename "custom" to "franken" so that people do
not try to use it for productive work ;)

>
> (b) The current CPU features doc[2] for Arm doesn't mention "host
>     passthrough" at all.  It is only implied by the last part of this
>     paragraph, from the section titled "A note about CPU models and
>     KVM"[3]:
>
>       "Named CPU models generally do not work with KVM. There are a few
>       cases that do work [...] but mostly if KVM is enabled the 'host'
>       CPU type must be used."
>
>     Related: in your reply[4] to Dan in this series, you write: "Having
>     named models is the next thing".  So named CPU models will be a
>     thing in Arm, too?  Then the above statement in the Arm
>     'cpu-features' will need updating :-)

The currently existing named models are for cpus like cortex-a57; you
can use them for KVM if you happen to run on a matching host cpu, but
they only really make sense for use with tcg.

I currently think that an Armv9.0 or whatever model would make the most
sense, but that's certainly still up for discussion :)
