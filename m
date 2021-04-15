Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp745395lfr;
        Thu, 15 Apr 2021 10:45:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkA3W2xdD8OP/9eJLteNsqanpOHFAb2sn0q3bKvVe+uXH6vCTr3PPP/UXj4uNqI+1XM4Br
X-Received: by 2002:a02:cc9c:: with SMTP id s28mr427028jap.30.1618508752773;
        Thu, 15 Apr 2021 10:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618508752; cv=none;
        d=google.com; s=arc-20160816;
        b=rHG7S31r1LugUxij6bSV42yqqiVVRVut1/rgAtJxp8Yzjp95t6zklq6ZGDSGD+AO1C
         E7kuve6tGj7ShAKmVDuG6OUpu8TcHpjs3ynBfdq6JxZjdQ/7o2yw3/VPNvl/AYszLNC/
         KgM4t4xHg9Z1BsjxZb1yw4WX9z5ms3h1FQbSiNqf6kcouekZ7gXK7pRCRmM/+EThnR4k
         q7/Q9OWZeR7X0Qr3/fcFHB9cJOfUX2rcy/0mQTw/XbCNY0X1glY48u9qeMV6iOH/XPlm
         uPhSN3hZCLhVplL/f98kzDadsuXZzVAdNNrKVQ5nOy/GzJ//TGD5Ul+C5lQq/PJjOOkK
         WXdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/i7exIOkfzjaGivOrzAfaS8+wOSkmaJkGms6e2vCLj4=;
        b=iWEowqFP0ZBUm9T2/Zuc37Dbrqp/jM3PcvybkYpkvmffnJabBD5bA/eyjvNLaaKiWZ
         VtJVnZMf7vve5y6cib/Zzh2ISkTubklN6/sgQwYsTrOYWJQC294WvAw5V8rzjTeM+dPd
         vlU3v1UCpALlSI/68lAzuVg7Ib+uXKgiATjBLGRMg8qoKLgPuyRBY2AMX8A5ahz9133l
         qgrq7TAjeOAUpuRZZewlc7tTOwegKcOKztzUbtMsA6t7vW74OALjN/LIttnhhWK74tdp
         /MUNwjIizs8fzZ16E5LKYk3/7zDOGR9JBRtP8nTRPmeshWmZoI5JgCsGElIBS/lF43Jh
         6OhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cUbCFPjQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si3195778ilc.107.2021.04.15.10.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 10:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cUbCFPjQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX63s-0000f0-2P
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 13:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lX5Zj-0001qe-12
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 13:14:45 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:37482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lX5Ze-00068k-Ol
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 13:14:42 -0400
Received: by mail-qk1-x731.google.com with SMTP id 130so11754737qkm.4
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/i7exIOkfzjaGivOrzAfaS8+wOSkmaJkGms6e2vCLj4=;
 b=cUbCFPjQGoHKP8Eq5ZMCVeKk6GZ6EjEz61piJ90R4UKux8MQysMciX9qDJbRfoytce
 ENMkjK/olXuaCzX/G6g9XzQQFy/0S+GteNg7VeTmxDqwnEMGmG4hu3F0eiiEAhhK3PaQ
 i2+EpRQs2ISQHNy4WnVTx3C5H+dx96LPWqYKOZs+nr26Xg/YTdKkkegoAek+QP0SQ03Q
 LG8Kngbf6XmwwgL60rKHlJ+MjcmJPGAytno/qpKPK0+bJuFolIgetNnvHd+KeyaOAF6c
 0nXLIF3SfDoOJDlV2etR4b+jAwB2/TuoqRnbEJ18U5x5LnA+sPVMKy7kN1WctHUj7lt7
 apdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/i7exIOkfzjaGivOrzAfaS8+wOSkmaJkGms6e2vCLj4=;
 b=O6d4qmnXtHxSomSftVAEXvet7xW5RzIKH0ZeZh32jnsTfpEFMPVltKVkLRHwlAcIlP
 5OaT85DEiDIdU4Li1SR7MEgmhpStgIKvp9BF9mc7OkhWAPf9lcqrYYFg/XJAXY35C0+X
 Juzhi9Yg8r9lATgSfYLxjf57SobwehBZkrXONzNVO+ToNsg4k5btJ5dc9OAVChm+eCh+
 hL+g0Ym603riLpnZigwaa/CH09WvcUrcsCRr+terKyTaom+mOLmQXIbKr8xtXdaL+w3N
 nY340qEC5d0supVuLohUjJHHiV6Ho/TChIxarfw89STc97UzQHD6hh9X2FuDfAQR75Dr
 QyKg==
X-Gm-Message-State: AOAM532zraS6oWt6iW/xUB5FC6H2yr0nY0VKez82DeoRkxpQ7ElM/B9I
 l1i+rytLUfTFMTl3gH9IulOvzHLaCXMCw8MR1aiQOw==
X-Received: by 2002:a37:64c3:: with SMTP id y186mr4486943qkb.244.1618506875046; 
 Thu, 15 Apr 2021 10:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210412194522.664594-1-venture@google.com>
 <20210415121257.GD5612@minyard.net>
In-Reply-To: <20210415121257.GD5612@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Thu, 15 Apr 2021 10:14:24 -0700
Message-ID: <CAO=notz+EMXqv+5ndHCGgcwUwGfGMNYt3NCVfx87R9HEutwf2w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] hw/i2c: Adds pca954x i2c mux switch device
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, Hao Wu <wuhaotsh@google.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=venture@google.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7FGVrInIo6NI

On Thu, Apr 15, 2021 at 5:13 AM Corey Minyard <minyard@acm.org> wrote:
>
> On Mon, Apr 12, 2021 at 12:45:18PM -0700, Patrick Venture wrote:
> > The i2c mux device pca954x implements two devices:
> >  - the pca9546 and pca9548.
>
> This looks good, I have pulled it into my queue.  6.0 is about to be
> released, I'll try to remember to request a pull after that.
>
> Thanks,
>
> -corey

Thanks, after I see the pull I'll send out a small stack I have of bmc
boards that can now use this device.

Patrick

>
> >
> > v4:
> >  - Fixed up bug where the i2c_scan_bus wasn't parameterizing the
> >  current_devs list.
> >  - Minor consistency changes in the i2c mux pca954x.
> >
> > v3:
> >  - fixup comment with missing end parenthesis.
> >  - removed superfluous object cast.
> >
> > v2:
> >  - the core i2c bus now calls a match method on each i2c child, which
> >  by default will only check for a match against itself.
> >  - the pca954x device overrides the i2c device match method to search
> >  the children for each of its buses that are active.
> >  - the pca954x device now owns an i2c bus for each channel, allowing
> >  the normal device model to attach devices to the channels.
> >
> > Patrick Venture (4):
> >   hw/i2c: name I2CNode list in I2CBus
> >   hw/i2c: add match method for device search
> >   hw/i2c: move search to i2c_scan_bus method
> >   hw/i2c: add pca954x i2c-mux switch
> >
> >  MAINTAINERS                      |   6 +
> >  hw/i2c/Kconfig                   |   4 +
> >  hw/i2c/core.c                    |  55 ++++--
> >  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build               |   1 +
> >  hw/i2c/trace-events              |   5 +
> >  include/hw/i2c/i2c.h             |  17 +-
> >  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
> >  8 files changed, 383 insertions(+), 14 deletions(-)
> >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> >
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
> >
