Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1366963njf;
        Tue, 3 Sep 2024 02:29:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnZmpmugsLIMh8eBHzJNBkIbW+XNK9qsOkoutJwa516L6ZxBoLnyeMCRGEtYYSdr5ZOIFNcKkeNOsHSw==@linaro.org
X-Google-Smtp-Source: AGHT+IFUok3sKB0VLctrX8Mt20FdGVJlc0AdWcooY5xOvQGGhP4+fNVCr8Q7eEI+qIsjdVOiyX3D
X-Received: by 2002:a05:6214:468d:b0:6c3:6260:32cd with SMTP id 6a1803df08f44-6c362603515mr90401786d6.2.1725355746931;
        Tue, 03 Sep 2024 02:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725355746; cv=none;
        d=google.com; s=arc-20160816;
        b=AYYYgT9vByccbfYXCk+bxuL+YR2oDSl9RJ0K25lQPVOsQ6ZDbdlr8/uVkAtYRDdm5l
         9DptNXQzWEhuQ694YO121qNdiNAdPm1gBcOuS3e5lYVj0fg/5R1c+cGEs2RgvhS2GAHp
         KpIgExbJ+kRQIN/eEp1llASlo/wNv0ZWSZU8Xjb4F2idY/Qip2xFV2y+DaNGkZ5jxRLH
         QykMOFAVtAxc8xUqkUsrbWg317I1F+Nv3JoDl7iOmJ2EqdJLJWEP9EneYYuSn3a2VTne
         ShAMYBD9a+wYFxTm5qrBZflxGc/YZOY4wKHMY+/mHI80UcCmag0hePxhxkzTxfRThjay
         MoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=P9Hp+JnxZGXZRGvNNP9UMIgFLY1N3OdxqybSc5f87GA=;
        fh=4bP3KmM5f2bkyd+hXcmFP4uqxDe3cRFg9u0vbKmMt/E=;
        b=SR2qvC6ognqz2ZntudZllmg7i94xZzd0eGr9OhK8eYV9W3u1T3xjZ5unNeRs+awenf
         bSGZxkrVQgwtaACHCt+Lpj1WXoJsEL0YuvHW/9uanh6xSWPRSfX7kRpEeOID3pJvaKQH
         mz9qd55mC3TAyeLuRDspUz8npnWhxcc1T3cDMtwC7h7eSVGjPjxJ8COHmkx/Wpg14e9J
         MPb2Up3dVOItDP0WiWpWep1eyjVQBQU7k636yacw6MzWagkIw2NiUkK4sehu9grMnf1l
         9dkvUlw/EeY8ZugC1yoEvelVIQcI2UFnWF6acuyOUSr+LZ1b0fLOB1ffPjLNWEtcuVJu
         9vtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VoUtXcUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c35ba411dbsi65943616d6.149.2024.09.03.02.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 02:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VoUtXcUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slPqJ-00060Q-9j; Tue, 03 Sep 2024 05:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slPqG-0005nC-V4
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 05:28:52 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slPqD-0004Vb-Ln
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 05:28:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so1589179a12.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725355725; x=1725960525; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P9Hp+JnxZGXZRGvNNP9UMIgFLY1N3OdxqybSc5f87GA=;
 b=VoUtXcUrCB2nFf8CGbmj9lDLyhi0q/VvO12GwpblA0KSDd7UfdZRUxVGswYCGgOFbR
 DwaMArsePNMnDXGCbhFlHdbUyUDQUW1ULeHHCD3FAXOBuLM3//2arWHWX2UnPGXjD3hJ
 KB43ZdjqSEZ4rZf1Sd6RTfDWwCDrqQZczD0MBO1D1YJLWn/JyUxtGzSa6NV08h1PYgr2
 Cv8G1z6VEK8i0cnZM1KM4AMFZULz4eDf1p1EQAN8qeAB/eDB+rgAnCVmWiU/IRP+WSot
 s5sb7Xo2RW7rDnaaPewRowkvHXNcMeYd1Mkfs6eZ5x0/bVkhy6lxdPz53Af8tsaz2w9H
 /ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725355725; x=1725960525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P9Hp+JnxZGXZRGvNNP9UMIgFLY1N3OdxqybSc5f87GA=;
 b=wk8Mpp1LKry87xyzwZIsLC5WcUJV2RJmvOXV11LetgCr9VTek/9gKnW2JNphAyIdTv
 b6JU3uXSwtyTGMCFPsGDbeN6qn/ePDC+7eS8os+SmoJ2DUhkh2UW9nDc9280oXSd0paR
 rAdzES8I6CSIelFoxnds9qIjmbVsndAc/6Pr1Vs2kpMfpVam76sxcnR0FccZFKm9tuIi
 Hj6FGFCL4OFbTLdHRy702ZgOBk6gH2De1F+5Z+Zr0n7C64CYtSJHvGvlbq2g0dGbRjgi
 GSSZQCsB59T6gs/Bb+nobjRX7KwQQCXNa0aqNYrUw4C3RpbOWmDVnpta6lUOBnWGeZv2
 T+TQ==
