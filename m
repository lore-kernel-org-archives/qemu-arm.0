Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE132CC6B3A
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 13:53:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHLtE-00039z-1q; Thu, 15 Oct 2026 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHLtC-00039c-9h
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:52:58 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHLtA-0000t2-2V
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:52:57 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66fca0709caso1448122d50.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 06:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072374; cv=none;
 d=google.com; s=arc-20260327;
 b=CJAlMh6zVwGLYbxHd34xVNsPRM0Mu0RL+RQoifkOh0QIMvti4TK6F5byNebXU9dI/1
 aA6RE6owbtnYHQrtkn5DZWnmEJMP5tm+ot+OKcc8j+LGvMNswhyIcDUaeVVSpLCb3lZc
 1dcG6h0LA33GnDP83v1lynCkfs1jx0+0pwUNEWerIydCGXPG1JPHVEtMl1d3UDbbpX4M
 9KkED0Aa3nlocjZ1qfp7P2QWLCquJvv3FxZoF9FRM1WQuF9LHO47c6GJR+zQO8uepBAk
 y5Rx/+IIWKDyTwVygAXMdc0ffhV5Q/ihTpUt7XDBXHhRbuR0kT+eOYRQdzzouydDYW+1
 +Fiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=O7JkgtDkYtCpH/IHPCFXlR9XOjdOiZKLbNmL2c7SnNc=;
 fh=1fgF1KHnhn3TKrPEdPLbaIV/uiGIbeo1OoJOwP7r+ZM=;
 b=Txvl4pQcW+dfrCRc5AehrPrg04KOu5kSOvFvxblZyGk2Er6AZAP7iFjmfeGO89wuho
 vUFZt85ctlKbhrwmYT72c2HtLRCMFp7/O5s3Z6OhW43EgMLEes6lMekx+GPwJdKYhySr
 VPFHDJijE1YwYQTgVoISBkvLW3vxwAUvlCkRxl6VWhJoRPNLiAfcMKvQ51gC70JjNHS1
 NW4Ahz+Mz27MgLaRG/slgGFpW60zVGOXtJ8zrcxP24ftcQMOmtd5umn68JRNWLooVeaL
 arWpw0eCjU3CUM8Hy71xZnbQq2LxZlXQ5zK/xb8PW0tEDWxust65Cagy08p2ag3j0rx2
 sXRQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792072374; x=1792677174; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=O7JkgtDkYtCpH/IHPCFXlR9XOjdOiZKLbNmL2c7SnNc=;
 b=DsJavWRgw01d8Z3MYfkmClwkPe6c480IKbuPvqFfWwZ6tL02HNWi/pPa3K785jjXy2
 ezVgnX+3e5UnnvHLjshnqYpjZ8Ck399Brs2sNfQ7F2s2af0ZcayhJz+VsgAyNYLsx5Aj
 w/M/38e5FhWmqrUa2TjVrQrg+1T+vWqOlZUMd5Q4jNWB3iiEfaLsD47PkhfivZY9Y288
 v50V5feqrWGUVbxuAR3mFzQBgDLcd4ZHw593okVWq35EytgTO0hvrXDDu6mGiSm67zp9
 h2l7ZUctaN8//iFv9aES3Pdp1NFH0SHWd2VtZPAUw3SlgSUs46z7qw+LbKEH3JZoDNqy
 QnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792072374; x=1792677174;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=O7JkgtDkYtCpH/IHPCFXlR9XOjdOiZKLbNmL2c7SnNc=;
 b=G66Vf1Ia2hduE22lU6w7i1g5vu5vqoxX1R28fBaZ4ZidC4Tcpy5+h+JVAHGsYI4R5Z
 EBWNz/qEEid61WkccEY+Onbc/VdPgNbnnTVpANQ6cJnnS6ObeupJ/G9AvcESCf98NRVJ
 3RdNwnhPn3N6vAst9w87XMjBH00wCJFrJTn1g6IrHhaMOIvSK8T2Aiimix+IuQyX7/hQ
 wYnDnANtRbcOQK7M3r1hi8d5DXse5JMp2igx3jMWcvUUR1uUXWS8Wdn4ECpDWrjknnWv
 YWV2YOnyKMYQBMS7Q1yWIx2c899Iu6HHF0RCLp98+IeU7fpt/p1q/ekFDszpaJIQNyUI
 9CXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzbbzYwWrx3tN1JQs68eHQu2akWjuRlbT9sKY5bQEd3Vkgu3cUvMid/3b/A/Pho/FRWAADg3muezg==@nongnu.org
X-Gm-Message-State: AFq9FYJFqiYiDltYoairimSMLzheQV8Vvd1dhUTf+rmnahusk8PnCh56
 7PhtIlNu44c/pJOLHQkT+v2htt1CU1cDhyq6BsZmNxNwqGhx1/G2GDfFMkyWYboHsxKNE2vLZpQ
 x1NLiVNpmEbc0H1ysP50LlY7KkWBxYSaor8VxNn+2mw==
