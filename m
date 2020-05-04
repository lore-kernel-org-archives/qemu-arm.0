Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp575397lfb;
        Mon, 4 May 2020 08:51:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypLTenujfpmGovV0XajwdmwMhGbxCvqMHrq1nVK2uT+tGKxr9gbBVTITi7uuaJeUYvVWkCTF
X-Received: by 2002:a37:b8c4:: with SMTP id i187mr17445319qkf.410.1588607518460;
        Mon, 04 May 2020 08:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588607518; cv=none;
        d=google.com; s=arc-20160816;
        b=FCsR3ZBJdKG2LLMvVEsbs17FPPUohiA8Y0zzjE2DChF4Bw0/E+YoaQ53KAcBsaJbvf
         B70TvAZv+LYMQowkRoAWy9qk55TKe/ehYzzhiOyUSy3l7a0nQ0+suuuwAdDXXP6PyE2W
         xzwinnoNHkVqODIyYtk4K6h9/t5ebBbQqAYZ2CO5RixjAv36U+5UWciAM6G9hA4ydopE
         z/H/VOSaR+zwynNgCBdTNKDCwVw/cEX/JyfxU67Dr3VQV2IFkJVh5btemP2y9wCXFmLf
         3nHnnCyh9EthOLurYLX7eKPTRHpaQOASd9Gk3lcno+wm5kLTYFKnFTTK+Nd57TT4/sEL
         2w0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIh8z3QAzvbB4CILHgFMNjVxM/n1GO0KshndEAuLqR8=;
        b=kk1SfTZX1v5IXK0Bw9qdpD7OpbrJf320y+3DFdSR3aAgsHrEUhNW8+oBQVrDuSl2nP
         agOmEcVlVkXq3drHbRIMuMUIDqWzRDcmVjzwQInOqFiWLZNsFwhAp80VmQnRrVKUS8GG
         zeOddnCDOaIb4kdICCa8c/Scwc4BhAA3qpEDihJasOZnTuMPKMfqJaccCsIgsuJ8fApt
         IhC7lRorwC2U0VWzOWhXZlf5Yt0s8ZEiAcAhD5wyT0wXn5zPzrovqjnZIPft9TyF9L7E
         Rd/5/wpL2e7aNxgEacHMabCGugBdfwwSCPqVwvhbt26YWDbphmjkBD/d2Q9E/wg1FKFp
         Ntaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fOzpes19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id da10si6373153qvb.207.2020.05.04.08.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 08:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fOzpes19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVdNt-0001UT-QN
	for alex.bennee@linaro.org; Mon, 04 May 2020 11:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rfried.dev@gmail.com>)
 id 1jVdMQ-0007sc-QV; Mon, 04 May 2020 11:50:26 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rfried.dev@gmail.com>)
 id 1jVdMP-00025x-PW; Mon, 04 May 2020 11:50:26 -0400
Received: by mail-oi1-x244.google.com with SMTP id i13so7012416oie.9;
 Mon, 04 May 2020 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIh8z3QAzvbB4CILHgFMNjVxM/n1GO0KshndEAuLqR8=;
 b=fOzpes19COakcNB8fza+ZETZe5NTKu1m3jB19czHRTMwltuF/wi0X5aK8ij4UoS1kI
 MVlF/RibITq7n6vZgDpR0IN0nQXT3iiqflJHsZTiDv77SIv9tySUQjn3ZwTvZowtRjZZ
 0oQwGJuQ2AWza2sis+Lrubok3UDQEpE/kXnSKiDHICkWH/8xotWE08d1keuNPRG2sAIb
 WxTxIcF6JFzcz37AVaCSg1GTg8EJs0JPxTvEIfU6sa7+19yp3o1T8Wz1ZjCpKGAirr6L
 9zwA3tbOLsw2tl4rH7Uk+KUF+Qb4PszmwogRqgm/vKytPeUQX/1TBegoZTn6314H6/MH
 4d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIh8z3QAzvbB4CILHgFMNjVxM/n1GO0KshndEAuLqR8=;
 b=N067llqx3RP8K2pqlOO57mpMRah/bStKfPrFJ9LYmHay1VoxPxRrrVDF3RFgaTG0Za
 Z2icQx+CA/LuwE9e4tKCdob/L6TQCNdrGTbawfd+gL7rPdwor7+bhqgNbD0Ucu3xtRjr
 aG+hieggU/B3iZq6BVcQmKGoXv5M6qqtv0xm/nJhooWvdGjFOVhOgHB28YlODSqBVUSN
 KCjHPipD1JEHsDIMKNvjgmZ9USJIT1FGXMEao2hVtve8IIsNyXSPcqvzvPpQOca9KENM
 SPUGxuA3sPPcWadU74PsxlNcteM8rB9xSOf6qOg5tpPb+w1pilueIeWNimLHsykdv+pF
 5lKA==
X-Gm-Message-State: AGi0PubmTrronWQ1fKTwqLyiBI44PrvjXDY7K2TeTiapHr2Vl3AR6Z/H
 9IBWXBBpO7CsNPg06stlfnynJ4LODfkZoNx71xk=
X-Received: by 2002:a05:6808:356:: with SMTP id
 j22mr9645720oie.147.1588607423937; 
 Mon, 04 May 2020 08:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <1588601168-27576-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1588601168-27576-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Mon, 4 May 2020 18:50:12 +0300
Message-ID: <CAGi-RUKfonE6S+1nmFdjhT_OrQ-+E7EMCOmsXZ-zdGttF9JFbw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Cadence GEM Fixes
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=rfried.dev@gmail.com; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Tong Ho <tong.ho@xilinx.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oyD0V5h9jO8

On Mon, May 4, 2020 at 5:14 PM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Hi,
>
> Following patch series fixes issues with priority queues,
> Adds JUMBO Frame support,
> Makes Debug statements compilable &
> Fixes related to multicast frames.
>
> Changes for V2:
>         Fixed build failure on fedora docker machine
>         Fix buggy debug print to use sized integer casting
>
> Sai Pavan Boddu (9):
>   net: cadence_gem: Fix debug statements
>   net: cadence_gem: Fix the queue address update during wrap around
>   net: cadence_gem: Fix irq update w.r.t queue
>   net: cadence_gem: Define access permission for interrupt registers
>   net: cadence_gem: Set ISR according to queue in use
>   net: cadence_gem: Add support for jumbo frames
>   net: cadnece_gem: Update irq_read_clear field of designcfg_debug1 reg
>   net: cadence_gem: Update the reset value for interrupt mask register
>   net: cadence_gem: TX_LAST bit should be set by guest
>
> Tong Ho (1):
>   net: cadence_gem: Fix RX address filtering
>
>  hw/net/cadence_gem.c | 167 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 94 insertions(+), 73 deletions(-)
>
> --
> 2.7.4
>
Hey. did you test these with 64 descriptor addressing ?
I can test it for you if you need.
Thanks,
Ramon.
