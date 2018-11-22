Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp502064wrt;
        Thu, 22 Nov 2018 02:30:40 -0800 (PST)
X-Google-Smtp-Source: AJdET5fsBBbCKj75cWpZ+If7nXHYnio6owbMyBRQvr+xqG9u/g15gKYr/EEB2upQxUr3AZ0zjo4C
X-Received: by 2002:a62:f247:: with SMTP id y7mr10873735pfl.25.1542882640834;
        Thu, 22 Nov 2018 02:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542882640; cv=none;
        d=google.com; s=arc-20160816;
        b=0E+FuUJ4f3pT4XYerF+m4wPGx1GBy4IP8Zys6BPfFFJZ0cxitDc83l/8omNA9HHL2E
         9y0T47/tjWrd3gignkrQF2S3hQOoA+VGSVrxCPRfIrayoiG744pfVAKm+sSU6lwdGQcx
         z1ACEssdRfEpL+KAc02PRTkviJB0KnmTAYzL8lLIyJARdqFikydhMv/LBpghXYmItXnX
         5JoGAjyBp1m6toXhxTUCuWzlBgqH8rz2/oJoDJskebwO21fNSxWGyu8wVTinA6grOEYq
         8bKqq2n/j0j+FwIeVqpLi0ybSfru1wu0y0cDSWnScXfXMJlXf7be0RwKlFKxb8eziAJ4
         s+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=hrzJpSTpeHJ5HoYsvc7JBKOQFqM9b2tXgG8q/Yv/A3k=;
        b=aRW9X4x7/+G8iwkPD37R+a+fmV0hsOW/KpKD0sBIgKu3PxN/MujkkvV2tU4cE2nZO3
         RyLOYIXCTWtI+R6LrKZLnr0kwgWwFoBo9UbwW168iG9N7Cmzcbt8p5B5hawXro6Ji/Do
         kgTDdQiQrvLt+RhYISBNwD58ROD7QpbmtLtbjNUuZh5UkZ7YSXRSOTLFgF0ZwpxVS+Jx
         owRfI1Ue0t7fONMEQSKaJFsAPywGYAu3HoLYSurcgdt0aDALT/cED4fx1NZPbp9GNSmN
         W+Hnsv+mp0Hfou+eax3eTRZeQah38q6rQSX3+QHT6urf5hxxghKQphXfOyIjGxlbV+F7
         9iVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRQ6v6Fi;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b15si31764408plm.431.2018.11.22.02.30.40;
        Thu, 22 Nov 2018 02:30:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRQ6v6Fi;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405219AbeKVVJ2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 22 Nov 2018 16:09:28 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39539 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405216AbeKVVJ1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 22 Nov 2018 16:09:27 -0500
Received: by mail-ot1-f67.google.com with SMTP id g27so7645075oth.6
        for <kvm@vger.kernel.org>; Thu, 22 Nov 2018 02:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=hrzJpSTpeHJ5HoYsvc7JBKOQFqM9b2tXgG8q/Yv/A3k=;
        b=JRQ6v6Fi9sMy1m6M0RDA5CwvDqqqhKtTzhojHgMA7B5lX9riKQPfQT9YxvXbqB1qpB
         8vOuWoNZCN76Jx+JGGvJeZQuQ2r76BaE4mT0bdekTdTX9dwiZ+cuZbrZ4pL5M5VcN8y5
         oV4xA36b/BATvpXmDkmWMLkibgO68ORnb0GLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=hrzJpSTpeHJ5HoYsvc7JBKOQFqM9b2tXgG8q/Yv/A3k=;
        b=bdv6PQfFDMGWRF+G5g5UhmRrnxX9H1UcuZ7x10jtnSTpEDeK0/4T91juiQ6lXwqD6I
         GELeSVKqqLWHLDKHRkmbumd8FoE8ZzZoBOmOlIerjM2aGc5oBolwhHQlKWuRyiNv4aUd
         EY7tCdKdTRtfPq1tm8Kg8l0zAuO/n88sYb6q641gMOpYv3w+o79bnuiN9O/zQeO5Q//w
         ZZ9UBG7JycYBDx+DZ+wtXAWHQH44XYdSE5HPorfzWECFy1Pi+wK6XOaX9doso2S0FjmH
         FhcZobX5RHBTN8esdWYS8OzuUOr6tRk9wHd52TEROzf4tP1AWEM9Mte0kiuDArMauGwQ
         vsKw==
X-Gm-Message-State: AA+aEWazrm282Xv/F1IYIMc25R9RlUSanIAb+REvkERaodWXuuZ7dazx
        8+4d/xmTgB5fzFv9UNgIG1X2NUpm31pPznuPDDARnQ==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr4784694oth.201.1542882637591;
 Thu, 22 Nov 2018 02:30:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 22 Nov 2018 02:30:17
 -0800 (PST)
In-Reply-To: <CAFEAcA_P9d=hOH6sAfdqdBEAwF_am6+Qq9XgAafxbzGfWLEhHg@mail.gmail.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
 <1541672989-15967-11-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-6UKk-WF+M+z0=AN-X7q0XRFLo2RG_yBadDeCas4A5wQ@mail.gmail.com>
 <0184EA26B2509940AA629AE1405DD7F201F7D7EB@DGGEMA503-MBX.china.huawei.com> <CAFEAcA_P9d=hOH6sAfdqdBEAwF_am6+Qq9XgAafxbzGfWLEhHg@mail.gmail.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 22 Nov 2018 10:30:17 +0000
Message-ID: <CAFEAcA_M_Lmv=zouad3FfL6o2DnOeH49xt4J3C6WyGZZ=BsQpA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E7=AD=94=E5=A4=8D=3A_=5BPATCH_RESEND_v15_10=2F10=5D_target=2Darm=3A_kvm?=
        =?UTF-8?Q?64=3A_handle_SIGBUS_signal_from_kernel_or_KVM?=
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        "zhengxiang (A)" <zhengxiang9@huawei.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: yQNMC8U27imV

On 22 November 2018 at 10:28, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 22 November 2018 at 03:05, gengdongjiu <gengdongjiu@huawei.com> wrote:
>>> >
>>> Shouldn't there be something in here to say "only report this error to the guest if we are actually reporting RAS errors to the guest" ?
>>
>> Yes, We can say something that such as "report this error to the guest", because this error is indeed triggered by guest, which is guest error.
>
> I'm afraid I don't really understand what you mean. Could you
> try rephrasing it?
>
> My understanding was:
>  * we get this signal if there is a RAS error in the host memory
>  * if we are exposing RAS errors to the guest (ie we have
>    told it that in the ACPI table we passed it at startup)
>    then we should pass on this error to the guest
>
> but that these are two different conditions.
>
> If the host hardware detects a RAS error in memory used
> by the guest but the guest is not being told about RAS
> errors, then we cannot report the error: we have no mechanism
> to do so, and the guest is not expecting it.

If you look at the x86 version of this function you can see that
it tests (env->mcg_cap & MCG_SER_P), which I think is the
equivalent x86 "is the guest CPU/config one we can report
these errors to" test.

thanks
-- PMM
