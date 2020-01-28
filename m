Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp320029lfp;
        Tue, 28 Jan 2020 02:53:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/QUF9xk6U2Z/hG5CjToPGxlZXhfbom/bpqYLIMw5mcmpVOYRAql+86En5ZM0ogzwrRFtL
X-Received: by 2002:a0c:edd2:: with SMTP id i18mr14030974qvr.32.1580208833706;
        Tue, 28 Jan 2020 02:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580208833; cv=none;
        d=google.com; s=arc-20160816;
        b=Q4FZedB7EeSf91v6/iprt8CLv1GqCMsKh8oeURr6mOO5d5tvJ0ItivOZ2ICD02TKjZ
         Y/Yl40k7CVXqi0pRDDioh3lXPm5bgJGQewIHV5/ayaSg2lDzzDdydFZ6n5VdmNH6oN4x
         WGwEgSMKEvK4iQ5dJhIyJD3eaKSL5W6LKsqwp9x0jtxh0PwCIZGLTLTQSOU6y3+pzI1M
         MIjy1dSCImBThXq/f1rf0VEflDiRT57PJnPhN0bPBq2FIdMQu+b8+9zsTrwxIiTrONZE
         L5Y55hbRLN30ihWzrtfH9S8f36sI6OWnEJ+2zvywlBGLHTjordE98VGX90qDpVwlulFI
         pwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/tnOoANi8AiucqC0RhiBN0MlOCWbYT0MR/DWgs9ox4=;
        b=OFRGV9FXbPNflb0mA0DJIPMBmDSRkoQKtNJ2Ei9VVdzHnVEG8geSlM9FtxNLKfwZGB
         kfKJJtHNzlklFfozWo9Krmlik118oL7TmI10Vk1IOII2EVtJAgr8d7IBTJpQvpFHhE3K
         jARunwpQZx2HQVSGCkluCVcKiFt+hlO1LyuguvVO6mP4nmm/PurKABwSVouyz8ybezwd
         kXnulhyha2qTQ+unyP+7vurTOaCpZEbIxI0MuTYHNmlndNI3tEvBcU9ZZoRit+YMTQW1
         6KH1Pz1XDIylLLlxqW1NiN2jP+ed56XPPLHKaXrZzCiR6eFGe+TLg00FShZ9ZpgFKqtf
         6wRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cTMeL1a/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si11256197qtm.144.2020.01.28.02.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 02:53:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cTMeL1a/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwOVF-0001Ri-6P
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 05:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iwOUS-0000jj-3X
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:53:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iwOUR-00056l-1K
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:53:04 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:35304)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iwOUQ-00056H-RE
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 05:53:02 -0500
Received: by mail-ot1-x330.google.com with SMTP id r16so11563724otd.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 02:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/tnOoANi8AiucqC0RhiBN0MlOCWbYT0MR/DWgs9ox4=;
 b=cTMeL1a/3akPzvqxJpscHolCP2ohRw7iBOcyCm6SfaztdvNppyu2vLbUPLRBt13euy
 MPO1D4o/xoAjZuXzEz92SPxoJIq2YkPjAlncxv0p8lbaapNTMJMkeXRORbpQHolZY4ce
 qVd1RdmmUT5BR7gWVa8n5OS1Nlz05XQFagSkdZQB5xiIzZ3SKdIfYOoRcKkODsAzLsDj
 TWSuUogjac6d5YlqDbR5QZAyx/Jhg3zwStSLPf2LCMC7WUu/Waaz5gBAC4rhemUXxwmd
 jq4PB4ddzvC2zhedBpJg8ZrmJvYbBam2LVedOceV4rQjpEtYi7atei7owD0WnvMR9P48
 f8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/tnOoANi8AiucqC0RhiBN0MlOCWbYT0MR/DWgs9ox4=;
 b=nhSf6JQjKV/oCwu5h1laKJA4E3zP3YKjxHJ3qDWkvnmkViSLd1Y2yu9t4jb3RsbjDB
 ZvUKbABYCS9IMX31CVuRLzcn4hOjtA9gUuu4/8FL+7QOOzDHynSiAt+Xd/CtyM64juba
 2ibuws7PRbbgomO8CYLx51ZZ8UYhx0vN6E33eDjWQ0/+TP2ojyPxs2mZ1KoIP5UfjMB5
 R5mJpSNFu3V5JX2Y+UGCAc1DqryJdWaWlL6jDJTNItWmxbU+Uam3TlM3X1C5z2ovGCT6
 YvHge80xkZO8/xYEaX5wNxh4yIHQ+BbmYpgeFkRUk9xmRpqrn9srQ3mFUwQi/iJOvxBt
 fahw==
X-Gm-Message-State: APjAAAWluJKCFNiQ4X8XK3Nd5F3EpU/TwmHCvqRJZPLddfYNyqKQm4pX
 xL0RbBCF5IvLYdZO4B6zttayMPdqid9FxPSFmtTFfg==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr16072594otq.135.1580208781797; 
 Tue, 28 Jan 2020 02:53:01 -0800 (PST)
MIME-Version: 1.0
References: <df1d6ae5-b734-ef64-4ef9-c661e8f797e8@redhat.com>
In-Reply-To: <df1d6ae5-b734-ef64-4ef9-c661e8f797e8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2020 10:52:50 +0000
Message-ID: <CAFEAcA8hib-3YWuS-MajjvokOFCGKUHeuz+XQTBYf8LBz+PuFQ@mail.gmail.com>
Subject: Re: [question] hw/arm/virt: about the default gic-version in
 accelerated mode
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JJ22XE1TeX/j

On Tue, 28 Jan 2020 at 10:47, Auger Eric <eric.auger@redhat.com> wrote:
> When arm virt machine is run in accelerated mode with "-cpu host
> -machine virt", the default gic version is 2.
>
> I understand the rationale with TCG where we don't have MSI ITS
> emulation along with GICv3 so we need to choose GICv2 to get GICv2M
> functionality.
>
> However in KVM mode, I would have expected to see the host GIC probed to
> set the same version on guest. Indeed most of our HW now have GICv3
> without GICv2 compat mode so our default values lead to weird traces:
>
> "
> qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
> qemu-system-aarch64: failed to set irq for PMU
> "
>
> I would like to propose a patch to improve those errors and also suggest
> a hint. But I also wanted to know whether you would accept to change the
> default value with KVM and choose the host version instead of 2. For TCG
> we would keep v2.

As with the -cpu option, the default is there for command
line backward compatibility primarily. Even if we had
better support for MSI ITS emulation we'd still leave
the default at GICv2.

If you want "do the best you can, regardless of accelerator"
that is "-cpu max -machine gic-version=max".

thanks
-- PMM
