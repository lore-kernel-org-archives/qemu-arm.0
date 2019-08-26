Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4326030wrs;
        Mon, 26 Aug 2019 12:52:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxP9ywPJa+ja34Y/tS61JEQG6SUTiWtrT41Rlr1aJyNw2BSH+ugmGHZpblXBC5Iv2yOSCzw
X-Received: by 2002:a50:aed8:: with SMTP id f24mr20566388edd.90.1566849153921;
        Mon, 26 Aug 2019 12:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566849153; cv=none;
        d=google.com; s=arc-20160816;
        b=giZTC5YAIVv/QfHHdkZ/28woh+9kQiakWB7LgTmf4rz4rDqSMZhKxnQ8hCjSY5ei3M
         swcRBt/NrIe2F0rB3ONhZDHCO6BZR494x8hkH4oEBrATMt8KpyLQP7CbY11ojxjSBg45
         xBvlISrXr9BF6pa4WtdDRTuDZrdmQ5OsUlsGTsPgYO5yUh4jjjsp6KldGEAtbVu1pez+
         G52c9ZxyNKGvrO0jSJQHX1orDmVTYbGz8oPhh5PVXW+wYofrzKwkG9HM/1JuXghGQa1J
         ICECx5klJOmqjA+PRHp2oI4Xh/q79sJJc6XvI8hbAAVJJRK/lyfmU09KVLUI5F1sI5L3
         WOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wsQSsDSjnsZdMZjo0xkidElZrPufq2mB/NuD5hpzyXs=;
        b=CNuhNK+Vm8XwTCR8LNdWSpPsQ/9dVVvkcYCFO1E0rjQiTy+/+zG37q5N1Mqp/Mr/Lh
         KsytB3Sd0gq8Hu2zr1OS+oXDC7vMiexJlg7+EultXZ8rQg2bpQYPi7LNktVrytNGHqS6
         f+tRI89Z2jNSrzR6xRAWQluHDggy8nOOpPdiSM6A+MdhMC5cjcbfzY0enDXNS/LMa6IJ
         2pQ/noHoS0shPVUQcoswtgXlYriwIyy5jLwwZyzVkWXzcB2OKXvccgOPm/aZTi8lLkzj
         1TNGzTcq9TeaDBZ9X418AYh4PW4nok2ailoRneiloYZOT1m65BXMQ62KB0hOB/Sojgz4
         Qjxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yedh92U2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k21si6206779ejq.31.2019.08.26.12.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 12:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yedh92U2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2L2W-0001AC-Ud
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 15:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2L2J-00017y-RN
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2L2I-000637-Nj
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:52:19 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40718)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2L2I-00062y-Ht
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:52:18 -0400
Received: by mail-oi1-x241.google.com with SMTP id h21so13086082oie.7
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2019 12:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wsQSsDSjnsZdMZjo0xkidElZrPufq2mB/NuD5hpzyXs=;
 b=yedh92U2qt1mqgFz9E39m85vTwfHGFBp+qOYfs2OohBGe72iKcAWC//hdrk72Oepcx
 3EcV9WqR8/mhn41b1iAhrgj3mk4+Gag+0woPOuJcQ7+tQQ2a50JwkPcA81pLbFWGXaMt
 NFamtPhFKvJn3nXfJCFohcQrGPnOIziv85CKOSPktmIj+724DHcDH8hS5T1ydJXIaTwA
 yghYiy2MKO95xwzNvQgT0LdmAm68tf4k+hEETEdX/hpIgkTEpQkSSMSMXxeGPPQy1/o7
 TbTp5/G0zARlln8WK9mKYA+ij7+LXwp6MQeR2BGZfhtUniOws4aOVgq6Y1ghH2fHMSWw
 cCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wsQSsDSjnsZdMZjo0xkidElZrPufq2mB/NuD5hpzyXs=;
 b=XWPQ8NDmHCDPud2foK1jN8rWog17Q6bC/gbT6l7lZhQBF2CLNAVdQL4dY8O5KzqoT5
 cPjsXVXrWhe+8lQefumu10cSHbBdUlaZ877atBnspCMYFHk7HN0hq2yGdR53qFZDAMF6
 VE2vNcT72/pQv9GZqJ2gmkgpWLoPsmrh5GKmYHZW7U/ouyjpcoD2JPy/zSR0utfLTSpn
 GdNabwzfzNNAqXfxEgy3hNTRJyan/UQ3LDmGB0WU7wYppSbV2RdrG0KOKvOknDa86btD
 hOZceJBqYeR2XyZx+Kpu6SA/Otg/h4AQ4R8Uiqjac/gwFzj4LV9p1Wmz/v3yR7Zj+JIo
 I4Vw==
X-Gm-Message-State: APjAAAUUVK6mbsDGQ1a8MhrM3pIU7SmvN1nY9yANj0ML//AOShuXCzub
 vhyrDwTgvJL/n1WQ9FtufiyMgva1dDM6bIOwKaCUew==
X-Received: by 2002:a54:4718:: with SMTP id k24mr13169665oik.146.1566849137740; 
 Mon, 26 Aug 2019 12:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-62-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-62-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:52:06 +0100
Message-ID: <CAFEAcA8N_X28ADZgoaWhj1wHjD5Rg48pfU+bYicZw4NmDW8DdA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v2 61/68] target/arm: Convert T16,
 Conditional branches, Supervisor call
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
X-TUID: /CNtU+SD8F1R

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 26 +++-----------------------
>  target/arm/t16.decode  | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 23 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
