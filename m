Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1140923lfk;
        Thu, 2 Dec 2021 21:22:10 -0800 (PST)
X-Received: by 2002:a05:6602:1686:: with SMTP id s6mr19269048iow.186.1638508930079;
        Thu, 02 Dec 2021 21:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638508930; cv=none;
        d=google.com; s=arc-20160816;
        b=N4rp/08gZKHo+cEfaPMYKgVY7gDGT/32XyOSXIeI6cxWt+gWSC6r6jbc6oLAFtifyV
         aYRiBfhOElbgYd9NPgp4mLfZeztj9aSAFRYn8HV2kntMHrEJR+x12JSFK/wfGQAet2Ww
         re4Oa/Jrfm0mSchzjPTxb9G4jfBA8+5aJMu8NsFM6SyPmFnK32f6f+Fx8kly6MB3ZrRL
         klhYURBXe91bP30XvTHNKvMpPnAJTbNpftmI5tFgfqzHrQu68tXDYGaOP1qy4STlNETS
         e0WjD7ImNw7xsI3EvAiJC+vg4XbfIpdS824CglacBjfvc9Kko2y4SjI8iveGY/LILou+
         91dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sK6+IUHKECnagMWmHHLsPx+swwwlBUbpQ5fGyoSzNTI=;
        b=YE11u32bOB2cp/nBNcE8fTHtT9RdW6THNL9XZ57MqxZ2HcI6WWom7IUIHgvBLJHrT3
         2TskwqBQMG8KGOHLN9IfP4FCJnXXooTZ9b97IcVxSoCAxO/yFzD0BrXK6+wL/eLhQHQu
         XuW2V//cp+kDqZhKAUX3cevlhJBXeecor5xvx5dYR3UYgGn36dPBXBOA49F3rdDBvyhR
         Aj3qLcumGSUJNsiuTra6jTIDIfa0YEc4/pFK7tPObCbTrq3wW7phDqr7gNsrh28EnXQ5
         9QgXlecXJmoVHd5spcrXFb/0EJbC2LTdx80FQNv6ACDyoqmNsSG/t1GKmyt4gTdqioDg
         XbWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap-org.20210112.gappssmtp.com header.s=20210112 header.b=Hoqe7c2O;
       spf=softfail (google.com: domain of transitioning cota@braap.org does not designate 209.85.220.41 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6sor1057611iol.14.2021.12.02.21.22.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Dec 2021 21:22:10 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning cota@braap.org does not designate 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap-org.20210112.gappssmtp.com header.s=20210112 header.b=Hoqe7c2O;
       spf=softfail (google.com: domain of transitioning cota@braap.org does not designate 209.85.220.41 as permitted sender) smtp.mailfrom=cota@braap.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=braap-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sK6+IUHKECnagMWmHHLsPx+swwwlBUbpQ5fGyoSzNTI=;
        b=Hoqe7c2OgE9IZuKeXSJ5y1YZbumMhX9GhyFV8oOsQ05rpaguLHA5Twn4km2lYulTi6
         dfKZN2Aaw1qpQtaEqrGIJZMhvlsOEa0TxqyzlYsLNO6CMkM3wnEcI8Li/zQEWdHF4Vsq
         oBiC818M6dxY3b5Wg2OjNbuWfMHdeyj0AUjdl4nJCTB8nQpebwb7IvjXjfo6QotVZqb1
         l3osU4XmMC+W8S2tT2Lg8L2/NxlLJtcQmJwE3ka2/XtymIgwqXnVr843GJnGqN8RYzEO
         VczdUv69gm/sJtuhg0gweRn7bZ2IMh58FUWzCavaioxE1OiC9V8KskPSrRRKN/KKPL71
         Qp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sK6+IUHKECnagMWmHHLsPx+swwwlBUbpQ5fGyoSzNTI=;
        b=LuJmd5zts5hSjjGjeNbCNyWe9KBjNnFduUKYET+rZQj+ThtBMB99qbaglwmmo01wU1
         BpuZEMHihmJPu7lWyau+Omc8yQFJbXu1WqP4oOXEoTy3r5suNXjSEhMhglOXexX15JT6
         5udNqKFs1yAYaNKZIZMyDjKd2CVVsB3gUCIk31TrEGJSXjJRR3Ek14ywb3F8lc6uIHJV
         VQIJR7LKAKyXrVkqfAw62JvyztGws4hNb6S7bnhsueO0CCecwX4a2sDzqi9+6B/s6z29
         05xdt4JrYso8aAIA6sLE7ZZuO6Jbefc7Ktei/D96IzbUnrfdGTGQQTnv+7BcWtoz/ZQg
         ybjQ==
X-Gm-Message-State: AOAM5329FD6fb+FhRWf6ZYWlSX6jj7qKIebVnUk8YgJz4Q/W/40TnlWz
	hgiFLGUVtcEYQ8zsbjMTPqxXJ0/o/s0yW+ATRLz4vA==
X-Google-Smtp-Source: ABdhPJyoB+n1KntqFFxQ/d7g0KsP+wVkB6a+2B8DiQpAv65LJXlsPdIL+Dm5HQRGb+kpS2UK7Z7+xAOEtoOPClpP37A=
X-Received: by 2002:a6b:d904:: with SMTP id r4mr18379827ioc.52.1638508929680;
 Thu, 02 Dec 2021 21:22:09 -0800 (PST)
MIME-Version: 1.0
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
In-Reply-To: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
From: Emilio Cota <cota@braap.org>
Date: Fri, 3 Dec 2021 00:21:57 -0500
Message-ID: <CAJY1Aq7-J+nnf1k_HdbUnc3mJvua0VHYPNMokCKeitG1ZbH91g@mail.gmail.com>
Subject: Re: Suggestions for TCG performance improvements
To: Vasilev Oleg <vasilev.oleg@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	Plotnik Nikolay <plotnik.nikolay@huawei.com>, 
	Andrey Shinkevich <andrey.shinkevich@huawei.com>, 
	Konobeev Vladimir <konobeev.vladimir@huawei.com>, 
	"Chengen (William, FixNet)" <chengen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 1zSNyZ2i0bYe

On Thu, Dec 2, 2021 at 4:47 AM Vasilev Oleg <vasilev.oleg@huawei.com> wrote:
> The mentioned paper[4] also describes other possible improvements.
> Some of those are already implemented (such as victim TLB and dynamic
> size for TLB), but others are not (e.g. TLB lookup uninlining and
> set-associative TLB layer). Do you think those improvements
> worth trying?

I cannot find the emails, but I do remember that Richard wrote tcg-i386 patches
for uninlining TLB lookups. Unfortunately they resulted in a slowdown on
modern machines.

        Emilio
