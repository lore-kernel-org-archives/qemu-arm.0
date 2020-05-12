Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1127505lfb;
        Tue, 12 May 2020 05:44:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypIhQtOWsq3zQkl97JjDUVfnelBaylBDs3Wv76DAYAf7/hozsypDw5Fskguytm/oq+SVWvoc
X-Received: by 2002:ac8:5209:: with SMTP id r9mr21157767qtn.57.1589287460416;
        Tue, 12 May 2020 05:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589287460; cv=none;
        d=google.com; s=arc-20160816;
        b=0tLrL2qsxz0+xK72Akya2XRu1CfPdx27YcBii6R2OqweUNXaBhuivDWneZ+OdDi0iw
         LvgssdKQ1gfvx849RMJUZwrkPHPtMsTgGWsGY0KBN41ZTVRFGpiBXJxZTrb2EV/964re
         PFfNGcBTGUCvuGmO6np4mQSLbHmRSsCoz50wp/tgPGg1uHwczeNoh9u3XtmgG7AqJSZh
         7D/79Eo0TqHeoVugN6LpLmikGVzZ6NX9vR8VFNxgqXFRUOxUY5cnyusIQfIm4ivnFQaf
         ZSEwg7Uoi/6wfoYTyX6Js1ybLyOSbKaYm0ypHgyrcqodZ68+zaNOsSec36BbjQhb03Oo
         OIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2uAqVYHNg2yvKLW2FO44iqltVo4e3uY0P/Jgote3O8=;
        b=m/HoV+HTkNCdKA67DiplyUb45QHJ5yfWnAEMteeElFFs+T0OrpLlKylHEKcAJmKZLF
         Sn1o6S/qrI3u+9/8DMpf7MHUGs9w2v2hWGdDMlY0eotVb4l70ccg9xnpKNyQFZYy+lQS
         kUaAR/YMbvbk35PWIdz+U57+/I9uHOoCWV4wotR6lpPFXf5ACJ2UP7Cld+jwplhrmtCk
         Pnc36C4d3S4WHn4TKPdlKO5tnFYP3zBbaBmlH0h031HUyyXHgUib9AAuwNEi73vcXBcz
         iw6ZnYGAfDdZRveRzVxP82nL79oUDQ2LYzvG6KoNp1ntfdlcLAc1eKEViOrNt4PCwS+U
         SXGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vrxXVlrE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si2778758qko.305.2020.05.12.05.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 05:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vrxXVlrE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYUGh-00018k-RB
	for alex.bennee@linaro.org; Tue, 12 May 2020 08:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYUGZ-00018E-Mr
 for qemu-arm@nongnu.org; Tue, 12 May 2020 08:44:11 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:38633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYUGY-0001Lk-AV
 for qemu-arm@nongnu.org; Tue, 12 May 2020 08:44:11 -0400
Received: by mail-oo1-xc41.google.com with SMTP id i9so2673233ool.5
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H2uAqVYHNg2yvKLW2FO44iqltVo4e3uY0P/Jgote3O8=;
 b=vrxXVlrELUH9qpVByiX/6ZKIwwyt+ti4cYs/QFRu8GBmLxucesBGSXHTGS7T3c084B
 UAPABK+B2q1ehC7wHdZ7NZQw4sOi7JCPPcMO42nTvAIN1pmBtVHfKYY1Bz951w4ag3SG
 eSRa+vs564t87w0Pm3kwwsVbq+YEdF0uaYUzXmqvbznrm7W9Zw4C4Kx2gH7dxD63zF/Y
 pDqmS9F5DtyaeE1w+In+HNBgjaIil58pTb0aK5re5KDwCZ8ItK/YpCauEZhH/YeaInD2
 Pk6E+eD4TYLIInkRzg+30Qmq2ATxGPTgodkWAoj6EP+qv6kG949MR6fZreAecpIVfCo+
 culQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H2uAqVYHNg2yvKLW2FO44iqltVo4e3uY0P/Jgote3O8=;
 b=A1toSmXmGo7oaDk9pcXHzgNl2xGGXyTvszy5ml7RyMQ4K4MYDBVwlw/rdtnRMDP+JE
 AcNkws5fCEkwrUSMmUKVruhTZVNJm+azJyimkTLRa9s7rcM//2N92cW7i6ZA19rrknc1
 +Kye/aOerAYnwSMCnZelNGz7roUrF4reNZmR7mpyzvIjEiF4ZKiqwiNxyyYW5T8tbwTu
 4EOjYJK2ZR/ITjnfV1IAKIo6a5gndmvy2lCRdo0tLSOZ6XlGnCWZPWRXzf5k8Ubc6U2Y
 L2jOKpFXLGuKEGQlUVYksQvT/avG4DGL7E35aMzJDSLj7dar5MvscfZh4uIC7VEUlPKx
 gOtw==
X-Gm-Message-State: AGi0PuawN81BU4IDaqZUV5Zf0EtZCxW1SsgGFyqDtuvpjC3Lw2j2uDsR
 tOZ+/g5vYeSnC3JM5xj4BmV+EPtf+SIm2evFRwT8Vixn
X-Received: by 2002:a4a:3556:: with SMTP id w22mr11981224oog.20.1589287448622; 
 Tue, 12 May 2020 05:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200420212206.12776-1-peter.maydell@linaro.org>
In-Reply-To: <20200420212206.12776-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 May 2020 13:43:57 +0100
Message-ID: <CAFEAcA_T+07JhcY8rGLW6dchsfyez54fenZtJAYV++d+dxzn9A@mail.gmail.com>
Subject: Re: [PATCH 0/4] linux-user/arm: Fix BKPT, SVC immediate handling
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: omerg681@gmail.com, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QA6ePM8HnuOP

On Mon, 20 Apr 2020 at 22:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchseries fixes issues with the code in linux-user/arm/cpu_loop.c:
>  * it incorrectly thinks BKPT is a syscall instruction
>    (https://bugs.launchpad.net/qemu/+bug/1873898, reported via irc)
>  * a stale line of code means we incorrectly NOP SVC #0xf0002
>  * we don't implement the distinction between 0x9f0000..0x9f07ff
>    (should return -ENOSYS if not implemented) and higher numbers
>    (should cause a SIGILL)
>  * we abort() for bad immediate values to SVC (ie not the 0 of EABI
>    or the >0x9f0000 of OABI); the kernel delivers a SIGILL for these
>  * for Thumb mode, we never use the immediate value from the insn,
>    but we always read it anyway
>
> This patchseries fixes all those things. (I started out fixing the
> BKPT bug; everything else is problems I spotted along the way while
> I was reading this bit of code...)

Laurent, do you want me to post a v2 with the -2/-4 thinko fixed
so you can put it via the linux-user tree, or should I just take
this via target-arm.next?

thanks
-- PMM
