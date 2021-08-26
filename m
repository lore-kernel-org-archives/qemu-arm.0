Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp745024lfb;
        Thu, 26 Aug 2021 09:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4kl2ELs1suRMdfjIVhGnNmM1TZLX4KfhL6wzy786YYoLj3O33RbURmXNCnM1bIw3neNNY
X-Received: by 2002:adf:f541:: with SMTP id j1mr4781272wrp.180.1629993916633;
        Thu, 26 Aug 2021 09:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629993916; cv=none;
        d=google.com; s=arc-20160816;
        b=h/W1WT9qPZMbSzxGQfO7/IkPGEkO03RWj/lryyLzLR8jW0N47JHHYuN2qM172Pg3aV
         mSlfHyXQVzB1tc0Q9K5fotNoh86ssVTy15srYZpM75tol6GDbNS0wuIngR6bIxJC1gSH
         royTax50F4HkHE48WDYAiVPYmERMHDiwc/4PqvuLPDV+noH/kimTFyF0KzZdh2d5Mu4S
         nhOWD2n1po8l61oTvNO6s+0925x/5OqIDZcCF0ltPvR+0ZRyUfWadffbpomlAkolZHKU
         DuOq7B4u4tWMoSRzK2+EigijCnm3owgpb+AiR+auxUFuKWXQn25rdLTvOB8GeyrlSYfy
         zWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gbn3X/nu8V4Q/q99sHWqdOIY8KbcKu3BBHVRr2N+QA=;
        b=SfySMYY4vWoEBSt5l0Y6CM9s7iaCD9RnWidVlT4qS//4BrLKCy/ivs57LugLX1epcG
         f0J6Ki3DeVPUhK9HhLzlCesrmwxUHFSlNkp14SxSs/bF7GpZeh6TJgMTuYYRmgTzhPcZ
         xdWvCsf6vj8x4RxRGqdJTAkv2fTd4L6jf8is7PDtD/L2FhfNJJZC/EXAAXqvOiA6KbH8
         sgJu/RyPSOJlP06e2vXY2v0f1j16tCHlqSegK/0j1ZEPWpEwagWAmwQQNVjpwrvQfzV6
         AGsDPHx9GXQUGzOOtVr298poi5fTEtTlOyOeBkaQA8IfSC2nzL0hKBPn89N2dqhAm2H1
         jbng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Qc/PYuj6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9si3825453wrm.500.2021.08.26.09.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 09:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Qc/PYuj6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJHsR-0003Jp-Li
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 12:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHoG-0006es-6P
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 12:00:57 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHoE-0007I7-KV
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 12:00:55 -0400
Received: by mail-ed1-x531.google.com with SMTP id q17so5443902edv.2
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8gbn3X/nu8V4Q/q99sHWqdOIY8KbcKu3BBHVRr2N+QA=;
 b=Qc/PYuj6i3pmQpTyohohIb0VgUwKT7dCisfN8DsP/H8yUASYGnvCosfH7dhrxrN4C3
 DI0iwi9kqmHYHYXmi7cW7RFW+edH6zqxQHAgeoWHtAPVXyXWZHuYdawAsdXlzr9/NzjU
 4SjrshQmVWNkuObEJUQpNufhszUe07N1QtOFhVuLQatsH9Lbr7B/WQQ3GNkEmeeCVb53
 dj8Vqb9N/kF5xNtH4fc8cTgm5TCs8YQWCvpaBYGof9aonQ7paYGloNoQ0hiqO1PYew1G
 nkbSVhy0fZ+A6M89QkA4JC+5y9G9hvYvy9SMMXSDvfC71/GKLNMNWV0N7HZMHEX3cSfN
 rO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8gbn3X/nu8V4Q/q99sHWqdOIY8KbcKu3BBHVRr2N+QA=;
 b=c71lyzEj06FSAmdcugiikptBTWaD4mp8Y7vc649N0NUQk8GNfYSkAQcZbFl6reJhsc
 SxtlHzFbargiuRCGgHsnJvJWNbC/OP+aLTn5voe9iHblV0iNVYX7oytUriupWDizlSTQ
 1Gutc+AuDb4WbZYkEJ0RLoTmFoxWHdDi2+PvQWZzGIYTectOB93AvKRPKwbmcEm55yjV
 n03SJcf2Vhe/JS9MEr4CEnhojsQ3a4R4jjzbha4NhC/0RzAbLfs8KdWmaCwhLoifGpbc
 rvEUjkJAhINkiIUUYzP5GV5Nn64YpmqcW7ejwl6WgHPKmbyle159b5EYTRDIHFIVyqjX
 h5ew==
X-Gm-Message-State: AOAM532i2sf840dW1OxSdQQlsXHgByKdT4QJd0QPhOR34K2+L9KNJB5o
 KlsdJ9OX+BB8hUHTBlAUQu3kUdGJ5zn82oqhCE7rBg==
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4892664edw.44.1629993652973;
 Thu, 26 Aug 2021 09:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210823173818.201259-1-tong.ho@xilinx.com>
In-Reply-To: <20210823173818.201259-1-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 17:00:05 +0100
Message-ID: <CAFEAcA8TxyiLhpRcWmjHzEpg5vqtqmJEW5h=RGBd_6kTJw_BdA@mail.gmail.com>
Subject: Re: [Patch v2 0/2] hw/arm/xlnx-versal: hw/arm/xlnx-zynqmp: Add
 unimplemented mmio
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YY4PWzDV569p

On Mon, 23 Aug 2021 at 18:38, Tong Ho <tong.ho@xilinx.com> wrote:
>
> This series adds the APU mmio region as an unimplemented device
> to each of two Xilinx SoC to support booting guests built with
> the standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit
>
> ---


Applied to target-arm.next, thanks.

-- PMM
