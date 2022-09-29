Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1120987ocs;
        Thu, 29 Sep 2022 08:58:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5RcWEKEevPoTWORZrVf390guedo+zxYgb1hDvgp+hfnG0Sydh17t6Fk9kBh7vj/bNuaADe
X-Received: by 2002:a05:622a:1114:b0:35b:bb43:a88d with SMTP id e20-20020a05622a111400b0035bbb43a88dmr2918561qty.139.1664467104475;
        Thu, 29 Sep 2022 08:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664467104; cv=none;
        d=google.com; s=arc-20160816;
        b=t2j3cRLWzVwWwFLOM5XeXd6O5RhxMANGRivPYpUiwXg05fDIl4MX4Cz6L6I5a+v6ye
         XIW/WnX6xwBTe//grsSCm7XQUxnZi+e7G705NdKIo+7FI2A8RPsN9YER69LZlYay9xQZ
         PppKQxbYQNYD77Ek25WGJh4kYwZrhj5tuMpXISEWfHBJMz8xKB4A3qpSaLwNAZpbjuZ+
         yzPpJ2Q9iTiiI0uVXVD5GAuTGjJFFfRc0K0CQ29/tWqxh4Su2fx8fLmqjh75YZuu5V5R
         vcGcaZUcTPQ7zfGVBgGvM8UsxRQnlIeBDdXu1JK04S7gs4ruNMi/p6FgSOPRKKPv1b1g
         gwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1ZX8EvEFOBPZ8Nn8dtI/ON1GrCSiq6zEKTfRiGuMpPQ=;
        b=aSK9Rnr9Eohnyl9OQJYGIuX2BwF6eoYXdCpWMjOjczwPLwW6f2Q7jIiV1bLIglWNN9
         qDv28NCHUMjB5DaZ4G6DyLJnTj07zhUbC7SVV3feXIyVbZTkfpiN0GzLIE3U1puOqLwA
         xkw7KRTpnC02xutjVT1XxlaOhGIQkWfvNVG+fIrOpUCM0WEKOneaN6NbcDvVedft0yEH
         ER5HgJa7VMsVkM5qFsss5/oUlHRMpYFAZCtods5x5+hvQqCT14L9Zb7nt2LZk/NcZbuu
         rc/h4nKqJ26jKbTYjLDyzJ+uALHy9yRtzSIQK8+qNqiU2DfvIWgGkqJaeLwE4h2OLxc4
         KU1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oBLteeba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv12-20020ad45cec000000b00496d4a5cdc9si4930385qvb.522.2022.09.29.08.58.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 08:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oBLteeba;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odvvc-00015k-0X
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 11:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odvsg-0004mV-0A
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 11:55:22 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odvsP-0004Ap-7p
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 11:55:21 -0400
Received: by mail-ej1-x636.google.com with SMTP id lh5so3679550ejb.10
 for <qemu-arm@nongnu.org>; Thu, 29 Sep 2022 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1ZX8EvEFOBPZ8Nn8dtI/ON1GrCSiq6zEKTfRiGuMpPQ=;
 b=oBLteebaGEh642DLK7mUSkKnfO4NSEIIDfTt2QkNAKzPfywTphEVxxMeEflXOQNUpj
 +O36JpLejvTsEZeesVkyipAT4677EXMf8qTf/+dUtQ0XGYtmUA3vtTMOA0HvFBo4q5W+
 pTIp0cTFfdQ6LhxxHkV0lmv/3z2vFekY97ZsT2QcdbIdhvgXZTrr4BYs2aWCq2sljxwu
 Ig7j3xKvUY+qkUyS2GET9f0mo/gmJiPv9N7HgBg28XmhAoo6gzvd1HuFsOVH9doAURZA
 mTDsgpWEwrDnPyzgmumE7G0PG3QHJKTCF36gurPl0oMD4v8DTLO3cUiV5hgmsS9Px0fA
 yO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1ZX8EvEFOBPZ8Nn8dtI/ON1GrCSiq6zEKTfRiGuMpPQ=;
 b=J+If/DW0mktCG/w5NFSoHSC3CJeH5OOMpa2oDKUc9zWraO2dszCM7YdiGakjsoSgBe
 bilMp87uEGC7BTosnOM/HkyFSJimK9DomJ9Q8POqPCLse6zMCakq+3OqmNfSiwZIFsjh
 k8U9X1740iuv+4gWmsGcBVt+gNzUAdpQdq5VdsDC9bULydEm4YWsTuptmtBMlQ0mZ/uI
 pOZ3ASJ0rSmF58diXN4FnuWWvUXBp7tVkZX/LretbMqJahmmzs+C7oKtt2417Pf97uoV
 oMuqQQymSG0/Kjilsvv+jgW5DJRLf9RBLuJAc2gT+p4ezheuwe6xKf3ayGTG2HyR5drJ
 vL9Q==
