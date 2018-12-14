Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1868596wrt;
        Fri, 14 Dec 2018 02:23:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wf+oetGj4sEp7cIuw6NtuCem2D+X5fWIC+OpTRvAZEZKHRdKqxU1p2PGFW4uy4MKnud4JG
X-Received: by 2002:a0c:ad9a:: with SMTP id w26mr2086859qvc.39.1544782980348;
        Fri, 14 Dec 2018 02:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544782980; cv=none;
        d=google.com; s=arc-20160816;
        b=B/FA6NxwjY5I7LsS2jfe6x6d+LRUq+j6SDlevMifqvwAEgL0EX1QqnexVU5jc/FucW
         aJLNn0TJUnuDCHKZUhwh9w6+QZulSagsbChKFi12cFZ94tX35jx12HbkWqwS6gGvWwx1
         ApHhLChMmuHdbHc8L10gyoSR2M5dJt2hTwSNzEOUKDBSqklIYZ3/MRdlzL1SuELrYXM4
         j4tq0XZAK69EKoIp6s7dOR7Y5ST04c4IMMn5PTqSiXuKSAUBU4itUSle4OdpFSGJ0Prp
         QchfNjGOF55RShRDkKy9OccrkBh6EW5350Xqj/5Uf2Rt3V/CdVX4+vOqRu+Q/BAye/nT
         xRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date;
        bh=BeYQZzmSJEQzdyJtuysmcO0Bd5ptTm1bw+Mc8EkzSGs=;
        b=DvVj+Yv0ddYfjjONQuFrb5Zdsn/1jP/I9auQcD1NctAlM0rZCE1rJKicAqY4ylrVg/
         vzlqy6RuauE7yDv9vraVjAt3deETKQKpvv58rsrysHnQHuJRvL7D1bW87KVXqF2JmCBd
         VMzkRkC8Yz5gN+8VVf/KBu3Cbd8bPys59MTo1E8DRyyimKGZx3LPMhRPwi0XVp48phb+
         VWhxgrNUfUiJdboFOUrYKfdDK+xcH0cfAYU83fBIp/tMQ9TRuahQtVu4qnSK3WKtwe5A
         urTDaE39GGWf4Z6OHkksdW/JTDk86dMBJQbLVS9mQMi9Xx/yrwvi2S3cPaKi1gy5WCud
         zlKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g24si509064qvb.43.2018.12.14.02.23.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 02:23:00 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C32FB80F7B;
	Fri, 14 Dec 2018 10:22:57 +0000 (UTC)
Received: from redhat.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CF6F5C257;
	Fri, 14 Dec 2018 10:22:14 +0000 (UTC)
Date: Fri, 14 Dec 2018 10:22:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Stefan Markovic <smarkovic@wavecomp.com>,
	Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Fam Zheng <famz@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"open list:bochs" <qemu-block@nongnu.org>,
	"open list:Stellaris" <qemu-arm@nongnu.org>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	"open list:ppc4xx" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a few
Message-ID: <20181214102211.GF4265@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 14 Dec 2018 10:22:59 +0000 (UTC)
X-TUID: 8935Dt0fi8Mp

On Thu, Dec 13, 2018 at 11:37:37PM +0100, Paolo Bonzini wrote:
> Most files that have TABs only contain a handful of them.  Change
> them to spaces so that we don't confuse people.
> 
> disas, standard-headers, linux-headers and libdecnumber are imported
> from other projects and probably should be exempted from the check.
> Outside those, after this patch the following files still contain both
> 8-space and TAB sequences at the beginning of the line.  Many of them
> have a majority of TABs, or were initially committed with all tabs.

>     crypto/aes.c

Since you already cleaned some tabs in the previous patch, and the
rest of crypto/ except desrfb.c is tab-clean, I'd like this to be
fully cleaned too.


>     ui/vnc-enc-hextile-template.h
>     ui/vnc-enc-zywrle.h

The VNC code was historically heavily tab-damaged and we've
progressively cleaned it up when making changes. 

> The following have only TABs:

>     crypto/desrfb.c

I'd rather like this to be cleaned to finish the job for
crypto/.



> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---


>  ui/vnc-enc-zywrle-template.c               |  4 +-
>  ui/vnc.c                                   |  4 +-

That you've finished tab-cleaning of these files, reinforces to
me that we should clean those other vnc files listed above.

None the less

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

since those ones mentioned above can still be done as a separate
commit to this.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
