Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4595307lfb;
        Tue, 7 Sep 2021 03:49:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIkAzp2T9CiMl6ogeZ4n1siAsZDjHUEGoYxfEK7IpRppFoMIP7+thVtlnuJqy9TDmRbn47
X-Received: by 2002:a25:5956:: with SMTP id n83mr9449490ybb.109.1631011760205;
        Tue, 07 Sep 2021 03:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631011760; cv=none;
        d=google.com; s=arc-20160816;
        b=hETKHELt2S2dBXj8LCdJa+BfJ/pkxQFN3ya/w1dOoeoydidy0/U2Jh6G3K3ypJwcoZ
         B1i4G9cUfAI4ycrz19t/TdsGxyAFpiPYHjUjQ4oZ7J8Rmq8OVtU2WqroWVMjkqlVoqVM
         k5mv3E6UbundkU6/unpXqiLenUAKrUwUFUduyCNZtG/6BsXONTc4dy2yVlMFEXhQRObn
         W+CXhjPYp/YztCLTrcSMw7rEjGyjssZBWe5fkesPrf0h+4KjgBEunA6PrvVhMPJEqfoH
         7lSkwvVGt+LJM8aLiaZ1iMIP1kTtSlUIqCaL3ZIwR+YdME0elTxmHLBjiruR8ROFElFL
         sOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FSLy+7Kej1aRgZdX3GIF+4M18gE2uyGvHJjgs/rxBDI=;
        b=LXk3feTQeMdD4Wj7fg0rvc8lgVdcaPMM2mjitA0mzAPjvqrlHQx4U0LsSIpJNZ47wz
         LyK9W1NiJqF+Baf9BUVgMcsUOh02F6BqokL1fcbUX1/6F/F08zyLZfmPfA+x7JZfPuPb
         OtU0BKRs3hrIuRdYoWKnxjSpsfiC5KApPrNEUx5o+0j2aS/hcW2skfp5aRyCFcLZ4TVG
         YfUYR9+66zcshRMp1JjQ1DkUPehvKb7OI93g7J2tmnCdtkaAa5a8W0CD+TqYeQEJOFIu
         K7SnqjgZCJqqi9pDugI1lLDjUc/JprZ4qqCGG2xUnLbITqS5XKujo4hhpjWZSfOHU+w8
         GDsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wk7gl3dF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si13834396ybu.380.2021.09.07.03.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 03:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wk7gl3dF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNYfH-0001vh-Jd
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 06:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYf7-0001vA-NP
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 06:49:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYf5-0000Sd-W8
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 06:49:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id v10so13742225wrd.4
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FSLy+7Kej1aRgZdX3GIF+4M18gE2uyGvHJjgs/rxBDI=;
 b=Wk7gl3dFwn6TjkcZvEu+NuGuT8MJRj+bvJK9yOBgAr6jBn/2X90w8HKsViZggGmbAO
 oz5zPQA7RC9+ET8etBl9EBMZR9UrSu3E6fpvQy9k0NsM0Qfh2qZqS1zI6hUlGeoDnrCx
 yk3DidWrNoli2RVMpfNrtEFjaTvWPKO2TCD2+Ltl7jT2gpuCDy2bLcuzYdUjgZEmBygr
 F7V5NT4S9LF0ZJG4nXQNROq/wDxdjrsqCKyY0ndCKPt918LMNxJzHUTlqjsK3I1DVbVN
 8j8VBCIl3+YRAsNna5S4eFKT00TAz4gjkt0aX3Fz1af2lkx/kVCZl3I8tlxpeYVI5VCe
 H8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FSLy+7Kej1aRgZdX3GIF+4M18gE2uyGvHJjgs/rxBDI=;
 b=LBUNNIb+r1rNOXPQEzcXqyWwqlroX95EtzGRGxD7B5rshSrRvxHBb+uzACq36XCutf
 Aa4sPGXmiKcYMko1tr/jvA99EFF3QFc4kePBAeAvMVnnT48tLnQxH3yvGul7yHP9yedj
 JfzA1lkL8xQISsxYmJqFRjksL8povGN7XeFudkEeOr5Y1Ox1IbaDT97ELTjmmRr/mVnd
 u+0p3N4njTrm37ttpVU9woJa7yG9UzSHmkHot8QQzon+KvdpJ9QuqisywXTqD1AU7lkf
 Vpk7OcotKk7+S1aM1Y5qei5rS59/uz9vQ9GQm+zQLCBvortyHroV9lZMpug8HM3ZfOiv
 BJqQ==
X-Gm-Message-State: AOAM533AnPJ4nr1H/rMUBAVmMZ19HpTdRgKyzUGECggN49LYg4vE5Vx9
 e3oUjXUjcqJGyWSG2f44dHom+QqykfGqzgpqzuHIdQ==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr17443269wrr.376.1631011746473; 
 Tue, 07 Sep 2021 03:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
 <20210902053958.GJ6340@toto>
In-Reply-To: <20210902053958.GJ6340@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 11:48:17 +0100
Message-ID: <CAFEAcA-5krNObRhtxtU-W_5MgFD+iYZBNUiuD5poBrDVBo8Mjw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: xilinx_zynq: Fix upstream U-Boot boot
 failure
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dCS4A4B1iTWV

On Thu, 2 Sept 2021 at 06:40, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
>
> On Wed, Sep 01, 2021 at 08:45:15PM +0800, Bin Meng wrote:
> > As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
> > does not receive anything. Debugging shows that the UART input clock
> > frequency is zero which prevents the UART from receiving anything as.
> > per the logic in uart_receive().
> >
> > Note the U-Boot can still output data to the UART tx fifo, which should
> > not happen, as the design seems to prevent the data transmission when
> > clock is not enabled but somehow it only applies to the Rx side.
> >
> > For anyone who is interested to give a try, here is the U-Boot defconfig:
> > $ make xilinx_zynq_virt_defconfig
> >
> > and QEMU commands to test U-Boot:
> > $ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
> >     -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
> >
> > Note U-Boot used to boot properly in QEMU 4.2.0 which is the QEMU
> > version used in current U-Boot's CI testing. The UART clock changes
> > were introduced by the following 3 commits:
> >
> > 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
> > b636db306e06 ("hw/char/cadence_uart: add clock support")
> > 5b49a34c6800 ("hw/arm/xilinx_zynq: connect uart clocks to slcr")
>
> Thanks Bin,
>
> On the entire series:
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


Applied to target-arm.next, thanks.

-- PMM
