Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4953709lfb;
        Mon, 30 Nov 2020 01:58:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy597csmsCoq7Ue8ByLappIKGvefEXbvdIBTo8qFWfeCNH6kJY/FTjVNLQjTK+tiEZ/zPRW
X-Received: by 2002:a05:6902:4a5:: with SMTP id r5mr23862826ybs.443.1606730281509;
        Mon, 30 Nov 2020 01:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606730281; cv=none;
        d=google.com; s=arc-20160816;
        b=UQN/RNIdFZFuNggjxQaXULOyXNFl8pzhus7cseo/iFcb+pZCD4yIdQ+/4NTUB4mFIa
         1pkaZ3E7UPgU4ZwzLmJ+IEUJZnHALSWOAnoogqfwGyxXtYwQr6/UAbRqx5cLElbVE5s3
         F4ooF0TM6Kfz4YqRv/1QXelsbbWkNobjr/kEfAyqsUkXimXlt+2HNC3oWNn15a9Ei45T
         czn0PQSosCtUcCh53qUvdNY59F+Eo1VOjr42Z69T7+s4OTzqcGigzsSxUPYwoTmJcgPb
         +xHlJ4Jb9KPTdwFhNsoJ9vV8gM6YSlrvibSYwKh716mywz6cRWHUHCP1jnoURmFjVdD8
         YD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUv/HaA16FLtvIL6DCU0qDRrtug1XRYMD6wNakuMHtc=;
        b=aX2AkxwPiB+v4sWh5l1yvJWVSk2suaEhSPVkbcIE0SehxXQwyXPoOn8x0IS+9t02c8
         nQLfpw1zjt5AqTh+iyxlz1CQMqLtBebTc/qnQbjDq+Crzd+LJIARmEJeGEBW6q2JRZ9g
         3ylNpNtwXTK6Wt6GPsq6Dy1WkzxdbBnHSXJsVPwRFirAhiXCtr8365FdHtcw6sTasma3
         C2U75wZOxVYcy9J45UPXR9ZvfY+TnhhwPIYT+FZ7brpyeIjoxnnrrL9WRWTUaW8unYWB
         /UDYZMoNVy4jjNEYJp/4Re0+U81Mu3t33YKA2qMQXJck1aRD7w0/h81Oc6f0iv3aheP3
         EljQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ueTnZ64W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si16766057ybq.253.2020.11.30.01.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 01:58:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ueTnZ64W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjfwW-0007WY-Va
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 04:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjfwP-0007WC-Bs
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 04:57:53 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjfwN-0002Qr-ST
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 04:57:53 -0500
Received: by mail-ed1-x533.google.com with SMTP id m16so15198135edr.3
 for <qemu-arm@nongnu.org>; Mon, 30 Nov 2020 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rUv/HaA16FLtvIL6DCU0qDRrtug1XRYMD6wNakuMHtc=;
 b=ueTnZ64W1pB7LbC6TAZ5fR7El3EDWTMsl4lbcz1bY1F11Unvs4HZ8llFIyAn4EBiCd
 FNzuiK351JoTySMNHjKjMLV/qYgvcQrl3/KpdLWqpzxTNGG9eXAtK6VL+f/9sy0JfnoH
 /dbQ/6ia11nOYppEAcrysgt+8L0nWm1qsY1Ri03Fz1wUp83fi7+uMekdNEt7wuDwvtY5
 KoSDWE0rbO2ioRfrwddAFz6xk5WXWXWEaDkFEJT/MPQDjw6UDyVrqG0YLApjEQXPh7IB
 NIEG4VcXA6DUn+NVxlICQRmCCOognAx20tkKsFiYXI6DAvE1P0rlb3G1Y+f5MjX8tHi+
 PewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rUv/HaA16FLtvIL6DCU0qDRrtug1XRYMD6wNakuMHtc=;
 b=myvUh7xep1I73paayjIVeHO6p2WBW2FTnIE9yQCmireonsVt+OyWslgbc2qWfNlE5C
 gLnhQriqvfdKME2Jw99M7R5DihyPgOfuMc+uTa2x/3/OLJwv6m+8bMYkmLFcOtlabfbC
 ROUQCMU7WorgagCy1HMaBoTO2JW/OuCXJ0n3XdR+WOJU/penwMx3+5kpa994g1J+4beH
 hHDXBJZXac5DaAUJ43lcUSCdzXCkqoxvtcHJoF23bzhh1lTxVwG3uzxc+LLUBR4X9W9l
 +NykFM04cGDxW1ISGzHctsjLmpFj5Yy26spxyyMQrZDaTIOyE0W451XXNTg6FQJfXdHz
 fGIA==
X-Gm-Message-State: AOAM531EXDF70BSFlwgqBLR7Q+N6xS5ROPMIscaf65kznBePTTZP0JtW
 vKR2Exj1F6+KtY+qlArnFtFwMkgSetHsfXNopC+Pew==
X-Received: by 2002:a50:fe88:: with SMTP id d8mr20281645edt.36.1606730267631; 
 Mon, 30 Nov 2020 01:57:47 -0800 (PST)
MIME-Version: 1.0
References: <DB6PR0402MB2760BC8DDC21C1FE1E0C568888F50@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760BC8DDC21C1FE1E0C568888F50@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 09:57:36 +0000
Message-ID: <CAFEAcA-4D_QV=WMZuwTMn6b6xbcNyRttt=puD=+-Q45GDjzX1Q@mail.gmail.com>
Subject: Re: cortex-a55 support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CoiLHioI6oVO

On Mon, 30 Nov 2020 at 08:37, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> Hi,
>
> I am thinking to add cortex-a55 support to qemu target/arm/cpu64.c,
> Is this the right way, or I should use cpu max?

If you need to add an SoC model that uses the Cortex-A55, then
yes, adding a Cortex-A55 CPU model is the right way to go.
You'll need to check whether QEMU supports all the architectural
features the A55 has. If it does then adding the CPU model is
fairly straightforward -- just a function setting the initial
ID register values plus probably something for implementation-specific
system registers.

thanks
-- PMM
