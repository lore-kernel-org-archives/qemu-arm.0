Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2301926ejd;
        Fri, 19 Apr 2024 03:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4UhrqJjziBK0HKpP6Cf56LY9ogszdATcQ4W5OsMXw2IzQLTwwoV9ywTtLd71LvcfMQUUyl97dPoxwsYv94mTFKkJP70oJ
X-Google-Smtp-Source: AGHT+IGB7eA2VcMxJXrQteU7fMC4Zb3335k6/nqTLa+4B6igS7+xbgKz0zX8/EIjILO+lBIub3pN
X-Received: by 2002:a0c:e4c9:0:b0:69b:62db:568b with SMTP id g9-20020a0ce4c9000000b0069b62db568bmr1888642qvm.2.1713523705039;
        Fri, 19 Apr 2024 03:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713523705; cv=none;
        d=google.com; s=arc-20160816;
        b=eNuQlZKexiZ3IMXCTO75MEq5q9FgY3tO9GCrZCzVJJvHt//BSL+2jRTD3HW61HA23b
         e+R7yQz/8JnQtbYI9+NXuSla5tEg5I0yF9Apj86EO/EzMxxXhCh2ioZudJKQSGEc8hZA
         JLlAX7A9J3q/kVffbE6bSyIA02IRXSCeQTbwtSxxJFRaI5Dfp/X4qWFEd3Wt8C6ri3KS
         bBjvzpA8sHRVGMonvX68C9n9fS4lW1nOtG3wwokPXNhaROxy0RRd4KD3CKo1ufEPigAd
         4SXDxkXLJN0FDhEQXJZkyhXVg//ppVS7sVemk6z+VYXdU9Mia4hO0b4mk2AV/a0+LI7k
         8eQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Sg6K/rRO2To4g107/x+JAmjRmx1nTbi6aqy5giKAOmI=;
        fh=kHe4oOIiJXCj93bGuIDJpuyTrA8zD9KzD+Beic4cKng=;
        b=yzWXDjmLj8Thvs0wuVTPqgQlrhq4QzJNTaEDz40QogOWdGnyClsz3cXciqo4nj24tI
         9mQI3aWUBioJ2bbFuJLy0PBEg+8bAGsucTP8NZI/L1WAkmrKfcJZeYUzwRHMxlAl/WL+
         Y5iq1EW1QqgcLC0N600kMEyJ9rS0fDlThzj4JNuI0u4tTA9dBO9aFpReE9YAh1kPepwu
         6x1gAtt+QA0qEu7pFlkaK1Ww8SGnbsfskrCANPG6ek7B8HgJjmNEBugFkz5fZ9uAYFZI
         m5lEDRR4fTjOBueVbIN6Fg7TKfMyQ/LienFbXDQXrPBvItCp4B4JbWnaIihTMBlGS6KK
         u5/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QaaNxisZ;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id r13-20020a0562140c4d00b0069b52646a51si3562496qvj.195.2024.04.19.03.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 03:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QaaNxisZ;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713523704;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sg6K/rRO2To4g107/x+JAmjRmx1nTbi6aqy5giKAOmI=;
	b=QaaNxisZiB0wCbI/VqboebetFjht76RwJYekBRiCDk49ua49oGlXjvWyswWdNz97IW68we
	kKYaALTIn92SkPIJAN4k1JJF/DyxwP+es6mNqFGtWaGXUa76lGQ+pZ8+mBMs2LFCno0k1s
	mUZY5iVV7914cO/q+j9l+YTufCwpZUk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-aV1J_0-NNQCJRvG5GwWVNQ-1; Fri,
 19 Apr 2024 06:48:19 -0400
X-MC-Unique: aV1J_0-NNQCJRvG5GwWVNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 852F63803922;
	Fri, 19 Apr 2024 10:48:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.112])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC49E18209F;
	Fri, 19 Apr 2024 10:48:16 +0000 (UTC)
Date: Fri, 19 Apr 2024 11:48:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Subject: Re: [PATCH 00/12] misc: Remove sprintf() due to macOS deprecation
Message-ID: <ZiJL7rjlWw4t-kPo@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240410160614.90627-1-philmd@linaro.org>
 <c4c8f2b8-7ef2-4b2f-a9d4-8c1e64668570@linaro.org>
 <220fddca-0017-79c9-ec1f-23bb8a68728c@eik.bme.hu>
 <1c6cc7f0-a0c7-43c1-aadd-d4c8d76354d2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c6cc7f0-a0c7-43c1-aadd-d4c8d76354d2@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-TUID: 47ftzOX9enP3

On Thu, Apr 11, 2024 at 11:38:41AM +0200, Philippe Mathieu-Daudé wrote:
> On 11/4/24 00:27, BALATON Zoltan wrote:
> > On Wed, 10 Apr 2024, Richard Henderson wrote:
> > > On 4/10/24 06:06, Philippe Mathieu-Daudé wrote:
> > > > Hi,
> > > > 
> > > > sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> > > > resulting in painful developper experience.
> > > 
> > > Is snprintf also deprecated?
> > > It might be easier to convert some of these fixed buffer cases that
> > > way, if allowed.
> > 
> > I had the same thought as some of these might also have performance
> > implications (although most of them are in rarely called places).
> 
> I thought GLib/GString was recommended for formatting (IIRC some
> previous discussion with Alex / Daniel), so I switched to this
> API for style, rather than thinking of performance. Anyway, I'll
> respin using sprintf() when the buffer size maths are already done.

There are places in QEMU where the strings end up living in a fixed
size struct fields, and those would be candidates for sticking with
snprint().

For stack allocated string buffers, it is preferrable to switch to
g_autofree + g_strdup_printf(), unless there's a compelling performance
reason to avoid allocation in a hot path IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
