Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2607925ejx;
        Wed, 13 Sep 2023 01:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqRbJTvJtlsaHfwBhaKd6bmEtIb2Y1+iNKBvihyl4SSr67J/RQvM5iDkgz5rTq+1DKy5uH
X-Received: by 2002:a05:620a:4103:b0:76c:bdbd:c51d with SMTP id j3-20020a05620a410300b0076cbdbdc51dmr2105428qko.66.1694592389230;
        Wed, 13 Sep 2023 01:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694592389; cv=none;
        d=google.com; s=arc-20160816;
        b=GqCB3jHlkRZOMmwusU4QBZcf7MV2y2o/PKQsohKmRyFJRSaOvgfgnrX3RkdKfXw3cV
         q2xuzvxvmz5DHfBLXMAWldlzcjtAGlvyAXGrvYY3GyNmMTQ1xRxoMMIWuoVilvV1VptZ
         uwWen3IXPtOL5HWqEdScNV39w48vBkDWqMUbD0IXLfmiRV9qna5GJjN1SX24QQzdaL4i
         SL1f8eDRhHtuxK9EecgtsqqaPpJ+0nbS8wjy9kCXkam3ryhWkUQ1eMuyeHxSbuHku6Fn
         ycR6FP8jxgEQ7qf8sFHna+JUZexwrs2eRXuLm56GHZBmv4JZY7+dZaSDs8VMa4sHDWLL
         r4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=2vypmGGO542FvhC+rqHXoTq9LwoWe2+pNCM7zeyfaQw=;
        fh=vR87uYwr80CnifKeXZwkfhQUOL/xfGQv6DM35jDbtX8=;
        b=T0MnFoSwDB6L2y2NIMihbp6sqgLKggZDPs+vxAVOh/lMERjGIYdljKp8vilLam1TJa
         pue/JGL3crA5bfuRBBmW7FZe0uD3sGNc1kYG74b4uZI8CWDinf3ko0fDtK62S65G66Ma
         eyhIiBbdCEmYxQ35Q4Ap+mWguDUMzZRR7dxJ1AdO6nIZEti0VexYfK4dNVl/gh/GvM1L
         zBAEY2S5myE1DLS5rYKQv1j4/yDWMmZ5i1qyMCu5mlZgiqkolkJkAShpdWIG3sOx8m0T
         BYgHvrl2ab3FIE/f2z3R+Mc5jzD0FnMTAyJga8nkeQIXw/qOGWL4/xDS56FjqyIBGySd
         /w5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XIs7tP9T;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w20-20020ac87e94000000b004121fd7e15fsi7207906qtj.631.2023.09.13.01.06.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XIs7tP9T;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694592388;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vypmGGO542FvhC+rqHXoTq9LwoWe2+pNCM7zeyfaQw=;
	b=XIs7tP9TPVj91eCEY2ar3w5DxIlMfJhoUBApY29+Bh0P/LJR40j7vY/sI5qTr9ZZApErB8
	nGgibwzxshqFK0tpQe/9YXaKsyNSdnN7vgMTvCVHNRHokdzrmoMiSgSd0z29HtQ7kVmvFv
	+VQXonUo2guGo7n1+QEeaHB9oMv18bM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-qA9ymuBYOx6QTK2s39N2wg-1; Wed, 13 Sep 2023 04:06:25 -0400
X-MC-Unique: qA9ymuBYOx6QTK2s39N2wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 929B91818E43;
	Wed, 13 Sep 2023 08:06:24 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A0D2156721;
	Wed, 13 Sep 2023 08:06:22 +0000 (UTC)
Date: Wed, 13 Sep 2023 09:06:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/4] microbit: add missing qtest_quit() call
Message-ID: <ZQFteR+kBmMzK7v2@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
 <20230912184130.3056054-2-berrange@redhat.com>
 <61724857-2edd-e19b-aa37-23658cd4119b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61724857-2edd-e19b-aa37-23658cd4119b@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: oSdn0iNZ8+lZ

On Tue, Sep 12, 2023 at 12:10:19PM -0700, Richard Henderson wrote:
> On 9/12/23 11:41, Daniel P. Berrangé wrote:
> > Without this call, the QEMU process is being left running which on
> > FreeBSD 13.2 at least, makes meson think the test is still running,
> > and thus execution of "make check" continues forever.
> > 
> > This fixes the regression introduced in:
> > 
> >    commit a9c9bbee855877293683012942d3485d50f286af
> >    Author: Chris Laplante<chris@laplante.io>
> >    Date:   Tue Aug 22 17:31:02 2023 +0100
> > 
> >      qtest: microbit-test: add tests for nRF51 DETECT
> > 
> > Fixes:https://gitlab.com/qemu-project/qemu/-/issues/1882
> > Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> > ---
> >   tests/qtest/microbit-test.c | 2 ++
> >   1 file changed, 2 insertions(+)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> But I think that it's unfortunate that we have to remember this for each test.

We should use G_DEFINE_AUTOPTR_CLEANUP_FUNC for QTestState, and
then we can change tests to declare

   g_autoptr(QTestState) qts = qtest_init(....)

which will make it a bit more robust against forgotten cleanup.



We register an ABRT handler to kill off QEMU manually during
g_asserts().

The "death signal" code will give another layer of robustness
for exits too on Linux and now FreeBSD.

If we really wanted to we could add a 3rd layer of defence by
adding an atexit() handler, but I'm not sure this last one is
worth it for something we're not hitting frequently AFAIR.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
