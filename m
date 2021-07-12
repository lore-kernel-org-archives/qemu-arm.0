Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp2807426lfg;
        Sun, 11 Jul 2021 19:51:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpS2q87yX69kI4WzB4EciAA64KLH5F0KT+m08SIDEoQ3zeFKMS+YjPo9ipD6SW8qFiHffL
X-Received: by 2002:ac8:5c43:: with SMTP id j3mr17903912qtj.132.1626058319095;
        Sun, 11 Jul 2021 19:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626058319; cv=none;
        d=google.com; s=arc-20160816;
        b=pXXQoIAZ2Q6fJW6XChbMY2MGoVM5s/3JMLfQ5GhWMAchSIBRuDCXPa1G5FKkl4IxHT
         D2m5BTsmMUEI6C9xHkjeQahTw0ewtqQnPasOImQnDXjOngPAeFcAD/R8pf0pIW5BOKAk
         RXVI+P4im0Ko0gMSSq7KTy7HCa+jVwGzw72I1xr/dtP+3WyRu428rhD2xzlps2qt6BOZ
         9VUlGCT0/s0tl8da0I/XLwCGC5ECZxREKB75nlecZu6sq66igbWeWABtSYnQOOPK4tLA
         MOyKWRqcRnUuwydLpzeVfjBPuTUI+q5Hd7sbhegm1Z634yEPnOAWgIBPakHnQ/Qh9OSO
         H+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=8DGn1qWm5G6Fvms7r3nUuLxYojKgKbMndwcYTLWaCNs=;
        b=bzY+7O+wCE19mVFPg4V0EaSJUIDHkoJ4HRa5Pl72CO88fw7ragQGbkeGKrdHoPAgf7
         9g0Ryg37WfSuxK38AzkanaqNrT+cs/+q3bZ9CKx9hdcb8O2h5wxe4vz3cXb1zf+Z9ZkP
         8K84OthvAk+fNiOcZswFhKhvi+e1RQZ61FMNncnZ+AfDCaAdIWUakBHCI1c6XYsKVflU
         YjEgHHQw/aP7gX4jgZXYSfQKCeOlBXfIuhkQBs80PrMvcpQrO3rOGYllDmM02irW9Oh1
         81BEMFfKiru5DatrMqTAI5VU9EtkDnqwlyVKDKa4wrheb82AUoOqZiAig+TTVNxFyAA9
         tu8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@alistair23.me header.s=fm1 header.b=cZPc7y4U;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=ACj8QC1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24si2666237qtq.59.2021.07.11.19.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jul 2021 19:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@alistair23.me header.s=fm1 header.b=cZPc7y4U;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=ACj8QC1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m2m34-0003Xd-Ej
	for alex.bennee@linaro.org; Sun, 11 Jul 2021 22:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1m2m2w-0003WO-Kn; Sun, 11 Jul 2021 22:51:50 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1m2m2u-0004qa-FV; Sun, 11 Jul 2021 22:51:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 744585C009C;
 Sun, 11 Jul 2021 22:51:45 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Sun, 11 Jul 2021 22:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm1; bh=8DGn1qWm5G6Fvms7r3nUuLxYojKg
 KbMndwcYTLWaCNs=; b=cZPc7y4UOzvpjqhDTsFXt+m2Ab2efYgMPmpltXxfwhAY
 obvvlZIyd9j0CthNEorZaCSFXMHHqCCwFBwqsQdy3JL+3JUIGMIxTtvgGFsyNywH
 dwVBWpp8FWrx3z5ROn7+hKQk8rWN0BsARVCs6HeBCIX31dqeH8otUZ7/a5M7kEB4
 aWpOXmxUpXa3gevQWJmybYSTjHodE3t3uPwMMRg4pB0tnvFVzHJw12PrX0qE6DP1
 6a1sX2flq2IqIl2Gth/QuQColiwCCTutYY60VaNsqmzfk7b09TfVdBnrfa1cbeLA
 V0VHuYRd8ppReXKITwVpBzhfvwv01bCrV6zMYmob2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8DGn1q
 Wm5G6Fvms7r3nUuLxYojKgKbMndwcYTLWaCNs=; b=ACj8QC1s0alGFU3po24EG1
 psZc5KTxPOqsftGt7WutuH0lfQX63D/qVa+W10YeTe5Ov9uM4kRAQx/oq8vd9gUg
 vJZNuAdQ4QviooKe0SAXAqH+fGP6ccUdkElOkkgA/vbX8P7VqQ0rjZ/05Bp4GToI
 9DILOx5iROFqM9Zgfy07LdsRbRVr/YyJfjOTNE0d+Iglh0yENCczReqS5CQOvmLV
 zLlH/swRLTbmQTIbPvyBg3uN6AwzQzf4qU0x60ffIxFKuKZCfVNoyEg8+nEVTFdD
 rP4cxCRCK8Xxr+yEuxM1GPZKL9syrz8D8CfC1ZETyim7MSokw+/HAjAcCV8CzLkw
 ==
