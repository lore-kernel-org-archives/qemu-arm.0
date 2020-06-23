Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3931124lfm;
        Tue, 23 Jun 2020 02:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4kz34o/iFUTtijoIHhLjrnybepF5BF4FOVQNZVs3/ndPvKoCyOPE/InW+I29plgH+8D9U
X-Received: by 2002:aa7:d2d2:: with SMTP id k18mr13593337edr.16.1592903997219;
        Tue, 23 Jun 2020 02:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592903997; cv=none;
        d=google.com; s=arc-20160816;
        b=gOzZkGncpbx8HpsNMZdAo0QobNFFMCXvr0zMq/dL9LW3tGafOe/XZDVpjpYMV+G3c0
         QMFBoIa11l6rclqwwDYPmO9n3AdqOpT1IQvwhEdz0y75QOqc/aDt1p75TQibCH9wPuGo
         GZAxV82iDk1i0Wy50i1ExWXBbqprcqZkXQsXdgP1R+lSQikzq/dozDrWdMnZLB/Hl5qK
         tGKyG9/ylQhoEqmsGDd4WA9bFefT0I83L7m3XxNb7/E3ZFewN2gALswp0832Y+U+5rHd
         IPRrY1QOlcQurD6Sbrq9aCDt/uBIz65mDFfYLHZD4HK81xPeHefpVBgKM/4ZzyOYa01L
         QyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AEb5s+GUhyRzuTnhQbtbo27oAkxKXoB/Zj5TeJetDe0=;
        b=ks8zQaYxmm6ujnMCp1wCDZ+QFB8CyI+j3YOFdcfaHcoKf9tiqE0PBacl/QbUPyX5ku
         fjzAEukYQSOyh95FpvQk4v/kiAS+50pfL4OmP0ArWxa+AQ0p5dqhwGY9lZ6okUNomA5Z
         mNHGCla2Y1FMDbPwqdo2F2Gbfy4MsoX1l7ui3L0SoMp5fU0/aQ/QNqnRkLTexTBG/z1n
         s6cI7LEwvXRlOFwhgcjA919BKg8QlPg3XGAg51YhjQtAw62X/a8ehT7bT4Hdv7H3ImVH
         1wztjI9bZ5YBoiXzb8Tv0Z5oJAGC7kneVm6iz6BbcBR/2ZeZExrt4uGBz9JNm2K1mvMz
         b3Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+THWZ5U;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id j1si11708099edj.464.2020.06.23.02.19.57;
        Tue, 23 Jun 2020 02:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+THWZ5U;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731921AbgFWJTz (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 23 Jun 2020 05:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731735AbgFWJTz (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 23 Jun 2020 05:19:55 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7716C061573
        for <kvm@vger.kernel.org>; Tue, 23 Jun 2020 02:19:54 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id v13so15880599otp.4
        for <kvm@vger.kernel.org>; Tue, 23 Jun 2020 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AEb5s+GUhyRzuTnhQbtbo27oAkxKXoB/Zj5TeJetDe0=;
        b=i+THWZ5UaDbQXuNVseEZyK5cFQklmhA3f50o/rX6QUzrezkeoyn2jyNux1l/zteJWE
         SHRJo5X/tx/gsNra/S7gQJzjsgHir326zb1wyNUuZe5TpVrE8JZf9/RjHhf+LZOa/lCv
         mqtf1qz7p9NEsmB/CNmgQbyYrV+XhL6QWrC0U3RMOkwE/J8MWo5fThOvRlgkm7EdVbqd
         7dDWyT5oNLW+viGp11OzRc/TUOkaT3JvcE4hiN1OiePb/U0XdndnhzedxTdZRKCmVLKM
         ldZZoY9BWee1N11+kLbx2PwcY40G93A5lSBEuP7QYPhLYO90OW6WrjyEG0wJZEErfZj9
         gjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AEb5s+GUhyRzuTnhQbtbo27oAkxKXoB/Zj5TeJetDe0=;
        b=Fk7Ut2cG9HMC2zGggX6ZmMcMHc3LMBatDxXpo9h9BsgwkGJlt+MgKUorg5VPX0psVr
         rayl1l4uwSw6HHYLqJtv4Pzf2qeWFdq38vvm95peBtyvu3VycL6jyJP1W/j18SIJanFz
         oEmLFDHw9+uENVF76ZoAs6AlZOGNRBG1VF9S2Ok8+VEfbPxSAffyncc7mU+JS/Eipyw+
         TeheNuDNTFN67UJALj83WOUtp3JXW3uD3M+frQ6K0Jbf13zKvS29QeORsbZ8olPIQYNz
         bqLgIsk0BGfVfG25taK/2SXTPrx3NZAcm0hDT2ot/Lmsc7A+ui+XKkQMU/npIdMGCpf/
         qBnQ==
X-Gm-Message-State: AOAM530Da5/RwV4NG4FMWyr0ZrrOBX8f2iFaOpJNsf5k5w96ADwQzTIl
        NeuUMKSxXIy4JE1c0gThspyUB/laRP0ykuTHYHCx2w==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr3344560oth.135.1592903994331;
 Tue, 23 Jun 2020 02:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200623090622.30365-1-philmd@redhat.com> <20200623091807.vlqy53ckagcrhoah@kamzik.brq.redhat.com>
In-Reply-To: <20200623091807.vlqy53ckagcrhoah@kamzik.brq.redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 23 Jun 2020 10:19:43 +0100
Message-ID: <CAFEAcA-2-g=ZMMRkxoT-ncxqbdjc5vV1WbFzGXw7R8o7QOb6hQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] target/arm: Fix using pmu=on on KVM
To:     Andrew Jones <drjones@redhat.com>
Cc:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Laurent Vivier <lvivier@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: rR5YDpDIml3M

On Tue, 23 Jun 2020 at 10:18, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Jun 23, 2020 at 11:06:20AM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Since v2:
> > - include Drew test fix (addressed Peter review comments)
> > - addressed Drew review comments
> > - collected R-b/A-b
> >
> > Andrew Jones (1):
> >   tests/qtest/arm-cpu-features: Add feature setting tests
> >
> > Philippe Mathieu-Daud=C3=A9 (1):
> >   target/arm: Check supported KVM features globally (not per vCPU)
> >
> >  target/arm/kvm_arm.h           | 21 ++++++++-----------
> >  target/arm/cpu.c               |  2 +-
> >  target/arm/cpu64.c             | 10 ++++-----
> >  target/arm/kvm.c               |  4 ++--
> >  target/arm/kvm64.c             | 14 +++++--------
> >  tests/qtest/arm-cpu-features.c | 38 ++++++++++++++++++++++++++++++----
> >  6 files changed, 56 insertions(+), 33 deletions(-)
> >
> > --
> > 2.21.3
> >
> >
>
> Hi Phil,
>
> Thanks for including the test patch. To avoid breaking bisection, if one
> were to use qtest to bisect something, then the order of patches should
> be reversed. I guess Peter can apply them that way without a repost
> though.

Yeah, I can just flip the order.

thanks
-- PMM
