Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1018929lfi;
        Fri, 3 Apr 2020 11:53:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypK9FsipsHfD3AQbkINrAQoZp6UkCST96md8MFa9BfWYpEnuwr25MlJPCO7atxwNfHqHyVEe
X-Received: by 2002:aed:2c23:: with SMTP id f32mr9903862qtd.251.1585940027782;
        Fri, 03 Apr 2020 11:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585940027; cv=none;
        d=google.com; s=arc-20160816;
        b=RrhFobzD0J7LzLVephiCAgkVAALq9sbpqsjdpkS0BwxLwZ7Zm89p+4dVSNhe3GD1Wh
         z9YP28/rSg0sziaJ9LtdrfvuA93C+NcNjF8sgiVipnMVyw5NhEeffINaTs70mZIMbQeg
         pT+Vt+PzBJ+mutRxNv3W4SuKwPqkVngCUoUPk8hY+YpIC5Qua00PG8sAFA9z3Ap9mQkc
         7ThuJFRZ/7GbVhmkBdOb+y4K9+PI/stHc4qkWBapMhy5hL4PTxMcC5PUiBhmfzWZCA1d
         extv8eFIoMJg3FknqMgUo7j9ukmwRhFnmov+05Oow/J7u4LPK79apwL3aP+xSoaBQp0H
         Ls2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7q3kAl2Xo3H6Gpuy+vZk/Wwly58KQYgVlWD+BzRC/Io=;
        b=o1mDLpfVaaNhHbUWXIhB62fSHnEhhaAsygFyvHz19DBuzJu7ohJSJHogaZsfux6ikN
         bl3yt/4khOA4rCmlraPUff4t2KqiuCoIDDUfEKWkPm+KgrN241DD/vgSFjjNUpLVro90
         d6KJo+eUka8wiK7BJzY6Y3AdGjpgqI5ruxwZ6WqgyCJq0PkSheY8tB7CgzTkWp/zNS5o
         zk/EWeyaXcmBp1VK3RkKSw5hJMZ75eHsNrRlAdnyXST1l1z+0b+DoAZZn+HAQXkd1ugA
         shUKDr8q78U4oAFLY+dS22yTGUKWxx5rERDBN3i24AW1VyI5vQo3OprtPSFE2r5dUwAi
         9d1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PKgI69lR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si6365920qth.156.2020.04.03.11.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 11:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PKgI69lR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKRRr-0001xn-4A
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 14:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jKRRj-0001vh-KF
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 14:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jKRRi-0008QE-2s
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 14:53:39 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jKRRh-0008OZ-UA
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 14:53:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id v2so8391581oto.2
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2020 11:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7q3kAl2Xo3H6Gpuy+vZk/Wwly58KQYgVlWD+BzRC/Io=;
 b=PKgI69lRuJKeL96iXoglFGVRioB3OYSA32daM9cUrNwj6eyRcxcNIF1UV67g0WEYBj
 q/X6qzADeVKC4d1V3nJbyYAQF8sscNNUtT1v7Gql3k+kAcWT72dUy3xMjxIBtbfYrB7P
 a481i2LukH4skO6TSg3JxTP9UA9LZFTyg1AvzYg5cwyW5pj5UJYDwIQCU3oKVndDJ5hB
 Io2b8Z6+FxpS++aaYTsptg3gODa+WQlBa0Wa6BjYSHO2rLXyQsA8oHd51g5Tah06KqPN
 stuwl49L7eDGc0/eothnLA5M72MJnrJKYQA/pi99vVg4z3TUgvQKPRTYm3GsCliZGl3h
 Fmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7q3kAl2Xo3H6Gpuy+vZk/Wwly58KQYgVlWD+BzRC/Io=;
 b=JGipppq7DMeMy9Oqyue2bhf1pj7oAwsAEoxrQkG6jDf68heWCgqnpI5Nr2sif5ZG6i
 He/SPOyjH5fvu3JAhWJCWYngvlZxODmcTxYiCX9ZjWeuGbIjJMl+z3IXj/veue1duT1D
 cU9o92xUaYUp1CtA8zEW23WrvVaRkwhD4EqLarAOBpeYSL3JEYpuvSQW7fuIkOYM+np9
 FzyGBDm3BzhuLwPBxTphbXtQaSoEIODNIhw+cVqhbBZaQLClkG1uXnd76B2cr1k/yq9A
 +idI9Ux5dkGIPZZej6gzsObeb48Jzw+lwFWxCp9NS2DBf3DWqJEWVfEK+BkbwYXkFSdn
 ZkHA==
X-Gm-Message-State: AGi0PuaCv86j9odxmZkx6gIB3QgJzgGT7wt3K/JziqbvHGTw1KjMNdiy
 xBGfOz7IsrV54YkBKJzXK9SBgVCzOKxrRMzCnPcLNw==
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr7814855oth.135.1585940016843; 
 Fri, 03 Apr 2020 11:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200402134721.27863-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Apr 2020 19:53:24 +0100
Message-ID: <CAFEAcA_E9VQSZRoV5rk-QOgj-F_-w-jhBBVb4p8vUx-VY9_-CQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] dma/xlnx-zdma: Bug fixes
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lPt7GrWGVLQg

On Thu, 2 Apr 2020 at 14:46, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> This series fixes a couple of bugs we've ran into with some
> proprietary test code and drivers using the Xilinx zDMA.

Thanks; as these are bugfixes I've applied them to target-arm.next
for 5.0. I'd appreciate it if you could take a look at the
endianness bugs I mention in a reply to patch 5 (probably
that is 5.1 work).

-- PMM
