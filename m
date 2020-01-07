Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp493550lff;
        Tue, 7 Jan 2020 13:38:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzU7v3/btwzLFMEt+cNvbl6xSyvzZDw38smYnObgyrVRPzriUqV3Ye8DR+cCEKrUcHy0Zgd
X-Received: by 2002:a17:906:6942:: with SMTP id c2mr1643066ejs.12.1578433084738;
        Tue, 07 Jan 2020 13:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578433084; cv=none;
        d=google.com; s=arc-20160816;
        b=kgF4lcpvxzlZJLQkvU0zHDUHwb3Q4lfei7zJ9Pg7RbybMebz38Hz57bEeHRCpKNgnO
         mmeIUHgeCqAy0NdYcP7LkUthaZ13Ao1Q55sI/nn2vBwxnjMMn3DjATy0LNShS3pLw+k1
         VmymkpXn6tuAiY+Zoek2xEJMd8MuRYEwwF3RVJkltbTg9Zx2Z4ZdugQNbYH0Gs5WXMJ9
         24Z9LQ+O2/50evhpSf7CJaw69xqjzAETxGp0rf1ypqCl6+ReE9ymqkAa3NIl9wk8ZBv0
         OUIq7O7NrGNsjSqvay3vBa7ztMalInPNQCVi2IUBfOjG2jpb9xgsVZkRdCrrY5+DP6ZD
         Wkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qRpNJIt+CAndQFmPpKh8U4lC5A1EfPHkDTbFLIWjsAc=;
        b=yyBumH5pzqWBjaxtGl29clI6SlkF0c4zf+hXIf2fkpvGcPCEuB9aOWCRBtMvp9CvJA
         av8MJ4fDbtBh3mtAGhO/3pluDI6qo98lhhznum2+P9aF+Rlhb0KNZ2+Dpwi7mzLJUoJq
         Tuog/leJkBH7Z7UXQnEGit1DPuGb6OKW3rq3VDMSxCyfWQT+uFgIOtouzZTTaY+d09X6
         GurzcZolbOrdtovXp4CR5IQg/N/E3EYdYN30COmsVHLsku8fo4fmtfs/24AXAqYjSYUk
         WpL6qcFi33dabXBvCDnd5iNxlYKP5SAZEvxB5N15YiEWnS2qxR8sulM+7rNG5uUwUvQZ
         X2FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EdgW06jq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gz9si762934ejb.210.2020.01.07.13.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 13:38:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EdgW06jq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iowY7-00050f-Q7
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 16:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iowY0-00050A-G1
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 16:37:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iowXz-0007rF-7W
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 16:37:56 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43423)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iowXz-0007qF-1C
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 16:37:55 -0500
Received: by mail-io1-xd44.google.com with SMTP id n21so909952ioo.10
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2020 13:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qRpNJIt+CAndQFmPpKh8U4lC5A1EfPHkDTbFLIWjsAc=;
 b=EdgW06jqsnL9nc9Hp+LW2X7g5NfcAM5m2NZ7ZmjiOn3Z4oKKbjtaf4aco9DQHuaG3q
 xLwXbkoUx/lBLxE3jW8wUb97gP/dyS+iPo44OVCur7us6HD6LFQVgx+fihT6BPfzWPxX
 yEjzTEYq/nLX/qCNBu/DYNSsKiGRbq7l5GR4iejRz7qluzdhRqU+2Vr5mvMWyfU4Ca7v
 yUGX0XRenbBbIN2cVEqaPIOEi4CWOHHX4ZacfVCGpBc2zGDJtFthd4YajmjqjSi282ql
 ovL+sG18MutNr5G5sAYTn7tqdkEzlIxQsyYeiAMyUTIVtwfiUyw88iZ+ygqWjjOP7an/
 HiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qRpNJIt+CAndQFmPpKh8U4lC5A1EfPHkDTbFLIWjsAc=;
 b=Z0FMbi4aG1NKAyuIp2vvdSqVt6B5ftbromzFSfFXaq+dLSEyO5YpeItn9YRoDcHZZO
 V7/ZijVsa8vHSMkdRgLg5De0lyYbIWX1t/j1Jt8/66GaG9h+4HpeA8UQ/beKFIepi6iU
 FwuFcruML9HXjh44FuyxYg1oh7S4HbMMbIeG4o3gQGXV/u1fAwRFloWVctMvBWaztm1u
 361evcd/xCHU1gpo6J8mzC8UIXc78fthFKe6ukPbTYzAqc/uvldKmGiGMwABQbwOr6AP
 rXoltqMv/ZskCkH40QDFQE9jbVPH/drJ+PjbiCkbYvnEAvuG54Y9BZDd3ChMliOfr1Yk
 FMQw==
