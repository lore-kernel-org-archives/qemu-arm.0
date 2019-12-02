Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12574746lfc;
        Mon, 2 Dec 2019 03:15:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqziTLH9MU4JhUwey6KWdz0fmgnEnYo4O/oKMf0ZovYM80TulnObr0pczBbdbsR5SFnoR1W4
X-Received: by 2002:ac8:4447:: with SMTP id m7mr28563553qtn.100.1575285337259;
        Mon, 02 Dec 2019 03:15:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575285337; cv=none;
        d=google.com; s=arc-20160816;
        b=EVQY1Sg3QItf6TjwoV7KjUCwxizut6iz0KgoQmGND18tuKl/Lkki1Lt8Lc6z1Md7J3
         1DI5oR9hytt9ruv7mN0UpS3/blkKba5OL8u0RPKu1Tq1oSsH2mZppLXsdad+LupXaSVm
         ZOE7DL7bE3nXz4ypSQyPdxTxDTTxwo6pGGEzeEh/GmGSFIx+XP0eMEbj4rzj5wn8xfje
         X8p/JwdC8o0JIYs+bJ8VZ63wISLep/OXiOKTBmbimg0VhQKuDeBK22sV/cXgBJK90W4t
         1KkvhE8QNWkY1fYSPaqrAprvRNJIuuLGLQcmf46moXC5gRjdQUTXtabDVrT8/zincEJk
         n9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xN2DMI7ujIHJDmHjQcTmxMXXC1w59NzaLVTz8uCIN04=;
        b=nFF1sQEvB1jjuN/qg1rY3rjjigbfj8uL8oG+1xIUKSHME3F/7OrEYHvKG4+nWorhNn
         p/Vw0gkleskP8OIHcZWssmh1utJSI94WvDUasZfCr+e+0GmwnwuQDmc5Kujq/XzJS/gJ
         FS/gw+NDtWBPo8orDBAvSVwj72et82a8ae/wUD7zh28Xat3PHkuPPPMyk4fPWhz0RTMl
         Exd5Vrqry54TO36L7d2ylNTa5YL9ipeTxpF/wNvX6+c7eq+3l842IEnrP9xXCLR1218e
         glzTrIlANKpnDEDjfN+zkbj8EDihjoAooQw1ODcGVqPFyAvwvkqJlO8EBiOuCu5Ih/DI
         0L6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xiV7tWWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si597535qkv.222.2019.12.02.03.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 03:15:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xiV7tWWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibjg0-0002U8-CB
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 06:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibjfP-0002NM-MA
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 06:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibjfO-0008CI-G3
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 06:14:59 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibjfO-0008Bw-AM
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 06:14:58 -0500
Received: by mail-oi1-x241.google.com with SMTP id l136so16436297oig.1
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 03:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xN2DMI7ujIHJDmHjQcTmxMXXC1w59NzaLVTz8uCIN04=;
 b=xiV7tWWoibjcZDYkMIDqkXiXMYwQCKblJ/ZFe6EVovM5woD8kjN1WRON36vxeVnn8d
 BDRsPARpuFvIKD0QrSwyu/2/ARUmUpy69V10/vOn/5JXjwEclFeeUcTluSAPi+4mEaOB
 1yLMMLFxp3Myfrwugb4PitEGGsqhEF/8cJpPaRLUp/PXNf8VUd0EAxSRf3qmHQuzJX2K
 /nH747q/4IPdw1rM/wWkSOVf23Ns60t+eKFxpkuBgS1BYDe4c8t6+wqr7/JkHDItXvTh
 /FDGseOA/NIAKOu64pMW+KHT9ygco/xPZT680GyAQBS7OjdllB5bFVy1urMAM7j6Doxz
 LHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xN2DMI7ujIHJDmHjQcTmxMXXC1w59NzaLVTz8uCIN04=;
 b=UtCR1Xuqzw75dCbPgSmD/WwgMfu+Ny/uo0MrXhUTC8hqXZ9CZ7+0mcQLewR9PHVqxD
 KFPOAhTi2lQiLfohlDMeQwOdSPKCJJ5xWiljftr0w4pnPzJpDAGd4FnV3Y2kUgLMLnrc
 jMqXUElTHszqpM441xLir01Tu0iRAFApgnn5Zocl2IZFRst8zj9mQz7qHqwaOsD8EZDx
 4PY1mHDbjlZQMxggjzG6BrvFNMFp0C6BMZPYnnd2J/GojzOe+G+Ch6klvAy6v+XDuaOI
 f2bdCU9EVTHwWPovf3XBEFSi66vbBNeZe2OKq5RLJBcKsMVj7jAkRsMu4BHZwk5q4PNC
 ZtEA==
X-Gm-Message-State: APjAAAVks2UDGoewINtIGSDfWU2vDC1B8Vun9m6WrCc0e6voLg9A2e8+
 d8juz6AVqoEw/hSAZyaVl7fEtVFIX1zDH8tANnIe2Q==
X-Received: by 2002:aca:f5cc:: with SMTP id
 t195mr20322028oih.163.1575285297444; 
 Mon, 02 Dec 2019 03:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-4-damien.hedde@greensocs.com>
 <CAFEAcA9kc1-=DkYSqL6DOrLCNKt5uuxnf6-XYJ97g15T--1NvA@mail.gmail.com>
 <20402bef-d615-3258-bde9-12d42c9b1029@greensocs.com>
In-Reply-To: <20402bef-d615-3258-bde9-12d42c9b1029@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 11:14:46 +0000
Message-ID: <CAFEAcA_XqjUhYvKmr-dNJCL3w32WPegqLmTw5FSDwAPZ+HeGkQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] hw/core: create Resettable QOM interface
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
X-TUID: Qc/yMbKOT9PZ

On Mon, 2 Dec 2019 at 11:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
> On 11/29/19 7:32 PM, Peter Maydell wrote:
> > On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >> +/**
> >> + * enter_phase_in_progress:
> >> + * Flag telling whether we are currently in an enter phase where side
> >> + * effects are forbidden. This flag allows us to catch if reset is called
> >> + * again during during this phase.
> >> + */
> >> +static bool enter_phase_in_progress;
> >
> > This looks weird -- I don't think a global for this works,
> > because you might have several distinct subtrees of
> > devices, and be doing reset on them both at once.
> > I think that we only use this for an assert, though -- is
> > that right? If so, we could just drop this.
>
> We say that we need to own the iothread mutex for any reset, so global
> should be ok. Thought, I just checked, it's only mentioned in the
> documentation not in the header file. I should probably add a comment
> there too along with the link to the documentation file.

Ah, right, I hadn't considered that the mutex is effectively
restricting to only a single reset happening at once. If
you want to keep the asserts you can, if you add a comment
noting that these globals are (a) only for asserts and (b)
OK because we rely on the iothread mutex to ensure that only
one reset operation can be in progress at once.

thanks
-- PMM
