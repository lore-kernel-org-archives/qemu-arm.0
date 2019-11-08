Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp2695579wri;
        Fri, 8 Nov 2019 07:28:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKo6ejCh3QX11ZV9hyUNTf60NRT3QpW2zmJub1GES9rx6rnKBP0lJJrzxTmHhf5KU8YqqP
X-Received: by 2002:ac8:8f3:: with SMTP id y48mr11233227qth.269.1573226915783;
        Fri, 08 Nov 2019 07:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573226915; cv=none;
        d=google.com; s=arc-20160816;
        b=FeiejunvbKwtjEWqTAnjvOvWZ0f4XpM3iJxDVi3nCJIJrg3x26CV+nOEDhZotbTI2I
         RMYKFECgYaMtWo+Qh68aP7LX2umXBHzF5/43KxeBRdNzF5zQ2/sda0vCLGlmGE4IM4Za
         sfwH5OQiMTTQoQArQkC5mWZOolUZPaEOBpkcDlCiXj5ipv2OvhkQBHztn52si3/RkPxs
         c2njqdmylXpLjFcfboi7c9pRg/FiAeO7oeAGAvTPDmydEi860nBYbRIi0XiUg7bCVzyI
         dPnffl9FVzbT6rOkeSwnuExgFiTE2nUjalSAzVDsDU3uG5axpznzUVDRA1hWpsBqJyOf
         P37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lp11khKQaPh+6YHpEsxMg/MHNXsCrT4eT+O+6aCFVGs=;
        b=fzpLOW9B62Jjufo5PhwapX1FniJ8jJ2usrHn0vJTqjRd+Z6vjAEZGPmrTV149RF/+s
         Q/PuPCE4PCBB4g2qLxl0ufkll1CUzSzJHpiH5DHo16BqmxLcpnKU+YF6ku0lgQtgTZHz
         YjACsaqQobXXQLJFc/lvp67CXVAm1NdiZy1DFyqRu3rg05ZYliAeTT4tJhXSJH2yJ8eY
         UENq32sOBUltGh+FBNfpGCCCNPoQ1naNOYRvavhUCGDlXx0h4EgF5aEKdWuBtykxtxKC
         IUsFnSwgfiTWNKPKXNUB40oe/55MzB7Vu8bsA00nxNytb6V8wFc+EOZGF7Oc2Dw46eJY
         TNIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rMIaImtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si4052052qtn.25.2019.11.08.07.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2019 07:28:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rMIaImtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iT6Be-0007lv-U9
	for alex.bennee@linaro.org; Fri, 08 Nov 2019 10:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iT6BU-0007iG-1g
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 10:28:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iT6BS-0001Vm-Sq
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 10:28:23 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iT6BS-0001Va-Nd
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 10:28:22 -0500
Received: by mail-oi1-x241.google.com with SMTP id l202so5578707oig.1
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2019 07:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lp11khKQaPh+6YHpEsxMg/MHNXsCrT4eT+O+6aCFVGs=;
 b=rMIaImtNNNn23rX7Ii/0yuKzn5Z55YCqSxDMB3+bt871XCGy4dGArABNKwYgI6zraX
 9gIbwFIi+595P5n3pCZPdMQatAEKAmv4ZNe6emrS8p1mal9BtSBfaXhHPA9feM/Cd780
 t++g8QxeBgRx/nGGRXLvMJuOyjVDDN4qgd0DLstUKrs02ZV9HYzapN8MuMLfZBCRrTee
 rxWFyOiOdRf3J4QyAyoioCkeUjUHLnJ9y+R1C1nvxVuYZl/h3t9aFMa2bmL70IbsDR4+
 r+BZqRvdmZg2RlhY6kk/BAjVVMmFjNN7uhwUqBgQ0svmyW5HVTwu5ueTJwqKT2Iet6hq
 l0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lp11khKQaPh+6YHpEsxMg/MHNXsCrT4eT+O+6aCFVGs=;
 b=EO55/G+93WFekXpMNfYZJ14P8/eG4nXgSw33uXYQIJhdIBt1cEJGOoxjjOMGIpMIZJ
 yPi5ALWnrIPIqf+8x9FDLJX8kOnJbY7ANKv96OmrkZ5DVw5gyl4UVxx0Ep2URqQniIKY
 pJOB0SZQi8pZBddQktpYyv1Szd0NWaxDvQkfqLqoAzzSht0Kg6AvMP9wuMLxVnOwwBmr
 qbAvRQUHXJyerAVYNnfCxiZuSZewQnUFZDj2Hc6X/LinertR4QLmI/nJHATdNv+Y+N7Y
 u3E8v5k3mGUlnLOK1OaDgc/Ff7hlUnIpZbTnEJuimtGzWxBSlwxIPVMgvCkX9gHBc8Ml
 23dA==
X-Gm-Message-State: APjAAAVOpCt6mQksNdcAbGb6MVceldjDUZScbKVzXIEwwoq1nbbawPC2
 1jDug67zcAmj1QGemNjcqILQU0mcb/xxbM7TDwjPfA==
X-Received: by 2002:aca:451:: with SMTP id 78mr10302671oie.170.1573226901895; 
 Fri, 08 Nov 2019 07:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <efef625a-8162-5454-128f-489d636563a1@greensocs.com>
 <aae84bfb-e735-0aac-124c-9abbdea882ff@greensocs.com>
In-Reply-To: <aae84bfb-e735-0aac-124c-9abbdea882ff@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Nov 2019 15:28:09 +0000
Message-ID: <CAFEAcA9QW1JTg72YiGDxuEi5Dip99KUxuHAqDnVma1=A_qqbQQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] Multi-phase reset mechanism
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZagLzCW5NbD9

On Fri, 8 Nov 2019 at 15:26, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
> On 10/29/19 4:53 PM, Damien Hedde wrote:
> > Hi,
> >
> > Does anyone has comment about the interface / patch 3 ?
> > Should I try to split it ?
>
> ping

Hi; this patchset is still in my to-review queue, but we've
just gone into softfreeze for 4.2 so I'm a bit short on time
to look at anything that's not for this release.

I do definitely want to get this patchset in early in the
5.0 release cycle though.

thanks
-- PMM
