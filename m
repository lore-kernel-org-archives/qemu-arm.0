Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5980857lff;
        Tue, 10 Dec 2019 07:45:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwIxd5UyDcH0V771dPNhZPvfsplFaO7+VM6btL9g/ySVBe4G7uAQgqz6YmtwUUIOG56golH
X-Received: by 2002:a9d:39a5:: with SMTP id y34mr24545099otb.146.1575992740781;
        Tue, 10 Dec 2019 07:45:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575992740; cv=none;
        d=google.com; s=arc-20160816;
        b=i/02eCZ6bdbfjIGeXU4hTZdQZI7d61rP6Rv9bGCsSHO/naONpAMNjLmmBgM4VRU9jk
         pBxCtUQ6HExbr3j/GdDJmQvlA3uU4Yhrozo5bzMD7fx9/QtikV4MTmqMCXRei0cYhwpR
         9H/nc4Ap+CuBgKDHLxfeGoyrvSYTh3TUResLWNfh/GcNddIjlGhlvU2r8j3G2+NUxMPS
         6bO8uyjMN8tdJ01mO0jRixVEToincD02CS0SxD5c3GXPv8Nb9dEmuHj+gF3BvSGGoeQp
         N21nmAeNEhHeDzQDfK213QYraEaK3qLxmB8490OMOu+NiOxPnwEcVK3k9FyrsaKoXtVM
         +62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BzYMi4o5tnM8+8TW8stcvngRLupsDB7APP25/5NOis8=;
        b=GTPwyG0ONeGJkZ/6RZWSFkE69lvO5ksYG0LeHxzDA2CdKlnFvxBXtxqJGoBKyXFZK6
         0jfzLh/YI4UQfWChYAgZZHlnNbj7kE8JLN+7bHz6HSzS350srUYPYLMJ5s4XkjACzylX
         8T12UdycXf3U4zvXekNf2ngNzvXRL/4mjVwR5JIYqJhBZF/QZ/glPPL1AT4KiaDljCqJ
         qVsMs/GYCjb+o7A6Fljisz1RYwNzbK2oS5+xmQ247tZ7SlmbjAVCTodpgj7n9fbG7iAM
         r8i5azK/7xy7DeyLW2gAlr7DJW/l/6vthjnlJE/cPNZ1Oml4CjDI/40bBW3LKW4A3EnD
         rWlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZBCDTLuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si2039290oia.232.2019.12.10.07.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 07:45:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZBCDTLuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iehhj-0003mD-RE
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 10:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iehhT-0003dl-C5
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iehhR-0001GR-TN
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:45:22 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35476)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iehhR-0001FC-NX
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:45:21 -0500
Received: by mail-ot1-x343.google.com with SMTP id o9so15893205ote.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 07:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BzYMi4o5tnM8+8TW8stcvngRLupsDB7APP25/5NOis8=;
 b=ZBCDTLuHsRqqPhpnw4ZnsfkALAysJLqfOnpMBc3TMKRYD6D1NyxSzRa5jCvEh7L+iF
 NTcF7Ca5X9bszyyN+jiD/YOS2ElDgIjzAWxZSLn6LLGnQjuHjPGJM8Z5z+7Y80WO+qc5
 KJ86U98SQSBQm5fxuXJiElNJOjpvZpQKCXRURRAXPuLvYCwxJWQtzatrv4SbO3hQFB3d
 3/qeOX2T0cjjO85pDILjRiIryKDVheA2ebR10xvGL+pq/z4Ud85QaYCQf62qJou/AOiH
 brk5EaJAKmJrm4vQHf1x+azvax3X1wegaq1YPieQDb19N9BLvkHmCFYNYGethOlLNCnP
 yapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BzYMi4o5tnM8+8TW8stcvngRLupsDB7APP25/5NOis8=;
 b=HpxIC64w2E9I4Z1yGiwbJu/CMpk49j2k76QnywEwi6Z2PoLqP70cIJ7cX7/qmI9vQi
 7V5vss2YW+eN/wmS3W4yNUEOxxVvTnKiATGHf+IbmC7fa2hdK8sYJXuLLXPgPssOS0zW
 +1NfN1naTHQH8oHg1rbBoxRLpkfUXl0KXQREh2acrgTCNXB5kER8EQRdaYR4xYp7d4+K
 /sOR0le/RM3Z4dqKQ5910nYl3oQja+SQ3+nGrJTMvHuKUtrPlM8E54LkHksetE4Ze98v
 usSkWY0LmGrqHImAuc1vuqT4q7bmP29ZfsIFjESGmHSsjMHPeKJKNrBuKtkDIT5PZP6l
 sUiw==