X-Gm-Message-State: ACrzQf24OeqbBKH0nu/MUpkmjsMIaWRIUXDGzJ4DL4fdZYRbwchO8wq9
 1x3S82tUVBXDo7fbb5KwN4/nbNCDJs2F7OHAveCcWA==
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr3420250ejc.36.1664466895915; Thu, 29
 Sep 2022 08:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
 <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
 <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
 <CAFEAcA97oHsQdk2fSq=umiUv8nNue0xCLtboRR2yPt_Gxh_zEg@mail.gmail.com>
 <CAO=notwsgvtZBLyWGu+PSnmHTrm6anakwFwoq3oBEJ-8nqPFaQ@mail.gmail.com>
 <CAO=notzN3E_OA-_jBvXsB8_LGbTXpE=G50RX8APbHHFN6eHE3A@mail.gmail.com>
In-Reply-To: <CAO=notzN3E_OA-_jBvXsB8_LGbTXpE=G50RX8APbHHFN6eHE3A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 16:54:44 +0100
Message-ID: <CAFEAcA8_WM_-w7HDc+cRvvxZVEdatczsj18D3beN3+MUg7P3cA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zIQWX96iCPqR

On Thu, 29 Sept 2022 at 16:28, Patrick Venture <venture@google.com> wrote:
> On Mon, Sep 26, 2022 at 8:45 AM Patrick Venture <venture@google.com> wrote:
>>> I think what Jason is suggesting is that that should depend on what
>>> the real hardware does. On a physical board, if the guest sets the
>>> MAC address, and then you power-cycle the hardware, does the MAC
>>> that it set still persist after powercycle ? Does the guest writing
>>> to these MAC registers correspond to writing to an EEPROM ?
>>
>>
>> Thanks, Peter - we've reached out to the vendor off-list to seek out some details, I'll update this with a v2 when I get an answer.

> "No, The EMC driver reset the MAC address registers during boot cycle/reset."

OK, I guess that's clear enough. In a real full-software-stack
setup is the MAC address setup usually done by a BIOS/firmware,
or is it done by Linux ?

> So in that case, we should disregard the value the user sets in
> reset and use the value provided through Qemu.  Or, should we just
> not allow Qemu to set the MAC address at all?

I think that the behaviour for QEMU's model should be that
on reset we should reset the MAC address registers to the
user-provided value. That is, if the guest writes to the
MAC address registers then that does have an effect, but
only until the next reset.

That gives you reasonably plausible behaviour for both:
(1) you're emulating some guest that always sets up its
own MAC address when it starts up (eg if it's done by
some BIOS-level code that you're running in the guest)
(2) you're booting a guest kernel directly that expects
that the firmware/BIOS/whatever has already set up
a MAC address -- then the MAC address provided by QEMU/the
user fills that role

More concretely:
 * on reset, set the emc->regs[] fields from emc->conf.macaddr
 * when using the MAC address, always use emc->regs[], never
   emc->conf.macaddr
 * to handle the guest writes to the MAC registers, set
   emc->regs[], but not emc->conf.macaddr

Assuming that doesn't break your existing booting workloads,
of course :-)

thanks
-- PMM
