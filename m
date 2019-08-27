Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4605518wrs;
        Mon, 26 Aug 2019 18:34:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZVZs0XKuSBECpaNEGcdmrYuPuVOJ45fbUOnAbhUkkKyUvc7t7I9QzU0gnkRnh7Mih+4kU
X-Received: by 2002:a50:cc99:: with SMTP id q25mr21257041edi.207.1566869641166;
        Mon, 26 Aug 2019 18:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566869641; cv=none;
        d=google.com; s=arc-20160816;
        b=GyAAD+5dHrk/MuaIgCy8v4LFih2gVY7S8KggrUSBxhDiRoJLpB3x7qCv7+SOO8KvFy
         vRvD6C0qrzj0Zd7iQR3sAG/Nct51lWIbzWEfG31mYBw2AQ07i4bqZBCeKTpTDOauVxnw
         mdsHnoVVvGWaI/VSarIldC4LCnlrBBxtlWglb/ejq+i5XXQUjHY/ashQKk9fG4N47Yls
         ZWjFmi8UVfdVYqAFuJ0NXUpnASMpFRbyu9FGO+GhVIspI7LIshNO1IClxGpvL4tQZu4x
         PkOTTKaa6u4YdEhfCfVoOasRjXJtrqc2ASPrMbd/ztC9N1wE8yGwrPzlYhv2PiV2BoR9
         u90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:message-id:dkim-signature;
        bh=mDeShrRdVrY6FWytadHxdKrz4l1eQGKAvhSA522f2Kw=;
        b=E35NTYoTor3HlkoJ8O4jR/ZaNhLcD/+IL+0lVrn32t2tL/H2dC+ArbGGveUyWQKUcu
         vs5yLd5ihpar/0SsCHROCT7nNKYU4cq6B29zyFqSEDIZJVAQoP9KIuYAIEvO4nhvOA1n
         3CxBsYP2lBOkTIEHlhkKc3GKzax5Fc52/BlgYkesk4SbYvxvEmU1aXgXo/gIKAHKIaQH
         WiMN1X7/7GwJ50mWLyHnL7CV/96BNPPecUww6cmacaDcYbVtowzFDzIbweaWyqj5/4vo
         2PEefNXsGPR69H3T8vdm65H3+7Gz20FsgKe7oNh1oWCWseWA2w4SqowTICeXf7sa8Ua7
         y0IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZB2pFPJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si8342185edb.330.2019.08.26.18.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 18:34:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZB2pFPJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2QMy-000410-65
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 21:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1i2QMq-00040n-45
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 21:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1i2QMo-0006Vk-Pr
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 21:33:52 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42304)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1i2QMo-0006Uv-Jc; Mon, 26 Aug 2019 21:33:50 -0400
Received: by mail-pl1-x644.google.com with SMTP id y1so10893183plp.9;
 Mon, 26 Aug 2019 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=mDeShrRdVrY6FWytadHxdKrz4l1eQGKAvhSA522f2Kw=;
 b=ZB2pFPJb8dt3c+N9F68RvdFDQv5MHt9UIXy3FmocH29TDaHEjFIOS7uIsJGzdHYIkI
 a2DgwahV+Zw6rIroDh0ILY2nw/T0G3Iit3a84DFgdPhqAjk4IuDhDui+G4Ds/S6DDmZz
 Attd4Yo6kwsXGd2cvxZZTlD9px/nnZx2St62eCXQjZ865GVCWhEYxi+TiHXeRIUIM5Ct
 kgfxQJ1HaFQdvak/JQUPUHAJMF8ckY+USqxAokEh+G1jFUcKpVST+6TdJwcyN3AYBJf6
 2w8JAN42AIM5qG0LwgmqyTkjpRZeEJgTEHE7NEwdnqsEsaL2ByerGqQA4mB9z7xy2cbV
 iUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=mDeShrRdVrY6FWytadHxdKrz4l1eQGKAvhSA522f2Kw=;
 b=TPcjBeIOrHZvH/z453pIqTkuRAUZyxlqFje9hR+1l3hTjjL8ge+vJhCXqopmGMvueP
 FbBamdzk6EpMt4BlisWzpy5a21Ihhahp2I78Lhy0SwCcb1Mxu2JN0ljChkwQYKu3Rxe1
 +fzAbPIgNCb2RxRWpyzlmV7s+OMR92ZjCSUkvL33jsnqnTY5pW6kIuFhUXySTL3I1SjQ
 KSbtB8QzS2zw5ImXKymXaHNHJovLA05TEYRDhG8Dst7vZBFpe2hLJEVXOOGnH34kzSPV
 B74Uu6lpPIc5MucaFjlbir6Td9usX+B6P2hD/W7sd+J9wbupHS1y+zMW3nNVXVX0Mav/
 Vzvw==
