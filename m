Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp318774lfo;
        Wed, 3 Feb 2021 07:26:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznu9l1eHXemQEA9iZ63bKA/z5hWylu6nSZTAK3pcGNg1r1HAsPl8hETS6c7hIEprKQMamK
X-Received: by 2002:a25:8b8b:: with SMTP id j11mr5126304ybl.305.1612365996456;
        Wed, 03 Feb 2021 07:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612365996; cv=none;
        d=google.com; s=arc-20160816;
        b=PMj23rJ4MBKcQwOSC2Z4wMtLnq2ASSatMw2ppEuVL8Tib1QA3yOycB26y0JwRvLCE2
         deXUoPZoDhaORS15h0cdGY9fdcqHZ51ROswrCeEEv2x+25sP5q7Tbq/MKvGtDr13/AvY
         ssh8qrVw4sPqnkEvO2lGD8cGZXX6oOpSPGtltfzmTcPSBbjB1Mci1qt62gnZSczVNeDF
         IgizdpErFHYURQbEUZ+/ZaM2ud2asPlMSXjvtCYx6hvqJupFFC8rylT1W0Hey0rCpUwd
         WooMht/BHPV2xcW7r/5tbEcv05RGsca7iGGLiEHGvYEWwMdLrJSeSTpJRNTOrvOoDmL+
         p3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=llwwOIvKhGLRhh4735rAHXtKBgbXi62qgm9FyRRJeOk=;
        b=Qv0DfaV3zIYsZcSZ63czZ+sFVM6+xfffDmgiOZ+QVkyZEBogzuQdND81AvdY0E7Gas
         p3H329kA48/39TqR5B0MPOWHFKdVrCHSjdJXg3P++OtEZ9AcIwhIWr+O9uWAAPgySuYA
         36ylbv4QLy/0OQa14vZlDNF5nRX+0fPhjpP3eKuc06Y7aapriioqgKeMO/E89pSXSL0y
         jJnPxlhWg2WTg9eKBeqPQDjp1QcG/SEhs5SItXRlO24O7qjP9+iuRH/xXdAQGm51TSQ9
         4AkDZP3gAYPAzCWhAJ9yVaTNcf0UwLU86I+Ggtkp+cqe8QrUP+crsXSAbKhN1vUXw8Th
         /xUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRvCDqWW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si2294291ybb.77.2021.02.03.07.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 07:26:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRvCDqWW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7K39-0005Rb-OT
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 10:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7K30-0005R2-83
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:26:26 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7K2x-000487-85
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:26:26 -0500
Received: by mail-ej1-x62b.google.com with SMTP id a9so18031801ejr.2
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 07:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=llwwOIvKhGLRhh4735rAHXtKBgbXi62qgm9FyRRJeOk=;
 b=pRvCDqWWwgYrVhUreCVXjnrUaCwVolXS9SEzQm45NJV7rNAXXxg9zad9mor2ANiKd8
 cMmyJlXeM0Xwq5JcAhBeDqUJuxW23ppOzW6VEbb7FqnGFUy7pqcTXbhkFYNFEqVfOYSN
 uNCuL0I6+6iBPXeK19kJ3dQO8SQWMakFjcldMMvtngUqM+QBOaIfDo6s3fxVNLmyCzPP
 f/nUI9uW1z210eYozVP/N7hKfeH8wezd/OzCG/zEfQhWzKx8II4kuhUs4jGmSYKi6Ys0
 cpVf8W/r2c9GfpexTLn1t+CIYtVPglVzt8SnpzQvrGkYo47Cvm6ajGJvmfanjYdsmllv
 0TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=llwwOIvKhGLRhh4735rAHXtKBgbXi62qgm9FyRRJeOk=;
 b=kfTJDn3rrGvnvaY34RfBszSPiCun/wzn7bn+P+Vh6lf85GVmxBiy442lj+Xwp9Egmg
 MztrHQZqiCLiHQEeAR7QrsbHPFZ4cxQJz1mDUnPLqJq0tB0ZnPj0X03uK8npZRikpKSh
 ESUReu6+QSpNhxE9ztaQ6c+XsEnzK7GgYHkE0n19huZ3ZwkojbETIH5brYgQRCJyNDgF
 JEycAg5xUGSzRBw30W4WzebYPp8MiahqkNw8UqoXgSGl81mzJimIF5gLDaYl6YBgr9aL
 M35DkUja1vT9SqixrYuCVKa2Q4RSG7MiTupC0y4OM9U5bmOytPQFMhb9yFJDhLJdkA1y
 ej3Q==
X-Gm-Message-State: AOAM530AJJMP+czjjX2TVLyAyE9nN3SlYFtkxtLHx0hekt7KewDFdkIh
 7xZcnosouDLzwJH1II+Gv0ydo7wUZzWY+xhcWmChSQ==
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr3757131ejc.482.1612365981711; 
 Wed, 03 Feb 2021 07:26:21 -0800 (PST)
MIME-Version: 1.0
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
 <YBq6Ct8M6AfMr0Bx@strawberry.localdomain>
 <2572efa4-8aa3-32e4-7559-f93e6522d284@redhat.com>
 <20210203151053.GK2950@work-vm>
In-Reply-To: <20210203151053.GK2950@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 15:26:10 +0000
Message-ID: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kekRWqjQBxH+

On Wed, 3 Feb 2021 at 15:11, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> It's interesting that on x86 we've got a longterm request to *add* cpu
> features to the stream to detect screwups caused by using mismatched
> CPUs; so it's not necessarily a bad idea to include it once you realise
> it's there.

I think we would want to do that by checking the ID registers,
not the legacy ad-hoc feature-flags word. In fact I think for
KVM at least we already perform the check on the ID registers,
in that the kernel will return an error if we pass it a value
for an ID register and it's not the value it should be.
I forget whether we try to check this for TCG (the mechanism
for handling sysreg migration there is different).

As a side note I suspect that the first two issues Aaron ran
into are TCG-only and don't affect KVM.

thanks
-- PMM
