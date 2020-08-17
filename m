Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3158162lfy;
        Mon, 17 Aug 2020 12:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDc95OT/5r1oCBuOqsT8vW7rbp47RqyxZuxw+RSNuZ1FkcNbZr5uUprp6cknni5Ax2wMX5
X-Received: by 2002:a25:ab0f:: with SMTP id u15mr23145980ybi.7.1597693164171;
        Mon, 17 Aug 2020 12:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597693164; cv=none;
        d=google.com; s=arc-20160816;
        b=B3HVy5psCRJI4ZG6hBtpnH9nN8g2s4oxtg3PAkLcYXmYAhwKz0W093uJEFyr4eAb0j
         lc+avPWJnr+MHMtoVzkwG4SRUQlodLjsrSMrd6DUjcBs7bNmKZNYunEX2ONcLKZC6f2C
         GeXrSbQoVmuseXtG477Gns31MUli7yTdMHyzuMsX2VPb7otOZf0JeRENSI4Y7Ony+eVQ
         wUDnAWBLVMjJtB+Zw82JYVgZYxq98JzszNR6wzXI13V659SruR+IdbbhS5vaO/z9SI3Y
         Nau+SBAdJw5a9kggBeAFcN+BRl3LOb/fBg6USNGmb+1HVfGO/0PnBGlkyIFFG/BuXMl0
         cMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71Gu2SNl1BTKdiexaub3H5WnX3ygCfwguBJZtlG2y1M=;
        b=gwY4BJLGSMRjoYoddae8l7cLZebx3wbyTrcg8t61ashzD8h6Ej+7Npqd0wsYg0O8A0
         1lc+vz4opYjDUk74mpxlqxL3QoQDVGYjllBo/5rWBCZ1OZvFZXI95I8v8UOXwp/ONHjK
         9IbktSAX8uR3lt3Mp7kGn6UO2Y6mqwR3Hq9Nd04J5JPTW5pSK8cWKW2cbvvZd52wXbOG
         9AGkQDgasfI+4qH743kebJeoyCG0bh5b0IClj1cotnF1Hyh7nHxeJksVV99QGtt7/B+1
         g0luCSMDo3iRmt2Y8sF3KWBRgDknlhjhFWMGhiVYd0Ctn3cduYo3m0z7qeI2B1wzdbgW
         mzxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MXWPB5dN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si17589028ybl.349.2020.08.17.12.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 12:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MXWPB5dN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7kyZ-0001Bi-In
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 15:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7kyN-00012R-N1; Mon, 17 Aug 2020 15:39:11 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:34850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7kyM-0003fM-3H; Mon, 17 Aug 2020 15:39:11 -0400
Received: by mail-il1-x143.google.com with SMTP id q14so12132383ilm.2;
 Mon, 17 Aug 2020 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=71Gu2SNl1BTKdiexaub3H5WnX3ygCfwguBJZtlG2y1M=;
 b=MXWPB5dN6NDU8oX1n2QKSoF1GXG9kPgnzqmhC7CE2uv37+2m4MQh1aBvpRnH0l7GA4
 JhiEfPj5gUc3Eyk7YNRxhAfGQizlDui0j/tR2qZ2yYwL/wGW1VTSXCvyj191AD/Vufdj
 w3p5ugbgt6GEp3almKXs3NuUfY1M07U/Bt9o6Itc6KfENdPb9UkND6VAXxsoKRlm7Ulr
 t5hu1gFFigHEsiEScbBF69LRCqw3cuWs4DrJ8PI+S+Ja265viyn9St/HruKe7+myiSYv
 tr9EpgTDhY0La3VPOsbsbjceZfoceb+7cEWJ+ot/U5UozranoVrWQNs9AtAjSoihl7nr
 Al0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=71Gu2SNl1BTKdiexaub3H5WnX3ygCfwguBJZtlG2y1M=;
 b=tMETtUI/ArfD7nrBfx1NQDYk41Rc2Fls1zvssw/gRBIbfClZpMJt6ijoy4D2t0l7nh
 Tqd4Y1ecjlAaBKQp1XxET5V1NL5FDUgPeAbZGOzoD2uy58+JeARkN5xBsckUERpofb7C
 RbktBAnI55ieUts5ms6Eaw/MiPcV20E7v9JWO1/frKNKQkFdMvnv8DWnXEir7m4NhkQV
 0DgDt3Jr9bmJXlp3tHrXXo4OoBseF4LbNjVe+rPAtAu6e2wNRspz1ERdq35nw0cCM//+
 JJd9g1fg3+RwoP9nY8/IFz5NubWF8q/i5aKSSMcH1P/HTKyXR28sb/ih/UY7OvRBXKgL
 5/6A==
