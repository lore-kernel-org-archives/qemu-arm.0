Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp1776124ejh;
        Sun, 4 Sep 2022 00:07:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4eYLjZbfbicqGtQGkTUKIsJDcbX17FEuFUqw43KWVcwJO3oboBPof802zbR4b/Clxm7Kmj
X-Received: by 2002:a37:6545:0:b0:6c7:bf49:be5d with SMTP id z66-20020a376545000000b006c7bf49be5dmr116978qkb.561.1662275261882;
        Sun, 04 Sep 2022 00:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662275261; cv=none;
        d=google.com; s=arc-20160816;
        b=L1RvKklOuNSQhPgAM0L5I0VA0Tp0T0qiti438B7hz9jfja/j2R6iIY/IP0qpwLwZLV
         J5Yh2n+TCNAnCkswtcbjbjbHkOgUU/4HqiZwK0lq+qERRHa9UfnotGsMMBhLXrV7BVi7
         2F3zqYsylxfOcf07CgDG7pphDXq94Iy/xbly4yFo5b76NfG0H2MC2CdE8LE1Mk8TwQBe
         2m6azGJ0B12XvnBggXstdUpb8PDT8Dj2rSu0MJdoPumjt7jScacGNmOtxkhvk/j0VMzl
         Zr4LFo/gNtqSDGnrzbys8hYMspioU35DMyu+X9bjRNxbwNHlv1f+sUGexJuwWgDtyylU
         Ybbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nsoOUpeuKR8xibgN81BhG1OqCu8Z/QahqIosnLSxSj0=;
        b=Dion/piPT1mV382bkPoKz7e8iLW1IfGs5GbST5px+r3R5VlFjvR/GsP/Fg33n0OGf7
         lmzpRtiStP4COgWLxhvx6bykGrpB40o1FbPtmuNMpMng36APWtj8GdRYYvM1b6d5c++O
         gXcqQVQiiAfVXiazZOHxFq1GZNrucSLD4O7iv3b9Clwa41+Frosf+KE6qG8QdHtQvxw0
         UvH9AozncizxFU3ohZuuwaUmlEKzCdk/+JLRtNI1oqoo6uDEkC+20wYuFzRpu6y0G4OC
         jT5Gf1fqq0XURddWn7RsVrV1qJoap5tbfZnPXR7B+saO1Qw4IrPtl7tIdqdbSizievZI
         uAqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=ZF6FBEf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a05620a414d00b006bb4eb9510dsi4580874qko.302.2022.09.04.00.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Sep 2022 00:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=ZF6FBEf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oUjjJ-0004B6-08
	for alex.bennee@linaro.org; Sun, 04 Sep 2022 03:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oUjio-0004Ap-Hv
 for qemu-arm@nongnu.org; Sun, 04 Sep 2022 03:07:10 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oUjim-0000YL-Nr
 for qemu-arm@nongnu.org; Sun, 04 Sep 2022 03:07:10 -0400
Received: by mail-io1-xd32.google.com with SMTP id p187so4814107iod.8
 for <qemu-arm@nongnu.org>; Sun, 04 Sep 2022 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=nsoOUpeuKR8xibgN81BhG1OqCu8Z/QahqIosnLSxSj0=;
 b=ZF6FBEf1aQ2RH7DLplWpaEfk4Z6BfqWtHXtlInLh9e/P9km9QAxrqLFcn7KHi1zlQ6
 8ApA1L6gmjOEeU0c6/ZyKMMzCQeZU/Rz5IEU6rHzUXlHZ0XRgj2ADq3fsNII10BV8dJY
 uD7X2O9rmwad6dHjgQmDHEjZtQk7pc5+u58pfIPUEYNIryedcROKv3IySwHmjN6qMhDr
 9/jOIpH1VVCccaQWXX6IuotHF35qEUbu838xYlVlWRDoxyGJz3ZvRaxoimo2I3tW9iZU
 4EvEilRvs5f0trc40tSbCoq6UIkzIiyrYjSP9+8FIUTtJb/BIplX/GvtcIVCbyThE86B
 g9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=nsoOUpeuKR8xibgN81BhG1OqCu8Z/QahqIosnLSxSj0=;
 b=dfpbtLXEO3JwagQ6zSgvX0jDya3M1OinYq2CaP0ypks/7Nbmj+LyQsQbwqyWg6Hwtg
 Ubx9N4bmnM9jVY77LcaUXJYoB/O+Lc5xjPZeEOX9XJ2gYTeQ13vMlb2a91XKLmuhtfyT
 mImYjKLHi0t1eRDHQpw9FwgYaGrqfeHCxHFABbYF14X6ji4cTknmKjdg8RXE/C/S0t9t
 KvauwRn23YU79bs+h3q9FCq+aJqYE55qxSW1vrEt6BqAhaccPNP4rUshHWl/x1t9Azkx
 mTTMIgeYF9DIabHAOFptUo+E0n163SiLoWJFcvqGQ3jJ8MkT4QMbBE9Jd+8LmSSlMyhK
 eYag==
X-Gm-Message-State: ACgBeo1O/pP6jySPcXm6rxbx52W69miWsnBG+y9upXKdY1xVSwxqI8CT
 49XzYHbGgHlkVx2ZKePEKCVOT0oIbayl9gLgI+ZCxQ==
X-Received: by 2002:a6b:105:0:b0:688:2b66:1ed6 with SMTP id
 5-20020a6b0105000000b006882b661ed6mr21057192iob.165.1662275226221; Sun, 04
 Sep 2022 00:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
In-Reply-To: <87tu5qulay.fsf@pond.sub.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sun, 4 Sep 2022 16:06:55 +0900
Message-ID: <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rji/nHrXh+T3

On Fri, Sep 2, 2022 at 7:23 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>
> > pci_add_capability appears most PCI devices. Its error handling required
> > lots of code, and led to inconsistent behaviors such as:
> > - passing error_abort
> > - passing error_fatal
> > - asserting the returned value
> > - propagating the error to the caller
> > - skipping the rest of the function
> > - just ignoring
> >
> > The code generating errors in pci_add_capability had a comment which
> > says:
> >> Verify that capabilities don't overlap.  Note: device assignment
> >> depends on this check to verify that the device is not broken.
> >> Should never trigger for emulated devices, but it's helpful for
> >> debugging these.
> >
> > Indeed vfio has some code that passes capability offsets and sizes from
> > a physical device, but it explicitly pays attention so that the
> > capabilities never overlap.
>
> I can't see that at a glance.  Can you give me a clue?
>
> >                             Therefore, we can always assert that
> > capabilities never overlap when pci_add_capability is called, resolving
> > these inconsistencies.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>

Looking at vfio_add_std_cap(), and vfio_add_ext_cap() it seems that
they are clipping the size of capabilities so that they do not
overlap, if I read it correctly.

Regards,
Akihiko Odaki
