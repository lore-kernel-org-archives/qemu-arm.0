Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp263666wri;
        Fri, 1 Nov 2019 03:43:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyR6wbl43jWxaU0l5UstbELjKcTPkaXm98+CfTv6l3fba2mvkamumw5MumRgodHOlEzqZm0
X-Received: by 2002:aed:27c6:: with SMTP id m6mr9835582qtg.210.1572605016966;
        Fri, 01 Nov 2019 03:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572605016; cv=none;
        d=google.com; s=arc-20160816;
        b=dM8EahGQ57eFjR2TMvnRvI1Co2Zh9M/UNSHr+15oBw2jaFSFdRcD67qJEk3TW5JWYW
         6udYFTCzMSz5bSkorV6KcEHWPF1sinbb3JgnfMzew4tQiiuskZgoS8f9TVKovyqAnB4S
         IAzjdjOWVHM/E0A3Wju0CEVKtRQIlnNBAhquIjvIZfbAZh1ZPuJYzKs093iqUVMcQKUZ
         ol32WhMfhHjdQHNq/+B4STI8NFkJXKDhFblRp2Df46PbUyp9ozFPb5hcdjSUx/KanAZC
         eAgcWb3W6G2AC7NaNihHkOEloG+4tXlN1bi7OS+E9JsPMrWhiU0iKR18nEp6609vbPh3
         pNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRCPdvuPxal8vX64DWImMo/sKxIAjv2N6JAaqUg4zcQ=;
        b=JnTw7rL6H+kbJo3kQ6RCCSckMVeADwZ42AC7/R61fPF8KZTburiCZ/LN+xYB1ov1WW
         T5bb8gko2VLwnA770qMVhtAafQufKIBZYsCwXRjCZIQ7zMJJ2AYqLltNou7OCOZ8Uo+a
         FueVLqBSGTsYm8IITh9T1fiYi3bwB/rwT3frDK7KZUQ+gF/aIBWBrdrFb01rm1n6x1Fa
         AAAmOpJVST+pzgvUGtSKFsb1tXjf0GfL6KqasWzxif7KqglTuryu8gIPI/h7ODUlrT1S
         +UGrIS5XuVKUaW26+qaXH8mBklbMFNg81v/ebDgqpMQdg9RyexdBBxu1GcJnikoguGGz
         isDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x66evxSp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x56si4405447qth.212.2019.11.01.03.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2019 03:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x66evxSp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iQUP2-0000dL-DK
	for alex.bennee@linaro.org; Fri, 01 Nov 2019 06:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQUOX-0000KU-UQ
 for qemu-arm@nongnu.org; Fri, 01 Nov 2019 06:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQUOW-0000ae-MQ
 for qemu-arm@nongnu.org; Fri, 01 Nov 2019 06:43:05 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39420)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQUOW-0000Yg-FF
 for qemu-arm@nongnu.org; Fri, 01 Nov 2019 06:43:04 -0400
Received: by mail-oi1-x243.google.com with SMTP id v138so7781057oif.6
 for <qemu-arm@nongnu.org>; Fri, 01 Nov 2019 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRCPdvuPxal8vX64DWImMo/sKxIAjv2N6JAaqUg4zcQ=;
 b=x66evxSpB8HAJvTXNEz6dvUVWvbHxwkG+B7iAyQyK7pRPr1OL/pyKEO94v3impUI+J
 tZBSwhWhtg/F3yZ6qJxykiiaLkxihfLxUPsHkyU6sMP2f7W3a3LL3QuvV0SsQVVyKt5C
 fpNuVqwMqUX5KsXfNUI6EOtQC27Qxoj6NXU73RO+osO7mtwAhwPwJIuQwG2u4xacmtgm
 IfE/+fV0tiBxxIWVIYVlp8yvn8ooYUxYJmLvTqhcLRl+orOGKpRK4bUyCQTFt8YkeuXR
 xwp0sccJjT3FKXEyUx11Z7TtNMpB+2jWVSSx1tLhdVZ6uiwIkT27lt/4GV+8+5DyDb3/
 3ZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRCPdvuPxal8vX64DWImMo/sKxIAjv2N6JAaqUg4zcQ=;
 b=tU4sMkymx5QRzy5/O2XcQlNB6PzLCX58mSWm5oaorIlK7liG8o+OaQLV2amakwbmme
 JV6Nl4mn3mi03RtmlIR5iwGUVaJ0Urxaw0dOhB+bIGqYRsQkNyi0jdNXRlVcSP7xG0Hi
 93PUpy48X4Qf3mWlC6RodIRtML7CATX5Z9O5V9sSYMRxm8ilCDA16twEdfegNuMV1QLP
 2EZ422MX3DeyBpQ1Ga9oKVhPWHRqjdf346ZD63ZngUT7GmwqXcZSh3cXcq4K5vqzj2D+
 yC44DpO7fqABZkZLijmiphh1PcQGea7Phmc+ZqK+r8RDzMo1HnSuk2SfU9kVFfsEjsb+
 zb+Q==
X-Gm-Message-State: APjAAAXKJSbbQ95cVLGXPHqEs1R3g+y1HvBzrPYu9r/Bewh8ihXzfI5O
 MdgK/9PSXoLQ2B+N4ltT4EJT0bwmlH5b+mnPVeaiNQ==
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr2211696oia.146.1572604983188; 
 Fri, 01 Nov 2019 03:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191101103232.3692818-1-luc.michel@greensocs.com>
In-Reply-To: <20191101103232.3692818-1-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Nov 2019 10:42:52 +0000
Message-ID: <CAFEAcA96tfJNVrnQzKyzooy7sJ__WKWWHXdAy_TNy=hSB_DOQQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/pxa2xx: rebuild hflags cache when modifying CPU
 state
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ie1ffNexAXdS

On Fri, 1 Nov 2019 at 10:32, Luc Michel <luc.michel@greensocs.com> wrote:
>
> This machine modifies the CPU state when simulating suspend mode. This
> commit adds a missing call to arm_rebuild_hflags after those
> modifications.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
> I came over this missing hflags rebuild while reviewing Edgar's similar
> fix in hw/arm/boot.c. I could not find any other place where it would be
> missing but I may be wrong.

pxa2xx_pwrmode_write() is a cp14 coprocessor register write
function, so I think that the hflags rebuild that is done by
translate.c:disas_coproc_insn() after a cp register write
should already handle this case ?


The other place that might need checking is the PSCI/etc
code for doing CPU power on/off (and other callers to the
power up/down functions like the imx6 power control regs).
Richard, did you look at that code to see if it needed hflags updates?

thanks
-- PMM