X-Gm-Message-State: APjAAAVvB690+KoqwgwHbhLGmjS0dsqjqexO9wGQAcnxCR5P8CK5Of5W
 a6bZMw4FzkhOoAlfXgwwRL0=
X-Received: by 2002:a17:902:6f10:: with SMTP id
 w16mr20666106plk.143.1566869628876; 
 Mon, 26 Aug 2019 18:33:48 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id z24sm15880987pfr.51.2019.08.26.18.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 18:33:48 -0700 (PDT)
Message-ID: <a27a64ed891e57c24f778ac544a73f3f77a0de01.camel@gmail.com>
From: Rashmica Gupta <rashmica.g@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Date: Tue, 27 Aug 2019 11:33:43 +1000
In-Reply-To: <120fa848-808f-b918-14f3-ab9d1f06532e@kaod.org>
References: <20190816073229.22787-1-rashmica.g@gmail.com>
 <120fa848-808f-b918-14f3-ab9d1f06532e@kaod.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [PATCH v4 0/3] Add Aspeed GPIO controller model
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
Cc: andrew@aj.id.au, aik@ozlabs.ru, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SvNxOpqQij3n

On Fri, 2019-08-16 at 18:21 +0200, Cédric Le Goater wrote:
> On 16/08/2019 09:32, Rashmica Gupta wrote:
> > v5:
> > - integrated AspeedGPIOController fields into AspeedGPIOClass
> > - separated ast2600_3_6v and ast2600_1_8v into two classes
> 
> Rashmica,
> 
> This looks much nicer !  
> 
> Please take a look at branch aspeed-4.2 in which I have merged your
> v5 and modified slightly the ast2600 part. 
> 
>   
> 
https://github.com/legoater/qemu/commit/02b3df3f1a380eec4df7c49e88fa7ba27f75a610
> 
> I introduced a gpio_1_8v controller with its specific MMIO and IRQ
> definitions. Tell me what you think of it. The principal motivation
> behind these adjustments is that I don't know yet how we are going 
> to instantiate/realize the specific models of the AST2600 SoC. the 
> GPIO 1.8v is one of these extra controllers. 

This looks like a much better way to do this!
> 
> Thanks,
> 
> C.
> 
> > v4:
> > - proper interupt handling thanks to Andrew
> > - switch statements for reading and writing suggested by Peter
> > - some small cleanups suggested by Alexey
> > 
> > v3:
> > - didn't have each gpio set up as an irq 
> > - now can't access set AC on ast2400 (only exists on ast2500)
> > - added ast2600 implementation (patch 3)
> > - renamed a couple of variables for clarity
> > 
> > v2: Addressed Andrew's feedback, added debounce regs, renamed
> > get/set to
> > read/write to minimise confusion with a 'set' of registers.
> > 
> > Rashmica Gupta (3):
> >   hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
> >   aspeed: add a GPIO controller to the SoC
> >   hw/gpio: Add in AST2600 specific implementation
> > 
> >  include/hw/arm/aspeed_soc.h   |    3 +
> >  include/hw/gpio/aspeed_gpio.h |  100 ++++
> >  hw/arm/aspeed_soc.c           |   17 +
> >  hw/gpio/aspeed_gpio.c         | 1006
> > +++++++++++++++++++++++++++++++++
> >  hw/gpio/Makefile.objs         |    1 +
> >  5 files changed, 1127 insertions(+)
> >  create mode 100644 include/hw/gpio/aspeed_gpio.h
> >  create mode 100644 hw/gpio/aspeed_gpio.c
> > 

