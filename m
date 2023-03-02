Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp40000ejc;
        Thu, 2 Mar 2023 10:10:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8CcNsLaiiSaBLpR8IUygM3BFseprwyuOQ1JXUUj+9DbGPy5JcLszmo8bWrUJfGz41fksD7
X-Received: by 2002:a17:906:4088:b0:8f7:68ca:c004 with SMTP id u8-20020a170906408800b008f768cac004mr12278510ejj.64.1677780611203;
        Thu, 02 Mar 2023 10:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677780611; cv=none;
        d=google.com; s=arc-20160816;
        b=X6EOYD+O6kukcVIu+nmM24T4Q0AoY5K3XoWKBjwyT9AHXD9EuP/h6t8jO4wEta1bzi
         U38joJu8kPwF157VsDwcDRMTXuySWOOZd8GIUO91n5S6o0+3Q8QeOqIbNKtiIf5S5Nwo
         06Yei1HUoK1SrqL8Lc1SW4UVoTuP8E8Rhqt+tspjtmxWW80OWB7Py5Xosn3Ipw5mhGbp
         z3IqE/IZxrudEtwYEvcf0yoy38MTFc+ywYfdhix7sy+R+vsLWpyOXmBPWL6LHOf7cFc9
         NdVnsOr4lm5lwzo2izuB51NXZ9zHbIaAB/FrkWlSOCAypmZ4VW3z2sfiVW+6yNl5eluJ
         9KCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ngKE3Va+D6TiTHVaZkVdc/7zS2c2sZqOpC+5wqr8Y4I=;
        b=zTp9zFAjDwloxoA5OURczqpHGPttW+kbHdT6v+D4THPDxui/I0pQ+HAhVKGn5EJ7RL
         xfNskzLVvdQB6SdroIicWtmoFiDSODls364QvH6/koGXTSU0cyY1+4Yl647paiUOg0Es
         +sOvves74Ymki5jyesCAiARDldgI5rHal3yJFjlb8rpfCznccb4BwpYwEVOmJCu+RRd8
         OwJhYvvREohR4bf6NSxBouczxg87C2d/Ol5C/3OCgt4mTmXA5vZqOnVEl2MbkP2eq5gS
         EtFKlEKpfarI6TkTrtXQ3Zg/iApUGhLf/DRjxvAm8h335WJ1bkMf1Xn3I+dy75GuUsiC
         +ioQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pa76C06h;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g11-20020aa7c58b000000b004bf9e2889ebsi328167edq.93.2023.03.02.10.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 10:10:11 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pa76C06h;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780610;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ngKE3Va+D6TiTHVaZkVdc/7zS2c2sZqOpC+5wqr8Y4I=;
	b=Pa76C06hpCy8+LlqEHKWu1iLT1MpTXNh8tZ2G9kOUlHLbLW4jz/GLXdaf1ht98Wo8WzRqy
	aRiWIJBxgii7Iek28MyoHJYfxi8LR2yI/hAkt//nD4FogIvn23yIt+jyW+sY8sW9woA5TU
	IZAZUAWKnYXKFPIYAKtvK+sLc8FWkL0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-1s8TYNS-Pt68aPSkZZ8vRQ-1; Thu, 02 Mar 2023 13:10:08 -0500
X-MC-Unique: 1s8TYNS-Pt68aPSkZZ8vRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5517C101A55E;
	Thu,  2 Mar 2023 18:10:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B83421121315;
	Thu,  2 Mar 2023 18:10:04 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:10:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm
 system emulation jobs
Message-ID: <ZADmebAnfclbRoXI@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-7-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-7-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: 85ln0mUnwtUN

On Thu, Mar 02, 2023 at 05:31:06PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit arm environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 14 --------------
>  1 file changed, 14 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
