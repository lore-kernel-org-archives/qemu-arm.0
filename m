Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2786570lfg;
        Wed, 26 Feb 2020 00:56:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqyluvVscilvVNLJBbDOagRdzZSNFSxS3AhZY+k7fsKrY1buyD5+fw+Un82JLdBiS77iKof9
X-Received: by 2002:ac8:5048:: with SMTP id h8mr3753866qtm.328.1582707388977;
        Wed, 26 Feb 2020 00:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582707388; cv=none;
        d=google.com; s=arc-20160816;
        b=rd8UhqfENv1s856gJkE3BcZFXE+iblFGfP8agJnSzrf/eVGJOYhzYdI0dgu1NE7FLg
         us1i0/tXnjWgI7Iqyobd4Wx3/hjdV8li8HM2js4U78J2DAKwDSa8pZo9harxTSkEMdqO
         NpR5dS3zxs/Jqv4ZBEDnDzS4kPxIx+foB/QWt3AW4XpCgBVGvUnDFCLYTcDcYzZMU4Jl
         3UC/ymc00kKn5DPndiBALyKeXqM41yY6aPcPQOTaM/xPKraEPOPoas0c5JDKbrrHDbpZ
         ceoRwoiqvVumL2l3chHJ7bnW4kFtclQmgTgQnTeydnvhWTpW7EVR+1IAhid79awJg69h
         KHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSlyjrHn0wwwoUfIb0R4V+IQfkjjgd/zT/gBOmtqyZs=;
        b=TPm5IQcZ0qoefSNMXutKeO4rUGcDTTn9rV/N1zIbz9e/qNSI/j7gOe7VQSHT1iGpxu
         Anhp42bVUjcucSA9//sMl6+0lIlcUihoJru4o3xz/Hy2pjOMrvcLk2CvILkXLmrEdDfA
         UqWLyJlFygvHw3wYJEtlfMDUeznGg40YnIgPUWaiiNdmRbyCVPPKWKm/9aBka/UIQ48V
         5YIeI+r2mZZPCjUroY4CK6ytPAwMR/sg55YKbEs7yNVwREIkNeFND49XaQNJN80Lci3O
         CtcHOS6Tb/iEoWz674n61SOINamXB6Z05IIbzTInaW5I6jXLGvXVvqxqD95UWKuAGSHf
         v+Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZYQjnSNv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c136si629893qkb.250.2020.02.26.00.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 00:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZYQjnSNv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6sUW-0008DW-ES
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 03:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6sUM-00087E-5Z
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:56:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6sUK-0003Gq-Ls
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:56:17 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41554)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6sUK-0003DB-43
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:56:16 -0500
Received: by mail-ot1-x342.google.com with SMTP id r27so2239606otc.8
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2020 00:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vSlyjrHn0wwwoUfIb0R4V+IQfkjjgd/zT/gBOmtqyZs=;
 b=ZYQjnSNvIOVLqQ+QFNpbE7OoQHbXusuMyKEPbAKfX3Imv7Szuj6MWa/oO3MeGPbOK4
 ICtSx8BUcZr5yjQiMEOfPUWX4dWrApXG8LoXVvRo/BdzH55z+hbjmGsecAQH45DGwQMA
 AkMpQz9JNhzz+PIjHOzkqWAE9NnaUKzlSFb0CGBvDx5L9J2qkJRfClyJPtiJ2kkYE8cF
 Z1xMvgTwZnP7eVhNa2xs1iTv4r/UjOVmrbF8H3BYJxMOonhNXeUq3h1sreNOj1Iemufh
 VF41ACB1uMfDQmLsDY1ZmXVB7YH4O840VH8AKVZdXtwk7L5cIXoHHTwfBisCeq4voRh7
 /y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vSlyjrHn0wwwoUfIb0R4V+IQfkjjgd/zT/gBOmtqyZs=;
 b=HWdjnz02RhwrI9vwqDn2SROu3UWcKuOwfbEYGVahj4KTEhft1AM7A9PkS+aI+iPROL
 It2QibjXByhvIVZNs+7SYHYisbbB+4ng0JRuoQuWwXFsQ5tdNW36RAXdfO9AN3CKm5/a
 K/QjRDfLFCC7QR7ju7YrrSZ3c2qRQV4Q2I8/RafNp8Ger9bSQC0RlWFVIaNSIKA/naDW
 vVf9cGZXqSHakEyNwAhA7n4+TwK12aq6NbiJGDZnNjjRLNIf2jXrqOJQ+zGU2kwP0g20
 psFQE+YRLzD4UZpsySM6a1fMJ7qPtPHsRPihQOXRpiUFTfcRFSQ/rjhG1kR+qY7+hsxe
 6vJg==
X-Gm-Message-State: APjAAAU0J2HcGkPPGvWx6ojW5QhWg3LyUt95GufrWuVpadzgLqnSaRsx
 lvnBwJs+9iv0fxtWvbDwN0iC4D0Hz9I9Zzw7XTj5ew==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr1974454otq.97.1582707375051; 
 Wed, 26 Feb 2020 00:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20200225182435.1131-1-peter.maydell@linaro.org>
 <20200226085209.ni7oph6odt24warq@kamzik.brq.redhat.com>
In-Reply-To: <20200226085209.ni7oph6odt24warq@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Feb 2020 08:56:03 +0000
Message-ID: <CAFEAcA-Bhuy+2dU3joZoip5=tOkiTSoC+LzdNzyd+urUnoRNXw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gic_kvm: Don't assume kernel can provide a
 GICv2
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 663t2QUfpGrb

On Wed, 26 Feb 2020 at 08:52, Andrew Jones <drjones@redhat.com> wrote:
> Although, many QEMU command line users still won't know what to do
> without an explicit "Try -machine gic-version=host" hint, so that
> might be nice to add too.

In the GIC code we don't know if the machine even has a
gic-version property, so we're not in the right place to try to
produce that message.

thanks
-- PMM
