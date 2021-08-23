Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2136189lfg;
        Mon, 23 Aug 2021 12:08:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4r50Zjfix6ITkTnyZwNQGG69f1Vm3dUoQduPn4z2bdE3iPyOrzvIBA5NQuMdIKaRbeR7r
X-Received: by 2002:a17:906:c054:: with SMTP id bm20mr12856571ejb.203.1629745730927;
        Mon, 23 Aug 2021 12:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629745730; cv=none;
        d=google.com; s=arc-20160816;
        b=ki4evHEmiZuKE9GKZUGQEv3qFgF89V3xNkK3/HvHUzOtxzu6uGJl8JDjEefwmbqKID
         bNHxEfVRMEkY1VWimvnmsEs28vQRw9A6jXVXjqsURxLwfHtMDzu2LAsG1I1kZ3ZE8Rc9
         Q5tKBbbIKi2jjDZUldCigtBKUaVup7CHidDSo/iOIEx8D4Hi0F7dotNuggyv/jkELu9g
         suPxtw40eFzGVZmg/9QIb+vxhuBUFER2Df7q+x4Bn0opeHlWTDwgAWjoRL5nvjqu/q3e
         J5r1yOAfWgIzkdvavPLJEdyMI0i36D6laxktEf3ravvislZimNEM33j1i0MPTLLAKR3V
         xTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=J1TME3EzdCtiUqCg9EdHYhY8loGQM5BWIi5JacZCBBk=;
        b=MigPs/XVQIaIH2K/mphnLndqz1ImiOInVOinAsGfEw9T6tf88xYPzgyiKi3ki4Fvlx
         RmKdy/+hoQoqCIuS+VBIt6YzzMeB5qJZswU6H9aOkwJuY9t446CAV/xrlQLt22qek1SH
         ZMV84rQVUYclCi+DV283hB/a6ct/BHwYs7ib9gWpthn5pRh+bVMHnj/Ls2l1WEuxFvVA
         eRd+lEhyZjraVOlra81zHqSUXyZC1OfzPCfqeFrXWKUf31Nazl68zQsMIXV++r6HU3+6
         aVEFrSGSylkxml2jz+7fM4zeHsqmpn+9BpDdbIRik61/uoxBhRK/EEvLayigXf+ny/lt
         7dHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OfbLWr4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si10087680edp.44.2021.08.23.12.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 12:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OfbLWr4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIFJS-0002JQ-1K
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 15:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIFJJ-0002Hs-22
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:08:41 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIFJH-0004xq-Gh
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:08:40 -0400
Received: by mail-ed1-x52a.google.com with SMTP id g21so27768039edw.4
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J1TME3EzdCtiUqCg9EdHYhY8loGQM5BWIi5JacZCBBk=;
 b=OfbLWr4bujh7IDarkoqg0CUUpIBeyr1ECgxbfJMAWPKTOnvLNex9tfG8ZWNQWkOP3h
 lU571eIbk0i8uczIQwcvJ4+IVX4/FAlh8/s7k5+qK3LSzZMkkXAZnWneerqd+fR14/bw
 rv8yYO9eFnK/gxdZRY1ruXqbG2p9KeFaUyXDl5uVdbeJhkuCMv0fbmDdZKUHC8FbyWTh
 29ak8/357AXkv37ybj+3gi199EaDdfB5s4jo+RlqilSwgA1CyZ7EORMBkAGbFGMeQK6s
 FchJjlUm07+/Psl7MNTqLEkB3qoWZD/w1c9f2aLIMOGOWsfPJySbsGoBZzEeCaeQt9cz
 kSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J1TME3EzdCtiUqCg9EdHYhY8loGQM5BWIi5JacZCBBk=;
 b=iSDT+YiyxZKuGBEo3Goy/cOkdWQmh2hAVmhGLFyCe2kP6QCt8aJUnV5aLLT3tEXmtB
 50TdnW+braeymAqXmeMI1WKey8llvrJDj1pwUhbmD/xkORTGmC1lIV2BqGdgT3LmL4ew
 yE2Gksi28mvoDLWzFNozmPsmfl/USYio0G09xRABX/ffncFJIGlrA9cIR9+aKhR92ST2
 0ueHIElElXBT5lbt7KG648XEgrQ43Iiiw9TyhbeO3HmHY+I4U/2aUKVChwLjQUuvJl2V
 N2NEzBMtQokfc37d5qOOHvgHhymIDQYohKM8etWm2l7izoAvrL6EvPZnuo+7gQN/a4j3
 6NUQ==
X-Gm-Message-State: AOAM530VjfK9La9i+QtR4JDbEkGp+MXZ+BCNj3FuKQ6IUshzQOZwFaqN
 ipwSLJ/LNWCoWNF5/qAtWs7t3aEjUO4AkP1wfd8MEA==
X-Received: by 2002:a50:ff03:: with SMTP id a3mr38370162edu.100.1629745717818; 
 Mon, 23 Aug 2021 12:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-3-philmd@redhat.com>
In-Reply-To: <20210823164157.751807-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 20:07:51 +0100
Message-ID: <CAFEAcA_KjiBySwKUvL_Rit5VAdvTU6JExHPOAapz=h5vS1jQbw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] hw/intc/arm_gicv3: Check for !MEMTX_OK instead
 of MEMTX_ERROR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XAC03oUUB0sM

On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> We are going to introduce more MemTxResult bits, so it is
> safer to check for !MEMTX_OK rather than MEMTX_ERROR.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but note that these MEMTX_* aren't from the memory transaction
API functions; they're just being used by gicd_readl() and
friends as a way to indicate a success/failure so that the
actual MemoryRegionOps read/write fns like gicv3_dist_read()
can log a guest error. Arguably this is a bit of a misuse of
the MEMTX_* constants and perhaps we should have gicd_readl etc
return a bool instead.

thanks
-- PMM
