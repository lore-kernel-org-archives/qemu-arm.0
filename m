Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp592443wrq;
        Fri, 15 Jun 2018 01:53:26 -0700 (PDT)
X-Received: by 2002:aca:ad91:: with SMTP id w139-v6mr407022oie.107.1529052806850;
        Fri, 15 Jun 2018 01:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529052806; cv=none;
        d=google.com; s=arc-20160816;
        b=nz6D9KrxxzcrkTCOsNmEs7oJE9Qcqe4nzjsSxHdjt0wEtHvtWmdYFFiUMLcbZp1QL6
         Yoo+Kr4uwRf9A7LQUIl3K7MvyJIS5nNErVmtLZ4mKmbliMYvHs2tRQS6ofvkHoC5AvmI
         vr57mxqRBPrzwbk84cKAeUq5l+0xQYTWvGa5yJK7JGjKSUjyUSULBPn5sx80GCjZKR6p
         zsDnAX299/SsTaeSaWcIBn7OY0ErYpiCWO5UHqEwbX7anA+54gs3sX8gAKOehCfCQ6QR
         N8jzpurxZVerALiUIO977PenTmPL5pS3TzbJ0WLzJYLwZ7xy4RjN+W06+9PS9I5FIlNv
         TiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=STU9fmXxynDBk/XGF5WF9juhgZsTz8A96XkUaCcmSGo=;
        b=nQ3EgjmUqqwWO9ClKj7m/TlvZSqnwSB1qoj2Ec6px7nlCyKYaRUAjm2NIa03op1Q4q
         JH8TaznKVeublbZQdk5080dqnmCv99P2v1sxi0gwflgZTmjaPzIr63buPL3s7wKHjvPk
         koE1qOvbvZhK5C56zSQnCv6JI4ZZM1e890eAOXMXumR7AVG6LXMwgkkFA5WdG49jW1OF
         Wdl8GAcVxP1BHs5O3sgHshqM6TIffmjLJ97ZJb3YPRGC9R4MC8jttZxQh8SWZEFtgh4p
         gFRK71Z4dW+jdd4e8rRXmlizrtRyB0tqns9JFvnfOhmOFgsCG/w8UuDFP9ehXJzwgxIr
         2FOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XWSUzLYI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y41-v6sor2928884oti.192.2018.06.15.01.53.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Jun 2018 01:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XWSUzLYI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=STU9fmXxynDBk/XGF5WF9juhgZsTz8A96XkUaCcmSGo=;
        b=XWSUzLYI6fQuDu4Fwewk6JY36fHCc/jeDNiMOsnapE4LfAfWeiLB54FwxYDCqyqtRm
         ukbi8SovW08oI+Yl7a30WZIj7hYmATjmp6S1dIxloKSNAyJU8/bf8tavdTcOmvD90pUV
         m0Kfa71bPoRKevR1qFmVbpa262iIAStTCchXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=STU9fmXxynDBk/XGF5WF9juhgZsTz8A96XkUaCcmSGo=;
        b=LF9Im9hF2chblclIQoGbgqbUCOZyYApqLGR614JQgE+taE6FF7iZAWz3GxFFf8sEZD
         jE14uu3L/FLGBSq4Yy+tRG2olruzfesASTUoa+E8AsiAL/+LfaSEH10uC9mvpIJRbJSn
         RdDodrJhlrng0q/vIMjH25mGvw59WUVvX7orVAUZwGflmL5g0QEXuVZeHy6FVfU0QbSC
         I6Fb1Mwge3vFWB5ELy3YhkzkJRP0cc0BdDTUrTDDeLklnORiCuWP6O4wvxlXp3jXjoW4
         NyRi3uij7q1AwUhHKTB0v+bZ98VwD9FDbxDKWrbO5/HJquuk3tD1NvjQP3fVgTlURdPT
         R7Cw==
X-Gm-Message-State: APt69E2TAouDPxkwvOEjySEjYwW5SNI5IOokdYQHdpYydsxJn6R8xM5J
	pLIP2XYwhKcTK+EHXqwoijYDOujjI0/hpLLgzv8FpJx3
X-Google-Smtp-Source: ADUXVKIRhfCmBcq4LsQJLgLGbZR8JOKWQrNke5qED1DLZPiQj9ykjO5YyO6jpBK/iWMsDoN+HEqP8sg4Msh4WxFb0BE=
X-Received: by 2002:a9d:3fda:: with SMTP id i26-v6mr419232ote.126.1529052806548;
 Fri, 15 Jun 2018 01:53:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 01:53:06
 -0700 (PDT)
In-Reply-To: <e2f81a60-6b05-1240-ab18-69d46a29185e@redhat.com>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-6-peter.maydell@linaro.org> <e2f81a60-6b05-1240-ab18-69d46a29185e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 09:53:06 +0100
Message-ID: <CAFEAcA-kmhb4igH2gihSsOe4JFP1u8yienOBDqWvCvqjexftFg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 05/13] hw/misc/tz-mpc.c: Implement the Arm
 TrustZone Memory Protection Controller
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Peter Xu <peterx@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: IACNll7h1QMe

On 15 June 2018 at 08:10, Auger Eric <eric.auger@redhat.com> wrote:
> after reading 8/13, I have a doubt here about the ret.perm value that
> stays IOMMU_RW independently on the translation success. Usually if the
> translation failn perm is set to IOMMU_NONE. In your case you also play
> with the output address space which switches to the blocked one in case
> of failure and you handle access failure through that means. So maybe
> the end result is the same but I am not sure.

The end result is different, which is why we have to return RW here.
If we return NONE we are telling the caller that this will be
a memory transaction failure, so the CPU emulation will generate
a bus-error kind of exception. By returning RW we tell the caller
that it should make transactions for this address. We can then
handle them in the MPC with the correct behaviour for a blocked
access (generating an interrupt, and configurably either completing
the access as RAZ/WI or returning MEMTX_ERROR to cause a busfault.)

thanks
-- PMM
