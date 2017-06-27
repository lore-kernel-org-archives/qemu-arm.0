Received: by 10.25.227.6 with SMTP id a6csp1523734lfh;
        Tue, 27 Jun 2017 01:32:37 -0700 (PDT)
X-Received: by 10.55.137.6 with SMTP id l6mr5104013qkd.83.1498552357690;
        Tue, 27 Jun 2017 01:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498552357; cv=none;
        d=google.com; s=arc-20160816;
        b=RC8+eONpniixr5bBD0WV5tswGkzaKWTEEVPxiHN8505XbQi5KmQz9uwJ1rbEYtP0hw
         6LwUJyKbq4LfDiu9MREtsk/EtP3m+EI6H1dUXkE4y/J8KjpKfr5l+gvSafZMMKbgJNlk
         91iCZO9abznDDZGQ+lqCjy260OHLvW8kGAQb1I9nrDY8L8klnnaA29S/nqF7mhDYvlUv
         7Rme794N9PgWZHLOMV//OmM2XTfzxAG26FgCFlrWX8kxGYM3vrkBm+6Ytz5hWKdOWNSI
         8c2TTJGwJdysTKxR015OHqmd6jRQYx2mBwqnwjITOeV6jy/URcVYW7MKDT9bUXFa24J3
         RlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=KauxbBuduXgndZ4f1qtSskmLfC37g7pDYBlDyfg1guE=;
        b=RL/zQJve6q+VMTmhTm4ekmqr06m0Ul+x+/Tb69qQq2jUqttzA7Wq/Wm6aNLJ49A/dt
         ugz0B7e7toHAaDZU3DW4ZlrHHk5vWGPG7ynvqF3JmG3Rxb39SAsun+QCC5lb4JWV8vkO
         XLFHEHhuiKLX9az4ru07ytiQygx6pr4cgI3lc1m9THrpOtNzOijqmFo6rl58BrKBYqVQ
         wbUvKRE+B5JLpVLzoWtp9lvjDnjeXW8uRu4dKI1TK8egcZUGClMjOu9+HTA8Jy9B/jzd
         s4qRTvR72yVs4Y15bicZOyW5Wq7PTH17Y7gMk97mflMQjvKxBQjefUOuHsQhwmzKmREJ
         ajOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u64si2219925qka.284.2017.06.27.01.32.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jun 2017 01:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 901DAC04B92C;
	Tue, 27 Jun 2017 08:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 901DAC04B92C
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 901DAC04B92C
Received: from nial.brq.redhat.com (unknown [10.43.2.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CDA47BB1A;
	Tue, 27 Jun 2017 08:32:35 +0000 (UTC)
Date: Tue, 27 Jun 2017 10:32:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 patches@linaro.org
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 0/4] cpu: Implement
 cpu_generic_new()
Message-ID: <20170627103234.28631eec@nial.brq.redhat.com>
In-Reply-To: <20170627023348.GU12152@localhost.localdomain>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
	<87a84uyj2q.fsf@linaro.org>
	<20170627023348.GU12152@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 27 Jun 2017 08:32:36 +0000 (UTC)
X-TUID: qU3Az/P0qUNa

On Mon, 26 Jun 2017 23:33:48 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, Jun 26, 2017 at 02:28:13PM +0100, Alex Benn=C3=A9e wrote:
> >=20
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >  =20
> > > This patchset adds a new function cpu_generic_new()
> > > which is similar to cpu_generic_init() except that it
> > > does not realize the created CPU object. This means that
> > > board code can do a "new cpu; set QOM properties; realize"
> > > sequence without having to do all the work of splitting
> > > the CPU model string and calling parse_features by hand. =20
> >=20
> >=20
> > Just going through my review queue and I see this needs re-basing. Is
> > there going to be another rev or was a different approach suggested? =20
>=20
> The right way to go is not clear.  We know we want to remove duplication
> of CPU creation code, but probably we should first refactor the -cpu
> parsing code, so parsing happens: 1) only once; 2) earlier in main(),
> preferably before machine->init() runs; 3) inside generic code instead
> of arch-specific code; 4) preferably using the QemuOpts parser instead
> of the current strtok()-based custom parsers.
>=20
> After the parsing code mess is sorted out, writing a generic CPU
> creation wrapper will probably be easier (and safer).

Also there is legacy cpu features parsing/handling in sparc target,
so we might need to clean it up and convert to property based features
(as have been done for i386) before making generic cpu creation.
