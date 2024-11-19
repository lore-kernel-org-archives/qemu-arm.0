Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3136775njc;
        Tue, 19 Nov 2024 01:15:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVIwjSp57/sFtML3sjqcG7FGEXDYM0nF+vXU4BSioDRZ5L1VdyrcSk0AU+HiFGtS7x5dLeMvr0J2m6/Ew==@linaro.org
X-Google-Smtp-Source: AGHT+IG4xqwYkrv4HtOgG+lhwD6iFegM1dM7oWbIDlvrtX9T11o2jQTD4dNhxNdqJYVMVHpYxfiK
X-Received: by 2002:a05:620a:489a:b0:7ac:dd88:cc80 with SMTP id af79cd13be357-7b37aa270ffmr412833685a.8.1732007702502;
        Tue, 19 Nov 2024 01:15:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732007702; cv=none;
        d=google.com; s=arc-20240605;
        b=R98nK55kCKQ/uurgwXKorUSIY1CIvayZ8FGQDROJrRhxAHBdx+gyesM7TnM2sJeGOC
         BwuVOa1ibl36VdKDMKsbMnWQxK/mPq6pyEwV1nbxQxDMNef9rHFmSBBOAd/goChc690k
         Ie+fDKL0DBqn5lrJTqhRnHBLHzS56rcDG7AH7eo6sMj2Wgm+cPDM9g0HVSQnoJYjybEp
         NHbCC0sdnj+ac0JvzuLWgwpqxSfJMEp/X8tDj8OeknNQzgAVhbBPTALOZokRuip2DHH0
         V78xIR1slR+PxiJZNMlo3GjHHwCd1CNs/wfFCFUorunLrxjiw0UENM5uaZNU0dykvOXQ
         seTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=98NPj4J60QqOveqcuJWt6u02CJSv2wA5n6N1Msl2s70=;
        fh=WJz52vBu+3z+gNkVlP3Z86wMXoTAqIijq+liUzcSZqA=;
        b=SMZgW4nLEhEsk6H1t9LtfIYwi/fzvHYLGLnrx28uojkF7RPOYZIoaW5nhxISUaLDFv
         291J8Nh2weJ1K71tyESM+WztPf6wAPa73AIdi0417W+SfDSzT1ssk0OBEJOU+BPMuVS+
         2q0X9Ib8IsXvmnooahFKz3RDg01FJN7SzsdANuj49zo7OnMQxgAoM5aeFw8wt4iQJ0D9
         UfYJTDUoVEHyvUN9JeoGgHw5287lyKdugnaQQCJZZ4mmqiVdpGk6q/De1EH9UN0RTbgM
         nlsNwOQdiJ3QwQPCtkNPz+78GTFahyJK1UlMWtdbCezv7g6b2AMIVWvFMEeWbPXVcXRp
         pwjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GubucmMw;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b37a8ad9c8si191925285a.701.2024.11.19.01.15.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:15:02 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GubucmMw;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732007702;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=98NPj4J60QqOveqcuJWt6u02CJSv2wA5n6N1Msl2s70=;
	b=GubucmMwIPzBb6UiAF/DJcB61mp9GmGOcaPuUR191KwYy8YBba3JAV+h9J6FebGOO0l+VQ
	3ffzEZTVd/Pa7x+SFU2+euam1w+BXg0RZx3ZV5nu8xbAic2adUd2NsGd7QO+AYabopFHaQ
	ejByQqaT+/bm4v3voxrzP0nuaXgwMFg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-348-a_B0eLs8Obiy-Ffe1QWlKg-1; Tue,
 19 Nov 2024 04:15:00 -0500
X-MC-Unique: a_B0eLs8Obiy-Ffe1QWlKg-1
X-Mimecast-MFC-AGG-ID: a_B0eLs8Obiy-Ffe1QWlKg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB5241955E94;
	Tue, 19 Nov 2024 09:14:57 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0EAB030001A0;
	Tue, 19 Nov 2024 09:14:45 +0000 (UTC)
Date: Tue, 19 Nov 2024 09:14:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,
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
Message-ID: <ZzxXAtuRowg8hp9u@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-4-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118172357.475281-4-pierrick.bouvier@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: XAWYEzvLZa3g

On Mon, Nov 18, 2024 at 09:23:53AM -0800, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  docs/devel/submitting-a-patch.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 953682f20cb..d25c677d996 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -417,6 +417,16 @@ For more details on how QEMU's stable process works, refer to the
>  
>  .. _participating_in_code_review:
>  
> +Retrieve an existing series
> +---------------------------
> +
> +If you want to apply an existing series on top of your tree, you can simply use
> +`b4 <https://github.com/mricon/b4>`__.
> +
> +::
> +
> +    b4 shazam $msg-id

I'm wondering how b4 knows where to find the mails for $msg-id  for QEMU ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
