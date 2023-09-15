Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1092789ejb;
        Fri, 15 Sep 2023 02:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFlzoXcr7+zCT1amzaLcLhix4wGRQipEb7sPwxnz5SY7zzZXUDgkJDdVknE4FSdff6d2wK
X-Received: by 2002:a17:906:5354:b0:9a5:7887:ef09 with SMTP id j20-20020a170906535400b009a57887ef09mr910184ejo.32.1694769909198;
        Fri, 15 Sep 2023 02:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694769909; cv=none;
        d=google.com; s=arc-20160816;
        b=pEpr+gSQCaZaE/hOEK+Aa6JHgCtqcSWCF0ElaWefoQsdMvqWdhyY+PYFdqU5WwyfUi
         U6ymMO9OQdhWS96yTghvyNf/vZtAOFqJ+nwXvUeEqZvHl1FtZ2Ea7DHBRaCtNoouMVJ7
         SOBww+qX9ATWeB1kk9riVaiuz/rYIKfmaYpAbnqafbES0m+JG0/rndb58mP5bF2CWjHI
         N1WVw2k7Qxh+nwUDFs1cczYNS+f3lyA7fOTfXQGavrcqpNKyp++eMI9ZiobNqY1ydA09
         qm95u8o+3iKOA5Ox4USjjQiA7sigwJrg57jMMu+aBEY0C4mnYVxeD7ZD83mqnNFEAiGA
         7Kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=4H9wIAfq41msNjg2DE7GCoUtDs+LbPwE+lEcVLE14ao=;
        fh=BwzHYUuenO0Ne3/SAKcDZ+NJ+hnspXUwS6dR8/vdcqs=;
        b=IeEAi2CpY3OcoSznNzHsd84iOv3vlxPkXgsCf5IWCAvcUjDPkzLd+6R3UZ6O1n88QR
         LCRy6X14oXZIbzDjxe4i+eJsDOH7IZK+jWpifF10+IuxGhhDIXBN0m64lMmPnNc5qi9g
         +aXQ+EJYIIzqSzR5ULkAbXCs/ryJ21THqFPRCz73Bj6KO5V8LS+qcxbhWky1X9bmziPh
         MOStR6u/YVNAgMLwwTtCafSL/IdkJ6qcBKJsEe5Jjzup5BH2MyKahTdtld/dRc0cpiz1
         wXJ1vM3NinRipEmQZBXMB5jUbA9nppQw1DzAmoSnAWwsVTXOMVhdJbKc9WetXxohWFNq
         SZ3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L+2TKXPf;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o8-20020a1709062e8800b009930c0374basi3158573eji.632.2023.09.15.02.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:25:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L+2TKXPf;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694769908;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4H9wIAfq41msNjg2DE7GCoUtDs+LbPwE+lEcVLE14ao=;
	b=L+2TKXPf8ntR0T34cBkLQD0SdwlYz7T7DplWNpCoCKE0qFnsl7cQvPA2t0r8AalvpKqkEE
	dkzKdR3fP1DUe7IPqlqHKrjXhOH1O/d0qMhZtB1RJ3pmlfn/gIqaVcW+mHtF6ll1r676UI
	s38Ox4+DNy3KEySOeKnhKiNeiE4V+JQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-yM-49QsPNtiqcUX8YTXd-g-1; Fri, 15 Sep 2023 05:25:04 -0400
X-MC-Unique: yM-49QsPNtiqcUX8YTXd-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1493B185A79C;
	Fri, 15 Sep 2023 09:25:04 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4584940C2070;
	Fri, 15 Sep 2023 09:25:00 +0000 (UTC)
Date: Fri, 15 Sep 2023 10:24:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/9] tests: update Debian images to Bookworm
Message-ID: <ZQQi6n+3mp+bQIgu@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-2-alex.bennee@linaro.org>
 <30ac04ad-eb02-90ad-57ff-089538413602@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30ac04ad-eb02-90ad-57ff-089538413602@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: gzkOgokaLq3b

On Fri, Sep 15, 2023 at 11:14:29AM +0200, Philippe Mathieu-Daudé wrote:
> On 14/9/23 17:54, Alex Bennée wrote:
> > Bookworm has been out a while now. Time to update our containers to
> > the current stable. This requires the latest lcitool repo so update
> > the sub-module too.
> > 
> > For some reason the MIPs containers won't build so skip those for now.
> 
> Debian removed mipsel:
> https://lists.debian.org/debian-devel-announce/2023/09/msg00000.html
> https://lists.debian.org/debian-release/2019/08/msg00582.html ...

Wwith our general aim to support latest release, plus the previous
release (capped to a maximum of 2 years), we can still consider
mipsel supportable in QEMU CI by sticking with oldstable (Bullseye)
for the mipsel containers.

Once Debian 13 comes out, however, we'll be discarding Bullseye
from CI and so we'll be unable to do CI for mipsel. At the very
least this means we'll consider mipsel to be downgraded in terms
of supportability when that happens. We might then consider
explicitly dropping it as a buld target entirely, as the writing
is on the wall for 32-bit OS platforms in general...

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
