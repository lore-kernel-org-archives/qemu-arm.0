Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp500027lfg;
        Sat, 21 Aug 2021 11:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy34K6rhM5YXEFVDx2M/1Ib4jctHF29M0wKHy9RDhdsgVjfIUngvODv/nmj4Tz4Fvem2tzp
X-Received: by 2002:a92:cb4d:: with SMTP id f13mr18259831ilq.220.1629569756053;
        Sat, 21 Aug 2021 11:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629569756; cv=none;
        d=google.com; s=arc-20160816;
        b=0JocRKDEEc6iqFgGRGgPzIDyJNrhl4Srb2y2gVJO1hoaOZE9yLG2hi5F/4C4DSQCx+
         wMZIy27nHiGIX+KQRwhQzoGTicXhWXOEbNFbDezgaen9eGhiKm9Hq3KSzVPVehfkCzam
         dT3M8EHEsM17WgppnbIPzAAGfO+NJtRKtOIYqGBrj+KBfYws02+rxPSbMLbM+Z5oJXHc
         fCuC0qrwK5FWMsU8ZXWa3PPtMIbRuwKw6oxsw3A7/CWkfk8qa5LQxBN12+n8gJ1zMG2i
         yxMC6+wNdI9ZZWQg1BaJED8t52IhFTccO9M/6UjGvoHtBB5yNmrWyrQYRWJwcGsy3ese
         qC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lnMqL37Um6rZErvb+gp3s7GAZBpbSsSE1brL3n9Z4vA=;
        b=UyGQTuxbp209/DZCuIbn4zoI1D3/s/iamtdFwfpl1DhVICBBBhAe2tbC47g1mwO7wE
         JEBA58a10h+R1J6gAyDxtcDGssV0MNys5oHhFRZvKilbjBjiY7uGi99fwCFu5sDOxp8e
         ZzScsqlqSKNITo6wscyfXiRWpOgMAu/UlgC7B4EK5s/5V1WayDNsJDxbS0igs6FHyd8d
         xhFG2SFMwXl5FumdwX77Ck7TZg+ydyG7gsxl5K0/u4WSR9LU4g2Vfz4fbIWxf8ZbiDSs
         eYpN1PhjjHHLVB1rrjNAKllbFwf8MWgXSAqTKU8LQzWs1OeVSZsRl6l22UMRue9p0G8c
         eTrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ya2hpF6Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si10452945ilq.160.2021.08.21.11.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 11:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ya2hpF6Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHVX9-0007ac-D1
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 14:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHVWE-0006u2-Hg
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 14:14:58 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHVWC-0001Ha-Uw
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 14:14:58 -0400
Received: by mail-ej1-x62a.google.com with SMTP id a25so435186ejv.6
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lnMqL37Um6rZErvb+gp3s7GAZBpbSsSE1brL3n9Z4vA=;
 b=Ya2hpF6YLZFTNe5NfGvJqA9gDMjErpvWFw4Vmzinjt9kVfl+yNHkhR+LWVn6liYecf
 h/nXFpihhIsEGe9CFGHnzX1vG+yJQ6QSf6LoMFlTTmQc+sZ02Op8V+x4Bf6z/IEfC7u8
 i6twoPWpFWSH2TIGMTrIg2CrU0aK13vOgxzlswFf9hwJ1llyLKlfNOOEivkqzD1n5dxq
 62kKmGZ4y4bQQWO7XviNC6bz7kiUgowv+PjfMmrka9Wu/LkUPUl+77hj2hfJKsHBgn2w
 wr4DqEXF1USGrngGcjW3zY00gPs1c8QP4HzkmnrSqmm4+nji25rHrjY1ZYVxfTsHrc7e
 oSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lnMqL37Um6rZErvb+gp3s7GAZBpbSsSE1brL3n9Z4vA=;
 b=isjn3FdthP09f4Z04h9jm7gRyPHbGSdWYjHPyrURmty4eDLddfoXk3swovMK6p91qp
 wGLBUgddx8aOz2YRim3WZ2ktbwg6p4Un44kWni44n6JGfGKRPJLheG6sdLwL4Ceyj7Tb
 DWRM1llhtbweeYuJzatSQKZjFEpN0ZUC4CQpmCCBM/tSXaTz0b54xFaUEM+PvcWR2I7E
 fN9PijZwMubvMkDcNf88nsQcf7CzsVFPAYzJUae8aB6yIFykNE/p/N9+44qz8u2sxZo9
 hO6TH+YauXpP4vHywal9i+bAfYck5wOBXAc6gtgyYKGFagXxe8YAN6kv8fXX8oeT8NKs
 VJEw==
X-Gm-Message-State: AOAM532WspfzvhZYBxLTNAdICsjx11MVAD+QwdYZ/Kns0x0kvsmRhFvK
 Klhd6cg5woeWzXNfvBJpkqsamMeKuvf5NY8C89s/6A==
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr27514366ejf.482.1629569694473; 
 Sat, 21 Aug 2021 11:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210821154505.18033-1-bmeng.cn@gmail.com>
In-Reply-To: <20210821154505.18033-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Aug 2021 19:14:07 +0100
Message-ID: <CAFEAcA_xQP0YqgfbJOKtt-kCeJDyQaLjqyjgRcMxfUZuS0g4Gg@mail.gmail.com>
Subject: Re: [For 6.1 PATCH] hw/arm: xilinx_zynq: Disconnect the UART clocks
 temporarily
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dyF+Jn+12LxO

On Sat, 21 Aug 2021 at 16:45, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
> does not receive anything. Initial debugging shows that the UART clock
> frequency is 0 somehow which prevents the UART from receiving anything.
> Note the U-Boot can still output data to the UART tx fifo, which should
> not happen, as the design seems to prevent the data transmission when
> clock is not enabled but somehow it only applies to the Rx side.
>
> For anyone who is interested to give a try, here is the U-Boot defconfig:
> $ make xilinx_zynq_virt_defconfig
>
> and QEMU commands to test U-Boot:
> $ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
>     -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>
> Note U-Boot used to boot properly in QEMU 4.2.0 which is the QEMU
> version used in current U-Boot's CI testing. The UART clock changes
> were introduced by the following 3 commits:
>
> 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
> b636db306e06 ("hw/char/cadence_uart: add clock support")
> 5b49a34c6800 ("hw/arm/xilinx_zynq: connect uart clocks to slcr")
>
> Looks like we don't have enough time to figure out a proper fix before
> 6.1.0 release date, let's disconnect the UART clocks temporarily.

This is too late for 6.1 regardless, I'm afraid.

thanks
-- PMM