X-Gm-Gg: AYBFou3hPEWVgrMjXT7wzseXoS0LxC3TANYnillPAtAf8everJDMY3cZF3usUimVa15
 KVQq6ZPMhYPhIK/GWrwwKCkbARORdX/UY2ZswArhCXtrZY/z+Ej0THVNAQUQq/S6m5rp6m4K9B8
 PXbpqgK/WRVtgmVzYwV6sod2bZmc7XAhV5yANxr9jpEY6Z8jDtk3iLuUMVPdEQJikvkmrA4X/99
 Zbo+ZRSXAkHKtml8j3xmeKPCS1NxU+vbpBHyVTyDg3/8a/7HZbUhk2w9xRb8/mQGM9X35OOrMJc
 UuDYg1DrAGatjj5LCD9ZD8HKZ8f5zKyVrXaUbsnt2yw1jyi+e7RwKKpqw5BwY6aW40kcWyCO3z7
 830dzzhrzV5pNQtxIFgyM/rI+Zhy0ZC7E6/rvuGGDau/fCATUKg==
X-Received: by 2002:a05:690e:4148:b0:676:99af:e646 with SMTP id
 956f58d0204a3-679362b7d42mr7584407d50.54.1792072374157; Thu, 15 Oct 2026
 06:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 14:52:39 +0100
X-Gm-Features: AclHuK-9lECR760g3eKsTDuIlURgRpl9uyOddwPszydf1CfBzNbGOxOrHNymY48
Message-ID: <CAFEAcA9i+MgsmSMR-mn1rLPQdhOxKGSgEnsDc5=En8yrtnia_g@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] hw/arm/raspi4b: working PCIe and GENET (real
 networking)
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 11 Aug 2026 at 15:35, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> This series gets raspi4b's PCIe root complex and GENET Ethernet
> controller working end to end: the PCIe link comes up and devices on
> it actually enumerate, and GENET passes real network traffic (DHCP,
> SSH) under both older and newer guest kernels.
>

If you run "make check-functional" on a build that's been built
with the clang sanitizers, i.e.

'../../configure' '--cc=clang' '--cxx=clang++' '--enable-ubsan'
'--target-list=arm-softmmu,arm-linux-user,aarch64-softmmu,aarch64-linux-user'

then it fails because it hits a UB case due to a misaligned address:

../../hw/net/bcm2838_genet.c:878:22: runtime error: member access
within misaligned address 0x73754ab7d70f for type
'BCM2838GenetXmitStatus' (aka 'struct BCM2838GenetXmitStatus'), which
requires 4 byte alignment
0x73754ab7d70f: note: pointer points here
 00 00 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  00
00 00 00 00 00 00 00  00 00 00
             ^
    #0 0x5b07158bf9d7 in bcm2838_genet_rdma
/home/pm215/qemu/build/arm-clang/../../hw/net/bcm2838_genet.c:878:22
    #1 0x5b07158bf9d7 in bcm2838_genet_receive
/home/pm215/qemu/build/arm-clang/../../hw/net/bcm2838_genet.c:949:30
    #2 0x5b07151ee119 in nc_sendv_compat
/home/pm215/qemu/build/arm-clang/../../net/net.c:823:11
    #3 0x5b07151ee119 in qemu_deliver_packet_iov
/home/pm215/qemu/build/arm-clang/../../net/net.c:870:15
    #4 0x5b07151fdf91 in qemu_net_queue_deliver_iov
/home/pm215/qemu/build/arm-clang/../../net/queue.c:179:11
    #5 0x5b07151fdf91 in qemu_net_queue_send_iov
/home/pm215/qemu/build/arm-clang/../../net/queue.c:235:11
    #6 0x5b07151ebfa3 in net_hub_receive_iov
/home/pm215/qemu/build/arm-clang/../../net/hub.c:75:9
    #7 0x5b07151ebfa3 in net_hub_port_receive_iov
/home/pm215/qemu/build/arm-clang/../../net/hub.c:126:12
    #8 0x5b07151edfe0 in qemu_deliver_packet_iov
/home/pm215/qemu/build/arm-clang/../../net/net.c:868:15
    #9 0x5b07151fc820 in qemu_net_queue_deliver
/home/pm215/qemu/build/arm-clang/../../net/queue.c:164:11
    #10 0x5b07151fc956 in qemu_net_queue_send
/home/pm215/qemu/build/arm-clang/../../net/queue.c:210:11
    #11 0x5b07151f3129 in qemu_send_packet_async_with_flags
/home/pm215/qemu/build/arm-clang/../../net/net.c:761:12
    #12 0x5b0715226901 in net_slirp_send_packet
/home/pm215/qemu/build/arm-clang/../../net/slirp.c:133:12
    #13 0x737552c98f9d  (/lib/x86_64-linux-gnu/libslirp.so.0+0x19f9d)
(BuildId: 025218e04d3a070185822fbfa2a72d2054796c61)
    #14 0x737552c86dd0  (/lib/x86_64-linux-gnu/libslirp.so.0+0x7dd0)
(BuildId: 025218e04d3a070185822fbfa2a72d2054796c61)
    #15 0x737552c8757a  (/lib/x86_64-linux-gnu/libslirp.so.0+0x857a)
