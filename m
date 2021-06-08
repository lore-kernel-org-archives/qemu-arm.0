Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4479346lfa;
        Tue, 8 Jun 2021 07:28:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/X86Fj//mO0pXn1v4ob8SLPJnczSOU5DgtG3wnzsZYXBkhlgx+JAH9oPWbYLjphjTNng9
X-Received: by 2002:a05:6402:51d0:: with SMTP id r16mr17093812edd.138.1623162535812;
        Tue, 08 Jun 2021 07:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623162535; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsDWzGuP9lEUw57Z8qIHFNw56lDMW5Alyo1jMgJDbBktdCRGqG7W76992BrnJOflgj
         636j8W86kTa0bUN0BezKHiDPR/8dDiCs0VsBbNt9yn6irx8GXUWVhuZ5F0K1UYmu6Wkx
         8Gk8eb8+mH2WfHuP+NJIS2BM6C2FDOa3W2iEXfwgsfZyTn1FvmymE8EDJyfEnrfrdFiY
         aL76C1q2qO0XJXt1t1kq8K1zz0VWUZNZFpkynf0+8ZAtN45OGtihvM0bf6fcJ6914hq0
         2vOLQ528/ojj6i5WjwetbUzYRNf7IaKzVrIFB3GEjQp9srpAKTvz+7NkTn4xtaFM6mmS
         DBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=SvFFzQ5erFHu/4YZncKENyagsGcKE6uQKho12fNedr8=;
        b=erGc27YB6dmwD+qsOs+xHOQiFFaIxGvEjs2xqpo7S66vWbsE0Ym3pulfMwaYCoyAUp
         ktuLiFuxjc0vpHtIPdUdAkDiDeJpV22oZ0H5nU3uavnWciXUfXsNwDKDWvs41snQPaDJ
         vP3j9rXVbXiYwCjJ71InKb9+4KkH6uyUW3HcvE22qDNIyTl/fX6RrXIXQfVYIm/XS0Oj
         4LXabkbyHb4Em4DXiigt6vMg57QMxQ4U5f7eVYtPs9O5OyZ7AglIy09QWIn8tm4iTxiC
         p9Jb7pLm0mnVkEX9KCjcW4t1C4mGzNVUxzbcz33uo3q6fDxxQ6wtO4Whq1rFVWi734Gq
         VR+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BgTxf3OA;
       spf=pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id 90si11845960edc.44.2021.06.08.07.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BgTxf3OA;
       spf=pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623162534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SvFFzQ5erFHu/4YZncKENyagsGcKE6uQKho12fNedr8=;
	b=BgTxf3OAmqWunpwnSWeaBxUBhN+HOIqw+9qrKxcYwZoWxcx67FwjH90kJXnf0FzBcYLCkS
	yC6fXU1HtM7ziXn4OsTQ2AC2lEztrLhhIsxp9Hfy0xxf7pkUvoWaC8xhhYpYvaEqZ/4gy3
	JU4s/B//AEXCH8hDmT2lX2Esn1pQ/F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-vahISbrxO_-cNLvIpsnKMA-1; Tue, 08 Jun 2021 10:28:52 -0400
X-MC-Unique: vahISbrxO_-cNLvIpsnKMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 787DAC73A0;
	Tue,  8 Jun 2021 14:28:51 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A478860C04;
	Tue,  8 Jun 2021 14:28:50 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:28:48 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Message-ID: <20210608142848.szkxewltyc572piv@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
 <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
 <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
 <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
MIME-Version: 1.0
In-Reply-To: <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: +Zlr0IKqb7Gr

On Tue, Jun 08, 2021 at 02:39:03PM +0200, Philippe Mathieu-Daudé wrote:
> > 
> > Not enough coffee earlier. I think this is a documentation problem,
> > query-kvm returns a list of *runtime* accelerators:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg811144.html
> > 
> > IIUC what Paolo said, if something asks for an accelerator that
> > is not present at build-time, then this is a configuration problem,
> > not relevant for the management interface.
> 
> Argh no... sigh. So we have 4 cases:
> 
> 1- accelerator not built
> 2- accelerator built in as module but not loaded
> 3- accelerator built in & loaded but not usable
> 4- accelerator built in & loaded and usable
> 
> QMP query-accels returns "accelerator built in & loaded"
> without precising it is usable.
> 
> qtest kvm_enabled() checks if the accelerator is enabled
> without checking it is built-in.
> 
> QMP query-kvm returns 'present' as in built-in (so case 1),
> and 'enabled' (a.k.a. 'allowed') updated once init_machine()
> succeeded (so case 4).
> 
> So, again, IIUC Paolo, what he said is for the management layer
> 1 and 2 are the same, the accelerator is not present.

Isn't 3 in the same boat?  Really, the management app cares if it can
use the accelerator, not whether it is present.

> 
> For qtests, we want the 'usable' case (4) right? Whether the
> accelerator is builtin / loaded is irrelevant.
> 
> Could we improve the terminology here? Maybe is_present() and
> is_usable()? Suggestions?
> 
> Do we need to add both query-present-accels query-usable-accels
> commands? Is it actually possible to return an array of 'usable'
> accelerators?
> 
> Maybe simply add query-present-accels() -> [] and
> query-usable-accel(accel) -> bool.

Can you just make query-accels return both pieces of information?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
