Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp43097wrt;
        Mon, 26 Nov 2018 09:25:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WwqwTbXVBJwDe7tkqvB2lyqaBPPlbGpr8ZXT8IkrxrBr9rPrNotRx7MuVsLaoRhycpoDF1
X-Received: by 2002:a63:d34a:: with SMTP id u10mr26134183pgi.301.1543253143684;
        Mon, 26 Nov 2018 09:25:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543253143; cv=none;
        d=google.com; s=arc-20160816;
        b=hQ+pn1oMpnA5TOgHf7HL3lcM2wPIbKHQBcesrULjRU9L4Km9Dc+lQaqJkoIf/w1h8G
         wLYVcLnTEJlL73toe+NKhkgH14e4W4wihNlwu3qKupwLfqZWwVxoo3d0rg3Qp6Ku6X/L
         sLbEYC9Jl87H+NilPGS8SWJngtRjToprp6iFaMl8yW7rQ2ZmiXafH2bYwbbdRKhd/XML
         FSUaEDpAGrQAW0LV9ERNlZP6tj23ChkPnIUYln++aY386aX3Z1OI+fhaHfv+O3VPqaK6
         XrY3Ti0NV4Pz8bZUPXOnQUdR/q8X7LolUXP31c+HdXz4awm+06TUMqS0upGLHn+dFBzG
         fsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jAOlhFOjlQbMp5DKvsfBfeLZpG7WV3QMbgQwulWsquM=;
        b=LjtHJM8/DF32qXs6HkMvXWgh1wW+xljLNk6kFLVjEKWyzUMiWDkPK8EA+n1FPifjmf
         aogbG/XqmSQJcoMKBF+9uFJt/5Nf//NL5kq1M5R3TAdck5P9gdIkslzDHt9klHO7KWxG
         tehatTUcKvnK3NvSPcr8O6mHzfzs8I4sNXOXgTffctMshZ57mnhBivv4Dvz+tveVS9b3
         fGNWBcfQDJ5pdmWH9KLC1Dz/BhdXQ16DIWX/f+S598/fZqgFIg8/UiYgzHdhArrRU79q
         hO+mMl4ZXXUpmEvgCJYF9iG1WOxZFA1mRGVbVfEQDiau0897YkSvMhXIECRYtgPf3Hb8
         H6GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X64RbTZY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id k30si851634pgb.113.2018.11.26.09.25.43;
        Mon, 26 Nov 2018 09:25:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X64RbTZY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbeK0EU2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Mon, 26 Nov 2018 23:20:28 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41732 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbeK0EU2 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 26 Nov 2018 23:20:28 -0500
Received: by mail-oi1-f195.google.com with SMTP id j21so16553377oii.8
        for <kvm@vger.kernel.org>; Mon, 26 Nov 2018 09:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jAOlhFOjlQbMp5DKvsfBfeLZpG7WV3QMbgQwulWsquM=;
        b=X64RbTZYoZHZh9DJtuugG7BDCtkS5hYlNa+GsFNiJoaDzK3t8zLYocJwBFJSpJrqt9
         bjxCpmGKlGn9v1SpO6iFN6+46jUEDHq0kTRdofcFzhddLquq3U/hIscw0YviAnLY49L7
         OUv5M2rsA2p0qQrkHNadMsrErEOR5CByz4TNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jAOlhFOjlQbMp5DKvsfBfeLZpG7WV3QMbgQwulWsquM=;
        b=aqFo3brwWW9bb07U6PboW9PvA1X7PqkVa9LX1IPCpAgnexMp/JTQbSJH07ogr0DHEI
         focnCPa5tznYfAKqI7g4PRk5f0f2OeTR2cJ2J4/028UXnwwhthYYjpKggnL92Rn02oS2
         hTwfp0W01DUvouv6qqXaNYywL0XzmX0BdzBc0Fhtl3nxSNcXDW8pHZNxVQXUeq1t6C/q
         sUgiz6gH3szGLQ32RFqTynjVJ7Lngljfhr+hrFIerr1wARJw2OF2WW+oZ7EVKd7jBAnW
         6fYEzEQnaGlVu8ZmOZrSWwHfvIYdSumivMW8F0AYw7jczIpFbxjo/u7Auq0r0R7YVQ5Z
         k2xg==
X-Gm-Message-State: AGRZ1gKKLx8Jihvtut83pDXytvgsddabO/MLIq4Ct4HYEe9xyHSUV7Fi
        v20yXbISrbBYNsjxs+Okeo854hbADEXohHIfUgrb5W1ePVE=
X-Received: by 2002:aca:b68b:: with SMTP id g133-v6mr16137074oif.25.1543253141347;
 Mon, 26 Nov 2018 09:25:41 -0800 (PST)
MIME-Version: 1.0
References: <0184EA26B2509940AA629AE1405DD7F201F96E93@dggema523-mbx.china.huawei.com>
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F201F96E93@dggema523-mbx.china.huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 26 Nov 2018 17:25:30 +0000
Message-ID: <CAFEAcA-00K2y9Xknkxdtop5Yj7E_j9jd6zFe6n0hw=aOGz963A@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH RESEND v15 10/10] target-arm: kvm64: handle
 SIGBUS signal from kernel or KVM
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: tSzZ1K+uuzXh

On Mon, 26 Nov 2018 at 17:18, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
> Hi Peter,
>    Thanks for the comments.
>
> >
> > Yes, but if you look at the code which calls that, it goes on to do:
> >         env->mcg_cap &= mcg_cap | MCG_CAP_BANKS_MASK;
> >
> > which means that if the host kernel does not support this feature then we will clear those bits in the env->mcg_cap field, so we do not
> > advertise it to the guest. But we might be not advertising it to the guest at all, if env->mcg_cap was 0 before this code was called. That
> > happens if we are presenting the guest with a guest CPU type which does not have the feature.
>
> So you mean "env->mcg_cap" uses a bit to indicate that whether guest CPU support error recovery, right? If so, how we know whether guest CPU have this feature?
> Should we initialized MCG_SER_P bit of env->mcg_cap to 1 or 0 before initializing the vcpu?  Please together see the reply in the [2], thanks.

This is an x86-specific field. We need to identify the Arm
equivalent.

> > The question is not "does the host CPU / KVM support error reporting". It is "does the *guest* CPU / system support error reporting".
> > These are distinct questions which may not have the same answer.
>
> [2]:
> But QEMU should not know whether *guest* CPU / system support error reporting.

It should and it must. Otherwise we will deliver
an exception to a guest that cannot handle it.

> From my understanding, in the X86 platform, if host CPU / KVM support error reporting,
> then it will think guest CPU supports error reporting, and set the
> MCG_SER_P bit of env->mcg_cap to 1

No, this is not correct. If you look at the code quoted above.
it ANDs in the mcg_cap value. This code is run after the
CPU is initially created with a default env->mcg_cap which
depends on what CPU model is being exposed to the guest.
So we only set env->mcg_cap to 1 if the guest vCPU model
supports error reporting AND the host KVM does.

thanks
-- PMM
