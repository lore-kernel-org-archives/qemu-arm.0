Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp861656lff;
        Fri, 6 Dec 2019 07:05:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyNSVPlGshoHilRDGbGySgpxyrLbV3nJ2xkm3cepSKlG6pi+A06wSccPFolYPjtJ3CSdZP
X-Received: by 2002:a05:6830:1116:: with SMTP id w22mr11345319otq.63.1575644712188;
        Fri, 06 Dec 2019 07:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575644712; cv=none;
        d=google.com; s=arc-20160816;
        b=mj0iNbZ5O1xmz0FlbbJFxBu0RBV69lcpB26sRxr6KSCdb1YCiJZAJxlmfRMyDLSZg3
         WxY5fgMXGPSxERO6PskC12TROU5y+0LZ6tAdwWNPEboNGh29sREgbW0Lcy3OPVwZ8MO1
         UynEPIyjmlwllPwjqTUV2of34LY4k16y1h+kLy0VkRYVLwY4v/EA6VBo55dy1Kd/X8e9
         LOln6PCMQhRHUPKqQLZ8iHNTrIyHR6DNchhjJG8Fpuo/LoXA7OIyKEQQ+ZyvIQ700JuO
         9ej6wSch3DDMky+/e6JENl4wnng+gtlfBnCl1cnRYp7OrdHuSKRsbkWvmgYeMElEhETt
         UDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8W6n0kR1bFwEF85pvn2wG6pk2VseIJva/P+1Sid05Ck=;
        b=DPKHiNXfQxcC/2Hm13V8E6djE6tODJXaDPc15Un49HuFSlDCrYFDEB3tPqeB6G9VYa
         ShU80FOuhwsVM2weclh9pcXaNRpaC1XA1IFRhn/95yxpgmxYrvNlfQX/0VKRa6QtXszI
         jbuX0bod6lSI5mb157QWPl6r5h7p4fHrTzhv47gDAsc4pJWc1qoUx0fvf/WP74u8mx5a
         OrxmpjfCsyP5h6bXqzoAzEefXQVAvthkmqoxKEFPookCBORHNxAW0wDzwYCVf8WZJtNx
         HMnzcbU4vjM415Qdu6xrmQhWr5J3BYDOnndSvp+BHMMSg086LtvK7OxrMqNMDuy01Hqt
         XkxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C5BwTg0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si7188307oty.248.2019.12.06.07.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 07:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C5BwTg0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idFAM-0004ZE-Ji
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 10:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEXa-0002qv-E0
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:25:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEXY-0007CL-9q
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:25:06 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33617)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEXW-000793-A0
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:25:02 -0500
Received: by mail-ot1-x342.google.com with SMTP id d17so5963554otc.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2019 06:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8W6n0kR1bFwEF85pvn2wG6pk2VseIJva/P+1Sid05Ck=;
 b=C5BwTg0N0cLIemU9LmFGcOSdiqFyMuYJQZ5ZHKz0Cjn4bXHy3oNoY0TRgNcxkfLmlc
 abWDdeqGigWC4/qqEL+gGScnLmmbrdHbewdt3fn5+RnpIRQ0MYAdSnlNPEIixTQgQGYz
 n/QoZHFXTYWSGOW56fJJzOqVfCX2PALnpdaZ7ZteUrdaJwcrINbttNQ9weXd+lbEuTNJ
 WB98kIC6Wbyl2QplcvyLO2VcE9bhSaSIY08aC9YNo12pErbruZWIP7d6hVigkgEaZHF0
 MoKe4cYRwJ9uQGmlhU1GDEV6+pwIIBEaYhg0y7Z31uaG9WkTgqh50O3S3ROKh6Sjcn8U
 rAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8W6n0kR1bFwEF85pvn2wG6pk2VseIJva/P+1Sid05Ck=;
 b=e+WSJJmEfxxaUHCzNS8W9RKircD+zW8alym3QGebVfdM4Oq11C1nWxnC3HgCt4MmcL
 p739igOIE+whkT3+XUTR4qmHLrkd7IUSAr2JTwcts9C8sgnVBwAs5GWXexGTgIin3M8P
 C7XnS1eJAYezfrzgva4krcS+uHh4P+6eROs0rB7wETBeaURzSS8B4H/+yqas0BF1utJe
 zg9jkFepz6mP6XISr4R/JcbQ0PrkplbyyZ2+KlO1uXV7QpG7wzQWIUnBJj9mwZBL1hKt
 rcxVqQAX3pw8LYPyzqvo+9fozhxVpBLw/NBfgyQu3ztVNmmMIBs7Cd733KQVtthhBLJ6
 GTnA==
X-Gm-Message-State: APjAAAUqSjah6ImdyEmq4uXV5XwklSMOUKpeejKT0l6GaklJQFP21ANn
 46iXYL+2pynso5IUZFTaT2OlVmwtpPSvzzRwyiEl0i+W
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr5197606otd.91.1575642300952; 
 Fri, 06 Dec 2019 06:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-7-nieklinnenbank@gmail.com>
In-Reply-To: <20191202210947.3603-7-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 14:24:50 +0000
Message-ID: <CAFEAcA9XxH7zSmm6=KR-2ttfuqdauXxq05SWw++WgGEWw06NEQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] arm/arm-powerctl: set NSACR.{CP11,
 CP10} bits in arm_set_cpu_on()
To: Niek Linnenbank <nieklinnenbank@gmail.com>
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 35e5/fCKIEhQ

On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> This change ensures that the FPU can be accessed in Non-Secure mode
> when the CPU core is reset using the arm_set_cpu_on() function call.
> The NSACR.{CP11,CP10} bits define the exception level required to
> access the FPU in Non-Secure mode. Without these bits set, the CPU
> will give an undefined exception trap on the first FPU access for the
> secondary cores under Linux.
>
> Fixes: fc1120a7f5
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---

Oops, another place where we failed to realise the ramifications
of making NSACR actually do something.

Since this is a bugfix I'm going to fish it out of this patchset
and apply it to target-arm.next with a cc: stable.

Thanks for the catch!

-- PMM
