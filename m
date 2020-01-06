Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23525723lff;
        Mon, 6 Jan 2020 07:53:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwE/Peov7agZ9foVIY4vVUzaVqJj285u7RDoTupTVbYzXGYtp12bnodwrJNTEEtU+AATpG4
X-Received: by 2002:a17:906:52d7:: with SMTP id w23mr110042188ejn.74.1578326009931;
        Mon, 06 Jan 2020 07:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578326009; cv=none;
        d=google.com; s=arc-20160816;
        b=gV5C3Uie6HUmOVLeYvF24i/XJSWLKu0Uy1HcDYEto5R/PGKfdAFOEak0OyiciTooGh
         6+LgWYrLHhTebdhBoi1caln96SWoXUWSKdXQHL7xEHOzEq7FvGP3AXm9f1XHkV8ZtE+p
         f/JmLXmwke1wOchgkoEXRoAKCoKvm1Pm5Yy+La6ELd0KEQKk88aFsCg9FHa6FqgtU0Uq
         EYDC7gU4yrLgLc1TNGnpU1+Ri4RJMZNUptiVqUfJhPHCACU8VQO9ub61fyiXwbQ4suYO
         VFm5wjctw7ctOhcJD1sXZWSXpu1pgEoHxD+Ax3l02GCrw1+9hc/Sic1EfEj0M3xu1bno
         ep/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7GSEr8UfRwrftY7BRG7tqzF/K/y3mxVtkrxfAfulGGQ=;
        b=Z+JZ9cz/DB5UYz1Ox77M4sHhaokb57sxvrUwhDlW/JalW17jKWh45PyTSiPJAcM9Np
         Vwp5gNnHoydC2UbtKzdFx48McJHC80y4FbdPg+wrmlPe+pwGAIpT8ro/1HG2JIvM7LCn
         xODo34MqhaW7YIyFVexkURl1P86TWbKElRz5RuFfDccBAI9P4T5/VxD+P4V2DpRv3zCV
         nXNxpWB2x6IJN6zXAnwpELOy4t8xY5vSYor1rby9A3WUf7i7aVgbGyp1mtQiXI03GeEa
         e/d2/xu/F/3z+B0Tds+v5BVuRqvd6UmO6Bp9x+3fPenWwToZpyuBKo1hNW1qbG0vX5jA
         rkfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F0TL7stu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lc16si44377123ejb.27.2020.01.06.07.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 07:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F0TL7stu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioUh6-0008U3-GS
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 10:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUgs-0008Pi-89
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 10:53:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioUgr-0005Zt-7x
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 10:53:14 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41232)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioUgr-0005ZA-2d
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 10:53:13 -0500
Received: by mail-ot1-x344.google.com with SMTP id r27so72230365otc.8
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7GSEr8UfRwrftY7BRG7tqzF/K/y3mxVtkrxfAfulGGQ=;
 b=F0TL7stuWDIa4JvtZbhwuXQ+nWQuU5fAdymP1bPoa+uBwDCwJfFwvJlNClv1E27FAS
 5IvskgJtJreXrDwGcohZy9oqdu8tDEPOPlB62CgtG2m6NNEyF+lKzs1aWEsnvvKM8vve
 S153n8pjGUB9BIAKO9UcFMBMrPTycEXwNuqrhabP2/Ik14tYSxmgmH/3uJs2wlnndokY
 MJP8Vryh1A+fgCsAY5JlDO3+bINkBSzYbrWlkWd84KhswGmHhDh81OsEhvH7rdgyMcbs
 IHsK2hcd/DnZ4a5tE0UymEyBSc54REk1FZX+W7RqsJ93egHO9S/Aa61V7aP2ygWUK3Dh
 A4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GSEr8UfRwrftY7BRG7tqzF/K/y3mxVtkrxfAfulGGQ=;
 b=AdGX3orCftRO6Mx7FZJe2WN6r0IwheAVcKxd/RIBkBcTjshhTYdyFG7+sg6oVKpARd
 ltMpDsuLWwhzLq8Z2zgD1twWtl8L9t6mUKyyuX7Nzwox6VYyg7DyDmpr3jOrGgSSUlM2
 lKSLgjydFl9aREMSRoESwK1sOPBzoCzQAQH+9uJr6Cw7j8A+R85dfVIZ6yJ2+0bHy2nh
 GknpTE92+2MlU8NNQ3mKD//zryZMagIPKiPKtmab4mc6fMkv+YN41e67Tl+i1B0Er7XI
 yvpFsPzgYXKrSm5Ta4vISwWsELTNnLZdukZYwOshwKVaRctpHjJG10+EgaeMfkCt9PE8
 UClw==
X-Gm-Message-State: APjAAAWn+0qZ2NbFLvBGWOHTH/ykyeEfliPQOEV+Gt5gm2LKB609xB/h
 QG/y/LIDh27efNwy9LYBE2ULXJuCwmbmkG0vkMKjsQ==
X-Received: by 2002:a9d:8cb:: with SMTP id 69mr96918396otf.221.1578325991470; 
 Mon, 06 Jan 2020 07:53:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576658572.git.alistair@alistair23.me>
In-Reply-To: <cover.1576658572.git.alistair@alistair23.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 15:53:00 +0000
Message-ID: <CAFEAcA9oe-gKknzuNZYWeCyPaL5uokhDUW5FxLGf=LmBv74ggg@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Add the STM32F405 and Netduino Plus 2 machine
To: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2o+yHNE5w/yR

On Thu, 19 Dec 2019 at 05:22, Alistair Francis <alistair@alistair23.me> wrote:
>
> Now that the Arm-M4 CPU has been added to QEMU we can add the Netduino
> Plus 2 machine. This is very similar to the STM32F205 and Netduino 2 SoC
> and machine.
>



Applied to target-arm.next, thanks.

-- PMM
