Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3004787wrp;
        Mon, 23 Sep 2019 11:54:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMnJg1+PHEXW3+Z4Wht4klxmOIsiTtIFMIR4A66Qeiyqf4G/dLgMcgT9EKmhKs2XyGOhS9
X-Received: by 2002:a37:4386:: with SMTP id q128mr1465631qka.311.1569264881716;
        Mon, 23 Sep 2019 11:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569264881; cv=none;
        d=google.com; s=arc-20160816;
        b=nmxcM+exlNQieDpYmyvbupOPjsFcZYWdzENO5LAW7kCsfrfv/x7rrT+CrKpCTRnlnK
         rqo8vAmSqGJNSwrixvcmJQv4fWO0vNzo2oXc94pKUNXu2jzGHaVjj7TVKUacyXKlsdgI
         ru1nNQeQt12PjI8ZnOcWDixjOf5oXXoEUnAXT+l/LnVZvaq2uHdmMtbo6BOX9ZbMLEEM
         JDnB+WLJiylifwllW9R0mZ8qK6Vmx5/eTK2fnDRjoH22z8UyBYMIGlSOqAaG94UMG5Td
         K1DGT69Kqd9ytfjh21vuqWntLf2t5fmy1TAA3ndNUeIEmt18A1ptVTdg5pQlb9owH7kY
         lJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20wMnS9sE7SkaDy4jeoxOwwRH46kamUBFHZzSrG8KCY=;
        b=q/x45Q857GB5uT29mAAjAGwhagZ4nzi3xptmKsDwouik2Mif6gO7Epp1lB7Zq4ij92
         9HyIuZI/N5AwfkVumlPqdN9xbN5EBA26GAm4f0zQKUhXtmR7Wc6/rBmEqbqvT6C2vwnA
         8x6aqKku5iEegk9K1b2IQ7XqQddWEsQP5SEzaYosMa180ICm4Y57UN9UR3JgIYe+oEmm
         Q498ZZXyFWUsIkb6ThrSGwJ38K2IgL/B+2smTMbLsURNSR7a1LdzWjHhyoKUZbzIgN8Z
         9bPFSsFY4XkCjsb6q3sQZ9h/T1Tcb5eGoM7gVHPnwZPr8YJ/r90Qzj+nAdE2gG1RqMq6
         xPrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eOdgFx6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si10184023qtm.23.2019.09.23.11.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 11:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eOdgFx6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCTTs-0006cm-T6
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 14:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCTTZ-0006QX-Cm
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCTTX-00068e-5O
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:54:20 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34030)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCTTX-00067X-11
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:54:19 -0400
Received: by mail-ot1-x343.google.com with SMTP id m19so11261969otp.1
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 11:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=20wMnS9sE7SkaDy4jeoxOwwRH46kamUBFHZzSrG8KCY=;
 b=eOdgFx6YfAwe3KCrOp+dGTbqYQEsYPFA9u4fl69CQ38e9oVe3Fa+KBeRpJsSkxb+Ot
 NrFSZiuIvSVldvNuuWez+UOkk4gsnSfn61Yks5cnzBZvWwyWM+ABAo0t4cdYQwALcLQ+
 9MXEQzjGeZ0FwEf6j8/O1wFAq3hajYxZGHXwsPREnV/+mhm7WDRIUdigN7wiSw66tlBW
 EdPebOZ/OXKyqXiosyJkthwEIKdAHp5bGAnyB+S3E6GrEfCipqGXp9/S0kdwRroImmfa
 1KFWeNOIwTtvNoYfH2PwYiKDUdMu86SjzaPULytWFn5WMuAMMPiekNjs/8XRBn9tZzku
 d/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=20wMnS9sE7SkaDy4jeoxOwwRH46kamUBFHZzSrG8KCY=;
 b=Bk75Wj0ayNsxxYFtM3Xsb0DUlw717JmoZt9qYeiYPcuFj/GjNhl40Yg+YhpfB/EbvT
 9OOupxAaVk9U29vASeOCb1GzXMPqdvroUjlJOlbICX2vOGb1yBG2yD/e/QM2P+LI55OW
 th2cCLtt6yD30rTEmrQaTlZDLXmEYNV6qde/oEeWR4iXpHUbLxzuEyfim/OdhLV01r2N
 WqH4fIubP/JrVCnv14PfnXJXQOHY20/0s0UQxUd5RPtVuas3YM9qx28ObsuRErFA3Tss
 5enY0jhCBcSSfHnKiy6qJxQyQa/FhhSjhfnOYVC40YkyzT72JfvkU4KWg+CvBbJN7r6x
 yzSQ==
X-Gm-Message-State: APjAAAUYC3cZruuJpnyG5h19fYLMSlS/kAWGl73i4kXOOopBxTv3Makm
 XaDgun3jqld67CF8O4/gfWfDsR0NQED1VVayt3GC6g==
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr1043813otp.221.1569264857480; 
 Mon, 23 Sep 2019 11:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-3-thuth@redhat.com>
 <bd6efd14-9200-98e2-4f76-dda101f85274@redhat.com>
 <8585b93b-e239-829b-d634-b89941f27aed@redhat.com>
 <CAFEAcA9k59CRG23qP-o5PF0mdXvXpszhuxx+GpbpWO+hFdHOOA@mail.gmail.com>
 <4841d83d-4d91-eef6-28aa-c920cb10d9c9@redhat.com>
In-Reply-To: <4841d83d-4d91-eef6-28aa-c920cb10d9c9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 19:54:05 +0100
Message-ID: <CAFEAcA-YHQZptu+owoVZeoEFG9LC1g=L=ASbb6zEg=UJ+RbzMA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/arm: Move cortex-m related functions to new
 file v7m.c
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Auger Eric <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: reb3TSNiOpYN

On Mon, 23 Sep 2019 at 19:51, Thomas Huth <thuth@redhat.com> wrote:
> It also sounds like CONFIG_ARM_V7M should rather be renamed to
> CONFIG_ARM_MPROFILE or something similar?

Depends whether it's visible to end-users or not. If it is,
a different name is probably more helpful; if it's just a
symbol used in the QEMU source code/makefiles/etc then you
might as well stick with the V7M naming convention we have
for consistency with the C files.

thanks
-- PMM