X-Gm-Message-State: AOJu0YwDAI+BKixuZ9mQ87OKzFrxSCJymvxLNMOpLmx4XxR8+krqHagh
 fyXW13Yhw2gMzk6I+knI8aq3NIXBDzVlr9ntBjJvKxeWxnFq0nJsHHthCEdTVIufUFfzg24NI9q
 NGJt1Bi8lyJnrwodYBII4Kw9FBg//ZdnZW60533PmhHtmMmx2
X-Received: by 2002:a05:6402:50d4:b0:5c2:58f7:fe95 with SMTP id
 4fb4d7f45d1cf-5c25c423bdamr3506228a12.31.1725355725249; Tue, 03 Sep 2024
 02:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_3E0F9F905031BE780D8EB329DA00C7EDFA0A@qq.com>
 <CAFEAcA9zizTZ-qtvEf31eDYj9ognKHpaSkM6OsJxug-_e1JE5Q@mail.gmail.com>
 <tencent_72A38157DF7887E22DF0DAEED9B009892C06@qq.com>
 <CAFEAcA9EL6n7H4QWijje2gDtT9JmpEnkvXD_DJjg4o0eE75jVA@mail.gmail.com>
 <tencent_B942022BEC6E0F3F924C301679A58F1F2B0A@qq.com>
In-Reply-To: <tencent_B942022BEC6E0F3F924C301679A58F1F2B0A@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 10:28:34 +0100
Message-ID: <CAFEAcA_YyFPP9CQiJ8jiVv7_FY_Y+DKLr8yWx_Y40efgYnYj7Q@mail.gmail.com>
Subject: Re: Troubleshooting Data Abort Error While Debugging U-Boot on
 mcimx6ul-evk in QEMU
To: Guy <guyqqcom@qq.com>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: hgQM35HTENE4

On Tue, 3 Sept 2024 at 08:20, Guy <guyqqcom@qq.com> wrote:
>
> I got the exe from a repository on gitee.com.  But there is no source code.
> Furthermore, I see the A7MPCORE in the fsl-imx6ul.c of the qemu source code:
>
> C
>
> /*
>      * A7MPCORE
>      */
>     object_property_set_int(OBJECT(&s->a7mpcore), "num-cpu", 1, &error_abort);
>     object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
>                             FSL_IMX6UL_MAX_IRQ + GIC_INTERNAL, &error_abort);
>     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
>     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
>
>     sbd = SYS_BUS_DEVICE(&s->a7mpcore);
>     d = DEVICE(&s->cpu);
>
>     sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(d, ARM_CPU_IRQ));
>     sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(d, ARM_CPU_FIQ));
>     sysbus_connect_irq(sbd, 2, qdev_get_gpio_in(d, ARM_CPU_VIRQ));
>     sysbus_connect_irq(sbd, 3, qdev_get_gpio_in(d, ARM_CPU_VFIQ));
>
>
> The FSL_IMX6UL_A7MPCORE_ADDR is defined in fsl-imx6ul.h as part of enum FslIMX6ULMemoryMap:
>
> FSL_IMX6UL_A7MPCORE_ADDR        = 0x00A00000,
>
> This memory region is the same as the address where a data_abort
> occurs in get_cpu_rev.

Yes, but the s->a7mpcore object's MemoryRegion doesn't have anything
at its address 0. This is an object of TYPE_A15MPCORE_PRIV, and
in its source in hw/cpu/15mpcore.c the comment says what it provides:

    /* Memory map (addresses are offsets from PERIPHBASE):
     *  0x0000-0x0fff -- reserved
     *  0x1000-0x1fff -- GIC Distributor
     *  0x2000-0x3fff -- GIC CPU interface
     *  0x4000-0x4fff -- GIC virtual interface control for this CPU
     *  0x5000-0x51ff -- GIC virtual interface control for CPU 0
     *  0x5200-0x53ff -- GIC virtual interface control for CPU 1
     *  0x5400-0x55ff -- GIC virtual interface control for CPU 2
     *  0x5600-0x57ff -- GIC virtual interface control for CPU 3
     *  0x6000-0x7fff -- GIC virtual CPU interface
     */

Note in particular that offsets 0x0000-0x0fff are reserved :
there is nothing there.

A15 and A7 are the same in this regard -- the A7 CPU TRM does
not describe any device at offset 0 from PERIPHBASE.

So the question remains: what does the guest code want to see here?
To answer the question you need to look at the imx6UL SoC's
reference manual to see if it documents anything there. If
it does, then we know what we need to emulate in QEMU. If it
does not, then this is a bug in u-boot that should probably
be fixed there.

thanks
-- PMM
