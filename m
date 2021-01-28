Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp239180lfo;
        Thu, 28 Jan 2021 05:53:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGLqmglMV5XZ/JeX8FiofVMtZG5zh3G2sis/ndxOWlh4/Ys8F/wYgGXgG8QOXNB2HOewo3
X-Received: by 2002:a25:ca09:: with SMTP id a9mr24189785ybg.48.1611842000978;
        Thu, 28 Jan 2021 05:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611842000; cv=none;
        d=google.com; s=arc-20160816;
        b=r4/WdEVnLjROVtXDrcgse2YpvgzN71kAlVyVcTPJcsJLaCXCoBjlAktHtUzMqQrDAp
         M8AHbQPId9vnAV7/n4vPtc/9lcvuK18JBa1foOPgTPmZqqqki9mL6nl9NK+/6eEbE+5P
         8KynroWLlSwIcrcd9VZJruoa5VougYQyQ83fg1JY3ZhhU+VimYldfBd4oPHVr4d4+cKy
         Tk7tvTklxYdoeHoqHTGX/VPsw2vc1qzIXZZoeAxMhV0UYm6/VLvyyfp7H9aSyBaSAXih
         amu1w9aD54RtIhFOXSsVZT1oiaTLB42DG1XtCY/AonpgvFctE8HDilMesP3ucOg/iA3t
         oZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GkzRAklb6idVbi4Nlegxw7IMnF2hkEvmjlxBgJ+vS9I=;
        b=KTnSaM6hsM38r2oLtChlcWaOmUpDDDthk9cNcWJjq0gAI10fifBNi6KKC1Od67VTbE
         mzsW3Lp3+O2/aic0NS0B/GqpeChLwhgVxVi5rOtuMWHZH5wF9/AJSu6Br53cUAi3Wkl4
         cTzthJqttv884Uq+FAGMj7DKEeSNYW4vc9nTigBTpcml04U0/IPyqc6qMQ/nTjAfgvwe
         F32mM39gPWKFnkYomgjpf2AAjoarhHGiQXFlXynKYkaogb4QFkJKheLOJK8aIhqIw+/O
         lNTz5AusPj1Xd9oje2UUdgnURysj6YVTUkB+FoybXy45ZEHparmaf07xmXlWl+VaoNtE
         Rvow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zOpHgG6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si2748099ybc.378.2021.01.28.05.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 05:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zOpHgG6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l57jb-0005BS-EY
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 08:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57hW-0003kX-BV
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:51:10 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57hT-0007Qa-Bz
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:51:09 -0500
Received: by mail-ed1-x535.google.com with SMTP id d22so6697214edy.1
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 05:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GkzRAklb6idVbi4Nlegxw7IMnF2hkEvmjlxBgJ+vS9I=;
 b=zOpHgG6b9hGoscoCcOgh+sv2L2h5StT8MpGQ3HKnRZWSjVgVGfafsctn2g49oBKlfE
 le9G3l2iEuJUk7eOvwiHSKY+E0Bd15Vehux92Q+aFzZVXBra1yLiaoqqGP07MPwX2bPx
 iCNn2HqCtsuh+Ye6/XpzYQv7kXm2A62dyiGByukXpW50u0E66vXxla3GMKg9XWBPHK2O
 8ju7hr2Ik2bjDwrJsWNeVSCPdsADCcimHDGW305CBOxdcpwlKkCt0o9bdlf08QKZjWMc
 wqr9XJeKB0vM3nOeLE/N+1RgmA23sC9MBHWtaOlk2OP386ecP8Us3KL/8YLiEpRtx40i
 UyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GkzRAklb6idVbi4Nlegxw7IMnF2hkEvmjlxBgJ+vS9I=;
 b=b0qhyGzzqT3BDNTgi/qyTL5Ioky7r0x8yI7MkLK3HMhVE3vFHB6AJN4hAAYmeYU99K
 ZlA7ea81YlLRD5Vc3Auyp5x574//0uPU3+1Su2ZyfgkHfFMf+s3+w4gR5DSTJAEvw4/n
 1p38wmQyMhLEfnO5vkOeTea5PgTyh38qNQKSMl8Mvb98mLGn27+biGnrFrydHil6gm/l
 NyIDgReGt7TQXOSoJmAMJ+T/ovcw50a4Oq895lqfXA3dSBLghr2i57Yt29Ea5Eb5Hthg
 M+tAtriDwN92VwIKlhXO9gDIMWZx8gO1ilf5QkJchgeRgEOs+I2IHI9aMUtFri7Yg2Qa
 KoAw==
X-Gm-Message-State: AOAM531S4d2u98tynQ9wqETaDZwkPPp3nugZEa6ToZX9vJ3i+sUqfUlp
 421JW4IxMw1noJk0cBvqvCtyJUNR6xDkaGQoJm4EzA==
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr13929369edb.44.1611841864194; 
 Thu, 28 Jan 2021 05:51:04 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-9-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-9-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:50:52 +0000
Message-ID: <CAFEAcA-UHKxqfmWm21qigrH1jvgkdprH3TY8AUW2HGJKTV50sg@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hL8SQwdT2zxa

On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Current implementation of the imx spi controller expects the burst
> length to be multiple of 8, which is the most common use case.
>
> In case the burst length is not what we expect, log it to give user
> a chance to notice it, and round it up to be multiple of 8.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

> @@ -128,7 +128,20 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
>
>  static uint32_t imx_spi_burst_length(IMXSPIState *s)
>  {
> -    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> +    uint32_t burst;
> +
> +    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
> +    if (burst % 8) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "[%s]%s: burst length (%d) not multiple of 8!\n",
> +                      TYPE_IMX_SPI, __func__, burst);
> +        burst = ROUND_UP(burst, 8);
> +        qemu_log_mask(LOG_UNIMP,
> +                      "[%s]%s: burst length rounded up to %d; this may not work.\n",
> +                      TYPE_IMX_SPI, __func__, burst);

It's friendlier to the user to do the LOG_UNIMP when the
unsupported CONREG value is written, rather than here
where it is used. That way the warning happens once, rather
than every time the device transmits data.

Also, you could squash the warning down into one line, something
like:
   "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n"
rather than logging twice.

thanks
-- PMM
