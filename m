Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2569721lfg;
        Mon, 2 Mar 2020 07:32:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqymGDVXXK6X64v/hy3RPCiYJivKFm/BBrEQOY5Ewg//yCAqzI0fbHPxEidX1soLSOMrXr49
X-Received: by 2002:a05:620a:691:: with SMTP id f17mr16215075qkh.342.1583163159464;
        Mon, 02 Mar 2020 07:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583163159; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7p9B4HYgEFu+AjONqpakWfYrj7RrMn4rOW0J1nGinI51EMNxUpUOjRzzsrAijeGPD
         thenc/bW5BNylsc0cP2BjnIajAWWGM0cxd7ENtzJRUqaWMVuXT3do0bltBXWM9bXrl4W
         R+OvNrVeHcY1vLxPu+d+lipPc5MQ/flPqV/wnjzkchF5X6ZeRo/yjiqK3iqhCaZVmwHJ
         amJPMixeIcOYROlwMsuzCAGqTZgeGebIm+GPkQKSudPhU95OI+FhiXOKkIWkKH8ufu1R
         jzOWQL93Aee9WEuQVfgn/BCZcuQtVu0o/QRx6MUjRDzJOY9+ay0CrLgnSHgfUhMkiraJ
         O4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l3lNOdCR3iLHNZzGzLWGwLb5L8dH5qv03+MdBD0/6nw=;
        b=FJ9zJqTQPlKfryjEXbnnzvVXLP8/H2x6fZHkx2pIwsVRPzKN7Yh5Li9e/40O6FZ0LO
         iTUCjPIBKBT2WgXOkEReybxWqNRblMF6RPP8OqCAKP4YtyKb645bJL5XnYFfkTYivTo0
         JkouqKUp1Q47VFhXyoVoE11rf9QUesG2p09B2dcM6KoUGAddT5lAhESI1zPr/JupAKAD
         t8Uld0tliz9LJ+sI9Jg/VYJDrPgVyJNpkAy1gAxxbKLgUaLjKz1eOLwZiPAL29ymqcqD
         CgValy2GC6cc9KHEM8xkVcE2WTJDR35+GNq4FRV6J3CjugRnr4cAiSmZwkNNNYHEHwZ2
         XzyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ofITedib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c27si4971231qtv.109.2020.03.02.07.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 07:32:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ofITedib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8n3e-0006pj-QU
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 10:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8n3U-0006pQ-Q8
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:32:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8n3T-0005Va-JH
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:32:28 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36214)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8n3T-0005VE-DW
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:32:27 -0500
Received: by mail-oi1-x241.google.com with SMTP id t24so3466485oij.3
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 07:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l3lNOdCR3iLHNZzGzLWGwLb5L8dH5qv03+MdBD0/6nw=;
 b=ofITedibZY/xsjFJtyM5mVfXxW/IQyg/JxgzXirwvHYom0pnGiFz2hk/gfJAvaUeZR
 Wn8Kplgg3n1grmVyBzSAndWX2K7XdeKIh5E62jgxhrisdnsg98kqeZ1r14UR+K1srWfn
 aF71HdHV2qwoF19/szgYotRV4UkKP8GO/4gVU0+zYKSWDFYK/mVpQPMVX+hkYtbLr7oQ
 GSdmGY6LqR/2owcfJNbulPe9F/Dbh9PPMlI1Gz3tjBbAtb6UZ524wvr1dVytsOFCh/hA
 GKz80vJKHF0loQf863DZ5MOZlkXiv51OS6J2AUQF2S8u8Fgvkek2KAPEvNSfiEroGTe1
 vo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3lNOdCR3iLHNZzGzLWGwLb5L8dH5qv03+MdBD0/6nw=;
 b=kHH6VKoTUfYTC+o9FLd6pDQlign561ZJKbQPzVmvfqOD9rCpCElvfbHN7CL/GK6Psm
 pc+yXwH5nivK5Cnk0Ae5RTULRjo49BTZEVWbMLfkkVO8E9UL0KlfQ9XIOdw/757v8QBf
 aTimya6Il03u4YLGRIjBPmK/yyhAjt+oMyG1I0OoWW3HH5fdtklnEUEvUPs8G5u4Wj0Q
 SooAz9i9DEmYuTJjMskKjHWRYKwgQpRPyAuzsKT/TVnWoynPmKrZGk81J2WKNeCI5iwv
 Yh3qcQp/mR4c1UBCpK8KNA5fNywuHPgd/Dz+mf8LJFORWmxlpUq2coMf40VQHyruZlkd
 9YZQ==
X-Gm-Message-State: ANhLgQ24Dt1O2tFuyW2dIZzsKBzZuvz0Ca5QTbxlTr5X7YVgx9Sy8URi
 Z3UQPMCLFfLllPL8a4PLYYj8iBF9+chsNbRTdUnmNQ==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr50981oid.98.1583163146469;
 Mon, 02 Mar 2020 07:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
 <20200227220149.6845-2-nieklinnenbank@gmail.com>
In-Reply-To: <20200227220149.6845-2-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 15:32:15 +0000
Message-ID: <CAFEAcA_xB_dMfcALk6sirmRJyJ0rw7_JPK6aqBoZMxh=wH+d-g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] hw/arm/cubieboard: use ARM Cortex-A8 as the
 default CPU in machine definition
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ARW1vwnvbwfM

On Thu, 27 Feb 2020 at 22:01, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The Cubieboard is a singleboard computer with an Allwinner A10 System-on-Chip [1].
> As documented in the Allwinner A10 User Manual V1.5 [2], the SoC has an ARM
> Cortex-A8 processor. Currently the Cubieboard machine definition specifies the
> ARM Cortex-A9 in its description and as the default CPU.
>
> This patch corrects the Cubieboard machine definition to use the ARM Cortex-A8.
>
>  [1] http://docs.cubieboard.org/products/start#cubieboard1
>  [2] https://linux-sunxi.org/File:Allwinner_A10_User_manual_V1.5.pdf
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  hw/arm/cubieboard.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 089f9a30c1..0195925c73 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -68,8 +68,8 @@ static void cubieboard_init(MachineState *machine)
>
>  static void cubieboard_machine_init(MachineClass *mc)
>  {
> -    mc->desc = "cubietech cubieboard (Cortex-A9)";
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
> +    mc->desc = "cubietech cubieboard (Cortex-A8)";
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a8");
>      mc->init = cubieboard_init;
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;

This is worth fixing, but I'm pretty sure it doesn't have
any user-visible effects, because the CPU is created by
hw/arm/allwinner-a10.c:aw_a10_init(), which always uses
cortex-a8 regardless of what the user specified on the command
line or what the mc->default_cpu_type is.

Fixes: 8a863c8120994981a099

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
if you tweak the commit message to mention that it
wasn't a user-visible bug (but I'll do that myself if there
isn't anything else in the series that means it needs a respin).

thanks
-- PMM
