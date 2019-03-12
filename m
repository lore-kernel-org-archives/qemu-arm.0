Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp784549wrs;
        Tue, 12 Mar 2019 11:20:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJZBg1UK/Nw+QPejU4Sz7P/Kcv5yQLBcSC8tZirREl6cKsUxFLq/vn3LRHkPmMkTJT/ohD
X-Received: by 2002:a25:8b01:: with SMTP id i1mr20891818ybl.456.1552414852437;
        Tue, 12 Mar 2019 11:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552414852; cv=none;
        d=google.com; s=arc-20160816;
        b=unU3qCFp+2fyLNkG9nxwokVxW9JaMvvVSZ5tKhjGgR/BjLQQflatcH9a0CiCKIQ4G5
         Ggg4hT7GVHfV8GlxjU5SwEXAyg1Dvys+e412Kc8Q5iLqeExYAo8as8H5SPxbdRarMstS
         XZ77Z9K7rrtP+uQa1ycbLPVHiVOvOv5yf0zGuzttQD+3w1c5TNlRIr8qNmXn/0qzWTPz
         WeF6aRqWNwy/CDeirEFSGC2ry4oC327v8ffFYCZdQ7vPetlDjJOzrV8UZv+ikvLNnZ8Z
         OCVf2DiIGjFTFiwhO1H+wt6zgjxgt9xZKNyMbdMwN97uqHhBkFzio8roTX2dflz7w1P6
         e9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ehPEhSNmtwwoE/LnihzjhsNZOfUcHgqCKmTK9Y2RTI=;
        b=hLg4z4U0gPV9SUoGZgWDCLoZUwOeZCrqf/XX9AaCMNdUjnzVv7LyD3XUV/9S4xas8K
         +6ThPJW8VMfD1jc7jokgPqfEP2e7zcl7t+ZzT1Sl0fh7sA29H8Te4SjIHkDwlG8ICio4
         Cnzd8iJrPRZmPM53hgf9IJiSNZkc5mzd6WsvL0zcnfAlyUDQIq0AOkPba+jR19KxpmOF
         iXRs+PwE+rejmLuMxxlWr1RRRCBLi54XKrnxMmfS17f/48s/vtXcI+/ZBZzopci7bFZy
         VbW6Dk3U9+TVgGWPOxp3mu2sKv75/dB0of/d8Cpws1BIBVy4z3hcpRC8Sg4EWlXLaLu1
         7hPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N4EyInqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w84si4941187ywb.344.2019.03.12.11.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 11:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N4EyInqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3m1D-0002Xm-R6
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 14:20:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3lgb-0008RN-In
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 13:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3lga-000590-Fi
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 13:59:33 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:36157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h3lga-000588-9r
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 13:59:32 -0400
Received: by mail-io1-xd31.google.com with SMTP id f6so2922639iop.3
	for <qemu-arm@nongnu.org>; Tue, 12 Mar 2019 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6ehPEhSNmtwwoE/LnihzjhsNZOfUcHgqCKmTK9Y2RTI=;
	b=N4EyInqfBUhDVvDfsKnM9EjTaelWgPQ7YBE4hfhHEVCjMYh0iz83YFxgSEsZxTK9xo
	4DgExa/asEw/uzsJGLUkkKXXiXrLuVHnJtfJU8ktbZ7LsxIZQeFP9Ra4AMdhRqv5i9UQ
	bgPkx8S1cgxDSZBN62wEG93d8cJl1GC5oLt+lfchafN6c7VltuUwfAYF8gVG4J+qfEtK
	4xX2mwwCEuoQTygy6A3HLmYIwuuO1PDlqpffuNZXft2r2xIsRIit8IxRZ2tDxCi/koau
	DhNLYwvwrRlmmHaPoAbRPkzP/IyqdE2G2FH6HxyzUQu11CqFKJxqdOSod58JaznEbCzk
	QPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6ehPEhSNmtwwoE/LnihzjhsNZOfUcHgqCKmTK9Y2RTI=;
	b=ZGtaLYYCYfbRl4z0eBflKe3Y2nJyv3u5BJXoSWhWPjgYACm+hbeF9P7XIprERwKJeN
	h3kO0N2uWwk7OmkJ6x/tdvQmnl8RtNt1mrAvlxaPxH1m+c2ewi9DzKOIN1yK6nlxBOCm
	QhO5UF30A+BxaZaftlaKQRz6g3AhGjujwOKlcGlv0Susmprbuk+lmMICLAkEDJxHffTt
	mWiZvJSn/1DOEtLSQPfg3O4ptImrBB6+y1L567CoMq687N2w1DXxjJxHFtEjhBbEnvhM
	0P0zURMTWDM+4BoRqk8ekvSXHCxl4SgpDbLCWtwvJNZEQwVBYoEHQ3wdWbfnblHOcixh
	NACg==
X-Gm-Message-State: APjAAAW4YhypzHL0HYIChRjvvW06hGguUBH9w3N0plrFCrAvcsd325dm
	aE+M97GsNlvJqBzUjw/tIoGKZUk/Yk1VzMLmLGaPvg==
X-Received: by 2002:a6b:e305:: with SMTP id u5mr1160001ioc.262.1552413571343; 
	Tue, 12 Mar 2019 10:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190312071250.12168-1-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Mar 2019 17:59:20 +0000
Message-ID: <CAFEAcA8NwsWBtwKtxJ+rSf9mtrNdX+LMC3gHZpZjiX3ydSQ8Hg@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d31
Subject: Re: [Qemu-arm] [PULL 00/14] Audio 20190312 patches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, Libvirt <libvir-list@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Nhfk/rpZqge

On Tue, 12 Mar 2019 at 07:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit e2a18635a400b0e68679614132e9ef6316105590:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2019-03-08' into staging (2019-03-09 20:55:44 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20190312-pull-request
>
> for you to fetch changes up to 05d2f2a64dbcaa50370d344ab12081d776ed0f03:
>
>   audio: -audiodev command line option: cleanup (2019-03-11 10:29:27 +0100)
>
> ----------------------------------------------------------------
> audio: introduce -audiodev
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM
