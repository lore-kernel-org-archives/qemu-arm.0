Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3158182njc;
        Tue, 19 Nov 2024 02:08:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3oqYe0QTb6W/2PE+7sHL/O68zOKSW8tO4FzN02EukfJAxFovsoVXQKdjKHAZ69W9mnuIaj/WUmWz1Vg==@linaro.org
X-Google-Smtp-Source: AGHT+IHwplVDx01oDx5UWDp/EmZhGj4GjmnchghjPMVkRker7Ca8Dy5Rc8VPINvZOc7JSvvfplYo
X-Received: by 2002:ac8:5ace:0:b0:460:9ec3:1b80 with SMTP id d75a77b69052e-46363e247edmr214436561cf.27.1732010885517;
        Tue, 19 Nov 2024 02:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732010885; cv=none;
        d=google.com; s=arc-20240605;
        b=Emc99Be7dHL3BERD5IFgLrSYT7u3F99nVLQAs0VkE+klmEo5p28iBgLfJ1sR7KiONb
         WJYvvuBb9J7SA4HQ58Nmi8vGvloah550C6AIC1WRfbPKFgNzSsBXkfIpy2rxy5pwN9Cj
         YUGkp8salOLbTFZN+buIngMdiHIWBnYab74yvfZcaAhaGyr/FMCmFNmXj8MPLHZegDD7
         H2U9GsbjJu+z066VGMsXbHmIx9GpmTwSfJDw6OjN6Hf1cBVuoY5fNr0KFBl/sOxIji7Q
         UfCdGsMgd/OaF/aYxs18kqo0ESNne+w44/EMZZ6LGcStSMlUn5i0DjDeGM//I8j2I66b
         saWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=EE4wqLALh1JukcJI8ER9NZCO7B7PrveDzDA0R8EkxUg=;
        fh=30BWWxFEPRBRkwSS+WV8DjZjVENAIGl+6U45p3ia4cg=;
        b=R4n7yXYsMmZj+bZFv1PH7siMJb5HavapRqHl5rkk0jcWSi+0cop4zDmRaVHCtpTawV
         cYq1Tj99tZdtbANhLGZ41EBW0khDWFAzTRO+PoTMNjGCdDs2Y1HOXcW1V4z6mr/DgAYv
         Z20thyaiQn9FkTgm1QgobYQiTZdao7xAh8bAlPYSgo1+MKaMs0P3wEwQgmIGXJKajfj6
         8AeJKTb1ZYjkmpa5lSLNnC4iupufTHfm2jqIdBmPVEpe+TJjbSufjzo5/4wvx3jrsCb8
         aH8gtZadvQNJVDtAW4bPRChOU8r4Y2mfzUsvsqbBKqslghmulA86qIGYnSsFnJEbwCy7
         RcnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M+v2MMee;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46392c42403si19712871cf.388.2024.11.19.02.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:08:05 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M+v2MMee;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732010885;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EE4wqLALh1JukcJI8ER9NZCO7B7PrveDzDA0R8EkxUg=;
	b=M+v2MMeerucUlzxGPki9FecSHAb+xbviSM2hrhoDHiBp7pdTlXizAp+cXuza5qlpXH+qPC
	apU5uWq+DI3FgI7UWCqe/bFMZgjnKY23RSmxHZgMAKF5de6ZHmNgkWjkn++g+SHe1BFFhy
	/C0WAQ0lEcoCqi0rtp/FRf9PTyaaRqU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-wJ9gJcU-Mg-rHzWrel-G_w-1; Tue,
 19 Nov 2024 05:08:01 -0500
X-MC-Unique: wJ9gJcU-Mg-rHzWrel-G_w-1
X-Mimecast-MFC-AGG-ID: wJ9gJcU-Mg-rHzWrel-G_w
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7094F1956080;
	Tue, 19 Nov 2024 10:07:59 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58B0D195607C;
	Tue, 19 Nov 2024 10:07:51 +0000 (UTC)
Date: Tue, 19 Nov 2024 10:07:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/7] docs/devel: add b4 for patch retrieval
Message-ID: <ZzxjciUGNIVoUuVC@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-4-pierrick.bouvier@linaro.org>
 <ZzxXAtuRowg8hp9u@redhat.com>
 <47831adc-26f7-4633-a371-975c97e8dae7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47831adc-26f7-4633-a371-975c97e8dae7@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: bxO4LqRJ+TNV

On Tue, Nov 19, 2024 at 10:56:36AM +0100, Marcin Juszkiewicz wrote:
> W dniu 19.11.2024 o 10:14, Daniel P. Berrangé pisze:
> 
> > > +    b4 shazam $msg-id
> > 
> > I'm wondering how b4 knows where to find the mails for $msg-id  for QEMU ?
> 
> It goes for https://lore.kernel.org/qemu-devel/$msg-id by default or checks
> b4.midmask in git config.

How does it figure out to look at  '/qemu-devel/' by default  ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