X-Gm-Message-State: APjAAAWIucC0uB/ZAy3m3J3In0nC71hvG0dVpIOJeQ6BWgxjWTpa/8LI
 BckLgBaJ6qIvch79X1/8hgCm+kYJJEHTg43CMW2vzg==
X-Received: by 2002:a05:6638:76f:: with SMTP id
 y15mr1476560jad.5.1578433074064; 
 Tue, 07 Jan 2020 13:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20191220202707.30641-1-beata.michalska@linaro.org>
 <20191220202707.30641-2-beata.michalska@linaro.org>
 <CAFEAcA-M=P=-6t5RX0bdO-8fbcd-_Ar_aBNskzs49aspvZ0+7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-M=P=-6t5RX0bdO-8fbcd-_Ar_aBNskzs49aspvZ0+7Q@mail.gmail.com>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Tue, 7 Jan 2020 21:37:43 +0000
Message-ID: <CADSWDzu3jVj7kmcmLwY7D_j2ErN4S2G82ZKMzTsScqanHV=MzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] target/arm: kvm: Handle DABT with no valid ISS
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christoffer Dall <Christoffer.Dall@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SAJBfD3Azlre

On Tue, 7 Jan 2020 at 14:28, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Fri, 20 Dec 2019 at 20:27, Beata Michalska
> <beata.michalska@linaro.org> wrote:
> >
> > On ARMv7 & ARMv8 some load/store instructions might trigger a data abor=
t
> > exception with no valid ISS info to be decoded. The lack of decode info
> > makes it at least tricky to emulate those instruction which is one of t=
he
> > (many) reasons why KVM will not even try to do so.
> >
> > Add suport for handling those by requesting KVM to inject external
> > dabt into the quest.
> >
> > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > ---
> > +        /*
> > +         * Get current PC before it will get updated to except vector =
entry
> > +         */
> > +        target_ulong ins_addr =3D is_a64(env) ? env->pc
> > +                                /* AArch32 mode vs T32 aka Thumb mode =
*/
> > +                                : env->regs[15] - (env->thumb ? 4 : 8)=
;
>
> Another thing that occurred to me last night -- why do we need
> to do this adjustment of the PC/r15 ? If this is the kernel
> handing control to userspace to say "this is not an instruction
> I can handle, maybe you'd like to try" then surely it should
> do so with the PC pointing at the offending instruction?
> Similarly, if we ask the kernel to inject a data abort I
> would expect that the kernel would do the work of adjusting
> the PC forwards as the architecture requires when taking
> the exception.
>

The code here is just for easing debugging from Qemu perspective
and that is the only reason why we even try to read the value of PC
- it is not in any way needed by kernel to inject the abort.
One can use the monitor to decode the instruction, provided it is still
available at the memory location pointed by PC (handy monitor_disas)
- that is why logging the address with decoded instruction,
as it is the only thing that is being done here. Still the address of actua=
lly
executed instruction for ARM would be PC=E2=80=938 (PC=E2=80=934 for Thumb)
that's why the adjustment.

BR
Beata


> thanks
> -- PMM