(BuildId: 025218e04d3a070185822fbfa2a72d2054796c61)
    #16 0x737552c87d56  (/lib/x86_64-linux-gnu/libslirp.so.0+0x8d56)
(BuildId: 025218e04d3a070185822fbfa2a72d2054796c61)
    #17 0x737552c972ed  (/lib/x86_64-linux-gnu/libslirp.so.0+0x182ed)
(BuildId: 025218e04d3a070185822fbfa2a72d2054796c61)
    #18 0x737552c8b2ef  (/lib/x86_64-linux-gnu/libslirp.so.0+0xc2ef)
(BuildId: 025218e04d3a070185822fbfa2a72d2054796c61)
    #19 0x737552c9055e in slirp_input
(/lib/x86_64-linux-gnu/libslirp.so.0+0x1155e) (BuildId:
025218e04d3a070185822fbfa2a72d2054796c61)
    #20 0x5b0715225f3a in net_slirp_receive
/home/pm215/qemu/build/arm-clang/../../net/slirp.c:140:5
    #21 0x5b07151ee119 in nc_sendv_compat
/home/pm215/qemu/build/arm-clang/../../net/net.c:823:11
    #22 0x5b07151ee119 in qemu_deliver_packet_iov
/home/pm215/qemu/build/arm-clang/../../net/net.c:870:15
    #23 0x5b07151fdf91 in qemu_net_queue_deliver_iov
/home/pm215/qemu/build/arm-clang/../../net/queue.c:179:11
    #24 0x5b07151fdf91 in qemu_net_queue_send_iov
/home/pm215/qemu/build/arm-clang/../../net/queue.c:235:11
    #25 0x5b07151ebfa3 in net_hub_receive_iov
/home/pm215/qemu/build/arm-clang/../../net/hub.c:75:9
    #26 0x5b07151ebfa3 in net_hub_port_receive_iov
/home/pm215/qemu/build/arm-clang/../../net/hub.c:126:12
    #27 0x5b07151edfe0 in qemu_deliver_packet_iov
/home/pm215/qemu/build/arm-clang/../../net/net.c:868:15
    #28 0x5b07151fc820 in qemu_net_queue_deliver
/home/pm215/qemu/build/arm-clang/../../net/queue.c:164:11
    #29 0x5b07151fc956 in qemu_net_queue_send
/home/pm215/qemu/build/arm-clang/../../net/queue.c:210:11
    #30 0x5b07151f3129 in qemu_send_packet_async_with_flags
/home/pm215/qemu/build/arm-clang/../../net/net.c:761:12
    #31 0x5b07158bc247 in bcm2838_genet_xmit_packet
/home/pm215/qemu/build/arm-clang/../../hw/net/bcm2838_genet.c:431:5
    #32 0x5b07158bc247 in bcm2838_genet_tx
/home/pm215/qemu/build/arm-clang/../../hw/net/bcm2838_genet.c:492:13
    #33 0x5b07158bc247 in bcm2838_genet_tdma
/home/pm215/qemu/build/arm-clang/../../hw/net/bcm2838_genet.c:593:36
    #34 0x5b07158ba981 in bcm2838_genet_write
/home/pm215/qemu/build/arm-clang/../../hw/net/bcm2838_genet.c:735:13
    #35 0x5b0715dec5d6 in memory_region_write_accessor
/home/pm215/qemu/build/arm-clang/../../system/memory.c:492:5
    #36 0x5b0715debb5d in access_with_adjusted_size
/home/pm215/qemu/build/arm-clang/../../system/memory.c:568:18
    #37 0x5b0715deb622 in memory_region_dispatch_write
/home/pm215/qemu/build/arm-clang/../../system/memory.c
    #38 0x5b07151074b0 in int_st_mmio_leN
/home/pm215/qemu/build/arm-clang/../../accel/tcg/cputlb.c:2462:13
    #39 0x5b07151073ad in do_st_mmio_leN
/home/pm215/qemu/build/arm-clang/../../accel/tcg/cputlb.c:2495:12
    #40 0x5b07150f4dd6 in do_st_4
/home/pm215/qemu/build/arm-clang/../../accel/tcg/cputlb.c:2657:9
    #41 0x5b07150f4dd6 in do_st4_mmu
/home/pm215/qemu/build/arm-clang/../../accel/tcg/cputlb.c:2733:9

In bcm2838_genet_rdma(), doing this:
        BCM2838GenetXmitStatus *xmit_status = (BCM2838GenetXmitStatus *)dma_buf;

is casting an arbitrary byte pointer into the received
packet data to a struct that's a set of uint32_t fields.
This is UB for misaligned pointers, and also will do the
wrong thing on big-endian hosts.

Generally trying to operate on in-guest-memory or
in-packet-data structures with host C structs is awkward;
I usually find it's better to do explicit "load a 4 byte
little-endian word from this address" accesses with
ldl_le_p() or similar, so there's a clear distinction
between the in-memory representation and the C struct.

thanks
-- PMM

