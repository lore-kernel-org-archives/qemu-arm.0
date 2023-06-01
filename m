Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp634419ejb;
        Thu, 1 Jun 2023 11:08:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45w5HoNBfZzEwB/9x/HcFYJtMZHnAm/WY0VWEGLBbPilW1vWaJEnKlb+HicUwiMOeeXe4w
X-Received: by 2002:a05:620a:628d:b0:75b:23a0:deb7 with SMTP id ov13-20020a05620a628d00b0075b23a0deb7mr9741217qkn.53.1685642881803;
        Thu, 01 Jun 2023 11:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685642881; cv=none;
        d=google.com; s=arc-20160816;
        b=N/G2pPnQ5jtAQuGggq4sYdYmzCa+nF/NSMgXJBINZezQguIIS4zSV8TY/lk6xrDuln
         V8jXDlISr8AkLLzzPJ/TDxhWl1TedKYPcWNLY5xZas2Wp6tINKK22SRWJ8TqgMVtStYK
         fXRhuNhQD54Q9joR+EUMgt7x3Q88Rb8aqvSmGavNLi1t2qLAqFn8M2cbLcYEf9QxRjKN
         3SqXwAsYHmOb4rxiQTtdFkFFY9nQGy8aT1ADjNa9rNs1Yg1MaMMi3QTqPosNlGSyINpJ
         L8OqXqUDGwMgOjYbKN657xSJNMgtSCmTG16hAx6J0VepW2/47jYwqBS8BmaVpgUQo435
         nqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DMLLg0/IpCNIYDujJyAs57MHeAGwuWOhXqB9Q8IDqpc=;
        b=t8xxqrcW3OFXQTCmwkC2/0DYeh80LYqjU9e3C09KPhlo7G3+XpwbxJGKgwnzDHMhGK
         HZqPV75hqazpnOTLI/cZWSEh7GkNuKfbir0+GQUDk560H+fkNqN9mxGUG7oLYjDgcrsb
         awi8fHs6FMOHMkJg6+oxrFH5sD5rPH5TwZ+N+57m7PcYjxyNxSBN9kBY2h0pt4uabG53
         Qw2iOILmVrEWIcvHyn+0fpTsqs4n0mRjXPuRlmbwy9wjV7AXDKtp2NHcLIxY1wVf0z9I
         zdBrwlD0lzztGb7lWZo0Eix4SKxm+t/eV4ice57HJPxfNHN2gTUcl5y6MeLPzRNCQLET
         p2jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rz1olIo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t28-20020a05620a035c00b0075b22d47335si8901245qkm.70.2023.06.01.11.08.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 11:08:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rz1olIo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4mi5-0006TW-Ov; Thu, 01 Jun 2023 14:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q4mi4-0006TD-Cx; Thu, 01 Jun 2023 14:07:40 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q4mi2-00079B-EL; Thu, 01 Jun 2023 14:07:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C92446487E;
 Thu,  1 Jun 2023 18:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF8BC4339C;
 Thu,  1 Jun 2023 18:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685642856;
 bh=DMLLg0/IpCNIYDujJyAs57MHeAGwuWOhXqB9Q8IDqpc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rz1olIo7apJwuKC4QTaQUdyL2b5Lmsywfvj/gdsYRdycEGo1VhgYTzeOCDAHGI0AU
 RyVgAqk3cW0TxljWsTfX7VCiPFHgSP06KkKqOaCsxuCG7UJeTVI1eMEFQgz+0i4GZ5
 685AqOXiVG+nr2/sJKq2Mye6mr9IhyOajNqoznRlZgpZlKsOsU8ldgqOogdJ8z0D9e
 XVMOcVY2Cs2ZlDD15CvcclscExKDx8Ec8uJMkC6RE32O+0kkT8PgjE9Caf1cYACPMR
 iUlFIGDOcrp8eKAIBGnHc26tMVEDtcJx0B3RD5jHsC6Ipfqf14SwOxLAbT1bxWuI1O
 NQe8dieYFKeiw==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-4f50470d77cso1614945e87.0; 
 Thu, 01 Jun 2023 11:07:36 -0700 (PDT)
X-Gm-Message-State: AC+VfDzIdiCJVGPRzo3CT9VJd+J+WpxSbWcIqYqBY9ybadnbkSZbABUU
 Xa2DbEYQ+NVUzcjT785/LQOfcA1ZZ8MK7qmFhB0=
X-Received: by 2002:a05:6512:14f:b0:4f4:ca61:82bb with SMTP id
 m15-20020a056512014f00b004f4ca6182bbmr487651lfo.45.1685642854170; Thu, 01 Jun
 2023 11:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
 <20230531070229.334124-2-wangyuquan1236@phytium.com.cn>
 <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
 <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
 <b663fb55-dc8e-9fd8-9d82-7e693c3c4ad3@quicinc.com>
 <CAFEAcA_9Prr1xV2s1q2+GpWEnrsEEFT57bbLDnop5Hw3MaxM0A@mail.gmail.com>
 <ZHjcnHMWM9/Rl9lv@qc-i7.hemma.eciton.net>
In-Reply-To: <ZHjcnHMWM9/Rl9lv@qc-i7.hemma.eciton.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Jun 2023 20:07:23 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEWHcCF8-i_ytqnt9eif5pXGOp2YVcN_9hQ6+Vbwdfw_g@mail.gmail.com>
Message-ID: <CAMj1kXEWHcCF8-i_ytqnt9eif5pXGOp2YVcN_9hQ6+Vbwdfw_g@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Graeme Gregory <graeme@xora.org.uk>, 
 wangyuquan1236@phytium.com.cn, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hHdhx459kQyo

On Thu, 1 Jun 2023 at 20:00, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> +Ard
>
> On Thu, Jun 01, 2023 at 16:01:43 +0100, Peter Maydell wrote:
> > > >> Also has EHCI never worked, or has it worked in some modes and so this
> > > >> change should be versioned?
> > > >
> > > > AIUI, EHCI has never worked and can never have worked, because
> > > > this board's RAM is all above 4G and the QEMU EHCI controller
> > > > implementation only allows DMA descriptors with 32-bit addresses.
> > > >
> > > > Looking back at the archives, it seems we discussed XHCI vs
> > > > EHCI when the sbsa-ref board went in, and the conclusion was
> > > > that XHCI would be better. But there wasn't a sysbus XHCI device
> > > > at that point, so we ended up committing the sbsa-ref board
> > > > with EHCI and a plan to switch to XHCI when the sysbus-xhci
> > > > device was done, which we then forgot about:
> > > > https://mail.gnu.org/archive/html/qemu-arm/2018-11/msg00638.html
> > >
> > > Ah, thanks! That explains why we did the thing that made no sense :)
> > >
> > > To skip the migration hazard, my prefernece is we just leave the EHCI
> > > device in for now, and add a separate XHCI on PCIe. We can drop the
> > > EHCI device at some point in the future.
> >
> > Why PCIe for the XHCI and not sysbus? At the time the board
> > was originally added the argument was in favour of using
> > a sysbus USB controller (you can see Ard making that point
> > in the linked archive thread).
>
> The original argument was that having the device on the sysbus
> 1) enabled codepaths we wanted to exercise and
> 2) more closely resembled the development systems available at the
> time.
>
> 1 still applies, but I'm not sure 2 does. Ard?
>

It was always primarily about #1. This was also the reason for putting
all DRAM above 4G.

I'm surprised that the EHCI never worked, though - I don't see the
point in keeping it in that case.
