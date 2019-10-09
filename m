Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1260850wrm;
        Wed, 9 Oct 2019 11:20:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwomnPxkhatkyoKrOK7m7lNuVeXRTef7M0mLI5VVrQYo0Ah9jBbpdMotmIlKe1t5mMhbh2o
X-Received: by 2002:a17:906:264f:: with SMTP id i15mr4166445ejc.333.1570645234821;
        Wed, 09 Oct 2019 11:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570645234; cv=none;
        d=google.com; s=arc-20160816;
        b=irvvBmgWa2hWP8MlbjMi2G/7DqHDcUEi9xrJkHXr3mTZg0BZjcf3srj9FLdn4aFvhI
         1VL497m4u2bTo58a/kYzUbRTW83Bp4ki9wSe0PP4Z4o8iKadN0QSJ3+NX0q7ZMx4Cgyq
         2E2xLw1anYw1AilHrjIhnj6RuLORC+7iE5Sfw9h5ps27WUBfYs5LExU5GDaDKfsJ76YC
         g4iIggZuddllNgz+rf0bzo7wJIteMZLL+un4476PH7dHQYpdom4e3QHxU4abtoEStyuS
         YyQpAhAW2hvq64ua82SKH4TRtilPfIIf7JVuTzBqFFICyfqQh/BETmoV4iCs1wXrp20F
         zuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y/AJrR7wo+KKwMOBsUQrs2hpnFS2xTQIIY8tGxegkGM=;
        b=x/wFJ48XyAYO2d0/7QVw6NbsCjXSAhgQ0aLR4NxVV0qjRs8bsx1H0sW09GNBkcOCIL
         2f6xwP9pI9nVahVUutMxw5u7q8MxhmKwlkq1Q9i1cRoFYCdpuGgUv4xl9ctUp5dAI6IG
         0jGuJGZ0t9wrnf9Ob4G6lWKy6XYSMBnhOQ4SXN7b9T4lQZZZKGN//jeg2YIvH6UWxHd+
         Kp27G9Ydp4FutyOd/HKDt1MPlpVUS3PWutpqYWTtxleBwGePyMzw1fo0OPgRxzM1LIpF
         XFzLZ1DBZQ6sW/OunlOsZ7hQRKx+ZoKSoMrxwfxyb5GHF/mQFB1S5Zg+BvQgZipxn/yY
         gWOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wrczNESP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pw28si1574352ejb.43.2019.10.09.11.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 11:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wrczNESP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIGZd-0006IF-GR
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 14:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35954)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iIAOu-00017o-Vp
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 07:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iIAOt-0003jn-Qa
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 07:45:04 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:44514)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iIAOt-0003jZ-La
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 07:45:03 -0400
Received: by mail-io1-xd42.google.com with SMTP id w12so4154187iol.11
 for <qemu-devel@nongnu.org>; Wed, 09 Oct 2019 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y/AJrR7wo+KKwMOBsUQrs2hpnFS2xTQIIY8tGxegkGM=;
 b=wrczNESPfibfY1uG0dedQZgs89JD7RlvJ9VD6TU71J8DOSNUWHu1Vla8ueOQ1V3cGW
 P3k13el+Od5jeDtoy+M95zpZwOqtETYe8lQnBtWOoon4/oFQoHPdP7R+LR+TA5bSjbQ6
 iJ5tlYh8yNYqiO/Vry6vdI4oA8EflpoCuyxWXHF2AxNCaCPKFWPfeTAfCYSJRIjsuCoK
 z6hcUQ4OQxPiLevtL0lArMQS+4ZwNwJSzxsOOMBUfKJaDHUudl2vkJ6LWn1PbFX/33LP
 YlWZ6qbQmkZ00kocRa6qJJNPoMFDLaUYJFpDTtrUMQSkJtL0j3+O3Rxxa3CEEMog1qCe
 kq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y/AJrR7wo+KKwMOBsUQrs2hpnFS2xTQIIY8tGxegkGM=;
 b=fx5tYVPAN+DTTXpMVKDqzXYStnbZoQUH6pKuxQQFpCRqi+jZW5CwyvxuW/6Ya5eHYP
 2x47JK+9QaJ66E1VvRp2YNV9LvpioAsnopWWxV4o4xQ3X+kxsX27B+lOJPXEcE9feDoE
 rzBTDGFEDwzELSnatGuDCdxcxrS8xojJkxQ6UwFPkQJJOnd/FjdK1k/2Ebi+cgYeU7+D
 lxDa4zplraNlGyYaO7MHKZV6uSuhmvCb7vITknHGoAuWCobmgvyXaLdBu6E9Zm1qnrUG
 oE8iLN30lfSbWWNTsJcfyO7zTV+vWGqD/cQvYGk7/0uyRrUzd0cWwytpH/iNXqux/yMS
 dn7A==
X-Gm-Message-State: APjAAAXRrmLPpWYOJYeD1HHPELXCqQow7yWRJWz4ILYo0OIWkGiltNw7
 q6mG+FMWlkaVrKQoMLy0tel0dICcQ8xz39qasU2Xjvhq
X-Received: by 2002:a6b:2c02:: with SMTP id s2mr2697869ios.307.1570621502744; 
 Wed, 09 Oct 2019 04:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-3-beata.michalska@linaro.org>
 <d8ca7a99-ca3d-00b8-f34c-82375ecb7c4d@linaro.org>
In-Reply-To: <d8ca7a99-ca3d-00b8-f34c-82375ecb7c4d@linaro.org>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Wed, 9 Oct 2019 12:44:51 +0100
Message-ID: <CADSWDzvHEnn3=hYxuH4+14OwgnUV9Vd_2dDxFHATRqAOsUuTLA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/4] Memory: Enable writeback for given
 memory region
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 shameerali.kolothum.thodi@huawei.com, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SXX2Fs2MNFLS

On Tue, 24 Sep 2019 at 17:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/10/19 2:56 AM, Beata Michalska wrote:
> > +int main(void) {
> > +#if defined(_POSIX_MAPPED_FILES) && _POSIX_MAPPED_FILES > 0 \
> > +&& defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
> > +return msync(NULL,0, MS_SYNC);
> > +#else
> > +#error Not supported
> > +#endif
> > +}
>
> Is there any particular reason to check _POSIX_MAPPED_FILES &
> _POSIX_SYNCHRONIZED_IO?  IIRC, you can use those to "safely" use MS_SYNC.  But
> this is a configure test, and an error is in fact our defined failure case, so
> "safely" doesn't seem particularly relevant.
>
> Alternately, do we even support any systems (besides perhaps windows) that do
> not provide POSIX-2001 support, and so include msync + MS_SYNC?  My first guess
> is that we don't.
>

Both flags are there to verify support for msync itself.
The check there is for posix systems , where if both set to value
greater than '0'
the msync call is available.
AFAIK Windows is the only posix non-compliant system being supported . Though
I might be wrong (?)
I might just drop the check here and use CONFIG_POSIX to handle the
msync call instead.

> > +        msync((void *)((uintptr_t)addr & qemu_host_page_mask),
> > +               HOST_PAGE_ALIGN(length), MS_SYNC);
>
> This isn't quite right.  If you move addr down to a lower address via this page
> mask, you must also increase length by the same amount, and only afterward
> increase length to the host page size.
>
> Consider addr == 0xffffff, length = 2.  This covers two pages, so you'd expect
> the final parameters to be, for 4k page size, 0xfff000, 0x2000.
>
Thanks for catching this - guess I was too focused on the cache line
size, which would not cross page boundaries. Will fix that in the next version.

> r~

Thank you.

BR
Beata