X-Gm-Message-State: APjAAAXGGHs9qlev+pmJGMYIIO0LUbs7yWuTtGxKqFcX9fJLDlncPSKJ
 3ZaS9lwj1yYuXbO/LyKiTlAnhJ6PK0TIJX+/pobpnA==
X-Received: by 2002:a9d:6745:: with SMTP id w5mr25113617otm.221.1575992720459; 
 Tue, 10 Dec 2019 07:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20191016143410.5023-1-drjones@redhat.com>
 <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
 <20191206155327.7adiyjjkjh56mg2t@kamzik.brq.redhat.com>
 <596d07e933cb4da48dbba5b492e81a2438e78a2f.camel@redhat.com>
 <CAFEAcA9+G0jprsHRQp8g=Aso+2-_GhoWkDGx4WWxoC88maOKEg@mail.gmail.com>
 <20191210110531.psjzlikir2ep2omo@kamzik.brq.redhat.com>
 <CAFEAcA_M61hTzU=qCiUbR4V9Mnwd0phFNqTJG9pCWKreVmjy6A@mail.gmail.com>
 <20191210133254.22vcpvr3eabcnthe@kamzik.brq.redhat.com>
In-Reply-To: <20191210133254.22vcpvr3eabcnthe@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2019 15:45:09 +0000
Message-ID: <CAFEAcA_Y0bX4mg7PyTgcfKtZQkPw+DEibW6OjVRGyA29mC7TiQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
To: Andrew Jones <drjones@redhat.com>
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HH9HFtmJ5R7b

On Tue, 10 Dec 2019 at 13:33, Andrew Jones <drjones@redhat.com> wrote:
> So the ins and outs of this particular timekeeping issue (to the best of
> my knowledge) is that x86 has implemented this behavior since
> 00f4d64ee76e ("kvmclock: clock should count only if vm is running"), which
> was committed over six years ago. Possibly x86 VM time would behave more
> like arm VM time if kvmclock was disabled, but that's not a recommended
> configuration.
>
> PPC got an equivalent patch to the x86 one in 2017, 42043e4f1241 ("spapr:
> clock should count only if vm is running"), but when stopping time during
> pause on spapr they actually *keep* 'date' and 'hwclock' in synch. I guess
> whatever clocksource 'hwclock' uses on spapr was already stopping when
> paused? For x86 those values diverge, and for arm without this series they
> stay the same but experience jumps, and with this series they diverge like
> x86. I don't see any way to disable the behaviour 42043e4f1241 introduces.
>
> s390x got what appears to be its equivalent patch last year 9bc9d3d1ae3b
> ("s390x/tod: Properly stop the KVM TOD while the guest is not running").
> The commit message doesn't state how hwclock and date values change /
> don't change, and I don't see any way to disable the behavior.
>
> MIPS has had this implemented since KVM support was introduced. No way
> to disable it that I know of.
>
> So why is this arm-specific? arm is just trying to catch up, but also
> offer a switch allowing the current behavior to be selected. If other
> architectures see value in the switch then they're free to adopt it too.
> After having done this git mining, it looks more and more like we should
> at least consider naming this feature 'kvm-no-adjvtime' and probably
> also change arm's default.

Thanks for pulling up the handling by other architectures.
I think I agree that we should change the arm default (ie
we should just call this a bug fix, since the old behaviour
seems unhelpful generally and is more random accident than
a deliberate choice), with a switch provided just in case
anybody had something depending on the old behaviour.

-- PMM
