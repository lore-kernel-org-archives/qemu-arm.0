Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2178544lfc;
        Fri, 13 Mar 2020 07:04:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vst1DwnduHWGo5AKAUnduEEDOHg+LpHD0K5jxWXMmDzurdzRu95pV2ckAZGp1eUFCIZXjoq
X-Received: by 2002:ac8:7585:: with SMTP id s5mr12638515qtq.339.1584108246509;
        Fri, 13 Mar 2020 07:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584108246; cv=none;
        d=google.com; s=arc-20160816;
        b=l5kUKqQBsSAwlQN6tVhHQgi2ilJXc6oMgG3NgM0P1KlKjr1ePGecQVh/9akPO1qkWk
         f8+G4OGKDxVCLCxQ0DARD23ZBIYy8fwxxQtllrsq4DWVLa26NTgt1R+CtUnxdC6oGbVS
         ZVHDHvINFfi87exF9srJvu6l5Xy7+ktzEG0YWyU6G8KnIw/BgVvoLCt4Xho3u9a3uLkP
         zP5PfM61zz2oT+Fdl1XIidCV5iVLgPn5tG51t5yNEGa9EkBTKTtudi7BIbE+nwLpFvey
         xYLI5vcT5wZEiuDFGp4g1lSENzVv7BqlPdxFQlxBhhEwzdJbvxl6BV7XNUTG7UgwKlkd
         32+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yJKUVM/F7YoJrPfZOmqZuyP7n37uZRy29RxD4C3UWUE=;
        b=c/64nBm+gB642In4youFauThw0UyzjY3/Rgf5t+pzscfku2TvOoOGsKBf/RvYyvjgm
         pz9/Bj3fYg1BfEXKS1aY/052Fy+wVAGj93+9OGvMuXmZTJi5C+sCh19vImajtPw47LF/
         KdQN4OTPrTLXg0fcskbgS3IHM/zBhnw4afkHrLebWok/IppC+uQP+COIk4DaHPfxNpn3
         rLYnC8NsfaDolb3vGzO9dJxg42KXBd6T99W+o1tgyww7pzrceq9YUcopuIwyOV/9+xID
         MjGSXu11V+uWIdD3g77WiqH0K1m27bJUWrLutefafjHA1VDM15NJW6mN84I/58rcLQLz
         nL1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K49RXmN8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j125si4969281qkd.140.2020.03.13.07.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K49RXmN8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCkuz-0002jc-KS
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCkum-0002c6-Eh
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:03:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCkuk-0005Xa-EK
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:03:52 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46360)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCkuj-0005Tx-7R
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:03:50 -0400
Received: by mail-oi1-x242.google.com with SMTP id a22so9417347oid.13
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2020 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yJKUVM/F7YoJrPfZOmqZuyP7n37uZRy29RxD4C3UWUE=;
 b=K49RXmN8bTkQyxST+AflvQVp6PBGGmAOL5TVW0pOUYvojmmM/chylVNLkC+RAUtL5I
 6aYcxM6wtf/8tKatztudkBR7vez/iOEOZ3WVM6oFUjcOkQaBTkOekAxIPpPpRDZOGEQ9
 KyJdOKww0M7nRYi4yOkUeW/85iLGN4UwUpRdP6CDui4WZ3a0SFXOddLDxGK0jhBTtOYB
 TcwlVEtpWdoBDAngrYk6DvPf3Q6oZrxUJPSMlpwF3dpmcogKg+NjJAdu2mOGPfrVhRuZ
 3kNojJ19nM+/R4Ot7taTNa0MIjk1mk46De5ELagu+7qanWAxdzIMXJiIIj9xMIkQm4nE
 cZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yJKUVM/F7YoJrPfZOmqZuyP7n37uZRy29RxD4C3UWUE=;
 b=dRZCcIJMJ97d5Pu3NCO+vr7o7uEe6b3XpFL4Kr06yfPvvgO7niU8c41Neytl41bx/D
 hyH608r1H/0ireebiNA5XOo0vaeaUgXTftvCCAd0Nh8/TcVceiuifDwznJkqUnp9TXK0
 lSCG7okbpOQ2CMcinEY8ycNPX6cl4805wDLVbrfePKI4/5+g/NXo47g5Q7wwFS1RZsRK
 jKuZn7tyHIYaNGDgiWaZ0eVLyd3p4DcjK13ElHU73qD9HWqLYNcA67KIVi6wKcZ32je6
 ihPs+JHip0mXK9dktSsRSQSbw5OGza0I5iCFN7bqiz94aVwgFvPKldm2CAJc5iOWIKmJ
 NaxA==
X-Gm-Message-State: ANhLgQ1CP6u9wlM3rEI5/jgg0uZ9oib/6SxEVxs8K+CSNuOwVG64E99o
 QBIYKtK4U95KvnWY22kyJ/vd/0mbd0afJhkbVMxpLT3GPTPRRw==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr6822951oic.48.1584108228052; 
 Fri, 13 Mar 2020 07:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <2159383.tmy0LfLZHX@basile.remlab.net>
In-Reply-To: <2159383.tmy0LfLZHX@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2020 14:03:36 +0000
Message-ID: <CAFEAcA_nGY4_UQ7jMdxuZXR=_rpVZVCAMX+UzEoFtSpcCVy9Dg@mail.gmail.com>
Subject: Re: [RFC] [PATCH 0/5] ARMv8.5-MemTag disassembly
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l1lrBajRNigi

On Fri, 13 Mar 2020 at 13:59, R=C3=A9mi Denis-Courmont <remi@remlab.net> wr=
ote:
>
>         Hello,
>
> The following changes since commit d4f7d56759f7c75270c13d5f3f5f736a955892=
9c:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
00312' into staging (2020-03-12 17:34:34 +0000)
>
> adds support for the ARM MTE compatibility subset (which does not seem to=
 have
> an official name) to QEMU user mode and system mode on "max" CPU. This
> corresponds to MTE =3D=3D 1 in the instruction set feature field, and all=
ows
> running code with MTE instructions without actual tag storage.

Hi; how does this interact with Richard's series for MemTag ?
https://patchew.org/QEMU/20200312194219.24406-1-richard.henderson@linaro.or=
g/

Also, your subject seems odd -- your patches don't touch the
disassembler, only the translator.

thnaks
-- PMM
