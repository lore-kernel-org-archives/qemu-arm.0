Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2346557lff;
        Sat, 14 Dec 2019 08:29:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLQAmZv6BX5hIdVCmKVgWMjvT1lHwN9dr8EbvnKzRfMmhcSr9VZt99jxHSwLsB/61Dz+P1
X-Received: by 2002:a9d:578a:: with SMTP id q10mr20547924oth.215.1576340945367;
        Sat, 14 Dec 2019 08:29:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576340945; cv=none;
        d=google.com; s=arc-20160816;
        b=a0i3dZyKd9f7ME7OboKi64Lil9+ME8YLYEtnyQLMsN5VGXrK5fQzBZEnOqrHEaOCOO
         AG9hnCJN6L3uVOZZYAt9Y0l8jmVKJPXx4Vuah5leialLwb+9Bw/cgnJOKm/41PB9zFDB
         q00cV7h3xAkIu380FXULDJv0rqobL9WPzZW6lFO93IwIs7ez8RCI5HZrscIy0lhnC2wK
         J4t04la7+1m7hoDQrSq4umwL7IecBWxCHxExDqDL4oWYD0rdzBGQgboLdwqrkil+3Ec6
         Q51snfWX11c6xbdUxavmBRnWYFni/A95beCevL9el7plzOf7g2QkALrsTCvfptq6i5LW
         tENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=p9TiU/p3iswBYZrdHpdDNv4k35V7tGo3wIsIIqH6Ut8=;
        b=ucyxHzaNN7xDK5/yeudAiUy659y29J71dm8PwlwAaSl/U8ev1kU7WoNinY1VSLZk5o
         gF0y7jgxjGLMgrUq529v4EWi0dFqrmuZvEVxZYxL7MkKqIlTz/7unCFRn7PCl66KNZs+
         UEQh92Sqa+uFgnPL5wRjR/LRt15VNiw2WV969ApQiRYIKSspkC+KBVtTaBG/YfFXWlil
         HZoDouxq29vCQftSwIfqacrJiqWNH7O8xxKnuiUGNZMrIgUGBckOxiGOr3qJTPP5O13g
         xj2GCT+MTdpIJ0sUnzIo8XleanmIJQtWvHJnboFrdaQ4KeSE7sellUeJBoo7BsQUmyx1
         BlkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UmX267PJ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a22si5898957otr.143.2019.12.14.08.29.05;
        Sat, 14 Dec 2019 08:29:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UmX267PJ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfLNQ2V (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 14 Dec 2019 11:28:21 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45769 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfLNQ2V (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 14 Dec 2019 11:28:21 -0500
Received: by mail-ot1-f67.google.com with SMTP id 59so3110753otp.12
        for <kvm@vger.kernel.org>; Sat, 14 Dec 2019 08:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p9TiU/p3iswBYZrdHpdDNv4k35V7tGo3wIsIIqH6Ut8=;
        b=UmX267PJ+IKeDMSTN0V3PZv2FHiub2P2r+RC6k05+7qBd3TWpLmfwXUwrcObbEuAKb
         qdw9Bqt7kVS39SJgc6/Ht5EdxnlQ9tlvmCURQLW/TS56voA0jqE9+W1zvBYee5PcWgl8
         C7YbNPvlcrhW8OhFqvBkqRAAwGJuukZAnU8gbwUDMd1HGvciBzCgd1gg9TgaHVLxHaUP
         zo915ceyznORJxfbYwib2hxkFL0GYEi2xcMJdiNcSP34NePaydSXsxE9hgCF9oMkCiBn
         hmC2++LOmgEC++diZ7hJAV0piPgpM6ujTg9HuohGHqdGPz+sBcCW3fe0gJJK2Z7ipFAM
         8Vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p9TiU/p3iswBYZrdHpdDNv4k35V7tGo3wIsIIqH6Ut8=;
        b=GnX7ADnEWyWzCY6y2DZaDDhqfHrUl5Qvc/i+FEhHiwv5HnQUPK6xLR+rzyAQKm6YN6
         hS/r/cAJaQzUNKYU2popl7Iq2Xe6H+8JkcVXwMCoWgUZPo3gI27ojeQ30PafViW8UQ1H
         lF0x0WLuVyFGkGM7F4lOpdeVOtLEk31Qn2pKwWQ7Q2URpR2Br9WKgtG+B+qVZBrXfLjk
         BK+fJM7o+PZZiNTGLYYwFts6sUPfA/qCmY/hndxyO95uL0/1H1meq+loABYxJ5B88rxn
         3LT3HoYF1G2u0kxCmHcvc7KgOBgzXDp0xuZd7a9FpeMF0nEpops/6Dn6N4Ie/Arpa8YY
         +ZEQ==
X-Gm-Message-State: APjAAAVViNEei8QhkBH1H4HLwLevvq5A+3gmWnmaeD3UdOBOIWL9btRa
        MEbns3EpHY7PxoxdpAS3VWZiSzo4Xp5tTcDh1uG0Uw==
X-Received: by 2002:a9d:4d8a:: with SMTP id u10mr21854614otk.232.1576340900088;
 Sat, 14 Dec 2019 08:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20191214155614.19004-1-philmd@redhat.com>
In-Reply-To: <20191214155614.19004-1-philmd@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Sat, 14 Dec 2019 16:28:08 +0000
Message-ID: <CAFEAcA_QZtU9X4fxZk2oWAkN-zxXdQZejrSKZbDxPKLMwdFWgw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Simplify memory_region_add_subregion_overlap(..., priority=0)
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        kvm-devel <kvm@vger.kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: UVVJ5tWezjj7

On Sat, 14 Dec 2019 at 15:56, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi,
>
> In this series we use coccinelle to replace:
> - memory_region_add_subregion_overlap(..., priority=3D0)
> + memory_region_add_subregion(...)
>
> Rationale is the code is easier to read, and reviewers don't
> have to worry about overlapping because it isn't used.

So our implementation of these two functions makes them
have the same behaviour, but the documentation comments
in memory.h describe them as different: a subregion added
with memory_region_add_subregion() is not supposed to
overlap any other subregion unless that other subregion
was explicitly marked as overlapping. My intention with the
API design here was that using the _overlap() version is
a statement of intent -- this region is *expected* to be
overlapping with some other regions, which hopefully
have a priority set so they go at the right order wrt this one.
Use of the non-overlap function says "I don't expect this
to overlap". (It doesn't actually assert that it doesn't
overlap because we have some legacy uses, notably
in the x86 PC machines, which do overlap without using
the right function, which we've never tried to tidy up.)

We used to have some #if-ed out code in memory.c which
was able to detect incorrect overlap, but it got removed
in commit b613597819587. I thought then and still do
that rather than removing code and API distinctions that
allow us to tell if the board code has done something
wrong (unintentional overlap, especially unintentional
overlap at the same priority value) it would be better to
fix the board bugs so we could enable the warnings/asserts...

thanks
-- PMM
