Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4645468njb;
        Thu, 12 Dec 2024 01:10:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMvZWLSBAxbn7i9Ajm86O5biPF1XvFStpzAlaxpcJ79jtw8sgbFejlO04sY/myCi1aTJGZSrz9jxrh5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH7zXsifL5uZnvsT7aUMJ1l1AzYbT0NunmBNTdOVebvmWELFoVx9ffRE/r/1R3/e6qNfvzn
X-Received: by 2002:ad4:5ba7:0:b0:6d8:8a0b:db25 with SMTP id 6a1803df08f44-6dae3b904f3mr32235446d6.21.1733994640937;
        Thu, 12 Dec 2024 01:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733994640; cv=none;
        d=google.com; s=arc-20240605;
        b=awZAIWyFe2o1lGv2IWGOsHiUcdR2ksacGrzr3VZ+f91QhoERFyPsdKAw5tG6iMHR8q
         +cidv++Q7mnLHSVzj7zw4D9kJomvDLo9BiVOrLzWCrT5/ECb382rBCX66cJGaQxYiwFw
         kqoP6/FcscOQRC5Nmk4K6SiiVwgQZgjdF2PYjqvhu+CIYVwisUXHybRRIm/hpr56MWDH
         INO1FaQTkRCbRFZHLgp1JsSUTExDnce26GZkgOUFi5Tz31XpjzFG4feFn53RG8QhnFCw
         t2uVRnjmyWu2Ud3tKyHmfWB0jVOughonEs/ErWc+CMm2a1DeOxUSspswkQ9yPS4MOQgy
         4ZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=BWZwaMWBF+qhMXgC83nMQPjAmVE6GP4sG+b/wKGZGzE=;
        fh=L+nfXQ5OZtwX3ugPZ82RDlGti7Ep0kyW5+tENYD0C3w=;
        b=IJA4zswPluAQ9fNCKwkmnkibK2D9DYOI59R6ZZBH2mJcOXHeSpprgQ3cWo2FTzrkJq
         rCC3tD3jqHyVq7//4nnxWNKqe8wmhxZuPHOmJfo64eYvy23+Zn3deE4QPLyYnBiLdmRt
         gUjyadBzgA0Gs5ZbjHbtKnKuaWsySnzbIZa1SDgP7Ad2YjURTImd/vTG4M1UPFxplLIk
         jCRA46VHuwDyo/ZyriBKZNZprymCYOw7t7gvQIVHckQGMMd27ezqVeV3yXycZ4tgVZ4j
         vutmtpZJTuuMFksxJV67/7NP0IiZqtMW9qDMRGJN9+LF9WudPoDFT6FbdjAvosA24jFR
         kGYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M6lA10Kb;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac47c42si188126936d6.561.2024.12.12.01.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 01:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M6lA10Kb;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733994640;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=BWZwaMWBF+qhMXgC83nMQPjAmVE6GP4sG+b/wKGZGzE=;
	b=M6lA10KbTTaR96AC7Nh/q57LvQo6CDgHvZ2TkAIFYxW4OzLK7fFuwpwoJJ9iTyCN1ffR++
	vnT93Iw/Lu5j+vyH0gkroriphNSCci/PF0AEHLs8U22V4g17sBVBpvdi2pw3IwgFMfM3vy
	0D0BDdoPtpHwHp/3cGViBxFe0+9vKwU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-iVBGIs7YPNuEYk4MjaSRCg-1; Thu,
 12 Dec 2024 04:10:36 -0500
X-MC-Unique: iVBGIs7YPNuEYk4MjaSRCg-1
X-Mimecast-MFC-AGG-ID: iVBGIs7YPNuEYk4MjaSRCg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCC9C195604F;
	Thu, 12 Dec 2024 09:10:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B36BE195394B;
	Thu, 12 Dec 2024 09:10:26 +0000 (UTC)
Date: Thu, 12 Dec 2024 09:10:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64
 KVM host model
Message-ID: <Z1qoa8yXscTSAJ9e@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
 <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: nv5ZzvF1lgY1

On Thu, Dec 12, 2024 at 09:12:33AM +0100, Eric Auger wrote:
> Connie,
> 
> On 12/6/24 12:21, Cornelia Huck wrote:
> > A respin/update on the aarch64 KVM cpu models. Also available at
> > gitlab.com/cohuck/qemu arm-cpu-model-rfcv2

snip

> From a named model point of view, since I do not see much traction
> upstream besides Red Hat use cases, targetting ARM spec revision
> baselines may be overkill. Personally I would try to focus on above
> models: AltraMax, AmpereOne, Grace, ... Or maybe the ARM cores they may
> be derived from.

If we target modelling of vendor named CPU models, then beware that
we're opening the door to an very large set (potentially unbounded)
of named CPU models over time. If we target ARM spec baselines then
the set of named CPU models is fairly modest and grows slowly.

Including ARM spec baselines will probably reduce the demand for
adding vendor specific named models, though I expect we'll still
end up wanting some, or possibly even many.

Having some common baseline models is likely useful for mgmt
applications in other ways though.

Consider you mgmt app wants to set a CPU model that's common across
heterogeneous hardware. They don't neccessarily want/need to be
able to live migrate between heterogeneous CPUs, but for simplicity
of configuration desire to set a single named CPU across all guests,
irrespective of what host hey are launched on. The ARM spec baseline
named models would give you that config simplicity.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
