Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5647933ejc;
        Tue, 28 Feb 2023 03:27:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/KyR8jDI0f+lJ0mIPUQcvGke6Nl91Z9wIRKHlFIs62pcZBUmuP2g+nJ72Ou9gNSdOMHVI3
X-Received: by 2002:ad4:5c4d:0:b0:56e:a07b:f4df with SMTP id a13-20020ad45c4d000000b0056ea07bf4dfmr5238849qva.13.1677583671565;
        Tue, 28 Feb 2023 03:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677583671; cv=none;
        d=google.com; s=arc-20160816;
        b=psXIyA+VcCdIzguqAxEoAknwrgOqIpjui7EbUxbHmkikZBLpFDp91eV3KB3UWKJYWq
         KD8yTq+4+uuhiFf3HQgQ/osad1Ki3D+Nl/svZBObcHNTw8i0y6AV95FyqHtTaczHzoY3
         4/rGHxFl2PF7ih5urMd6ipx/k84o9bpuJ+Qbkm5IRQ5CiNWys2BooxauDhsj0UttUQLG
         tyXbnAXieo+6BvwSia0wKZYFs+Adtqji2MB/9JZ5ZM+myFir861Nud2Fh2BDt9WR54NB
         1ohX9c9vDSnsWBZpEKlcs3Ca7KkZZo1GWj4lEbbGjZYemMTaJ10NgFUdwDccnnz+IE7A
         DoqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=4suh5lAbunuzTA9D1mz35nLVNbBw0W9grJdGWlluzWI=;
        b=qrh1GVWRWVwYCkd71GFhvGMBvpB+2MTxlkzdUyRLTIx2AtaHyrE0CCKht58Qtu0h3B
         DR810313ziu7aZuVY1f9deUX8f4vqKzIK26AhmFcMyC3qfTRYlI5J/cpPp2oe+hHoldx
         w1u8pgH8D157jhhZZpRFyA92arZX+VNP4mGCZphJXyNzOjjn7g4qRy392zDupMtP0U9X
         htH+ituNKqOadoHyJAcX3kw+CkhFDs/h+TUKTi5laUIZOOHOEyp7zDA2LOvjZgcTiK9e
         FNfJkBE5ZCRJ27nNQx4sIjuWmk/AbHPIzZBYrWs6Vg/WvkqZlReXxkAeUYrVp3VQXHiD
         xxLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R1tvVJAw;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c145-20020a379a97000000b0071dbc4b56besi8017965qke.591.2023.02.28.03.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:27:51 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R1tvVJAw;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677583671;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=4suh5lAbunuzTA9D1mz35nLVNbBw0W9grJdGWlluzWI=;
	b=R1tvVJAwh0i9LsxFmfOnrVA5nU8+FNqZInNqesyUI49pJAy1xtWc8+MyfQSj0Fjrwb61Ic
	VhjV6SNsLWyNJDfWUvWbdR8Hwfrby44ECdavywer34+0MWu1QLJyrQPbc3N1+jkgzlq0VP
	9+5CNsi9rfweFNMFYX+ilmQdoeLd+/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-2t4bR2lEM160Ab5hxW9V_Q-1; Tue, 28 Feb 2023 06:27:49 -0500
X-MC-Unique: 2t4bR2lEM160Ab5hxW9V_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 370BA18A64E0;
	Tue, 28 Feb 2023 11:27:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA5A9404BEC5;
	Tue, 28 Feb 2023 11:27:46 +0000 (UTC)
Date: Tue, 28 Feb 2023 11:27:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <Y/3lMFQl94rwTAR4@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
 <20230228055016-mutt-send-email-mst@kernel.org>
 <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
 <20230228061853-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230228061853-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: 9cIL8GXy3SAq

On Tue, Feb 28, 2023 at 06:24:02AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 12:12:22PM +0100, Thomas Huth wrote:
> > On 28/02/2023 11.51, Michael S. Tsirkin wrote:
> > > On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
> > > > The question to answer: Is 32 bit x86 worth its upkeep?  Two
> > > > sub-questions: 1. Is it worth the human attention?  2. Is it worth
> > > > (scarce!) CI minutes?
> > > 
> > > 3. Is it worth arguing about?
> > 
> > You are aware of the problems we're currently struggeling with, aren't you?
> > Darn, we're having *SEVERE* problems with the CI, the QEMU project ran out
> > of CI minutes for the second time this year, and you ask whether it's worth
> > arguing about??? You're not serious with this question, are you?
> > 
> >  Thomas
> 
> Yah just couldn't resist. How many minutes do we use per month btw?

100,000 wall clock minutes lasted about 2+1/2 weeks this month, and
similar in Jan too. Last year we were managing to get through the
whole month on 100,000, but we got backlogged with merges due to
the xmas / new year shutdown, and catching up is exhausting our
allowance too quickly, as well as natural growth in amount of stuff
we're testing per job.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
