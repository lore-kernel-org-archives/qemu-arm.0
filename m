Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp82369lfm;
        Tue, 7 Jul 2020 21:57:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznIRkUlzFP1yjyS1hbHNebYL9KTNzNh8pUyGsQ/Ac7sDY+gFCaX2xN89mPkAYd4a3IEBLC
X-Received: by 2002:a17:906:1b45:: with SMTP id p5mr49618780ejg.51.1594184278375;
        Tue, 07 Jul 2020 21:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594184278; cv=none;
        d=google.com; s=arc-20160816;
        b=t4jX736RhEmNnT5xg6J7C3cBxURbCtZuLkmpp+ydYpXmphvjns/ifAV8zqVLLUJypB
         I2IkZ7jByJae0cNT7mpvJP/g837qXKCCDUkPqG9u1seQ7rZF7QUhiDzM6hXHnfGErAYk
         zWaU/8Qn7XWhlw2LmAaSUgJPf+FlsiviEL2YiQUB9F6dkk9vLtjzNXCST0ZgZiFJnpQg
         GYNN+wAp2LqKLVnJo2ccyDACxo19vstu03WEWjeAi8G0vx9s/gEYM+z5/GlZTo1tnuwp
         uQmZ0Lyjszoq5Os96CbWZLM3E4OiF6EfXOAJREOE/nOIrF/GFm7yItDZNp5N9s24BHNR
         /bMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=smbKjRsU5i3KhKg3QbXzYi2KAz29ytP0Ea1NEY02NP8=;
        b=Z/zDH+LQwRB+WsU9WRgMXzV8ylDk01IRZ3jm1BVKTZpBioO4S9TvfjiAGJ+Ld6WJyk
         ArM3Q8ug+G90JHLb+fRANgHwNGV6y+sFLxHm3RFZ+DYnDk6ON285yaCDec3wNVPhtCa+
         WHA2ih+/V3ZNySSH7csZdHdF4wpTLL6JQVhbqA5AxyGp2HN4D+e1P11f1DMcv/w3BjCz
         wWx9GnU4IpeNFcskYguha1A1AkBtwrpomYs375aO5aF/4NxK2b8k94GEeEFn+lsBnjD7
         QPddc5x6g8JMzpTEAFg/IsgPi4jMMTiE8aMjtu63TAsQpti3VzfT4OQxKyav4cg49nTS
         KVBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdTQGRtY;
       spf=pass (google.com: domain of armbru@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id x18si16647032ejd.495.2020.07.07.21.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jul 2020 21:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdTQGRtY;
       spf=pass (google.com: domain of armbru@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594184277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smbKjRsU5i3KhKg3QbXzYi2KAz29ytP0Ea1NEY02NP8=;
	b=AdTQGRtYkxMxdMi7N+OJpjLOw2gM/FeKNF10wvxXWiBc5mZ9N68lz+XBmlI+eKbpgGYh7O
	UHSBh0HXv1pVpo1s3QzLojqxv7b0gFFkc9+GGVZXVmsUgDLrgKz8dLg/h5dOtlHeB6NaZT
	ZslBHCoohIXVnVg1yustcAPY8p9BzV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Pw-148vnOlaI8JRnwwDe1w-1; Wed, 08 Jul 2020 00:57:53 -0400
X-MC-Unique: Pw-148vnOlaI8JRnwwDe1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50A11005510;
	Wed,  8 Jul 2020 04:57:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com [10.36.112.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 676E271678;
	Wed,  8 Jul 2020 04:57:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B747E1132FD2; Wed,  8 Jul 2020 06:57:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Christophe de Dinechin <dinechin@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Dmitry Fleytman <dmitry.fleytman@gmail.com>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>,
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  qemu-devel@nongnu.org,
  Michael Roth <mdroth@linux.vnet.ibm.com>,  Max Filippov
 <jcmvbkbc@gmail.com>,  Gerd Hoffmann <kraxel@redhat.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Max Reitz <mreitz@redhat.com>,
  Marek Vasut <marex@denx.de>,  Stefano Stabellini
 <sstabellini@kernel.org>,  qemu-block@nongnu.org,
  qemu-trivial@nongnu.org,  Paul Durrant <paul@xen.org>,  Magnus Damm
 <magnus.damm@gmail.com>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,
  Anthony Perard <anthony.perard@citrix.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  Richard Henderson <rth@twiddle.net>,
  Artyom Tarasenko <atar4qemu@gmail.com>,  Alistair Francis
 <alistair@alistair23.me>,  Eduardo Habkost <ehabkost@redhat.com>,  Michael
 Tokarev <mjt@tls.msk.ru>,  Riku Voipio <riku.voipio@iki.fi>,  Peter Lieven
 <pl@kamp.de>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Roman
 Bolshakov <r.bolshakov@yadro.com>,  qemu-arm@nongnu.org,  Peter Chubb
 <peter.chubb@nicta.com.au>,  Ronnie Sahlberg <ronniesahlberg@gmail.com>,
  xen-devel@lists.xenproject.org,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  David Gibson <david@gibson.dropbear.id.au>,  Kevin Wolf
 <kwolf@redhat.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Chris Wulff
 <crwulff@gmail.com>,  Laurent Vivier <laurent@vivier.eu>,  Jean-Christophe
 Dubois <jcd@tribudubois.net>,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
References: <20200706162300.1084753-1-dinechin@redhat.com>
	<20200707102510.GF2649462@redhat.com>
Date: Wed, 08 Jul 2020 06:57:32 +0200
In-Reply-To: <20200707102510.GF2649462@redhat.com> ("Daniel P. =?utf-8?Q?B?=
 =?utf-8?Q?errang=C3=A9=22's?=
	message of "Tue, 7 Jul 2020 11:25:10 +0100")
Message-ID: <878sfu4n9f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2Z8wO39lsaVs

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jul 06, 2020 at 06:23:00PM +0200, Christophe de Dinechin wrote:
>> There are a number of unnecessary trailing whitespaces that have
>> accumulated over time in the source code. They cause stray changes
>> in patches if you use tools that automatically remove them.
>>=20
>> Tested by doing a `git diff -w` after the change.
>>=20
>> This could probably be turned into a pre-commit hook.

See .git/hooks/pre-commit.sample.

Expected test output is prone to flunk the whitespace test.  One
solution is to strip trailing whitespace from test output.

> scripts/checkpatch.pl ought to be made to check it.
>
>>=20
>> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
>> ---
[...]
>>  78 files changed, 440 insertions(+), 440 deletions(-)
>
> The cleanup is a good idea, however, I think it is probably better to
> split the patch approx into subsystems. That will make it much easier
> to cherry-pick for people doing backports.

I doubt that's worth the trouble.

Acked-by: Markus Armbruster <armbru@redhat.com>
