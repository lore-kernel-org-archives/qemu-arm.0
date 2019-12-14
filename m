Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2535387lff;
        Sat, 14 Dec 2019 12:02:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRDoiDnA2ZO2wXLJe6gJVMqpYlWk01LB7cZId/nfEpB8tyoVP+zB1Q8Rev5KXvJxhFCW9b
X-Received: by 2002:a05:6808:102:: with SMTP id b2mr8693597oie.127.1576353747431;
        Sat, 14 Dec 2019 12:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576353747; cv=none;
        d=google.com; s=arc-20160816;
        b=wgWLASgR4EelhxDYzI3woN1C7gzWUbkwivbOMzyPKk9bLa/nwlJviJN40m9dPFXjxw
         M1ZdzE1Y98tg7i+0v4O1+HNXp7dZZPxbFFjdCJJz8QGJ+m+Jbu/byVMIO3/hvC498ewv
         d9QuOfhwekoiUdRtJQ8P3VVnSbCl3TjmBvZkAtfoIaCQpCNf9OQRqZjahN4aEWmnPzSO
         o1L64a5ZDttcOvBqjdQ3TVlLUFpmYg3nvvFTEz9klx0u3E62IwyGfA1d5e/FnDBSt9o8
         hcZ8pyBFMN6YKgd3942QSAGqff8WJ+pBieeWgH/ct5YwqxPVJrQ88yvVZQzDxUtlM151
         QdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RMrXhnl08yOQWoHsGq/Mqy6tAi/gvfJoz02znJajxJM=;
        b=rviarw0V5M+mrGa725UoBjIcqee6dXGrYg89IfpPKt4EEkNJrWLZFBIaxZxJ6HczoP
         Ax5eDOcqzPeFo2PV4ioP/W/q30fm7wpn6hlwhzmk6Rewu1SqSKqCRtRai+zCK8ze0Cvm
         o8MnwqM7/JtLUZm/VJxrKRx7C5XBZxjEXFdZY5TJhCJWTamnFYnLWOtcAVimMe+42slB
         jowjpzB7QCcejz9yCfQTsa+xpipJA6z0S6zdxzzLPYLcTDiGBbWAd+fMCeAiK+HHNT9h
         TBk8RnlxrvmaRzOqR26hNIMcjOMt9eTMwBdK0P0Z/Ul+Wn/TeiU+W6x5B8JVByXj0zoM
         86BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2Ba4DCc;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w11si7515257oic.62.2019.12.14.12.02.26;
        Sat, 14 Dec 2019 12:02:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2Ba4DCc;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfLNUB6 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 14 Dec 2019 15:01:58 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45792 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfLNUB5 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 14 Dec 2019 15:01:57 -0500
Received: by mail-oi1-f195.google.com with SMTP id v10so2513072oiv.12
        for <kvm@vger.kernel.org>; Sat, 14 Dec 2019 12:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RMrXhnl08yOQWoHsGq/Mqy6tAi/gvfJoz02znJajxJM=;
        b=n2Ba4DCcTtQy+TuObNMMxs6W75KYEp7QP4qYVJefSlzwufoqhGmr69lW7Y0J7nBj53
         NuQ+7XCu3ltts5rk+7ISqXvQ3xyzBoPY6Ii6wmrnZM3UxXbr40UU7IwrgC7I0P0bHIJk
         LTwV/92yIa74Qi+WpqOjSNELSVLjkJo8l/Nv2hzzMIuOVu7bc1WqJQ9RQQTn0yLspap7
         QyW9A+TWkC1Dk6x5DPa7YZ1g+4mOuMRqmjU/HiuM+CvZorTbWbibyjYhDe5PZwP7QI7S
         iw9ROzPqsjxlY9Bn2L+ipJXy1iV/044q866OBk6qd3XVi1zI0nFNmBQEn1oTSPfOw1np
         f0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RMrXhnl08yOQWoHsGq/Mqy6tAi/gvfJoz02znJajxJM=;
        b=Mbq31kGdzfGsqGVVvsgiEG2nHbRAt4/YqlKa8CWYbE4DvrMkGLQDBAs2umk+/Wb6PX
         rewljlXYDqMtVyvpM33xHXrw/VSmYzuXr1Fxv5ROiYiSWi4qAFvymezoBqYKwCHL9llL
         OG/2QDOSNS6gyocvrnfqr9V/OxXL2BmRZxk4BSdF+pL99qtMf5IketbQHijadJC6jbaW
         U9ZGDtXtk6yISr5oLbWeBmqXtVjorrmYuEAA9dsHREl8sFHMlR4+SGmtM3sT9GBmlcit
         Os1Dx6rschbFaQsmjBkaBZ4rAsGleptEWnRxSKKkObXgXF8avcVjFgf2bPfB27JfUNUx
         J5dw==
X-Gm-Message-State: APjAAAVs+ltdyaVlfuhep99lr0+c24X1szf8UBNRm/zyGTYeT+T6WXgg
        +BWjnPboXBlNkki6kW9P+kMtbkXrIMn32j592OtFLQ==
X-Received: by 2002:a05:6808:996:: with SMTP id a22mr8108069oic.146.1576353716975;
 Sat, 14 Dec 2019 12:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20191214155614.19004-1-philmd@redhat.com> <CAFEAcA_QZtU9X4fxZk2oWAkN-zxXdQZejrSKZbDxPKLMwdFWgw@mail.gmail.com>
 <31acb07b-a61b-1bc4-ee6e-faa511745a61@redhat.com>
In-Reply-To: <31acb07b-a61b-1bc4-ee6e-faa511745a61@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Sat, 14 Dec 2019 20:01:46 +0000
Message-ID: <CAFEAcA-UdDF2pd24NoOqpXSTnHHFWdvcexi5bRzq6ewt5vrrWQ@mail.gmail.com>
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
X-TUID: YmG+MLhzByuU

On Sat, 14 Dec 2019 at 18:17, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Maybe we can a warning if priority=3D0, to force board designers to use
> explicit priority (explicit overlap).

Priority 0 is fine, it's just one of the possible positive and
negative values. I think what ideally we would complain about
is where we see an overlap and both the regions involved
have the same priority value, because in that case which
one the guest sees is implicitly dependent on (I think) which
order the subregions were added, which is fragile if we move
code around. I'm not sure how easy that is to test for or how
much of our existing code violates it, though.

thanks
-- PMM