X-Gm-Message-State: AOAM53023/l17YUX+Rxoxf4GGs4Hx2DoE20tDT5L6bxRmUpaI4yABA0n
 TDDBOkhXJD/XqOywzyIhx/VNQD+ascOlrF+id0g=
X-Received: by 2002:a05:6e02:ed4:: with SMTP id
 i20mr15203022ilk.267.1597693147799; 
 Mon, 17 Aug 2020 12:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <CAAhSdy2D=TcENAJDja4r6pnhz0LRi-T+A9k3Btrs_EuB4x0e4w@mail.gmail.com>
 <CAEUhbmV5=B5xKhYqMj1MQb61nt5cNUJG1MXT++C1w1YMYTfLCQ@mail.gmail.com>
 <202949f7-c9d5-4d4d-3ebe-53727f4fa169@microchip.com>
In-Reply-To: <202949f7-c9d5-4d4d-3ebe-53727f4fa169@microchip.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Aug 2020 12:28:36 -0700
Message-ID: <CAKmqyKM3nm0rhxgDvWKWfO+4b23ZLSkHW2TzmcVZ_ZFy4L7MRg@mail.gmail.com>
Subject: Re: [PATCH 00/18] hw/riscv: Add Microchip PolarFire SoC Icicle Kit
 board support
To: Cyril.Jean@microchip.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bin Meng <bin.meng@windriver.com>,
 Anup Patel <anup@brainfault.org>, Jason Wang <jasowang@redhat.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lo763hXk9Eb9

On Mon, Aug 17, 2020 at 11:12 AM via <qemu-devel@nongnu.org> wrote:
>
> Hi Anup,
>
> On 8/17/20 11:30 AM, Bin Meng wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Anup,
> >
> > On Sat, Aug 15, 2020 at 1:44 AM Anup Patel <anup@brainfault.org> wrote:
> >> On Fri, Aug 14, 2020 at 10:12 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>> From: Bin Meng <bin.meng@windriver.com>
> >>>
> >>> This adds support for Microchip PolarFire SoC Icicle Kit board.
> >>> The Icicle Kit board integrates a PolarFire SoC, with one SiFive's
> >>> E51 plus four U54 cores and many on-chip peripherals and an FPGA.
> >> Nice Work !!! This is very helpful.
> > Thanks!
> >
> >> The Microchip HSS is quite convoluted. It has:
> >> 1. DDR Init
> >> 2. Boot device support
> >> 3. SBI support using OpenSBI as library
> >> 4. Simple TEE support
> >>
> >> I think point 1) and 2) above should be part of U-Boot SPL.
> >> The point 3) can be OpenSBI FW_DYNAMIC.
> >>
> >> Lastly,for point 4), we are working on a new OpenSBI feature using
> >> which we can run independent Secure OS and Non-Secure OS using
> >> U-Boot_SPL+OpenSBI (for both SiFive Unleashed and Microchip
> >> PolarFire).
> >>
> >> Do you have plans for adding U-Boot SPL support for this board ??
> > + Cyril Jean from Microchip
> >
> > I will have to leave this question to Cyril to comment.
> >
> I currently do not have a plan to support U-Boot SPL. The idea of the
> HSS is to contain all the silicon specific initialization and
> configuration code within the HSS before jumping to U-Boot S-mode. I
> would rather keep all this within the HSS for the time being. I would
> wait until we reach production silicon before attempting to move this to
> U-Boot SPL as the HSS is likely to contain some opaque silicon related
> changes for another while.

That is unfortunate, a lot of work has gone into making the boot flow
simple and easy to use.

QEMU now includes OpenSBI by default to make it easy for users to boot
Linux. The Icicle Kit board is now the most difficult QEMU board to
boot Linux on. Not to mention it makes it hard to impossible to
support it in standard tool flows such as meta-riscv.

Alistair

>
>
> Regards,
>
> Cyril.
>