X-ME-Sender: <xms:QK7rYGeluSKTorlBdtI9_sJesUMaNzksR8gFxROEfiHY8F3bVK04XQ>
 <xme:QK7rYAMTkKjmudg2EviHbP_-ehOmoqcaHB1jxnezbfMBdFJSc8mAq8E1KbuaH4SDT
 7troQcAN6nKzyAQ8d4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpeetlhhishht
 rghirhcuoegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrth
 htvghrnhepvdeujeeuuefgiedvvedugeeltdefieefvdffffdvuddttddvgeetudfhteej
 ffeknecuffhomhgrihhnpeigihhlihhngidrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhr
 vdefrdhmvg
X-ME-Proxy: <xmx:QK7rYHgikU5wdcDZMIM9eHPaqGHYWjF_b1s2STYqoS0oRGcWJt4NSA>
 <xmx:QK7rYD_pRvTI0wzPEP2W_8FRQu_5fLVlo81VxaBs6CFud0HH3dXtMg>
 <xmx:QK7rYCuuF5wwcLXCyT7xJ0iyxpqvGJLrjoybUIj-d7Oe4IW5_q6z0Q>
 <xmx:Qa7rYEKIC5iNHOOo7D9CCAf9Y06hNQyKjZI_4F-QbsauN-x0u9hA7g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B8418AC0076; Sun, 11 Jul 2021 22:51:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-531-g1160beca77-fm-20210705.001-g1160beca
Mime-Version: 1.0
Message-Id: <b524c816-b1ed-458a-9fd7-f303afc9bf04@www.fastmail.com>
In-Reply-To: <CAAKa2jksX=Sco3-ETvue8d4wpyoFBSzgOGua9Z8WyOfeY8jEFQ@mail.gmail.com>
References: <CAAKa2jmatcBonTYeZCHnE4TR543FKQR4Lrv2iMKaZUprXH=3ng@mail.gmail.com>
 <1437061986.489095.1625809641822@mail.yahoo.com>
 <CAAKa2jksX=Sco3-ETvue8d4wpyoFBSzgOGua9Z8WyOfeY8jEFQ@mail.gmail.com>
Date: Mon, 12 Jul 2021 12:51:24 +1000
From: Alistair <alistair@alistair23.me>
To: "Qiang Liu" <cyruscyliu@gmail.com>, "P J P" <pj.pandit@yahoo.co.in>
Subject: Re: [QEMU-SECURITY] Out-of-bounds read in xlnx_dp_read
Content-Type: text/plain
Received-SPF: none client-ip=66.111.4.26; envelope-from=alistair@alistair23.me;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "yajin@vm-kernel.org" <yajin@vm-kernel.org>,
 Mathias Payer <mathias.payer@epfl.ch>,
 "qemu-security@nongnu.org" <qemu-security@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1LGwnT2JBR52

On Sun, Jul 11, 2021, at 6:17 PM, Qiang Liu wrote:
> On Fri, Jul 9, 2021 at 1:47 PM P J P <pjp@fedoraproject.org> wrote:
> >
> > Hello Qiang,
> >
> > On Wednesday, 7 July, 2021, 11:38:09 am IST, Qiang Liu <cyruscyliu@gmail.com> wrote:
> > >I found an out-of-bounds read in xlxn_dp_read and here are the details.
> > >
> > >## Root Cause Analysis
> > >
> > >1. xlnx_dp_read allows one-element-off read at its default branch
> > >because of an improper index.
> > >
> > >```
> > >#define DP_CORE_REG_ARRAY_SIZE (0x3AF >> 2)
> > >struct XlnxDPState {
> > >    uint32_t core_registers[DP_CORE_REG_ARRAY_SIZE];
> > >    MemoryRegion core_iomem;
> > >}
> > >static uint64_t xlnx_dp_read(void *opaque, hwaddr ...
> > >    switch (offset) {
> > >        default:                            // (0x3AF >> 2) is equal
> > >to (0x3AC >> 2)
> > >            assert(offset <= (0x3AC >> 2));  // the op should be <
> > >            ret = s->core_registers[offset]; // one-element-off access
> > >            break;
> > >
> > >According to
> > >https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html,
> > >offset 0x3AC is allowed.
> > >
> > >```
> > >#!/bin/bash -x
> > >export QEMU=/root/qemu/build-ubsan/qemu-system-aarch64
> > >export BUILDROOT=./ cat << EOF | $QEMU \
> > >-machine xlnx-zcu102,accel=qtest -qtest stdio -monitor none -serial none \
> > >-display none -nodefaults -qtest stdio
> > >readl 0xfd4a03ac
> > >EOF
> > >```
> > >
> > >Let me know if I need to provide more information.
> >
> > * Thank you so much for reporting this issue and providing the details. I appreciate it.
> >
> > * It does not look like the issue maybe reproducible with KVM virtualization use case.
> >   The machine 'xlnx-zcu102' looks to be a SoC system used in industrial applications.
> >
> > * Is it reproducible with the KVM virtualization support?
> No, it is not. I got an aarch64 host yesterday and tested this
> machine. The answer is no.
> 
> I'm sorry to bother you. I will test arm/aarch64 machines more with
> the aarch64 host in the future.

This should still be fixed though. Your proposed fix looks correct. Do you want to send a patch to the QEMU mailing list to fix the issue?

As it doesn't effect KVM I don't think we need a CVE or to merge the patch quietly, so it should be ok to just send to the list. Someone let me know if they think otherwise though.

Alistair

> 
> Best,
> Qiang
> 
