Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp289491lfb;
        Thu, 9 Jun 2022 01:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSdTcHb85IHRMSGqup54X3MfnwNRtvnZ4mWAC88iizFtyJd35jdh0W+ufyqtWdacWtXxmx
X-Received: by 2002:ad4:5aec:0:b0:467:cb5d:c280 with SMTP id c12-20020ad45aec000000b00467cb5dc280mr27294076qvh.101.1654765069050;
        Thu, 09 Jun 2022 01:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654765069; cv=none;
        d=google.com; s=arc-20160816;
        b=zJ1d0Sc5Z2AgfhvjzB5IhKohxuaHdQ18Q/ODLrAnZTasA9Gn237KchRTOJd6VBy8bq
         j8mGRxTBTrua3LI0ulLHX1jgU+LwkeRog8FVx1uZVSFuSVLFlfN/Y97Hj4lPZM4YbBph
         +q687ZHW4OT7HvnKfIICwDJbd/8N4E7HX0gFnvCONpuWbd1iXxWsV/X9FwuXwbSlni7R
         fNewBclXX1/hJU3JPR2G9LPLX9J7aEef/3539EqOTdx13D1bh8MfZpDtLpMLCyEzEB9U
         kry1VfKcgY9i+jaKgAaMeOgGrvR2MYsLXGPRhQlAzKH/Tui/wW3VROmS0V9QibbF5MN+
         Kikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=+Amsd0AoymkbUWequQY81Msti8gG+grDOfS9h8imk2s=;
        b=1CRc64ddN6Motjpq+Yg6lk5TBYoE2sZhDeA3EfdhYe6qm5Q35X0nZl2fejsTYjL3hd
         sRY8lUZxJ8fQOdC7ji0/4L8uoMBHY9jugi235yTl9JP7k5h9UToSEsGggdEAxd1C1yHX
         E4H8Jx+maZTyJsbCxJP+oQeDuxA8dn4jxYaZEKDyGVS9Fb+7yCvX7tnTe6JpeZftzoZP
         aomJ2axB0eH3+14+iB8GSimPw7DprUjBq+qSCOgZm9w8I8PLnJBrrbqR008dB+vxK9iN
         a33HScqCth/fKjRcnX17RByrdD7c8LYKGEZG1oaJyTwlO/9NfHG75DCXsaLETtN2SQlr
         Zgmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MHqg/KIV";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y11-20020a05620a25cb00b006a34aa27edasi13334919qko.496.2022.06.09.01.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MHqg/KIV";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654765068;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Amsd0AoymkbUWequQY81Msti8gG+grDOfS9h8imk2s=;
	b=MHqg/KIV/vW1UIPWXP8Ev2EBuoMtrxs6EQkHuDdvziAX+5JeKzeRvBtYViUhKpI2tr9XaW
	FmOh8MQuugRdyNSyZ9qsUJhn9Nl9wmGI8uvMwIfCTsZGqiCmv8qYk0fHK3k+MpdHDIzx2l
	tXVWEYhkNy6VAe9ekRSPC5kZ50Ft43c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-CuLvEevZOsChvm-uSgJC4g-1; Thu, 09 Jun 2022 04:57:45 -0400
X-MC-Unique: CuLvEevZOsChvm-uSgJC4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEBEC100BABC;
	Thu,  9 Jun 2022 08:57:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF1A1415100;
	Thu,  9 Jun 2022 08:57:42 +0000 (UTC)
Date: Thu, 9 Jun 2022 09:57:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
	qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Message-ID: <YqG2Anwtba+MfxfH@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-TUID: MsmlMyNe1NU/

On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
> On 08/06/2022 17.51, Paolo Bonzini wrote:
> > On 6/3/22 19:35, Thomas Huth wrote:
> > > On 03/06/2022 19.26, Claudio Fontana wrote:
> > > > On 6/3/22 18:42, Thomas Huth wrote:
> > > > > The disassembly via capstone should be superiour to our old vixl
> > > > > sources nowadays, so let's finally cut this old disassembler out
> > > > > of the QEMU source tree.
> > > > > 
> > > > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > > 
> > > > agreed, one thought: at the time I added this thing, I had to
> > > > add C++ compilation support,
> > > > maybe something we can now drop if there are no more C++ users?
> > > 
> > > I thought about that, too, but we still have disas/nanomips.cpp left
> > > and the Windows-related files in qga/vss-win32/* .
> > 
> > That is pure C++ so it does not need the extra complication of "detect
> > whether the C and C++ compiler are ABI-compatible" (typically due to
> > different libasan/libtsan implementation between gcc and clang).  So
> > it's really just nanoMIPS that's left.
> 
> Ok, so the next theoretical question is: If we get rid of the nanomips.cpp
> file or convert it to plain C, would we then simplify the code in configure
> again (and forbid C++ for the main QEMU code), or would we rather keep the
> current settings in case we want to re-introduce more C++ code again in the
> future?

It doesn't feel very compelling to have just 1 source file that's
C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
file - perhaps it originated from another project that was C++
based ?

The code itself doesn't look like it especially needs to be using
C++. There's just 1 class there and every method is associated
with that class, and external entry point from the rest of QEMU
is just one boring method. Feels like it could easily have been
done in C.

Personally I'd prefer it to be converted to C, and if we want to
add any C++ in future it should be justified & debated on its
merits, rather than as an artifact of any historical artifacts
such as the code in configure happening to still exist.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
