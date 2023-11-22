Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp224635ejx;
        Wed, 22 Nov 2023 02:38:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbNLdjD7TWw1UJzkD6ExA2cG+iMbDyN/jH8V+SXEZ7A7dSlQDUiYerbUcAHC22a+GQf4ax
X-Received: by 2002:a05:622a:1804:b0:423:7353:15e2 with SMTP id t4-20020a05622a180400b00423735315e2mr2290800qtc.20.1700649531001;
        Wed, 22 Nov 2023 02:38:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700649530; cv=none;
        d=google.com; s=arc-20160816;
        b=rRVxMcMtgbEIMuzRG57pjoyXlzL8T6SEYS/Tra7+PVFrTZt0gkszH+PejoYORI6a3T
         3hv1r0We8iaYZ3PxxW5auTBH8+RMCmRhVoUnV9L36qexT7SvGdozziPc/0gNWn8S0x6P
         eJnPPSM6730gl7OW0cKMigQeATE5KHBIeDbVQkiSxQO6ph4rRRj6zoWTLFUCP66tyEaV
         IRFRrIKiuZSAyfmtlvyTUI9BY0IpU6I1UP9w8hafq+EYv/ztUusaz1SI24gSGaHYIftr
         cLmmainCBbO8QGgO5vP9Oa4d6dTcitY3qPi0+eNlze1C8UGSZ+T3Pr3CqKyJLyGuSPX4
         yLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=WuprI4wwMpGYywoXLzdlYmBGZhawH04hckdWscLohrg=;
        fh=o0rsvylFI6a6sPmeSBtibOW58j7JDn7yXGyefdUUOFo=;
        b=rF7jArY3i1ox5Wa6weKzfthSR0dyw122IE9td7U6Isa5oKSn73hsdGHk/ieDs2doFC
         LMkTtFaWEm4ZwIUrU4qpnkp+ZpQVRJ6EiIgE46rIS6U73egEfsDnEgpwgYTPHFt13bQB
         VgM28lPVEDaMdIS/UqrYpg0UwKH/x/sAoDb+oD5nyxwLYr/25lnv30PJcqqZuXdiPqbi
         X9scw8DLtaSIVjy/7Z4Qnp7QQyU67N1LBAONr6Y6E9janCbMiD2Os92tcqGc1VtwsJGe
         MFsZUEV62lwBbDPkm1i7Jde2jxAZ+jZkXhtHf+3722ISu78ZYvxDZBbEID0mTraTv728
         uckQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VT4ase6K;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q13-20020a05622a04cd00b0041e314f160esi10990885qtx.643.2023.11.22.02.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:38:50 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VT4ase6K;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700649530;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WuprI4wwMpGYywoXLzdlYmBGZhawH04hckdWscLohrg=;
	b=VT4ase6K+ta/dgZM5UoytXw4gIgmQ10FDC9slMHH09QGN+oMkc7X1wYMqYGoydiOfZHL0h
	JS3VTOAzMpST7RoTr0XObHd9F09rMP6NMKrEOmfSMJ0hPxlHX5K+4tS4yWTvOwNTumuSAw
	vV0nZdCkAQhxQUTENabDhUgG57OBRZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-ElYpTiz8MEiJDUk5VYIWQw-1; Wed, 22 Nov 2023 05:38:47 -0500
X-MC-Unique: ElYpTiz8MEiJDUk5VYIWQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 747FA811E88;
	Wed, 22 Nov 2023 10:38:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 077A3492BE0;
	Wed, 22 Nov 2023 10:38:43 +0000 (UTC)
Date: Wed, 22 Nov 2023 10:38:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	qemu-arm@nongnu.org, Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH-for-8.2 v4 10/10] hw/char/pl011: Implement TX FIFO
Message-ID: <ZV3aMYohaUsg5gWx@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-11-philmd@linaro.org>
 <CAJ+F1CKFFU_VEA4nhgWw9RLDgc_gD0h-FPfvSP4LaFC1j4pP6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CKFFU_VEA4nhgWw9RLDgc_gD0h-FPfvSP4LaFC1j4pP6Q@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-TUID: DnF9UPi2SwPh

On Wed, Nov 22, 2023 at 02:31:29PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Nov 9, 2023 at 11:30 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > If the UART back-end chardev doesn't drain data as fast as stdout
> > does or blocks, buffer in the TX FIFO to try again later.
> >
> > This avoids having the IO-thread busy waiting on chardev back-ends,
> > reported recently when testing the Trusted Reference Stack and
> > using the socket backend:
> > https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=149574
> >
> > Implement registering a front-end 'watch' callback on back-end
> > events, so we can resume transmitting when the back-end is writable
> > again, not blocking the main loop.
> 
> I do not have access to that Jira issue.
> 
> In general, chardev backends should have some buffering already
> (socket, files etc).
> 
> If we want more, or extra control over buffering, maybe this should be
> implemented at the chardev level, rather than each frontend implement
> its own extra buffering logic...
> 
> Regardless, I think frontends should have an option to "drop" data
> when the chardev/buffer is full, rather than hanging.

Does anyone really want data to be dropped by QEMU ? Every time I've seen
a scenario where data has been dropped or lost, it has been considered
a bug to be solved.

Sure, we don't want QEMU to block on chardev writes, but we want that
more than throwing away data.

What's the use case for capturing data from the serial port, but throwing
it away if the other end of a socket doesn't read quickly enough ?

If someone does want lossy serial ports, they could configure the UDP
charedev backend already.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
