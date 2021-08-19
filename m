Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp302861lfg;
        Thu, 19 Aug 2021 06:02:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx+s20nfxidUXmzZDqslb6tZrUVRf7iiJUOPXkMBu51QgFqEataASE3M40L/KQtgnNnjlI
X-Received: by 2002:a7b:c776:: with SMTP id x22mr13477346wmk.55.1629378156133;
        Thu, 19 Aug 2021 06:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629378156; cv=none;
        d=google.com; s=arc-20160816;
        b=NZPJtatTbU+awmQJfBiYflX0w+ZNMUvtC+bqc/JcWhDN1LMRI789NGJyxz734v5XKC
         vmuE2iiLP7iZhskj/EfLlA7Isgi+kltRVL3vrZIJPoildQw6ejWou6Z16FF9tbF1BfVN
         G8P4s9Vb1JaJFUDYZa9+CU9fmiN8E2dh+m3hSgZb9KbS9TrjF5L/nW0FPkZOeIIY/hjf
         n/mZoQ17TD1MFadRcQwy+iLK7hx+1axaIdxVzBfNfUDIMlntymUK5ysZ1DsmmInt/IGZ
         67nFeFffNN/Ks1sRx28dlwkHzKn1VOQmovg2coiYJUe+0pjyJ0ISZ5MmC+rIOC2LE8ZS
         15Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1X7vAtwHmXMO/cjy8YKmYQZzOURPdwo0B19yYrS6zKQ=;
        b=OUrFj/Q2vPegKKRFObURvATpCFnxjl5KYCHl+Gk7jPUbI0ahpuY2HS2P3UHl5XueXK
         S2FHzQwuUuhPpVW51rWJYCxgOE0AU8hELsnlzlIwF8mgiYB8M7EDLCnmwf1NDe9UNFBT
         9l5XBXavRzCNj2emmg3Pna6t+cpKN1VAxsTXFA2vqcUGlRcoKxqzImj0Gf0AZQFdBHdp
         bsT9QzZzFLIfSTKEb7io+YGFVDLFls+Rit3TQ1i4DoErarxeX3ZZX3A+PJumvbAaTnFO
         RipH2YnA5KwFK5iz9ZCFPAo0r2g5tGfBg7JgrGYGeYXgo0kJcnFeI3P8r3tzt9WKAbT4
         HItQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CdaeBxOE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si10521299wmj.52.2021.08.19.06.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:02:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CdaeBxOE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGhgp-0003dz-7j
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhgf-0003di-Fc
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:02:25 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhge-0001iO-1m
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:02:25 -0400
Received: by mail-ej1-x62c.google.com with SMTP id x11so12907241ejv.0
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1X7vAtwHmXMO/cjy8YKmYQZzOURPdwo0B19yYrS6zKQ=;
 b=CdaeBxOEzZBQOoiIDb4WNdQVbztfGUcbT9SVC/Rpiwrbe1vF/+YcDGr4HjmZ7VEJ66
 WD47idVHany/tM+56G43EvhhWA14SE0NAnNjOQYCzxzIQn1ZvbEbWFrcCr1J2VF3txxg
 smh+dHIp6Z14goxL1oCwFDdDVyDq4erB0PsNn/fDTrVRNOE8ivt27Nneg6qoqyUA1pM0
 hAdYNJp17TAf3enyqVSrX4B31+i9keyZO37TPTcsi4080Tn5HEGp2bngsCkCt6eM6BTQ
 BIdW7qKwuWJRtO6X+Sjh2plGoW7Ig/vDkpLzI1J//9s7bAb7KXClpRiNy16Ajy8etjUO
 pRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1X7vAtwHmXMO/cjy8YKmYQZzOURPdwo0B19yYrS6zKQ=;
 b=uGw7oWuhYonNoCDKH02W4pkHnUtmN2OHykYqiklPv8usE5jlWKuzf0DmAmFeTZVjJ8
 cxqQgTJ/ou34B07xp4HzPphJ83gCxU11BCJYbdlmSi+vOojcNgntDT5MoLyDvVSgaa2i
 lulaXFPzFlY53rqTfcWNJUTeMYNAP9AWehlB/X03XdukGNOVDvQYDK22kGy1//sPpArP
 aGQcEbG7htvElEE+OUgt6UxLk/Tqvd74xRf3LUs51e/j2BWtyFIzBuwomkn9jkNYJ2l/
 aKZBMxnvW70dRHLrkiqy3VbVIwxHaCmdBmY85wqDog4eQUdMytzZ9YrYMS46waDDro6y
 AAiw==
X-Gm-Message-State: AOAM531Ov0nZ0+wyIhLVAE5k/aOKM1ohiUxKs993rw280jfX4E04gjY2
 M/LVtWT4m7CQMLgs1YgbdOpiL+8Npz8oxjIwPk965Q==
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr15235350ejb.382.1629378141544; 
 Thu, 19 Aug 2021 06:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210806023119.431680-1-ehabkost@redhat.com>
In-Reply-To: <20210806023119.431680-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:01:35 +0100
Message-ID: <CAFEAcA89zK6pET09ZuDAmOB8O0PHrycmKcWWmTfVK1Tm5wQ=LQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2] sbsa-ref: Rename SBSA_GWDT enum value
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3GUTgnCcyrF2

On Fri, 6 Aug 2021 at 03:31, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The SBSA_GWDT enum value conflicts with the SBSA_GWDT() QOM type
> checking helper, preventing us from using a OBJECT_DEFINE* or
> DEFINE_INSTANCE_CHECKER macro for the SBSA_GWDT() wrapper.
>
> If I understand the SBSA 6.0 specification correctly, the signal
> being connected to IRQ 16 is the WS0 output signal from the
> Generic Watchdog.  Rename the enum value to SBSA_GWDT_WS0 to be
> more explicit and avoid the name conflict.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>



Applied to target-arm.next for 6.2, thanks.

-- PMM
