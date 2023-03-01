Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6644125ejc;
        Tue, 28 Feb 2023 23:35:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8wLUG52ROm9Wle6mpq5SpFFbLX6y3NoUMxIzC2iTDuyCv7V3nZl3MIYubQN2/eebJFKNFF
X-Received: by 2002:a05:622a:1106:b0:3bf:ca04:3bc9 with SMTP id e6-20020a05622a110600b003bfca043bc9mr10726474qty.5.1677656126378;
        Tue, 28 Feb 2023 23:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677656126; cv=none;
        d=google.com; s=arc-20160816;
        b=QbY2WLw0ehwQMKF2DhTIQ9bMhXAV4pWqe2rWa17za8etXRpbfMl+LwNvJMUoAOK+UW
         AFihXI9JUOOQMJTfC1I0jBfg6IOC9AAOGCH+40z7wgLUeftclIJU/rmpjB27nxE5B3Oz
         cKFnsYPYFzCz2S5t3zqdVKSOvLUBwmxRLRba6nCvH06HKId3ygv+wEBZIb/kxaRtBQ0m
         PLujFaDSUKc0YcVy6fHRujvu/ys1S3AhjfMo5i19ClnZ2ZMTljwLVq3BkSUVsXZjoYX/
         SbT9aQBQqiQHOZ1Kid06aJWonF8DLgfCf5x1ByUJDywNhX/RQuga9QKTjpPuYDy7g9+8
         u88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=HYF4RCZ3NLX6x5O6feGJIHu2VDXXKtj8N3eWJ+tbjLE=;
        b=xL/zvY4gezI8oPTgaT91ndR9oGMFOEhDHXomFEBnIIRYItMfNx0BLqYYSpUx8bH7wg
         Z/F+b98XEuyZu9/vfS5OTH5h31EiVShVocZdQ26dkVWMGD/tyl/+EpyWU9Qg2xqbfC9F
         Ygko5IZ/DrjWsDsPocRmyjFzNzbkQfEBap7D6w9cRK5mojLQdl0+T2dPFCGaxvnb3Arb
         9Ov6eBlsJbt/c3uNJKoSJtX1QvxYmLX+yDYygkeETi84ahYihQ2ijL0aAn3fijXieAX9
         /NeG/oC2VLH2/iC/EUVdzN7LAZBsTRqIehOIWomE6NyrGLDKyi5PRRmZVI/7dZp+KL6v
         DSbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBwCCX6d;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x1-20020a05622a000100b003b8685d014dsi11270563qtw.229.2023.02.28.23.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 23:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBwCCX6d;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677656126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HYF4RCZ3NLX6x5O6feGJIHu2VDXXKtj8N3eWJ+tbjLE=;
	b=fBwCCX6dROBcieNBmZchJWcZR9zgvBnvtWy91P0kC4lLjO+vakiQER1x1BvVzptGYoHFjy
	/vhdin06l6vo8rcaoMfRsGmp3wfXorNa0sxve94ro056tB2N1SimIdypoYPAbGY3gjA6rQ
	HGB+6QvwTt5iQIPdVomtH18xOCuaKLw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-RI74EMrUNE2QrJP1w4yKng-1; Wed, 01 Mar 2023 02:35:22 -0500
X-MC-Unique: RI74EMrUNE2QrJP1w4yKng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33D0918E0925;
	Wed,  1 Mar 2023 07:35:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0751C400D796;
	Wed,  1 Mar 2023 07:35:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DC27621E6A1F; Wed,  1 Mar 2023 08:35:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  qemu-devel@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  qemu-arm@nongnu.org,
  Maxim Levitsky
 <mlevitsk@redhat.com>,  libvir-list@redhat.com,  Richard Henderson
 <richard.henderson@linaro.org>,  xen-devel@lists.xenproject.org,  Reinoud
 Zandijk <reinoud@netbsd.org>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
References: <20230227111050.54083-1-thuth@redhat.com>
	<Y/z4rwv09Ckhbtfp@redhat.com>
	<001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
	<Y/3C+jC3Lk5MJxfu@redhat.com>
	<99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
	<20230228162938-mutt-send-email-mst@kernel.org>
Date: Wed, 01 Mar 2023 08:35:20 +0100
In-Reply-To: <20230228162938-mutt-send-email-mst@kernel.org> (Michael
	S. Tsirkin's message of "Tue, 28 Feb 2023 16:32:43 -0500")
Message-ID: <87lekg53gn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: eq58AyqumwS5

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
>> Well, without CI, I assume that the code will bitrot quite fast (considering
>> that there are continuous improvements to TCG, for example).
>
> We have lots of hosts which we don't test with CI.  They don't bitrot
> because people do testing before release. This is what RCs are for.
> We did releases before CI - it is a cost/benefit thing.

Dropping 32-bit x86 from CI feels like a no-brainer in the current
situation.

As to deprecating 32-bit x86: the people by far most qualified to judge
the "cost/benefit thing" are the regulars who are bearing the cost,
i.e. the people who are actually maintaining it.  Their opinion should
overrule any "but somebody out there might still want to use it".

Maintainers, please state your opinion, if any: aye or nay.

Richard tells us "the maint overhead is large."  Makes me think he's in
favour of dropping 32-bit x86.  Richard?

Peter seems to be reluctant to drop 32-bit ARM at this point.  Peter?
